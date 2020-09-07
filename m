Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABBE25F5AB
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgIGIv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:51:27 -0400
Received: from mail-dm6nam10on2077.outbound.protection.outlook.com ([40.107.93.77]:56033
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728060AbgIGIvY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Sep 2020 04:51:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbezCmtktEVPasW+6okYni8GtKi+lgg53WcjPZhJQsPu4rNuZZH4vduLtNRi17qfppcQo69BVrb4YILz5CG068LDiMB/+S6eIenBCBMBaHACnOHA9U8+wzHLDkZonc6975Q89S6gxUjbHzEseAKGrg1PiVrUmWLiv6ftYS63zWdZ2LuKe1Xb0LpdBiWnsRWqFOeRhvFvbrxW642HwB1wd62P5Ld703AJaoNWDQlqXR0dtf7ytIDyj0siptL6WRanIgVWSUwm9bpCprGf4n4xqJ62Yzs3/lEJxxznEf8qKJbYC6NqDMyHSy5ks9ArjJDCQNaEVfwrvhhn8HpCZVJb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IRk9VOAO3VPJ71S8CEAZA0hn6jTnXD1ZvW9GxZVh14=;
 b=L0rs2kPt4+8RPODfMTeDdMwM1FTNJ42FrCUqNWQbMznoiXeJLv88MCw3wkAomFafkOi9v6t3GGRA0aBxbxMY5mJqtBvatDcsjnh+V06J5t9fXr9w1DntQHnzPCsdkpEkEq5rxW/JKWroEiWb3b2/Dyp+ocnaVxs68hnTQFYTBOt9NqkiTww991bk5KLTczn7GP7/Cs4tsI0Yt02Pz+i/DIoAhisy4WkR28jR4Jn4jSg3B+rrEfycjxZ9NZuzho4SRj8DpCgW1wynSVXt9kbqyQPs7n2ZkEUJIktnDKRmpgdB66XxWdE3DzzIDpxY8d6VzzOGEMyntd17seHJtBcc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IRk9VOAO3VPJ71S8CEAZA0hn6jTnXD1ZvW9GxZVh14=;
 b=fXnJKb8gPQIwjgOJEU1Ch7NYRVnDPdKRjoeqXY6LLNSPQL/5/RF8EKRBPqtQsVwSGDD5fQKhR3OQTdEg0qmRl0wKQ7dgaWpM20b0pu4LrYO0gbYbrvyJLhe+gZRfGAUWRtpDAI5xH5ykM4BGHVbe1Qvy8NWyn03F1L56NOwyNNg=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN6PR02MB4960.namprd02.prod.outlook.com
 (2603:10b6:805:9c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 08:51:20 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::75c4:4714:723b:28ce]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::75c4:4714:723b:28ce%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:51:20 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, Srinivas Goud <sgoud@xilinx.com>
Subject: RE: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Topic: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Index: AQHWQZR25/MIEeDZnk+rxvX2lvEMMajqhKAAgARDa4CAAMwAgIAAp0iAgA052KCAQqfDAIAHNrfQgABE7wCAAS474IAA+OCAgBOig3A=
Date:   Mon, 7 Sep 2020 08:51:20 +0000
Message-ID: <SN4PR0201MB348634B4F722A224E071D049CA280@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
 <SN4PR0201MB348615BCD7E2C82DF7919303CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <7cc8420d-c3a4-079b-42fc-90ac6e875d37@denx.de>
 <SN4PR0201MB3486E5229B0E870E6336A969CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <a15a3e60-4738-3d38-fefb-c550dd0b0364@denx.de>
 <SN4PR0201MB3486CDCD30F78416D3325D2BCA560@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <1913c876-d7ec-6f66-e9eb-20b45a4afec4@denx.de>
 <SN4PR0201MB3486689C38889DB9360D524ECA570@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <f34e3539-4f2a-669f-6bb1-0b95ebf6c51f@denx.de>
In-Reply-To: <f34e3539-4f2a-669f-6bb1-0b95ebf6c51f@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [103.106.181.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e729dcb8-d048-4f2b-ae3a-08d8530b30d6
x-ms-traffictypediagnostic: SN6PR02MB4960:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB49604BE810B594E1853C9872CA280@SN6PR02MB4960.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f5tngg2kD3Vzpmm0lTIjhHMlXipq+8ubPwJWR/Zpb4XdYn6BBWmnwwphikBo+Obr+Ke3/upUq1BRJ9wK+ltgsYWQsvYrpUW1rJa4/IZvAPS9Qh3Mtq/yUPIgOVzTKUM+fCbGYcs3o7FjwzsMPc6wpIecxHyzXk28+BtilYRakqD00H5wZb+qIedx1dVlV6ncavF7N9mZCmLqffp0rhbPax2M0KHUAVFHNm8sElYZ9QKbTVtoDJ4F5H7iwUnCv0rJiQfsbZE6OHdBSkBC0JkRL+nqXXZuOAjQttIj71kJDFPz7Dx3MIUetoJ7VzqnnKZx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39850400004)(136003)(396003)(83380400001)(9686003)(52536014)(5660300002)(316002)(53546011)(186003)(71200400001)(478600001)(26005)(6506007)(86362001)(110136005)(66446008)(66476007)(76116006)(55016002)(54906003)(66556008)(64756008)(2906002)(33656002)(4326008)(7696005)(107886003)(8676002)(8936002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qLyTUjQ33Z+pu4Xa1hYZ9l3E2EPZwTRf9PAWHATYsLCX3U8L/cKY3xVikFrRJHRolEOAdOn/jfWyG6+twTjyKPK/Pr/QskyVlm8aCQqsEWjvkA1sSNk6olH9xbv8lAY36y7BxD7RMGtivlImexSHweUOLkLL+4WsBTShhmPLifAV7NCS+csY6DieMcHjkkZWvzMqu/ch5grRF5SBFChvHUpfh6YZC+g5ryU2n6aqdqqvsdVqAT1xJw+H9y9sV5uOfVNvNBPDM6hb5yCibpDYFYNDDboUv+DbG2FCkGPZipIM/m0rEMHvFqv9K0hGL5fEnbfzrMSryxE0Py/8jzvIUv1gLX0HuSO075Lw0vaF2yVv1TxuGJxyi76lgfRUBpwMnopDa5KHueK5t7VTWSdrbmM1RSBZauhnHvM1G4Ya7lJbosTdwzbTukgfUpRhOSk6i380gFY74A1XDDU8/8y0CNaR6tA0sbUu6d2eqUOGUQia+b5yhjpOa0M4al537SwQIAHQ0RgGQU3igy15aFr66lLRsT17c9sF51GR//BkXKZ9UbgqL9NFqHX7zkpC14gd55OHRHlJFD8P5Mi9NDSN1Ff1HSZZ1OVDpE9zUJOeDwBejeKsWhttGKgC565jHkMLKvIyTZq/49f2QgnBwgayqA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e729dcb8-d048-4f2b-ae3a-08d8530b30d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 08:51:20.1316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyfHT/uy4Mzm5JPkC6msqppz9HHm05M6VkWoaWIPNusp0hQ0WMdA7lC4ji349XBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4960
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI2LCAyMDIwIDI6MjEgQU0N
Cj4gVG86IFJhdml0ZWphIE5hcmF5YW5hbSA8cm5hQHhpbGlueC5jb20+OyBsaW51eC1pMmNAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47IFNo
dWJocmFqeW90aSBEYXR0YQ0KPiA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFdvbGZyYW0gU2FuZyA8
d3NhQGtlcm5lbC5vcmc+OyBTcmluaXZhcyBHb3VkDQo+IDxzZ291ZEB4aWxpbnguY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvNV0gaTJjOiB4aWljOiBEcm9wIGJyb2tlbiBpbnRlcnJ1cHQg
aGFuZGxlcg0KPiANCj4gT24gOC8yNS8yMCAxMTo0NCBBTSwgUmF2aXRlamEgTmFyYXlhbmFtIHdy
b3RlOg0KPiANCj4gSGksDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+Pj4+PiBTbywgdGhpcyBsb2Nh
bF9pcnFfc2F2ZSgpL2xvY2FsX2lycV9yZXN0b3JlKCkgaXMgbm90IHJlbGF0ZWQgdG8NCj4gPj4+
Pj4+PiBleGNsdXNpdmUgYWNjZXNzIGluIHRoZSBkcml2ZXIgKHhpaWNfcHJvY2VzcyB2cyB4aWlj
X3N0YXJ0KSwgYnV0DQo+ID4+Pj4+Pj4gdG8gc3VwcGx5IHRoZQ0KPiA+Pj4+Pj4gYnl0ZSBjb3Vu
dCB0byBjb250cm9sbGVyIGJlZm9yZSBpdCBjb21wbGV0ZXMgdHJhbnNtaXR0aW5nIFNUQVJUDQo+
ID4+Pj4+PiBhbmQgc2xhdmUgYWRkcmVzcy4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBCdXQgdGhlbiBz
aG91bGRuJ3QgdGhlIFhJSUMgSVAgYmUgZml4ZWQgLyBleHRlbmRlZCB3aXRoIHN1cHBvcnQNCj4g
Pj4+Pj4+IGZvciBzdWNoIGFuIGF0b21pYyB1cGRhdGUgaW5zdGVhZCA/DQo+ID4+Pj4+DQo+ID4+
Pj4+IEkgaGF2ZSBzdGFydGVkIGNvbW11bmljYXRpbmcgd2l0aCB0aGUgaGFyZHdhcmUgdGVhbSBv
biB3aHkgdGhlIElQDQo+ID4+Pj4gYmVoYXZpb3IgaXMgbGlrZSB0aGlzLg0KPiA+Pj4+DQo+ID4+
Pj4gQW55IG5ld3MgZnJvbSB0aGUgaGFyZHdhcmUgdGVhbSA/DQo+ID4+Pg0KPiA+Pj4gIiBUaGUg
ZXhwZWN0YXRpb24gZnJvbSB0aGUgSVAgaXMgdW4gaW50ZXJydXB0ZWQgcmVhZCBpLmUgdGhlIHJl
YWQNCj4gPj4+IGNvbW1hbmQNCj4gPj4gc2hvdWxkIGJlIHVuIGludGVycnVwdGVkIGFuZCBtYXgg
ZGVsYXkgZXhwZWN0ZWQgaXMgbm90IG1vcmUgdGhhbg0KPiA+PiAzNS00MCB1cyBwcm92aWRlZCBJ
SUMgZnJlcXVlbmN5IGlzIDEwMCBLaHouIFBsZWFzZSBjaGVjayBpZiB3ZSBjYW4NCj4gPj4gbWFu
YWdlIHRoaXMgaW4gU29mdHdhcmUuIElmIGRlbGF5IGlzIG5vdCBtYW5hZ2VkIGVuYWJsZSBpaWMg
Y29udHJvbA0KPiA+PiBvbmx5IGFmdGVyIHN0b3AgcmVsYXRlZCBkYXRhIGlzIHJlY2VpdmVkIg0K
PiA+Pj4gVGhhdCB3YXMgdGhlIHJlc3BvbnNlIGFzIGlzLg0KPiA+Pj4gVGhlIHdvcmthcm91bmQg
c3VnZ2VzdGVkIGFib3ZlIGlzIHRvIGVuYWJsZSB0aGUgQVhJIEkyQyBvbmx5IGFmdGVyDQo+ID4+
IHNlY29uZCByZWdpc3RlciB3cml0ZShTVE9QIGJpdCBpbmZvIHdpdGggcmVhZCBjb3VudCkgaXMg
Y29tcGxldGVkLg0KPiA+PiBUaGlzIGlzIG5vdCBnZW5lcmljLCBzbyB3ZSBjb3VsZG4ndCBtb3Zl
IGZvcndhcmQuDQo+ID4+PiBPdXIgdHlwaWNhbCBhcHBsaWNhdGlvbiBzY2VuYXJpbyBpcyBsaWtl
IHRoaXMgIlNUQVJUIFdSSVRFLCBSRVBFQVRFRA0KPiA+Pj4gU1RBUlQNCj4gPj4gUkVBRCwgU1RP
UCIuIFNvLCB3ZSBtdXN0IGVuYWJsZSBBWEkgSTJDIGJlZm9yZSByZWFkIGNvdW50IGlzIHNlbnQu
DQo+ID4+DQo+ID4+IFNvLCBpZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5LCB0aGUgWElJQyBJ
UCBpcyBicm9rZW4gYW5kIGNhbm5vdCBiZQ0KPiA+PiBmaXhlZCBpbiBzb2Z0d2FyZSByZWxpYWJs
eSA/IEhvdyBzaGFsbCB3ZSBwcm9jZWVkIHRoZW4gPw0KPiA+DQo+ID4gV2UgYXJlIHRoaW5raW5n
IG9mIHR3byBvcHRpb25zLg0KPiA+IDEuIFRyeWluZyBmb3IgYSBTVyBmaXggdG8gd29ya2Fyb3Vu
ZCB0aGlzIHByb2JsZW0uIFdhaXRpbmcgb24gdGhlIEhXIElQDQo+IHRlYW0gZm9yIGFueSBvdGhl
ciBzdWdnZXN0aW9ucy4NCj4gPiAyLiBYSUlDIElQIGhhcyB0d28gbW9kZXMgb2Ygb3BlcmF0aW9u
IGFzIHN0YXRlZCBpbiB0aGUgdXNlciBndWlkZSAtIER5bmFtaWMNCj4gYW5kIFN0YW5kYXJkIG1v
ZGVzLg0KPiA+IEN1cnJlbnRseSwgdGhlIGxpbnV4IGRyaXZlciBpcyB1c2luZyBvbmx5IGR5bmFt
aWMgbW9kZSBhbmQgdGhpcyBidWcgYXBwZWFycw0KPiBoZXJlLg0KPiA+IFRoZSBTVyBwcm9ncmFt
bWluZyBmb3Igc3RhbmRhcmQgbW9kZSBpcyBkaWZmZXJlbnQgYW5kIHdlIGFyZSB0ZXN0aW5nDQo+
ID4gaXQgZm9yIGFsbCBwb3NzaWJsZSB1c2UgY2FzZXMuIE9uY2UgVGhhdCBjb21lcyBvdXQgc3Vj
Y2Vzc2Z1bCwgd2Ugd2lsbCBzZW5kDQo+IG91dCB0aGUgcGF0Y2hlcy4NCj4gDQo+IElzIHRoaXMg
ZHluYW1pYy9zdGFuZGFyZCBtb2RlIHN3aXRjaGluZyB3aGF0IGlzIGFscmVhZHkgaW4gdGhlIGRv
d25zdHJlYW0NCj4geGlsaW54IGtlcm5lbCB0cmVlID8NCj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxk
IGZpeCB3aGF0IGlzIGFscmVhZHkgdXBzdHJlYW0gZmlyc3QsIGFuZCBvbmx5IHRoZW4gYWRkIG1v
cmUNCj4gY29tcGxleGl0eS4NCg0KWWVzLCBhZ3JlZWQuIEJ1dCwgdGhhdCB3b3VsZCBiZSBhIGhh
cmR3YXJlIGZpeCBpbiB0aGUgZnV0dXJlIElQIHJlbGVhc2UuIFNpbmNlIHdlIGhhdmUNCnRvIHN1
cHBvcnQgZXhpc3RpbmcgSVAgdmVyc2lvbnMsIHdlIGFyZSBwbGFubmluZyB0byB1cHN0cmVhbSB0
aGUgc3RhbmRhcmQgbW9kZQ0KYW5kIGJhc2VkIG9uIHRoZSBEVCBwcm9wZXJ0eSAoSVAgdmVyc2lv
biksIHdlIHdpbGwgc3dpdGNoLg0KDQpUaGFua3MsDQpSYXZpdGVqYSBODQoNCj4gDQo+IFsuLi5d
DQo=
