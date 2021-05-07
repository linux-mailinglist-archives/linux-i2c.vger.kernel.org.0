Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F731376743
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 16:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhEGOxU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 10:53:20 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:27393
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234601AbhEGOxS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 May 2021 10:53:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCkUket/1pmymGkAn4oCjTJbDEyE9vGaH7K44iAlx0nAjAp/+YNA09+HnbW9rs+eZXQGHh7II5QoUu5Xsoi52O558dfpBQOS3XcObFEKfclc5QiPEvuaMAStSlrBrVY4LTJEqe6SvESaTQ8ZNt4Ptsmqhz6PD6uFgKUCCi6E3UWieAiKW35/QvECyTnv/VYK5P6R/XRHxfDH827EzIy0WBHfVDKrY24a6QD3bezkX7/xalwwDl2lzRHqkj3/tElKHn5ubMew9a/7gsQ2CJohJq1btbKsIzWDcTS3ja9MU+qfyWyTk4r66L7LHmsN44V8R7wIFJzwvMdg62dESH/w8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeVGUn0+VZ1vAbfYslP0IoRbk+2HEUHaMjvRnHAC8ec=;
 b=WUBShPp23c6jPZc9n6UaB+Oal1/EThtIW4T2KNT6HMlIp7aP1jTt9w7DGh7/DiJ9OZgHKazcbhiULfI0fADTfqiYSYzMhHmrnhX3XYs+64mBTYY2OOqFPmuHY74V4HEFUFMEPNLRaI6UJPtCt3+5KJNApDY5L3xxLWRynWbcT4QkIkKsiwHJyZNBSHr3e+dEIAv8yvVya61KgN+kdU7Dw+Wq68/004mQfbbJn067Kn5ces544iieGwmi3Cp4o5CSjQHQCsgksA5hiwD6o2zSAkHsO5bKCNoKhbhNT1hGpAffQo9rCR9cB83SudXz0XyK0p/gLpXm6FH59bF83m4nrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeVGUn0+VZ1vAbfYslP0IoRbk+2HEUHaMjvRnHAC8ec=;
 b=gn4/okJjIYMWDUy9jsDDMMcnaO0BvxvnRMDI6Cny9AemvkT81wWwJqytJ1UOBGuPBVqU7n1gYVsLgjq6C94F41FfDZeq7x+eQm3zFW6xBIrcWYtYjikbXNYiLq7D0xfMH1bMcURhs4IxRVKmD3QY1AeW6gcxiztt6ZLvWGAW9kQ=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1478.namprd10.prod.outlook.com
 (2603:10b6:903:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Fri, 7 May
 2021 14:52:17 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::111a:21e3:db9c:4b2f]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::111a:21e3:db9c:4b2f%5]) with mapi id 15.20.4087.044; Fri, 7 May 2021
 14:52:17 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "chris.packham@alliedtelesis.co.nz" 
        <chris.packham@alliedtelesis.co.nz>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: mpc: implement erratum A-004447 workaround
Thread-Topic: [PATCH v2 3/3] i2c: mpc: implement erratum A-004447 workaround
Thread-Index: AQHXQtnfiVCGwbq620mT44STuFEGLqrX54QAgAAz7AA=
Date:   Fri, 7 May 2021 14:52:17 +0000
Message-ID: <c4fa78e8f2c43da240c932618b87b34ba2d1d046.camel@infinera.com>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
         <20210507004047.4454-4-chris.packham@alliedtelesis.co.nz>
         <CAHp75VcEzgKjOD6WQ1=YAwK_hhZr=XtcmXZL8rK78gb7iXDbDg@mail.gmail.com>
In-Reply-To: <CAHp75VcEzgKjOD6WQ1=YAwK_hhZr=XtcmXZL8rK78gb7iXDbDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91bd920b-984e-422c-1ae6-08d91167b580
x-ms-traffictypediagnostic: CY4PR10MB1478:
x-microsoft-antispam-prvs: <CY4PR10MB14785C605DDCCE3C45B7D20AF4579@CY4PR10MB1478.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ey8bp/X19douQVMlEWVBfORCh3/1Klaf9RzhP1Z9/nDVU1LrnaRiHRZ4H3qe14X0OsEsIJpz91BeiwhGi9BSa4H9VrT40pMOHKEzbUw6Hhsn57XuuzVOul9So1Rw+Ohibra+2JjkZH1NA1/PA3yXcn4SWqMffZluBPSwh7pbJR3SRuBiHbqXI8/Zp8Ptou5U7nCTRTOZaJ6IHtUWRaBe47SM2OY7GjDD0uFv2QAHX2OYVy5U0HSvIKlUbTNAwhyDoG90Y0/1Neom+WrZhJAVw1/QFuTf6XX5OjaCUnzO3Y1E02wW3KUIIvUMEsGvQGlvFSrGozkoG2MMxOLX3pvG05Nj4trB5hGBT8PlrmoTycXqJhWTYWBpPF3lWrZic9rKOghdVUf1jwGDN5wGySJCa9FtGW+bDywTSaXuyYikJz6w59hbvHFFpKPZqlLBWJ1/0OkGnkEXRPEZxdL5UYltM3Lr7DHB+AKun0Rio/I3JSoZ23MeIaVjjVxmI9FVYCaCrwhCqS1A8SAcqV1tv/ON5NjI69SFcTi+99S7RFcW4rFNi5BwneGRo8a7rp0f7fONSVGRhn0gHlG7vnSIex733BjeXvkIfkdXf0YGX6BJNRQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2389.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39840400004)(136003)(346002)(2906002)(26005)(71200400001)(86362001)(8936002)(316002)(36756003)(186003)(8676002)(4744005)(478600001)(2616005)(76116006)(66946007)(64756008)(110136005)(66476007)(54906003)(66446008)(66556008)(38100700002)(4326008)(91956017)(6506007)(53546011)(6486002)(5660300002)(6512007)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TmI4bDFHR3ArUzN0K1dkK0NMOGdKLzJJTzdVcTdranFtOXBCRUdtdXdtYWxY?=
 =?utf-8?B?RGlPd3g4aHAvZVVqdmMza251V3ozYWVqWTdLNFh3UmJ3bmpWUzE0QzFIUy91?=
 =?utf-8?B?WEZGY3NCZkRUWlJTUnhMMStWZzNPbjhnTzZEclk2UnJTQ3M2eW4vMm1mb1JY?=
 =?utf-8?B?TUpNWnZHb3VzQTdhNE44NXA1SHZnSVFpUFJXUUoxalpUU1hEdG83YzVtMlZH?=
 =?utf-8?B?UlVxL3MyejVsSGRtd2crV1NHNWdiVnhYbFhPVEZ4N1VCT0lwZElWdE4ydnFo?=
 =?utf-8?B?MTl0dnluMUFoOUNQYWVyczBJb3RROHRITnRDS29QN3NYb25ibHhnM1hlY0dQ?=
 =?utf-8?B?dStYS2RYbjd6WVBmNW41dmtQVkprTm1pb1haVUhBSXlvNG9IK2cxY0RBbXFC?=
 =?utf-8?B?KzlIRWttMzNvbmorenBIcjJ4S0M4YW5SWnRPaHIyVHhvcjg2L1YzSVlNYytR?=
 =?utf-8?B?aUdVUGVYbDBGQjcyNlgwanJOcEZPYndsOElXWUZMdEVLcCt3M04xTnVHRlBk?=
 =?utf-8?B?VkJOait0U1FtSFJRVUVIVmhFSlRSUEZYaXcwWGhjQVp3YzNvSXFOTmY2QkFz?=
 =?utf-8?B?czhXN2lHZkdQUmlMMGlaV0FOQkFlUTlSQ3RZZDJHVDdOKzFsSGltSHZkc0lk?=
 =?utf-8?B?Y1NyRUFpSzFxRGlFTXFlNTB0SVNoTkhPYXpaWDRoT0g2L3VzMlV3eGc1VTFI?=
 =?utf-8?B?SFhsbUVOMTBCaHVsRGtsQ2t1YTNOZTRoeWh6Ynd4dlBJK0dNVFI4QVZ2ZlJC?=
 =?utf-8?B?VjVPNVJ0bDFvODhHbVhvaHpGa3hmeEtxd2x2OGJEbjEvYjBOVzBuNmNKLyti?=
 =?utf-8?B?NU5LM1dXNjZmWStrMGZIY2xJS2lMaEEycHlKREVJaE5DdWFqVHQ1Y2c4WGFC?=
 =?utf-8?B?SGFQWHliYUlyV0ZzWFFBZTFFclJReE5ZalJzM2JrMmxxZmVlcXdvbW9QTkFo?=
 =?utf-8?B?NmQxR1ZQMC8zMVJoU0p6eUpSSjJpWENZbE1keU5sbGpIaUxNU1daQnI3SUt1?=
 =?utf-8?B?TW92eEpVV1BOL2s0ODRHU2FEbzIwb000bTBOVDU4Y1QrL1pBY1B4Qy9Eam1o?=
 =?utf-8?B?d2FGK1orczBkVzlvUzhFNEJyT3pVYU4zWFQwNEU2TDAvMDNta3Nvbi8zZE9N?=
 =?utf-8?B?TFE3SmVWTzhaMDU2TVZDM044UTFBV1JKOWdTZHZFRTBTcHlwN01iS0dyTGoy?=
 =?utf-8?B?N1dNQy9uRzJPYlpWYW8yU216QWZ2ZE00NmhhcUNQdktWK1RoSHVqNWpHZ04w?=
 =?utf-8?B?T0pRbEJJNlNhQlVVZWlSWWl4NzBOeGpsbzRFVW5ENjYxMmxBWEpVTWxod1Qv?=
 =?utf-8?B?LzJmZG1NY3F2cHdTTHN0Mi9IOWltVVdPN25nSFpEZ3R6QUMrREtKcVErV29k?=
 =?utf-8?B?L0h5ck9qUzY2OUpKdmJnNnJvdlpqTkhrem42Mkd4d0lJaVlRdjJGMUxXdmVs?=
 =?utf-8?B?S1ZvQWs0YndZb0l1R3NTTzhKWVJSQ1BFeEE4Y3V6b1dxSWE3dkhud2FqMWNp?=
 =?utf-8?B?TDVtQjJ4anZCV05hcXlmTHhIU3dwbGk4WUo0ZnhVS0c2enRnb01BSFFhc2Z4?=
 =?utf-8?B?SklBbkRxL1h0aTVkYzlCYXFLazFEeUxLbHN3ckFoNkFTV0dZR2l1dmpUQllq?=
 =?utf-8?B?blJqUWZ1bS9Sc0lFbnFxLzgvdWhLVUhNczc1V0h2QmhpeW1qdzBWaDFpY0Qx?=
 =?utf-8?B?T2NUL2gwZlQ1YXA2em1RcFN6b04xam5KcjNQNDRVZ3RJdGN3cTN1SEdMTFc5?=
 =?utf-8?B?NURocUZEemZHOExiOFA5Z3c0WlV0YjN4QmJQWWpWRWVHSzB4c3UvVUpJbXI3?=
 =?utf-8?B?cGFvdVhERHh2Z21GcUg3UT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A21BA070A855A4EB123546B4D3D1ABE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bd920b-984e-422c-1ae6-08d91167b580
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 14:52:17.2881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3YH/qEde/PP8jqEhFicLqGfqMTcYbgujnsglrrIxmu0ZqxGCMPIMel4XalDc4oU88Si0FBICF7M/2g1INgy+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1478
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTA3IGF0IDE0OjQ2ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIEZyaSwgTWF5IDcsIDIwMjEgYXQgMzo0MCBBTSBDaHJpcyBQYWNraGFtDQo+IDxjaHJp
cy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdyb3RlOg0KPiA+IA0KPiA+IFRoZSBQMjA0
MC9QMjA0MSBoYXMgYW4gZXJyYXR1bSB3aGVyZSB0aGUgbm9ybWFsIGkyYyByZWNvdmVyeSBtZWNo
YW5pc20NCj4gPiBkb2VzIG5vdCB3b3JrLiBJbXBsZW1lbnQgdGhlIGFsdGVybmF0aXZlIHJlY292
ZXJ5IG1lY2hhbmlzbSBkb2N1bWVudGVkDQo+ID4gaW4gdGhlIFAyMDQwIENoaXAgRXJyYXRhIFJl
diBRLg0KPiANCj4gVGhhbmtzLg0KPiANCj4gPiArc3RhdGljIGludCBpMmNfbXBjX3dhaXRfc3Io
c3RydWN0IG1wY19pMmMgKmkyYywgaW50IG1hc2spDQo+ID4gK3sNCj4gPiArICAgICAgIGludCBy
ZXQ7DQo+ID4gKyAgICAgICB1OCB2YWw7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0ID0gcmVhZGJf
cG9sbF90aW1lb3V0KGkyYy0+YmFzZSArIE1QQ19JMkNfU1IsIHZhbCwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2YWwgJiBtYXNrLCAwLCAxMDApOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldHVybiByZXQ7DQo+ID4gK30NCj4gDQo+IFNvLCBub3cgeW91IG1heSBzaHJpbmsg
aXQgZXZlbiBmdXJ0aGVyLCBpLmUuDQo+IA0KPiDCoMKgwqDCoMKgwqDCoHZvaWQgX19pb21lbSAq
c3IgPSBpMmMtPmJhc2UgKyBNUENfSTJDX1NSOw0KPiDCoMKgwqDCoMKgwqDCoHU4IHZhbDsNCj4g
DQo+IMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJlYWRiX3BvbGxfdGltZW91dChzciwgdmFsLCB2YWwg
JiBtYXNrLCAwLCAxMDApOw0KPiANCg0KdmFsIGxvb2tzIHVuaW5pdGlhbGlzZWQgYmVmb3JlIHVz
ZT8NCg0K
