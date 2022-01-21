Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678C049607C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 15:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380978AbiAUOJL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 09:09:11 -0500
Received: from mail-bn8nam11on2051.outbound.protection.outlook.com ([40.107.236.51]:59744
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1380967AbiAUOJI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 09:09:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iavTkb4ha6Hxl1KRTRumcsdD7ibZEpe4VjT9H8fOcOZV61WaQIacKjszpffibB+pRS5xSDzmtU8iHGsabrmDaKR7iypZ7t36RBPpEYNl9Ut2uDGUWXwPdrGpQyzfQZ6hxj3tYmruc8sb/v4XHwxcMmsmsxIVDYBsniwbSWbSupH4z1cYfQH8fBgGcYH9Y6Udymoz7wN4UGOLYil/zSDoGzfzuvqHgzcTeTFi9Ue3MtAqoP/iKVNC87YV4kNYxDut70GdsHEigD1D7+MaJftY206Wp2fivQNr3bPrfJrWG4ZxTTyQof3yN5aLQK9n+62k58dUmTypk61u6KHlc99nRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8W6vH5eaJFkStNrfKP+jpnsx0qyyAe+4bLMn1EF07s=;
 b=KBWAsY1phJ1IwcZxJQfbWBUvAXlAzegUzqqWiiM4LsnDk/Y5hxw+1iwBnrN7tHR1JOPECG8Tt+qg4blIsWnH73vmIXN2QzO66OhfhVEPQKxm4MKBeqJP1ThrOgq2WQccnb+cJCVBZoxe+vm6PtM15e23z4ieiT1i36LM+ZcxOGJqlKcxh2vDSSYy5kvy6joZk7O8P3nv/+XII4Kox1VI1hZwyLEQNypFRhxmikwJEI7FF6IilmYHP3LFKNEGSiea5VTJxoosuv4XWJv683IdkHUmfwtqfQqm8YhAtYR4pu0bNBPHBIETUTPbnSOhW2gElILOZSao0jw3Q/fbLv7vLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8W6vH5eaJFkStNrfKP+jpnsx0qyyAe+4bLMn1EF07s=;
 b=hdt2UhB0vZ/FDcWXzK/hwBXYDFa1JI0opZRmHuxELlMGZbXn40GC9UcLBQEls08vR0Tu/nV7FRdjO1EuxgtwpizYxKIBSPNETIrrvRtFO1WLwPFTB9IxEBmyqwGtQD6B1qMx9BYdNxX8yXen73O/HsK1IoVkk0PfMSSo+jLpoiWFKEcFBo7linkl+Dw/gD+bfBiKPHi6glUeI0ll359qoT+/ejVBpFJ+Q45TlFzoR2arye+4fW6Ep1tdQ5WpBo/EJb0Pu9qJCXdd68VV/KqKTrfT73yNteg2TnphKKMOu/hts9wxi4xdfZNMhIRRm90h5SK5nMFGxeZOtSLcmvnH5Q==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by MWHPR12MB1566.namprd12.prod.outlook.com (2603:10b6:301:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 14:09:05 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Fri, 21 Jan
 2022 14:09:05 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v3 2/3] docs: firmware-guide: ACPI: Add named interrupt
 doc
Thread-Topic: [PATCH v3 2/3] docs: firmware-guide: ACPI: Add named interrupt
 doc
Thread-Index: AQHYDgP6phflghtEl0OHgSBGD/B6PqxsAakAgAFob8CAABh+AIAAAhKQ
Date:   Fri, 21 Jan 2022 14:09:05 +0000
Message-ID: <DM5PR12MB185001DB124F9A2F7B30C377C05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
 <1642686255-25951-3-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VehSCxszDV3UQCEnPk7OCXRabRMJEStjpCamBG6X1iaCw@mail.gmail.com>
 <DM5PR12MB18501911339A0274CBE20BB4C05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75Vcs3raid6rHk0AJOomgSKJ1T-cF_qbcq_Yksitz_sE=3A@mail.gmail.com>
In-Reply-To: <CAHp75Vcs3raid6rHk0AJOomgSKJ1T-cF_qbcq_Yksitz_sE=3A@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f6e1973-4968-4474-797f-08d9dce7959f
x-ms-traffictypediagnostic: MWHPR12MB1566:EE_
x-microsoft-antispam-prvs: <MWHPR12MB1566611FC358E4C7E60A6C16C05B9@MWHPR12MB1566.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eSVW72LnNF34IapV2V0yTA/tHiqeZSImXsNgJxo9XZ7kAhgmv4eS67YS6c+fxCbz+Dt4VoirBQBb9sGat7Cza5WOGT1nZ0exCS5mgtyg87we4Yb1a0kb89FfscowDJ7L1D/4e5TT/CM81NWVUTmBTiEilkmCoWjd4OvDxhSVy+I9C1ywdgmh/bo8yhikGk3g/T9gFW0g3Bz1+kVpqjPYgWp5GtH2PPBRgadF6lKOJI2A/FATGTGjfTiC98088yakyzC5r02jncIYjxyN8ZqE/HldCzVq1f4h0V6menrc8c5VUedPpqgMn7GpFrPqoCABtMKzHrTliHjKweZ82wJjVqnFyG3FTUJ1hpQdg9NbPAbDvMKyRHLoT7HTsQAAS2IjobelaVKesLSx/efm2FDLkzJ5bnJvxHXsI2Uqydd78UvFzxRAXEnkBWfAP4DM/h77f0zGrh+6t0jAOq0YxeC/Bg8qyyV58b7EwRuapnFWOBSr1CjXdF31DBpfdVO2K6iVtpP+xJ893LnpkwDJAytX88l8VJOCFBkK72hgvjFvZGYHas0CvHALueZRXk0AnSVqP3vOydiCr68JJ7ohjS75o87Y7MsXQ0433LmkhfLGYn6rgPyjJm2nq+QhvAkvSbA2rlg4Htxwour4mVNeTMqQDvfYwKhok8JQ4AXTmufSniKZJwpk6gJsrdBXR+VQ+/8ArRQGjW8im3KinSkquJWvVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(122000001)(26005)(8936002)(38100700002)(2906002)(508600001)(83380400001)(71200400001)(5660300002)(64756008)(66476007)(66946007)(66556008)(76116006)(7696005)(55016003)(52536014)(86362001)(54906003)(4326008)(7416002)(316002)(186003)(33656002)(8676002)(38070700005)(66446008)(6506007)(55236004)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjdKMEIxV2lwcnIyZGRRQjNmWXA0aTNET3dYTVRucGlrM3hPdkVVTmI0Tyth?=
 =?utf-8?B?MEl5RXNiVFVZdlhHRVkya1lxaTJ4WFJQOTdNUjdSaUttYjNFSGdxbXc1OVQz?=
 =?utf-8?B?OENhSFZnT0UvN0xYYklSb2ZhMGhubEpnVDUvZ2E5Z3VhWEcraHlhQkpmYjNq?=
 =?utf-8?B?OGxaZ2txNlhZOEk1ZzMyY2hpS0pPU2xqenp2MHFEaFlQYUQ2a3BYeTNkRnVR?=
 =?utf-8?B?TThPRjkwZzdBVVZoaEw5T1ZIcmY5SGpKb0JDWGF3RzdoNHh4MThCWXBaaEhh?=
 =?utf-8?B?Qm5mTTM1WmJMamxPSEpjbUpIa25tQzN0TXRXY0F0TDVrUlVvN2I4Q0piMFUx?=
 =?utf-8?B?ZWM1RTRGS0oyVXhERUU4dnpyaS81WHJSZmdTS0hXR3MyL2cwNzZFRzFLbTdk?=
 =?utf-8?B?RWloNkVBTTFnS1lCME1tUTFRN3lPTWhmeGVlUTY3UjhRSG01ZmcxUjM2b09p?=
 =?utf-8?B?VldndnNlRDZtR1FzbUlUZ1d4RjMzc3ozd2MzbStUZkFSTHZ0SlVjWlRJQTAz?=
 =?utf-8?B?WjNCdXorUEhWTUJZWFQvcWd4NDJ2WTRRQjkyYU16c3owQnQ0ZkdhdUV3ajcw?=
 =?utf-8?B?VENTais4SUZOT0dvaEpnZEJhNXd2VWd5MEVpNVgyK0hWMTNoa3JBT1E1TlBD?=
 =?utf-8?B?ZGhOdWZPZ0lRR21la2pVUURoWHcrbDFCUUo1d1VvZm1zZ2xHaU9mb01tcmtQ?=
 =?utf-8?B?L2tUMHJXS0hkVUNpRno2OVZzV29RSU9jcmtNeWRDVkFtZmdBN2Frb3dBd3Fa?=
 =?utf-8?B?RmRoYUJHdWlSYmp1TERrZktHWENBeUsyVTdzaWhOcEtFUDh2NEtxd0FzNXhK?=
 =?utf-8?B?NkNaWW1DUWJpRENxdHl6L1hHL1QzUDRzVDVMZUNzeDBlVVptVnl1Vzg5SUZp?=
 =?utf-8?B?T3JCWkR1S05USDYwanlta0NsWXJPVVBHRkxEVW10MndYcExybkhtTHZVU0I4?=
 =?utf-8?B?UzI1eG5mL3RzMDZMSEJWQVdMR3dCYWR5Ny9FZStIcUpZRDFja3FEN2N3VG5l?=
 =?utf-8?B?QzFoVFRSVXZjSU5LcU1meDBqUWdCNDFxMW9yWkxQUXJvUC9XTlpWSU1ieUJW?=
 =?utf-8?B?dU1pejJqaklURG1wUGZiUUdUTVhHSGp3emRCVGk3UHpSMVZRSXQ0WGUzQzE4?=
 =?utf-8?B?eGxMbzBQNjdFZjZjY2hYYVNkaW12aE5lNFBFcEN4aHpZb0NmaTBkb2RIL1Vn?=
 =?utf-8?B?YWJLQmtJSDBIYmtUdHVzY0tnaDQrbHB3U3pVeUpVc0R6VmhOaWk5bzJaVnpX?=
 =?utf-8?B?NGlDZ0w4WnFVaFNkcnlYSHh4RjlMRTR6UHNzM1l4TlJNclN5ak83dHNKTU90?=
 =?utf-8?B?N2RMK3dBWHRGeG5YTjd6SXRBekgxd1FnODA4V0ZqK2FmSUlVSm53dWlzNjZa?=
 =?utf-8?B?VGIxcDVrR1JqSFgwcFpzWkRMYlBIRENjQ0N1L1hTL2dRZ29ETXFHbEs1S1Vt?=
 =?utf-8?B?TldTRmNWWGVGSStvRE0zcURDTi9UV1F6ZnVldHFIRTU4MDlTTllHTVcyWWVk?=
 =?utf-8?B?ZzZQdFBRNjJENCs2TlZ0eHhJM3dGZmxHOGlwVEFheVBRUzFzNmcxNEZkaXBR?=
 =?utf-8?B?ajgzNmExRThKOHZMRFFhQ2NYajI0aWtGVXRxYzhpNldTR3gvTHAxaVRjVVBL?=
 =?utf-8?B?ZGhFSkpZbEFPeng5RUh2RmU3UkJ2S296cGNScU9hdDZHYzdVUEl5SzJMV0pq?=
 =?utf-8?B?ZzBYalBjZ29XV1RPdkI1VFI0b2lJQnRueHM1bHd1MjlsdXp6UzVieTVzMXRW?=
 =?utf-8?B?SFRMbWhXZ2hhNXBOaUVxOThVUXBSWUF0TVQ4aVJxR0RQc0pXUklyZFl5OUNV?=
 =?utf-8?B?WFJUZ09yTDBMVC9yd2xibHlkWGFjdTZzU1Bla041Y0lZWmt1WjY2RWFSVFlo?=
 =?utf-8?B?Y0J6c005dHBQckFRZlloZEdrcHBmVjhBWkV1cjlYWDJBdkRKYkdlMy8wR0o3?=
 =?utf-8?B?YmtjUGhrcFFuU2lTWjI1YlhMN050R244M0kxcXFHMXpDWEx3ZnFXNFUrQ0Uv?=
 =?utf-8?B?Vi9mSkFWVDRBZG5wN0liekhlR0VMTHFSWXN2U0JWL083K0dySS9Sb1JNb0hS?=
 =?utf-8?B?VVN4YmEyRDMwclpyYWxiYW9JdmwrbTdXekx0NzN5Yno3MHJqbFV6Q0Q5L1RU?=
 =?utf-8?B?c25EelRteHM2Tk8xWVh2QS9YQ0djZXpXUEFNUy94S1VrNmY4UEkwd0o3dEpl?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6e1973-4968-4474-797f-08d9dce7959f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 14:09:05.4354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5xoemj0P2xXP0/3pXhoZlQteofDy3rDOU/S61v+hqeNac/+0xZPaeHiXG/o3vmWueuwlyu3AQoykg+nfMk04A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1566
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJpLCBKYW4gMjEsIDIwMjIgYXQgMjo1MCBQTSBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEu
Y29tPiB3cm90ZToNCj4gPg0KPiA+ID4gPiBBZGRlZCBkZXRhaWxzIGFuZCBleGFtcGxlIGZvciBu
YW1lZCBpbnRlcnJ1cHRzIGluIHRoZSBBQ1BJIHRhYmxlLg0KPiA+ID4NCj4gPiA+IEFkZGVkIGRl
dGFpbHMgYW5kIGV4YW1wbGUgZm9yIC0tPiBBZGQgYSBkZXRhaWxlZCBleGFtcGxlIG9mIHRoZQ0K
PiA+ID4NCj4gPiA+IC4uLg0KPiA+ID4NCj4gPiA+ID4gKyAgICAgICAgICAgIEludGVycnVwdCAo
UmVzb3VyY2VDb25zdW1lciwgTGV2ZWwsIEFjdGl2ZUhpZ2gsIEV4Y2x1c2l2ZSkgew0KPiA+ID4g
PiArICAgICAgICAgICAgICAgIDB4MjAsDQo+ID4gPg0KPiA+ID4gSSB3b3VsZCB0aGluayBvZiBz
cGxpdHRpbmcgdGhpcyB0byB0d28gc2VwYXJhdGUgZW50cmllcyBpbiBiZXR3ZWVuDQo+ID4gPiBv
ZiB3aGljaCB0aGUNCj4gPiA+IEdwaW9JbnQoKSByZXNvdXJjZSBpcyBwcm92aWRlZC4gSXQgd2ls
bCBleHBsaWNpdGx5IHNob3cgdGhhdCB5b3UNCj4gPiA+IGRlc2NyaWJlIHRoZSBjYXNlIG9ubHkg
Zm9yIEludGVycnVwdCgpLiBTb21ldGhpbmcgbGlrZQ0KPiA+ID4NCj4gPiA+ICAgSW50ZXJydXB0
ICguLi4pIHsgMHgyMCB9DQo+ID4gPiAgIEdwaW9JbnQoLi4uKSB7IC4uLiB9DQo+ID4gPiAgIElu
dGVycnVwdCAoLi4uKSB7IDB4MjQgfQ0KPiA+ID4NCj4gPiA+IEJ1dCBpdCdzIHVwIHRvIHlvdS4N
Cj4gPiBJbnN0ZWFkLCB3b3VsZCBpdCBiZSBnb29kIHRvIGFkZCBhIHN0YXRlbWVudCBtZW50aW9u
aW5nIHRoaXMNCj4gPiBleHBsaWNpdGx5LiBTb21ldGhpbmcgbGlrZSAtDQo+ID4NCj4gPiAgICAg
VGhlIGludGVycnVwdCBuYW1lICdkZWZhdWx0JyB3aWxsIGNvcnJlc3BvbmQgdG8gMHgyMCBpbiBJ
bnRlcnJ1cHQoKQ0KPiA+ICAgICByZXNvdXJjZSBhbmQgJ2FsZXJ0JyB0byAweDI0LiBOb3RlIHRo
YXQgb25seSB0aGUgSW50ZXJydXB0KCkgcmVzb3VyY2UNCj4gPiAgICAgaXMgbWFwcGVkIGFuZCBu
b3QgR3Bpb0ludCgpIG9yIHNpbWlsYXIuDQo+ID4NCj4gPiBJIGZlZWwgbWl4aW5nIHRoZXNlIGlu
IHRoZSBleGFtcGxlIHdvdWxkIGFkZCBhIGJpdCBvZiBjb25mdXNpb24gdG8gdGhlIHJlYWRlci4N
Cj4gDQo+IFRoYXQncyB3aHkgSSBhZGRlZCAidXAgdG8geW91IiBpbiBteSBwcmV2aW91cyByZXBs
eS4gSSBhbHNvIHRob3VnaHQgYWJvdXQgdGhlDQo+IGV4YW1wbGUgYmVpbmcgYSBiaXQgY29uZnVz
aW5nIGZvciBhIHJlYWRlciB3aG8gaXMgbm9uLWZhbWlsaWFyIHdpdGggdGhlIEFDUEkuDQoNClRo
YW5rcy4gV2lsbCBzZW5kIG91dCBhbiB1cGRhdGVkIHBhdGNoLg0KDQpUaGFua3MsDQpBa2hpbA0K
