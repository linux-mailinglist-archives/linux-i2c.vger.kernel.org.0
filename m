Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED5A91072CE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 14:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfKVNKe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 08:10:34 -0500
Received: from mail-eopbgr70114.outbound.protection.outlook.com ([40.107.7.114]:43281
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726568AbfKVNKd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Nov 2019 08:10:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpSnXCDsq17BRTYzH0jbRoSal1RuHtVcCYhDvWceAHZ4z6NZ5BxuBcpb2F2V4Og56BzWl2M2SmojoVis3sMs8WJqBg4ofe+BNNSAyhopi0rosyK3dou7cdhcBEvzDhvuNfa4MaDq/uvIFy0P7gISIWy3+SMeIhb5IOMfcFpf8PfpEM1h13CyA8Oe7cw6+/7Zt6FfYMoJ67aFB+lhBR1MRSAxkJROF4iCo66UEspDOBXtJJDrAgn0AW6ABVXG3n6/lk4/WnYbU64qLbeOpfH0VW+Cg4MRIfmSCII5vHozp/UGWpWOECPT0JEPUbK7icLnFiLUbvEWmbbzqq4VkCK6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOoasKc8ZNyENjMWXnzvdv1TpSgX4uyRLGf97A12y1M=;
 b=LEGVKDJRE2ORT4NvRkcZ+mKj548xPLrzSmyh9a91nsDLMKUoOwcE81RQDacYV6Djb73J7pz8ntTvOtkjbJWHnUu1XmTpRdLWG3bfbC3b2YAH8Nm1LbiZvc+fIoauUE7x4t4uT2xknsyM9MaRxxcZ3Ms1UCjrhcXJFKcU8KEPypeho1PZ2Qn0LgzNQkysrPWyNhsGEnMOgRXEFB6ChJiq34jF3KjkpkGcwk3jT1RFi9s14/OfnE5UT3P8csYQu5kWwRP9fIf6BNiS/I7lYz7rp97Zts/zoxLSvjGIov9ZJoAhZybvkus5UDepTRrjM1izvQgtS+uPHZy37Cu2GFgMHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOoasKc8ZNyENjMWXnzvdv1TpSgX4uyRLGf97A12y1M=;
 b=iNhPb/32Y5+SphHhh59ORBG5e2OnwydR29G3Ivm4kiYgGw3rm+ZgGziVgMVtMC+3RWH5G9ZS9zMprLWEKkO3delfc9AachHRrOvSYpFXb3eSrdKj5wxY1uTm9VV2yFMtDrWx/Sj4J/w0YvK0TGJN+WFVLrRDHnk4NVp3qQ6JrhY=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3561.eurprd02.prod.outlook.com (52.134.68.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Fri, 22 Nov 2019 13:10:28 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.021; Fri, 22 Nov 2019
 13:10:28 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "baylibre-upstreaming@groups.io" <baylibre-upstreaming@groups.io>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: new optional property
 write-protect-gpios
Thread-Topic: [PATCH 1/4] dt-bindings: nvmem: new optional property
 write-protect-gpios
Thread-Index: AQHVn63IAvkou74hpkuKo6Mft+alUqeXJN0AgAAILgA=
Date:   Fri, 22 Nov 2019 13:10:28 +0000
Message-ID: <40a0a19f-fe8f-a670-1a70-d8023acdbe65@axentia.se>
References: <20191120142038.30746-1-ktouil@baylibre.com>
 <20191120142038.30746-2-ktouil@baylibre.com>
 <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
In-Reply-To: <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0301CA0022.eurprd03.prod.outlook.com
 (2603:10a6:3:76::32) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c1bdcdb-2d51-4c64-1cc3-08d76f4d5882
x-ms-traffictypediagnostic: DB3PR0202MB3561:
x-microsoft-antispam-prvs: <DB3PR0202MB35612C5C98432B3691765DF5BC490@DB3PR0202MB3561.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(366004)(39830400003)(199004)(189003)(54906003)(6486002)(8676002)(66946007)(64756008)(66556008)(66476007)(66446008)(256004)(186003)(7416002)(31686004)(6512007)(2616005)(4001150100001)(446003)(11346002)(6436002)(71190400001)(5660300002)(6246003)(2906002)(71200400001)(110136005)(508600001)(58126008)(14454004)(316002)(6116002)(3846002)(102836004)(52116002)(36756003)(76176011)(31696002)(8936002)(25786009)(229853002)(66066001)(65956001)(65806001)(6506007)(53546011)(86362001)(386003)(305945005)(81156014)(81166006)(99286004)(7736002)(26005)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3561;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?b1ZpOEorRzRkcEsrZ09UdHozQkJnYnpZcnRnZHdrNWpwNSs2eVA4anVXVlo2?=
 =?utf-8?B?TFdFdm9iZDdaRGNTVUVHbSthbE5qWTM5a1ZkbzVybU5UT242VWtIaG1HR0Rn?=
 =?utf-8?B?dlcyT3JKMkU2ODdQejZYUFMvOFlqOVpMd3g1czFOWTcyd20vQzFCc2d6cVVx?=
 =?utf-8?B?dWVWVmo4UFFCenJhNGFDZ21DN09HTENOM1NobFc1UVMvQkloc1drTlNsblp6?=
 =?utf-8?B?blUzeGdnM0ZFWWFJZUxnTWpaa1BYQnphQmJsV3A2bitpbU1LRnRyREhaNFp3?=
 =?utf-8?B?cUt4eXlMS2RLcnRoNVJDZFp5TmVMYjRHMjNjSmhhb0J1ZWdXdGtqU2ZwNHdR?=
 =?utf-8?B?OFpCZktZeUxLYVlHWmNyOFN5dTdINld0bFhqbUM2QWtvTk90QS92bFRGWTdm?=
 =?utf-8?B?TlBmRGZuV2Zmam1nVHZQZFFtZVpHNDFlTmRkaFI4NXlSTHJVZDA3VDZJdGUz?=
 =?utf-8?B?eWQrZ1ZCSEdlQUs4NUE3ZkdvbEs4UDBtdDVBeC85TzgxeGZOTUltYlBDbngv?=
 =?utf-8?B?S054SlZQZ1g4c1NPRlYrYkhPRUFENWx0aGxKVnhpYUpLY2hSUFVScEloZ0Vi?=
 =?utf-8?B?clRqSWx4OHZCTkFsWTI1TkFGMEdJYjdab3pRQ2ROLzVkdy9xRklwWFp2RjBF?=
 =?utf-8?B?OWd4dWpjMjk3bHJSdlMwT2RlSHdUUUMzRUMrbmpicEM0NWdEbnp6S2xFR1lB?=
 =?utf-8?B?WjBCRUpZV2RpcmxiTnpYZE9Wak80TnlIWkQ0ekpjQW1JL1NaWnptbXQvMnNk?=
 =?utf-8?B?RFNsdkIxV0poR0F3bnZRMS9POG5mZ0FmdzRwNHVJZFpad3FkTFVES3pMemhH?=
 =?utf-8?B?SjV2L0lxdVhGMXEwR3lndzBvcTMrMk82enpqUjFvdkJsczFkMUMyQ0VjZ1BK?=
 =?utf-8?B?MDJVcFdGUHZkNE4xcjl2bUdQa0pNVzhwWXBhVTRmeDd0bVFzK25IRjE0cm9Z?=
 =?utf-8?B?ZzMwb2ZJYmJRMjJ2YTY0M0QzOTkwREZxUHZoOXJCdnVYeEg1VnE5blc5eWpV?=
 =?utf-8?B?dHRMd01kSjFudU5NVGYxcEd0ZGpwallLMUMwMmc4elFHS1AxSWtCTEJoRlRp?=
 =?utf-8?B?bndxM3hrVndtaFVNYmRaV0FyRXlyOVlndUpiR0s5L0sxdmQxeUVrMHAyclpR?=
 =?utf-8?B?aWpSbWJvd0Nwdi9naG9LZmVPc2tYTlpOT09YdjFwcEkwdkFQOWdKSmVzdFZQ?=
 =?utf-8?B?Mk4vNnpUcUtqNU10MHJTREZjSEh0UmMzazZneHgrQUlrV1B2QUt0a01ORFA2?=
 =?utf-8?B?My9JSXNOWTVDMVh3K3A3djNDU2JmVlBvWlRob2lqTm5NZEI5a2xkbzVqNEhY?=
 =?utf-8?B?MVdvTGZJR1RReHRCVmxid280bU5QOW1VbnRXdXBBSWhDaXVKbXRQczA4T0tm?=
 =?utf-8?B?Wkh2dForemVmKy9ZMGo5bWZsSlhhNHNJQ0ZaMGtiZVAwNlhkWGc3amVxYmEy?=
 =?utf-8?B?MFdMTTduQlFYMXJ1eW1LVUF4ZVJFeWN1TVR5RWlMRzNFYUFyNG9PVWc5SG9Q?=
 =?utf-8?B?dWRDdjdOdldobFFNZFNFNlRZb1k4ZTFGK2gvTysxRHBZR1grVUZ6YWhPMVlQ?=
 =?utf-8?B?Qnhud01RWHhVa2NOZDVYSXR4VmNLdlZkZnpDMmYrR1MvWUZsSnhnSU1CdFZW?=
 =?utf-8?B?U2NBTm9zend6eEttbmhBck9FRCtlajVXTGpkNWVJeUlaSDNpdnU0dGNUN3JO?=
 =?utf-8?B?ZHZPMVQrVUU3bkFXK2R1ZDdlTGNqaDFKdDJzYnZHMmExZVhUcjJobVVVMjJL?=
 =?utf-8?B?QThaU080MEtVNVMyYnNiUjZqU3FZNjBDTDc5SHJaZ2FRdmtwSTVYS0JFei9J?=
 =?utf-8?B?aTZmMmtldlFjc09UQU82SDlwRy8zV25XSkFxU2UzUXk3SVMrYmptNG9ibnoz?=
 =?utf-8?B?a2FuZENiSE1uV3drMzJxY2s3RGdzaDlRSFJwanE5RWNQangyQjY3anl4aW0y?=
 =?utf-8?B?Vm9NM2ZYWis1S1lma0ZyYXRRLzVrNnowY3R4RnJrVklSSStCZDk2NkZsQlZR?=
 =?utf-8?B?L0ZUbkZoak1CTmpFeFNYTE9sUVBsVjdIOFNuQmpzQ2ZMc2ZsUkhhUFlxYnFZ?=
 =?utf-8?B?QlN6WmU4ZDJTSDlhemx0dEtnT3lxMXduTUVaY0VvdTBxcUlmRm5kTmhjSTFH?=
 =?utf-8?B?UWd0bEUyc0N6MzFCYnVDaUFxcVdTTHdndHU3L3FuZ09OSWlxNHdwamg3cjk2?=
 =?utf-8?B?ZFRMYUtQMFBBRVFHRG5NaDhEa3dqdHNTcXpCQ0RrSTFWcm8rK0JCQmhpRGwr?=
 =?utf-8?B?eWNHNjB3ODBqcXJLc0dIMW1zSmw0d3hkRERwMzFINElSSGk2ZEs2SWl1UWVx?=
 =?utf-8?B?TUtna2JoSDhkYk1zbklJKzgwUXRYUUFQMkV0QkVXd1RIS01JZjVvNHZOQXFJ?=
 =?utf-8?B?eHJCV2cxTXJSSU9FVkQ1L01iTnM5UmZhc1J6YjZzNFRuUlArd2d6NGFudWV2?=
 =?utf-8?B?ZCt0OWlUVlR6OE41T1F1WVFCUkh4SHhsRk9hU3ZLMzJMQUE3d3E0TDdVV2h0?=
 =?utf-8?Q?2uE38CcroKe?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B76DC7DCAB44E84891DF1BBB771B99E7@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1bdcdb-2d51-4c64-1cc3-08d76f4d5882
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 13:10:28.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCaYKqmJvl7lynLsUaX/ge6rPBOTJyqv0Oz0O8Qmaju3962sXx5MPszXM9lHPL+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3561
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0yMiAxMzo0MSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gSGkgS2hvdWxvdWQs
DQo+IA0KPiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBJIGp1c3QgaGF2ZSBhIHNlbWFu
dGljIGNvbW1lbnQ6DQo+IA0KPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAzOjIxIFBNIEtob3Vs
b3VkIFRvdWlsIDxrdG91aWxAYmF5bGlicmUuY29tPiB3cm90ZToNCj4gDQo+PiBJbnN0ZWFkIG9m
IG1vZGlmeWluZyBhbGwgdGhlIG1lbW9yeSBkcml2ZXJzIHRvIGNoZWNrIHRoaXMgcGluLCBtYWtl
DQo+PiB0aGUgTlZNRU0gc3Vic3lzdGVtIGNoZWNrIGlmIHRoZSB3cml0ZS1wcm90ZWN0IEdQSU8g
YmVpbmcgcGFzc2VkDQo+PiB0aHJvdWdoIHRoZSBudm1lbV9jb25maWcgb3IgZGVmaW5lZCBpbiB0
aGUgZGV2aWNlIHRyZWUgYW5kIHB1bGwgaXQNCj4+IGxvdyB3aGVuZXZlciB3cml0aW5nIHRvIHRo
ZSBtZW1vcnkuDQo+IA0KPiBJdCBpcyBjbGFpbWVkIHRoYXQgdGhpcyBzaG91bGQgYmUgcHVsbGVk
IGxvdyB0byBhc3NlcnQgaXQgc28gYnkNCj4gZGVmaW5pdGlvbiBpdCBpcyBhY3RpdmUgbG93Lg0K
PiANCj4+ICsgIHdwLWdwaW9zOg0KPj4gKyAgICBkZXNjcmlwdGlvbjoNCj4+ICsgICAgICBHUElP
IHRvIHdoaWNoIHRoZSB3cml0ZS1wcm90ZWN0IHBpbiBvZiB0aGUgY2hpcCBpcyBjb25uZWN0ZWQu
DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBNYW5kYXRlIHRoYXQgdGhlIGZsYWcgaW4gdGhl
IHNlY29uZCBjZWxsIHNob3VsZCBiZSBHUElPX0FDVElWRV9MT1cNCg0KV2hhdCBpZiBzb21ldGhp
bmcgYWxvbmcgdGhhdCB3YXkgZnJvbSBDUFUgdG8gY2hpcCBpbnZlcnRzIHRoZSBzaWduYWwgc3Vj
aA0KdGhhdCB0aGUgc2lnbmFsIGlzIG5vIGxvbmdlciBhY3RpdmUtbG93IHdoZW4gdmlld2VkIGZy
b20gdGhlIENQVSwgZXZlbiBpZg0KaXQgc3RpbGwgaXMgYWN0aXZlIGxvdyB3aGVuIGxvb2tpbmcg
YXQgdGhlIGNoaXAgb25seT8NCg0KWWVzLCB0aGVzZSB0aGluZ3MgaGFwcGVuIGZvciBhbGwga2lu
ZHMgb2YgaHlzdGVyaWNhbCByZWFzb25zLi4uDQoNCkNoZWVycywNClBldGVyDQoNCj4gDQo+PiAg
cGF0dGVyblByb3BlcnRpZXM6DQo+PiAgICAiXi4qQFswLTlhLWZdKyQiOg0KPj4gICAgICB0eXBl
OiBvYmplY3QNCj4+IEBAIC02Niw2ICs3MSw3IEBAIGV4YW1wbGVzOg0KPj4gICAgICAgIHFmcHJv
bTogZWVwcm9tQDcwMDAwMCB7DQo+PiAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
Pj4gICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAgICAgd3AtZ3Bpb3Mg
PSA8JmdwaW8xIDMgMD47DQo+IA0KPiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+
DQo+IHdwLWdwaW9zID0gPCZncGlvMSAzIEdQSU9fQUNUSVZFX0xPVz47DQo+IA0KPiBUaGlzIHdp
bGwgaW4gTGludXggaGF2ZSB0aGUgc2VtYW50aWMgZWZmZWN0IHRoYXQgeW91IG5lZWQgdG8NCj4g
c2V0IHRoZSBvdXRwdXQgaGlnaCB3aXRoIGdwaW9fc2V0X3ZhbChkLCAxKSB0byBhc3NlcnQgaXQN
Cj4gKGRyaXZlIGl0IGxvdykgYnV0IHRoYXQgcmVhbGx5IGRvZXNuJ3QgbWF0dGVyIHRvIHRoZSBk
ZXZpY2UgdHJlZQ0KPiBiaW5kaW5ncywgdGhvc2UgYXJlIE9TLWFnbm9zdGljOiBpZiB0aGUgbGlu
ZSBpcyBhY3RpdmUgbG93IHRoZW4NCj4gaXQgc2hvdWxkIHVzZSB0aGlzIGZsYWcuDQo+IA0KPiBJ
dCBoYXMgdGhlIHVwc2lkZSB0aGF0IHRoZSBkYXkgeW91IG5lZWQgYSB3cml0ZS1wcm90ZWN0IHRo
YXQNCj4gaXMgYWN0aXZlIGhpZ2gsIGl0IGlzIHNpbXBsZSB0byBzdXBwb3J0IHRoYXQgdXNlIGNh
c2UgdG9vLg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCj4gDQoNCg==
