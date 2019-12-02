Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A5910E73C
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2019 09:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfLBI4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Dec 2019 03:56:41 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:46982 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfLBI4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Dec 2019 03:56:40 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: TheEbjbVuoBPwYNFL8q8ktO9aQ/LtS0BlmyUmcU2uIPAFQQxVuGKhGtKGzXqtmuLx0+/QgV1VY
 +illVRzsS6+51HX4ZBeN0tKzL5nacU7FywnBlroM9wXQdPV5Txh3r5T1lZcEje1Q07quzknnN9
 hzABptK9eNAoMV/DPG/86lWKFRYMphktaYABkScisWcfOiRuaxMw69VBiOVpddthm+34cSx+RS
 dsinc4LYkG5GyFEzz7CJ8aDVj6eCHYZYKI6BDAPuhidukFt1SV2EjvmfbnuRE0qIB6A8wbl4MW
 0ws=
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; 
   d="scan'208";a="57450838"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Dec 2019 01:56:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Dec 2019 01:56:38 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Dec 2019 01:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha6mRad9TVy4w66cwqLXylWHrMTo/pYk9ozTbr4CJIUSV3uN0opGFBChGlHunYXHX7H/oNvaU/9cmgCPXzCz6mCYFbU2ufFC2Q6M2YjZhyFjdI+Yd/mCy3lw2l8+pgVY0fN3v8+4zjnln0SsjTpcRESIO461bK6Y7p5f3TKzqvwr0lOBxCfNsdgRKXjSxDAjwvbZy6nU6g/dJbh5AoLKjSUNSVXbIy+K+wME8zzMExcalOxUAz6X1ODTZYuHu8J8bfjmGWE+aEit86YZQ8287Q4jnS6BsDVaCFJvOyZz7p3R1Y9O/ZLFBWCT0w2kSgNh/coRteXWqPPvY+M9d1pzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scG65duMYj6zxPkrVo+dHca8qQNKPZFA8PWACuhzchQ=;
 b=Fm+q25srSsDZqWT7+doHYUGPHBcLeml26Vsk++VkD8p2iqHqjacD+joz7sqYkMJ8bvb3jleje0tTsLkVCZymxuPFje50Er37f7YXIrk++R3Ma2yHb+jFrSrw5Gwd561j7+MWPfdK9hCl2fD+0TMDg7fC0QCDXGRvUsQk9RQyKZGH+UT/PdzRnzfO41fD6GmJtmKgJSY3rqLGAvoP80AzLYhwsKRmJKZuttI3aqsXeVWLaQjNGsPlCo00gyyEIU/WcmQRfVABYeREJ1JIr5fhy3ZiUdVO8WomrsWYXTJIfC0IZS6MqKK2OlmbpLOjM3TmOWYHy9hWRKvQyNovifc4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scG65duMYj6zxPkrVo+dHca8qQNKPZFA8PWACuhzchQ=;
 b=JLr1bnhU41qzYbEA2ZsqzVUtZk7sXiSkO+U5u3bwI7zijWzHm20DlEi3aQ5UTVuiliP2J/FmEvH40EJ6m182NnI1k14vztnMr5qQ9AvGV5mbu01XlV1BRjpW6mZ5W+w5nCfUQN6imKoKXnynb1Bw4qMA6fE06efP9Ch+ucr6Ilg=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1482.namprd11.prod.outlook.com (10.172.34.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 08:56:36 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 08:56:36 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <Ludovic.Desroches@microchip.com>,
        <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <peda@axentia.se>
CC:     <Codrin.Ciubotariu@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH 1/3] dt-bindings: i2c: at91: cosmetic formatting of compatible
 list
Thread-Topic: [PATCH 1/3] dt-bindings: i2c: at91: cosmetic formatting of
 compatible list
Thread-Index: AQHVqO5mfhsm9BhFXkuy2KXBFoWS5A==
Date:   Mon, 2 Dec 2019 08:56:35 +0000
Message-ID: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 13cea678-c883-48f6-02cc-08d7770588fb
x-ms-traffictypediagnostic: DM5PR11MB1482:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1482AA396DE581538D7CCA7DE8430@DM5PR11MB1482.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(14454004)(305945005)(2906002)(6512007)(4326008)(54906003)(110136005)(316002)(71190400001)(71200400001)(5660300002)(6436002)(6486002)(2501003)(256004)(2201001)(36756003)(386003)(6506007)(102836004)(52116002)(2616005)(186003)(26005)(7736002)(86362001)(81156014)(50226002)(8676002)(8936002)(107886003)(25786009)(6116002)(81166006)(66556008)(66476007)(66446008)(64756008)(66946007)(99286004)(66066001)(478600001)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1482;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1jY+Nrbs6reBrYZ5IudK2ADo7Sjy/l+YIQ9qnZWS0pVGvn31c97NcCxyXrNqR8HYPZ7CnDkZHtmQWvJFud42Am5D+b2515y9a5/IFE0Gw0O9ykfSTpGjn/NCTfJtiT/hjSBQl/JleIRLB+jJPkWJSYffn4RdIbd21RrlK/p/gjhr5QS9l8fUlem+EYLOb025n/b3V71abnWn8YpoXQhBVD62bSuGEPW+Bpaku/TRTGzG1YfYyn9BvqqlCH3BR6KWhBXX2VBEC0+VhKABJUNgBYykl8tGC6m+MU/f5qZGy15F2OwEck65S2goIXsKmw0ChASC0yCwfyqUNwAbR79AO7Yz7bklwWe+SPjr/9r7KaE8J/c4H9AlNbpB3sQ1wm+Ju601T2/UplKHGEnIdnAxzkOQjcaCBjyjW42x1SBuJKSCHlO2DzK+BuiGT0qCZXI
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cea678-c883-48f6-02cc-08d7770588fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 08:56:35.7945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANPejSohsljpjZ+PjhPbz9vC+q2/uCRzQNRGyR9CvRvpA1ulL7c8b+PDrSY8m51IkEDugWU/e8nYHNog/T/cIY7vjr1M0LsOplXY2VUIGQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Format the list of compatibles with one compatible per line.

Suggested-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documenta=
tion/devicetree/bindings/i2c/i2c-at91.txt
index 2210f43..d35cd63 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -1,10 +1,16 @@
 I2C for Atmel platforms
=20
 Required properties :
-- compatible : Must be "atmel,at91rm9200-i2c", "atmel,at91sam9261-i2c",
-     "atmel,at91sam9260-i2c", "atmel,at91sam9g20-i2c", "atmel,at91sam9g10-=
i2c",
-     "atmel,at91sam9x5-i2c", "atmel,sama5d4-i2c", "atmel,sama5d2-i2c" or
-     "microchip,sam9x60-i2c"
+- compatible : Must be one of:
+	"atmel,at91rm9200-i2c",
+	"atmel,at91sam9261-i2c",
+	"atmel,at91sam9260-i2c",
+	"atmel,at91sam9g20-i2c",
+	"atmel,at91sam9g10-i2c",
+	"atmel,at91sam9x5-i2c",
+	"atmel,sama5d4-i2c",
+	"atmel,sama5d2-i2c",
+	"microchip,sam9x60-i2c".
 - reg: physical base address of the controller and length of memory mapped
      region.
 - interrupts: interrupt number to the cpu.
--=20
2.7.4

