Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E166D17B087
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 22:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgCEVTt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 16:19:49 -0500
Received: from mail-eopbgr20134.outbound.protection.outlook.com ([40.107.2.134]:32263
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726067AbgCEVTs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 16:19:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOqY0dGOMZjz0qA3z4dB8/I98VJXCR9sxDxjkyLhosv8xVpYOxm3sMdJEaDW86M20fGZ7d7/gkvhMbh7Og/2W+GEGHLxwZZNsNN4JIAl3HpMpt5YkYX184azLJ+dIXT8Dre+JUBHNlmulECHN+fzGppuPUIdPTiTd6L17xvxWQhrnlb61UIBCqnKO7CYD1w+7uRQ87zurpJFXxSBRgPTamGUL6nj3PtFBU1E31YulLi8wqcqWtfbI01Jeqec99qPY3a4jsTovJ73ANJxI06Or5mCOQ6ktO3vL7QUwX1Ebe2CH+DtqmJ6Ce4LmkYhZr0sY2eoJUdeXOg/1hM2IhharA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBNhY3qMFnZEMDwg62rwUq5foE3gJEfZsBwdhYSqu2E=;
 b=CVrY2RAbweJfkyflL3eyb49Av1ystbo6adUJa+UCOjuJmlX6m64OuPn6X8s/7sK027Ji02oSF9GuDpsVhdUNv/vjWO0IQpIROzFuMi1cD3Ziw5OGQBFtzuGkn8huAGR/Nacv1JBOOeKTmGBfZzyAGMo4ugBMNSL7uf1F/75JYIsJ/+zwXO8kWGJSdScbDdbjYU7E/zFMSzLEQ9AymY/vuILazknxyzm1xS/BH4qoDtMFuOTLKFg4JVcN388vJHIJIhXUl3Dqy9eTU5VajPh6q4IoizMLL1eFdBoWtiHpuff6r/GhyTdGxe+hK0QNV2Tg/ouWO+9USn5bBVRMslE1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBNhY3qMFnZEMDwg62rwUq5foE3gJEfZsBwdhYSqu2E=;
 b=QI+SVpT8DTUp/pTfWmcJ1LpQIGRXfpZwDD1cLsDbSdtoX+G1Bf1yykcoJfHmnoQd1APLB6luvNtxx8Rn0C5A2twFd4gSORzY8Q6uc8ZepikRe+ZCTUoVm8QgmMhwpt1SsrdNV7tWJcFRoPHkyMfS1plOWENVVsiyAVsnf/RUiWs=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3302.eurprd02.prod.outlook.com (52.133.29.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19; Thu, 5 Mar 2020 21:19:05 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71%7]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 21:19:05 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR0402CA0009.eurprd04.prod.outlook.com (2603:10a6:3:d0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Thu, 5 Mar 2020 21:19:04 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/5] i2c: mux: pca954x: Drop useless validation for
 optional GPIO descriptor
Thread-Topic: [PATCH v1 3/5] i2c: mux: pca954x: Drop useless validation for
 optional GPIO descriptor
Thread-Index: AQHV8wZI7S5uuW1p+0GY/w6JQSSqyag6gVKA
Date:   Thu, 5 Mar 2020 21:19:05 +0000
Message-ID: <3a0bd56d-0efb-e1cf-c050-05deefc4433a@axentia.se>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200305155352.39095-3-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::19) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30186d31-0ed0-40ac-a492-08d7c14ad580
x-ms-traffictypediagnostic: AM6PR0202MB3302:
x-microsoft-antispam-prvs: <AM6PR0202MB330244ABE264E76E12F97499BCE20@AM6PR0202MB3302.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(39830400003)(376002)(136003)(189003)(199004)(26005)(8936002)(16576012)(508600001)(8676002)(16526019)(186003)(86362001)(316002)(31686004)(2906002)(81156014)(81166006)(66476007)(31696002)(64756008)(110136005)(66946007)(66556008)(66446008)(71200400001)(36756003)(6486002)(2616005)(5660300002)(52116002)(53546011)(956004);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3302;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VmnX/Rbnd51uqHxwI9BnVVCJ+PEGBLojNKrBF2unFeBhrf8Yl7o9FbBeyyPAKXRuT7zxySla/Zbg1FOJxq2H1nZc+EbHuAVZe/xni9Sbfah8ryBAt5JZhxOP5o6XscRxELbIS0Di+C/aPfWypJEx454dInWUdF3rjF/nH6JfmX6wxmnODWanVJOZ18hP2BcN0gtn1iefApCahFTy60Ix2GL40hkUT6AWdmxsLmG7Yz4wJOOZW9X/wnY4GAzmVHVvPVGP3aCaOKFX6n5Z9vHt++xZDlxlx31U/hR89JfR9V/Yk6tDZhKQABgfmpH0iBZRfkK/PQgc9a7Q8SIDtb9dmRpgGHjmNQT8N9hVpK0sD87cFcPl5ulWZmdfge5EHxUi2Z8JstXIqGBUL3ifwcNkf6JdMkMutQ7OtkBRdkfZel4UrYYxsXJm/hawbKs1eCFw
x-ms-exchange-antispam-messagedata: Wd6MVArRj8KHVRvlnmdxy88T0yA6+hOOntsSx5DMcelp3r/W5a/TyDGqmr//K12+MvhCHCY1IpZoE+xtOK5tlOyJsXIyOr3nJMYuwHn/0nmJdunUp03LNtzspMzkXI3CPRxexx262i5y1AMV290bWQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C560ACA9EAA958458AE9FD1D74E14D65@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 30186d31-0ed0-40ac-a492-08d7c14ad580
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 21:19:05.1622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rurqvFMi5/VGPPcSa9pTXHEEKvDFpMCQcY2hDhM930PJ3WmA8QgFC4SudZ4qnUl/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3302
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNCk9uIDIwMjAtMDMtMDUgMTY6NTMsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gVGhl
cmUgaXMgbm8gbmVlZCB0byBwZXJmb3JtIGEgY2hlY2sgZm9yIG9wdGlvbmFsIEdQSU8gZGVzY3Jp
cHRvci4NCj4gSWYgaXQncyBOVUxMLCB0aGUgQVBJIGNhbiBoYW5kbGUgaXQgY29ycmVjdGx5Lg0K
DQpCdXQsIHRoZSByZW1vdmVkIHRlc3QgaXMgbm90IG9ubHkgKG5lZWRsZXNzbHkpIHByb3RlY3Rp
bmcgdGhlIG9wdGlvbmFsDQpkZXNjcmlwdG9yLCBpdCBhbHNvIHNob3J0Y3V0cyB0aGUgdWRlbGF5
cy4gSSB0aGluayBpdCBpcyB2YWxpZCB0bw0Kc2tpcCB0aG9zZSBwb2ludGxlc3MgdWRlbGF5cyB3
aGVuIG5vIHJlc2V0IGlzIGhhcHBlbmluZyBhbnl3YXkuIE5vdA0KdGhhdCBpdCBtYXR0ZXJzIGFs
bCB0aGF0IG11Y2ggd2hlbiB0aGUgZGVsYXlzIGFyZSBhcyBzaG9ydCBhcyB0aGlzLCBidXQNCkkg
c2ltcGx5IHRoaW5rIGl0IGxvb2tzIHNlbnNpYmxlIHRvIHNraXAgdGhlIGRlbGF5cyB3aGVuIHRo
YXQgYXJlIG5vdA0KbmVlZGVkLg0KDQpTbywgSSBkbyBub3QgdGhpbmsgdGhpcyBjaGFuZ2UgaXMg
YW4gaW1wcm92ZW1lbnQuDQoNCkNoZWVycywNClBldGVyDQoNCj4gU2lnbmVkLW9mZi1ieTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgfCAxMiArKysrKystLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgYi9kcml2
ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiBpbmRleCAyZTQyYTExM2VmMWYuLmZl
NDMyMGZjMGI5MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5
NTR4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4gQEAg
LTQ0NCwxMiArNDQ0LDEyIEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LA0KPiAgCWdwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJy
ZXNldCIsIEdQSU9EX09VVF9ISUdIKTsNCj4gIAlpZiAoSVNfRVJSKGdwaW8pKQ0KPiAgCQlyZXR1
cm4gUFRSX0VSUihncGlvKTsNCj4gLQlpZiAoZ3Bpbykgew0KPiAtCQl1ZGVsYXkoMSk7DQo+IC0J
CWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChncGlvLCAwKTsNCj4gLQkJLyogR2l2ZSB0aGUgY2hp
cCBzb21lIHRpbWUgdG8gcmVjb3Zlci4gKi8NCj4gLQkJdWRlbGF5KDEpOw0KPiAtCX0NCj4gKw0K
PiArCS8qIFJlc2V0IHRoZSBtdWx0aXBsZXhlciAqLw0KPiArCXVkZWxheSgxKTsNCj4gKwlncGlv
ZF9zZXRfdmFsdWVfY2Fuc2xlZXAoZ3BpbywgMCk7DQo+ICsJLyogR2l2ZSB0aGUgY2hpcCBzb21l
IHRpbWUgdG8gcmVjb3Zlci4gKi8NCj4gKwl1ZGVsYXkoMSk7DQo+ICANCj4gIAlkYXRhLT5jaGlw
ID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ICAJaWYgKCFkYXRhLT5jaGlwKQ0KPiAN
Cg==
