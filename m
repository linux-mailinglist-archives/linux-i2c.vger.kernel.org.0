Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27F10E737
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2019 09:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfLBI4r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Dec 2019 03:56:47 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:60152 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfLBI4o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Dec 2019 03:56:44 -0500
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ERf+ttE0Vz3IbNAngz3sdId57iyf6xmJkjlJJibhJAXHkysgQovuYrXO4prCyQhtkxucFL4ey6
 t9dbRxQahT41j0/h9CQ12xreWMnClSszNrBawwbxP61rUM2KyGzQ/il44zl5j6dHkCAJqHKuUs
 vzWNjh/q4nv+iMNuPAeaWaGYHn5sKjhIBrWnENnFpD8gjDNrJvBl53FpNeUuS+iD6QI/ztx2Bb
 1PvdJJCNW/xUk7wiXsP70MwiZY9txuT9RRj5398qwmr9klKhOn5ndrWp94z48RFs0411W2MSqf
 CqI=
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; 
   d="scan'208";a="56243844"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Dec 2019 01:56:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Dec 2019 01:56:43 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Dec 2019 01:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAtwjUFJiGQjtUhq/eIJmQq+uQmMVDANUm2Y6aPY3Udwns8yIorfyIr9HtllFEsk+6AF71/jU3qLjgJrw8lpXN0Av/uZPML8PG+E6090A3Tur6XD99Cfb8qphEM9zVTi+j3LuQ5iu4qOrfmpjSZv7Oe2a1ltX+OHKRZA9ZtqTarx6ZvVPpa56nXvHJzmzm71xy+J0K3JUks1ZzUSGtjG4olYlQvaxLIYiKSKBgIQwbmKI6h7TOSxCp0MyJ4/QrtzeUoWfTLF0Z+euL6Mv6/4acq/iBzq7u0+uF/g0chQ5HV5XM7TszZ5fbpaUWupNfd0r2x+77Tm3Y2jAGXNpKef9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOhrs97xBW4YAOnWtzATScoo1jq/qjR3Jexc5MPzLRk=;
 b=e8qkBQIEngMzRlvOTLbTcquwjwpje2axiJjPM9v96yXMhmA9EDUe8ONqzVsz614V4EIWE/xOUF5y1uP7wa8QBpjfa9FCwWoTelZLBQnRyJgzROmy0C5RFQHxHHMIiDhDNmdO4bLmCIoJ5QAwo+UmSMyHiMRNHRVZYYKK3nYtvmvACKkMwsb2RSqAabeX4yr8zXQKwYHjGkETScYjvab04wP3uhg2b90cfo7dDgIzeXw9mcLfja1cWggfb/MUzSAK55LzhwgcFu7qf2yRGVVGVvTPdaB8RGviV6gAUeOE4BIKWXLdKZaVMtdURQZ78l09WbCHRT/WQt+UI7swWf7YrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOhrs97xBW4YAOnWtzATScoo1jq/qjR3Jexc5MPzLRk=;
 b=EpPnFpm4rvnYO9hrgN0NpGpDvVdKNgrQRQhMQihrtPDmkhfFaJcYDxoaacuNYj4V5WZ+6HXNahszt3ZkrCHIO4xC+8wMBabx9ByP00kljASrPbkfkHsCbamH49yXKyA6uB6hq5YHAmQKTOjKbT6XrZkoG9XNW0EZsR8vk3VjLYQ=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1482.namprd11.prod.outlook.com (10.172.34.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 08:56:41 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 08:56:41 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <Ludovic.Desroches@microchip.com>,
        <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <peda@axentia.se>
CC:     <Codrin.Ciubotariu@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH 3/3] i2c: at91: remote default value initialization
Thread-Topic: [PATCH 3/3] i2c: at91: remote default value initialization
Thread-Index: AQHVqO5qRS7EndVcI0qSwCQ3iWhpeA==
Date:   Mon, 2 Dec 2019 08:56:41 +0000
Message-ID: <1575276957-5615-3-git-send-email-eugen.hristev@microchip.com>
References: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0037.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::14) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6c71ab7-61a4-482c-f592-08d777058c7d
x-ms-traffictypediagnostic: DM5PR11MB1482:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1482B9C9EEAB3398DA8EC0DFE8430@DM5PR11MB1482.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(14454004)(305945005)(2906002)(6512007)(4326008)(54906003)(110136005)(316002)(71190400001)(71200400001)(76176011)(5660300002)(6436002)(6486002)(2501003)(256004)(2201001)(36756003)(11346002)(386003)(6506007)(446003)(102836004)(52116002)(2616005)(186003)(26005)(7736002)(86362001)(81156014)(50226002)(8676002)(8936002)(107886003)(25786009)(6116002)(81166006)(66556008)(66476007)(66446008)(64756008)(66946007)(99286004)(66066001)(478600001)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1482;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DGtGsfBnu7rgqDtWPC1uMKv+/lI49GxfEh+4w67KC1oAXnimzjDEubQ4l7oeIjrNGmuqNzHp9o6gCCLcoPYO5H8vWvJKAjojoAmOqW2q34bFa43BOdnfxZ8srGZWDTkZZdsI5cVH6oyBMLTLYuBI3q3zDdKc3mdvAIr5hIhqg6GF+VJ6hCAcsDRGG9tIcOHy24a7fYadULwXqbifIBNvrwhQtyK4Gudib1sz9nS1Vupc0T0KHNmZxrukFCoa44JfViQyPr/eWZ0lOdO8Wva+a/68Lj4lfAaUxTGbfww3fAM5a547OTJDAp9Lvl0Ry08qDmVrUTVRQU21PmWMBfi7e2iGFKvoNs9n1EOJYNG/xYrON3S3TeUjd+PYFTa8cm64oXlK0QCPVap9K2xvehzhls3NeQNwvjy6WBKM4hGD+r5cjlKBz06YLBXmYl+avppV
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c71ab7-61a4-482c-f592-08d777058c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 08:56:41.4930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEny7Bn6qOeYXRJ98yQZ+RKg5tm7YAUI7Gn6BA9FZoRDhqFqh50BO9lXUpf1OOc/yvbyOoVBtMOq2/svcifkFRBsIwSDQPF6einwes8Ctvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Platform data structs are initialized by default with zero values.
Thus it becomes redundant to initialize them manually to zero (false).
Remove extra false initialization for field members in structs.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 39 ----------------------------------=
----
 1 file changed, 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index 5137e62..3da1a8a 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -66,55 +66,26 @@ static struct at91_twi_pdata at91rm9200_config =3D {
 	.clk_max_div =3D 5,
 	.clk_offset =3D 3,
 	.has_unre_flag =3D true,
-	.has_alt_cmd =3D false,
-	.has_hold_field =3D false,
-	.has_dig_filtr =3D false,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9261_config =3D {
 	.clk_max_div =3D 5,
 	.clk_offset =3D 4,
-	.has_unre_flag =3D false,
-	.has_alt_cmd =3D false,
-	.has_hold_field =3D false,
-	.has_dig_filtr =3D false,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9260_config =3D {
 	.clk_max_div =3D 7,
 	.clk_offset =3D 4,
-	.has_unre_flag =3D false,
-	.has_alt_cmd =3D false,
-	.has_hold_field =3D false,
-	.has_dig_filtr =3D false,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g20_config =3D {
 	.clk_max_div =3D 7,
 	.clk_offset =3D 4,
-	.has_unre_flag =3D false,
-	.has_alt_cmd =3D false,
-	.has_hold_field =3D false,
-	.has_dig_filtr =3D false,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g10_config =3D {
 	.clk_max_div =3D 7,
 	.clk_offset =3D 4,
-	.has_unre_flag =3D false,
-	.has_alt_cmd =3D false,
-	.has_hold_field =3D false,
-	.has_dig_filtr =3D false,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static const struct platform_device_id at91_twi_devtypes[] =3D {
@@ -142,23 +113,13 @@ static const struct platform_device_id at91_twi_devty=
pes[] =3D {
 static struct at91_twi_pdata at91sam9x5_config =3D {
 	.clk_max_div =3D 7,
 	.clk_offset =3D 4,
-	.has_unre_flag =3D false,
-	.has_alt_cmd =3D false,
-	.has_hold_field =3D false,
-	.has_dig_filtr =3D false,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d4_config =3D {
 	.clk_max_div =3D 7,
 	.clk_offset =3D 4,
-	.has_unre_flag =3D false,
-	.has_alt_cmd =3D false,
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
-	.has_adv_dig_filtr =3D false,
-	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d2_config =3D {
--=20
2.7.4

