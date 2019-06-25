Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40326525EF
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfFYIFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:05:11 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51981 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbfFYIEy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:04:54 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="38763733"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:04:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:04:53 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 25 Jun 2019 01:04:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaoaJzUwphAPFMgm66iScnWplZ9J5uXmBLoyzQO4t1s=;
 b=GF2O1VHsygOfBCuQQQf4bFtNnyU2lKtOzYrMotOv0yWRBMvgDgFogHYvpTNM9pCDHW/BAgWLJsZ/c1BF+kkR7pl7paVcXpMRFGtM/WDfeCVhq0avMzZEQZ2McyrqDjjgP3a1h1qSGc5tdt8I+lVJrmoapf/eaBTQv91K1usV+9k=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:04:52 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:04:52 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 3/9] dt-bindings: i2c: at91: add binding for
 enable-dig-filtr
Thread-Topic: [PATCH v2 3/9] dt-bindings: i2c: at91: add binding for
 enable-dig-filtr
Thread-Index: AQHVKyyqEB2xXrtCN0Wgw1KJ3S3SEg==
Date:   Tue, 25 Jun 2019 08:04:51 +0000
Message-ID: <1561449642-26956-4-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 850c5c55-98df-4ef8-d9aa-08d6f943cccc
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB1289E0880B24AE11D463FE45E8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZDUeEI8RvlPricqZuG2tSEK36Q++fkW6cEsawFHbzHGoiLIjHK+7WNoV03JCXhCCv7jEZF6RxQW3HJSEskrrEi74TdClzdshebO3Ycocodb/VOX2iPgvgu2JekjOU8sfM5ENcJCHMbe5TVesha8roIphT0cGCmu+zk7ju0EJQurnCC+3xR9Xls0PEJMB2yZhjOrZcBNLPaqH0/3bPQ8asExYNcgkV4UeR2OzNT2tqyQE1Fj1diCoRxLuq+Er/0cSsJnI153UAv1gLdQwVARqZEhqAWDiqMly+8wRRniDuMYpX9TaivC7sTYPlNIGurQ3RKAixy4V+47bF6wf8EDbqZNNK/n5GFxlHHLL2Lg4R0fzVpo6ui+7+hfyawQCMv89kFyEMAUhBrUmpfg7q5auSx9gRu+pWKfG0U15NkqYlNA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 850c5c55-98df-4ef8-d9aa-08d6f943cccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:04:51.9641
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
YmluZGluZyBzcGVjaWZpY2F0b2luIGZvciBkaWdpdGFsIGZpbHRlciBpbnNpZGUgdGhlIGkyYyBj
b250cm9sbGVyDQoNClNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZA
bWljcm9jaGlwLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLWF0OTEudHh0IHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9p
MmMtYXQ5MS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1h
dDkxLnR4dA0KaW5kZXggMjIxMGY0My4uODI2ODU5NSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0OTEudHh0DQorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KQEAgLTIwLDYgKzIwLDkg
QEAgT3B0aW9uYWwgcHJvcGVydGllczoNCiAgIGNhcGFibGUgSTJDIGNvbnRyb2xsZXJzLg0KIC0g
aTJjLXNkYS1ob2xkLXRpbWUtbnM6IFRXRCBob2xkIHRpbWUsIG9ubHkgYXZhaWxhYmxlIGZvciAi
YXRtZWwsc2FtYTVkNC1pMmMiDQogICBhbmQgImF0bWVsLHNhbWE1ZDItaTJjIi4NCistIGVuYWJs
ZS1kaWctZmlsdDogRW5hYmxlIHRoZSBidWlsdC1pbiBkaWdpdGFsIGZpbHRlciBvbiB0aGUgaTJj
IGxpbmVzLA0KKyAgc3BlY2lmaWNhbGx5IHJlcXVpcmVkIGRlcGVuZGluZyBvbiB0aGUgaGFyZHdh
cmUgUENCL2JvYXJkIGFuZCBpZiB0aGUNCisgIHZlcnNpb24gb2YgdGhlIGNvbnRyb2xsZXIgaW5j
bHVkZXMgaXQuDQogLSBDaGlsZCBub2RlcyBjb25mb3JtaW5nIHRvIGkyYyBidXMgYmluZGluZw0K
IA0KIEV4YW1wbGVzIDoNCkBAIC01Niw2ICs1OSw3IEBAIGkyYzA6IGkyY0BmODAzNDYwMCB7DQog
CWNsb2NrcyA9IDwmZmx4MD47DQogCWF0bWVsLGZpZm8tc2l6ZSA9IDwxNj47DQogCWkyYy1zZGEt
aG9sZC10aW1lLW5zID0gPDMzNj47DQorCWVuYWJsZS1kaWctZmlsdDsNCiANCiAJd204NzMxOiB3
bTg3MzFAMWEgew0KIAkJY29tcGF0aWJsZSA9ICJ3bTg3MzEiOw0KLS0gDQoyLjcuNA0KDQo=
