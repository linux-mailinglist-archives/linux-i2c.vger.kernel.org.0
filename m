Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41222D5C4B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 09:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbfJNH0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 03:26:15 -0400
Received: from mail-eopbgr20089.outbound.protection.outlook.com ([40.107.2.89]:1321
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730143AbfJNH0P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 03:26:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGmU+8aiXkEhppfiKX3+6kcQEX592rlt92i5ps0Hj71mwN4C2ouBI+4rgt9fkWlsapY894wQDFUggM4NE+IU/Vn3lHFNnYJKIX5LDnEwTVeTUCN076Z/LMSQJhH/DhfpjDSEfH/v7AhO0KP5V5Ppzzgq2k3gAXORBDLISIdHGdlOcqxyAEubdc+4XBkilFgn5xQO4wAT8IIj6iI/JLHJvi+NMc9YaLfVggiX187Lf92aOViGq0RwUbs0DUz1vNEif6oDcAcqN7eYeqIoK6NsIGWHh+Cg/luVolgEaLgOFLi3WbexUjsFTkE5PRq3C6zVxb6PU06z/tbfqiRWrDC8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSBhFMJDo95cMam4VT8nJNMy8fh9ur3g0Fp6TJ+UmLM=;
 b=WDCc6+97L23TMOPE/LLptQw2Wfo7n01wHcAq2zjKuS+xMj5HmX0H7Pcd7NwSaB1woeB2StMT3T99bKzWIHwK86KAZavXwNVOkWxxqx5GP8mJjLqVQxKgSP/mIV1KU3aI0fZ4c22ui3XWidxZ/w1A6kLqYTIauq1KHEKix0kjbq/6Ft+ck63WzyRm6zmKiFKEEp+RuFjYnLLzRyx05aeDwaOhLNASBKYyjwy42V0YJYbTdknKsUtcF3/BaATG7Oz6/FOnWShKk6mSWZJyPXnaCvrqfNaKYb4RDoDMnOt/+nbDau6nN8pnFaJxkJQEgoFDqo03zFKX9mMQ+kyUpyrO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSBhFMJDo95cMam4VT8nJNMy8fh9ur3g0Fp6TJ+UmLM=;
 b=lmWHjg/tTRYpWf9ondq95qbMmIzeSVGIvmnc93Ygl0fNL8RGP5F4iO1WO6kRchBfwZV6px/1YeJri6m/SEEVGtXaFwKlJMFgqho87wOX+azO1+AQNXB/q/LYP8oiP4Gz/2CJr87hQcg9JIf4KJ88EKmXZEPzxdLHc80NX3Vpy+M=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4571.eurprd04.prod.outlook.com (52.135.138.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 14 Oct 2019 07:26:08 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 07:26:08 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>
CC:     Leo Li <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional
 property i2c-mux-never-disable
Thread-Topic: [EXT] Re: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional
 property i2c-mux-never-disable
Thread-Index: AQHVd0AjWQ46ExUKLEmir/xZNG/rOadVlliAgAP3v4CAAA1qYIAAMcgAgAAFJpA=
Date:   Mon, 14 Oct 2019 07:26:08 +0000
Message-ID: <DB7PR04MB44909C61005D3A498E372C8F8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190930032503.44425-1-biwen.li@nxp.com>
 <20190930032503.44425-2-biwen.li@nxp.com> <20191011144445.GA2340@bogus>
 <DB7PR04MB44908DE0F57E985ED40C401A8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <DB7PR04MB4490094F26EA412D4D9F5CF98F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <1f0c4d52-03d5-2947-f701-a0b5ab46c8e0@axentia.se>
In-Reply-To: <1f0c4d52-03d5-2947-f701-a0b5ab46c8e0@axentia.se>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b42cb37b-83ae-4137-8566-08d75077c82f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB4571:|DB7PR04MB4571:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4571E05E9AC292EAA127662F8F900@DB7PR04MB4571.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(37524003)(86362001)(66066001)(5660300002)(4326008)(66946007)(64756008)(66446008)(66556008)(66476007)(9686003)(316002)(55016002)(6306002)(6246003)(6436002)(229853002)(52536014)(110136005)(54906003)(76116006)(4001150100001)(8676002)(966005)(45080400002)(11346002)(446003)(6116002)(478600001)(3846002)(476003)(486006)(256004)(14454004)(14444005)(76176011)(74316002)(26005)(6506007)(53546011)(2906002)(7696005)(44832011)(186003)(25786009)(71200400001)(71190400001)(102836004)(305945005)(8936002)(81156014)(81166006)(33656002)(99286004)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4571;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AqYyrCHzqa/QsuQSx5kSURVTvUcyPZWi5aN6AG4M7qU7VrRwzoKUe87ZPzQV+VvbFQa4TKiWvrwzSALD7ygO4Qnk/j+hk8Y5r1Zz80PF0R+iI42mzap1fMWs2xJOrRI77rLVzg3+GModiztld17E9lhtPsRFg/7Nrjmbfw+y7goBNUgaK4E5o74IiT1SzUJeqD9sEtAq1/uyj2bObA/AIGiMSybFJTi6QMdFMyvu7e6E8ykIekyD9cH7wEsovvAkt7efKqvYeuAbnYE62mQbufRy14PJxoeLwtqX2OvnlnnapEuNfhRqZlzRhv9JBoS2LlByd3giHqIzgXrSLF64oqdKfKMVm/PYGktsblQ+dY7JaHHPfmWEo+l7k6RDr0WkMko6N8qnbibl9esbRmjDZ0ef88EnX3Ds3mjwEot066KrgwobT8leY1Vc4e5KMtd/+MKptKi+fsC7NozNjo8zDQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42cb37b-83ae-4137-8566-08d75077c82f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 07:26:08.5382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLFRhSrw845YVuCJdQ7clcUi9odfE6YIhWW0m1roUj5R2ZK6qUqB4M3pFCqNFADypFA8umFsMLQo32/VnSz9CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4571
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gT24gMjAxOS0xMC0xNCAwNjoxNiwgQml3ZW4gTGkgd3JvdGU6DQo+ID4+DQo+ID4+Pg0K
PiA+Pj4gT24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MjU6MDNBTSArMDgwMCwgQml3ZW4gTGkg
d3JvdGU6DQo+ID4+Pj4gVGhlIHBhdGNoIGFkZHMgYW4gb3B0aW9uYWwgcHJvcGVydHkgaTJjLW11
eC1uZXZlci1kaXNhYmxlDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8
Yml3ZW4ubGlAbnhwLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+PiBDaGFuZ2UgaW4gdjI6DQo+ID4+
Pj4gICAgICAgLSB1cGRhdGUgZG9jdW1lbnRhdGlvbg0KPiA+Pj4+DQo+ID4+Pj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1wY2E5NTR4LnR4dCB8IDEgKw0K
PiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPj4+Pg0KPiA+Pj4+IGRp
ZmYgLS1naXQNCj4gPj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
aTJjLW11eC1wY2E5NTR4LnR4dA0KPiA+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0DQo+ID4+Pj4gaW5kZXggMzBhYzZhNjBmMDQx
Li43MWI3M2QwZmRiNjIgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0DQo+ID4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0DQo+ID4+
Pj4gQEAgLTM0LDYgKzM0LDcgQEAgT3B0aW9uYWwgUHJvcGVydGllczoNCj4gPj4+PiAgICAgIC0g
Zmlyc3QgY2VsbCBpcyB0aGUgcGluIG51bWJlcg0KPiA+Pj4+ICAgICAgLSBzZWNvbmQgY2VsbCBp
cyB1c2VkIHRvIHNwZWNpZnkgZmxhZ3MuDQo+ID4+Pj4gICAgICBTZWUgYWxzbw0KPiA+Pj4+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pbnRl
cnJ1cHRzLnQNCj4gPj4+PiB4DQo+ID4+Pj4gdA0KPiA+Pj4+ICsgIC0gaTJjLW11eC1uZXZlci1k
aXNhYmxlOiBhbHdheXMgZm9yY2VzIG11eCB0byBiZSBlbmFibGVkLg0KPiA+Pj4NCj4gPj4+IEVp
dGhlciBuZWVkcyB0byBoYXZlIGEgdmVuZG9yIHByZWZpeCBvciBiZSBkb2N1bWVudGVkIGFzIGEg
Y29tbW9uDQo+ID4+PiBwcm9wZXJ0eS4NCj4gPiBJIGNob29zZSB0byBiZSBkb2N1bWVudGVkIGFz
IGEgY29tbW9uIHByb3BlcnR5Lg0KPiANCj4gQ2FuIHdlIHBsZWFzZSBqdXN0IGRyb3AgdGhlIG5l
dmVyLWRpc2FibGUgYXBwcm9hY2ggYW5kIGZvY3VzIG9uIGlkbGUtc3RhdGUNCj4gaW5zdGVhZD8N
Ckkgd2lsbCBmb2N1cyBvbiBpZGxlLXN0YXRlIHByb3BlcnR5LCB0aGFua3MuDQo+IA0KPiA+Pj4N
Cj4gPj4+IElJUkMsIHdlIGFscmVhZHkgaGF2ZSBhIHByb3BlcnR5IGZvciBtdXggZGVmYXVsdCBz
dGF0ZSB3aGljaCBzZWVtcw0KPiA+Pj4gbGlrZSB0aGF0IHdvdWxkIGNvdmVyIHRoaXMgdW5sZXNz
IHlvdSBuZWVkIHRvIGxlYXZlIGl0IGluIGRpZmZlcmVudCBzdGF0ZXMuDQo+ID4+IE9rYXksIHlv
dSBhcmUgcmlnaHQsIHRoYW5rIHlvdSBzbyBtdWNoLiBJIHdpbGwgdHJ5IGl0IGluIHYzLg0KPiA+
IERvIHlvdSBtZWFuIHRoYXQgdGhlIHByb3BlcnR5IGlzIGkyYy1tdXgtaWRsZS1kaXNjb25uZWN0
IGluDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1wY2E5
NTR4LnR4dD8NCj4gPiBJZiBzbywgdGhlIHByb3BlcnR5IGkyYy1tdXgtaWRsZS1kaXNjb25uZWN0
IGlzIG5vdCBnb29kIGZvciBtZS4NCj4gPiBCZWNhdXNlIGNvbmRpdGlvbiBvZiB0aGUgcHJvcGVy
dHkgaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QgaXMgaW4gaWRsZQ0KPiBzdGF0ZShzb21ldGltZXMp
Lg0KPiA+IEJ1dCBJIG5lZWQgYWx3YXlzIGVuYWJsZSBpMmMgbXVsdGlwbGV4ZXIgaW4gd2hhdGV2
ZXIgc3RhdGUoYW55dGltZSksIHNvIEkNCj4gYWRkIGEgY29tbW9uIHByb3BlcnR5IGkyYy1tdXgt
bmV2ZXItZGlzYWJsZS4NCj4gDQo+IE5vLCBJIGRvIG5vdCB0aGluayBhbnkgbmV3IHByb3BlcnR5
IGlzIG5lZWRlZC4gQUZBSUNULCBpZGxlLXN0YXRlIGZpdHMNCj4gcGVyZmVjdGx5LCBhbmQgSSB3
aWxsIG5vdCBjb25zaWRlciB0aGlzIGkyYy1tdXgtbmV2ZXItZGlzYWJsZSBhcHByb2FjaCB1bnRp
bA0KPiBzb21lIGNvbXBlbGxpbmcgcmVhc29uIGlzIHByZXNlbnRlZCB3aHkgaWRsZS1zdGF0ZSBp
cyBub3QgYXBwcm9wcmlhdGUuIFlvdQ0KPiBwcm9taXNlZCB0byB0YWtlIGEgc3RhYiBhdCBpdCwg
YW5kIHVudGlsIEkgaGVhciBiYWNrIG9uIHRoYXQsIHRoaXMgc2VyaWVzIGlzIG9uDQo+IGhvbGQu
IEFzIGluZGljYXRlZCBoZXJlIFsxXS4NCj4gDQo+IFlvdSBuZWVkIHRvIHBhdGNoIHRoZSBkcml2
ZXIgdG8gbG9vayBhdCB0aGUgaWRsZS1zdGF0ZSBwcm9wZXJ0eSBpbnN0ZWFkIG9mDQo+IGludmVu
dGluZyBhIG5ldyAoYW5kIGxlc3MgZmxleGlibGUpIHByb3BlcnR5LiBJZiB5b3UgaW1wbGVtZW50
IGlkbGUtc3RhdGUgZm9yDQo+IHRoaXMgZHJpdmVyIGFuZCBzZXQgdGhlIGlkbGUtc3RhdGUgdG8g
c29tZSBjaGFubmVsIGluIHRoZSBkdHMsIHRoZSBtdXggd2lsbA0KPiBuZXZlciBkaXNjb25uZWN0
LiBQcm9ibGVtIHNvbHZlZC4NCj4gUGVyaGFwcyBub3QgeW91ciBmaXJzdCBzb2x1dGlvbiwgYnV0
IGl0IGRvZXMgc29sdmUgeW91ciBwcm9ibGVtIGFuZCBtYXkNCj4gYWN0dWFsbHkgYmUgdXNlZnVs
IGZvciBvdGhlciBwdXJwb3NlcyB0aGFuIHlvdXIgYnJva2VuIGhhcmR3YXJlLg0KPiBBbmQgaXQg
aXMgY29uc2lzdGVudCBhY3Jvc3Mgb3RoZXIgaTJjLW11eGVzLiBJIHNlZSBubyBkb3duc2lkZS4N
CkdvdCBpdCwgdGhhbmtzLCBJIHdpbGwgdHJ5IGl0Lg0KPiANCj4gQ2hlZXJzLA0KPiBQZXRlcg0K
PiANCj4gWzFdDQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxvcmUuaw0KPiBlcm5lbC5vcmclMkZsa21sJTJGMDdkODU3
NDgtMDcyMS0zOWQ0LWQyYmUtMTNlYjE2YjBmMWRlJTQwYXhlbnRpDQo+IGEuc2UlMkYmYW1wO2Rh
dGE9MDIlN0MwMSU3Q2Jpd2VuLmxpJTQwbnhwLmNvbSU3QzRmZGVhMDJiNDhiOTQNCj4gZWQxMDMx
ZjA4ZDc1MDc1MDlhYyU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCUNCj4g
N0MwJTdDNjM3MDY2MzM1OTE0MDM4MjUzJmFtcDtzZGF0YT1hWmZ4RGhMUFglMkZTTUZHdVc4cnlN
DQo+ICUyQmN4UWV0RlVEcGR4eExhJTJCdVVRczdJNCUzRCZhbXA7cmVzZXJ2ZWQ9MA0K
