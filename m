Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283233CFC35
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jul 2021 16:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238704AbhGTNqZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jul 2021 09:46:25 -0400
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com ([40.107.223.58]:63360
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239804AbhGTNjK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Jul 2021 09:39:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRRg8rciue0QAKuLqDF/j4qXhkQAXO2Q5WjpeIl77M48IJjOFrbRLVSeUx7jwgy0H+O+IsUpxdQjDIrMobS+XPTqXFKqcMxbPhBnW055xNmfUTKZacQS3xtF5wPJWVDwrzX7zTUPVWm5hZoL7HjVmh1fKh2svQ2EAem1jHMI65cqM3xzQLNZhHlsxE3UB+XW7+Lqr522UnEc/6MK0jwUt3SahIOujB0wjiShqvxqO1lJk7+adcjMGw/KpOu9NXXx2jxjGZWZXAmLESqIR/Bd08OXwEcVX6t9uNGhGebTDAM43eFjTcR11jEKLVHYukkNMEnL+I8gJfzBO9ldIbFOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPTwVK44EMUdMNW6HY71cVtSNPSpOfjI59CbDjcOx10=;
 b=UkUvVNhxBP7LEQksV2/a53A4d2njcLjLThYPmI8p1pRH9Ho1wcA/isdNEkgHLQszu+8Hh4+GnX0mmIaGSvLUkQb09GOr4+p27dW5BnKAmfMBy6MZ6m8qG1s1A0nYLdD2pRzfUsqolSyE3FrcHptV1FRNxgueOEU92Ob83lsZ8ckRad9u6JE98K6vypfuAUZKSEAa/pjy81Or9usko051I2ODuKAMw+3GVCWXRa8lmaUpi1PxETetiWSKx6bPWCjXu8o8lnduk8+PBsuLLnwg2Z1h22V+mH/ymwftatBjOT2s5dLilCUVnTuoy1ePInRYtP0IIS7fmNZ5czjHLRUlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPTwVK44EMUdMNW6HY71cVtSNPSpOfjI59CbDjcOx10=;
 b=LoqzISkb36bNPuZaUeHTiuGKQl55OCr/sUDfOR38fQAelMzUC8QzPHRya6dnhHvC4CI0igVfhj7XYJ7H1p/BVxjeqwEslQxKWJNuMAZda6iSnsl5H2qqJef0fZSMihc3/yt9Er8vdhIEuSVFZUKQa+xyH05P/MoLtkI0wszY8d0=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SN6PR02MB3999.namprd02.prod.outlook.com (2603:10b6:805:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 14:19:36 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601%6]) with mapi id 15.20.4331.026; Tue, 20 Jul 2021
 14:19:36 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>, Michal Simek <michals@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>
Subject: RE: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Topic: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Index: AQHXanX+JNOMVW+1VkKFPhgte5uemqspB/+AgBzauQCABE5f4IAAidyAgADKNnA=
Date:   Tue, 20 Jul 2021 14:19:36 +0000
Message-ID: <SN6PR02MB4093C7F2EB59D854D8753A01CAE29@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
 <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
 <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
In-Reply-To: <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37666420-70c4-49dc-861f-08d94b89673e
x-ms-traffictypediagnostic: SN6PR02MB3999:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB3999691D6A3D7EB96D0A2BA2CAE29@SN6PR02MB3999.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fFQ+4X7Wa3jwfpNx/6nJAdeejd0C8YDeMbfXzVC0YdQ3IGWwSdc+w7OyAZLF24cVOLcZ82Bm2diQdFKBBS2g6dTqHXlkn9vIdxT4z5hqVQcXzcyg3hZia0GWiTcTfHxcbYQ1WZTiyfeqZ5a9+z+2o2x6XxnPeZMyjhpAjeVujos7n2G0Zm/60GPi5xVWLEtJOD7od6xPp5PBNFInxu3fk/Bd4jnpxSHhooE2P0ezbXD0mFJ0DOP15NHJ03w10ufhjlpqBFzF9YhBzOinHYCEKAhHX6mNrT91J6rfeaAhHtf+cV0i9aV38ZW8YE+z5+eAeos3TA98FDXvCtSy22aPkfsKQtthoCjUFrvMFbnkemiEsJQnS7r0f74zhgqLrxc6z9a/pKoWaUs/TfcuTAhA/+8lNbCAxiTFpKSDfcavCx8FFRdHuFJ6FVj8rZOrL8FJlQPtWvBONS1gQO+TKiP42Vykwy7WLnF/CnJ17JybLM8cWHgUTn+RCKzVD7DBz8V7Cm1WOatwdDF2iPR8gtjiHj1kufleBxUPiugs9UuPuCfRhwkgAHvasHouCkOJYRK25SRjRrWbzjoIneqq09SYFrBwKUQ18KEVLsyk2TMaSUZa84x473J0toDWJjTBc8yFoUee7YQssLy8w6j+/DGzZmGfQGQQmyJXlhEAWh53YJLzVTBTQHMYbXsn0LKDT2SGip8TfbRnL7Nmz19+amoAN+vweCKiLf5kKwXdYFx8fysFvlvcxfZfs3En6XExF7SuvzWbn0K6w8GTW2svHZ5WOmvcIZwhYa6Dr/XhutGhGO0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(6506007)(53546011)(54906003)(52536014)(110136005)(4326008)(33656002)(478600001)(86362001)(186003)(8936002)(8676002)(122000001)(316002)(66946007)(66446008)(966005)(5660300002)(38100700002)(64756008)(9686003)(66476007)(26005)(55016002)(71200400001)(83380400001)(7696005)(2906002)(76116006)(66556008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDBQUXRnYzZFY3FsRzhPTk0rUW5ZNlptTEpmQTdVS1d5VXhKRFlQT1lFQlJz?=
 =?utf-8?B?MEdGcHVQWW9CTDdRUHRiQWZPSTdCcHgyY1BuNDlxNVNRWUVlTXp3cjBkeEdH?=
 =?utf-8?B?VDl5TVJUSVJwNWFoLy9KdlJSY0xiRTBRVDZ3anlwNU1oNXVQbmJtbFdicjVn?=
 =?utf-8?B?a0RyL1pwTlFxLzkzN2lOUjQ1VXBrQmpDUEFPdTdxeWMzVkgyNFdqblZQOGhB?=
 =?utf-8?B?OERWTnlxSmhtQW9CRjk1QWtMVFFqWG9OOUhmdTBPUmVWaVprZ1k5eFIwQUR2?=
 =?utf-8?B?NVlVVWhVQ09tRXg4OGd4SFl4bWc4N3k1dWZZQ0xFa2VteFVJZ0g4YUNHeGVP?=
 =?utf-8?B?YU1HTHdudTMyS3d0c1JBb3RMWnFHUmpLWFM4ZGdTcTArbTFJQ2NBL2QxeS84?=
 =?utf-8?B?SkNmbURQSnNpNm5jZllyWWw5Z1lDc2d4ZW0vNk42U0VOSW9PZnJSYkNOYlk3?=
 =?utf-8?B?TnI0YklNL1dHRVA1S1FwQnJqS2V5RFhQN0VzWmo1MWdNTXBkVUlXZmNyUFFq?=
 =?utf-8?B?TXdseFF2eXZPWWJwSHJiazBmTXVna2RaaGo3bWoxckc1QXF0dHM5V0VubXpq?=
 =?utf-8?B?R3pTWUlpSVNKa3FjUmdpRW1VWHpJY0RVaG9HcGJwSi8xbjFPZzRoZ1dHTjhM?=
 =?utf-8?B?RC9oU0hQSUM1RnVzTXJNM2Nrakc0YS9FekhUL0FBYWtOZW1nOXlGYUJEZWN3?=
 =?utf-8?B?cGFJQnFzWG1HbGc5dXZhUkZra2t2S04raW9oWXBqeVNaSVVvMCs2VTRPWDd4?=
 =?utf-8?B?cUQyLzhlVnlvSmhxQ0IzNHdMdXdtdEtNbDlFQUhiMXVrSkhPT09GQkxEVTVD?=
 =?utf-8?B?TFlJa0MrbVNyZTFIeVUxdC9kWUgwUDJGMDh5MUN6Z3EybTF2SWlURXVDRlJj?=
 =?utf-8?B?NE5mOTRNNWlqV3cwUG81bUlPRGZpeDBhMWJFQ242QTVxcmZQRmtEemZrZ2gz?=
 =?utf-8?B?clh1S3FBclhNZ0x6UHNQREF1TkRBV2hvc1FaakpXVldSVS9na0U2QUJxMVZP?=
 =?utf-8?B?SWRLZlhXQ2N5UUVmUThUdWlDanVjRjFqKzRKYU5CeEEwb3JPZFg0N2t5Qzhy?=
 =?utf-8?B?WU1rN2ZVem5xSzQ0SWViSlIrcFUyWFhTUkNNOVZyOHlUSytBSmI4STczOWI0?=
 =?utf-8?B?Sm56RGloQ3dESlVTdCtCYlVXY3Nucm4ybjJvNjhPYTcweU90SENxdUY5RHhN?=
 =?utf-8?B?QkFIVFZic2I1bmtJalZnQXQxeWdLamd4bWJrdlpnNHFrMmpaY2R5UVZ1Qlpp?=
 =?utf-8?B?NG9FcnpNTEJ1SFAzM2pJSUtnSVVNNlh5YXhsVnlrVEczank0R2ZObGJwWmJx?=
 =?utf-8?B?VTVJcHU1TEFvc3FFZTdYdXFqaXdvdjB1RlB3Ukh2aDBya2tsNU85d2FSdU1h?=
 =?utf-8?B?aUhHQTdDMks0TDhRd0NlQ1o1V25BeGlaRVl2MXdTL3hScHR1bHBJMGU4Rmhq?=
 =?utf-8?B?d2tXc29DUHZIcUdRblNpL2JHbTJJTWo4Y2VGM2lPUkV2dGdpbmtTNlFyZWpj?=
 =?utf-8?B?eVFjbSt1dTJDVnkvUkhXQSt1elp1cVdZZG52OGNhVUo4dFVncy9CQWl6MWdj?=
 =?utf-8?B?OElLTWxLclRZWmZlcnJxcEs5S29FYWJFb0FSTWJ6SVBBS2ZDVFNWRERsL21B?=
 =?utf-8?B?aTluaVIvcjh0eXRLNDM4L1ZEeFhnQU5Hc2xSelFIOFZBYW9SU01VUEtQaUV4?=
 =?utf-8?B?dnhaSVl6YWVaVHp6V2JNM1RKMjJQZU1wb285OVN2QWhHUHh1aE9GSDBpbU4x?=
 =?utf-8?Q?kz6aesuKykJxRc6mTnoYU7of++CWIZB2StmneeR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37666420-70c4-49dc-861f-08d94b89673e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 14:19:36.3200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hvn5fT2HB4/D8ovAzLC/URpEo83lo8Qn5lKQfj6DXcQ0Ro+he/0gyVcA7rW0eiqR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3999
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxOSwgMjAyMSAxMTozMCBQTQ0KPiBU
bzogUmF2aXRlamEgTmFyYXlhbmFtIDxybmFAeGlsaW54LmNvbT47IE1pY2hhbCBTaW1law0KPiA8
bWljaGFsc0B4aWxpbnguY29tPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBnaXQNCj4gPGdpdEB4aWxpbnguY29tPjsgam9lQHBlcmNoZXMuY29tDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMDAvMTBdIGkyYzogeGlpYzogQWRkIGZlYXR1cmVzLCBidWcgZml4
ZXMuDQo+IA0KPiBPbiA3LzE5LzIxIDEyOjA5IFBNLCBSYXZpdGVqYSBOYXJheWFuYW0gd3JvdGU6
DQo+IA0KPiBIaSwNCj4gDQo+IFsuLi5dDQo+IA0KPiA+Pj4+IC1BZGQgJ3N0YW5kYXJkIG1vZGUn
IGZlYXR1cmUgZm9yIHJlYWRzID4gMjU1IGJ5dGVzLg0KPiA+Pj4+IC1BZGQgJ3NtYnVzIGJsb2Nr
IHJlYWQnIGZ1bmN0aW9uYWxpdHkuDQo+ID4+Pj4gLUFkZCAneGxueCxheGktaWljLTIuMScgbmV3
IElQIHZlcnNpb24gc3VwcG9ydC4NCj4gPj4+PiAtU3dpdGNoIHRvICdBWEkgSTJDIHN0YW5kYXJk
IG1vZGUnIGZvciBpMmMgcmVhZHMgaW4gYWZmZWN0ZWQgSVAgdmVyc2lvbnMuDQo+ID4+Pj4gLVJl
bW92ZSAnbG9jYWxfaXJxX3NhdmUvcmVzdG9yZScgY2FsbHMgYXMgZGlzY3Vzc2VkIGhlcmU6DQo+
ID4+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWkyYy9tc2c0NjQ4My5odG1s
Lg0KPiA+Pj4+IC1Tb21lIHRyaXZpYWwgZml4ZXMuDQo+ID4+Pj4NCj4gPj4+PiBDaGFuZ2VzIGlu
IHYyOg0KPiA+Pj4+IC1Hcm91cGVkIHRoZSBjb21taXRzIGFzIGZpeGVzIGZpcnN0IGFuZCB0aGVu
IGZlYXR1cmVzLg0KPiA+Pj4+IC1UaGUgZmlyc3QgNCBjb21taXRzIGZpeCB0aGUgZHluYW1pYyBt
b2RlIGJyb2tlbiBmZWF0dXJlLg0KPiA+Pj4+IC1Db3JyZWN0ZWQgdGhlIGluZGVudGF0aW9uIGlu
IGNvZGluZyBzdHlsZSBpc3N1ZXMuDQo+ID4+Pj4NCj4gPj4+PiBNaWNoYWwgU2ltZWsgKDEpOg0K
PiA+Pj4+ICAgICBpMmM6IHhpaWM6IEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzDQo+ID4+Pj4NCj4g
Pj4+PiBSYXZpdGVqYSBOYXJheWFuYW0gKDcpOg0KPiA+Pj4+ICAgICBpMmM6IHhpaWM6IEZpeCBU
eCBJbnRlcnJ1cHQgcGF0aCBmb3IgZ3JvdXBlZCBtZXNzYWdlcw0KPiA+Pj4+ICAgICBpMmM6IHhp
aWM6IEFkZCBzdGFuZGFyZCBtb2RlIHN1cHBvcnQgZm9yID4gMjU1IGJ5dGUgcmVhZCB0cmFuc2Zl
cnMNCj4gPj4+PiAgICAgaTJjOiB4aWljOiBTd2l0Y2ggdG8gWGlpYyBzdGFuZGFyZCBtb2RlIGZv
ciBpMmMtcmVhZA0KPiA+Pj4+ICAgICBpMmM6IHhpaWM6IFJlbW92ZSBpbnRlcnJ1cHQgZW5hYmxl
L2Rpc2FibGUgaW4gUnggcGF0aA0KPiA+Pj4+ICAgICBkdC1iaW5kaW5nczogaTJjOiB4aWljOiBB
ZGQgJ3hsbngsYXhpLWlpYy0yLjEnIHRvIGNvbXBhdGlibGUNCj4gPj4+PiAgICAgaTJjOiB4aWlj
OiBVcGRhdGUgY29tcGF0aWJsZSB3aXRoIG5ldyBJUCB2ZXJzaW9uDQo+ID4+Pj4gICAgIGkyYzog
eGlpYzogQWRkIHNtYnVzX2Jsb2NrX3JlYWQgZnVuY3Rpb25hbGl0eQ0KPiA+Pj4+DQo+ID4+Pj4g
U2h1YmhyYWp5b3RpIERhdHRhICgyKToNCj4gPj4+PiAgICAgaTJjOiB4aWljOiBSZXR1cm4gdmFs
dWUgb2YgeGlpY19yZWluaXQNCj4gPj4+PiAgICAgaTJjOiB4aWljOiBGaXggdGhlIHR5cGUgY2hl
Y2sgZm9yIHhpaWNfd2FrZXVwDQo+ID4+Pj4NCj4gPj4+PiAgICAuLi4vYmluZGluZ3MvaTJjL3hs
bngseHBzLWlpYy0yLjAwLmEueWFtbCAgICAgfCAgIDQgKy0NCj4gPj4+PiAgICBkcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXhpaWMuYyAgICAgICAgICAgICAgICAgfCA1OTMgKysrKysrKysrKysrKyst
LS0tDQo+ID4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA0ODcgaW5zZXJ0aW9ucygrKSwgMTEwIGRl
bGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gQWNrZWQtYnk6IE1pY2hhbCBTaW1layA8
bWljaGFsLnNpbWVrQHhpbGlueC5jb20+DQo+ID4+DQo+ID4+IEkganVzdCB0ZXN0ZWQgdGhpcyBw
YXRjaHNldCBvbiBuZXh0LTIwMjEwNzE2IGFuZCB0aGUgWElJQyBmYWlsdXJlcw0KPiA+PiBhcmUg
c3RpbGwgcHJlc2VudCwgc2VlOg0KPiA+DQo+ID4gVGhlIHByb2JlIG9mICcgYXRtZWxfbXh0X3Rz
JyBmYWlsZWQgYXMgcGVyIHRoZSBlcnJvci4gTWF5IEkga25vdyB0aGUNCj4gPiBkZXRhaWxzIG9m
IHlvdXIgdGVzdCBjYXNlIGlmIHlvdSB0d2Vha2VkIGFueSBpMmN0cmFuc2ZlcnMvYWRkZWQgZGVs
YXlzLg0KPiANCj4gSXQgaXMgc3RpbGwgdGhlIHNhbWUgdGVzdCBjYXNlIGZyb20gYSB5ZWFyIGFn
byAtLSBBdG1lbCBNWFQgdG91Y2hzY3JlZW4NCj4gY29udHJvbGxlciBjb25uZWN0ZWQgdG8gWElJ
QyBJMkMgSVAgaW4gWnlucU1QIEZQR0EsIGJvdGggZHJpdmVycyBhcmUNCj4gY29tcGlsZWQgaW50
byB0aGUga2VybmVsLiBBbHNvLCBpdCBpcyBub3QgdGhlICJuZXciIFhJSUMgSVAgcmV2aXNpb24s
IGJ1dCBvbGRlcg0KPiBvbmUgZnJvbSBWaXZhZG8gMjAxOSBvciBzby4NCj4gDQo+ID4gSWYgaXQg
ZmFpbGVkIHdpdGhvdXQgYWRkaW5nIGFueXRoaW5nLCB0aGVuIHBsZWFzZSBjaGVjayB3aGV0aGVy
IHRoZQ0KPiA+IHZpdmFkbyBkZXNpZ24gY29uc3RyYWludHMgYXJlIGNvcnJlY3RseSBhcHBsaWVk
IG9yIG5vdC4NCj4gDQo+IFRoZXkgYXJlLCB3ZSBhbHJlYWR5IGNoZWNrZWQgbXVsdGlwbGUgdGlt
ZXMgYW5kIHRoZSBGUEdBIHBhcnQgaXMgT0suDQo+IA0KPiA+IEFsc28gY2hlY2sgaWYgdGhlIG90
aGVyIGRldmljZXMgb24gdGhlIGJ1cyBhcmUgZGV0ZWN0ZWQgYW5kIGkyY3RyYW5zZmVyDQo+IGNv
bW1hbmQgaXMgc3VjY2Vzc2Z1bCBvbiB0aGVtLg0KPiANCj4gTm90ZSB0aGF0IHRoaXMgcHJvYmxl
bSBpcyB2ZXJ5IGxpa2VseSBhIHJhY2UgY29uZGl0aW9uIGluIHRoZSBYSUlDIGRyaXZlciwgc28g
YQ0KPiB0cml2aWFsIHRlc3QgbGlrZSBpMmN0cmFuc2ZlciBvbiBpZGxlIHN5c3RlbSBmcm9tIHVz
ZXJzcGFjZSBpcyB1bmxpa2VseSB0byB0cmlnZ2VyDQo+IGl0LiBXaGVuIHRoZSBzeXN0ZW0gaXMg
dW5kZXIgaGVhdnkgbG9hZCBlLmcuDQo+IGR1cmluZyB0aGUga2VybmVsIGJvb3QsIHRoYXQgaXMg
d2hlbiB0aGVzZSBjb3JuZXIgY2FzZXMgc3RhcnQgc2hvd2luZyB1cC4NCg0KVGhhbmtzIGZvciBh
bGwgdGhlIGRldGFpbHMsIE1hcmVrLiANCg0KPiANCj4gPiBJdCB3b3VsZCBiZSBoZWxwZnVsIHRv
IGtub3cgaWYgdGhlIGRldmljZSAnIGF0bWVsX214dF90cycgaXMNCj4gPiBzdWNjZXNzZnVsbHkg
cHJvYmVkIHdpdGggbmV4dC0yMDIxMDcxNiB3aXRob3V0IGFwcGx5aW5nIHRoaXMgcGF0Y2hzZXQu
DQo+IA0KPiBTb21ldGltZXMsIHRoZSBYSUlDIGRyaXZlciBpbiBjdXJyZW50IG1haW5saW5lIExp
bnV4IHN1ZmZlcnMgZnJvbSByYWNlDQo+IGNvbmRpdGlvbnMgb24gU01QLCBzbyBpdCBkZXBlbmRz
Lg0KPiANCj4gVGhlIE1YVCBkcml2ZXIgYWxzbyBoYXMgdG8gYmUgcGF0Y2hlZCB0byBhdm9pZCBs
b25nZXIgdGhhbiAyNTUgYnl0ZQ0KPiB0cmFuc2ZlcnMsIGJlY2F1c2UgdGhhdCBpcyBjdXJyZW50
bHkgYnJva2VuIHdpdGggWElJQy4NCj4gDQo+ID4gSSBoYXZlIHRlc3RlZCB0aGlzIGFnYWluIG9u
IG91ciBib2FyZHMgd2l0aCBlZXByb20gYW5kIG90aGVyIHNlbnNvcnMsIHRoaXMNCj4gaXMgd29y
a2luZyBmaW5lIGZvciB1cy4NCj4gDQo+IENhbiB5b3Ugc2hhcmUgZGV0YWlscyBvZiBob3cgdGhv
c2UgdGVzdHMgd2VyZSBwZXJmb3JtZWQgPw0KDQpTdHJlc3MgdGVzdCAtIDE6DQpIZWF2eSBldGhl
cm5ldCB0cmFmZmljIHJ1bm5pbmcgaW4gdGhlIGJhY2tncm91bmQuIA0KSTJjIGNvbW1hbmRzIHNj
cmlwdCAobGlrZSBiZWxvdykgcnVubmluZy4gV2UgY2FuIHNlZSB2aXNpYmxlIHN0dXR0ZXIgaW4g
dGhlIG91dHB1dCBhcyBleHBlY3RlZCwgYnV0IG5vdGhpbmcgZmFpbGVkLg0KDQppPTANCndoaWxl
IFsgMSBdDQpkbw0KCQlpMmN0cmFuc2ZlciAteSAtZiAyIHcxQDBYNTQgMFgwMCByMzFAMFg1NA0K
CQlpMmN0cmFuc2ZlciAteSAtZiAyIHcxQDBYNTQgMFgwMCByMzJAMFg1NA0KCQlpMmN0cmFuc2Zl
ciAteSAtZiAyIHcxQDBYNTQgMFgwMCByMjU1QDBYNTQNCgkJaTJjdHJhbnNmZXIgLXkgLWYgMiB3
MUAwWDU0IDBYMDAgcjI3M0AwWDU0DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkyY3Ry
YW5zZmVyIC15IC1mIDIgdzFAMFg1NCAwWDAwIHIxQDBYNTQNCiAgICAgICAgaT0kKGV4cHIgJGkg
KyAxKQ0KICAgICAgICBlY2hvICIkaSINCmRvbmUNCg0KU3RyZXNzIHRlc3QgLSAyOg0KVHdvIGky
YyBzY3JpcHRzIHJ1bm5pbmcgaW4gcGFyYWxsZWwgd2l0aCBjb21tYW5kcyBhcyBzaG93biBhYm92
ZSB3aXRoIGRpZmZlcmVudCBidXMgbnVtYmVycyAoYXMgYSByZXN1bHQgb2YgbXV4KSwgYnV0IGdv
aW5nIGludG8gc2FtZSBYSUlDIGFkYXB0ZXIuDQpUaGlzIGlzIGFsc28gd29ya2luZyBmaW5lLg0K
DQpTdHJlc3MgdGVzdCAtIDM6DQpUd28gaTJjIHNjcmlwdHMgcnVubmluZyBpbiBwYXJhbGxlbCB3
aXRoIHNhbWUgY29tbWFuZHMgaW4gc2VwYXJhdGUgdGVybWluYWxzLiBUaGlzIGlzIGFsc28gd29y
a2luZyBmaW5lLg0KDQpGcm9tIHlvdXIgbG9nLCB0aGUgcmFjZSBjb25kaXRpb24gaXMgb2NjdXJy
aW5nIGF0IGJvb3QgdGltZSBkdXJpbmcgaTJjIGNsaWVudHMgcmVnaXN0cmF0aW9uLiBJIGFtIHN0
YXJ0aW5nIGEgc2ltaWxhciB0ZXN0IGF0IG15IHNldHVwDQp0byByZXByb2R1Y2UgdGhpcyBpc3N1
ZSBhdCBib290IHRpbWUuDQoNClJlZ2FyZHMsDQpSYXZpdGVqYSBODQoNCg==
