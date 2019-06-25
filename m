Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92102525E0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbfFYIEp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:04:45 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:54035 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbfFYIEp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:04:45 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="40294926"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:04:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:04:53 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 01:04:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIgaGxYEwUjArXVTQaBVKIZkFKtWXSFr5uRwjEQTCsc=;
 b=Mb2/+7dwkAknX6qvl/ryzlia+v2cs4D578FJWIvNwHxNKiGoOmpyvFr20rvqhTvZgidkvHXRAX60eVeLhbveCYfRk/tvJXC698PmMb/4MWNJWLg2IlLRlwyU+OpBL8t58gmK8AeR+DGI/36VL+L2s3IEwZh35AtrboR00bw/J2M=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:04:42 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:04:42 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
Thread-Topic: [PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
Thread-Index: AQHVKyykOdofqrxHG0KAvE+qLlVUtQ==
Date:   Tue, 25 Jun 2019 08:04:41 +0000
Message-ID: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 05e8f00e-dbfa-4578-5c88-08d6f943c6a6
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB128904E58D3F1DA74FF7EEEFE8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(14444005)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(386003)(52116002)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h9pL9MvsYVBUpdcP05WD8sjIDrsPmhq9MXZUJzK4wWzlfCjYTyP0Dm8vL0HAZFgxXyR/nEXs3Tiy3NJ9Kitb71T//nsrjXdGvg7aUGmaSs40oTXJCqPekHECLNaeARmU1bwIl7FU13NhshPnESAO440C/S2oVCxgFfm3rclmGMJ9Lp+ENw4Yhe8snnItOOVA4nt8ffYUZsnFHQTvHriXUgieWx01EbAamSCzs0cFO3SdC6X0jN4NgSLjen89MeX9dL9CDRLF/JE7IZwO0Z+EGiM2RtiEcI8jE0xvRZ6z0r1o1JRVOSuZ/cY6FtC6sWbAM5CNEMmzoooDTLiZnhxcRFqBCIft8CGchEJKfr1CP6JSMi9GH0SNBDzsGilaRoSS7avQ/UFPTo2tOwza21rm/hpfFTYWBrgpJdI0qyG5/X0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e8f00e-dbfa-4578-5c88-08d6f943c6a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:04:42.0989
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

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpUaGlz
IHNlcmllcyBhZGRzIHRoZSBzdXBwb3J0IGZvciBpMmMgZmlsdGVyczogYW5hbG9nIGFuZCBkaWdp
dGFsIGZpbHRlcg0KDQpkaWdpdGFsIGZpbHRlciBpcyBhdmFpbGFibGUgZm9yIHNhbWE1ZDQNCmFu
IGFkdmFuY2VkIGRpZ2l0YWwgZmlsdGVyIHRoYXQgYWxsb3dzIHRocmVzaG9sZCBjb25maWd1cmF0
aW9uIGlzIGF2YWlsYWJsZQ0KZm9yIHNhbWE1ZDIgYW5kIHNhbTl4NjANCmFuYWxvZyBmaWx0ZXJp
bmcgaXMgYXZhaWxhYmxlIGZvciBzYW1hNWQyIGFuZCBzYW05eDYwDQoNClRoaXMgc2VyaWVzIGFs
c28gYWRkcyBwbGF0Zm9ybSBkYXRhIGZvciBzYW05eDYwIHRvIHRoZSBkcml2ZXINCg0KSW4gdGhp
cyBzZXJpZXMgdmVyc2lvbiwgdGhlIGVuYWJsZW1lbnQgb2YgdGhlIGZpbHRlcnMgaXMgdmlhIERl
dmljZSB0cmVlLA0KYXMgcmVxdWVzdGVkIGJ5IEFsZXhhbmRyZSBCZWxsb25pLiBUaGUgUENCL2Jv
YXJkIHNwZWNpZmljIG5vaXNlIGlzIGhhcmR3YXJlDQpkZXBlbmRlbnQuDQoNClRoZSBwbGF0Zm9y
bSBkYXRhIHByb3BlcnRpZXMga2VlcCB0aGUgc2FtZSBwYXR0ZXJuIDogc2V0IGZvciBlYWNoIFNv
Qw0KdHJ1ZS9mYWxzZSB2YWx1ZSBhcyBpdCBpcyBkb25lIGZvciBwcmV2aW91cyBwcm9wZXJ0aWVz
Lg0KDQpDaGFuZ2VzIGluIHYyOg0KLSBhZGRlZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBhbmQgc3Vw
cG9ydCBmb3IgZW5hYmxlLWFuYS1maWx0IGFuZA0KZW5hYmxlLWRpZy1maWx0DQotIGFkZGVkIHRo
ZSBuZXcgcHJvcGVydGllcyB0byB0aGUgRFQgZm9yIHNhbWE1ZDRfeHBsYWluZWQvc2FtYTVkMl94
cGxhaW5lZA0KDQpFdWdlbiBIcmlzdGV2ICg5KToNCiAgZHQtYmluZGluZ3M6IGkyYzogYXQ5MTog
YWRkIG5ldyBjb21wYXRpYmxlDQogIGkyYzogYXQ5MTogYWRkIG5ldyBwbGF0Zm9ybSBzdXBwb3J0
IGZvciBzYW05eDYwDQogIGR0LWJpbmRpbmdzOiBpMmM6IGF0OTE6IGFkZCBiaW5kaW5nIGZvciBl
bmFibGUtZGlnLWZpbHRyDQogIGkyYzogYXQ5MTogYWRkIHN1cHBvcnQgZm9yIGRpZ2l0YWwgZmls
dGVyaW5nDQogIGkyYzogYXQ5MTogYWRkIHN1cHBvcnQgZm9yIGFkdmFuY2VkIGRpZ2l0YWwgZmls
dGVyaW5nDQogIGR0LWJpbmRpbmdzOiBpMmM6IGF0OTE6IGFkZCBiaW5kaW5nIGZvciBlbmFibGUt
YW5hLWZpbHQNCiAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgYW5hbG9nIGZpbHRlcmluZw0K
ICBBUk06IGR0czogYXQ5MTogc2FtYTVkMl94cGxhaW5lZDogYWRkIGFuYWxvZ2ljIGFuZCBkaWdp
dGFsIGZpbHRlciBmb3INCiAgICBpMmMNCiAgQVJNOiBkdHM6IGF0OTE6IHNhbWE1ZDRfeHBsYWlu
ZWQ6IGFkZCBhbmFsb2dpYyBmaWx0ZXIgZm9yIGkyYw0KDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQgfCAxMSArKysrKystDQogYXJjaC9hcm0vYm9v
dC9kdHMvYXQ5MS1zYW1hNWQyX3hwbGFpbmVkLmR0cyAgICAgICAgfCAgNCArKysNCiBhcmNoL2Fy
bS9ib290L2R0cy9hdDkxLXNhbWE1ZDRfeHBsYWluZWQuZHRzICAgICAgICB8ICAxICsNCiBkcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jICAgICAgICAgICAgICAgICB8IDM4ICsrKysr
KysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMg
ICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrDQogZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1hdDkxLmggICAgICAgICAgICAgICAgICAgICAgfCAxMiArKysrKysrDQogNiBmaWxlcyBjaGFu
Z2VkLCA4OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCi0tIA0KMi43LjQNCg0K
