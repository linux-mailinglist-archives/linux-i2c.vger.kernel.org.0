Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25505636A9
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfGINTh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:19:37 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:13940 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGINTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:19:36 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: uLb9QP8jtq8+1w6p6m5kNziLi1KoCm13z4Btm4QS2Io+irwmOMDPWonQ+CqrcdCN5Q6YUHpi1M
 Aex6zXWxRGTg21bilqMM1rzzlF5DhJ07JyDRYAoUzHqR6igxO9HZm6zVnzfW4qzVhxmUClu1Hy
 XoyDz6IgvvQe3x8NqWrhq6RhATlKztksCXPIXTXcMVxUwlwe++Q4DakUFW+0+FllOPmTuFSwmE
 lcGC5n7ZEHnt0slE+xjpOmo9BfGFt8kKjO3sugaTMIFdGQ2OvVQmZWjbzobNjS+sQH8cc3405p
 ydI=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="39870158"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:34 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 9 Jul 2019 06:19:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dxkx4OakPKkr+P8I0lEFa1Pli/5G4/rewNzPigMq3Fw=;
 b=jDQDv7ph05fWoeAaQwDUKy+Mn4b/PfjqljGo192ENGS4lLJuj1M1+oWYBvy+LLlJH/O5j4v1GfR7Usk41vBPSJoAKjDRyLDRyvx/aprbRegqfYPV41PKzw0PxMSqraQDm3Y2hP0b36bdV5d6JXhz//paGuoeexx20NY3ZtOiBJ0=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1785.namprd11.prod.outlook.com (10.175.88.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 9 Jul 2019 13:19:33 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:33 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Topic: [PATCH v3 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Index: AQHVNljypG4qBlEEj0W8lgUeT1O+5Q==
Date:   Tue, 9 Jul 2019 13:19:33 +0000
Message-ID: <1562678049-17581-3-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 429ae94e-6d77-4f1d-b29a-08d7047014d5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1785;
x-ms-traffictypediagnostic: DM5PR11MB1785:
x-microsoft-antispam-prvs: <DM5PR11MB17856CCE35AB4BFD422B9A5AE8F10@DM5PR11MB1785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(346002)(396003)(376002)(189003)(199004)(446003)(71200400001)(11346002)(7736002)(305945005)(2906002)(476003)(66066001)(81156014)(7416002)(50226002)(6486002)(2616005)(3846002)(110136005)(66556008)(72206003)(66446008)(54906003)(73956011)(8936002)(478600001)(81166006)(71190400001)(6116002)(6436002)(316002)(107886003)(64756008)(6506007)(14454004)(4326008)(186003)(36756003)(26005)(102836004)(5660300002)(66476007)(6512007)(2501003)(53936002)(99286004)(86362001)(8676002)(52116002)(256004)(66946007)(2201001)(486006)(386003)(68736007)(25786009)(76176011)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1785;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nPbIb1Gqlz2Oi0yT3hpxPxWFQ1AcG7rUXvuFNCqO05m90MkLw92bMe59sPI2PLb0qm65Sehcsb1IW7DSYPxHV6lc6rdLR0jC6tYvFrOIWAMw4HTrO/hPBvO9+9c63mhF32564cx5KLikOajQM7gqqopDhPAqucNylVDLxHSN0v1r5CUeMD6w7TE2g4orW1pvkY8NBtTulhKwEnVEl2IrVURFowCsYswYX1Q8XOwLzU/gKS27tRwwMg3ELm4vRZtjKCfNntZVokrwFNZjrxYymZS4t5lNmtHeP3h18wzbvoNKFaAPdiuK9Ybb8k1HoNf2ff8b5VegelJ9DI3OTYrkBIJMLvrICltOzF1jvTZ9BrUDnINcgBpIuVBWSSfZ+V+5pT+dj0zHRw+CMpVL9jcb8iLpr+zfrsXhAeuFdwSLqRM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 429ae94e-6d77-4f1d-b29a-08d7047014d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:33.1874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1785
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Some i2c controllers have a built-in digital or analog filter.
This is specifically required depending on the hardware PCB/board.
Some controllers also allow specifying the maximum width of the
spikes that can be filtered. The width length can be specified in nanosecon=
ds.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/=
devicetree/bindings/i2c/i2c.txt
index 44efafd..a2d31aa 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -55,6 +55,17 @@ wants to support one of the below features, it should ad=
apt the bindings below.
 	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
 	specification.
=20
+- i2c-ana-filter
+	Enable analog filter for i2c lines.
+
+- i2c-dig-filter
+	Enable digital filter for i2c lines.
+
+- i2c-filter-width-ns
+	Width of spikes which can be filtered by either digital or analog
+	filters (i2c-ana-filtr or i2c-dig-filtr). This width is specified
+	in nanoseconds.
+
 - interrupts
 	interrupts used by the device.
=20
--=20
2.7.4

