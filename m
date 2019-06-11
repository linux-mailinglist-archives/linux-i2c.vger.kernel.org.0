Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939953CCEC
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 15:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388576AbfFKN2f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 09:28:35 -0400
Received: from mail-eopbgr140089.outbound.protection.outlook.com ([40.107.14.89]:44330
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728901AbfFKN2e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 09:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlbQSzeBPeegRKEyagFHbbCcV/Do7KJkwCxOyExXH84=;
 b=CX5pAIsli1Wr7zpS6svooUrrIyEaPNzDExaFpt2/A+u11QB26IzRULJXRQLQkSuTTc0Pd09jDbul3+b3MxifB33vNdafbRjupSFGV6dWIgaAntm2nys5sJYxhr7C2PCkJjTmg/U/AtDIy1z39xHdhd86V8IvmaP15gPeyCXhM8c=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB6752.eurprd05.prod.outlook.com (10.186.160.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.7; Tue, 11 Jun 2019 13:28:30 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 13:28:29 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        "minyard@acm.org" <minyard@acm.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v12 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v12 1/1] Add support for IPMB driver
Thread-Index: AQHVH75wU/UOB8lBXUaBS/Idjd9IQKaVbvMAgAEEhJA=
Date:   Tue, 11 Jun 2019 13:28:29 +0000
Message-ID: <VI1PR05MB62398E3DADCD067A23BBC53BDAED0@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1560192707.git.Asmaa@mellanox.com>
 <319690553a0da2a1e80b400941341081b383e5f1.1560192707.git.Asmaa@mellanox.com>
 <54f3c0e0-7aaa-9078-5328-50e8f709ebae@infradead.org>
In-Reply-To: <54f3c0e0-7aaa-9078-5328-50e8f709ebae@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 257a4e9c-ed5b-4aa5-37e2-08d6ee70b11c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB6752;
x-ms-traffictypediagnostic: VI1PR05MB6752:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB6752A3C7C47F3DFFF1AA13CEDAED0@VI1PR05MB6752.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(136003)(39860400002)(396003)(13464003)(199004)(189003)(72206003)(478600001)(8676002)(81156014)(4326008)(25786009)(2906002)(81166006)(86362001)(14444005)(256004)(6116002)(3846002)(80792005)(68736007)(966005)(8936002)(2501003)(14454004)(74316002)(53546011)(6506007)(446003)(186003)(305945005)(7736002)(26005)(229853002)(99286004)(102836004)(7696005)(71190400001)(71200400001)(11346002)(6436002)(76176011)(476003)(53936002)(486006)(6306002)(6246003)(55016002)(9686003)(5660300002)(64756008)(66556008)(54906003)(66946007)(66476007)(66066001)(6636002)(66446008)(110136005)(76116006)(52536014)(73956011)(33656002)(2201001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB6752;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tYyrJwJxA4zPHbk/ob/Csw6GI6nuVPTgk5+xT23Wv2fpKBTDe8cKrV1jrERmi8rw7YUeY/XsK6v33LCeVDop45k+ZbbZtbXFy+p9bImOSAwu6K6DoCktAMZPPA9TSZMaEw6yFD4/a+Su9RYbcPqIEfZbv8JRiwXDxaW0JV580uZK8DjBNyIZKtqlp3Lm++WuQLqrmxM3YynaTD4sdaeGUV5RAK4zB5Tu+ho9IPRV4m+yybLp+AUyjjOqbzrV4ONpHNpoJVmo4KRB3nS1Fmiyz7rzxCuQM7bwxSmyjb7VDfaMvCaOIHxWSlstXNIXS9sv2RQoWihjpPCzaCmyVBe6alIvaDO5VS6l/N7/FsoJcTkRJko+ghWRx/z78WOCEjAtW+lZ7kJLOwGF89fY7bZVMmwUU3oRol2Kadty4tlFTqY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257a4e9c-ed5b-4aa5-37e2-08d6ee70b11c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 13:28:29.3159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Asmaa@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6752
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gUmFuZHksDQoNClBsZWFzZSByZWZlciB0byB0aGUgc2xhdmUtaW50ZXJmYWNlIGxpbnV4
IGRvY3VtZW50YXRpb246DQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9u
L2kyYy9zbGF2ZS1pbnRlcmZhY2UNCg0KVGhhbmtzLg0KQXNtYWENCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiAN
ClNlbnQ6IE1vbmRheSwgSnVuZSAxMCwgMjAxOSA1OjU2IFBNDQpUbzogQXNtYWEgTW5lYmhpIDxB
c21hYUBtZWxsYW5veC5jb20+OyBtaW55YXJkQGFjbS5vcmc7IHdzYUB0aGUtZHJlYW1zLmRlOyBW
YWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxsYW5veC5jb20+OyBNaWNoYWVsIFNoeWNoIDxtaWNo
YWVsc2hAbWVsbGFub3guY29tPg0KQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEyIDEvMV0gQWRk
IHN1cHBvcnQgZm9yIElQTUIgZHJpdmVyDQoNCk9uIDYvMTAvMTkgMTE6NTcgQU0sIEFzbWFhIE1u
ZWJoaSB3cm90ZToNCj4gU3VwcG9ydCByZWNlaXZpbmcgSVBNQiByZXF1ZXN0cyBvbiBhIFNhdGVs
bGl0ZSBNQyBmcm9tIHRoZSBCTUMuDQo+IE9uY2UgYSByZXNwb25zZSBpcyByZWFkeSwgdGhpcyBk
cml2ZXIgd2lsbCBzZW5kIGJhY2sgYSByZXNwb25zZSB0byB0aGUgDQo+IEJNQyB2aWEgdGhlIElQ
TUIgY2hhbm5lbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFzbWFhIE1uZWJoaSA8QXNtYWFAbWVs
bGFub3guY29tPg0KPiBBY2tlZC1ieTogdmFkaW1wQG1lbGxhbm94LmNvbQ0KPiAtLS0NCj4gIERv
Y3VtZW50YXRpb24vSVBNQi50eHQgICAgICAgICAgIHwgMTAzICsrKysrKysrKysrDQo+ICBkcml2
ZXJzL2NoYXIvaXBtaS9LY29uZmlnICAgICAgICB8ICAgOCArDQo+ICBkcml2ZXJzL2NoYXIvaXBt
aS9NYWtlZmlsZSAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2NoYXIvaXBtaS9pcG1iX2Rldl9p
bnQuYyB8IDM2NCANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDQ3NiBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9JUE1CLnR4dCAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBkcml2ZXJz
L2NoYXIvaXBtaS9pcG1iX2Rldl9pbnQuYw0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vSVBNQi50eHQgYi9Eb2N1bWVudGF0aW9uL0lQTUIudHh0IG5ldyBmaWxlIA0KPiBtb2RlIDEw
MDY0NCBpbmRleCAwMDAwMDAwLi43MTYwZDUzDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9JUE1CLnR4dA0KPiBAQCAtMCwwICsxLDEwMyBAQA0KDQpbLi4uXQ0KDQo+ICtJ
bnN0YW50aWF0ZSB0aGUgZGV2aWNlDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4g
K0FmdGVyIGxvYWRpbmcgdGhlIGRyaXZlciwgeW91IGNhbiBpbnN0YW50aWF0ZSB0aGUgZGV2aWNl
IGFzIGRlc2NyaWJlZCANCj4gK2luICdEb2N1bWVudGF0aW9uL2kyYy9pbnN0YW50aWF0aW5nLWRl
dmljZXMnLg0KPiArSWYgeW91IGhhdmUgbXVsdGlwbGUgQk1DcywgZWFjaCBjb25uZWN0ZWQgdG8g
eW91ciBTYXRlbGxpdGUgTUMgdmlhIGEgDQo+ICtkaWZmZXJlbnQgSTJDIGJ1cywgeW91IGNhbiBp
bnN0YW50aWF0ZSBhIGRldmljZSBmb3IgZWFjaCBvZiB0aG9zZSANCj4gK0JNQ3MuDQo+ICtUaGUg
bmFtZSBvZiB0aGUgaW5zdGFudGlhdGVkIGRldmljZSBjb250YWlucyB0aGUgSTJDIGJ1cyBudW1i
ZXIgDQo+ICthc3NvY2lhdGVkIHdpdGggaXQgYXMgZm9sbG93czoNCj4gKw0KPiArQk1DMSAtLS0t
LS0gSVBNQi9JMkMgYnVzIDEgLS0tLS0tLS0tfCAgIC9kZXYvaXBtYi0xDQo+ICsJCQkJU2F0ZWxs
aXRlIE1DDQo+ICtCTUMxIC0tLS0tLSBJUE1CL0kyQyBidXMgMiAtLS0tLS0tLS18ICAgL2Rldi9p
cG1iLTINCj4gKw0KPiArRm9yIGluc3RhbmNlLCB5b3UgY2FuIGluc3RhbnRpYXRlIHRoZSBpcG1i
LWRldi1pbnQgZGV2aWNlIGZyb20gdXNlciANCj4gK3NwYWNlIGF0IHRoZSA3IGJpdCBhZGRyZXNz
IDB4MTAgb24gYnVzIDI6DQo+ICsNCj4gKyAgIyBlY2hvIGlwbWItZGV2IDB4MTAxMCA+IC9zeXMv
YnVzL2kyYy9kZXZpY2VzL2kyYy0yL25ld19kZXZpY2UNCg0KVGhpcyBpcyBjb25mdXNpbmcuDQoN
CkNhbiB5b3UgY2xhcmlmeSBob3cgdGhlIDctYml0IGFkZHJlc3MgaXMgZXh0cmFjdGVkIGZyb20g
dGhhdCBoZXggbnVtYmVyPw0KSXMgdGhlIDctYml0IGFkZHJlc3MgcmVwZWF0ZWQgKGR1cGxpY2F0
ZWQpPw0KSXMgdGhlIDctYml0IGFkZHJlc3MgdGhlIGxvdyBvcmRlciAobG93IGJpdHMpIDB4MTAg
b3IgdGhlIDB4MTAgYXQgYml0cw0KMTUtOCAob3IgMTQtOCk/DQoNCj4gK1RoaXMgd2lsbCBjcmVh
dGUgdGhlIGRldmljZSBmaWxlIC9kZXYvaXBtYi0yLCB3aGljaCBjYW4gYmUgYWNjZXNzZWQgDQo+
ICtieSB0aGUgdXNlciBzcGFjZSBwcm9ncmFtLiBUaGUgZGV2aWNlIG5lZWRzIHRvIGJlIGluc3Rh
bnRpYXRlZCBiZWZvcmUgDQo+ICtydW5uaW5nIHRoZSB1c2VyIHNwYWNlIHByb2dyYW0uDQoNCnRo
YW5rcy4NCi0tDQp+UmFuZHkNCg==
