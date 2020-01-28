Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D6014C24D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jan 2020 22:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgA1Vpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jan 2020 16:45:30 -0500
Received: from mail-eopbgr80135.outbound.protection.outlook.com ([40.107.8.135]:11502
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726211AbgA1Vpa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jan 2020 16:45:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhIZaeayxZfPek2QkKKCAP/fDIJYQ2llofP2ohAm81jZEbvGid7h3jkQH1PKWh93q96mLpsgz6vvw3s3OnYWNWgdELJw4c0YWxtbvmLslD6iEKwa1v3Lxi2XWGjf151J9DqyTZy4JZ4DTAXcbGrIXvGe2pq3va0h5n1+kNzph+mavSPEBBv94h652YYePe0oR0A3a/KBbX1MHyolOFrPnAaCfgMZkNFh6SKTVbrz0gUmm4Ez6lWAWKqFKm8A1WCVhiFcC5qieJQn/PSuQefi7F5PswjPNZG9mruPt3QqWEMYwUFid0YUz0GT9WBiuk8QmQeZKu0SjJ0pTpFXWXIkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htIqDUmDB/HkjJLnaky6uCfhtrGm0jQ51y4ZfpwlidM=;
 b=deECpXI87GjG+U2Xn9WQspafk9NGrVVaKZIF/0p0yDfmGhmOUM6esnpmUVt91pDMmS+jSMEKzYg6w1fUBNOAp0icZzdA8pk+MvxEek8YMFSUPXIfuCYOMvdskrXQO9YPOD80zyQo65iIHFFSR2cupq5dkzyltZJQ6lSRSrK6z79sYlTGinlPO7aWkmvWGcxNUM0VjVPnORRZpe0v9M1AUNJWC9yqbiYWzw6nsIJ6U9b04DS6eGFZ9y2XDWWEKBvl3uvZbcR6ypxe/Hb34J9eGkYsQmGkiMZ8KJkit1XsmsIrQQGzsM29NHkgb0EQ8a4llOgJhZUbyszcW+OREx22Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htIqDUmDB/HkjJLnaky6uCfhtrGm0jQ51y4ZfpwlidM=;
 b=dFZhbDjx9xCcBWKmPyCYpM3qeWgIN+IfEl0MXYDUCtT8BShk/3mTb5JraqKBuMvFj/OtnoGCh+hlGPBDFncPr079FBMiUnopI4r1ef6XSNhG+6IGvTD72gsteCA3jb8Vw7RyUS0WkzFIDxa9bGgHJHov7g22+nLTNCk+O2nEWbU=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3306.eurprd02.prod.outlook.com (52.134.70.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Tue, 28 Jan 2020 21:45:24 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 21:45:24 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22 via Frontend Transport; Tue, 28 Jan 2020 21:45:23 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Johan Hovold <johan@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Thread-Topic: [PATCH][next][V2] i2c: xiic: fix indentation issue
Thread-Index: AQHV1PvGmbkS3JsMKku+pbwF3sqcKKf+WLcAgAAReoCAAADJgIACM4iA
Date:   Tue, 28 Jan 2020 21:45:24 +0000
Message-ID: <35ed6501-3b26-36a9-d332-d4ed3366ebd8@axentia.se>
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
 <20200127120535.GC1847@kadam>
 <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
In-Reply-To: <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::49)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61d0b376-f696-4ccf-83a1-08d7a43b618c
x-ms-traffictypediagnostic: DB3PR0202MB3306:
x-microsoft-antispam-prvs: <DB3PR0202MB33064B43FA7EFD46D89FC50FBC0A0@DB3PR0202MB3306.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39830400003)(376002)(346002)(136003)(396003)(189003)(199004)(86362001)(31696002)(54906003)(66556008)(110136005)(52116002)(26005)(316002)(6486002)(66446008)(66476007)(4326008)(31686004)(66946007)(53546011)(16576012)(2906002)(64756008)(36756003)(186003)(81166006)(16526019)(81156014)(8676002)(956004)(5660300002)(508600001)(2616005)(8936002)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3306;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cx0gO0oEphHe4jvfcR5Vko6CJaKzrkbM0Je6K+qVjBVppbsvCNWsSArKGtG7ECuQ64QiAQgQwaiAh5NJv3/KliJKxRyQud/KOd6owJnbeablr0vRvh81txjYpb5WbZnqtnP9Z+TQ/UjzdNuDrHcmvAXo1fU8r8ReZXWbZ+jDNwOFVFOmvvQmMTicIA2AIeb3jsSYd5CskPH6p4GEcXYfo1yuRI26YouYogd62JLHzRxkgHhWwZOf59ZXSEzJ9ZI4kh/fJSGyK/On5cCwn8iycexYMUVkpBSQMJa5o0+Q7sPGwBlog/+Znb4X7HmIWmbr5K3UflDswrCe3fRKgNN8waA1vyRhDiXOIg74ms6EkJqHCiSGWR3cFk87SWN7HO+D1CHntSqoo2P7BShXtq0tDL8KlsK72gt+mGEdbN8ircnyAp8Z+ADP3FCui7KRb+fA
x-ms-exchange-antispam-messagedata: +RJttpQ7vyqtRIPRZ5vFEsCXU8foIiVpQgGGs13OubyrtZgD7UxxN5/eKaqXiGMOaVIP3PwbD8wNGj89Hii301n2TC5rZOqG9jHJryIVugXwhoR1uDdsmkkBjcKZgRcyJRr7R5jERFjAw+ozlZwqwg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <46710B87C475CD45A9ED51494BE6860C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d0b376-f696-4ccf-83a1-08d7a43b618c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 21:45:24.4857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nv2YsKb43HlgiZBhN6f0NrX2asVE5+XMbMAlZD88o09hiInjS3H2k+AFT7kVOntI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3306
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0yNyAxMzowOCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+IE9uIDI3LzAxLzIw
MjAgMTI6MDUsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+PiBPbiBNb24sIEphbiAyNywgMjAyMCBh
dCAxMjowMzowMlBNICswMTAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6DQo+Pj4gT24gMjcuIDAxLiAy
MCAxMToyMywgQ29saW4gS2luZyB3cm90ZToNCj4+Pj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4+Pj4NCj4+Pj4gVGhlcmUgaXMgYSBzdGF0ZW1lbnQg
dGhhdCBpcyBpbmRlbnRlZCBvbmUgbGV2ZWwgdG9vIGRlZXBseSwgcmVtb3ZlDQo+Pj4+IHRoZSBl
eHRyYW5lb3VzIHRhYi4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFYyOiBmaXggdHlwZSBp
biBjb21taXQgbWVzc2FnZQ0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
eGlpYy5jIHwgMiArLQ0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXhpaWMuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+Pj4+IGluZGV4IGIxN2Qz
MGM5YWI0MC4uOTBjMWMzNjIzOTRkIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXhpaWMuYw0KPj4+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0K
Pj4+PiBAQCAtMjYxLDcgKzI2MSw3IEBAIHN0YXRpYyBpbnQgeGlpY19jbGVhcl9yeF9maWZvKHN0
cnVjdCB4aWljX2kyYyAqaTJjKQ0KPj4+PiAgCQl4aWljX2dldHJlZzgoaTJjLCBYSUlDX0RSUl9S
RUdfT0ZGU0VUKTsNCj4+Pj4gIAkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW91dCkpIHsN
Cj4+Pj4gIAkJCWRldl9lcnIoaTJjLT5kZXYsICJGYWlsZWQgdG8gY2xlYXIgcnggZmlmb1xuIik7
DQo+Pj4+IC0JCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+Pj4+ICsJCQlyZXR1cm4gLUVUSU1FRE9V
VDsNCj4+Pj4gIAkJfQ0KPj4+PiAgCX0NCj4+Pj4gIA0KPj4+Pg0KPj4+DQo+Pj4gQXMgd2FzIHN1
Z2dlc3RlZCBieSBQZXRlciB5b3Ugc2hvdWxkIGFsc28gYWRkIEZpeGVzOiA8c2hhMT4gKCJwYXRj
aA0KPj4+IHN1YmplY3QiKQ0KPj4+DQo+Pg0KPj4gSXQncyBub3QgcmVhbGx5IGEgYnVnZml4LCBp
dCdzIGp1c3QgYSBjbGVhbnVwLg0KPiANCj4gSSdtIHN1cnByaXNlZCBpIHdhc24ndCBhc2tlZCBm
b3IgYSBidWcgbnVtYmVyIHRvby4NCg0KVmVyeSBmdW5ueS4NCg0KSSByZWFsaXplIHRoYXQgeW91
LCB0aGUgdGhyZWUgY29tcGxhaW5lcnMgKEpvaGFuLCBEYW4gYW5kIENvbGluKSwgdG9nZXRoZXIN
CmhhdmUgYWxtb3N0IDEwMDAwIGNvbW1pdHMuIFNvLCBJIGZlZWwgYSBiaXQgb3V0cmFua2VkLg0K
DQpIb3dldmVyLCB0aGlzIHJpZGljdWxlIGlzIHVuZmFpci4NCg0KVGhlIHByb2JsZW0gaGVyZSBp
cyB0aGF0IENvbGluIHNlbnQgYSB2MiwgaWdub3JpbmcgbXkgc3VnZ2VzdGlvbiB0byBhZGQNCmEg
Zml4ZXMtdGFnIHdpdGhvdXQgbWVudGlvbmluZyB0aGF0IG15IHN1Z2dlc3Rpb24gd2FzIGluIGZh
Y3QgaWdub3JlZA0KKGFuZCB3aHkpLiBUaGF0IGlzIGEgc3VyZSB3YXkgdG8gaW52aXRlIHNvbWVv
bmUgZWxzZSB0byBwb2ludCBvdXQgd2hhdA0Kc2VlbWVkIGxpa2UgYW4gb21pc3Npb24uIFdoaWNo
IGhhcHBlbmVkLiBBbmQgdGhlbiB0aGlzIGZhcmNlIGVuc3VlZC4NCg0KU28sIENvbGluLCB0YWtl
IGEgbG9uZyBsb29rIGluIHRoZSBtaXJyb3IgYW5kIGRpcmVjdCB5b3VyIHNhcmNhc20gaW4NCndo
YXRldmVyIGRpcmVjdGlvbiB5b3UgZmVlbCBhcHByb3ByaWF0ZS4NCg0KSSBhbHNvIG1haW50YWlu
IHRoYXQgbm9vbmUgd3JpdGVzIGNvZGUgbGlrZSB0aGlzIG9uIHB1cnBvc2UgKGF0IGxlYXN0DQpu
b3Qgd2l0aG91dCBzb21lIHVsdGVyaW9yIG1vdGl2ZSkuIFRoaXMgaXMgdGhlIGtpbmQgb2Ygc3R1
ZmYgdGhhdCBjYXVzZQ0KcHJvYmxlbXMgYW5kIHdhc3RlcyB0aW1lIGxhdGVyIHdoZW4gc29tZW9u
ZSBtaXMtcmVhZHMgdGhlIGNvZGUuIFlvdSB0aHJlZQ0KcGVvcGxlLCB3aXRoIGFsbCB0aG9zZSBj
b21taXRzLCBzaG91bGQga25vdyB0aGF0LiBNeSBwb2ludCBpcyB0aGF0IHRoaXMNCmlzIG1vcmUg
dGhhbiBqdXN0IGNsZWFudXAgYW5kIGlzIGluZGVlZCBmaXhpbmcgYSBidWcuIENsYWltaW5nIG90
aGVyd2lzZQ0KaXMganVzdCBzaWxseS4gVGhlIGNvbXBpbGVyIGlzIG5vdCB0aGUgb25seSBjb25z
dW1lciBvZiB0aGUgY29kZS4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==
