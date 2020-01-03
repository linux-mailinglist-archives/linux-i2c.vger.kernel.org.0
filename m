Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE98B12F655
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 10:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgACJtM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 04:49:12 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:52158 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgACJtM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 04:49:12 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: laCIMzLXLze96kd4VhHX6aAt3e5ZbvFMKe3aO06WOw2p8iUFOAlwBPNbUauYDosCAjQCGnR7wQ
 ARB6vUhe2yWnpXYi5XaINQwoEUl9rCRMEwR7yX3BHJvNnXOHBJ0tNTxFNv4svFrNTF1U22Eivg
 IIH85XoEPh3zN7xNg7vqZg4iyurHCuI598Ze6IT1ch8SUvxkGpWaA0lkTdkEskUvfHP6bUSi57
 zzbknqBbAog7SGKuoTZmXmt7DrAX55rPIRroWV2Rd/qso9XWhdQkzVqifAn8QGJuZSqj9kAwcn
 8ZQ=
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; 
   d="scan'208";a="61520572"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jan 2020 02:49:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 3 Jan 2020 02:49:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 02:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5qnkw6ChLO/q1W0CMWKfi+wGSKTB0lT7udALraBIFQEqnaEY0AK8VXztreGEK4ujkP3NWQlNdswW9AFHksT57xOMBzoVYDgPsr8IQdcO9d5KhNkFImPLe1KUmAkG18OhCFcL0YOYpnQ6vWdhOxiZd9Ss8bKjys/fZOyYlpWOy0/pPfUe2/aczifVWJB3ferM0RfR248bi3aO4obK+TOPS9RrMR9FYrrpKod3GLwr0+1awWA/W6+AFDkZsWnbyGoFbIRlmf1Uo16vete6DUGYwENssY0QQ7eA7ub2mx6f0fUtIK9mSD1f5GzS8AkdLd8OQvssbN3r/BTgrW239HG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSqMQROnt3CzAluTR8YEXw2FiBiHCpR/t9YCxkUfkjU=;
 b=H170zifAI8FPJYvB5rimVBwgUEA2FfAZQwNz3b1UDf02BR7gr4XdrtKy9ue97YuJFQMwLIbYtrwOryRgGdEL7SfMbHfAShOnUU4e9D0985YrU6wY3buiH6rKwJ9Y4M3r9oJOkfZMiRCw4oyKjMVU3D+naCCSpzf881N3MgAxdpPs+wClsou/c9td/TJ7wdQJgOLGlKbYq86eYoLa01jQLiwSgv3N5CXn2505u5QPU2mXjxDLcA0Txx62SidwORUnM+6YYqCPFDnOO1wnXsDr1JUP3PV9GNO+B1F8SuxnUH7rrv+ugwq7peAAN+sWzLmiBk4B5eBWagg8UhXHbWHoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSqMQROnt3CzAluTR8YEXw2FiBiHCpR/t9YCxkUfkjU=;
 b=WLDR4/A6tBnniE8OnpA14OLtYNyVNXZUJ1tktTxbxt2UvRi7/Lh1rEwmYlLmHM9Ot9bMIwx8sbsgp9fl4FlQVf/G0eeenuw6ljTTfHwmqVKAjkT1DloeRq6wKzyTDwH/lmREFb8JM/yCFz2W5D5dqMEkUYhY+LkZ8hpr6XBNS7I=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4322.namprd11.prod.outlook.com (10.255.89.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 09:49:07 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.012; Fri, 3 Jan 2020
 09:49:07 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: i2c: at91: document optional bus recovery
 properties
Thread-Topic: [PATCH v2 1/6] dt-bindings: i2c: at91: document optional bus
 recovery properties
Thread-Index: AQHVwhsK1Px6bcqwdEqfvaNsF/8nOQ==
Date:   Fri, 3 Jan 2020 09:49:06 +0000
Message-ID: <20200103094821.13185-2-codrin.ciubotariu@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.25.143.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a01c8265-bbff-47cf-172c-08d790322d53
x-ms-traffictypediagnostic: BY5PR11MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4322A2A5F3ACA9E15DD660FCE7230@BY5PR11MB4322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(36756003)(478600001)(4326008)(6512007)(6486002)(110136005)(54906003)(316002)(5660300002)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(86362001)(6506007)(1076003)(8936002)(76116006)(26005)(81166006)(2906002)(91956017)(71200400001)(81156014)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4322;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ee87BVI0pWJdIJ0CF8fVeeS4l9WoCMwcuxssagLlTIhbMq5d0u0HRRmuQaJMp5WfTwg7ud+U5WmBbp3OYBCEdpZmDlQIhnIiC68wLD4TDaveACjBzz5AUT+q1c8pJd2xWq7D0R9LRVOp6Fvr/YzDcWs5RnZT+azJ0X5wtsO5ln37cN40ocwLm/kno1WcLNYGDyVmVNdoTypqneilSGaUgIV7Jq5YxQhi7+uR/3IPl1ytYz+7xud552pOCH6i17e3DiKX8BYO73YgV4xhgGDkOE+yjsAVu+ByV3PgewU+9H1pDz++0Poj8WZO8PMf4tk9X0ncoYOUB3hP8AfQT8n5ioODiuPFmgkd+3fSeY/sB1Ja3aY6PS4DEV2B7McqpxLS0tcAn3Hg8zSgWimO1NFWHG+lcE40slYst8awRLCYfSJ2UhRDzYiifzOZbEX/UrUt
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a01c8265-bbff-47cf-172c-08d790322d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 09:49:06.7555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnJ2aEYC9Y2LxQbi1QywsbZV6RGo/eeur8fnI7Cq1ZXFh0PLZqbKTkPInX+YWWKF/TveYz2d4fGlmVkaAcNp7QVFaaezW6+77qUza7QSaI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

The at91 I2C controller can support bus recovery by re-assigning SCL
and SDA to gpios. Add the optional pinctrl and gpio properties to do
so.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---

Changes in v2:
 - none

 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documenta=
tion/devicetree/bindings/i2c/i2c-at91.txt
index 2210f4359c45..551ddabb566b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -20,8 +20,13 @@ Optional properties:
   capable I2C controllers.
 - i2c-sda-hold-time-ns: TWD hold time, only available for "atmel,sama5d4-i=
2c"
   and "atmel,sama5d2-i2c".
+- scl-gpios: specify the gpio related to SCL pin
+- sda-gpios: specify the gpio related to SDA pin
+- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2=
c
+  bus recovery, call it "gpio" state
 - Child nodes conforming to i2c bus binding
=20
+
 Examples :
=20
 i2c0: i2c@fff84000 {
@@ -56,6 +61,11 @@ i2c0: i2c@f8034600 {
 	clocks =3D <&flx0>;
 	atmel,fifo-size =3D <16>;
 	i2c-sda-hold-time-ns =3D <336>;
+	pinctrl-names =3D "default", "gpio";
+	pinctrl-0 =3D <&pinctrl_i2c0>;
+	pinctrl-1 =3D <&pinctrl_i2c0_gpio>;
+	sda-gpios =3D <&pioA 30 GPIO_ACTIVE_HIGH>;
+	scl-gpios =3D <&pioA 31 GPIO_ACTIVE_HIGH>;
=20
 	wm8731: wm8731@1a {
 		compatible =3D "wm8731";
--=20
2.20.1
