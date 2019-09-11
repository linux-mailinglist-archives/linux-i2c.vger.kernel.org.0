Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76CD9AF7D1
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbfIKIYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:33 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:62447 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfIKIYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:32 -0400
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
IronPort-SDR: rX4nhMPin3s1XsNPmDcrBNiaB5AfIux3ljYsrYo+SdT+KTY5THs5S9BCnkC7u7zOvkX5LASvhV
 Z0XfTlr9UvDt20JrsoPXp0wL+VEKSTiVRG/NiAndFWL5BpevZmb2gvgJ3PqbxD1PPE/NXqNpn3
 YY/tXUNzdEMdw3A9COsCsky28Bf60AvdhuQJb5MlGucya+ahPs1MYDQp1FWSvmnPFWPNi4Qbs2
 KtrYV0TnD11wt+DtsdpZXMGTrPamlvgtMy/L4CEbEOzSLcByjkDfih0FWnhgG3TGXv/nYtJYzt
 VJY=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="48478475"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 01:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZiL3hpnjqZG8X719hi7G3Gkj2vmuqQ22phRqOhR4VUYQLJOEXrUYxSHhETxPOIHjLGRqf5TMVXdjtP1uCg18KXcKqaA4zWcxh5VH9B/BHC+AQl4nGeGGh+gLtEdCXGtNyoSWw3giQg9AyO0pZDo3OJoi+n9wZ82xgfRTju8DS50YN+mn3CdouwExV1ooqUg9zhFl7L8vyWtIhYJnH242aGaQCJYrtvrliwrjo+8AAVNH5QU+D8yubCwBRSHxbB5GY/lr9TdPIp267rsDZEXyPf5ntokBAAQVxq7igZIOjlKlQA9pL2nCMSZt7/LXaeRprRg1OJdPW4C9kq/VfIX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZGz96MmEkN5dZzYYAjNgFn+FtkW43FTvVIA4U8MwQ=;
 b=hgGbLRVB7SesWnKByZvYQvRxms1/as4UJERrsuFiv2VURLegBPawMLKtFyfobmup9903jyIO5deDgclVwYd8CX67rNt1dPPwo322zzXC7f7zvh2trDko9V+gjo1MCKEV1FDSNscJhpipSbJN2J1RBUf8RNMU2SZCiT4O7g4N1UpKxInHJML7bepXsI6JP4gkE7zMgwlejhGEDH8y0zglhT17zPz4MUusDXpsmHgMguONFCt6rFXDq2SNEAniWFupkhoe8DaDj740/3C2ZxuAyMMf8gRuQrjzO3XOLzTavfLQck6OVMQ001MFHD3zt3B36EH8veqhAua1c8+5jpSSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZGz96MmEkN5dZzYYAjNgFn+FtkW43FTvVIA4U8MwQ=;
 b=JRiFP/7V5tyxC8XLN0TnHE/dyTeSszcvMH90HAIjA7FQp6Lfz+OErN5kcp+u+9u/d7jqvQdrJHQx8BInQUvs09APKF/z3VuFyV72Kqe0+SgpEyrPy1nxhdeLU/nhYh3PbtqW53+0uM4mBkAIQx0XKiPubJMNZZWJXd/GZN1teuk=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:20 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:20 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Topic: [PATCH v5 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Index: AQHVaHpPW8l4X5Kqx0mXlxkiy0GaLA==
Date:   Wed, 11 Sep 2019 08:24:20 +0000
Message-ID: <1568189911-31641-3-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: d918bab3-f1c0-4257-4a4a-08d736917184
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452BDDB048C2DB97A27BFB6E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XXB8dROqTagHFwLtyDf9+/Ur31S71JwqRYP/AeaFknObJp35jtl6anI5prxjNGLv6KEsNoEQ3jNRSAT57HDQ8YbpLiF+r/RBWQWKBXYMvpL1xXbcw2fJGlsEBO2PvGaGXNgnbymEqwB8ZZYvUbufB2tCJ6p+tNpztE3rp5d7/i2RC9S2Rvj2a1LKtwmyrQ8KSiKvso0CEUnQA3R5vevqYU8lP7JKyQWhiDMbprrwOTGrI/6vidLDC3EYL+dfF9ypYY3yzg+ZgJtApgbPJzSGlzMuDTLfICFHN/IaRuQX4itkqu8/w+2luKEHDWqsVd/yEKmOohyAtXRmAe+aBF+DxnDPfXQxeruV2Q8GrrZTKKGm/3yJCl+7pdluLGnmwwLWIic3Z/7T7RDdQGb+DygPlzlxeivVBqVDXtxj5D2lDvA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d918bab3-f1c0-4257-4a4a-08d736917184
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:20.1156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UG3liKMupN/pX91OXF1TsaBXzIKTWbzghD8Ri5ooIJKQHpn3p4nlv95xBjP+HDzrCR1ajB3Kc2sbqtCBagPUP9CY4RUi+KHEl6+Jv/ZmPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Some i2c controllers have a built-in digital or analog filter.
This is specifically required depending on the hardware PCB/board.
Some controllers also allow specifying the maximum width of the
spikes that can be filtered for digital filter. The width length can be
specified in nanoseconds.
Analog filters can be configured to have a cutoff frequency (low-pass filte=
r).
This frequency can be specified in Hz.
Added an optional property for such types of analog filters.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/=
devicetree/bindings/i2c/i2c.txt
index 44efafd..9a53df4 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -55,6 +55,24 @@ wants to support one of the below features, it should ad=
apt the bindings below.
 	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
 	specification.
=20
+- i2c-analog-filter
+	Enable analog filter for i2c lines.
+
+- i2c-digital-filter
+	Enable digital filter for i2c lines.
+
+- i2c-digital-filter-width-ns
+	Width of spikes which can be filtered by digital filter
+	(i2c-digital-filter). This width is specified in nanoseconds.
+
+- i2c-analog-filter-cutoff-frequency
+	Frequency that the analog filter (i2c-analog-filter) uses to distinguish
+	which signal to filter. Signal with higher frequency than specified will
+	be filtered out. Only lower frequency will pass (this is applicable to
+	a low-pass analog filter). Typical value should be above the normal
+	i2c bus clock frequency (clock-frequency).
+	Specified in Hz.
+
 - interrupts
 	interrupts used by the device.
=20
--=20
2.7.4

