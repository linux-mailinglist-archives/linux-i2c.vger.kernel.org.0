Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F15EA53B4
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731311AbfIBKME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:12:04 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:45994 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731295AbfIBKME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:12:04 -0400
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
IronPort-SDR: Xivi2xg06Uu12+E8UzcVfxZoXLHXivi6Sy80O+ryd/n55awOByA6nAfePJR9HFd9wFaMmvN9Pg
 LcYOHk0LvIvULKSCmEdw9vIxlOJXVfFmDMipsngi99azERDlTVtQdQQ56Tw/oBD7Jr2Nnfv2hB
 UJc2bB/fGtVxFf0oJ2UK2vMMFmaNulimU4G7ph+KS/NsHkJxcAleswvImiI5jscN2R5uKuHbDu
 rBBuv4EZ14ftXp7p6TwLma+yi6cVo+3GzAyLGb9ru7UWSCKZ3ndVEtfrMOhXADtwyK4XPqpg3z
 8G4=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="47478187"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 03:12:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 03:12:02 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Sep 2019 03:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSWbvUeUl5pX7ffud72PQZMWB8u+ijirVmkaVxTyEH1N0QvyPJSOK97p84fUUDcqxuNiF/sDF2OGHHpNb/3HSeS2EkAf1putrr8w+XZJlNOmXLK2AhbsgCUUR+fdWX6UHjxD0y1KwcyTGLHnabgYu68UvxPHZAA/KadbK+ps7/48BNcPmDFIg7vGKlrEPIFOlvwEDPwBLZU02ZqYo/+ECx8+wmmsbgH+g9N1hNF0gngtScJkMCo46jjdwy14IcRuKNVq3kyDgvagsTvp8vUsDYQztpm/0f+jOooOsfRXeydXarpghn3pIDIpz/ENFsiJibKd0Vcwf1XEa8J2s+XGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmhfpnem1TU5+qKIavZC/TWK4NEQuQRYV77WfIeZFUM=;
 b=PPNsjBi26X3VTJrQGJ/8bXUUkwNWObW2PCgb26QN929/iLBxqsNenuveaDyxptjPAT1LOT8AjjuElrRPrgsQNmgnZBQq3WRhztNsfOH9ONdGDCjAxr+Ndgk26GHiJstK3AMGh3nH5nOlCxMASYdle7YOSKSxwl++FlxeMhJ2cIkuZWqv6R2ZKCVFallO2H6NMR/jFxAGapvMarsHoZi5fCz+KxgMPjopF0OW671pg0AwRzkxnSFsCYE3pCUerO+7zsQKSqg/RD6bAZ1leH3MqplKLEClAt/U/0xw37mbzRjiuyZjaDCr/feuonLkyhtvm3Kpl+WyuX165R9FB/JSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmhfpnem1TU5+qKIavZC/TWK4NEQuQRYV77WfIeZFUM=;
 b=TGNxYvjBn518s2B1kocYk3H8xaZl7xRqiHt+qNA3Sg4WbWdVutHgubDqUoervUF6HdXI6rUAHJVNqTp4fBr7thaolRKLmuk5CWs9rNnsqMBP7U0Xdpj2k6Rv/ta6ruNNV7s78WLW2Gr4fce9CdvycMYE3FXHXNOfCUvzJ5F0KTY=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0044.namprd11.prod.outlook.com (10.164.155.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 10:12:01 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:12:01 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Topic: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Index: AQHVYXbctVkeTzhRG0edAs7kSbS9Tg==
Date:   Mon, 2 Sep 2019 10:12:00 +0000
Message-ID: <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 2fdc4c51-24c2-450f-d320-08d72f8dfec3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0044;
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB00449CD795CB0ACD0E15F201E8BE0@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(39850400004)(346002)(366004)(189003)(199004)(2906002)(66446008)(2201001)(66556008)(66476007)(64756008)(8936002)(305945005)(3846002)(7736002)(66946007)(6512007)(446003)(6116002)(86362001)(36756003)(5660300002)(52116002)(2501003)(11346002)(476003)(2616005)(256004)(6486002)(486006)(50226002)(14454004)(386003)(6506007)(53936002)(76176011)(186003)(99286004)(66066001)(81166006)(110136005)(7416002)(4326008)(107886003)(54906003)(71190400001)(26005)(102836004)(6436002)(71200400001)(316002)(8676002)(81156014)(478600001)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0044;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +YpJJtRzBR+yhJrPV6rDjNDBGxNzgBYcGZeV9pg7XDk1FKZ0cwdYAxk8QkNVHyFAxfgXHi2fIo33xj8ROnA0HImPjQYsrpbtZqmtftIA4kUk+49Rk8le5zwS8Tr2Ei0xmrNkLSSplbzmHvV8josYKLQxZgaIlVeF7OfoRil73DaDTRAupWNwnE7tT8ICxsl37A0+XBo/0YCUA0dUF2b9mWVB/+XohrPJ3BYOiiwl3+YDzVJYy1e+wG8FcTbWmkFJTNLKUTz/JNpysmuonmZVFnRbJOGAf/n1i8pgK37takK63SmSu1eAKI6LeWGERIJ+Rfs7cv0/wOUfMP2eUbFNeh7W6MlT4J5uBSurei4vWM45RLufm4FgcFHVNO/1STmQMIC1O8ZsMiHNmmt8Wfy8l5uMDPTi2Wq8+my9tJEQMEY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdc4c51-24c2-450f-d320-08d72f8dfec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:12:00.9844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B95eGPNtynyfbsyBiLptgAqYZYktXtxrUIUcqjTRHf3OHdAUauxu9fI5SOjPgpMCjYkWN5RYVm6hvDiOm1BIzOHGi2BJWUY9cuLZ717NuSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
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
index 44efafd..8dbff67 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -55,6 +55,17 @@ wants to support one of the below features, it should ad=
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
+- i2c-filter-width-ns
+	Width of spikes which can be filtered by either digital or analog
+	filters (i2c-analog-filtr or i2c-digital-filtr). This width is specified
+	in nanoseconds.
+
 - interrupts
 	interrupts used by the device.
=20
--=20
2.7.4

