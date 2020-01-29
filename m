Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 523DE14C735
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 09:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgA2IGu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 03:06:50 -0500
Received: from mail-db8eur05on2108.outbound.protection.outlook.com ([40.107.20.108]:10208
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbgA2IGu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 03:06:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f72Y1REEW9JpKXFak8mX+u9o2CtRpDXoDKrAHy/zSYpY+I9VGj02hgwGOebnCbjEmlFebohMLFjo5cDV6Dz8+1PHUQIyf/NxpaWLEoxGZX55fF4WyJaNOpEvw+J7N5G8s5lYqwq+Q/FKcKjSldEAJC8kX0OkoQHo8WmchJWPQ8DsiwahdYUjgY8OG34wTKsoOOsXLagh6TUPLIsuTd1mJHzMA/BMKs8Qv59CH9vk1F7kvWX7MBp3vHNRidlh6YtGWXkjGba82/Iol6O2f3FIC3xrcp2mmCbPpb9ubzky2wLSdo7pfUGTZRMk4+gCGEgNXTpJ5IKoArgZsuYhNtOtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA+IxNNhZXAZarUdhmtadRKZ3bSHnOcids1aLsayQOw=;
 b=H8+8y+gcAO3aF66DtBgkiupf/SSvpsj5ygXyIYTkrbWWCc/ceNAF2+/smGZ4YzO+drC/whH0qAmkYcoUjd+1jqVgyTZ/PRySbcWHjATCkdxAV5NaYsR9BGSLoL0tEPhnivxvpPoRKGohy8jGwiVP9A2Xu9jbQYHZl/CR5V3016vPQDiR/QhvADHryyyFuhCf8AQ2KbBGgKLvQCUJlKNdHE9R1eK3nHus7O8fdS6CsBcnbT8ysxVswfgT+SSbV534+iuTcc6H3QIY5dN5bCByeRbKvyhQZDOwgoRFzy8f8RkMQJasqyXcOAbxxjgBRYOBl5OQAO5tA86UD6AiYu8q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA+IxNNhZXAZarUdhmtadRKZ3bSHnOcids1aLsayQOw=;
 b=QgiIWV/7qb003Qs7mwZorr5vizhJreKHOB8RKvV9146/6KLU8FdExsyHaCatOBCUwWMSzATsj3zDI4eqHDkTt0TNzztIJreI9hoPfccAcOFnOBlYAheCz5uXrXUbvGMrmiRy71Yaea9NJlQu/zcc2WcITyhgS6hqJZof1H+AmvU=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3580.eurprd02.prod.outlook.com (52.134.66.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Wed, 29 Jan 2020 08:06:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 08:06:32 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR06CA0146.eurprd06.prod.outlook.com (2603:10a6:7:16::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22 via Frontend Transport; Wed, 29 Jan 2020 08:06:31 +0000
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
Thread-Index: AQHV1PvGmbkS3JsMKku+pbwF3sqcKKf+WLcAgAAReoCAAADJgIACM4iAgAAX7YCAAJWdAA==
Date:   Wed, 29 Jan 2020 08:06:32 +0000
Message-ID: <f8c236de-4ed6-49dc-e5b7-283ebb859199@axentia.se>
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
 <20200127120535.GC1847@kadam>
 <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
 <35ed6501-3b26-36a9-d332-d4ed3366ebd8@axentia.se>
 <3b287fb5-e344-c13a-2803-09c2958b9b0d@canonical.com>
In-Reply-To: <3b287fb5-e344-c13a-2803-09c2958b9b0d@canonical.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR06CA0146.eurprd06.prod.outlook.com
 (2603:10a6:7:16::33) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c39b6653-5cb5-46e2-7048-08d7a4922716
x-ms-traffictypediagnostic: DB3PR0202MB3580:
x-microsoft-antispam-prvs: <DB3PR0202MB358052A74A019793FAF31705BC050@DB3PR0202MB3580.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39830400003)(136003)(366004)(199004)(189003)(31696002)(508600001)(8936002)(2906002)(36756003)(31686004)(81156014)(8676002)(81166006)(66446008)(86362001)(6486002)(66556008)(64756008)(5660300002)(71200400001)(26005)(4326008)(186003)(66476007)(956004)(2616005)(66946007)(53546011)(52116002)(16526019)(316002)(16576012)(54906003)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3580;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e23Ipoi6H93eYGUEw2lpJM8EFfefqjj+znORdfhIAOSufGHjc2XvjN6+3U2rpl3SAe4XqIilzrYD/MPfXRBIadOEXvE74RT0AJpuGxpBJkQa3Tp5jbai/Cs/g+ojilVgsXfnQR/HedP1i4Qw02DPd+a3RWxagWytdAHtlkrx0/+0rmAwIzkE/SMuthRsnoS0+4YU92DQ8A4zY9/LVyG9VLj9F5OP/ma10dur7TfVvMddctAbuht94ZRDCj50MErT1Zok+qFP59XRLcKjDRH557LBGCtjXRXt4uuL56IWMzBDOSYehS7tbYOkt0iO7srZ+Y5xmLNguUi+5HVBzd4IZ4gJ8AguEz4P8/dfwO+nSb5zD82bb6R+sQKaBtVTLWBQGi/0w7om4UpssP0gLkKu7mFDCxPQrgn1A8NpvMdQ7KQvYCWJSFmELi1ALg+JBFco
x-ms-exchange-antispam-messagedata: 2F3JeTa5T8wSpN9xEhMoaFslrRnwUXzdLOdnpmlK+vsgPA/qg486orZDCeG+4FKdRC29swqOf0CIB4mVdBTC4h0TTxaHcr+gwKgNZH1KSrhVyrYv0qK0tBEBXKJLJLMMzYtM8YLd+mezcojq/w/TJQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C71D27A5CDBB8849A01AB6970F676569@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c39b6653-5cb5-46e2-7048-08d7a4922716
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 08:06:32.7614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfgtHayPNMFksAn55MMOeUCe6mDhG84NdB7VzKqy2c/QIoehvpmBNmCDMcAh+vR6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3580
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0yOSAwMDoxMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+IE9uIDI4LzAxLzIw
MjAgMjE6NDUsIFBldGVyIFJvc2luIHdyb3RlOg0KPj4gT24gMjAyMC0wMS0yNyAxMzowOCwgQ29s
aW4gSWFuIEtpbmcgd3JvdGU6DQo+Pj4gT24gMjcvMDEvMjAyMCAxMjowNSwgRGFuIENhcnBlbnRl
ciB3cm90ZToNCj4+Pj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTI6MDM6MDJQTSArMDEwMCwg
TWljaGFsIFNpbWVrIHdyb3RlOg0KPj4+Pj4gT24gMjcuIDAxLiAyMCAxMToyMywgQ29saW4gS2lu
ZyB3cm90ZToNCj4+Pj4+PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlcmUgaXMgYSBzdGF0ZW1lbnQgdGhhdCBpcyBpbmRl
bnRlZCBvbmUgbGV2ZWwgdG9vIGRlZXBseSwgcmVtb3ZlDQo+Pj4+Pj4gdGhlIGV4dHJhbmVvdXMg
dGFiLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGlu
LmtpbmdAY2Fub25pY2FsLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBWMjogZml4IHR5cGUgaW4g
Y29tbWl0IG1lc3NhZ2UNCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy14aWljLmMgfCAyICstDQo+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMteGlpYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMNCj4+Pj4+PiBp
bmRleCBiMTdkMzBjOWFiNDAuLjkwYzFjMzYyMzk0ZCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMteGlpYy5jDQo+Pj4+Pj4gQEAgLTI2MSw3ICsyNjEsNyBAQCBzdGF0aWMgaW50IHhpaWNf
Y2xlYXJfcnhfZmlmbyhzdHJ1Y3QgeGlpY19pMmMgKmkyYykNCj4+Pj4+PiAgCQl4aWljX2dldHJl
ZzgoaTJjLCBYSUlDX0RSUl9SRUdfT0ZGU0VUKTsNCj4+Pj4+PiAgCQlpZiAodGltZV9hZnRlcihq
aWZmaWVzLCB0aW1lb3V0KSkgew0KPj4+Pj4+ICAJCQlkZXZfZXJyKGkyYy0+ZGV2LCAiRmFpbGVk
IHRvIGNsZWFyIHJ4IGZpZm9cbiIpOw0KPj4+Pj4+IC0JCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+
Pj4+Pj4gKwkJCXJldHVybiAtRVRJTUVET1VUOw0KPj4+Pj4+ICAJCX0NCj4+Pj4+PiAgCX0NCj4+
Pj4+PiAgDQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBBcyB3YXMgc3VnZ2VzdGVkIGJ5IFBldGVyIHlv
dSBzaG91bGQgYWxzbyBhZGQgRml4ZXM6IDxzaGExPiAoInBhdGNoDQo+Pj4+PiBzdWJqZWN0IikN
Cj4+Pj4+DQo+Pj4+DQo+Pj4+IEl0J3Mgbm90IHJlYWxseSBhIGJ1Z2ZpeCwgaXQncyBqdXN0IGEg
Y2xlYW51cC4NCj4+Pg0KPj4+IEknbSBzdXJwcmlzZWQgaSB3YXNuJ3QgYXNrZWQgZm9yIGEgYnVn
IG51bWJlciB0b28uDQo+Pg0KPj4gVmVyeSBmdW5ueS4NCj4gDQo+IEFwb2xvZ2llcyBmb3IgYmVp
bmcgZmxpcHBhbnQuIEkgZGlkbid0IG1lYW4gdG8gb2ZmZW5kLiBNeSBiYWQgIzEuDQoNCkFwb2xv
Z3kgYWNjZXB0ZWQsIG5vIGhhcmQgZmVlbGluZ3MuIERvbid0IHdvcnJ5IGFib3V0IGl0LCBhbmQg
c29ycnkgb24gbXkNCnBhcnQgZm9yIGEgcG9zc2libGUgb3ZlcnJlYWN0aW9uIQ0KDQpDaGVlcnMs
DQpQZXRlcg0K
