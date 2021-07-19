Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1793A3CD192
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jul 2021 12:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbhGSJ3B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jul 2021 05:29:01 -0400
Received: from mail-dm6nam11on2062.outbound.protection.outlook.com ([40.107.223.62]:31265
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235713AbhGSJ3A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Jul 2021 05:29:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsRoKWspMqA75N1lmNxQA9tghL/FWvE7X6xR4oTvAsVOAkJc0+UgoghxXpDS9W8cB/kIRsP1/2LlP2RXUykQv5iwg2shrCmWQzXjnWtSO4XCVNfl8TEOX2AWbUN0jtpiW8YmnDy77eK7c8iEilBN/R4lPACOjOH9hyfuOCpVVvXaIRazhSC7fl8zrvh5tC2abrlUoSIqPk/suw2xZNNKh2YY9L0q+FjJ9sl65nWpkSQ6vTOhik6Zm9TDmww3yRPDQdFc2gCSgpNvFx+DNBxhbKq7iGWRozobGoFJbMKz+kDwPzWxbw527wNaNGoCMACud/ybBT0/MBdBDrv/8X0vQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQtuta8vNIMEUfqy5MuLFMc7t5pmpUpE22Aly5sqi6k=;
 b=n4n0GPTZy0OPB+MOvG96w2wIBl/5F3IiyEoJkMqdF6neK6gvlxMSJMeyo3xqnUNNAeuERTbVkLTD+EipV6p8kZep1tM7nXOvgvmJ0uUQrjcKqkVPR6g3EhFmqyQG/QoP+iEl5xRi3ke9I9E++uykJW75yUmnsE+Z/74Zv0N4wloWczBEGR6aaVjNQGk2OxEpcVYRDtxYn7L2ikwpPYVqvREX/F2D9CsCY9Zjl0xqJ3Z4cwk5p/v0WtGVplP3ZGwj6+1BonVpDjxtCJnItA7Wkw7c+6EH2a9xtHBPGqlpcy7+iHUnXxMjv3XW+IIPgaays86v8x9fHHhMciOP8axPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQtuta8vNIMEUfqy5MuLFMc7t5pmpUpE22Aly5sqi6k=;
 b=ZrPJgl9I63s2oXLq5FRMf0eHuAiaK4yXSha4rLcYRXlipiA8880OZnCX6YkB+SOFJJR6zgrEpc90OqOWRKNVjzDDeu9eLvumvZ49eXtSeV085b2Ulg5ilTJ1JWmiS6GllaKRxMfq9rcR6BGMOuMNUODy1EX8HUJFOLkRzLjxRpc=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SA2PR02MB7625.namprd02.prod.outlook.com (2603:10b6:806:143::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:09:37 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601%6]) with mapi id 15.20.4331.026; Mon, 19 Jul 2021
 10:09:37 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>, Michal Simek <michals@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>
Subject: RE: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Topic: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Index: AQHXanX+JNOMVW+1VkKFPhgte5uemqspB/+AgBzauQCABE5f4A==
Date:   Mon, 19 Jul 2021 10:09:37 +0000
Message-ID: <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
In-Reply-To: <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1406326f-5352-42cb-8ea4-08d94a9d50d7
x-ms-traffictypediagnostic: SA2PR02MB7625:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB7625C863F36D4C1B540E0E40CAE19@SA2PR02MB7625.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ntrwwRgxINQ+523lB0PVtFrUedEZf7pr3Lo4ThoyZ6WX7eqtA9nYv800G7aOZsfDXWBNU/c8T739UxPVnGB31SL9ppD8C9giOHQ0SLce/GtrFdXe6mm3BfmBZuHPRh+mTHY96htYnUmxiC7aaq6Jtkm5xatrWF6c0cxmeQrU9VqOjoaryqVKwDjpqrHv1EdzJYojkIssYJaNwqRpmDFGnFRXTzyp7XltFaakNK6PqZ3E/OvGFL0+CA9C77n1WTuA5iZB8ZrA8tIBe+MPNxZnzBbvvEvlKIDBZYjxZcJ0+m5Ul6VWisrxHrW6aE4lK0htvEalTbBvFQpP3qvZuoLhga/fwtezqsWlGmYb29hBfSIqbQjK7fxnmM50flT079eIsKUkGfoLyS9IuisVBKf/tkeMQbLjsi42xdUlz8FeGt6z2OXmTy4yrCcjDCIUXK3PWfgmjYhNW4Ocetzql9wE3+na9dVUGwPG9KuMcV+Y3md8gBFuTf10UJOGh5wjFPm/Ivv+yXCn8JbW2zgn5p/GU7c4pXtV+bPcl0RXKnDKFAnAcG/OEreAFd2Gxuh69B237S8P1HsvatWoxY5EGLr9MLFSszcTf6vr9TFZTmfp7IcCl0NaVXV5xVX98//syQ5m6GINCeRzj7JA40QHwuYXdhKu50hCmFGTKOblaWQ32f8R/rVRg5nOJT9c75I1fro8NHVOQfmISLLGDLdN8YZTfDBudGNYp8lHf4XsOagYeIT0zKw+SQwPQnu6n3tZ4Kd0F1uDQuSTVEOs4R7Mp/rxOUbmp4woGiILGlHxMAdvXI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(33656002)(38100700002)(83380400001)(86362001)(122000001)(76116006)(66446008)(64756008)(8676002)(66946007)(66556008)(66476007)(8936002)(966005)(52536014)(5660300002)(478600001)(71200400001)(55016002)(9686003)(2906002)(6506007)(54906003)(7696005)(53546011)(316002)(110136005)(186003)(26005)(4326008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVlic244YlBzRmVyamozVnd4TEZIVnA5cjdCd0d5K3lDayt0ZEIxaHlQNmFt?=
 =?utf-8?B?dUxxUXZNbGtjckxxMHoveGcrek4wTjZuNGVTWjZZZUVMVUUrWHk2bzYzTVVt?=
 =?utf-8?B?M1liZzBQV2NDVEhHcXdUNkw1Y0I2elBTWGZXSkU2ZHR2RXJqVkdxVjFEMlJw?=
 =?utf-8?B?TklGbWk4ejhiYmhia2xCeHNpTU1EZ1NpVGZGQ0IzK20xNDVNMUxkWVNIaVAy?=
 =?utf-8?B?d3ozc0Qxb0hkUjNZKy9KOGpzVGpJV1piTFVGbkkxdVBRZUhaWG45LzZ6TFJj?=
 =?utf-8?B?REZWSkhuTWJIZE44M01NMXB3NCsvdUdIT1RIZkhmV2k1YThFdy9FRGR2Z3RX?=
 =?utf-8?B?Z2RFb3hnL0RpMDVCd25Jd0MxOFYvWHFNMlVDNTQyZHJHMDd1NXFKWmZvSFRr?=
 =?utf-8?B?YXFQNGZyQnJPY3pWelU4MktjVkJwc1lORUJtb2NCNXl4a2VCZ3BtanZ1UlFU?=
 =?utf-8?B?YzR5QmJhU0JRQ21jS1dnSHVtUitaeVFPd2FDQ1c5WWQrRnBZc1JRdGF3cVZz?=
 =?utf-8?B?QmZLL1VCUXdxY0hNUmZkTXh1ckd5MUhqZFR0eDhMelNJTUVIb2pHc25EbktJ?=
 =?utf-8?B?QythRmhuOGthcXo1dXI2aHFzRGdvS0R0TTY5aXpkdHZyeGpGYXkrNnkwS2hu?=
 =?utf-8?B?QkFCRll3Sm9wMmZrczZRK3NLcnJya3ZUVU5EdTQwV3FSUmtKdkR4OVZtWlM4?=
 =?utf-8?B?MkFJOGRzbjN2YnlnNHJBWWFrM01nNk9teTA1MlFBSDZMT2VDWVM4cVpxZ3R0?=
 =?utf-8?B?YjZqYW5aN2VhTnpqMXZSbUlCcTJyaU5BZndWMVA0QzcvaDhTSWgyT1FySWo2?=
 =?utf-8?B?eFA3OXhxUjk2aTNuOWhieGkyT0VtazRlQXcvV2diTkZBYjIzZVNtbUhlZmlF?=
 =?utf-8?B?b0VzTzA0azZUZEpUNjd5OERZblA3WEpDUEJndlVWZlJQaWFpdEhPKytaazVC?=
 =?utf-8?B?L1dnZjBHT1ZWVDViQ1ViZ0R1UWllYWU5RDdiL2VzeUN5R3dhZ0lrd205anBk?=
 =?utf-8?B?UUJsU2hXLzJsQ3Fua3dlYTdzWGZxV0grMEpwQllnWVpKSFYzZVFZUTFxdEJa?=
 =?utf-8?B?VUZYNlRCNVhEdDVQdE9uVkZidGR1WVUvbnNBOWorZzBqcXR0Yk9KSmN2OXNM?=
 =?utf-8?B?aXRwbStKanlDT2pEa0Q0MmVXTTNQT2RYc1BqY3ZmVVRsd1g5MEJYVmpEZ2Jh?=
 =?utf-8?B?YlpxSmJMbUJPVTZTSEFMU3dwWHZZZ2JUQ3JQQndwRHJac2VjVmd0MkxTdU9y?=
 =?utf-8?B?V25qLzY4RFprOWRER01za2RwM2x5dU43Tm5NVHdkUE1ZUG01RThwQ2I4NVZ6?=
 =?utf-8?B?MFAwaTJvdGk4VmpjUEM5aU9RVU9hM3dtaGFoNmR0UDgxckdDZU9QeEl4L01h?=
 =?utf-8?B?ZVdBbzBQZGtwRG8xaS8vUWtwN0pXc2YydXBjbUJCL1dJaForSjJtS3d6RDl6?=
 =?utf-8?B?U2dtVnlhM253U1Vwek01UmF0bGxUdm5rWUlDMmMwVjR3MmQvWnQ3Z2diV2wr?=
 =?utf-8?B?SUVKUnlBSzB4alRoUUhlU3d4TDkyYjdzbUZGQUJzRVRUMzJYZitDSHZubmsz?=
 =?utf-8?B?dHZ1ajRyTkdOSzc5UmZLc2R1RnpuM1VEbHVoRjlGeldvZ3RkcVY0dSsrRmQv?=
 =?utf-8?B?RDAyV29EYzdQN3ZoR2kyNEJuZ1ltREZETUxhQ2krZXM4NittZHB2ZDVkWXBa?=
 =?utf-8?B?czVOQlFEMG9ieEFjaUh5aXEvQlQzcmtJNHpNZWxkS3NVTUtEYzU5Um14NjIw?=
 =?utf-8?Q?x0iEE/nsQ9dU0tUeeMKfRmsQjsEoFpnZZlRsl7g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1406326f-5352-42cb-8ea4-08d94a9d50d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 10:09:37.5021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Sq301v/P1yn7UAwjemBnmTj8aoe3XqciuCbUJmfBT6Sh3ba5yJJsz5+7kOHA00N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7625
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxNiwgMjAyMSA5OjMxIFBNDQo+IFRv
OiBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47IFJhdml0ZWphIE5hcmF5YW5hbQ0K
PiA8cm5hQHhpbGlueC5jb20+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGdpdA0KPiA8Z2l0QHhpbGlueC5jb20+OyBqb2VAcGVyY2hlcy5jb20NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwMC8xMF0gaTJjOiB4aWljOiBBZGQgZmVhdHVyZXMsIGJ1ZyBmaXhl
cy4NCj4gDQo+IE9uIDYvMjgvMjEgOToyMyBBTSwgTWljaGFsIFNpbWVrIHdyb3RlOg0KPiA+DQo+
ID4NCj4gPiBPbiA2LzI2LzIxIDEyOjI3IFBNLCBSYXZpdGVqYSBOYXJheWFuYW0gd3JvdGU6DQo+
ID4+IC1BZGQgJ3N0YW5kYXJkIG1vZGUnIGZlYXR1cmUgZm9yIHJlYWRzID4gMjU1IGJ5dGVzLg0K
PiA+PiAtQWRkICdzbWJ1cyBibG9jayByZWFkJyBmdW5jdGlvbmFsaXR5Lg0KPiA+PiAtQWRkICd4
bG54LGF4aS1paWMtMi4xJyBuZXcgSVAgdmVyc2lvbiBzdXBwb3J0Lg0KPiA+PiAtU3dpdGNoIHRv
ICdBWEkgSTJDIHN0YW5kYXJkIG1vZGUnIGZvciBpMmMgcmVhZHMgaW4gYWZmZWN0ZWQgSVAgdmVy
c2lvbnMuDQo+ID4+IC1SZW1vdmUgJ2xvY2FsX2lycV9zYXZlL3Jlc3RvcmUnIGNhbGxzIGFzIGRp
c2N1c3NlZCBoZXJlOg0KPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1pMmMv
bXNnNDY0ODMuaHRtbC4NCj4gPj4gLVNvbWUgdHJpdmlhbCBmaXhlcy4NCj4gPj4NCj4gPj4gQ2hh
bmdlcyBpbiB2MjoNCj4gPj4gLUdyb3VwZWQgdGhlIGNvbW1pdHMgYXMgZml4ZXMgZmlyc3QgYW5k
IHRoZW4gZmVhdHVyZXMuDQo+ID4+IC1UaGUgZmlyc3QgNCBjb21taXRzIGZpeCB0aGUgZHluYW1p
YyBtb2RlIGJyb2tlbiBmZWF0dXJlLg0KPiA+PiAtQ29ycmVjdGVkIHRoZSBpbmRlbnRhdGlvbiBp
biBjb2Rpbmcgc3R5bGUgaXNzdWVzLg0KPiA+Pg0KPiA+PiBNaWNoYWwgU2ltZWsgKDEpOg0KPiA+
PiAgICBpMmM6IHhpaWM6IEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzDQo+ID4+DQo+ID4+IFJhdml0
ZWphIE5hcmF5YW5hbSAoNyk6DQo+ID4+ICAgIGkyYzogeGlpYzogRml4IFR4IEludGVycnVwdCBw
YXRoIGZvciBncm91cGVkIG1lc3NhZ2VzDQo+ID4+ICAgIGkyYzogeGlpYzogQWRkIHN0YW5kYXJk
IG1vZGUgc3VwcG9ydCBmb3IgPiAyNTUgYnl0ZSByZWFkIHRyYW5zZmVycw0KPiA+PiAgICBpMmM6
IHhpaWM6IFN3aXRjaCB0byBYaWljIHN0YW5kYXJkIG1vZGUgZm9yIGkyYy1yZWFkDQo+ID4+ICAg
IGkyYzogeGlpYzogUmVtb3ZlIGludGVycnVwdCBlbmFibGUvZGlzYWJsZSBpbiBSeCBwYXRoDQo+
ID4+ICAgIGR0LWJpbmRpbmdzOiBpMmM6IHhpaWM6IEFkZCAneGxueCxheGktaWljLTIuMScgdG8g
Y29tcGF0aWJsZQ0KPiA+PiAgICBpMmM6IHhpaWM6IFVwZGF0ZSBjb21wYXRpYmxlIHdpdGggbmV3
IElQIHZlcnNpb24NCj4gPj4gICAgaTJjOiB4aWljOiBBZGQgc21idXNfYmxvY2tfcmVhZCBmdW5j
dGlvbmFsaXR5DQo+ID4+DQo+ID4+IFNodWJocmFqeW90aSBEYXR0YSAoMik6DQo+ID4+ICAgIGky
YzogeGlpYzogUmV0dXJuIHZhbHVlIG9mIHhpaWNfcmVpbml0DQo+ID4+ICAgIGkyYzogeGlpYzog
Rml4IHRoZSB0eXBlIGNoZWNrIGZvciB4aWljX3dha2V1cA0KPiA+Pg0KPiA+PiAgIC4uLi9iaW5k
aW5ncy9pMmMveGxueCx4cHMtaWljLTIuMDAuYS55YW1sICAgICB8ICAgNCArLQ0KPiA+PiAgIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jICAgICAgICAgICAgICAgICB8IDU5MyArKysrKysr
KysrKysrKy0tLS0NCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ4NyBpbnNlcnRpb25zKCspLCAx
MTAgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4NCj4gPiBBY2tlZC1ieTogTWljaGFsIFNpbWVrIDxt
aWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gDQo+IEkganVzdCB0ZXN0ZWQgdGhpcyBwYXRjaHNl
dCBvbiBuZXh0LTIwMjEwNzE2IGFuZCB0aGUgWElJQyBmYWlsdXJlcyBhcmUgc3RpbGwNCj4gcHJl
c2VudCwgc2VlOg0KDQpUaGUgcHJvYmUgb2YgJyBhdG1lbF9teHRfdHMnIGZhaWxlZCBhcyBwZXIg
dGhlIGVycm9yLiBNYXkgSSBrbm93IHRoZSBkZXRhaWxzIG9mDQp5b3VyIHRlc3QgY2FzZSBpZiB5
b3UgdHdlYWtlZCBhbnkgaTJjdHJhbnNmZXJzL2FkZGVkIGRlbGF5cy4gDQpJZiBpdCBmYWlsZWQg
d2l0aG91dCBhZGRpbmcgYW55dGhpbmcsIHRoZW4gcGxlYXNlIGNoZWNrIHdoZXRoZXIgdGhlIHZp
dmFkbyBkZXNpZ24gY29uc3RyYWludHMNCmFyZSBjb3JyZWN0bHkgYXBwbGllZCBvciBub3QuIA0K
QWxzbyBjaGVjayBpZiB0aGUgb3RoZXIgZGV2aWNlcyBvbiB0aGUgYnVzIGFyZSBkZXRlY3RlZCBh
bmQgaTJjdHJhbnNmZXIgY29tbWFuZCBpcyBzdWNjZXNzZnVsIG9uIHRoZW0uDQpJdCB3b3VsZCBi
ZSBoZWxwZnVsIHRvIGtub3cgaWYgdGhlIGRldmljZSAnIGF0bWVsX214dF90cycgaXMgc3VjY2Vz
c2Z1bGx5IHByb2JlZCB3aXRoIG5leHQtMjAyMTA3MTYNCndpdGhvdXQgYXBwbHlpbmcgdGhpcyBw
YXRjaHNldC4gDQoNCkkgaGF2ZSB0ZXN0ZWQgdGhpcyBhZ2FpbiBvbiBvdXIgYm9hcmRzIHdpdGgg
ZWVwcm9tIGFuZCBvdGhlciBzZW5zb3JzLCB0aGlzIGlzIHdvcmtpbmcgZmluZSBmb3IgdXMuDQoN
ClJlZ2FyZHMsDQpSYXZpdGVqYSBODQoNCj4gDQo+IHhpaWMtaTJjIGEwMDEwMDAwLmkyYzogbW1p
byBhMDAxMDAwMCBpcnEgMzYgeGlpYy1pMmMgYTAxMjAwMDAuaTJjOiBtbWlvDQo+IGEwMTIwMDAw
IGlycSAzOCBhdG1lbF9teHRfdHMgMy0wMDRhOiBzdXBwbHkgdmRkYSBub3QgZm91bmQsIHVzaW5n
IGR1bW15DQo+IHJlZ3VsYXRvciBhdG1lbF9teHRfdHMgMy0wMDRhOiBzdXBwbHkgdmRkIG5vdCBm
b3VuZCwgdXNpbmcgZHVtbXkNCj4gcmVndWxhdG9yDQo+IA0KPiB4aWljLWkyYyBhMDEyMDAwMC5p
MmM6IFRpbWVvdXQgd2FpdGluZyBhdCBUeCBlbXB0eQ0KPiANCj4gYXRtZWxfbXh0X3RzIDMtMDA0
YTogX19teHRfcmVhZF9yZWc6IGkyYyB0cmFuc2ZlciBmYWlsZWQgKC01KSBhdG1lbF9teHRfdHMN
Cj4gMy0wMDRhOiBteHRfYm9vdGxvYWRlcl9yZWFkOiBpMmMgcmVjdiBmYWlsZWQgKC01KSBhdG1l
bF9teHRfdHMgMy0wMDRhOg0KPiBUcnlpbmcgYWx0ZXJuYXRlIGJvb3Rsb2FkZXIgYWRkcmVzcyBh
dG1lbF9teHRfdHMgMy0wMDRhOg0KPiBteHRfYm9vdGxvYWRlcl9yZWFkOiBpMmMgcmVjdiBmYWls
ZWQgKC01KQ0KPiBhdG1lbF9teHRfdHM6IHByb2JlIG9mIDMtMDA0YSBmYWlsZWQgd2l0aCBlcnJv
ciAtNQ0KDQoNCg0KDQo=
