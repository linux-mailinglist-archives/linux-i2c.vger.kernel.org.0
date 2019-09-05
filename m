Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDD9A99A8
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 06:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfIEEdt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 00:33:49 -0400
Received: from mail-eopbgr40073.outbound.protection.outlook.com ([40.107.4.73]:43190
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726047AbfIEEdt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 00:33:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cr656mdKnZmL/TCrDxmvMKJZ3SL67BsOSULaOZYlTWPcHpmHwB6m1bb7fa6IyUGVVEdZWqIyOFBoklrlxuauZ07RU0fCxwVgKqGew0QNkUTvDQEZa7ZtxsQY4ZgJ7UmGN24wg/wFlX7hXVlN4deUWkHIcfN8Jklcp5q8/WsKFtV4PmaW/HeUZBI4bG568yiQoDOkCb69xnpC/8lC7xhuXZq+wwhRKLo9sr4AnohCBLxn98Yqi9HKWCovi9evhljQCrIBFguZ+6MBjVfUZRNRRws/3PNfvfVBNXbKQFEwAzTnqqZNWhRCilguLf6rd5YH6q9H3b73HrMPsV19Y7B6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avaDpKvXgso4dx/QmtD7Hl71dbR5CxEuNE1/dUXMv+4=;
 b=dviwHyu9/tMe7aqZ/qlXBe5K3wKAOwdPmWQZlf13oCwvXhAM6udfXpsitK60whhowBP08TcZ2ESw8PWA9NuODc36rYhFiTV2kVLs6hExDLvCYQW1dbAq2rRSIqRTdFVuLzIntL/KdHl+eAs9QCB8TH+PYk5mOZ0aeRXT8ReMdANd55Ve9P8BMSsoNDJrHrV6+rnkzZ1EeUeIUZgNlg4mxTv6H6JtS7TxEa4BafyDgkHFKQNlpQakgJMcGCvUBb/tWj3TBAsHFlciS0OzXK/dS66Et0fEIqAznFRRdZRjyajOt8u8oYJPZv2Bg9xp/uVOXsnoL4eOA0Dxbl28/2ANXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avaDpKvXgso4dx/QmtD7Hl71dbR5CxEuNE1/dUXMv+4=;
 b=ojmNIiUvX1hCHDXc1pl9DW1TFcGjEvOA+fakr8dYgWZ2KqfMTqsDq4oWGVREuSFoZTAvL5HPVhM0u50Jq1NhJL2CgamkVRfPfWbVbl4j7RoXXgC1cZkMYgH+6/AIrJg8ktXJ76/TwAnULEkllbsxkhTr9ZLwrDO6BPMOc+YaJcE=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4667.eurprd04.prod.outlook.com (52.135.139.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Thu, 5 Sep 2019 04:33:44 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 04:33:44 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     "'andy.shevchenko@gmail.com'" <andy.shevchenko@gmail.com>,
        "'rafael@kernel.org'" <rafael@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>,
        "'wsa@the-dreams.de'" <wsa@the-dreams.de>,
        "'rjw@rjwysocki.net'" <rjw@rjwysocki.net>
CC:     Chuanhua Han <chuanhua.han@nxp.com>,
        "'shawnguo@kernel.org'" <shawnguo@kernel.org>,
        "'s.hauer@pengutronix.de'" <s.hauer@pengutronix.de>,
        "'linux-acpi@vger.kernel.org'" <linux-acpi@vger.kernel.org>,
        "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
        "'linux-i2c@vger.kernel.org'" <linux-i2c@vger.kernel.org>,
        "'linux-arm-kernel@lists.infradead.org'" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] ACPI: support for NXP i2c controller
Thread-Topic: [PATCH] ACPI: support for NXP i2c controller
Thread-Index: AQHVN9RWONVodUogYk2tb4fLvCueOacZMhcAgAAFiwCAAI1AgIAABROQgAMCJ+A=
Date:   Thu, 5 Sep 2019 04:33:44 +0000
Message-ID: <DB7PR04MB4490E737C00CF9CA173AB2898FBB0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
 <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
 <CAHp75VfFtMMQhetRFHrx=Ft7OWwyMqLrwP3sPjT6YVtr8xCHoQ@mail.gmail.com>
 <896b88d4-9d1b-922b-1784-55ef9a1a1830@pengutronix.de>
 <AM7PR04MB6885DB03C6B96C7932DDA74B8EB90@AM7PR04MB6885.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB6885DB03C6B96C7932DDA74B8EB90@AM7PR04MB6885.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09ddf1b3-09d0-4333-f572-08d731ba3c9a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB7PR04MB4667;
x-ms-traffictypediagnostic: DB7PR04MB4667:|DB7PR04MB4667:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB46678644953757242F8865408FBB0@DB7PR04MB4667.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(26005)(6246003)(8936002)(966005)(74316002)(110136005)(6436002)(8676002)(66066001)(478600001)(9686003)(54906003)(4326008)(6306002)(476003)(86362001)(305945005)(2906002)(81156014)(81166006)(3846002)(7736002)(76176011)(11346002)(102836004)(53546011)(6506007)(53936002)(229853002)(446003)(14454004)(7696005)(186003)(45080400002)(7416002)(486006)(55016002)(6116002)(44832011)(256004)(64756008)(66446008)(66946007)(66476007)(66556008)(76116006)(71190400001)(25786009)(33656002)(71200400001)(99286004)(14444005)(5660300002)(52536014)(316002)(491001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4667;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dsZ+rVCRe1StNRXL2GWcOUTLbQTy7W5efTggCMQsGX0/hKHTXdjFuLhHthmemMbVm76yJ3vsVyHVNGzBJh3ZnzyC7dVQX9R00HrwCL8MQVXAmw2dJMqR9zd6cz6IavL4Jb89F+ZzvH41xj6LY+9jlxmAoDKFKaVrhAUOwiBwzDneRHlFKqHZQB57cJzdOLwnuEfr0TA/kxpMG87rtz4O1Rq7LUFB6Pf1peARWi3+gTMWxLMc57W1bITLWDv3BgZZjJXagH2MrAY4ETopHOzs7lXIQybwypzyN2XgObUl6DjiVURrwFLUFTabzuhZmvFEpnkeSD+u6s2/y47MyIgdqOmFCaBTXaOtQQ4ZLwaUQws9/J+80CLoKX4MWBY6t2rkkyw32KQ6Aa7LqVAyWVkaRv8Ab0p1tBgAvc4cRPyMauE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ddf1b3-09d0-4333-f572-08d731ba3c9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 04:33:44.5791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VebfGvSMsR2OHpZ/pyjQ7o5bqoBjwEhONfx0Ew8jxjsjpGt5pEX53BRm1RlROvsPAVRge10QdvlxM8ZRBwz/yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4667
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBIaSwNCj4gDQo+IE9uIDAyLjA5LjE5IDIzOjE2LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+
ID4gT24gTW9uLCBTZXAgMiwgMjAxOSBhdCAxMTo1OCBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsQGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+Pg0KPiA+PiBPbiBUaHUsIEp1bCAxMSwgMjAx
OSBhdCAxMjozNSBQTSBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhhbkBueHAuY29tPg0KPiB3cm90
ZToNCj4gPj4+DQo+ID4+PiBFbmFibGUgTlhQIGkyYyBjb250cm9sbGVyIHRvIGJvb3Qgd2l0aCBB
Q1BJDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogTWVlbmFrc2hpIEFnZ2Fyd2FsIDxtZWVu
YWtzaGkuYWdnYXJ3YWxAbnhwLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFVkaXQgS3VtYXIg
PHVkaXQua3VtYXJAbnhwLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IENodWFuaHVhIEhhbiA8
Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+ID4+DQo+ID4+IFdvbGZyYW0sIGFueSBvYmplY3Rpb25z
IHRvIHRoaXMgZnJvbSB0aGUgaTJjIHNpZGU/DQo+ID4NCj4gPiBNYXkgSSBwcm9wb3NlIGFtZW5k
bWVudChzKT8NCj4gPg0KPiA+Pj4gQEAgLTQ0LDYgKzQ0LDcgQEANCj4gPj4+ICAgI2luY2x1ZGUg
PGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+DQo+
ID4+PiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4NCj4gPj4+ICsjaW5jbHVkZSA8bGlu
dXgvYWNwaS5oPg0KPiA+DQo+ID4gSWYgaXQncyBrZXB0IGluIG9yZGVyLCBiZXR0ZXIgdG8gZ28g
d2l0aCBpdC4gKFllcywgaXQgaXMgYXMgSSBoYXZlDQo+ID4gY2hlY2tlZCkgSG93ZXZlciwgcHJv
cGVydHkuaCBzaG91bGQgYmUgaW5jbHVkZWQgaW5zdGVhZCwgc2VlIGJlbG93Lg0KPiA+DQo+ID4+
PiAgICAgICAgICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZCA9DQo+IG9mX21hdGNo
X2RldmljZShpMmNfaW14X2R0X2lkcywNCj4gPj4+DQo+ID4+PiAmcGRldi0+ZGV2KTsNCj4gPj4+
ICsgICAgICAgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkICphY3BpX2lkID0NCj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGFjcGlfbWF0Y2hfZGV2aWNlKGkyY19pbXhfYWNwaV9pZHMs
DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGRldi0+
ZGV2KTsNCj4gPg0KPiA+DQo+ID4+PiAgICAgICAgICBpZiAob2ZfaWQpDQo+ID4+PiAgICAgICAg
ICAgICAgICAgIGkyY19pbXgtPmh3ZGF0YSA9IG9mX2lkLT5kYXRhOw0KPiA+Pj4gKyAgICAgICBl
bHNlIGlmIChhY3BpX2lkKQ0KPiA+Pj4gKyAgICAgICAgICAgICAgIGkyY19pbXgtPmh3ZGF0YSA9
IChzdHJ1Y3QgaW14X2kyY19od2RhdGEgKikNCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYWNwaV9pZC0+ZHJpdmVyX2RhdGE7DQo+ID4NCj4gPg0KPiA+IFRoZSBhYm92ZSBh
bHRvZ2hlciBtYXkgYmUgcmVwbGFjZWQgd2l0aA0KPiA+DQo+ID4gY29uc3Qgc3RydWN0IGlteF9p
MmNfaHdkYXRhICptYXRjaDsNCj4gPiAuLi4NCj4gPiBtYXRjaCA9IGRldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiBpZiAobWF0Y2gpDQo+ID4gICBpMmNfaW14LT5od2RhdGEg
PSBtYXRjaDsNCj4gPiBlbHNlDQo+ID4gLi4uDQo+IA0KPiBJbnN0ZWFkIG9mICJtYXkgYmUgcmVw
bGFjZWQiLCBJIHdvdWxkIHNheTogaXQgc2hvdWxkIGJlIHJlcGxhY2VkIDopDQo+IA0KPiA+Pj4g
KyAgICAgICAgICAgICAgIC5hY3BpX21hdGNoX3RhYmxlID0gQUNQSV9QVFIoaTJjX2lteF9hY3Bp
X2lkcyksDQo+ID4NCj4gPiBTaW5jZSB0aGVyZSBpcyBubyAjaWZkZWYgZ3VhcmQgbm8gbmVlZCB0
byB1c2UgQUNQSV9QVFIoKS4NCj4gPg0KPiANCj4gV2hhdCBpTVgvKG90aGVyIE5YUD8pIFNvQ3Mg
YXJlIHdpdGggQUNQSSBzdXBwb3J0PyAgV2hlcmUgSSBjYW4gZ2V0IG9uZT8gSQ0KPiB3b3VsZCBs
aWtlIHRvIGtub3cgbW9yZSBhYm91dCBpdC4NCi0gTnhwIGhhcyB2YXJpZXR5IFNvY3MsIGluY2x1
ZGUgaS5NWCwgTGF5ZXJzY2FwZSwgZXRjLg0KLSBZb3UgY2FuIGdldCBvbmUgZnJvbSBoZXJlIGh0
dHBzOi8vd3d3Lm54cC5jb20vZGVzaWduL3FvcmlxLWRldmVsb3Blci1yZXNvdXJjZXMvcW9yaXEt
bHgyMTYwYS1kZXZlbG9wbWVudC1ib2FyZDpMWDIxNjBBLVJEQg0KDQo+IA0KPiBLaW5kIHJlZ2Fy
ZHMsDQo+IE9sZWtzaWogUmVtcGVsDQo+IA0KPiAtLQ0KPiBQZW5ndXRyb25peCBlLksuICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfA0KPiB8DQo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25z
ICAgICAgICAgICAgICAgICB8DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGd3d3LnBlDQo+IG5ndXRyb25peC5kZSUyRiZh
bXA7ZGF0YT0wMiU3QzAxJTdDbWVlbmFrc2hpLmFnZ2Fyd2FsJTQwbnhwLmNvbSUNCj4gN0M2NDBl
YjAxNWE5MWY0OTU5ZDNiNTA4ZDczMDMxNjhmYiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVj
DQo+IDMwMTYzNSU3QzAlN0MwJTdDNjM3MDMwODYxMDc2ODc5OTM4JmFtcDtzZGF0YT1zUFd0a1Z0
SEhEdm9SUg0KPiBabVdKdWlwQ08lMkJFd0clMkJjdXBnWnZjSVYxJTJCcmxFWSUzRCZhbXA7cmVz
ZXJ2ZWQ9MCAgfA0KPiBQZWluZXIgU3RyLiA2LTgsIDMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkg
fCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTANCj4gfA0KPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWlt
LCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6DQo+ICs0OS01MTIxLTIwNjkxNy01NTU1IHwNCg==
