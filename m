Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D5B20D7F4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 22:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732391AbgF2TeV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 15:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733216AbgF2Tcm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 15:32:42 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD6FC02A54A
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jun 2020 05:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMg576Ee7KnD78kTvwXtp4/Wkv2ddMElNUjgTi0a8tTKYKG/UBnDAOr/I0Ek9d0e1Z2bl0H6AvyvOONaf5oflYjZbQtgbkX3UCerFwhsSKxHtL55R8ESIjmOk6iFP2ZdLUE3lwMKhOAv8orQr11fF2nuWs8gX1eQyOdO0WIZPiAXtNwrR4Vlsw5Ursebznl9E8XOEca8yOfJd6cgzPTYlDN1mNyCMc+0YqatDm0LUmrwK7PF+k0Dm+b85VREBTFKC1Csk7JoJ34GSTr9LPUvNotUTCIJ0xhxi4+vfjnMZZXaHvjNx4df5bpBLtFbFw6aIhFBEBU2UP3Njgps+tQbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZjLZz3TomU2MRGpZKZS3Ijm0FeOK9rVnJeQ/RPqYEw=;
 b=XkhhB148wrmG755BMSqq2z9MbPOUhtmk6yDj6VKB+s0rKsflFIczsqiV6fXj10bqCwOrooWb4KzukvowGhcHuBm1saXEQ+mGxTYNFP0CJJgzrZh6WBMhWVxFSQygAA+80gkL4xLHsZB6xGECTSc78sukfa+kaMxq+zSbA0l5MJSpRmtMY2kaSQfCAQyO5DNspF5gLjv7dWFmPKrYrdgYs/PI67+mUqwxrRVlhnC4IxWPBYJamkuj2q+IBEiBBAFNSkv4BoEk3iJzWxgcYrx3ZVXipYbd7NHuiVwGDOGfdyzn3C0RW4RS9StlRqfRtdmc40mKqosKzgjInpQ/TzSDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZjLZz3TomU2MRGpZKZS3Ijm0FeOK9rVnJeQ/RPqYEw=;
 b=Az5JfDiLeomr9lgdIqx4Wd3W48he4/rpDtQxDXE3xYeVPGuOSzv+UzkEQRX43kJfZVodF+K7rsI3Kg5xJalDKgJ0tyqdGSakrG3YG1w6rlOBnqeIfrJ6ksDSh3ZGYxjnHpaYlYbqlUu2GGJshQnGM7NsSZ9FT+3sKNtrLfjUZhQ=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN1PR02MB3808.namprd02.prod.outlook.com
 (2603:10b6:802:31::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 12:52:48 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 12:52:48 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Topic: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Index: AQHWQZR25/MIEeDZnk+rxvX2lvEMMajqhKAAgARDa4CAAMwAgA==
Date:   Mon, 29 Jun 2020 12:52:48 +0000
Message-ID: <SN4PR0201MB348615BCD7E2C82DF7919303CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
In-Reply-To: <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
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
x-ms-office365-filtering-correlation-id: 868411f2-e494-401b-cbd9-08d81c2b5382
x-ms-traffictypediagnostic: SN1PR02MB3808:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB3808A2F236F5E9B0FEC5FAC5CA6E0@SN1PR02MB3808.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /y9ppOyX1x2LQgzX+2drCyJNElmhggkFIDWk83veJgFd+Cwzhc869tgFHACMp8KTwH+M14jfHFMnz8vqAgHvWlBJCr8o3ETqcR4nqh+mWCq1diLYOdRua5B2pufGA/fpdQf8hQbkYB+/Pk8C7HZnZa95xvakQcSiN/+M3I/F3jC1S0Vf2E70Xu+g4/8vJvQKlgSfORxG/zWKr2IfAw00QrLXb8bE4rkBN3Vn3aYPyCe7uFnQ0LWGy1ozePQHqEiqND8PbxRwfchbVuOtWoBWqzGjs47H1GcGu/r/o1+Bt79RqxFa/jMpLJRwKVtj38eviDww0g5EmHheqzx012Omlg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(8936002)(33656002)(7696005)(4326008)(8676002)(86362001)(2906002)(110136005)(54906003)(316002)(66946007)(66446008)(64756008)(66556008)(53546011)(478600001)(6506007)(66476007)(71200400001)(83380400001)(5660300002)(9686003)(76116006)(55016002)(186003)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: a95yxGjTjDQBcoUuPtyoX6wgcTddseTC/de6SvS8hb2TeomE99HixqeCGX45eezYLV2lRuBZH9RzosYtkGdI7JAt9v6g08DkLGt88Gy5e9C6wMbsnnL3g0dM7XeKREM1cbX/biK8fRiRq0iJ/w3VU3Fsc6sLCjr/fYaw3WS+0CSP8/ZM7hN9/qpxBHl8jBPbp1TBI+l2wVcFcsDxvEXzfs9Qejjtd6kwwjVRnxyZIcpk88ljqUWHy8vGEQ8ju4Pt+SDi5xl9byT2+HrClABsOpyRoY1RtooNp+muNpOazk+Nq/SieKM74p/pMQhHNzVEru7u9PJhW+/JFPFeAJ6KsKYjgEIgpx44+JChjcQVxAgWhh3QnzgRvsZOnnp+tUkCtrQwjk35kIR2mJ3hODDFO/uykIJprlvuN9z0gTyEjsruB8qMRtiqponP813tEd+ENLvbp5+cHuJUrev11Q27qi/Fhfqiab61rbHfKlOVPdzCWZvrFo36SzoY8fk9EvHJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868411f2-e494-401b-cbd9-08d81c2b5382
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 12:52:48.2317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KkE3bJhLETeLQp/lYMOXkxtWGr+PqgMMLnb5tCv8YxxQsw2lyyVxCOFbmSnep8u
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
ZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gaTJjOiB4aWljOiBEcm9wIGJy
b2tlbiBpbnRlcnJ1cHQgaGFuZGxlcg0KPiANCj4gT24gNi8yNi8yMCAyOjEzIFBNLCBSYXZpdGVq
YSBOYXJheWFuYW0gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IFsuLi5dDQo+IA0KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMNCj4gPj4gYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXhpaWMuYyBpbmRleA0KPiA+PiAwNzc3ZTU3NzcyMGRiLi42ZGI3MWMwZmI2
NTgzIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0KPiA+
PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0KPiA+PiBAQCAtNTQzLDcgKzU0
Myw2IEBAIHN0YXRpYyB2b2lkIHhpaWNfc3RhcnRfcmVjdihzdHJ1Y3QgeGlpY19pMmMgKmkyYykg
IHsNCj4gPj4gIAl1OCByeF93YXRlcm1hcms7DQo+ID4+ICAJc3RydWN0IGkyY19tc2cgKm1zZyA9
IGkyYy0+cnhfbXNnID0gaTJjLT50eF9tc2c7DQo+ID4+IC0JdW5zaWduZWQgbG9uZyBmbGFnczsN
Cj4gPj4NCj4gPj4gIAkvKiBDbGVhciBhbmQgZW5hYmxlIFJ4IGZ1bGwgaW50ZXJydXB0LiAqLw0K
PiA+PiAgCXhpaWNfaXJxX2Nscl9lbihpMmMsIFhJSUNfSU5UUl9SWF9GVUxMX01BU0sgfA0KPiA+
PiBYSUlDX0lOVFJfVFhfRVJST1JfTUFTSyk7IEBAIC01NTksNyArNTU4LDYgQEAgc3RhdGljIHZv
aWQNCj4gPj4geGlpY19zdGFydF9yZWN2KHN0cnVjdCB4aWljX2kyYyAqaTJjKQ0KPiA+PiAgCQly
eF93YXRlcm1hcmsgPSBJSUNfUlhfRklGT19ERVBUSDsNCj4gPj4gIAl4aWljX3NldHJlZzgoaTJj
LCBYSUlDX1JGRF9SRUdfT0ZGU0VULCByeF93YXRlcm1hcmsgLSAxKTsNCj4gPj4NCj4gPj4gLQls
b2NhbF9pcnFfc2F2ZShmbGFncyk7DQo+ID4NCj4gPiBJdCBpcyBhZGRlZCBhcyBwYXJ0IG9mIChp
MmM6IHhpaWM6IE1ha2UgdGhlIHN0YXJ0IGFuZCB0aGUgYnl0ZSBjb3VudA0KPiA+IHdyaXRlIGF0
b21pYyAtIGFlNzMwNGMzZWEyOGEzYmE0N2E3YTgzMTJjNzZjNjU0ZWYyNDk2N2UpIGNvbW1pdCB0
bw0KPiBtYWtlIHRoZSBiZWxvdyAyIHJlZ2lzdGVyIHdyaXRlcyBhdG9taWMgc28gdGhhdCB0aGUg
Y29udHJvbGxlciBkb2Vzbid0IHByb2R1Y2UNCj4gYSB3cm9uZyB0cmFuc2FjdGlvbi4NCj4gDQo+
IFR3byBjb25zZWN1dGl2ZSByZWdpc3RlciB3cml0ZXMgYXJlIG5vdCBhdG9taWMsIHRoZXkgYXJl
IHBvc3RlZCBhcyB0d28NCj4gY29uc2VjdXRpdmUgd3JpdGVzIG9uIHRoZSBidXMgYW5kIHdpbGwg
cmVhY2ggdGhlIGhhcmR3YXJlIElQIGFzIHR3byBzZXBhcmF0ZQ0KPiB3cml0ZXMgd2l0aCBhcmJp
dHJhcnkgZGVsYXkgYmV0d2VlbiB0aGVtLg0KPiANCj4gSSB0aGluayB0aGUgaW50ZW50aW9uIG9m
IHRoZSBwYXRjaCBhZTczMDRjM2VhMjggKCJpMmM6IHhpaWM6IE1ha2UgdGhlIHN0YXJ0IGFuZA0K
PiB0aGUgYnl0ZSBjb3VudCB3cml0ZSBhdG9taWMiKSBpcyB0byBtYWtlIHN1cmUgdGhhdCB0aGVy
ZSB3aWxsIGJlIG5vIHJlYWQvd3JpdGUNCj4gcmVnaXN0ZXIgYWNjZXNzIHRvIHRoZSBYSUlDIElQ
IHdoaWxlIHRob3NlIHJlZ2lzdGVycyBpbg0KPiBsb2NhbF9pcnFfc2F2ZSgpL2xvY2FsX2lycV9y
ZXN0b3JlKCkgYmxvY2sgYXJlIHdyaXR0ZW4sIGFuZCB0aGF0IG1ha2VzIHNlbnNlLg0KPiANCj4g
SG93ZXZlciwgbG9jYWxfaXJxX3NhdmUoKS9sb2NhbF9pcnFfcmVzdG9yZSgpIGlzIGxvY2FsIHRv
IG9uZSBDUFUgY29yZSwgaXQgZG9lcw0KPiBub3QgcHJldmVudCBhbm90aGVyIENQVSBjb3JlIGZy
b20gcG9zdGluZyByZWdpc3RlciByZWFkL3dyaXRlIGFjY2VzcyB0byB0aGUNCj4gWElJQyBJUCAo
Zm9yIGV4YW1wbGUgZnJvbSB4aWljX3Byb2Nlc3MoKSB0aHJlYWRlZCBpbnRlcnJ1cHQgaGFuZGxl
ciwgd2hpY2gNCj4gbWlnaHQganVzdCBiZSBydW5uaW5nIG9uIHRoYXQgb3RoZXIgQ1BVIGNvcmUp
Lg0KPiANCj4gVGhlICZpMmMtPmxvY2sgbXV0ZXggaXMgbG9ja2VkIGJ5IGJvdGggdGhlIHhpaWNf
c3RhcnQoKSBhbmQgeGlpY19wcm9jZXNzKCksIGFuZA0KPiB0aGVyZWZvcmUgZ3VhcmFudGVlcyB0
aGF0IG5vIG90aGVyIHRocmVhZCBjYW4gcG9zdCByZWFkL3dyaXRlIHJlZ2lzdGVyIGFjY2Vzcw0K
PiB0byB0aGUgWElJQyBJUCB3aGlsZSB4aWljX3N0YXJ0KCkgKGFuZCB0aHVzIHhpaWNfcmVjdl9z
dGFydCgpLCB3aGljaCBpcyBjYWxsZWQgZnJvbQ0KPiBpdCkgaXMgcnVubmluZy4NCj4gDQo+IEFu
ZCBzbywgSSB0aGluayB0aGlzIGxvY2FsX2lycV9zYXZlKCkvbG9jYWxfaXJxX3Jlc3RvcmUoKSBj
YW4gYmUgcmVtb3ZlZC4NCj4gDQo+ID4gKElmIHRoZXJlIGlzIGEgZGVsYXkgYmV0d2VlbiB0aGUg
MiByZWdpc3RlciB3cml0ZXMsIGNvbnRyb2xsZXIgaXMNCj4gPiBtZXNzaW5nIHVwIHdpdGggdGhl
IHRyYW5zYWN0aW9uKS4gSXQgaXMgbm90IGludGVuZGVkIGZvciBsb2NraW5nIGJldHdlZW4gdGhp
cw0KPiBmdW5jdGlvbiBhbmQgaXNyLiBTbywgdGhpcyBjYW4ndCBiZSByZW1vdmVkLg0KPiANCj4g
QnV0IHRoZSBidXMgY2FuIGluc2VydCBhcmJpdHJhcnkgZGVsYXkgYmV0d2VlbiB0d28gY29uc2Vj
dXRpdmUgcmVnaXN0ZXIgd3JpdGVzDQo+IHRvIHRoZSBYSUlDIElQLCBzbyBpZiB0aGUgdGltaW5n
IGJldHdlZW4gdGhlIHR3byByZWdpc3RlciB3cml0ZXMgaXMgcmVhbGx5IGNyaXRpY2FsLA0KPiB0
aGVuIEkgZG9uJ3Qgc2VlIGhvdyB0byBndWFyYW50ZWUgdGhlIHRpbWluZyByZXF1aXJlbWVudC4g
RG8geW91IGhhcHBlbiB0bw0KPiBoYXZlIG1vcmUgZGV0YWlscyBvbiB3aGF0IHJlYWxseSBoYXBw
ZW5zIG9uIHRoZSBoYXJkd2FyZSBsZXZlbCBoZXJlICwgbWF5YmUNCj4gc29tZSBlcnJhdGEgZG9j
dW1lbnQgZm9yIHRoZSBYSUlDIElQPw0KDQpGcm9tIHRoZSBjb21taXQgZGVzY3JpcHRpb24gb2Yg
ImkyYzogeGlpYzogTWFrZSB0aGUgc3RhcnQgYW5kIHRoZSBieXRlIGNvdW50IHdyaXRlIGF0b21p
YyIoYWU3MzA0YzNlYTI4YTNiYTQ3YTdhODMxMmM3NmM2NTRlZjI0OTY3ZSksDQoNCltEaXNhYmxl
IGludGVycnVwdHMgd2hpbGUgY29uZmlndXJpbmcgdGhlIHRyYW5zZmVyIGFuZCBlbmFibGUgdGhl
bSBiYWNrLg0KDQpXZSBoYXZlIGJlbG93IGFzIHRoZSBwcm9ncmFtbWluZyBzZXF1ZW5jZQ0KMS4g
c3RhcnQgYW5kIHNsYXZlIGFkZHJlc3MNCjIuIGJ5dGUgY291bnQgYW5kIHN0b3ANCg0KSW4gc29t
ZSBjdXN0b21lciBwbGF0Zm9ybSB0aGVyZSB3YXMgYSBsb3Qgb2YgaW50ZXJydXB0cyBiZXR3ZWVu
IDEgYW5kIDINCmFuZCBhZnRlciBzbGF2ZSBhZGRyZXNzIChhcm91bmQgNyBjbG9jayBjeWxlcykg
aWYgMiBpcyBub3QgZXhlY3V0ZWQNCnRoZW4gdGhlIHRyYW5zYWN0aW9uIGlzIG5hY2tlZC4NCg0K
VG8gZml4IHRoaXMgY2FzZSBtYWtlIHRoZSAyIHdyaXRlcyBhdG9taWMuXQ0KDQpTbywgdGhpcyBs
b2NhbF9pcnFfc2F2ZSgpL2xvY2FsX2lycV9yZXN0b3JlKCkgaXMgbm90IHJlbGF0ZWQgdG8gZXhj
bHVzaXZlIGFjY2VzcyBpbiB0aGUgZHJpdmVyICh4aWljX3Byb2Nlc3MgdnMgeGlpY19zdGFydCks
DQpidXQgdG8gc3VwcGx5IHRoZSBieXRlIGNvdW50IHRvIGNvbnRyb2xsZXIgYmVmb3JlIGl0IGNv
bXBsZXRlcyB0cmFuc21pdHRpbmcgU1RBUlQgYW5kIHNsYXZlIGFkZHJlc3MuDQoNCj4gDQo+IFRo
YW5rcw0KPiANCj4gPj4gIAlpZiAoIShtc2ctPmZsYWdzICYgSTJDX01fTk9TVEFSVCkpDQo+ID4+
ICAJCS8qIHdyaXRlIHRoZSBhZGRyZXNzICovDQo+ID4+ICAJCXhpaWNfc2V0cmVnMTYoaTJjLCBY
SUlDX0RUUl9SRUdfT0ZGU0VULCBAQCAtNTY5LDcgKzU2Nyw2DQo+IA0KPiBbLi4uXQ0K
