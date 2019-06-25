Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4985525FE
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfFYIFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:05:11 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:27683 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbfFYIFL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:05:11 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="38875202"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:05:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:05:19 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 25 Jun 2019 01:05:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTAqp8zbbYsv4buw9Lph0YBmkiOXwQcMiVlLL6zXCRc=;
 b=FJX6GODnhaqjOUcxtFJVUWi9HNuc5pyyjgAgSI4sRWSNWjW6Uf1xG6qfxcrQNZke9G2jFx50ZoAed7lx+lHn0I8Y2Fidz2GrJO10ilZDlfEU7fVVViceVUl3lmUKjueqqxBahdIbez64Q5RwxOyMe1luRvip9+mT9OAUsoLMwpQ=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:05:07 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:05:07 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 8/9] ARM: dts: at91: sama5d2_xplained: add analogic and
 digital filter for i2c
Thread-Topic: [PATCH v2 8/9] ARM: dts: at91: sama5d2_xplained: add analogic
 and digital filter for i2c
Thread-Index: AQHVKyyzNQSOQN0M/Eac9VZC3HcVGA==
Date:   Tue, 25 Jun 2019 08:05:06 +0000
Message-ID: <1561449642-26956-9-git-send-email-eugen.hristev@microchip.com>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::34) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e870956-b1e7-4352-cafc-08d6f943d5c0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB1289848D3ADC07158B3576F0E8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(4744005)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R1yCOEWbSCpL7cVk6jQTSG+3ZSxdzKF+q5urFHn/i56nZi5eKeKF33wWP53+4hHdujxMt1ErbWQ/+c1oqIDYtV6GNf9kqm0XWwK1Fn2T0dCCm7PH+pIaaXOyZOf6+9tntM62Mq0bfwQBlpV/xgdT8DZdGwW4k3LKFrEb0umxYu7hi9R3QYfVrpZhxcu8QR6m2Xblcq8OelK6yqiZ6Nx3B7cDyC9KVxMn/LoRWLzHI+K1naV697yULKvK8k4Ci0nRPq4ud0Y2ZToqYy7osJZJ19NvOmqXx1pz23z9fWKE743GArFWSRIh/v5qtelQwHEK30sYo//bixHVLlRact6iVoavSrT9oM5Me1oVaQO/zmbBajgw/g8BrI/oMKR5ObELLYkMCvlIoe15HA69Jo/gaVFdx0ib6v0TDyqklP28w0k=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e870956-b1e7-4352-cafc-08d6f943d5c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:05:06.9535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1289
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpBZGQg
cHJvcGVydHkgZm9yIGFuYWxvZ2ljIGFuZCBkaWdpdGFsIGZpbHRlciBmb3IgaTJjMSBhbmQgaTJj
MiBub2Rlcw0KZm9yIHNhbWE1ZDJfeHBsYWluZWQNCg0KU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJp
c3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KLS0tDQogYXJjaC9hcm0vYm9vdC9k
dHMvYXQ5MS1zYW1hNWQyX3hwbGFpbmVkLmR0cyB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2Ft
YTVkMl94cGxhaW5lZC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDJfeHBsYWlu
ZWQuZHRzDQppbmRleCA4MDhlMzk5Li5iZGU0YTcxMWIgMTAwNjQ0DQotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9hdDkxLXNhbWE1ZDJfeHBsYWluZWQuZHRzDQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9hdDkxLXNhbWE1ZDJfeHBsYWluZWQuZHRzDQpAQCAtMzM0LDYgKzMzNCw4IEBADQogCQkJCQlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KIAkJCQkJcGluY3RybC0wID0gPCZwaW5jdHJsX2Zs
eDRfZGVmYXVsdD47DQogCQkJCQlhdG1lbCxmaWZvLXNpemUgPSA8MTY+Ow0KKwkJCQkJZW5hYmxl
LWFuYS1maWx0Ow0KKwkJCQkJZW5hYmxlLWRpZy1maWx0Ow0KIAkJCQkJc3RhdHVzID0gIm9rYXki
Ow0KIAkJCQl9Ow0KIAkJCX07DQpAQCAtMzQyLDYgKzM0NCw4IEBADQogCQkJCWRtYXMgPSA8MD4s
IDwwPjsNCiAJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAJCQkJcGluY3RybC0wID0g
PCZwaW5jdHJsX2kyYzFfZGVmYXVsdD47DQorCQkJCWVuYWJsZS1hbmEtZmlsdDsNCisJCQkJZW5h
YmxlLWRpZy1maWx0Ow0KIAkJCQlzdGF0dXMgPSAib2theSI7DQogDQogCQkJCWF0MjRANTQgew0K
LS0gDQoyLjcuNA0KDQo=
