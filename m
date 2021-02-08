Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A9831427F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 23:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhBHWDQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 17:03:16 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2360 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbhBHWCf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 17:02:35 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6021b4ca0001>; Mon, 08 Feb 2021 14:01:46 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Feb
 2021 22:01:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 8 Feb 2021 22:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiJJdoxFTO0bz42ibMBIZxFEz6too5m8m1SMO2IPkkyV/r8S/OEM9ndaU2ybUlm1XM4W3XL/aIvpAWqOdm6B09fgFTKOqlKpNnhtKE7vg7Za/G5tZrrk/Eb3j9oSaLHlcVVh3Z+/rAR7jVwkoZPdqc05FKNVd0HDu8jkGkmnwYxJ3VOEPzvu5qLei7tjLHWYb7xIhV2DvzMup/VbqKyKA/7zt1VKhGl8kLS/hOSAtKK3epwQnIiMha5VpC/k/u5r7lNlNJCBZt/3oYjnPRH23rjBsrQXf3kEXghG+uRtZxRggbORaVSGz8CX5j7Ur+wSrrHYhJTgOVXyjMksz5ny+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkGZrfhI+Q1xdlX88Gpp6k1mUU8Ujo+rqOX9jRG2gEs=;
 b=P8DQQkAXb9GQTtUW2zcHegfeCBbt8FLLp9afo6/i7iXC6Pi99BV1x8PNYDr3O0JpeJAt6gcO6AEQ6U70cNQkHALK0DHcaP5SmrpOox0jnYrG/8X0UDvWFus4sPZoWJ9h+cQ70Hdh+itD4l4N06IEB2d2FYGtehXWQypLdhdZQe17fLyIHTwShAimKOmOKpsSpsBQW0/2iSS6M1ukqfL/GqUK8mI9RtAgsc3p7B8lID5QPXOsMPwWdYUdbNDesrSSV2VQGhZUDxExVOAGJ7U9AcQlrvVa+zqQAk37nZfgvUBkwUz3hnv2cq0WLY0kepdcM8SxKAEJfo1YgMWmcUL8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB3002.namprd12.prod.outlook.com (2603:10b6:5:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 22:01:42 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:01:42 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Peter Rosin <peda@axentia.se>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH i2c-next v5 0/6] mux: mlxcpld: Extend driver functionality
Thread-Topic: [PATCH i2c-next v5 0/6] mux: mlxcpld: Extend driver
 functionality
Thread-Index: AQHW/ldHraCpc8Blg0mJvgFUNqYOLapOxVgAgAAJsRA=
Date:   Mon, 8 Feb 2021 22:01:41 +0000
Message-ID: <DM6PR12MB3898A7D26F964B45D43B1E40AF8F9@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <e86e396b-b099-5174-ae0a-393401b1e767@axentia.se>
In-Reply-To: <e86e396b-b099-5174-ae0a-393401b1e767@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.116.167.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23b79b55-8831-45b1-d5c5-08d8cc7d1e1f
x-ms-traffictypediagnostic: DM6PR12MB3002:
x-microsoft-antispam-prvs: <DM6PR12MB300282CB05A15F5DE7EE2388AF8F9@DM6PR12MB3002.namprd12.prod.outlook.com>
x-header: ProcessedBy-CMR-outbound
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tGR8zLbZhDvigcYK+VnRwHbAhjtZ094sXOUKa/6Ju4Lhz9j7vRl6LVNALBHCc92GYyfcDjAsQ8IYKl4OW/Y5sxXzvRDS+AUQ4+vb67duiMO7Ku8xvjvGY0bVFxRvU854ij+EBiFlH+oZVIC5dS51+Jr196wngJ6H5GwM3M62lg7R//ZqE22YTqAU2GOJIdIH0pDc4z/5rQx3xDpSQMJURVN+fSg5UggAd36jCe7ykmokfh+dWUAiP2hyTWoV+hSynCJpCQrW+rEjoZ4DBfIA0enFmsmF0+9O7S/jEN/FLNiN398XwCX899mynRvr3xUwyYP6YVKiwYsAJf1FiP1Qn7/XFjrBxPdJmKqD8ngIrlLIgwecMMSfQOdDuLSFA/uukRv/l/w1lo5InEaW+5jsWx7oK/SQjZOMaEiR3AOnrb1vhCHsVu3Qmfh1me4gQHJJjrIlizylO6zzy3mm0TYcTzvsHY1hyK6rNZwFkkGi1vZEwj2Oh/X0lCekJFfBN9w2oCAHbDHitW1hhjxlVEMGsaGmFWadoBf4toddwdHhQrq21+SfthVR7SCKGnlPreHN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(9686003)(8936002)(478600001)(33656002)(26005)(6506007)(86362001)(4326008)(7696005)(2906002)(55016002)(8676002)(53546011)(186003)(71200400001)(5660300002)(83380400001)(66476007)(66556008)(316002)(110136005)(66446008)(52536014)(64756008)(76116006)(66946007)(133343001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y0lScG1EWGF3OHZPejFDVWtabzVnZ2xwQlJpVHVxZW1yWENBWExIYmFNeklD?=
 =?utf-8?B?WjQzbHZLak03V1c4TkFMMkVVbUlhdldxWmlJMFg2bEFwOFJWdDBqRUNOQ1NE?=
 =?utf-8?B?TWJVamR0VHhadXNqSDhPQ1pyL2tSUTBsa1ZQNWx3dnVleFFUeGdrTytueE5t?=
 =?utf-8?B?a3A2OGEzQXEzZUlaZVBXRU9aUzdRTEowbG1qa09XbnorTENKNTVtOHU4MDc5?=
 =?utf-8?B?UkFwdEJlTzlYTFFaSElXeUJUaTluRVVMajh0RUt3NnN4dEJPRW9HQjZ6V2pL?=
 =?utf-8?B?cmltRkJsYll2elZXbGxNVWFsaFRBMUJ4ODR2MG94amdodXJDWk5TQmFXM0l5?=
 =?utf-8?B?SlFDc3RDN2dUUnRRcStidXp4dlNiMWF6aEJ2c0dlRVpmZWE1L0syWngvZk81?=
 =?utf-8?B?MnNkOStmYThiRHZ4WFN3Vkd2bE1CdDRTYWR0cHVZK3o3TGtSZ0dDQ0ROUVp3?=
 =?utf-8?B?ZjNDY214WjRQbWdGRkk1TFY5akR1cThCTU9DZmxXaEowMVBxMFBxblZZT2NR?=
 =?utf-8?B?NzZORGpZTnczRytkVHorRjhPaDBYUGJTclFoUUpLLy9pdm9DY21CZ3M3VHVK?=
 =?utf-8?B?QmIyekZNbVpzWVZaMlVMRVBpUnBBd3N5S2NGVHNBTXcyTjAvaElwNzhpaUZJ?=
 =?utf-8?B?UlUwOXBXS3ZQdUNZSzUrbmZXN0hUYmt1UlA5Z3RYV3lKZE10UThGMlBFZ3hK?=
 =?utf-8?B?dlhibG5BSjByNlgrODh1UlBKVytoWTFBMzdObEhaeEJoSFlTUGQwNjU1S2hp?=
 =?utf-8?B?b1N3WlVRbDFHeVRQWURtdWJzMy9aMmpsWVlMVGpGakc5eVJHd3BhNkFKaVZ6?=
 =?utf-8?B?ZHFkSmIwOGFDV3FudlJLZlpSVmVzajkyay8rdGh4NVN5OTRuaXVHdDRHRWh4?=
 =?utf-8?B?NHc0YW11ZjQrYWIyRzVKVkpnNTBOamF2Ym43Z2ZCVFUrV1o4V2JpNVpuZXRp?=
 =?utf-8?B?RDQyOGhMWHBzRlhHK01XNEc5Q21VUEpabnVCZmVMOXF0MHYxd1FhS0g0b2gw?=
 =?utf-8?B?cVdBWXVIdlpOSk0vN1lIVnBTcnR1V1dPZVc0T2lTMTB2YkpxdWkvcnpTM0p3?=
 =?utf-8?B?WGt6WTNRWGJPdTZhd1JNTVY2MmtZdVcwTVYzTUE1Y1hyNHJ3OFZBZ3VPbWR6?=
 =?utf-8?B?bXZOd1BRZWh1dUd0R1BFY0dvc1VpS0lOVlYvbC9EN3h0Y21ud0Jidm03Tmh6?=
 =?utf-8?B?QUlDQnV4VGhmZldPV1d3NHQ2R21lNWt2Z0JicHBuaytaaXh0SkFKRGFBbXlB?=
 =?utf-8?B?K2hUZGp2VXNqd2ZRc0p3RnVuem5IeXBGS0FOOWdFYm91dXA0UjhvelludUJ5?=
 =?utf-8?B?UFN6ZW5MK3N3d3J4enZXaHNMcmJkdUl2NGI5Wll0VHUySkF4azZyOTBQL0JG?=
 =?utf-8?B?blF4cXFDbXlQOFE2S3BueG42WjViUXh6SHJPU0s5eC9TOWo1ZkkvTUFnWHBr?=
 =?utf-8?B?a1oyV1BkeXk1cXlUWFFDMWQvUmtYRlRRSjU1d0ordjMvVTNrOVZjSXhqak5o?=
 =?utf-8?B?cmF4T0cwcWJnNEhWRzdHVFo3ZHlSU2ZKSitIVnM5ak9rYkhRMXJlclpBL3NZ?=
 =?utf-8?B?T2hiQktOSHE5VE05dUJmeWtaYWJmcjRpcnlBa3lWeTlsNTJ4Qk9qbW1PdWNW?=
 =?utf-8?B?L1pwRDlqVFdOb0p1RUlXWlVYdW9CTGFtbVJCem92TGs4YlJEam5oMC9lYncy?=
 =?utf-8?B?aUZrcXZpdER5V2xlZGZDbmE2RWlqQk53R2dpeHV5Rzljb25xUTNjRGZHdXRt?=
 =?utf-8?Q?gJlmUXQ18ArhZmnRJOQlUM3L9QO0psgXHRk5oey?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b79b55-8831-45b1-d5c5-08d8cc7d1e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 22:01:42.0037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldwvhWJ2ngMfkG0bvgMquvfcA3m+Ft9U7qNKooV8mIArZmqRuGYIrwiyqP9cFVxqmDj0e1w3L7EuNqH7XCMR6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3002
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612821706; bh=kkGZrfhI+Q1xdlX88Gpp6k1mUU8Ujo+rqOX9jRG2gEs=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:x-header:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=TcD6lmUkvwxCqvoWbemyTnoXuIOSfB3bG/huIJRk+BmzLLyLPI+f6R9i2BPfluTJE
         C1DEVTZoAYzjWFfsFUXnefjwJbANZ7Z5V5NxE4F9d0YePwAKg9VTtaQU/uTLdLsIZ+
         HV4KTLwUtVa6DDtXIbszxsvkVqUx0o8o9ulDw+mSZOMcvlp/DCWCMCoTAF6Ndqzi+v
         XZc/fEnkd6vYMJoVp/08RtaWVegjdN6c2Y2y29ajZouFOnmGpb0LpUF/jCFDspbRrE
         sjT1cw3QrK6z6RfvO+jJCNHYKUV8b7NtgvxC1x1vYjzf60Q6e+KNVJIUdQwelxJUKO
         W4nrIeLXRjZUA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgUm9zaW4gPHBl
ZGFAYXhlbnRpYS5zZT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAwOCwgMjAyMSAxMToyNiBQ
TQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT47IHdzYUB0aGUtZHJl
YW1zLmRlDQo+IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggaTJjLW5leHQgdjUgMC82XSBtdXg6IG1seGNwbGQ6IEV4dGVuZCBkcml2ZXIgZnVuY3Rp
b25hbGl0eQ0KPiANCj4gSGkhDQo+IA0KPiBPbiAyMDIxLTAyLTA4IDIxOjE2LCBWYWRpbSBQYXN0
ZXJuYWsgd3JvdGU6DQo+ID4gVGhlIHBhdGNoc2V0IGFkZHMgbmV3IGZlYXR1cmVzIGZvciB0aGUg
ZXhpc3RpbmcgTWVsbGFub3ggc3lzdGVtcy4NCj4gPg0KPiA+IFBhdGNoICMxIGNvbnZlcnRzIGRy
aXZlciB0byBwbGF0Zm9ybSBkcml2ZXIuDQo+ID4gUGF0Y2ggIzIgcHJlcGFyZSBkcml2ZXIgZm9y
IHdvcmQgYWRkcmVzc2luZyBzdXBwb3J0Lg0KPiA+IFBhdGNoICMzIHJlbW92ZXMgYWRhcHRlciBu
dW1iZXJzIGVuZm9yY2VtZW50Lg0KPiA+IFBhdGNoICM0IGFkZHMgc3VwcG9ydCBmb3Igd29yZCBh
ZGRyZXNzIHNwYWNlIGRldmljZXMuDQo+ID4gUGF0Y2ggIzUgZXh0ZW5kcyBtdXggbnVtYmVyIHN1
cHBvcnRlZCBieSBkcml2ZXIuDQo+ID4gUGF0Y2ggIzYgYWRkcyBjYWxsYmFjayBub3RpZmljYXRp
b24gYWJvdXQgbXV4IGNyZWF0aW9uLg0KPiA+DQo+ID4gVmFkaW0gUGFzdGVybmFrICg2KToNCj4g
PiAgIGkyYzogbXV4OiBtbHhjcGxkOiBDb252ZXJ0IGRyaXZlciB0byBwbGF0Zm9ybSBkcml2ZXIN
Cj4gPiAgIGkyYzogbXV4OiBtbHhjcGxkOiBQcmVwYXJlIG11eCBzZWxlY3Rpb24gaW5mcmFzdHJ1
Y3R1cmUgZm9yIHR3by1ieXRlDQo+ID4gICAgIHN1cHBvcnQNCj4gPiAgIGkyYzogbXV4OiBtbHhj
cGxkOiBHZXQgcmlkIG9mIGFkYXB0ZXIgbnVtYmVycyBlbmZvcmNlbWVudA0KPiA+ICAgaTJjOiBt
dXg6IG1seGNwbGQ6IEV4dGVuZCBkcml2ZXIgdG8gc3VwcG9ydCB3b3JkIGFkZHJlc3Mgc3BhY2Ug
ZGV2aWNlcw0KPiA+ICAgaTJjOiBtdXg6IG1seGNwbGQ6IEV4dGVuZCBzdXBwb3J0ZWQgbXV4IG51
bWJlcg0KPiA+ICAgaTJjOiBtdXg6IG1seGNwbGQ6IEFkZCBjYWxsYmFjayB0byBub3RpZnkgbXV4
IGNyZWF0aW9uIGNvbXBsZXRpb24NCj4gPg0KPiA+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4
LW1seGNwbGQuYyAgIHwgMTI4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gLS0t
DQo+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9tbHhjcGxkLmggfCAgMTEgKystDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pDQo+
ID4NCj4gDQo+IEkgYW0gbm93IGhhcHB5IHdpdGggdGhpcyBzZXJpZXMuIEFsbCBsb29rcyBnb29k
IGFuZCBldmVyeSBwYXRjaCBtYWtlcyBzZW5zZQ0KPiBvbiBpdHMgb3duLiBUaGFuayB5b3UgZm9y
IHB1dHRpbmcgaW4gdGhlIGVmZm9ydCENCg0KVGhhbmsgeW91IGZvciByZXZpZXdzIGFuZCBoZWxw
IQ0KDQpDaGVlcnMsDQpWYWRpbS4NCg0KPiANCj4gQ2hlZXJzLA0KPiBQZXRlcg0K
