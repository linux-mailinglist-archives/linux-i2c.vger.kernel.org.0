Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D2D37B8B7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 10:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhELI6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 04:58:49 -0400
Received: from mail-dm6nam12on2054.outbound.protection.outlook.com ([40.107.243.54]:37089
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230216AbhELI6r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 May 2021 04:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmKd/ycmhh6K+aONOG7wf3GRYYBs+l8LIH/CKB+KFbXIhCjkCEsobgVYHaNmJT9vCMu6dBbVt9f5khEDioETclO99nh2rD+2NO+WbGUgAkE59at/S28Q4aibzgtvYEqD7hJz/RQeMcadKYsrxmYKkZWEd749HCGIrmkEdWRqlwiL2twTzbluMk9LMl4mzvZfgzdIG/nwR2OlYzP9fnlBdA3+gIzK2wnXcYEVS5GpWI9My0YIXRhWxmSogeSIsZk85afYdy8M5JUfqOvjf+rlWGtf3we2kwz9nG7ISVur2zIDSpixa4zCFKbmFsZRakQIc+G/DSzvOFXBNh5hAY46kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX9/yEAaQHFBATQnmhQBymNpSMi8Vk+jENgFV9Y/5FU=;
 b=eiuF8lksUhhBnaavmGY/pFv/4AeOJ0ok9pksHPGTEuw7u1JwNMraHv7LdPB2g8TX4KFbaFcNkHnya/9dHWlkbdNP34ChLKPqJXq2EOP+7L33XZ1YZqquawzCcwVx2NZFsmdcvAS8E+Q6hpkyNvC0Pnyizw36iQynhyb9HOKRvmWEbowjkQF24SCFofmG7G8CoNGkALwZnfnBNPA5B9kGShAX5qBLR/l/I3BkNscI1fi8Kufn24/r6+C/WU/bzDas+HdUnRCjgzBPdRg1C5ZFqV6FChTMLsM1uBRPJ+WAIJ4/hQCFwtHaPZbbdUh7HySSNGDy0Ig9fe7gsvslQ4dYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX9/yEAaQHFBATQnmhQBymNpSMi8Vk+jENgFV9Y/5FU=;
 b=WyIuNV7A+W0JW0UjCwk8nJHxvo9dyP3P/sUr3D91J8KXK3pEeXlOxh8iLUcvouSabj4A/yECo/cVg1LyV14TD7L8JWslniC9OtmHAL/cLzinOv28U4ClblvmmrN5RE1XQNj9N63njyycrRJpT+YehEitcnPiA1aMigy8yeiz6Lk=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5449.namprd10.prod.outlook.com (2603:10b6:510:e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Wed, 12 May
 2021 08:57:38 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 08:57:38 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "Chris.Packham@alliedtelesis.co.nz" 
        <Chris.Packham@alliedtelesis.co.nz>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Topic: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Index: AQHXRqunPYs0ROSj1UChkpy0/P6j16re14SAgAA9BgCAAHfUgA==
Date:   Wed, 12 May 2021 08:57:38 +0000
Message-ID: <4e96247275d559bab133d6c318276fa6be4d7be0.camel@infinera.com>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
         <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
         <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
In-Reply-To: <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baef3f61-7b30-407f-aff5-08d91523fe3d
x-ms-traffictypediagnostic: PH0PR10MB5449:
x-microsoft-antispam-prvs: <PH0PR10MB5449AC8B669D293BD081A540F4529@PH0PR10MB5449.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2S1GefdMGaccM9MdE5xeKI8aGqIN5dq5PAk2Kz/mTXjMZ2Yo9pRDi9JEFW08mzLwmxOzaSqMJKgoUTDfE23ZnNAliJJLzaHCbUW7ZhUxmz7HSJgDD02iZa9FmPBMU6wGxPJGzNx2Jt/Bu6LOSkqPTkgT6J8MCXJr4dv3BzLSd0AtywO0zE8CCoGuq12yypcvNiwElTxrEhTXirdIqREF7H7dlZ7tTCsQfwUzet9fVRvzdJ+XUuMgr2JgsdZgYlIfRFfe7DtGiiA6YE9VKRcGR0Y8vjRXe+Rl+cYduA4Jnlc6GLuO1RunLXmKaFiriNtQKtfl/c6dRFO0qRMS/PNk6c3kD7XY+uWEN6A0IzELG+ToRE4zPTRdmnvJbULRo24xfpoU93aSGFUcF4iP1dKmMx6VpABy3fDxNzzAgQehB6XQWWhejAF+LUXGhZNqx08SNX+zPCXLy+kSTdfb5j9bFAFa3Zt3LIqGOZ9rCHAJK1cK9Ck5UOYULPjWvN7wknTk0GilW6oUFFiTn5PNMw9MQwl1GGThv9G5iH52rDgbkIFQzpqyX86uVjhnq8dFJ6noOLVeA7eSXKSjYVeF4VVZZ5jBBvRqhFkNI69OvK2SBaeL20UOPmj8sJocatpJJaHLSlkg1DKUmw1zFcJKRPdF0I0SfIMaHsSNzJJ0+klPo2RS3sY3jx/QQlLKauCgR8h
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(5660300002)(64756008)(66476007)(86362001)(83380400001)(66446008)(8676002)(6506007)(4326008)(8936002)(66556008)(36756003)(316002)(478600001)(45080400002)(186003)(53546011)(66946007)(91956017)(76116006)(6512007)(6486002)(2906002)(122000001)(26005)(54906003)(7416002)(110136005)(38100700002)(71200400001)(966005)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZEI0MEF6Q0NMRDZ1U2Z2UUlNeUVIVFh1VFBMN2VsdGhMWG1SK1FROEsvY3VP?=
 =?utf-8?B?bEduZlhyT1I2N0ZXd0ZwcTlqNk1CdldyLzRzbkNZd1NLR25sQlh1V3VxTHFZ?=
 =?utf-8?B?cnhQM2dMVGpHSXJmNFBCZnhBK1VjQmxtaEZVbmVEcUkvZ0xYVHlHYmNpaXVK?=
 =?utf-8?B?QlQrdk9nQ2VRRFlvRktVUUxPOHFDcmxscXYwRS9YNkd2QzRrU1hKaGNBekNm?=
 =?utf-8?B?RmoxWVZXdGRFRVl2cU1pSXdVd09hYWRwN2VRaklHUTdacUtWRzJuNVRFVHBI?=
 =?utf-8?B?TzRxVmtlL1hsejU0c2hnKy9YUmFkRkZMc0tod09Tbm5FRHB0Nm9HY3ZGMG83?=
 =?utf-8?B?N0JKcEE4VkhIVWRlaitGek96Yk1oNG5xSjVoOENFVjB3NjFBN3pCaFlQaTZs?=
 =?utf-8?B?MC83ME4zZHVmRkpOekcramppUG56ekl0c2h5WWlhaUcyVHdxaExjWWZZWUxZ?=
 =?utf-8?B?b28vZTUrQjRYdVlTNHFmTmI3elFXYjhrK1YyaUlBQXgvVkp0VnJoQlJVOUtK?=
 =?utf-8?B?ZHRWaUp2MkFuaUthbFNGVitIb05XaXpuaS9pNi9VdkE4UXNJVzNqLzdZM0JK?=
 =?utf-8?B?Q0lGclQ3cHRIUGw5WlNtcUNvVGhiQkdRaUlOTzJ1amhRQkU4V1U3dGo0cnZ0?=
 =?utf-8?B?eU5ualpXbG9jdkpxeTVDemkyeEYxVHRCQkZ1RU14YnpIRlhhc2pwdGFOVVRB?=
 =?utf-8?B?OHV5c0JWbFRUcGptazRaSFptY1FoQ1FXRlZ6Vm5SVklvOGkzb1I3QVlzQWkx?=
 =?utf-8?B?Z3ZGTGRlcUpkMDcxV1ZYUnZnQjVReHI0WlE5Tm45eHBJQVpOTmVhcjdGby9j?=
 =?utf-8?B?VlRPM1ZrUlgxSGpLNVhBOUFoNUtHcytWOWxZRVdPQXlxUzlHOFhackc3WUhI?=
 =?utf-8?B?V0g0V2p4SjQ0bnN4TVV1blR4cFYreWJId2RTRDB2SkVvczRVVXdMRVh1Um5i?=
 =?utf-8?B?ZkQybnRwQUhjeXR5UythSUhSSnRodXZKWUdNbGcwWExpSWp6dGs4R0RiVWZQ?=
 =?utf-8?B?UDRnSnMyWTh1YzI4THhmVkQ1WmNjQUh3WGNSb3VMNytQSElLbnVJN1FPUkhs?=
 =?utf-8?B?NzZhRWYvZURMcWpoekJxV2ZjSzIwUDBRRzA3M3ZmZks1TCtEUU1NSVJ2djhv?=
 =?utf-8?B?bVRlMlZiYzByVWkvTnlvV1N4dm1MdkRsTkhUZEhLdjh6Vko4OHIzVFNvOGhK?=
 =?utf-8?B?M08xc2VkeXlJWVE2TEhJWFFPdFNZVzcxa1lqTGNtYlZBOTI2c0hnOTBEN3FL?=
 =?utf-8?B?ZllHd0dXZlVPTTRmQWFjTUVYc00yV3lLN0RoYVBWT2R6YVRzZmpISzFlbzEv?=
 =?utf-8?B?bnp1eTY0Tkh1aVdFSUpBQ3Q2YzhGL0FRT0tCSzRFbTVGWWE1T2IxMURNemRu?=
 =?utf-8?B?WGMwR080cHUxWld1dkZwZEJkcHUvL1htNnh2WWtKSE1xRHIxQUV6bjZMV0pp?=
 =?utf-8?B?cUpZREMzNFBCMzV5UU5wUjRiblZVOXkwaGprVW9raExOcXd3dVJoelRGeHBH?=
 =?utf-8?B?UEtGd2ozUmxIdVRqemkrRHc2MlNoYjFvdWV5R0dZNjM1UmNNTldFTklCKy9T?=
 =?utf-8?B?c1cyTXNGd3REQVNKWnBDOGRTUHhOZ0t6T2pFWXZXRldlNWlWekZJSk82bE8r?=
 =?utf-8?B?cW9qTEdjNVlBTHFHKzRBVkx4RmpOc3laZlpHeldFdzd0SnZSQkUrVGlGUTN1?=
 =?utf-8?B?ZGFjQVppWk9aQjRVUG1RMWVWU2xkc0NoZmZlNGc4czJhUGZDTDhUbS9SVnpx?=
 =?utf-8?Q?a5h8cvdZ5bR+r/2nFCHon8zgPjVJJRH2Ln9e7ch?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <823F816136F58D418E4CEF539F0355FF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baef3f61-7b30-407f-aff5-08d91523fe3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 08:57:38.1766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEX16vL0dfx3qtCOfPJGe9729jZ19gKOZIHaOfSkGs1/SmSigk+2Mv/aZnRxupOqxcjxRfV0yGzMxCS+P/f9cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5449
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIxLTA1LTEyIGF0IDAxOjQ4ICswMDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBPbiAxMi8wNS8yMSAxMDoxMCBhbSwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiBPbiBX
ZWQsIDIwMjEtMDUtMTIgYXQgMDk6MjAgKzEyMDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+ID4g
PiBUaGUgUDIwNDAvUDIwNDEgaGFzIGFuIGVycmF0dW0gd2hlcmUgdGhlIGkyYyByZWNvdmVyeSBz
Y2hlbWUNCj4gPiA+IGRvY3VtZW50ZWQgaW4gdGhlIHJlZmVyZW5jZSBtYW51YWwgKGFuZCBjdXJy
ZW50bHkgaW1wbGVtZW50ZWQNCj4gPiA+IGluIHRoZSBpMmMtbXBjLmMgZHJpdmVyKSBkb2VzIG5v
dCB3b3JrLiBUaGUgZXJyYXRhIGRvY3VtZW50DQo+ID4gPiBwcm92aWRlcyBhbiBhbHRlcm5hdGl2
ZSB0aGF0IGRvZXMgd29yay4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cw0KPiA+ID4gdGhhdCBhbHRl
cm5hdGl2ZSBhbmQgdXNlcyBhIHByb3BlcnR5IGluIHRoZSBkZXZpY2V0cmVlIHRvDQo+ID4gPiBk
ZWNpZGUgd2hlbiB0aGUgYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIGlzIG5lZWRlZC4NCj4gPiA+IA0K
PiA+ID4gQ2hyaXMgUGFja2hhbSAoNCk6DQo+ID4gPiDCoMKgwqBkdC1iaW5kaW5nczogaTJjOiBt
cGM6IEFkZCBmc2wsaTJjLWVycmF0dW0tYTAwNDQ0NyBmbGFnDQo+ID4gPiDCoMKgwqBwb3dlcnBj
L2ZzbDogc2V0IGZzbCxpMmMtZXJyYXR1bS1hMDA0NDQ3IGZsYWcgZm9yIFAyMDQxIGkyYw0KPiA+
ID4gwqDCoMKgwqDCoGNvbnRyb2xsZXJzDQo+ID4gPiDCoMKgwqBwb3dlcnBjL2ZzbDogc2V0IGZz
bCxpMmMtZXJyYXR1bS1hMDA0NDQ3IGZsYWcgZm9yIFAxMDEwIGkyYw0KPiA+ID4gwqDCoMKgwqDC
oGNvbnRyb2xsZXJzDQo+ID4gPiDCoMKgwqBpMmM6IG1wYzogaW1wbGVtZW50IGVycmF0dW0gQS0w
MDQ0NDcgd29ya2Fyb3VuZA0KPiA+ID4gDQo+ID4gPiDCoMKgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy1tcGMueWFtbCAgICAgIHwgIDcgKysNCj4gPiA+IMKgwqBhcmNoL3Bvd2VycGMv
Ym9vdC9kdHMvZnNsL3AxMDEwc2ktcG9zdC5kdHNpICAgfCAgOCArKw0KPiA+ID4gwqDCoGFyY2gv
cG93ZXJwYy9ib290L2R0cy9mc2wvcDIwNDFzaS1wb3N0LmR0c2kgICB8IDE2ICsrKysNCj4gPiA+
IMKgwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jICAgICAgICAgICAgICAgICAgfCA4MSAr
KysrKysrKysrKysrKysrKystDQo+ID4gPiDCoMKgNCBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+IFRoaXMgbm93IHJlbWluZHMgbWUg
YWJvdXQgdGhlIGN1cnJlbnQgSTJDIHJlc2V0IHByb2NlZHVyZSwgaXQgZGlkbid0IHdvcmsgZm9y
IHVzIGFuZCBJIGNhbWUgdXAgd2l0aCB0aGlzIG9uZToNCj4gPiDCoMKgwqBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ3d3cu
c3Bpbmljcy5uZXQlMkZsaXN0cyUyRmxpbnV4LWkyYyUyRm1zZzI5NDkwLmh0bWwmYW1wO2RhdGE9
MDQlN0MwMSU3Q0pvYWtpbS5UamVybmx1bmQlNDBpbmZpbmVyYS5jb20lN0NiODVhNmU5YzNjOGI0
Njk1NzJkYTA4ZDkxNGU4MTZiNSU3QzI4NTY0M2RlNWY1YjRiMDNhMTUzMGFlMmRjOGFhZjc3JTdD
MSU3QzAlN0M2Mzc1NjM4MDkzMjI0MTk5OTglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZhbXA7c2RhdGE9NGN3dWpObUFWbEJhMDhUdDc5aExZR0pmSnRuN3dkejFLZ3ow
ZVcyVlg5VSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+IGl0IG5ldmVyIGdvdCBpbiBidXQgd2UgYXJl
IHN0aWxsIHVzaW5nIGl0Lg0KPiANCj4gRm9yIHRob3NlIHJlYWRpbmcgYWxvbmcgdGhlIHYyIG1l
bnRpb25lZCBpbiB0aGF0IHRocmVhZCB3YXMgcG9zdGVkIGFzIA0KPiBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtl
cm5lbC5vcmclMkZsaW51eC1pMmMlMkYyMDE3MDUxMTEyMjAzMy4yMjQ3MS0xLWpvYWtpbS50amVy
bmx1bmQlNDBpbmZpbmVyYS5jb20lMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q0pvYWtpbS5UamVybmx1
bmQlNDBpbmZpbmVyYS5jb20lN0NiODVhNmU5YzNjOGI0Njk1NzJkYTA4ZDkxNGU4MTZiNSU3QzI4
NTY0M2RlNWY1YjRiMDNhMTUzMGFlMmRjOGFhZjc3JTdDMSU3QzAlN0M2Mzc1NjM4MDkzMjI0MTk5
OTglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9WURU
WDVMNkoyb2NIZXA1WHV0Vk40NmpVcHZKajdoMWFEYkhId01xbHJBcyUzRCZhbXA7cmVzZXJ2ZWQ9
MCANCj4gdGhlcmUgd2FzIGEgYml0IG9mIGRpc2N1c3Npb24gYnV0IGl0IHNlZW1lZCB0byBkaWUg
b3V0IHdpdGhvdXQgcmVhY2hpbmcgDQo+IGEgY29uY2x1c2lvbi4NCj4gDQo+IFRoZSBpMmMtbXBj
IGRyaXZlciBpcyBub3cgdXNpbmcgdGhlIGdlbmVyaWMgcmVjb3ZlcnkgbWVjaGFuaXNtIHNvIHRo
YXQgDQo+IGFkZHJlc3NlcyBvbmUgYml0IG9mIGZlZWRiYWNrIGZyb20gdGhlIG9yaWdpbmFsIHRo
cmVhZC4NCj4gDQo+IEkgZG8gd29uZGVyIGlmIHRoZSByZWFzb24gdGhlIHJlY292ZXJ5IHdhc24n
dCB3b3JraW5nIGZvciB5b3VyIGNhc2Ugd2FzIA0KPiBiZWNhdXNlIG9mIHRoZSBlcnJhdHVtLiBE
byB5b3UgaGFwcGVuIHRvIHJlbWVtYmVyIHdoaWNoIFNvQyB5b3VyIGlzc3VlIA0KPiB3YXMgb24/
DQoNCkl0IGNvdWxkIG9ubHkgYmUgUDIwMTAgb3IgTVBDODMyMSwgSSB0aGluayBpdCB3YXMgTVBD
ODMyMSwgeW91IGNvdWxkIHRyeSBteSBzb2x1dGlvbiBvbiB5b3VyDQpDUFUgaWYgeW91IHdhbnQg
dG8gbWFrZSBzdXJlLg0KDQo+IA0KPiBJJ3ZlIGJlZW4gZG9pbmcgbXkgcmVjZW50IHdvcmsgd2l0
aCBhIFAyMDQwIGFuZCBwcmlvciB0byB0aGF0IEkgZGlkIHRlc3QgDQo+IG91dCB0aGUgcmVjb3Zl
cnkgb24gYSBUMjA4MSAod2hpY2ggaXNuJ3QgZG9jdW1lbnRlZCB0byBoYXZlIHRoaXMgDQo+IGVy
cmF0dW0pIHdoZW4gSSB3YXMgcmUtd29ya2luZyB0aGUgZHJpdmVyLiBUaGUgIm5ldyIgcmVjb3Zl
cnkgYWN0dWFsbHkgDQo+IHNlZW1zIGJldHRlciBidXQgSSBkb24ndCBoYXZlIGEgcmVsaWFibHkg
ZmF1bHR5IGkyYyBkZXZpY2Ugc28gdGhhdCdzIA0KPiBvbmx5IGJhc2VkIG9uIG1lIHdyaXRpbmcg
c29tZSBjb2RlIHRvIG1hbnVhbGx5IHRyaWdnZXIgdGhlIHJlY292ZXJ5IA0KPiAodXNpbmcgdGhl
IHNuaXBwZXQgYmVsb3cpIGFuZCBvYnNlcnZpbmcgaXQgd2l0aCBhbiBvc2NpbGxvc2NvcGUuDQoN
CllvdSBkb24ndCBuZWVkIGEgZmF1bHR5IGRldmljZSwganVzdCBhbiBhYm9ydGVkIEkyQyByZWFk
L3dyaXRlIG9wLg0KWW91IGNvdWxkIGZvcmNlIG9uZSBzdWNoIEkyQyBvcC4gYnkgcHkgcHVsbGlu
ZyBkb3duIHRoZSBjbG9jay9TREEgaW4gdGhlIG1pZGRsZSBvZiBhIGJ5dGUgdHJhbnNmZXIuDQoN
CiBKb2NrZQ0KDQo=
