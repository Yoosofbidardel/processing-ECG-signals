function leads = compute_augmented_leads(lead_I, lead_II)
%COMPUTE_AUGMENTED_LEADS Derive augmented ECG leads from leads I and II.
%
%   LEADS = COMPUTE_AUGMENTED_LEADS(I, II) returns a struct containing the
%   standard augmented leads (III, aVF, aVR, aVL) along with the originals.

arguments
    lead_I (:,1) double
    lead_II (:,1) double
end

if numel(lead_I) ~= numel(lead_II)
    error("Lead I and Lead II must have the same length.");
end

leads.I = lead_I(:);
leads.II = lead_II(:);
leads.III = leads.II - leads.I;
leads.aVF = (leads.III + leads.II) ./ 2;
leads.aVR = (-leads.II - leads.I) ./ 2;
leads.aVL = (-leads.III + leads.I) ./ 2;

leads = orderfields(leads, {"I", "II", "III", "aVF", "aVR", "aVL"});

end
