Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F9FAF5C0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 08:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfIKGZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 02:25:34 -0400
Received: from mail-eopbgr10080.outbound.protection.outlook.com ([40.107.1.80]:13942
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726792AbfIKGZe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Sep 2019 02:25:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAXAJGihlY/RTUnYcJinAv+/jdDIGoZ/rEnwtDkR43wS/JCiPVcfbcZzuuFwxJuAyFsAqJGLFG5XUVZ+Hm21IYhPMFm7eSjKDSD3tRcqr9wxoSruGJ62zVEuEDQKdzgAx+s7O4f31ToeAZpJkOh4JeVWsBGhmBTwi7oX/AB8H5Ur4kY5s30Qxi6TneKYmqEghF5K2PWlZCm15+2iw6V0pw4Ng3WUbIIphavWyt66tRhAM2p8DZOxB2q1AXBdMT5m2q+merfDkMEYG+0kmW66bEf8lqS9+iEz5Sac4LA3xWBL5QX2Erp6FSMX/KEueaWtQLVQb2Rfq8xvt7b+UsRV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3t7A/kmVrufOCnKd5Jhgiwp0W0uBoxwWYSgGoZffq4=;
 b=BiSOsvjXLTpAFbbLXByMYjylGkLajxJTz7XhXH0owibBGqOe9TtgA3xUWAg3cMzaYZdJhOTTQ+OCKYNMZEbuBXHb03mHF9OQMnemSPQcKlcR6ZZMBjpyVHUPhENfJl/KwuOoGq6Yl0eSg7kvO1yRiP3iMzhObCmfXM8oTlcr+yKJAtsbBstOb4s7Rodim5FkKB9DkthncDa40yLAkcwo7UQQiH8+lZ84jh2IBgpMYegZHxLwdhE5ujRA7hL9MmRfZdI5LV5FDILO5CTspSfaSJ8dy+Dm4bg7VHiHN+1w7jtUPcK9vR1L9vYzPylDJuoZRixZUeD7SJ3pzUcO9Bw+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3t7A/kmVrufOCnKd5Jhgiwp0W0uBoxwWYSgGoZffq4=;
 b=a6/dEXRxkiZ+n9zzCJB9HyV/4EPGVMQ+9zwYxHHhwsuphsl45UtIh/JqG8kyo1hSiN/IBHnGPIFpsyiEtUVXM3mmG883p1hXdRbyFyS6Q921AYuY2+I01ECuyWEQGv6Nd79Bgl6p/Vln26mAsaS8AQQg16jmLRVtWY3KkoU/UXs=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5386.eurprd04.prod.outlook.com (20.178.104.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Wed, 11 Sep 2019 06:23:49 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 06:23:49 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     'Andy Shevchenko' <andy.shevchenko@gmail.com>
CC:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Chuanhua Han <chuanhua.han@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [v2] ACPI: support for NXP i2c controller
Thread-Topic: [EXT] Re: [v2] ACPI: support for NXP i2c controller
Thread-Index: AQHVZImk5g5PYdwMgEGSUu7QXQNuc6cec4kAgAXLnMA=
Date:   Wed, 11 Sep 2019 06:23:49 +0000
Message-ID: <DB7PR04MB44902F057F8541CF3C7FC3198FB10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190906075319.21244-1-biwen.li@nxp.com>
 <CAHp75Vcz+ruwvq_yu6Oj69XTezsdnne049Ma=oTRPjRXJKnhPQ@mail.gmail.com>
In-Reply-To: <CAHp75Vcz+ruwvq_yu6Oj69XTezsdnne049Ma=oTRPjRXJKnhPQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68e729ed-8226-4831-73db-08d736809bc9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB7PR04MB5386;
x-ms-traffictypediagnostic: DB7PR04MB5386:|DB7PR04MB5386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5386F2FDD7517328174F080C8FB10@DB7PR04MB5386.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(189003)(199004)(256004)(81166006)(81156014)(4326008)(99286004)(6116002)(3846002)(6246003)(229853002)(6436002)(6916009)(486006)(2906002)(476003)(66066001)(14454004)(5660300002)(71200400001)(44832011)(446003)(76116006)(11346002)(25786009)(316002)(54906003)(6506007)(186003)(7416002)(7736002)(53936002)(74316002)(52536014)(14444005)(478600001)(7696005)(76176011)(26005)(55016002)(8936002)(9686003)(66476007)(66446008)(64756008)(66556008)(66946007)(305945005)(53546011)(86362001)(102836004)(8676002)(71190400001)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5386;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1VNT0lNH7gDoosY4jr12JdwAGORTt6vWcp57/g+2YeCduZa3Uv2PlF44asTsSBFa0byXgkdQAUjiMH5lzXfpjHEkaGrKkF5k2FBf4jx833bT9rWSOxmiz2Mop4rTTJ16ytztkF1hDzm4YyR4JwdOaNuLQeRlD5wnkONSrrIWOAQ1g00EpuJ/Gw1hUg1PzPxH3bt//7h6LsttndPMEPzAVot1wMQjcMlrgmGEbNSGab3lzOKhzfCHH/46bo2ULeRJV48fkHth3vykMHa6eKvgTdWnYO2MlGEIH8y6Vbapb5m9eUAPOyI8gYRSD04V4X/fxuVCX1JGnA7MOeP2Fivi7IAqRkiWeioYB7fgKnnz5e46EzuRVNP9uXyV8S2ODo59T/+s2CYWVMaxaEogypiZJyyTK5s7/v+9P3cF5DQe1Xo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e729ed-8226-4831-73db-08d736809bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 06:23:49.2709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05+9XHtmioUW4tqgizAYN+1ZJJJzrMPE2JpoJE317UcYERRCLhFggpzC2hHxAKjyR5Hec0hX0UPOhFOB8GqXbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5386
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

44CBPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiBGcmksIFNlcCA2LCAyMDE5IGF0
IDExOjAzIEFNIEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZy
b206IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+ID4NCj4gPiBFbmFibGUg
TlhQIGkyYyBjb250cm9sbGVyIHRvIGJvb3Qgd2l0aCBBQ1BJDQo+ID4NCj4gDQo+IFRoYW5rcywg
dGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZSwNCj4gUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5r
byA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gDQo+IHRob3VnaC4uLg0KPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBNZWVuYWtzaGkgQWdnYXJ3YWwgPG1lZW5ha3NoaS5hZ2dhcndhbEBueHAu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFVkaXQgS3VtYXIgPHVkaXQua3VtYXJAbnhwLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhhbkBueHAuY29tPg0K
PiANCj4gVGhpcyBTb0IgY2hhaW4gaXMgYSBiaXQgb2RkLiBXaG8gaXMgdGhlIGF1dGhvciBvZiB0
aGlzPyBUaGUgZmlyc3QgU29CIGluIHRoZSBjaGFpbg0KPiB1c3VhbGx5IHBvaW50cyB0byB0aGUg
Zmlyc3QgKG1haW4pIGF1dGhvci4gVGhlcmUgaXMgYWxzbyBwb3NzaWJsZSB0byBjaGFuZ2UgdGhh
dCwNCj4gdGhvdWdoIGluIHRoYXQgY2FzZSBmb3IgdGhlIHJlc3Qgd2Ugbm93IHVzZSBDby1kZXZl
bG9wZWQtYnkgdGFnIHJhdGhlciB0aGFuDQo+IFNvQi4NCj4gSW4gYW55IGNhc2UsIGlmIFJhZmFl
bCBhbmQgV29sZnJhbSBhcmUgb2theSB3aXRoIHRoaXMsIEkgaGF2ZSBubyBvYmplY3Rpb25zLg0K
VGhhbmtzLg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNv
bT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2UgaW4gdjI6DQo+ID4gICAgICAgICAtIFNpbXBsaWZ5IGNv
ZGUNCj4gPiAgICAgICAgIC0gQWRqdXN0IGhlYWRlciBmaWxlIG9yZGVyDQo+ID4gICAgICAgICAt
IE5vdCB1c2UgQUNQSV9QVFIoKQ0KPiA+DQo+ID4gIGRyaXZlcnMvYWNwaS9hY3BpX2FwZC5jICAg
ICAgfCAgNyArKysrKysrDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgfCAxNyAr
KysrKysrKysrKysrLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2FjcGlf
YXBkLmMgYi9kcml2ZXJzL2FjcGkvYWNwaV9hcGQuYyBpbmRleA0KPiA+IDdjZDBjOWFjNzFlYS4u
NzE1MTFhZTJkZmNkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9hY3BpX2FwZC5jDQo+
ID4gKysrIGIvZHJpdmVycy9hY3BpL2FjcGlfYXBkLmMNCj4gPiBAQCAtMTYwLDExICsxNjAsMTcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcGRfZGV2aWNlX2Rlc2MNCj4gaGlwMDhfaTJjX2Rlc2Mg
PSB7DQo+ID4gICAgICAgICAuc2V0dXAgPSBhY3BpX2FwZF9zZXR1cCwNCj4gPiAgICAgICAgIC5m
aXhlZF9jbGtfcmF0ZSA9IDI1MDAwMDAwMCwNCj4gPiAgfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYXBkX2RldmljZV9kZXNjIHRodW5kZXJ4Ml9pMmNfZGVzYyA9IHsNCj4gPiAg
ICAgICAgIC5zZXR1cCA9IGFjcGlfYXBkX3NldHVwLA0KPiA+ICAgICAgICAgLmZpeGVkX2Nsa19y
YXRlID0gMTI1MDAwMDAwLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
YXBkX2RldmljZV9kZXNjIG54cF9pMmNfZGVzYyA9IHsNCj4gPiArICAgICAgIC5zZXR1cCA9IGFj
cGlfYXBkX3NldHVwLA0KPiA+ICsgICAgICAgLmZpeGVkX2Nsa19yYXRlID0gMzUwMDAwMDAwLA0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcGRfZGV2aWNlX2Rlc2Mg
aGlwMDhfc3BpX2Rlc2MgPSB7DQo+ID4gICAgICAgICAuc2V0dXAgPSBhY3BpX2FwZF9zZXR1cCwN
Cj4gPiAgICAgICAgIC5maXhlZF9jbGtfcmF0ZSA9IDI1MDAwMDAwMCwNCj4gPiBAQCAtMjM4LDYg
KzI0NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQNCj4gYWNwaV9hcGRf
ZGV2aWNlX2lkc1tdID0gew0KPiA+ICAgICAgICAgeyAiSElTSTAyQTEiLCBBUERfQUREUihoaXAw
N19pMmNfZGVzYykgfSwNCj4gPiAgICAgICAgIHsgIkhJU0kwMkEyIiwgQVBEX0FERFIoaGlwMDhf
aTJjX2Rlc2MpIH0sDQo+ID4gICAgICAgICB7ICJISVNJMDE3MyIsIEFQRF9BRERSKGhpcDA4X3Nw
aV9kZXNjKSB9LA0KPiA+ICsgICAgICAgeyAiTlhQMDAwMSIsIEFQRF9BRERSKG54cF9pMmNfZGVz
YykgfSwNCj4gPiAgI2VuZGlmDQo+ID4gICAgICAgICB7IH0NCj4gPiAgfTsNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1pbXguYyBpbmRleCAxNWY2Y2RlNjQ1MmYuLmEzYjYxMzM2ZmU1NSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ID4gKysrIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+IEBAIC0yMCw2ICsyMCw3IEBADQo+ID4gICAqDQo+ID4g
ICAqLw0KPiA+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9jbGsuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBsZXRpb24uaD4NCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gQEAgLTI1NSw2ICsyNTYsMTIgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgaTJjX2lteF9kdF9pZHNbXQ0KPiA+ID0geyAgfTsgIE1P
RFVMRV9ERVZJQ0VfVEFCTEUob2YsIGkyY19pbXhfZHRfaWRzKTsNCj4gPg0KPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIGkyY19pbXhfYWNwaV9pZHNbXSA9IHsNCj4gPiAr
ICAgICAgIHsiTlhQMDAwMSIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmdmY2MTBf
aTJjX2h3ZGF0YX0sDQo+ID4gKyAgICAgICB7IH0NCj4gPiArfTsNCj4gPiArTU9EVUxFX0RFVklD
RV9UQUJMRShhY3BpLCBpMmNfaW14X2FjcGlfaWRzKTsNCj4gPiArDQo+ID4gIHN0YXRpYyBpbmxp
bmUgaW50IGlzX2lteDFfaTJjKHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCkgIHsNCj4g
PiAgICAgICAgIHJldHVybiBpMmNfaW14LT5od2RhdGEtPmRldnR5cGUgPT0gSU1YMV9JMkM7IEBA
IC0xMDQ4LDE0DQo+ID4gKzEwNTUsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfYWxnb3Jp
dGhtIGkyY19pbXhfYWxnbyA9IHsNCj4gPg0KPiA+ICBzdGF0aWMgaW50IGkyY19pbXhfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgIHsNCj4gPiAtICAgICAgIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgKm9mX2lkID0gb2ZfbWF0Y2hfZGV2aWNlKGkyY19pbXhfZHRfaWRzLA0K
PiA+IC0NCj4gJnBkZXYtPmRldik7DQo+ID4gICAgICAgICBzdHJ1Y3QgaW14X2kyY19zdHJ1Y3Qg
KmkyY19pbXg7DQo+ID4gICAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiAgICAgICAg
IHN0cnVjdCBpbXhpMmNfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPQ0KPiBkZXZfZ2V0X3BsYXRkYXRh
KCZwZGV2LT5kZXYpOw0KPiA+ICAgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+ICAgICAg
ICAgaW50IGlycSwgcmV0Ow0KPiA+ICAgICAgICAgZG1hX2FkZHJfdCBwaHlfYWRkcjsNCj4gPiAr
ICAgICAgIGNvbnN0IHN0cnVjdCBpbXhfaTJjX2h3ZGF0YSAqbWF0Y2g7DQo+ID4NCj4gPiAgICAg
ICAgIGRldl9kYmcoJnBkZXYtPmRldiwgIjwlcz5cbiIsIF9fZnVuY19fKTsNCj4gPg0KPiA+IEBA
IC0xMDc1LDggKzEwODEsOSBAQCBzdGF0aWMgaW50IGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgICAgICAgIGlmICghaTJjX2lteCkNCj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtICAgICAgIGlmIChvZl9pZCkN
Cj4gPiAtICAgICAgICAgICAgICAgaTJjX2lteC0+aHdkYXRhID0gb2ZfaWQtPmRhdGE7DQo+ID4g
KyAgICAgICBtYXRjaCA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiAr
ICAgICAgIGlmIChtYXRjaCkNCj4gPiArICAgICAgICAgICAgICAgaTJjX2lteC0+aHdkYXRhID0g
bWF0Y2g7DQo+ID4gICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgICAgIGkyY19pbXgtPmh3
ZGF0YSA9IChzdHJ1Y3QgaW14X2kyY19od2RhdGEgKikNCj4gPg0KPiBwbGF0Zm9ybV9nZXRfZGV2
aWNlX2lkKHBkZXYpLT5kcml2ZXJfZGF0YTsNCj4gPiBAQCAtMTA4OSw2ICsxMDk2LDcgQEAgc3Rh
dGljIGludCBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+
ID4gICAgICAgICBpMmNfaW14LT5hZGFwdGVyLm5yICAgICAgICAgICAgID0gcGRldi0+aWQ7DQo+
ID4gICAgICAgICBpMmNfaW14LT5hZGFwdGVyLmRldi5vZl9ub2RlICAgID0gcGRldi0+ZGV2Lm9m
X25vZGU7DQo+ID4gICAgICAgICBpMmNfaW14LT5iYXNlICAgICAgICAgICAgICAgICAgID0gYmFz
ZTsNCj4gPiArICAgICAgIEFDUElfQ09NUEFOSU9OX1NFVCgmaTJjX2lteC0+YWRhcHRlci5kZXYs
DQo+IEFDUElfQ09NUEFOSU9OKCZwZGV2LT5kZXYpKTsNCj4gPg0KPiA+ICAgICAgICAgLyogR2V0
IEkyQyBjbG9jayAqLw0KPiA+ICAgICAgICAgaTJjX2lteC0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZw
ZGV2LT5kZXYsIE5VTEwpOw0KPiA+IEBAIC0xMjQ3LDYgKzEyNTUsNyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBpMmNfaW14X2RyaXZlciA9IHsNCj4gPiAgICAgICAgICAgICAgICAg
Lm5hbWUgPSBEUklWRVJfTkFNRSwNCj4gPiAgICAgICAgICAgICAgICAgLnBtID0gJmkyY19pbXhf
cG1fb3BzLA0KPiA+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBpMmNfaW14X2R0
X2lkcywNCj4gPiArICAgICAgICAgICAgICAgLmFjcGlfbWF0Y2hfdGFibGUgPSBpMmNfaW14X2Fj
cGlfaWRzLA0KPiA+ICAgICAgICAgfSwNCj4gPiAgICAgICAgIC5pZF90YWJsZSA9IGlteF9pMmNf
ZGV2dHlwZSwNCj4gPiAgfTsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo+IA0KPiANCj4gLS0N
Cj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0K
