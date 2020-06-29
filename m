Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B3E20D7CA
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 22:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733241AbgF2Tcr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 15:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730925AbgF2Tcp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 15:32:45 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::609])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A51EC02A54C
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jun 2020 05:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQPP+lGOaAlKHu/q2Hv7D54ms923V40Mm/pMlGiRJbmd5Ozr67VH8o8rgTAiQtFeCMx+l1nyxCJp59zXcd/2fo/xdSBsDOlsOE6fHbH3xiEOgsIo2rl46tC5yw/Es4rs5grttY0Kzo1X6S8RHu4AKFSuMV9nAYgUhQbwkAJDNu0R1sFJlw2RXPHHumrJumdsBDvucw/mWJvt1DY2Fj3J0wfvrLwR0n31mj2u3P3UcuOoz0GKD7ehtJ2vUb4Ry6EACi/ixcw4vkdD5xOGvz/YwQn72jG2FJE+fuYnJ7ytl/FK41J9IBliiGQ6zf53UD3bbnH/+/f5kakCdE04FiLRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ns2oI2KJsL+7xH4VmkzsG+1sn2nk+fz8gk4iIz9XI8=;
 b=DTIoPJbatBHDUjZ2yZaAWDHm6Ft2zeWCn+BOIS5kGX0wg4t6ymJLJbvCX7yPq5CGHfcTdW+HUhb3YoCyrosHyWgu0NQ17wntWZ1Ygrm3T2FYoIVjHNvghKmbFFIiFI0xYTQIgOpklODs2ghm5DnDp6IUpVWwjbn/tWolr4AJTvy/9nm/r2+EOfM/qx49Ry+Goz32/O3nASSNS49HvGZpJoRAeJmzcqxqR95zVGFLWhqYZ5B6yegEvNvHdDxD1cjKOHN2b/ACTLVq/lVTUl4vm6ZB8aM1aSxMXTWRuS7cH033AsGQ8aj699O9swoajVfVV6jMsn5KDbGqlUrwn0AjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ns2oI2KJsL+7xH4VmkzsG+1sn2nk+fz8gk4iIz9XI8=;
 b=AgTFDb5FaIUY+0yokzctEvuk8qIizjsVOyJbyDAlhw0XnbrAHzJcdenjna87T+j5+A6mzcfu7kdxxn7dlZlCp6/tHkQWTf+1KvhVVWhPO2DmA5752burwbZwwzuE4y4Xwt+21eT9FmpwPHN+jqLIfVM4XAdWaBM6niLbywGQsIo=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN1PR02MB3808.namprd02.prod.outlook.com
 (2603:10b6:802:31::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 12:53:31 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 12:53:31 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
Thread-Topic: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
Thread-Index: AQHWQZR2qAxmP1sj9UKNsjSFt55DtqjqutlAgAQNNYCAANMWkA==
Date:   Mon, 29 Jun 2020 12:53:31 +0000
Message-ID: <SN4PR0201MB34863D361821EE403530A9CFCA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-4-marex@denx.de>
 <MWHPR0201MB3484AB3D1AB03068D56B18E9CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <a2da37c2-f2b1-d961-81be-4c320f0ddb9a@denx.de>
In-Reply-To: <a2da37c2-f2b1-d961-81be-4c320f0ddb9a@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fd901189-47d5-4a15-3523-08d81c2b6d78
x-ms-traffictypediagnostic: SN1PR02MB3808:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB38089854EFA73A285C89CD3BCA6E0@SN1PR02MB3808.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: og7lyubbrn91Fc1gHanq7gyOWWIuoKlOIcOVyR+yWu7XS4eAeoVUoUxvCmzBI1Omj56HQtgs1X0UW+ZcOTm6WV8eyYHC5NVrSrHdAZR/J7REr0a5uvWQ1wfV9S2fh1AhXyPR4maFYmWyvkaSalb9J4UfESETPnmhrQX5Qo0P7GapgYv10mPIOWvT4mNI+cTdWW5ySC1rbbiUXlad5wSFY9GDLnSkiKLSe8qzGLgybNjfr+3ZhdMnAqXlvzPZ8sB+iad5lUxZgaNHWZyLB6hlL/xP2KfnG/Kjr0P+KHu4D2MeIdRKFk4mxgOpQz1lizeRRl3E+dt59m8BpvwHqM2U3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(8936002)(33656002)(7696005)(4326008)(8676002)(86362001)(2906002)(110136005)(54906003)(316002)(66946007)(66446008)(64756008)(66556008)(53546011)(478600001)(6506007)(66476007)(71200400001)(83380400001)(5660300002)(9686003)(76116006)(55016002)(186003)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9ecNTknoTGx50dNw/EjzkmwO3QGndkwx1hqp2UI940QeUjBcvEFQB7EYJNUcuXUCWc8kZ4B4HLvwEIcizsxcEnY2BNJG4CZELb9MPtg67H4KQKp+ykobDyrWy5X7Do6bpcIn0UFo7yBhKENyDZHURQ+f9frquccT5d7uEVtazcewOwA0d+y76SY0hhstegFDgZ1l7PnXYg4r0sYzst6JJ4TjlusfPVDcgxyxyosmEAzuoQhRFwvLImVft+Jyg98AlOMuA8txMRumQPtVOUJf0c3A79/vZnEwG7hzNsugVGUOTgR1C6bY+VaIFbtV+1a6HiCMn/9BfVlTnHRfxweIjEpJwMQ1h8NbcVRBb05jroFlBNTddIzUw5Jx8jLitYgqF+gpuuZAbiuPZOZzLpE0T6qJYGK905S03IG5wieSuot6KvZ5j72tft0U6kOz2IeBwHOVU23n4ytrOyA6mrBd7Y/ApkkiImHq9Ex/UHEfUs0MCJrCtL7Tjm2qY6BkxNYv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd901189-47d5-4a15-3523-08d81c2b6d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 12:53:31.7281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFN/rQL8b6YvwmCz7r0uTNz9/hB0SQUuT98KrcX8/xW4wsmeQuiy2mZnuBrxx7t9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3808
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyOSwgMjAyMCA1OjExIEFNDQo+IFRv
OiBSYXZpdGVqYSBOYXJheWFuYW0gPHJuYUB4aWxpbnguY29tPjsgbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZw0KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+OyBTaHViaHJh
anlvdGkgRGF0dGENCj4gPHNodWJocmFqQHhpbGlueC5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYUBr
ZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNV0gaTJjOiB4aWljOiBTd2l0Y2gg
ZnJvbSB3YWl0cXVldWUgdG8gY29tcGxldGlvbg0KPiANCj4gT24gNi8yNi8yMCAyOjEzIFBNLCBS
YXZpdGVqYSBOYXJheWFuYW0gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IFsuLi5dDQo+IA0KPiA+
PiBAQCAtNzAzLDIzICs3MDQsMjQgQEAgc3RhdGljIGludCB4aWljX3hmZXIoc3RydWN0IGkyY19h
ZGFwdGVyICphZGFwLA0KPiA+PiBzdHJ1Y3QgaTJjX21zZyAqbXNncywgaW50IG51bSkNCj4gPj4g
IAllcnIgPSB4aWljX3N0YXJ0X3hmZXIoaTJjLCBtc2dzLCBudW0pOw0KPiA+PiAgCWlmIChlcnIg
PCAwKSB7DQo+ID4+ICAJCWRldl9lcnIoYWRhcC0+ZGV2LnBhcmVudCwgIkVycm9yIHhpaWNfc3Rh
cnRfeGZlclxuIik7DQo+ID4+IC0JCWdvdG8gb3V0Ow0KPiA+PiArCQlyZXR1cm4gZXJyOw0KPiA+
PiAgCX0NCj4gPj4NCj4gPj4gLQlpZiAod2FpdF9ldmVudF90aW1lb3V0KGkyYy0+d2FpdCwgKGky
Yy0+c3RhdGUgPT0gU1RBVEVfRVJST1IpIHx8DQo+ID4+IC0JCShpMmMtPnN0YXRlID09IFNUQVRF
X0RPTkUpLCBIWikpIHsNCj4gPj4gLQkJbXV0ZXhfbG9jaygmaTJjLT5sb2NrKTsNCj4gPj4gLQkJ
ZXJyID0gKGkyYy0+c3RhdGUgPT0gU1RBVEVfRE9ORSkgPyBudW0gOiAtRUlPOw0KPiA+PiAtCQln
b3RvIG91dDsNCj4gPj4gLQl9IGVsc2Ugew0KPiA+PiAtCQltdXRleF9sb2NrKCZpMmMtPmxvY2sp
Ow0KPiA+PiArCWVyciA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0
KCZpMmMtPmNvbXBsZXRpb24sDQo+ID4+ICsJCQkJCQkJWElJQ19JMkNfVElNRU9VVCk7DQo+ID4N
Cj4gPiBUaGlzIGlzIGNhdXNpbmcgcmFuZG9tIGxvY2sgdXAgb2YgYnVzLiBTaW5jZSBpdCBpcyAi
aW50ZXJydXB0aWJsZSINCj4gPiBBUEksICBvbmNlIHdlIGVudGVyIEN0cmwrQywgSXQgaXMgY29t
aW5nIG91dCBvZiB3YWl0IHN0YXRlLCB0aGUgbWVzc2FnZQ0KPiBwb2ludGVycyBhcmUgbWFkZSBO
VUxMIGFuZCB0aGUgb25nb2luZyB0cmFuc2FjdGlvbiBpcyBub3QgY29tcGxldGVkLg0KPiA+IENh
biB1c2UgIiB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQiIEFQSSBpbiBwbGFjZSBvZiB0aGlz
Lg0KPiA+DQo+ID4+ICsJbXV0ZXhfbG9jaygmaTJjLT5sb2NrKTsNCj4gDQo+IFNvIGluIGNhc2Ug
dGhpcyBpcyBpbnRlcnJ1cHRlZCwgd2Ugd291bGQgaGF2ZSB0byBzb21laG93IHJlc2V0IHRoZSBj
b250cm9sbGVyID8NCg0KWWVzLCBidXQgdGhlIGNsZWFudXAgaXMgbm90IHN0cmFpZ2h0IGZvcndh
cmQgYmVjYXVzZSB3ZSBkbyBub3Qga25vdyB0aGUgZXhhY3Qgc3RhdGUNCk9mIGNvbnRyb2xsZXIg
YW5kIHRoZSBJMkMgYnVzLiBUaGF04oCZcyB3aHkgcHJlZmVycmluZyBhIG5vbi1pbnRlcnJ1cHRp
YmxlIEFQSS4NCg0KPiBXaGF0IHNvcnQgb2YgbG9ja3VwcyBkbyB5b3Ugc2VlIGV4YWN0bHkgPyAN
Cg0KVGhlcmUgaXMgYW4gaTJjdHJhbnNmZXIgZ29pbmcgb24gKGxldCdzIHNheSBhIHJlYWQgb2Yg
MjU1IGJ5dGVzKSwgd2UgZ2V0IGludGVycnVwdCBldmVyeXRpbWUgdGhlIFJ4IEZJRk8gaXMgZnVs
bC4NCldoaWxlIHRoZSBjb250cm9sbGVyIGlzIHJlY2VpdmluZyBkYXRhLCBpZiB0aGVyZSBpcyBh
IHNpZ25hbCwgdGhpcyBpcyBleGl0aW5nIGFicnVwdGx5IGFuZCB0aGVyZSBpcyBubyBTVE9QIGNv
bmRpdGlvbg0Kb24gdGhlIGJ1cy4gU28sIG5vIG1hc3RlciBjYW4gY29tbXVuaWNhdGUgb24gdGhh
dCBidXMgZnVydGhlci4gDQoNCkNhbiB5b3Ugc2hhcmUgc29tZSBzb3J0IG9mIHRlc3QgY2FzZSwN
Cj4gc28gSSBjYW4gcmVwbGljYXRlIGl0ID8NCg0KSSBoYXZlIDMgc2NyaXB0cyBydW5uaW5nIHdp
dGggY29tbWFuZHMgbGlrZSBiZWxvdywgYW5kIEkgYW0gcmFuZG9tbHkgZ2l2aW5nIEN0cmwrQy4N
Cg0KaT0wDQp3aGlsZSBbIDEgXQ0KZG8NCgkJaTJjdHJhbnNmZXIgLXkgLWYgMCB3MUAwWDU0IDBY
MDAgcjI1NUAwWDU0DQoJCWk9JChleHByICRpICsgMSkNCiAgICAgICAgZWNobyAiJGkiDQpkb25l
DQoNCj4gDQo+IFRoYW5rcw0KPiANCj4gWy4uLl0NCg0KUmF2aXRlamEgTg0K
