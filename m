Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4821517B040
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 22:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgCEVGC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 16:06:02 -0500
Received: from mail-eopbgr40139.outbound.protection.outlook.com ([40.107.4.139]:17582
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726067AbgCEVGC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 16:06:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G58LJzYdc3j4K1i4KLABgjoC4iQNv4tTr8crO5mk7CrsR2mXB6mRhdVLAFLrhF0X0YlNxWS/QyIcc1IRTZ8z6WkfHDaOh7vqanLw5LP3eV0Om4gA1pJYSpiiLTv4o6lQ3G6DK7XNKxOtr7ZPaEt2s5c7wsVozOMfkHa5dPRjAzD9wpMS63Xo33QLcpkV1sPkeau2O6cwt13Ngnb7y7vRPsRUBTvSiguyyr4N7CqmFETePiQFpFzaFNT5UBcgenfzI4Lmwe3DpqgXxNeGfzMGBO+b2fNvqm70sWn2HEkPrlaj498r102gA+uz5q8lrD7p1MVPcrBP0Xl7S4JP9HADWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THiVUQg7XZ4gTeXZXmdPJ3/Pxyd/XlYmgjkw5mFLJmQ=;
 b=fxmkRVSjiGjViInnG5sl3H0ilsgX5hd+Wza9UCLHEF2OcMYj8TaYKQfPoYPlWTpqZMaE3Htil9OJD9H+uUWS6Xt1wd5dUwEqKjrxOBS6zdP6nsObRpzlq6L5sZEcM4P86BIuAoCRrnP8G39IGcoNJBoIly+LHR1Do7XbtlwzyDzby5wZaSl8/7UbTPBbzSgQH/rH9TMicVMvmI+Dm0hzoC3bAXCZMclOcT83w9UnTAR7E9zOnaDFbB0Yovz220PXt4SRY8s2r/3AJ65bweQcmnkUPsbNciI2bqOabAFo9RWr1ZWGLUpYEUN+aWFlrmQBUPjQ+bP+nPfGidGCG6GBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THiVUQg7XZ4gTeXZXmdPJ3/Pxyd/XlYmgjkw5mFLJmQ=;
 b=IuXKRhXBiI9RoAPuepcwoaqZtb0VuItbRaGFJ3pxeI8k/RFCagtJ61vvxqH5lOX4Jcj+lOiQCJG34ZOrMqT4ZYAmdOqhLlx9kBZuXn3TEaN+vhTXTOyrW/9lXfcgcLFYAnWKGxcXLbJ2vsEObUIfkMN2bCvNSAHUpTpjEbF4nrU=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3384.eurprd02.prod.outlook.com (52.133.10.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Thu, 5 Mar 2020 21:05:56 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71%7]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 21:05:56 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR08CA0075.eurprd08.prod.outlook.com (2603:10a6:7:2a::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.11 via Frontend Transport; Thu, 5 Mar 2020 21:05:56 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 2/5] i2c: mux: pca954x: Make use of device properties
Thread-Topic: [PATCH v1 2/5] i2c: mux: pca954x: Make use of device properties
Thread-Index: AQHV8wZIx6+mWbGX1kKODLx1mUS/Dqg6faUA
Date:   Thu, 5 Mar 2020 21:05:56 +0000
Message-ID: <cf0cf14f-4e43-2a9c-63ed-f5f03ea7b114@axentia.se>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200305155352.39095-2-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR08CA0075.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::46) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a68c2c4f-3f01-4adb-9885-08d7c148ff67
x-ms-traffictypediagnostic: AM6PR0202MB3384:
x-microsoft-antispam-prvs: <AM6PR0202MB3384E9746AF6E9476F26232DBCE20@AM6PR0202MB3384.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(39830400003)(366004)(376002)(189003)(199004)(66476007)(16526019)(66946007)(66446008)(5660300002)(8936002)(66556008)(64756008)(8676002)(316002)(86362001)(16576012)(53546011)(26005)(956004)(110136005)(71200400001)(6486002)(2906002)(36756003)(2616005)(508600001)(81156014)(81166006)(31696002)(52116002)(31686004)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3384;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /7lou944GZnX4kJmCMF2BZb2ue6rs8yA1XNnIXK5VzU/dGe+7CD/XDzM+aWSLH5nK9ON5cjqPtaBuUdX49qySUCj+rMu2TvxVf7WOTZ+FZcC6pmosWTZQ/7d0P/3LTaEf0m+c+pRoDa38n8OyLfMesUpMS0XLiOeKHaFoj0yNxnCgXPo8oWAodGai90Cbibglwiuo0w70JDWwJf4xTJe9pCdLqdW5w9bgXonmVfNfsToywWezgNgg9hI34HbUSWyjSjyfgfGMQsIcGZkZm0iFV0Rbb3BoqSJssSoJyCfMPMfir/aw34L5iOZuNK5fQghzY+Gmz/lNGxDyjI0Hfh0CiA7p91PU7k/nhZw2LBxaQ4K+5AgrAUPf6bCUTN5Z6URkhKxXYQ0rhnDu7xONThDT9Ro62vK4uaDrD0noF0y5RzZk01HacwPNKHUFlorvj/z
x-ms-exchange-antispam-messagedata: j7yK/Fl+aualjkl7kNRMnGllErq7WI63LozpVCCtkRCammFTC7ctAP08QJsbxZTLsawC3YQwSbDVPmJ5ro+3emCyRvHuPeKtvMBdB3tvoH64eoUm8TDp/YmvNRsIzSCqTX8opS0erSxyz1RI6sLhzQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB9FC9A50BA9AB4C9E74A00B8BB95721@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a68c2c4f-3f01-4adb-9885-08d7c148ff67
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 21:05:56.6038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /euwDp2yscDSzeQYAvLZDX/piErhQP2eYtdHMpNfOmeOfRS79AJUAAvm6CiIx7wm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3384
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNCk9uIDIwMjAtMDMtMDUgMTY6NTMsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gRGV2
aWNlIHByb3BlcnR5IEFQSSBhbGxvd3MgdG8gZ2F0aGVyIGRldmljZSByZXNvdXJjZXMgZnJvbSBk
aWZmZXJlbnQgc291cmNlcywNCj4gc3VjaCBhcyBBQ1BJLiBDb252ZXJ0IHRoZSBkcml2ZXJzIHRv
IHVubGVhc2ggdGhlIHBvd2VyIG9mIGRldmljZSBwcm9wZXJ0eSBBUEkuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYyB8IDM5ICsr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMv
bXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1
NHguYw0KPiBpbmRleCA4MTlmZjk1ZTY0YmEuLjJlNDJhMTEzZWYxZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMv
bXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4gQEAgLTQzLDEwICs0Myw4IEBADQo+ICAjaW5jbHVk
ZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+DQo+IC0jaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gLSNpbmNs
dWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gLSNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4g
ICNpbmNsdWRlIDxsaW51eC9wbS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+
ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+
DQo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbXV4L211eC5oPg0KPiBAQCAtMTgyLDIzICsxODAs
MjIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjaGlwX2Rlc2MgY2hpcHNbXSA9IHsNCj4gIH07DQo+
ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBwY2E5NTR4X2lkW10gPSB7
DQo+IC0JeyAicGNhOTU0MCIsIHBjYV85NTQwIH0sDQo+IC0JeyAicGNhOTU0MiIsIHBjYV85NTQy
IH0sDQo+IC0JeyAicGNhOTU0MyIsIHBjYV85NTQzIH0sDQo+IC0JeyAicGNhOTU0NCIsIHBjYV85
NTQ0IH0sDQo+IC0JeyAicGNhOTU0NSIsIHBjYV85NTQ1IH0sDQo+IC0JeyAicGNhOTU0NiIsIHBj
YV85NTQ2IH0sDQo+IC0JeyAicGNhOTU0NyIsIHBjYV85NTQ3IH0sDQo+IC0JeyAicGNhOTU0OCIs
IHBjYV85NTQ4IH0sDQo+IC0JeyAicGNhOTg0NiIsIHBjYV85ODQ2IH0sDQo+IC0JeyAicGNhOTg0
NyIsIHBjYV85ODQ3IH0sDQo+IC0JeyAicGNhOTg0OCIsIHBjYV85ODQ4IH0sDQo+IC0JeyAicGNh
OTg0OSIsIHBjYV85ODQ5IH0sDQo+ICsJeyAicGNhOTU0MCIsIC5kcml2ZXJfZGF0YSA9IChrZXJu
ZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk1NDBdIH0sDQo+ICsJeyAicGNhOTU0MiIsIC5kcml2ZXJf
ZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk1NDJdIH0sDQo+ICsJeyAicGNhOTU0
MyIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk1NDNdIH0sDQo+
ICsJeyAicGNhOTU0NCIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNh
Xzk1NDRdIH0sDQo+ICsJeyAicGNhOTU0NSIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdf
dCkmY2hpcHNbcGNhXzk1NDVdIH0sDQo+ICsJeyAicGNhOTU0NiIsIC5kcml2ZXJfZGF0YSA9IChr
ZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk1NDZdIH0sDQo+ICsJeyAicGNhOTU0NyIsIC5kcml2
ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk1NDddIH0sDQo+ICsJeyAicGNh
OTU0OCIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk1NDhdIH0s
DQo+ICsJeyAicGNhOTg0NiIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNb
cGNhXzk4NDZdIH0sDQo+ICsJeyAicGNhOTg0NyIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxv
bmdfdCkmY2hpcHNbcGNhXzk4NDddIH0sDQo+ICsJeyAicGNhOTg0OCIsIC5kcml2ZXJfZGF0YSA9
IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk4NDhdIH0sDQo+ICsJeyAicGNhOTg0OSIsIC5k
cml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNbcGNhXzk4NDldIH0sDQoNCkl0IGZl
ZWxzIG9kZC93cm9uZyB0byBzcGVjaWZpY2FsbHkgbmFtZSAuZHJpdmVyX2RhdGEgd2hlbiAubmFt
ZSBpcyBub3QgdGhlcmUuDQpOb25lIG9yIGJvdGguLi4NCg0KPiAgCXsgfQ0KPiAgfTsNCj4gIE1P
RFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBwY2E5NTR4X2lkKTsNCj4gIA0KPiAtI2lmZGVmIENPTkZJ
R19PRg0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGNhOTU0eF9vZl9tYXRj
aFtdID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAibnhwLHBjYTk1NDAiLCAuZGF0YSA9ICZjaGlw
c1twY2FfOTU0MF0gfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gIm54cCxwY2E5NTQyIiwgLmRhdGEg
PSAmY2hpcHNbcGNhXzk1NDJdIH0sDQo+IEBAIC0yMTUsNyArMjEyLDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGNhOTU0eF9vZl9tYXRjaFtdID0gew0KPiAgCXt9DQo+ICB9
Ow0KPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcGNhOTU0eF9vZl9tYXRjaCk7DQo+IC0jZW5k
aWYNCj4gIA0KPiAgLyogV3JpdGUgdG8gbXV4IHJlZ2lzdGVyLiBEb24ndCB1c2UgaTJjX3RyYW5z
ZmVyKCkvaTJjX3NtYnVzX3hmZXIoKQ0KPiAgICAgZm9yIHRoaXMgYXMgdGhleSB3aWxsIHRyeSB0
byBsb2NrIGFkYXB0ZXIgYSBzZWNvbmQgdGltZSAqLw0KPiBAQCAtNDI2LDcgKzQyMiw2IEBAIHN0
YXRpYyBpbnQgcGNhOTU0eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAgew0K
PiAgCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCA9IGNsaWVudC0+YWRhcHRlcjsNCj4gIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpu
cCA9IGRldi0+b2Zfbm9kZTsNCj4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvOw0KPiAgCXN0cnVj
dCBpMmNfbXV4X2NvcmUgKm11eGM7DQo+ICAJc3RydWN0IHBjYTk1NHggKmRhdGE7DQo+IEBAIC00
NTYsNyArNDUxLDcgQEAgc3RhdGljIGludCBwY2E5NTR4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQsDQo+ICAJCXVkZWxheSgxKTsNCj4gIAl9DQo+ICANCj4gLQlkYXRhLT5jaGlwID0g
b2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ICsJZGF0YS0+Y2hpcCA9IGRldmljZV9n
ZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiAgCWlmICghZGF0YS0+Y2hpcCkNCj4gIAkJZGF0YS0+Y2hp
cCA9ICZjaGlwc1tpZC0+ZHJpdmVyX2RhdGFdOw0KDQpUaGVzZSB0d28gbGluZXMgbm8gbG9uZ2Vy
IG1ha2UgYW55IHNlbmNlLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICANCj4gQEAgLTQ3OCw4ICs0
NzMsOCBAQCBzdGF0aWMgaW50IHBjYTk1NHhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCwNCj4gIAl9DQo+ICANCj4gIAlkYXRhLT5pZGxlX3N0YXRlID0gTVVYX0lETEVfQVNfSVM7DQo+
IC0JaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiaWRsZS1zdGF0ZSIsICZkYXRhLT5pZGxl
X3N0YXRlKSkgew0KPiAtCQlpZiAobnAgJiYgb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaTJj
LW11eC1pZGxlLWRpc2Nvbm5lY3QiKSkNCj4gKwlpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMy
KGRldiwgImlkbGUtc3RhdGUiLCAmZGF0YS0+aWRsZV9zdGF0ZSkpIHsNCj4gKwkJaWYgKGRldmlj
ZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QiKSkNCj4g
IAkJCWRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9ESVNDT05ORUNUOw0KPiAgCX0NCj4gIA0K
PiBAQCAtNTYyLDcgKzU1Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBwY2E5NTR4X2Ry
aXZlciA9IHsNCj4gIAkuZHJpdmVyCQk9IHsNCj4gIAkJLm5hbWUJPSAicGNhOTU0eCIsDQo+ICAJ
CS5wbQk9ICZwY2E5NTR4X3BtLA0KPiAtCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIo
cGNhOTU0eF9vZl9tYXRjaCksDQo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IHBjYTk1NHhfb2ZfbWF0
Y2gsDQo+ICAJfSwNCj4gIAkucHJvYmUJCT0gcGNhOTU0eF9wcm9iZSwNCj4gIAkucmVtb3ZlCQk9
IHBjYTk1NHhfcmVtb3ZlLA0KPiANCg==
