Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAE05A53B9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731376AbfIBKMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:12:19 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:46243 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731295AbfIBKMS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:12:18 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: FWPE+PVNQByNcdKFPuNxQGBCwbtByef7jSuYEq8aw7Y2icpT0tmItwHHJoXNgrARwnnZFGTvNp
 mv8QV6csEjOP3F8NI/2dhSysZ9pUryOlbjg57WuuDd2aBQvnk+wE5zqBkdTmMf2vHCZIG1saLb
 uY0KYMAyvlzJkOaC6cEXUXo0kDF7Gi7qMmWFbULF4AsIEz8Yt4c+/78IU9MRHeS19lk33KV7uP
 U06DmHXq6M/QQgw/iQvCqoyhLDWvhqaCu2lpH12F7PIicQwL+hAnD7YVt08o9dRAwcov4oXPVa
 aSY=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="44561007"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 03:12:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 03:12:08 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Sep 2019 03:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGGrWfAyla5ifgapj1kgc2ApgYGuZmEj+dmjSsKZV3JirEiYDXLYIjwiBpfhEYF5pSq/j4U1ELCoPCJTmR+7OlsyCW27XRo0v3e+MFInkC+N6ssGqGlogcCQQoD3KmxsYVPyO8q1e6CDM4+9dF70/OPBM/aIKoVekvcpj9azmN2yGoHP5Y1rvvpZGIiXnnFxiPi+M5EAhtNqI2PmpRCFPnN3s0Of5mLGaZl+QlcIYJ4aId7k6SzkXUEqYQf97Mt1w2+Pwv+DnYv7NCfu+iWgjRixPx9qxzXVDbf8h5YLrYTqRlVjoh52tmngTZ8GuLbENip+nmqxhRE+X9A5uGF8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42rtC5SJX5xOoV+3Tl4dHeC6SblpcCiaAykL04V7Z8=;
 b=L6egHPtRDyjmNRofjarKaABB/d+TKeVmZ+iW4x84IVcOMzUEmP+eV23i+SgH6h39xWX5NoCUjLZo2HzH4v1EtCBpyWlXQKP9NoNSkFtJHahpDe6qyS0cNTd3ellEpZLHVggTWXOa/kFkdGinK+SL75MCUo7XdETX5em7hiTTD7YLpfiNrebfyrcQtY8SkR8RCAsaNo7t19/YmTLmsWvmtFdRz3POImHLNm7FmxY9APLimmxr8PIAi6zfNP3rkrKujOUl9Br8hsUFf/PypEkY9afffVlzJhGJqSfXzIhtpzowHailyUk2zo6AhofOJ6KMHvM7dNblLyS5q4l6w1MJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42rtC5SJX5xOoV+3Tl4dHeC6SblpcCiaAykL04V7Z8=;
 b=eMRZfDyzIa3EwR19853/RIJXVRda9zHPtoixGiKUGB5AAScL7xuOPabPFUH2N59IRVs7yUHAhvovHWjD1hZW46NJqaMfqVNFO/vh9UO4sa6CCkJM9WRDxlxE22kbZwN1mQWOhoFlTACusLg+7kiBprlKqPVYxL86akuC6oyayq0=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0044.namprd11.prod.outlook.com (10.164.155.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 10:12:06 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:12:06 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 4/9] i2c: at91: add new platform support for sam9x60
Thread-Topic: [PATCH v4 4/9] i2c: at91: add new platform support for sam9x60
Thread-Index: AQHVYXbfrZLV+huZL0GumTVJbl741A==
Date:   Mon, 2 Sep 2019 10:12:06 +0000
Message-ID: <1567418773-2427-5-git-send-email-eugen.hristev@microchip.com>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ff0564a-5db2-4b69-38f5-08d72f8e021c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0044;
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB004429995EE37A477D9755BDE8BE0@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(39850400004)(346002)(366004)(189003)(199004)(2906002)(66446008)(2201001)(66556008)(66476007)(64756008)(8936002)(305945005)(3846002)(7736002)(66946007)(6512007)(446003)(6116002)(86362001)(36756003)(5660300002)(52116002)(2501003)(11346002)(476003)(2616005)(256004)(6486002)(486006)(50226002)(14454004)(386003)(6506007)(53936002)(76176011)(186003)(99286004)(66066001)(81166006)(110136005)(7416002)(4326008)(107886003)(54906003)(4744005)(71190400001)(26005)(102836004)(6436002)(71200400001)(316002)(8676002)(81156014)(478600001)(25786009)(138113003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0044;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EKOSu0JOsUIw0oyU7phbmGUkhBNHDqLlLSzpYStasfq9g2kRd8nznqcnjCudw3+gSrnzboPsyRomdc0nmseAByeZV7Bh85M+v79dKD0GJq06b3YvgMI0pWqZCoEoZ0aD66wTwftKKEveBhrWO+WfjO1hToKn7bGQKAdDmvWi2t1iwxYpdrrkTN3QOFUYc5MYfmvJzPuwodIyT2M0MohEz1cRq670GNQZkgnqMzNgz8U4Yw+P0N1LP2Sa2sIwqy8h9pOwHr73No67nYBJiBoGqlJYIFZmY7U/fZoulBySgjLCHf9bC2UzF3hw31C0PXe6DbsbuaXLuuevbFWlYW4dHENj07sX13jQ746DlcRBSd0xes21Ds49hF0gDntr3H7XQg1NjH3imMa4Wj85V9/6Kc/tM3I3KvYLr15xFT1qGj4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff0564a-5db2-4b69-38f5-08d72f8e021c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:12:06.6018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RtTPuh9fmZ0Jd1x21jUM64fMmVQ5OjpU2sepKRdN1Fp8I9M/r5oLgfW23+a2WtkxRHcSc9V/YKc5D4B2elqM/V4miE2y7PlrFe9ZSCI9w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add new platform data support for the sam9x60 SoC

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index 435c7d7..caf1846 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -148,6 +148,14 @@ static struct at91_twi_pdata sama5d2_config =3D {
 	.has_hold_field =3D true,
 };
=20
+static struct at91_twi_pdata sam9x60_config =3D {
+	.clk_max_div =3D 7,
+	.clk_offset =3D 4,
+	.has_unre_flag =3D true,
+	.has_alt_cmd =3D true,
+	.has_hold_field =3D true,
+};
+
 static const struct of_device_id atmel_twi_dt_ids[] =3D {
 	{
 		.compatible =3D "atmel,at91rm9200-i2c",
@@ -174,6 +182,9 @@ static const struct of_device_id atmel_twi_dt_ids[] =3D=
 {
 		.compatible =3D "atmel,sama5d2-i2c",
 		.data =3D &sama5d2_config,
 	}, {
+		.compatible =3D "microchip,sam9x60-i2c",
+		.data =3D &sam9x60_config,
+	}, {
 		/* sentinel */
 	}
 };
--=20
2.7.4

