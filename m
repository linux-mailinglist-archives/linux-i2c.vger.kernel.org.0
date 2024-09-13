Return-Path: <linux-i2c+bounces-6665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA2C9778F7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DBA1F26188
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 06:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8781891D4;
	Fri, 13 Sep 2024 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="G8egewWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F9143C40;
	Fri, 13 Sep 2024 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726210213; cv=fail; b=ZI/sAYQssvyzDDmmWHTAuAJaT8w5CClkf6D2ruRFTDWptxIlzFy2IALK/wIyIwpquTAejZGlrE5/SjW1k1HKHHXpLFE/QmQc84sBt872kkjKPW1Lye0IlR3ik9Gpo9pywsvCncRMprIl69HNzYls4bf1tZY2qc5EwAEbTYHoEsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726210213; c=relaxed/simple;
	bh=ERBr0vLc1hK/tbiacYuQzwV1sOtdrDN+rSQ3A0oMbDg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d9BBkQ81Co5SknePd8XZpqp751y9OOGdn1ExH2tJnYzbB6+eT5mJCVg8w535lghn30CqTD7b7m9IhFDBt0iC9isQ2NRuSFg77DZVH4OUBiT3NW7J99PCnbv1Kx1YLoCvn/UCvaiHL2k1wfLbXbyw6PNxy/rqGUG7Wg6CNqz/TzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=G8egewWL; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLSZP9zV7QOAtEa/o+/a0ilDvDjNxU23yK8Zg3PXZhb9zMDKcWqfpoG6PMJpguCrHLp99r5RoEq1laGAgKR/XO2SypkQZMpQvMm1c6Ci2892tet1usVoCron08F2NdObkSlm+M84JB+88GyHwfItnhB1O7E57HRM+Lkn/6zBGItYCFDhp9aZCKo925QDLqBo93cD83kugHQzZMvVLO88L3zVg8Ot/sDtbO6i3AknWLm4Zdwor2xeoNOdoSrybcOsrMCHs0Z+CSDCd2HRgXZYJq1vlR1Ryb87EvWEVlRTr0a2jlJg3hbI/mxHywWSQJGsOYGSUaCriZOni1RJ+yAwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=js5aXiJxNBYAn7z9NDXDWNmK5mP5evUn/qxY4Fvegaw=;
 b=cbyy/uJ0IflJ1UPd3f/joAGoYeb1OGtqxMyp4bIcPt+Jh6ZRaV/R2lTofFZQ3pQ/lNhvuRnwQxJqF0Rvxbzy+wsvVv7tqQagQdtQGUQXbWJV0ZhwaZlKLOTVq3KTR6OYHFxZbOU8v2BPDWg8Wkwk+bbIaq9ftvQj2ICnWJrEjrDMVaLlBH2brU64tdx2VOu0eYmGe3O52NRhQ4Lk9r3CD/Efij+J6Qb47X6XuvdEQIPK/5LNt5svviaJfUsGQcQ5yJRExIx6rC20Vek6qiFgN6f6gB5HNb/48JlXFkM3/WG3fmumE3v2DYqZ4uzIn1/SNilOsIvqAep8Q/uccGReJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=js5aXiJxNBYAn7z9NDXDWNmK5mP5evUn/qxY4Fvegaw=;
 b=G8egewWLT3Nb0X3HdwM+0scyz9Sjo0o2xZf3+0LIvE+wdx3FZaGFxp66T1OGjP4BUi2NoFCdkdyaC/uiq+K6L3ICqJ3QI2caz3Sn0FksIf902NJ0VDh7hyfyCbgIhnk8UVLyrh2oUNEh9ZjgqB/QdjJJNVeTyEtEk9r3PuJTU2cJG3FEjOa0ZLUT/YJfj/fyS458qqI1UcJkMTaoQZGrsxjMiYAxCFysT8GlKWZVLI2CUIB/RRGOdAP9elfjAM+5Kt7iEWDMPNE+xan3PwGALqp8WxTW5M7cEu+cZ2PMqms8OyzukKvcd8OWBvzG6GToezq2k4Vpe2pnk3TmS3ak/g==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 PA4PR07MB8389.eurprd07.prod.outlook.com (2603:10a6:102:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 06:50:08 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:50:08 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: pca954x: Add timeout reset property
Thread-Topic: [PATCH v3 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Index: AQHbBajz1wdACRqEV06/8jXM7GSbPQ==
Date: Fri, 13 Sep 2024 06:50:08 +0000
Message-ID:
 <DB6PR07MB35098D673A8DD04E56D9305D9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|PA4PR07MB8389:EE_
x-ms-office365-filtering-correlation-id: 8035b477-1242-4153-ac05-08dcd3c04ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?lPU9q7kkDEk6/dJbRmcwpzhZYRQSW7jkRf30o7NsAkCsEKYYLjyydGZems?=
 =?iso-8859-2?Q?dMPaGkhZH6zCarFpR6TGA9WFnavREHxefVPGTHzi8Pn1eQ1yIJ4Sjqr2JI?=
 =?iso-8859-2?Q?5CS3lyKNBHLnFUkcfJ8suEd1a68/NanYjnZAfzD4k/10hx0mz14kXHJFCt?=
 =?iso-8859-2?Q?fCq91IMtBf20ZrTnTuz6mml7NW6YETBdf9YaD8u4+JhRB/TRNWF1/iDift?=
 =?iso-8859-2?Q?PZZIeObz96fw/SsorRWaGuwCwPyfkN6swD0riYi5msmsUXdvNcZVnA8dEr?=
 =?iso-8859-2?Q?bbJ6TpfO3qvoN4hj2zOcI5gU0D7QXUEYNHRYmP6WnY8JtmsgHQkUkg6P83?=
 =?iso-8859-2?Q?NLJqdVWiTw/X7GZ301bR4QqtQ2VRItOW/q3dLls8/KJulnXdKXDOQKIIka?=
 =?iso-8859-2?Q?Z93qy2FSwCdsnvsixrMRZQKHtIkBscyi/vIDGPFJ6Mwo6pQP1O0KcSeUsF?=
 =?iso-8859-2?Q?a73nSSmYIQosQmByKXFoEh1qwX5ObKlnQskyeoKi4YzMbRKrgpGrzZ35D/?=
 =?iso-8859-2?Q?w/itDHy0XpGaQpFPkREnq928Daft2D0VOegkrEjFNm9lz00XYkBHvO3Olt?=
 =?iso-8859-2?Q?2U6TPN1D/UrVZBe3qbiQ+SoVh6Jz3jFTzfbPlVxU9fezJmeuh1w/M6ueJk?=
 =?iso-8859-2?Q?4g3QKIgzIKKNJ79xV0yOG6uUmDa/cfWOUw5WUnv2kpgSMDQq9R/SXzuRpx?=
 =?iso-8859-2?Q?MmAffEfCPAdwyG51nwOHa5SvG30sU8vFF40K5bqYJRv53OKYsISfGrrg21?=
 =?iso-8859-2?Q?0iWgKC4JjPgELmzjNTEXQqg2V5g2vZVlKuaZj54EoarjYh3XxMIv2ObUXy?=
 =?iso-8859-2?Q?+R52LLUgK0mMhqN948QLyQ+xAPlccZhRbDc6dNto8Tm6rxSAC1eLFsyFnz?=
 =?iso-8859-2?Q?NH2J5vAOrPXwEQWvS3p4W2Mcr7KPEVcz48btav1EEdfVFiBMIgS/fpNoyw?=
 =?iso-8859-2?Q?OQ9xHtS3HprY0TPwtPj7eVyUEKjGNX38oE4jQ9cS4m1rr5cIBIxMsvjz8x?=
 =?iso-8859-2?Q?bHTzuTBkk/BSt6fzT3bcrCqUnVl8ji/NHA0wR45/8CAtpWMBuWXFz/Gu6U?=
 =?iso-8859-2?Q?QPZxN2rbK9D3s9Xk7bpBR32Jx8K4Y3apE8sF/yzbg/Fvc2sqCMgak5q7ch?=
 =?iso-8859-2?Q?TVj/BQ7M6PXEWD+n+JqWt9I3mks2knxquBWeGEbzT1nW2M0BDyvfaX4rdU?=
 =?iso-8859-2?Q?tLuQg+Gmf4b9+NFDN3m/J3HnfxZWTZPfQevctkHeYEsuFaTZn73iq22GR1?=
 =?iso-8859-2?Q?MfnKJ2vVMFmWZHmb9RazWHk9uQZcbkADQZY0gMVfCqoeIfYMrq6EPVZTEU?=
 =?iso-8859-2?Q?CC1gV/o2iYr1+H0cGecN6axYRzL5l33AC/5hG5Kv4CAn//PaKyJKsjX0hn?=
 =?iso-8859-2?Q?IdDPiXXv7GE8yioZuIU9phmaFpfGOLew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?PBY9n0lE1UksRFEosmg+lHmMxSct+Ekb3w4m4yO4dRct3rQPJ+0A2AJE0P?=
 =?iso-8859-2?Q?+f0uMofDachi//2uJkoyysQrYVyQzJ8FFYkqJyoMnakn1AfR8xTrKs0kh8?=
 =?iso-8859-2?Q?exrw3PA+9F16w4n5APbJ6KBNnK8/Oe86JKGb2sjlJ7ns1HktjTHwOryHWp?=
 =?iso-8859-2?Q?5fFMaQhUek8gRIsXszcqizg6QOd4x76rSQC+PbE8mKUitDfUol6X8LDOEL?=
 =?iso-8859-2?Q?OlQGGdfgQtKfJA+Z5SOWJIBkq3wWUpUuucJZ1SraRHfPOqRCybMshGQpv3?=
 =?iso-8859-2?Q?1kC1/OjUT5p8wlZULWH7oSWMXL13VGnXm/cWhBwrv+sMxlCZTixAW1Anit?=
 =?iso-8859-2?Q?HktmFPLcdnAJPzV45zbcaaXQSWCweQuCZpoV5ACJUJgBWOqIdejRagNcfH?=
 =?iso-8859-2?Q?lhJIv5ZFYmINFVtJkAuNJDArNs0t8epTRRgMxnbtWV+KInyBNXPvKn23qb?=
 =?iso-8859-2?Q?agPUBuug+zn24ICdVGs5wb+z1XQGsRJfsUKCdwNfIRQDvZzEgHQS32y5rv?=
 =?iso-8859-2?Q?8jFxSpxGHYhcwMRkIA7cItFuIit/ZeImsTKBO7coRW8BqLLp3q8+w5zi1g?=
 =?iso-8859-2?Q?5/KD5s1HvgmqJPezi9riShYORMoeEJWZgoSGFHOc1vfIOE5GJBQBoPsxYH?=
 =?iso-8859-2?Q?76CQh4ct3/DBkWGZQvjhl/QMCnW7bW1tlvb+0mrcx3NVZ5vBP3JmCdR/C3?=
 =?iso-8859-2?Q?pmyCGmMWJy0fROK75mprw2NMGjTtiyNMzJ2pBi9QvIBFhKVy/xyHA4zGXA?=
 =?iso-8859-2?Q?mqUQdn0XzHomIThBwk3I++l9XPt3C/DCGbxmQBPwykhOg7FKN5uNLHV/Us?=
 =?iso-8859-2?Q?D2pZ2CBIaqghoJj+PoO1cR1Uh9NwKCxlP8npx1CpdVWk1cSaEn1cpxLcbN?=
 =?iso-8859-2?Q?ZQlrJBe10rMUUc80ADel54BrHBYOpfkOPqJTkKYK+2sLdmAeuU1Pt5MSUU?=
 =?iso-8859-2?Q?EU3SDgt9Kw3oyMZosDUC+vdCu+af2/BqMk9FhaXAzrf8uZO19p2+XcQH9V?=
 =?iso-8859-2?Q?ByBijdBYH8L6rxeS7q1gaVJ1Jw76loY+nURF6ellcRu//Tsi9tR8z30zSn?=
 =?iso-8859-2?Q?m0xV7fg0gq4hia4VrUTQnQjTlZUhcQNc9VIVWXyMP1/rGHy79m0vACW5SE?=
 =?iso-8859-2?Q?h5XJoB3YF7u8CZPhfClsHbw95wgqbAqNxiZQzBK22BadVb80nW3tqa3Spz?=
 =?iso-8859-2?Q?pL+kVPyVAfPqJg1gzQeyQkspjMxME12rjSTnS1/0a+v/0y63jsppmPqKQM?=
 =?iso-8859-2?Q?tZ9ihI3huhKOfQ0TUbG0j5QFKzhI8b+61AYTRWvpqkzRqdA3xZXmZv6kuO?=
 =?iso-8859-2?Q?cG3sEdOz66jNLCJjQFKGrSA/IDGDqjkpnlJuVLXqm3FphSNP9LIund+lwt?=
 =?iso-8859-2?Q?hLSldwhhbj4/hXhf4Pj6lu/A6AJHaHseUWoTFUcu5lSn3kENf4+P6iYfWr?=
 =?iso-8859-2?Q?j79HigmCwM64viYjSE9a4PdEzwxqzTMfe8dS8nZ2Z0gJxSPkP6kCUf2K/q?=
 =?iso-8859-2?Q?JKAp0xF7/RFYMy5LxqfZvjRpeVjXSAKY7HifhaP2tta2YeS78PxvqozQeP?=
 =?iso-8859-2?Q?r4VmO1m/SueCaoQn0RypRrB6FDiU2p0pY+2qL2eVAvvrn1WQj4UoGZ4hYc?=
 =?iso-8859-2?Q?UN7s+G4x5GuNzzEUtoloVIICjmxNIgvoBU?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8035b477-1242-4153-ac05-08dcd3c04ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 06:50:08.5741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWy1Q61Sx3Le1aC0dks/s+WQ14DI0q+CNLkm1Wx0mkLsoaKcg5L0SQaskyrzB4Jd9K+gOF2mfwY9FEp770XhWlrNdg9OVOndxayAtCpJqU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8389

From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
=0A=
For cases when the mux shares reset line with other chips we cannot=0A=
use it when channel selection or deselection times out, because it=0A=
could break them without proper init/probe.=0A=
=0A=
Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
---=0A=
 .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml          | 8 ++++++++=0A=
 1 file changed, 8 insertions(+)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/D=
ocumentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=0A=
index 9aa0585200c9..872be72da965 100644=0A=
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=0A=
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=0A=
@@ -63,6 +63,12 @@ properties:=0A=
       necessary for example, if there are several multiplexers on the bus =
and=0A=
       the devices behind them use same I2C addresses.=0A=
 =0A=
+  i2c-mux-timeout-reset:=0A=
+    type: boolean=0A=
+    description: Sends reset pulse if channel selection or deselection tim=
es=0A=
+      out. Works only if reset GPIO provided. Do not use if other chips sh=
are=0A=
+      the same reset line.=0A=
+=0A=
   idle-state:=0A=
     description: if present, overrides i2c-mux-idle-disconnect=0A=
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state=0A=
@@ -146,6 +152,8 @@ examples:=0A=
             interrupt-parent =3D <&ipic>;=0A=
             interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;=0A=
             interrupt-controller;=0A=
+            i2c-mux-idle-disconnect;=0A=
+            i2c-mux-timeout-reset;=0A=
             #interrupt-cells =3D <2>;=0A=
 =0A=
             i2c@2 {=0A=
-- =0A=
2.34.1=

