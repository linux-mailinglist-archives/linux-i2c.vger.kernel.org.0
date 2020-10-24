Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDDE297B3F
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Oct 2020 09:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759889AbgJXHjv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Oct 2020 03:39:51 -0400
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:55841
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759888AbgJXHjv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 24 Oct 2020 03:39:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkffwF5KQIj+IrAa1LREgH1kgNPydUrG8/LLz6aKtuG1akF0KShbuylArVZQWZJnkk9GJEHbBsmpZxnWVeIJZqPMb7Fs6SiDqi6VvH649SHMUfgFepMdlbX594u5aYMVC1vqP22jxnDap3yzzhArI+40Nh1CHck/y5Vf7mjV/m2T1qezsFyLW78ScI6Qq74/DtLoT0lsl/1qRwKNEsX22ANKfL1F601ycHA0gHjelnTtw2BKGNG5icZqB6qAsLIWI11+PmWpiWQZgFbRLSy1JBd2XPNmlEm8MppElCJFPV9nXPUaQ/VwqOwUYxxbRsnt1C0dhjxKwM8VkNTtjZSYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVOPLn4BHwzYwAIqCvn+0zFR8iVAabvQnWPCby1IBN8=;
 b=Yu1OLrrwkXF8NKeWwrwsptVwYXghILwYwzX9EtajK/DdmU/crZxe1MslwEeGkHhpuMdgn9nbMCf4NPvVCPhzXCWUJdSXLha1WCLfoImryfCcKFYh2fkpENpEiQKtF7IDN/FTRxsj75sfk4Vq0z5QseuFt5rtiVpOYux03XfO4OTTFz832s57HnB6bPuSo1vW2WdK18RoEC2Xi2sKYlX8tCLJ/bfwL57WgePNkjN02wEpLkbylvpYzjuQHzoOXi6hz/oeSnIbaZKsEjbs3zLygdEj71EX4Exk6shI3xe40XjEJ9LT85uETir09nSPaGCxoPdB9hqjyfiqlhVToQJfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVOPLn4BHwzYwAIqCvn+0zFR8iVAabvQnWPCby1IBN8=;
 b=EWCTpjja5/ozDoSs5UmYyJnrbZ6hGOpCmsftSS+xh7nXEkaHZT+T7+46/xKallXY6ZJebyCVsjnqH7COmeEeg9aR/5+cW7d91HTP+/eQF8I4F6/ImIfIDG+rwLy4Aj7RewYX/7g5KcuxEkhcoJhTXf0CYw4T7xXoW4ByGFrY6v0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (10.172.251.142) by
 DBBPR04MB7515.eurprd04.prod.outlook.com (20.182.196.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.28; Sat, 24 Oct 2020 07:39:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Sat, 24 Oct 2020
 07:39:47 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] i2c: imx: use devm_request_threaded_irq to simplify
 code
Thread-Topic: [PATCH 1/2] i2c: imx: use devm_request_threaded_irq to simplify
 code
Thread-Index: AQHWqRXRlmQAJLpl7UqgTgJ06EmVHqmlTtYAgAEQVtA=
Date:   Sat, 24 Oct 2020 07:39:47 +0000
Message-ID: <DB6PR0402MB276054D75742322A734DF638881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <CAJKOXPcPMRYmQURxAX5JPOR7k0JQmzoaX4xkmyZar_HHLX3dkA@mail.gmail.com>
In-Reply-To: <CAJKOXPcPMRYmQURxAX5JPOR7k0JQmzoaX4xkmyZar_HHLX3dkA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [114.217.181.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 965e6fa5-47ac-4d1a-3824-08d877effb7f
x-ms-traffictypediagnostic: DBBPR04MB7515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB7515F1BC89EBC93CE572E121881B0@DBBPR04MB7515.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:110;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: stjAg37aeWZ+U52vqH6nXWmzU6JmhT8ctjTphVFrbEZIrr1tGFcFGrLBIunlN8QE1mIl81J4e6GZ97wumEGs+I+/IVJtq9y2/3RESLyFm0XS1qY/mBB8w+IRMU9Lrln1jT/eGYxlyICQlfp73J8q0g38azPL7BtTZErVU3utPCw9Yx/SAfKFwMR/TLCX3s0xVs7cLHh7Q0zk8qQAdldCWouhTQ/sZRNch6lKVvA9fcy6Q9bELWRmQDnvM+SxBwOY9cGiniD0Xf7JcK/WEFJLvR/ZOWmUTNzIgXnb1i0wHcQHlaKXfQ/PfL3zNPC326p2PDJteAqf34yi31Zo5w2jSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(76116006)(55016002)(71200400001)(5660300002)(6916009)(4326008)(44832011)(478600001)(86362001)(83380400001)(9686003)(2906002)(26005)(7696005)(33656002)(52536014)(186003)(64756008)(316002)(8936002)(66446008)(66476007)(66946007)(54906003)(8676002)(6506007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: c4FWqnFRwtUDq2csaL0zPqRMkwVq8R2gfuEpeSJwIa15RFTnRxnT26BYPaeZp4d/pLKfS5F1GYvHaW8eSjlBTNm5OBHllNvZr3n4hZLOoM/LBtnUMBmoP8QspQ8DWgbYsjbhyYdfVaG5CJeOVDgF/ZRsd+oy+b5/ae8eaX2J1AHA+jM1eVzFhtjwupnmUuNeRHMu2H6TQW2P0Nyqtz8RdF8RJnuNde7s1DoaYxjS+OPZIxIwoy9QEX0L2abv8XiPC3TZrUMi5i4UXvLnLseO8U31Zpw2vGzLRrYP4HT3ubKXDRoLS+vAEVJpaVlgKzsWOiUmhnWQI9/IAjkkbAzUpKZpjEeGaD3uzHdqf6gpNvyu5P0615EjNxlkRFg54c9KtJy9eYRhXdoRqLVAVVOs2XqFJ9AQ1ZCG1uuBpqMlBTQGm/cTcTK5VrLgu0fCOoa2IynbEGTvDv2PAaQQmegwRvuPeSrdsB8uC4LUoTCkSFs9V/zfUAfmZJggVR6oeG2sd1FnTf3DdY3lzniWh5AunKRVm2JvR+Y0b9I9kzSWgNiT53C+krxAt9//3IiTfHe8rzK4R9mu7EKReSVTv1XqkLm65hJskTmR+foy+mxV4NfDdH+7cky5/3NEigOFLRP9la6BeRmkwM+z9an9F+g6gQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965e6fa5-47ac-4d1a-3824-08d877effb7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2020 07:39:47.1463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9pr53jFfoOuzNiSdu7UdXcdMHyrghrymsz1sCYrpYb49xFVLbtRjWZmZ6uJxrI4PzVJVieSlpuXBqj3RvbTbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaTJjOiBpbXg6IHVzZSBkZXZtX3JlcXVlc3RfdGhy
ZWFkZWRfaXJxIHRvIHNpbXBsaWZ5DQo+IGNvZGUNCj4gDQo+IE9uIEZyaSwgMjMgT2N0IDIwMjAg
YXQgMTA6MjcsIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBlbmcg
RmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+DQo+ID4gVXNlIGRldm1fcmVxdWVzdF90aHJlYWRl
ZF9pcnEgdG8gc2ltcGxpZnkgY29kZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4g
PHBlbmcuZmFuQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
aW14LmMgfCAxMCArKystLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1pbXguYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyBpbmRleCBl
NmY4ZDZlNDVhMTUuLmJhOWQ2MzkyMjNlYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWlteC5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0K
PiA+IEBAIC0xMjE2LDggKzEyMTYsOCBAQCBzdGF0aWMgaW50IGkyY19pbXhfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgICAgICAgICAgICAgICAgZ290byBycG1f
ZGlzYWJsZTsNCj4gPg0KPiA+ICAgICAgICAgLyogUmVxdWVzdCBJUlEgKi8NCj4gPiAtICAgICAg
IHJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJxKGlycSwgaTJjX2lteF9pc3IsIE5VTEwsIElSUUZf
U0hBUkVELA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGRldi0+bmFt
ZSwgaTJjX2lteCk7DQo+ID4gKyAgICAgICByZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJx
KCZwZGV2LT5kZXYsIGlycSwgaTJjX2lteF9pc3IsDQo+IE5VTEwsIElSUUZfU0hBUkVELA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZGV2LT5uYW1lLCBpMmNf
aW14KTsNCj4gDQo+IFJlYWxseT8gWW91IHNpbGVudGx5IHJldmVydCBjb21taXQgZTUwZTRmMGI4
NWJlICgiaTJjOiBpbXg6IEZpeCBleHRlcm5hbCBhYm9ydA0KPiBvbiBpbnRlcnJ1cHQgaW4gZXhp
dCBwYXRocyIpLiBUaGlzIGlzIG5vdCBhIHNpbXBsaWZpY2F0aW9uIGJ1dCBzZXJpb3VzIGNoYW5n
ZS4gTkFLLg0KPiBBdCBsZWFzdCB3aXRob3V0IHByb3BlciByZWFzb25pbmcgb2Ygd2h5IHRoaXMg
aXMgc3VkZGVubHkgc2FmZS4NCg0KT2gsIEkgbmVlZCBsb29rIGF0IGdpdCBoaXN0b3J5IGJlZm9y
ZS4gQnV0DQpJcyBpdCBiZWNhdXNlIGkyYyBpbnRlcnJ1cHQgZW5hYmxlZCB0b28gZWFybHk/IEkn
bGwgdHJ5IHlvdXIgY2FzZSBvbiBpLk1YOE0gcGxhdGZvcm0uDQoNClJlZ2FyZHMsDQpQZW5nLg0K
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0K
