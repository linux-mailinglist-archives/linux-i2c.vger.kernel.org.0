Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA43636BD
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfGINUK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:20:10 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:27118 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbfGINUJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:20:09 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: yd+V1r/X3LCOFDuMKTM86iiRJafKsriFzDYPtEb6EbGkC6jThgB0KPCaYZ/BdHPh2sOwpt421d
 hKwikeMgWhDfLT0+Q3FQJLr2x15Lt9KLgIKxWS0/5ttMGy38X/OudwqcaKYzEtMjugE28MGLeC
 oE6gAZF1qaqyIvjhMSLAEfRfT0LoQQobkyt6k8QggacqG0TpUH0HLXfPdvUODls5sA3It/UrVx
 l+WO1X+nqT/nP27tLECkh2mbA+iR77w6Cf7HAnsJ87RFUShGZaX3oFtrO3iMn21bR1Yro7kZ1B
 AqQ=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="40572135"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:37 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 06:19:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAbgS9SjV/4po1Ab7a1fDFyxjPeEHtHS749lFcwpVnY=;
 b=zVLnmdcAnD6igl1tzh9QGMhauFltbopXx1mSC33gwB75Z/IPHSXZBXJv3CMH0MjAt9TBIkH7XFcg3RDH2vGjCeD019WIO51KTktywhQDNrdl8nebkUCkoHBJiRpoBLB5TGd5RG2WK276ogkaTgOF8nf8Nl4XkB+629nktGO40mE=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1866.namprd11.prod.outlook.com (10.175.87.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:19:36 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:36 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 3/9] i2c: add support for filter-width-ns optional property
Thread-Topic: [PATCH v3 3/9] i2c: add support for filter-width-ns optional
 property
Thread-Index: AQHVNlj0GCZKeyvKs0qqPkVuYPgVhQ==
Date:   Tue, 9 Jul 2019 13:19:36 +0000
Message-ID: <1562678049-17581-4-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 777c6b67-bd39-473f-0632-08d7047016b0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1866;
x-ms-traffictypediagnostic: DM5PR11MB1866:
x-microsoft-antispam-prvs: <DM5PR11MB1866E663C94A1F584A61E7FDE8F10@DM5PR11MB1866.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(72206003)(50226002)(86362001)(4326008)(76176011)(110136005)(66066001)(14454004)(54906003)(2201001)(7416002)(316002)(5660300002)(8936002)(71190400001)(52116002)(71200400001)(8676002)(66446008)(2616005)(66476007)(446003)(53936002)(11346002)(26005)(6512007)(107886003)(14444005)(256004)(6486002)(6436002)(81166006)(81156014)(64756008)(386003)(66946007)(73956011)(2906002)(66556008)(25786009)(486006)(102836004)(476003)(2501003)(305945005)(68736007)(478600001)(186003)(99286004)(6116002)(6506007)(3846002)(7736002)(36756003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1866;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qpxdu8TPQK3em9nXwPg8n9N2DzVnRc/rEXyWDX0RaSPpdTslpMHk7aBEOc6wKT7uvZpMhnZXlEL6x2M+rv3pU3pV4lK5xAYCGVLjO8UgXwm+ezxFp203rDXRByunsWAtAk/m0x2a8TJssB6HEFx0EStcqRqAX7Ffz97604hcq6+h4zMyUh7qK2IA6kHj9o6a6hdwpn/oC9d+adevBlVi7AddmMy/Bhl89O/OlxJnLgFMkSD7kyvcaGmC2tZ84bkuzlB54kfW5VzWaBups/VsaEkhiAUrNftGMtkkHljB0qlYtIZe2u49Y5PpZhqhON9VtYdxqr5Wq4/yGP4ZPdNEuJRoN6lOuRQ+XK/VJjMzroa2jfX+aSF21uud7k5YNfHnRC9ER5cn6Oi56zurOV9j9T33sC9c7FC2n/ejwUFLfcc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 777c6b67-bd39-473f-0632-08d7047016b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:36.1328
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

This optional timing property specifies the width of the spikes on the i2c
lines (in ns) that can be filtered out by built-in analog or digital filter=
s
which are embedded in some i2c controllers.
Include it in the timings structure and read it as integer property.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/i2c-core-base.c | 2 ++
 include/linux/i2c.h         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9e43508..73d1c62 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1658,6 +1658,8 @@ void i2c_parse_fw_timings(struct device *dev, struct =
i2c_timings *t, bool use_de
 		t->sda_fall_ns =3D t->scl_fall_ns;
=20
 	device_property_read_u32(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns);
+
+	device_property_read_u32(dev, "i2c-filter-width-ns", &t->filter_width_ns)=
;
 }
 EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
=20
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1308126..dfb6525 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -563,6 +563,7 @@ struct i2c_lock_operations {
  * @scl_int_delay_ns: time IP core additionally needs to setup SCL in ns
  * @sda_fall_ns: time SDA signal takes to fall in ns; t(f) in the I2C spec=
ification
  * @sda_hold_ns: time IP core additionally needs to hold SDA in ns
+ * @filter_width_ns: width in ns of spikes on i2c lines that the IP core c=
an filter out
  */
 struct i2c_timings {
 	u32 bus_freq_hz;
@@ -571,6 +572,7 @@ struct i2c_timings {
 	u32 scl_int_delay_ns;
 	u32 sda_fall_ns;
 	u32 sda_hold_ns;
+	u32 filter_width_ns;
 };
=20
 /**
--=20
2.7.4

