Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3264636BB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfGINT6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:19:58 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:4969 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbfGINT6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:19:58 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: yeP3+AoX6OOVD/a9pGSOdNOmuOZVQuTFflXxcq8bc3ajYN3NMR+ixYaSoE0AZnhO9Sg2XubCdF
 NQaGkctQ3HrNuwvXN50zT7WwHJPjNxq5WIZZoNZbRGU+XlZezXVhUx8KgTKkyqnf4auyPrnL8l
 W2L/GQ9gFV5ZHbxwT/x8HjOuNM96gw8z4XUzXQ+EpNgxLCtzRAm3b12wqX8XDy7YFhdL7gZ3rO
 mslfQgdTFkO+Sx1sUaZE2lTPDNdD4szQUKXw9plpz/o17S167+92KQ/jBy7ibaFHjeA0qw3EgY
 uFI=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="41983946"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:56 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 06:19:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfJL052ySrLu7TTtMYitrl7VvkscVfZ1gYrkqwFBo0c=;
 b=Iys/5L4HEp4OTIp2qQmUVB2DdA1m7wew0VgOg3HEOFk/NID6VkSf/1az4ssDVV3tp2/Hl7DTn7aRb/MO75/9mSeZdwJrQrwEJItvXysNkQOYV3XLiNhiDr+34NQ+32dNS+VAlwmToq8DeLWoMtfsTIsHn7H3Q3QONNqDTrPRvrM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1866.namprd11.prod.outlook.com (10.175.87.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:19:55 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:55 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 9/9] ARM: dts: at91: sama5d4_xplained: add digital filter
 for i2c
Thread-Topic: [PATCH v3 9/9] ARM: dts: at91: sama5d4_xplained: add digital
 filter for i2c
Thread-Index: AQHVNlj/PPgynpWCA0OEMs7g8bir3w==
Date:   Tue, 9 Jul 2019 13:19:54 +0000
Message-ID: <1562678049-17581-10-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 328fb9d3-9c77-4344-f7b1-08d7047021b0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1866;
x-ms-traffictypediagnostic: DM5PR11MB1866:
x-microsoft-antispam-prvs: <DM5PR11MB18669BF0739BDF29EBAF5C9AE8F10@DM5PR11MB1866.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(72206003)(50226002)(86362001)(4326008)(76176011)(110136005)(66066001)(14454004)(54906003)(2201001)(7416002)(316002)(5660300002)(8936002)(71190400001)(52116002)(71200400001)(8676002)(66446008)(2616005)(66476007)(446003)(53936002)(11346002)(26005)(6512007)(107886003)(256004)(6486002)(6436002)(81166006)(81156014)(64756008)(386003)(66946007)(73956011)(2906002)(66556008)(4744005)(25786009)(486006)(102836004)(476003)(2501003)(305945005)(68736007)(478600001)(186003)(99286004)(6116002)(6506007)(3846002)(7736002)(36756003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1866;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ArHSl2JnacfdJ/KUoVAcEvgYVZzwhc/vJzcuJhexsVRzWIXd8yGzw/3ABerMZkr/TCSLodTT1gCtyH6S4pJxJchiu2NxrFaVHbrSGJkcs1hwytgsSBYjO2kauSfUbi8cnUic+Jc4zfRAo+yEo87d26Nd66irA05ddZc+8IkkO+64N9vwFe/1tLUE4Uf9rgrCGxMCkAh5IyEELbzblRla5RuZr0/lv47JxkJtOKptd4oTPlbMtrBmNN4LomYxSo4VBTegoIHzF1ll40MmMD3qD6Vrtn0Ap0XHqPkXjzK2lmSZpJKCPkgPc5l78tNgpaHWDZ8qsSLGqExfodnpEA9gc1Xfn05e98W6RIfNVG54P3fqhvPb1G6RAjVnqW73DnqD8mAYsAXB8ZuLh0f5I8afcbGcrzJI3WBel9KWmxMt3fE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 328fb9d3-9c77-4344-f7b1-08d7047021b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:54.8261
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

Add property for digital filter for i2c0 node sama5d4_xplained

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d4_xplained.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dt=
s/at91-sama5d4_xplained.dts
index fdfc37d..298113c 100644
--- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
@@ -49,6 +49,7 @@
 			};
=20
 			i2c0: i2c@f8014000 {
+				i2c-dig-filter;
 				status =3D "okay";
 			};
=20
--=20
2.7.4

