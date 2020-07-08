Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97881218B1E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 17:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgGHPXM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 11:23:12 -0400
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com ([40.107.244.50]:6142
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729206AbgGHPXL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jul 2020 11:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dflnwiYqYSitufVFxHSn/BTrPCa+eItsKiaMNyAX4pT9lkHafyYHvSal7as66E0DRNawZO5uzgusWSPCmp8hHauOgtjrtdug4HRJSwWLkd0kLWOMysbLDYxPdkNpaIppQz4m3tpCa31I1ugpai0rxOJTvHfO9D5B7SJoLJvT99kfLRA8Uzw4F8Xx3iJ9mvZcmSc+G+OCAr9NYkpAJf6aWkOb35/HaTNVkmCvaJ7F38+WAijFlGDqqvTXK+MNiQBgOoiAninSmbL07XHkFmB+cLXit21VPwyQiuwj75YxiZA7EotXkHtcx9jFOmgUskKLXWrgcNqv3CUs3am0yE0MTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Vlug1Xi6QhoBegEB+sa5v0QAixWQYKMloCq/gOMTpE=;
 b=KDO1XHphgZW7Ap50B3UuI8RdF0ZYvTuuC3J6sOhpEtzLqvgeT08EIM132b51GVuznVFG2lZDbqmp+TFvCMr0sMpbef5ltbr7EwIAkQ6+XiGq/xrVhmXRbFK/Y5bY0qJWFi9ZW9/hxXRPx8t+xpat2DyaIWkmSRJUrKUlPqv73QEKAqiLXu2VmZeA2CUFbGPdGJRCGaxnVZvoNDClsiATGG5j9bFkRnGbZrEaGKJKdoan6Okqa7c63119pg0ZSNsyWAhMKTBfT/Jc+U4RM6VJVfbQx8mVH7aqToYvlCAtmFDrWHmuNSemTvMIvsfjHyVhOGoy9NnQ/2o65qGaUuZ8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Vlug1Xi6QhoBegEB+sa5v0QAixWQYKMloCq/gOMTpE=;
 b=aT74IoJ5Bxe2p7vlxwqfFFA7nWdCughi4GOOq/N4h06GPZRpmmzwpnpXzmqw/dERWDpbiA2O91SRYFUycLRAPh+vlGhjSshh464U9PORRbx5F5hUUXtyMNPE5/0B9vj4yIa3G2UAusWWbvekdCTk/8x2qBZxI4KaJkigyhNLMyQ=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN1PR02MB3838.namprd02.prod.outlook.com
 (2603:10b6:802:2d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Wed, 8 Jul
 2020 15:23:08 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142%6]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 15:23:08 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Raviteja Narayanam <rna@xilinx.com>, Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Thread-Topic: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Thread-Index: AQHWQZR16ESRHITuAECl/9tfqloeHqjpJiIAgAWbm4CAAN/ssIAOPjyw
Date:   Wed, 8 Jul 2020 15:23:08 +0000
Message-ID: <SN4PR0201MB34865F9B86384AB180324FE9CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <MWHPR0201MB348439A109964704D30EF0B4CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <fee2d0a5-138d-fc31-ed46-348706bc0491@denx.de>
 <SN4PR0201MB3486DFA2BC59C76906CE48B0CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB3486DFA2BC59C76906CE48B0CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e293cae8-cbb0-4972-82b6-08d82352d1a5
x-ms-traffictypediagnostic: SN1PR02MB3838:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB3838DF6A434C9237266E52D6CA670@SN1PR02MB3838.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISyWiqpxZpOKBM9CjE5DD9fHevH5veK9SPEUkoY4gQ7kNY0477y3zP3oK8Qnce1RygbfcdcwXvwWFolK6cpBczZG5IvaQOaFaJoQ6c+P1l/KBu1d4lkcpvLk3giNqFY5viPivXBsJ54mh1jjjoH/iJr/er58gSxZuxkkEGePQXp0UrRTZmMkNmveSZQ1apncUWn1VM8W1nV1Qmx9UWe6gxnUCuIl6CPW7LweFSZ9M75WXsRJvDpldE/8ntTyAFWyn+nGqEgDwKrnU6frYsX9zWJp16KcUwYAvmAOqR3gyBM2KocDA19vzeP+IkfIZV9H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39860400002)(366004)(396003)(136003)(83380400001)(478600001)(86362001)(8676002)(6506007)(2906002)(53546011)(9686003)(54906003)(5660300002)(110136005)(55016002)(8936002)(71200400001)(316002)(52536014)(76116006)(33656002)(4326008)(186003)(66476007)(64756008)(66556008)(66946007)(66446008)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: hROj6M6TUBC0vhe8RTcA/OmtiJf2goXpuTtwp8i0p/VLR7AJ3llcpfbBS7lwHdqFeamZW3iPwuMVm7uKL9t2wVK7jGmmLDVXSRMeDd16C7qV9Fo6UF+Rveg8varM8/DLDaFcXWc5c7WfZ3VgYubgpQa2scg6ggQs52yOPOHA3NNcUFYnGybLFcqn/rdS/AOh/fPAnjb5BOoFE0nMN9l3rfVGz6VRGTU8h/Np4G/sAApTaVWD0Pq08GxDsc7RlSW1X3pefxBwleP8nfovOaL1pMXeDi+oYkTE4HSwLDt5tU62dTWzE7No18MXq9kCIEqCfr+Vgz9gY+yp3RdbjPpiK7IJA0HeMNsER4Yk5JevYlgMPI5N26xQaJdRcCI3SVBuPcjDETArb1byeUj4dsoW/Tihynk+cmn2wSQe26g/FjkI161cVOWQrtuk3cDy4CFCLYwVbo7w0HxUTFNY6T6isPMOVVCTPpkUTJLqOcddJON8HKcI6kKJVVz4xMhwfAQc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e293cae8-cbb0-4972-82b6-08d82352d1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 15:23:08.1982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjvLSfd+r5/6BhtWKAjwMfRqEgLY+KnN5v3dK+4FgAQdPYH+80vPCZ5K3pklCFD2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3838
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGVzdGVkLWJ5OiBSYXZpdGVqYSBOYXJheWFuYW0gPHJhdml0ZWphLm5hcmF5YW5hbUB4aWxpbngu
Y29tPg0KDQpUaGFua3MNClJhdml0ZWphIE4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBsaW51eC1pMmMtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1pMmMtb3du
ZXJAdmdlci5rZXJuZWwub3JnPiBPbg0KPiBCZWhhbGYgT2YgUmF2aXRlamEgTmFyYXlhbmFtDQo+
IFNlbnQ6IE1vbmRheSwgSnVuZSAyOSwgMjAyMCA2OjIyIFBNDQo+IFRvOiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IE1pY2hhbCBT
aW1layA8bWljaGFsc0B4aWxpbnguY29tPjsgU2h1YmhyYWp5b3RpIERhdHRhDQo+IDxzaHViaHJh
akB4aWxpbnguY29tPjsgV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4NCj4gU3ViamVjdDog
UkU6IFtQQVRDSCAxLzVdIGkyYzogeGlpYzogRml4IGJyb2tlbiBsb2NraW5nIG9uIHR4X21zZw0K
PiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+ID4gU2VudDogTW9uZGF5LCBKdW5lIDI5LCAyMDIw
IDQ6NDkgQU0NCj4gPiBUbzogUmF2aXRlamEgTmFyYXlhbmFtIDxybmFAeGlsaW54LmNvbT47IGxp
bnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhp
bGlueC5jb20+OyBTaHViaHJhanlvdGkgRGF0dGENCj4gPiA8c2h1YmhyYWpAeGlsaW54LmNvbT47
IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAx
LzVdIGkyYzogeGlpYzogRml4IGJyb2tlbiBsb2NraW5nIG9uIHR4X21zZw0KPiA+DQo+ID4gT24g
Ni8yNi8yMCAyOjExIFBNLCBSYXZpdGVqYSBOYXJheWFuYW0gd3JvdGU6DQo+ID4NCj4gPiBIaSwN
Cj4gPg0KPiA+IFsuLi5dDQo+ID4NCj4gPiA+PiBAQCAtNjk5LDE0ICs3MDgsNyBAQCBzdGF0aWMg
aW50IHhpaWNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsDQo+ID4gPj4gc3RydWN0IGky
Y19tc2cgKm1zZ3MsIGludCBudW0pDQo+ID4gPj4gIAlpZiAoZXJyIDwgMCkNCj4gPiA+PiAgCQly
ZXR1cm4gZXJyOw0KPiA+ID4+DQo+ID4gPj4gLQllcnIgPSB4aWljX2J1c3koaTJjKTsNCj4gPiA+
PiAtCWlmIChlcnIpDQo+ID4gPj4gLQkJZ290byBvdXQ7DQo+ID4gPj4gLQ0KPiA+ID4+IC0JaTJj
LT50eF9tc2cgPSBtc2dzOw0KPiA+ID4+IC0JaTJjLT5ubXNncyA9IG51bTsNCj4gPiA+DQo+ID4g
PiBPbiBhbiBTTVAgc3lzdGVtIHdpdGggbXVsdGlwbGUgaTJjLXRyYW5zZmVyIGNvbW1hbmQgc2Ny
aXB0cyBydW5uaW5nLA0KPiA+ID4gdGhlDQo+ID4gYWJvdmUgY3JpdGljYWwgc2VjdGlvbiBpcyBl
eHBlY3RlZCB0byBjYXVzZSBzZXJpb3VzIHRyb3VibGUNCj4gPiBvdmVyd3JpdGluZyB0aGUgcHJl
dmlvdXMgbXNnIHBvaW50ZXJzLg0KPiA+ID4gQnV0IHRoYXQncyBub3QgaGFwcGVuaW5nIGFzIHRo
ZSBpMmMtY29yZSBpcyBoYXZpbmcgYSBsb2NrIGF0IGFkYXB0ZXINCj4gPiA+IGxldmVsDQo+ID4g
aW5zaWRlIGkyYy1jb3JlLWJhc2UuYyAocnRfbXV0ZXhfbG9ja19uZXN0ZWQpLg0KPiA+ID4gU28s
IHRoZSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIGRpZmZlcmVudCB0aHJlYWRzIGlzIG5vdCBwb3Nz
aWJsZS4NCj4gPiA+IFRoZXkgYXJlIGFsbA0KPiA+IHNlcmlhbGl6ZWQgYnkgdGhlIGxvY2tpbmcg
aW4gaTJjLWNvcmUuDQo+ID4gPg0KPiA+ID4gQWx0aG91Z2ggbm8gaXNzdWVzIGFyZSBzZWVuIGlu
IHRoZSB0ZXN0cywgdGhlIGNvbnRlbnRpb24gd2l0aGluIHRoZQ0KPiA+ID4gZHJpdmVyIGlzDQo+
ID4gc3RpbGwgcG9zc2libGUgKGlzciB2cyB4aWljX3hmZXIpLCBpZiB0aGVyZSBpcyBhIHNwdXJp
b3VzIGludGVycnVwdC4NCj4gPiBBbmQgdGhpcyBwYXRjaCBpcyBuZWVkZWQgaW4gdGhhdCBjYXNl
Lg0KPiA+IFRoZSBjb250ZW50aW9uIGhhcHBlbnMgYmV0d2VlbiB0aGUgdGhyZWFkZWQgaW50ZXJy
dXB0IGhhbmRsZXINCj4gPiB4aWljX3Byb2Nlc3MoKSBhbmQgdGhpcyB4aWljX3hmZXIoKSBmdW5j
dGlvbi4gV2hpbGUgeW91IGNhbiBub3QgaGF2ZQ0KPiA+IHhpaWNfeGZlcigpIHJ1bm5pbmcgb24g
dHdvIENQVSBjb3JlcyBhdCB0aGUgc2FtZSB0aW1lLCB5b3UgY2FuIGhhdmUNCj4gPiB4aWljX3hm
ZXIoKSBydW5uaW5nIG9uIG9uZSBDUFUgY29yZSBhbmQgeGlpY19wcm9jZXNzKCkgb24gYW5vdGhl
ciBDUFUNCj4gPiBjb3JlLCBhbmQgdGhhdCB3aWxsIGxlYWQgdG8gcHJvYmxlbXMuDQo+IA0KPiBZ
ZXMsIHRoaXMgcGF0Y2ggaXMgbmVlZGVkIGZvciB0aGF0IGNhc2UuDQo+IA0KPiA+DQo+ID4gWy4u
Ll0NCg==
