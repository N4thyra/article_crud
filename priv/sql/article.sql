CREATE TABLE article (
    id SERIAL4 PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL
);

INSERT INTO article(title, body) VALUES
('Nic vám po mém očkování není, prohlásil kandidát Pirátů na ministra zdravotnictví Dostál', 'Podle kandidáta Pirátů a STAN na ministra zdravotnictví právníka Ondřeje Dostála není médiím nic po tom, zda je očkovaný proti covid-19, napsal to v pátek na Twitter. Mnozí odborníci mu vzápětí vyčetli, že nepochopil roli politika v pandemickém boji. Dostál nakonec potvrdil, že očkovaný není, stačí mu podle něj protilátky.'),
('Při nehodách na jihu Moravy se zranilo deset motorkářů', 'V sobotu se na jižní Moravě staly dopravní nehody s účastí deseti motorkářů. Některé se odehrály v okamžiku, kdy pro ně pořádala policie na brněnském Masarykově okruhu akci zaměřenou právě na prevenci kolizí. Byl nutný i letecký transport do nemocnic.'),
('Německo hlásí vysokou volební účast', 'Voliči v Německu vybírají od nedělního rána nové poslance Spolkového sněmu, a rozhodují tak i o nové spolkové vládě, kterou po 16 letech již nepovede kancléřka Angela Merkelová. Hlasovat v 83milionovém Německu může 60,4 milionu lidí a řada spolkových zemí hlásí vyšší volební účast než při posledních parlamentních volbách v roce 2017, píše server týdeníku Focus. Navíc miliony Němců odevzdaly hlas poštou. Očekává se, že podíl korespondenčních a prezenčních hlasů může být vyrovnaný.'),
('Narkobaron Escobar nepromíjel. Mstil se také v Maďarsku', 'Na příkaz drogového bosse Pabla Escobara se v roce 1987 pokusili zavraždit Enriqua Pareja Gonzáleze, tehdejšího velvyslance Kolumbie v Budapešti. Atentát se nezdařil a ambasador se štěstím přežil.');