Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F75636AD
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfGINTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:19:42 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:23470 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbfGINTm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:19:42 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ei4SZeWr3WZ+jWRJn3KC8kmSHvtwDYt6FcRbGEJ0QGbcRE09f60plwKz4abK0dLfIlaLuazLxu
 u+EQK2kbnL+MF+oWbAOYl+YbBPsfzheii0Bt1REUaeh/3Z+Sk7NTUzOzRNVeOKaFGgbVCF1kX2
 H6blxcdxdd4P7YN5yectgLHRbvZuf8Ise1DzWXnUUbJ2nZ6jRo1fi/yd8mEJPuGPoh6tbqTIjK
 IsV1D9SrZ5BctEaFrq16h4nSM/hc0nnmLirl7j28bQaodLH0oNMfDCzi6I5LAZE+J4mR0NYLCN
 Xu8=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="40504234"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:40 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 9 Jul 2019 06:19:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xlU13Ja9W3q9y5JXZmU903nA8mQ03sXRCIEWQnoiw=;
 b=q39VtZnOENIy/feFy9uzXqGQQi4Nkk71xfZhhYlyJdrcQsW4q4c704xTaAoZhI+Vkkv29fCZ8gp0cQK5PRzoYMIqmtvBR6iArIhnV1RWlToW6vZJJJktwiZXBLtnwIXKuG92M+NrXmA3pWMON7/s/oKX9C+cqLn7p/kDNnnMoAE=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1866.namprd11.prod.outlook.com (10.175.87.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:19:39 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:39 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 4/9] i2c: at91: add new platform support for sam9x60
Thread-Topic: [PATCH v3 4/9] i2c: at91: add new platform support for sam9x60
Thread-Index: AQHVNlj22smCbqXFFkK5oLq83CQQ3A==
Date:   Tue, 9 Jul 2019 13:19:39 +0000
Message-ID: <1562678049-17581-5-git-send-email-eugen.hristev@microchip.com>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0141.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::19) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10559b68-3ad9-4a73-0e2a-08d704701893
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1866;
x-ms-traffictypediagnostic: DM5PR11MB1866:
x-microsoft-antispam-prvs: <DM5PR11MB1866205E64D764DDC822A95FE8F10@DM5PR11MB1866.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(72206003)(50226002)(86362001)(4326008)(76176011)(110136005)(66066001)(14454004)(54906003)(2201001)(7416002)(316002)(5660300002)(8936002)(71190400001)(52116002)(71200400001)(8676002)(66446008)(2616005)(66476007)(446003)(53936002)(11346002)(26005)(6512007)(107886003)(256004)(6486002)(6436002)(81166006)(81156014)(64756008)(386003)(66946007)(73956011)(2906002)(66556008)(4744005)(25786009)(486006)(102836004)(476003)(2501003)(305945005)(68736007)(478600001)(186003)(99286004)(6116002)(6506007)(3846002)(7736002)(36756003)(138113003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1866;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: czwNrb70bAqu2KyQJHtQgN1b7onPcsFIejNahnbRfoGXs3XuW8D+8IcSDAZbkwY57tIaE3tV5GWag39hz4vY+NkihUVz7jrg0CSeZ/HXHbhzg4gBXtNdqjzkgF7xjZFO1FVhLNvctPEDhnnVWQgNg/XGOVnBfB4VRsNQn50AHooFjz1fzqZX6WyXHqRV+zKLMmIFDGclZ84R5v9Wn0HnjkmujXLatTDCAmm+QRL81aTw+XL0sHqF+2rugMXBsvrORQZ0Gd+e85QtQt54sObPJohPj+A3yvvC/9GFXi3BE0X2TJKXAnsyeci6c0SE5vhnHSGXcOVnBwyHvxrxvaJTB+xrFDsoOEQtHhGi6jt8G66FeMmxdP79pR7XlGTvdyggQFHzumOt9jYvZAEANLlgkVh547US50P3WbzGvRe8WmA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 10559b68-3ad9-4a73-0e2a-08d704701893
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:39.4185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1866
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
index 8d55cdd..a663a7a 100644
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

