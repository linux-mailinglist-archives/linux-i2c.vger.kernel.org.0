Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00DC7116AD2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 11:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfLIKUN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 05:20:13 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:6607 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727419AbfLIKUK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 05:20:10 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: rnPnWq/o+ire4pGfBhdJpOFugzUWPm5HV9qy1LBAwc8ZI12dHBogAGSsneuGdQ4tQtC47/V5Py
 X8TLkBmbpws4kr1kz3qkJpEO/pHZvbBc4uYwRgHqBanMBcrupGDBBAB2TeOxV6ttJRd5njQKpu
 JBKk0Hl/xSN5i9rRdaDkNH41hX3GlUbbNfrjVKJak1PSTRWaf0Yznqx+cuGU8QRn+2m18DRu8h
 AdIuqSBZfxtl6h+QnoqphcZa22F4dY/blcpqRlWaymOPiaRhg2PDLee0S3wlE2/ogp4pItZkMi
 7S8=
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="59168104"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Dec 2019 03:20:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Dec 2019 03:20:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Dec 2019 03:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmX88obLjXneaibqEaBDTvw9UB0Rg4wkmcZ2cPvkgCX04mOQfascTM5Ve5IjJEACqzK6WKCuYP85tqIUEOXxdMsXDd34jElBnoHJTUJUHf333t2lJfIRiQ05UhRFYKdKg/quOwVF0eYFXQf8+y61ANfbFCGmrbadRHWk+1LOJdVC9RY3VC7btyuO5cd+QNLMmAE0arrcPTZj/0Ia9QWjl7B71YPl+cby/m5s0nDNTXJ2fLMwuqCyQeXw9xZynjYTVsbPmdzixF/nxA/4g6ISjFUZy26fYYhWyURhHkaUlzb8ETjMfSmP28CnvxAESnLla6UydQSwu/cutZy68Ge5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU68t0dO85X0yuHgiI4QcDGm5Pxqu48k4TGVzPFuVGQ=;
 b=NYN7rrDAnutryoJ85UbIbfxH731D/EIHx+IXCwtoYPdiU+g236RI8A/RJhiR0yQIQrK4xsELIYAmqvw0pnbuxYBAVF/yaPFnrFlD1ncuRNukOJ0cSz1ABjstH0vf2+bYf0EXDreQzzquE2dFOgza9lU6Mb8rxgi9JaEP+uV+RJaQkjvM3GZc+BBMJU5Tp1wJkADwbF1WL9j8zor/wEHpt9OfMrzj/BwjU0uFjBBK5JETTWjyLr2E6PfWFGRCuNGbHEDRccDF9F/qp08Hs6nd6GjuA43ZHO+ReLKtEOF6OqZvKT7BIbKO0tEV6ht7fVaX2dOX6UNxVhGOp+01ChA/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU68t0dO85X0yuHgiI4QcDGm5Pxqu48k4TGVzPFuVGQ=;
 b=KTsbVUKrrcJWWj/TX5jWlqvSI8Mvds8p4oW4Y7TmnOHMuZnzx3bwJZAqEpcTZMi/xaxNR6LvdCbYPrpkHlJVE8GTOWlS1kejRJ/hjurDMvcxa93wHk51W38nlkgfZl+FSZaABeNoO/t0xICjWSwAW931B8wH154OrqsBkH8IIUw=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1884.namprd11.prod.outlook.com (10.175.91.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Mon, 9 Dec 2019 10:20:08 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 10:20:08 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh@kernel.org>, <Ludovic.Desroches@microchip.com>,
        <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 4/4] dt-bindings: i2c: at91: fix i2c-sda-hold-time-ns
 documentation for sam9x60
Thread-Topic: [PATCH v3 4/4] dt-bindings: i2c: at91: fix i2c-sda-hold-time-ns
 documentation for sam9x60
Thread-Index: AQHVrno7uiwNER81bkSzReIqZIVNhA==
Date:   Mon, 9 Dec 2019 10:20:07 +0000
Message-ID: <1575886763-19089-4-git-send-email-eugen.hristev@microchip.com>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0039.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::16) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa0b86ba-c73d-418e-7999-08d77c915d7a
x-ms-traffictypediagnostic: DM5PR11MB1884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1884A92AA102F215E0A58749E8580@DM5PR11MB1884.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(54906003)(110136005)(36756003)(186003)(2616005)(26005)(2906002)(316002)(6506007)(478600001)(6512007)(107886003)(64756008)(66556008)(66946007)(8676002)(81166006)(81156014)(71190400001)(5660300002)(71200400001)(8936002)(4326008)(6486002)(66446008)(52116002)(305945005)(66476007)(86362001)(138113003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1884;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CO2/TSqwZ+NJk8hW9jaTgeMiUzgHogmPX+64VRYRSNlQrcIjB/FpEFlVlId9VudfZIR8ydFIMF6DsuB4NI6aMwVSII68HzjnUS+ASX5KqBagBDiEpdwZtDknTp3xSvhkHiWviXMnX/Nmtu78/FnHkecTKTwx4CaZRBsa1mzd4/PtOupavuTx/buh79JjeMkzs0qRfqgEOQuNCFagAsF5GgybtBKFn52n+kQ03Lw56KVsV1Ga7yFfE0Eq85uwCWw9SUMckeXnSZQ4QyF8QWsjqethRA5IrOZR30jhwGS4ZdXVJKTrcwpkXczS5ViXtTEdEfrvjUswCdwdPC2Ph0SkzlqPV07EOdgiImiLXIVHaD7PSjaXXYSmAeTyQX63N//abp7jwhPFRDGHsxtbxqGXinWLjBE+KXKnTCq9vfXmjtlAU2APOra+CGw4On4/RyQph62jqElyH69G5uJrMi52ZTdlDcrzI+45f+/G2yujbaqammajlP5whoUpx1jc7jKs
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0b86ba-c73d-418e-7999-08d77c915d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 10:20:07.9902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjzQB8BhyHn2kPC+F9p1vjviJoXuMs3DNjU+4cYutXT8mJeG8WBQjd0kiwGHYw82/+cUzBlYT9RkQIpzPKScx1iX4W6ZgylpAutnnz97Bp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1884
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

SAM9X60 also supports i2c-sda-hold-time-ns. Fix the documentation according=
ly.

Fixes: 2034e3f4c9a5 ("dt-bindings: i2c: at91: add new compatible")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- new patch

 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documenta=
tion/devicetree/bindings/i2c/i2c-at91.txt
index d35cd63..d4bad86 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -24,8 +24,10 @@ Optional properties:
 - dma-names: should contain "tx" and "rx".
 - atmel,fifo-size: maximum number of data the RX and TX FIFOs can store fo=
r FIFO
   capable I2C controllers.
-- i2c-sda-hold-time-ns: TWD hold time, only available for "atmel,sama5d4-i=
2c"
-  and "atmel,sama5d2-i2c".
+- i2c-sda-hold-time-ns: TWD hold time, only available for:
+	"atmel,sama5d4-i2c",
+	"atmel,sama5d2-i2c",
+	"microchip,sam9x60-i2c".
 - Child nodes conforming to i2c bus binding
=20
 Examples :
--=20
2.7.4

