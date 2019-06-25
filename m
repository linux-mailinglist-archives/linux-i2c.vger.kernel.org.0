Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A83F525F7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbfFYIF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:05:26 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:54065 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729561AbfFYIFU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:05:20 -0400
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
   d="scan'208";a="40295068"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:05:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:05:02 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 01:05:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljlPcNhimKZ/wbNUOZxFP3RwltI/5XTTSrdtVjpo980=;
 b=jYOoi6nnYYXIH+8bB6c7eOfNsNlspVYvU+jWqWqdb6vCs17K1bPlFBGEA7qBr7lcgWlJrD7tKOve9BdzwdvNtLR8AN6dPElHGikXIwUz/9gxQafe3VIjh5q++uOX05yuvY7pxzFjKKGDVNrN3tmbx5l5K/rA4IRb6mrpd0do+6s=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:05:00 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:05:00 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Thread-Topic: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Thread-Index: AQHVKyyv+/RK0NIkBk254PAOuF5Z9w==
Date:   Tue, 25 Jun 2019 08:05:00 +0000
Message-ID: <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 6f5fe419-899a-4837-fb5f-08d6f943d21f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB128922256C6B88A14EA167DBE8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xFnQjmE4/kDW2NjBfW6bNocxZHgGCDX+vbwuLQN5ElyQw4ObjhlCFGnP2QlAtaiy3Wy8m13zE3aARCuaNJD2W9SNXmXZymqSch/8NF1C3SukWnNojjr5j/gddXqiqYvJRijkRgZqk8eZ4trNoMGdQomI2KW1Jq2yJHXGwsxcnKpgZxv/LRy9RGzErOWg87NrwgvtoKFWFZHPH72gnESLC4kIcfRFqdLMciFeixIaj8/bUR1tMvl/B0es2Jwrnlk8oBhDrmW2fpX7DatPD3mWi00FaqvYXYai6x+L6OE3H/E0S87TqBDCs0H19hns20RWIwvQAYGNnT7zoWT0TaZXuXeAmK4Aia1kG+c+9CzrWS2NV1082Ry2P4B6ejiwKP4bL6kbczoSSNfdaSAUBbHIceSqYh/GHsLgaN8y8RDiC3A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5fe419-899a-4837-fb5f-08d6f943d21f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:05:00.8024
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
YmluZGluZyBzcGVjaWZpY2F0aW9uIGZvciBhbmFsb2dpYyBmaWx0ZXIgaW5zaWRlIHRoZSBpMmMg
Y29udHJvbGxlcg0KDQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2
QG1pY3JvY2hpcC5jb20+DQotLS0NCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2kyYy1hdDkxLnR4dCB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
aTJjLWF0OTEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMt
YXQ5MS50eHQNCmluZGV4IDgyNjg1OTUuLjIwZDMzNGMgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCkBAIC0yMyw2ICsyMyw5
IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQogLSBlbmFibGUtZGlnLWZpbHQ6IEVuYWJsZSB0aGUg
YnVpbHQtaW4gZGlnaXRhbCBmaWx0ZXIgb24gdGhlIGkyYyBsaW5lcywNCiAgIHNwZWNpZmljYWxs
eSByZXF1aXJlZCBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIFBDQi9ib2FyZCBhbmQgaWYgdGhl
DQogICB2ZXJzaW9uIG9mIHRoZSBjb250cm9sbGVyIGluY2x1ZGVzIGl0Lg0KKy0gZW5hYmxlLWFu
YS1maWx0OiBFbmFibGUgdGhlIGJ1aWx0LWluIGFuYWxvZ2ljIGZpbHRlciBvbiB0aGUgaTJjIGxp
bmVzLA0KKyAgc3BlY2lmaWNhbGx5IHJlcXVpcmVkIGRlcGVuZGluZyBvbiB0aGUgaGFyZHdhcmUg
UENCL2JvYXJkIGFuZCBpZiB0aGUNCisgIHZlcnNpb24gb2YgdGhlIGNvbnRyb2xsZXIgaW5jbHVk
ZXMgaXQuDQogLSBDaGlsZCBub2RlcyBjb25mb3JtaW5nIHRvIGkyYyBidXMgYmluZGluZw0KIA0K
IEV4YW1wbGVzIDoNCkBAIC02MCw2ICs2Myw3IEBAIGkyYzA6IGkyY0BmODAzNDYwMCB7DQogCWF0
bWVsLGZpZm8tc2l6ZSA9IDwxNj47DQogCWkyYy1zZGEtaG9sZC10aW1lLW5zID0gPDMzNj47DQog
CWVuYWJsZS1kaWctZmlsdDsNCisJZW5hYmxlLWFuYS1maWx0Ow0KIA0KIAl3bTg3MzE6IHdtODcz
MUAxYSB7DQogCQljb21wYXRpYmxlID0gIndtODczMSI7DQotLSANCjIuNy40DQoNCg==
