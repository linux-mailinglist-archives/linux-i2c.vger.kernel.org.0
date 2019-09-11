Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25A5AAF7CA
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfIKIYe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:34 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:62447 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfIKIYd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:33 -0400
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
IronPort-SDR: o1bFhNPm7DCwNvnttktwjHEhGqVpUoDDI2sY08dyKVI2Oh+zB59RoKzjY0YCSRrMNrEfhAFAVx
 6K716EuBFL2/x2QkZmfVaefbpnIELR7FQT483xe2ciBKf07v1lOXmBxsLz0GFC9vsRBhUymE7e
 gKPdplg0q87wYhc4IhgPUEFhAFBA35KkpDFF3jMBJgHkco+PSCAowSWgDKmmx3LCYUkQdnwNES
 3q49of1BkkcqucSldVNhhIybyX8vrS/ZoLVBLkuGYpyi/k0AVtsv08nUGCIbrghnMDiR718Daj
 9Es=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="48478499"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 01:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQbztmwWDM6kq0lioDV8xDuBUhJGyF9kcUJqr1zKRWRgeaFb6aFcukElVEdN/k5wIKmWXzjqSOHvYZEsx780xHuAUdnDvILkJXh0QlXXoNRgMxOY2upEv77M+EmogOAYrB5RzJC7ysfbG9ug3/qXUVKo1mp68rt99oPUhSrggljaXo+/jHJEDwQtgUU73IPd2FHbnNNiYFUVce9b6k+SCkW87WN+o8mmv4hhDZXtHf77ZGeJFrIO25pFvWmgWD+3NmFFSw8ctky9Zhv8NeKiTepF2gIBe3nJcJH3UXkFmoMTGo2jND4vL4EI6ZZV1gmQKOgGVj9wk1h395xdF3iEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42rtC5SJX5xOoV+3Tl4dHeC6SblpcCiaAykL04V7Z8=;
 b=ThQV3nPU9rVMDNqSvcpcFo3itxrluqOMPbd6l2fZIF8dB3cjrDgHCK+Dg08h4wHQs/fBgEyc/zjwS4BGLXH7AbOPLHQonWLVtW7E0KFg7MgaI96fP+fim2sVlOw4oD14UE4TeCnV+kr/uO8oyN+2vTOKbba3B200ZYR/ENWbaBBsSWzQQlalfty9Wj7uCx/2nwSaMxMYvZC411+U+Kg8d12Mg9Wx9wWMHfoDj7xNUEMAOK/CmGJfLxdV/3iPrSx9wMFQ9Ve/lW6ofRufZvBlL84JwwRO9EB6zA9UAhxf15/HvppkHRUyrT4BW2p8oXQBk3/iqlFqnPDEXkkF78SxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42rtC5SJX5xOoV+3Tl4dHeC6SblpcCiaAykL04V7Z8=;
 b=DLabQF0y2wPyutUjVoh2kowJVtbq4pk/sREEiiQznBRhb1VhQSaaZ2MqSIcy8E/JL8sGh7fbUjxPsGpRppHvFBASRxh53EV7th1QiwpLBaq7o6sr7q91AGjHRpFYCMZvMa1sR+kA9R6Pu985urMSmvKKg9lEyVAcOo+QihNXAeU=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:26 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:26 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 4/9] i2c: at91: add new platform support for sam9x60
Thread-Topic: [PATCH v5 4/9] i2c: at91: add new platform support for sam9x60
Thread-Index: AQHVaHpSReG5GVmDYEuF7VIH6uM1pA==
Date:   Wed, 11 Sep 2019 08:24:25 +0000
Message-ID: <1568189911-31641-5-git-send-email-eugen.hristev@microchip.com>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f39200d-b7c6-4bd4-4f81-08d7369174db
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452B00BCF3A937E04916284E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(4744005)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(138113003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NeCzxElf9ZgnGdx15q75M2v8ntlWmCI/ioBdc2RHm7gPEvqQJv2TjjOTWB36F4XvLiDlB/W1hNAMwWbaGzol0sHDUx1CvXtZytG/Q1Ukn7UDVeTY0tOJCeG208FlDDPGmLDJsVL7svvTXNY01Eag44hhQ7ChUMYSojVt1uSWi836a4XwgLAEOI6RwpIlPEstutwGYxXF4GW9yhhLl5XbOrLEJH12LX2bsV9D1RqTw1OQa7PcP6t8AIV99uu10jK0bHtwvFtUjf4Kpb6xe/sd+j/itMgQzRfUXbMtg+80XF7yTTmM4SL+e2Ayc+OxAUUmQ3lxiaWDCbNe0K/K9eJTo7U3Frdgu/pu4QWv42XVfgD3ueWK6OlxtYOMMR36nKJPhjyW1k8gX/pqmQKRM5e85M49Pe5FjgJWNMk/lTl8uvQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f39200d-b7c6-4bd4-4f81-08d7369174db
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:25.8710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSX/ac85b+fmrn22VjAl0YFTxRVyOJr0zoaUZR0JyyZ5Z21vjytku6P14ycYtLWeMfxC9f2NDBBtXRyppUnphz56YMbdeI99T6pGa2eW+5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
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

