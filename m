Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E732A525FB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfFYIFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:05:17 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:27683 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729561AbfFYIFP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:05:15 -0400
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
   d="scan'208";a="38875243"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:05:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:05:21 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 01:05:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YZvYoQHCbqTxetiL3oacFVWc7TZtqrmrwRJyWnF3bM=;
 b=MKLZsJ6ANEj6uFPW8paCwLnJvIILZDwIm5O0WQ8wiZbfgm0AHJoTyLWqVpUbcnNrCNgBR7Cm/0UMu8Tg+YxFR6Hp6apwS01zusPuk0PbT1zffq08sQTjoPzUCJt1XzGWSZdcHucW5dIQej0HdXpDaL96YIIxOQUZhSY0vTKTgeM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0042.namprd11.prod.outlook.com (10.164.155.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:05:10 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:05:10 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 9/9] ARM: dts: at91: sama5d4_xplained: add analogic filter
 for i2c
Thread-Topic: [PATCH v2 9/9] ARM: dts: at91: sama5d4_xplained: add analogic
 filter for i2c
Thread-Index: AQHVKyy1aEUbSn3n10i679n5YAswRQ==
Date:   Tue, 25 Jun 2019 08:05:09 +0000
Message-ID: <1561449642-26956-10-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: a4bff322-aa7e-4fdf-cc8d-08d6f943d788
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0042;
x-ms-traffictypediagnostic: DM5PR11MB0042:
x-microsoft-antispam-prvs: <DM5PR11MB0042D98EBAEDAF25851FFC55E8E30@DM5PR11MB0042.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(107886003)(3846002)(102836004)(64756008)(26005)(2616005)(11346002)(446003)(8936002)(81156014)(186003)(486006)(72206003)(6116002)(256004)(8676002)(14454004)(6486002)(6512007)(81166006)(476003)(6436002)(66066001)(36756003)(2501003)(316002)(99286004)(110136005)(6506007)(386003)(52116002)(76176011)(53936002)(50226002)(4326008)(2906002)(66446008)(5660300002)(66946007)(2201001)(66556008)(478600001)(86362001)(71200400001)(71190400001)(305945005)(68736007)(4744005)(7736002)(25786009)(73956011)(66476007)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0042;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mTV12jCnRHQNLdftYI5y3Pk+499RLnXbQLKyTIxxEb9CP0yVqXH72yK36g7Edz1lPM4c8LcroXnZKtFHWkEz9m7XWkiJZwrqTnyJqAstMDVlGh7f5IxvFLI3jgLh/95JIgn/TPy9ZlxHBtVqi/MEJSU5FdO5nNuVNAfCvQ5ADv6DEPARgObAzLJDuER5P4TXW/hqhPk61IseUUKbg/OQ6i7yPtZuUU9t/a2QFFYejg8ZF6gLqRQa6VdJUpLVelSgpvdF7cHJ7RvoRZAfeCljEs4Wt5GPtMgfGdl0pF0naocZprBbd17mfZ2l1V/NYWHQo7yfgFfclhdc/lcSE2cWDltRRdcfCGqjuTShaLlZY4jwub1YFvQsTy+JQ+FZ6IlCYam0BBlz23SreLzTOLbixTA2kku5JNb6MzytIrb0JiY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bff322-aa7e-4fdf-cc8d-08d6f943d788
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:05:09.9200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0042
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpBZGQg
cHJvcGVydHkgZm9yIGRpZ2l0YWwgZmlsdGVyIGZvciBpMmMwIG5vZGUgc2FtYTVkNF94cGxhaW5l
ZA0KDQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hp
cC5jb20+DQotLS0NCiBhcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDRfeHBsYWluZWQuZHRz
IHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDRfeHBsYWluZWQuZHRzIGIvYXJjaC9hcm0vYm9v
dC9kdHMvYXQ5MS1zYW1hNWQ0X3hwbGFpbmVkLmR0cw0KaW5kZXggZmRmYzM3ZC4uMDYwNjhkYyAx
MDA2NDQNCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkNF94cGxhaW5lZC5kdHMN
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkNF94cGxhaW5lZC5kdHMNCkBAIC00
OSw2ICs0OSw3IEBADQogCQkJfTsNCiANCiAJCQlpMmMwOiBpMmNAZjgwMTQwMDAgew0KKwkJCQll
bmFibGUtYW5hLWZpbHQ7DQogCQkJCXN0YXR1cyA9ICJva2F5IjsNCiAJCQl9Ow0KIA0KLS0gDQoy
LjcuNA0KDQo=
