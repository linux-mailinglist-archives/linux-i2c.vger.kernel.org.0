Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E06037B165
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 00:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhEKWLa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 18:11:30 -0400
Received: from mail-co1nam11on2062.outbound.protection.outlook.com ([40.107.220.62]:28129
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229637AbhEKWLa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 May 2021 18:11:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0TzTAGrvlR6G2yI+mOHhaXynLpfXhYCYZI+sX9+9q9885Q9P2CSUzrqO4Upjfx10/te7iRcVe3DkViqH1acKUIk5svuxnmzKJoZagFcGzgLo7NxAQEBoxNTPql07L68iRLQWdOUylVeZRxS6hMPtP/TsmY0ocKU0Q6/5E5riztm7vAIJSKpJebI0usJr4LN5AFHv1CNgS0raamHTJ0Uju3EV1w3luK/fxOY14bZ+9vq53G7iVg3MT/2elyS8kA4OobD1u0bCoa/3jKMXf9yajEhS0mBNUtaR4ETvXSp49zjtkTt2UzwUCihBymHOfyZBfw+cQYBsvdFvV+SlAdrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2C6t8MH4YtJRXEUIYoIrZxA0o/E3fyN4e7WXv5V468=;
 b=ED2Fx2nDVCI/6khooplMWXhwxjYDU6xUKxMXRCXgDyh2IfVmglIjtsMq96kkoEIUDAO7VSMBKshEs5O49pdnq4DWxRvlk6CIpiG7elSvBZn6FCWHA1pUlupP/Y1eevEAkuxFiuN1iX764c6NZqr6vVIL5V2j5maFvkuHJnoLns+l5MZvlDb43nexQB7nSk+X9YQF9O3aTxEsaNZnvgLoz34057VB5Ij71bXXbp5uuMCPLa11RDfzsmIyDm5Iqjr4Ji0EM2qmy83m5mVIZ4YqGqTKMtPmpDN0VMmOdqUOjE1jq3kWZCXcGaDMIXe8Al8QtsKEjLZRnt8acVLOYYXudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2C6t8MH4YtJRXEUIYoIrZxA0o/E3fyN4e7WXv5V468=;
 b=eADg2qUSP9IQmslDa3YBDqYng/U1rJ+UplE6KcTKnMVt3csozPVMUErgXY917qjyFW0j22P0azBLuMscr0v7zHqKkpJQqW9FJm7TaN0XFFt/IQih1BEDogP/RSSPaovfIIoRlzG3pfQuWbyfOwQOZZGzinJdY5USgWtCzMH3os8=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5401.namprd10.prod.outlook.com (2603:10b6:510:e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Tue, 11 May
 2021 22:10:21 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 22:10:21 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "chris.packham@alliedtelesis.co.nz" 
        <chris.packham@alliedtelesis.co.nz>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Topic: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Index: AQHXRqunPYs0ROSj1UChkpy0/P6j16re14SA
Date:   Tue, 11 May 2021 22:10:21 +0000
Message-ID: <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aab79e30-1239-4698-d16f-08d914c991bf
x-ms-traffictypediagnostic: PH0PR10MB5401:
x-microsoft-antispam-prvs: <PH0PR10MB5401A08AB3441F27EA0333D2F4539@PH0PR10MB5401.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /2T2fAhmy36gwjZe/5LZv/+L+DyCHWlJFqInofWMTGzvdT6gIi2zzqdWFa/O3MZhoheWkU28pm4NDk6i7fb6LVpmki2fWa1NPwGoU0JwzwoAWFfkd6K2LfNf5oobmSMdfU7uQiBNK6wGoer4j00xG8JvzfgnbHbyZAlOkbrs3myIhv67qzFdYGpdL5xayHptUvLG03oYQIPm2AM6WhN5yV9kxBoZLiDEliehOyNoVGp5Ytk3cXkhEKjfACIf+0YE2/hV1suMBz6xR7Eo/BVX9/Ve+QlxINQRBJph3HYnTjGZekqejtq79gfqiRTkHEiFxQwNnuiG59ILZK0lhMlPrsPZKlxTqqVlWtxVuFddnm6cVLaVFkFzl1r92WBJftL73TqFNf+TKTrMh+5Uy4Fz75jSnNscNzwEWQmcAbbyzDAr3QDUrVQWFS9Ln+tIH5C7+QFEFVxdMHG5ib/3oE6aFXcV6yKKMxnVxNz6rCbFWzmyt9pFX1KWchlSoE48V1tUQA6P2ILxKEfvT6qbVqIbA/2/Opc+2n4BTmTlh/l3qk41FdyhX/AAcy1V/DybstDNvt/TP6DTzPch7yUUuepwtOyfc8/O5sJOrEHHwtgC74fWX5YswyvQWHrtr1E3soZzhaRLRb8BUAxvnfQInvAfrA2DH2hA202io0kqUMhmIisbuFyqQrSTqCifen4hHdPX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(396003)(376002)(346002)(2616005)(26005)(38100700002)(7416002)(5660300002)(122000001)(6506007)(4326008)(6486002)(6512007)(86362001)(54906003)(76116006)(316002)(2906002)(966005)(186003)(91956017)(66946007)(8936002)(8676002)(110136005)(36756003)(64756008)(66476007)(66446008)(66556008)(71200400001)(478600001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RjRKS3hKd09Ed0xXMTRmZUxQZWlwN2ZWeWV0VmtNeFBPbmNlQmNNdnBMa0l3?=
 =?utf-8?B?cVg1emJuZFVxRkh2MEcydlRjaTAybW50cG82SmJjMHJId1pmTmpwUVM3UTF6?=
 =?utf-8?B?V2xHWVoxVEhXNU0rTFFJYWc0aGlTZzFCdDZCQWxvK0k3M2R3cXVxc3p6NFVw?=
 =?utf-8?B?dlRlek5EZ0t6YzNMNmF4RDRLa05wWjlZRk1YNFJrY2E0ZTJiSXM5NHFDOUhC?=
 =?utf-8?B?cWZxRkYyd0dVdWtFVEpzNXlXNjkrZTM5Q3pHTUlsd2ltMGV2SVcxU1Jia1hQ?=
 =?utf-8?B?K3dRSEE2QU9uNXJxTFlwZHVhWG8wdVhobHFJVUJjbjRyeXg1SHVTNU05U2lp?=
 =?utf-8?B?YWNzeUtka2lTQ2NiSU5YUXl6d082TmdCTmtjWEZlVUwyTTcxdGVuY2tpR0hu?=
 =?utf-8?B?cFV4TFJMNDdaQjNZQmpFb252bjFhd2hBdExuSTRoZ1RublpCeDF6em1KRFR6?=
 =?utf-8?B?V2t2c25KUm9DcjB5THVCMmVNZStPSWtTN0hycm51T1ZNTWF6ZFZpdHU5cHgz?=
 =?utf-8?B?R2xYYU91Z2xySUJCQzlyUTRxZUFuTkU1ZjhXVU5tZklFZXE0Mk9BS1ZoRzV0?=
 =?utf-8?B?ZkluUUY3eW5KdkhYZHBrcTlodmhJQUYyYjd4TWZmVXRwRHhINHN2RnlTeGww?=
 =?utf-8?B?VElqM2VUcEVZM2QyVVlYVDNGek5DL1RMYzkwYlRkMVJJaUZhTmUvc2JnYStw?=
 =?utf-8?B?VzZDVXl2OTBWNnlVK3hRZzVGTS9FNWhQMHZ0MTlXak1STjJCZWZrYVArb2sr?=
 =?utf-8?B?SWxMVGNKajM2NmVUSFNOMTlIdE5XT3ZsVDU2bEk5QTU3dWl2UFVMYzdnUHBR?=
 =?utf-8?B?OGszbEdVMFpwSzBHcmszajM0T2YzdXhqRVEvRld1TUltbkhFQkNoWFprN3lJ?=
 =?utf-8?B?MzlOcC8veHZ4WjJ6MGJ4eVFDM2VXcnJoKytBNSsza1U1Wlo2bHl5UDBFQnNZ?=
 =?utf-8?B?VExmTHVBZjEzN2pmRnRFb0lFSUF1dWtmNHRqa291MWE3VFgyVllnZ3k0ZEht?=
 =?utf-8?B?SjI0NlgyemtUaEhvNzEzVWgzNEh2Y1ZQbHkwYlNIaUxmYzV5ZGdGUCtDQXhh?=
 =?utf-8?B?OG42ME96ZHJDVjU4VG51TlZOOHdidEhVT2VhQWlyU0pjeU96UmFLcEZNOE5Z?=
 =?utf-8?B?anZFdVZaTjN4eVJ3Y0tWYjNKQVg3K0w4VnhvcnE3VitLT3Q2TTE5b3FIdnlr?=
 =?utf-8?B?TStIaVAyQWxGSi8zV0g1aFpMMzA2aVRtU01SZEs5N2dMMm5id1dVWkhzZE9H?=
 =?utf-8?B?TnMyaFBvR0QzZzliOXhOWmlyeG1YdzVyRmVGU0xhRC9wMEl3Nm1tYVJxTFFC?=
 =?utf-8?B?NVdqVjE1R2R6VDVWdjVHdlZJTFpod0xydWFBRnRLRW1xK0RKQ0ZvU2VIYlVs?=
 =?utf-8?B?dEZZRi9hQmRBWFZIRy9BaVNLM3F3RTZUYXlsR0dZMmhkTXQwOWdjaEJtVzJD?=
 =?utf-8?B?aHQ3RnJ3bjBWVlN4cU9qeUplNTR5ci9mWTVXQVJUdTdDd0t1d2lrZ0hLZFJD?=
 =?utf-8?B?aHhnSWY3YmVBei9ZWTMwZTRINHVzbG1sb3JIdHpyMzdYSmRaWllGdHFDSkJt?=
 =?utf-8?B?c2JnbFVOYllGT1p4aWNNQVo0VkhoZDNYUUhmS3hMV2pBcDhPODdOWUNWalJ3?=
 =?utf-8?B?Ull5dWc4UWlIdTlEN1dsVWNQQ0t5RjB2a0w2M3duaHErR3dGQ0o2Y2E3Wkxv?=
 =?utf-8?B?K2xHMVZ6Q0sxM09zM1RHNkdhaFVTaGhmcmNDT0ZxZDZPNytyRnpodGJDWTZn?=
 =?utf-8?Q?c8x14eCCizE6pFURiaz6WjmmVOkhIJFILDghrY4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C761C41C8D08D84BA3E78CB70FDFD3F3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab79e30-1239-4698-d16f-08d914c991bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 22:10:21.4381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XM4o74Wm382PvSNa8gEWDAVkT1swpA7rYPPHPspaVshGA/83Xao2zNIYp1tRdGnhRomlkccCMz1lJpT2whSRLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5401
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIxLTA1LTEyIGF0IDA5OjIwICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBUaGUgUDIwNDAvUDIwNDEgaGFzIGFuIGVycmF0dW0gd2hlcmUgdGhlIGkyYyByZWNvdmVyeSBz
Y2hlbWUNCj4gZG9jdW1lbnRlZCBpbiB0aGUgcmVmZXJlbmNlIG1hbnVhbCAoYW5kIGN1cnJlbnRs
eSBpbXBsZW1lbnRlZA0KPiBpbiB0aGUgaTJjLW1wYy5jIGRyaXZlcikgZG9lcyBub3Qgd29yay4g
VGhlIGVycmF0YSBkb2N1bWVudA0KPiBwcm92aWRlcyBhbiBhbHRlcm5hdGl2ZSB0aGF0IGRvZXMg
d29yay4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cw0KPiB0aGF0IGFsdGVybmF0aXZlIGFuZCB1c2Vz
IGEgcHJvcGVydHkgaW4gdGhlIGRldmljZXRyZWUgdG8NCj4gZGVjaWRlIHdoZW4gdGhlIGFsdGVy
bmF0aXZlIG1lY2hhbmlzbSBpcyBuZWVkZWQuDQo+IA0KPiBDaHJpcyBQYWNraGFtICg0KToNCj4g
wqDCoGR0LWJpbmRpbmdzOiBpMmM6IG1wYzogQWRkIGZzbCxpMmMtZXJyYXR1bS1hMDA0NDQ3IGZs
YWcNCj4gwqDCoHBvd2VycGMvZnNsOiBzZXQgZnNsLGkyYy1lcnJhdHVtLWEwMDQ0NDcgZmxhZyBm
b3IgUDIwNDEgaTJjDQo+IMKgwqDCoMKgY29udHJvbGxlcnMNCj4gwqDCoHBvd2VycGMvZnNsOiBz
ZXQgZnNsLGkyYy1lcnJhdHVtLWEwMDQ0NDcgZmxhZyBmb3IgUDEwMTAgaTJjDQo+IMKgwqDCoMKg
Y29udHJvbGxlcnMNCj4gwqDCoGkyYzogbXBjOiBpbXBsZW1lbnQgZXJyYXR1bSBBLTAwNDQ0NyB3
b3JrYXJvdW5kDQo+IA0KPiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlh
bWwgICAgICB8ICA3ICsrDQo+IMKgYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9wMTAxMHNpLXBv
c3QuZHRzaSAgIHwgIDggKysNCj4gwqBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL3AyMDQxc2kt
cG9zdC5kdHNpICAgfCAxNiArKysrDQo+IMKgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyAg
ICAgICAgICAgICAgICAgIHwgODEgKysrKysrKysrKysrKysrKysrLQ0KPiDCoDQgZmlsZXMgY2hh
bmdlZCwgMTEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KDQpUaGlzIG5vdyBy
ZW1pbmRzIG1lIGFib3V0IHRoZSBjdXJyZW50IEkyQyByZXNldCBwcm9jZWR1cmUsIGl0IGRpZG4n
dCB3b3JrIGZvciB1cyBhbmQgSSBjYW1lIHVwIHdpdGggdGhpcyBvbmU6DQogIGh0dHBzOi8vd3d3
LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWkyYy9tc2cyOTQ5MC5odG1sDQppdCBuZXZlciBnb3Qg
aW4gYnV0IHdlIGFyZSBzdGlsbCB1c2luZyBpdC4NCg0KICBKb2NrZQ0KDQo=
