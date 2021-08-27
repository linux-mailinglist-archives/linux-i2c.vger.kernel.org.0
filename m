Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4743F9620
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Aug 2021 10:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244524AbhH0IcT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Aug 2021 04:32:19 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:1280
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244544AbhH0IcS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Aug 2021 04:32:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaCNMMLnxKLeUxbQw9DnYQr0+SerWjeauIz/QaFGvuSQ1JtMPCLoDN2h1yVNPeVujKWEWCd7kTPlK7IFrah1RaATy8bk3+uKoFu4s1dMe3u/sLSjoecGFOydCh8aAe0W41OC+LYERtAJa+nAeLZXce3hmLpLkmE3wtmzO6W32ZbpBUGiHsQ2vnYu/5dUQen4IFwq8mKCJem2RLnPkiBNUk+gM4hmQUPpzeW8wLPDMNVOmxJPMHx8VgxWbGjpRCc3Cj2+zPmAes3MlNcGhvbDaAWsR3rKXbBiY6P+CtQ/v5wsdho5Kzijt/ZH+G22DkLmAdy99WNHreIg9dwU7qPrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPUe2wU1Y151e6rh2hCQwSvhDilUElUMU3a8tsqsXs8=;
 b=lBmYhbjlzFdDA5oP0E+FYYhzC7bHypvpjuE8E+XFMdYcDHoxGM7yOBt6z2qkOPgIB4t9vTTeIy72Hm+AtuE/++JlSYE0nn54BO++N+vEx16mLYqPBMi4RSaplvMlpxtmwlU/zL69lq04QSPxSJiQmy0+FLGSlT9pcfmOwmcilBJ/0+Plos2VFt5br9PENMa81gSjVfd+/ywz7CDZLrNutbvU1B/K7aRUXtTfvgOsqEWJrjnY5xUGY//a3yJqNubqOcGtPqYOGbGPii7PKeSXV6hpWZtGw/JOgwlCKnNKJC7j/GYFsYZj9nWVmSYOIWXLwN1gyYFOIoUbYLHkD2g9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPUe2wU1Y151e6rh2hCQwSvhDilUElUMU3a8tsqsXs8=;
 b=UFaVUau0zxtA8O3aTSYXqPX0ZhIND+bdiRQSBAnIvaFQxi4ICTaL0s6/oTE3FP0WC6vwjHDpBUdyMrzoVQgNSI1W4bzqbjy4eMKvuZELE5UdR5YVwByS9oEt5znSdOAh4ubv/h5nLqnvFwxFwbiiajrvn8bSOM4BXzHqz21Do9M=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SA2PR02MB7514.namprd02.prod.outlook.com (2603:10b6:806:135::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 08:31:28 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601%6]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 08:31:28 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Michal Simek <michals@xilinx.com>, Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v2 0/6] i2c: xiic: Fix broken locking
Thread-Topic: [PATCH v2 0/6] i2c: xiic: Fix broken locking
Thread-Index: AQHXmGfCthyilJlAQkyTHJmESbarG6uCOiUAgATP8CA=
Date:   Fri, 27 Aug 2021 08:31:27 +0000
Message-ID: <SN6PR02MB40934151B394A0F656E96B98CAC89@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210823214145.295104-1-marex@denx.de>
 <ee2f1e22-2069-308d-2a18-c59fd14387ac@xilinx.com>
In-Reply-To: <ee2f1e22-2069-308d-2a18-c59fd14387ac@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d046fdc2-bf02-4f0b-c320-08d969351083
x-ms-traffictypediagnostic: SA2PR02MB7514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB75141DAB8FFDAEABAC21A79FCAC89@SA2PR02MB7514.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dr3H+YecaW88eiKpujuGBf0G+yEy3j3k7k1mAX8cfbAILZYeMzBQfF3REWpGx91j/goIpdhtSXVcpYlzjB/y++wwaiVLCCm61o0VvAxDaSxhBhIf1Ys22QZNaAcb/Z1PIe61EYMSDCIjDik3rEInvqCczRTiRKPKOHRwsQ4OZnK9BDxlCaVxnGEbQ3+Lji+zv18lAi1Bi8VKNFjiP37LtaT4umaun0j83QJU5H2OcP/IfZhdEa4dKQ68cf46n1uteYXROw8uNCqFw8Q9GnFjn72EDqmpyWQKN3mKu/WaKK83iAdp6w41lqO/ku1QWPLuF42Ycu2/MI6fD90f/kmHJYJ501ndvVDGzVFrQ/iJkPkGQVds4pEukandoYQX83U6ZpZcgI+rZw7hf9TLoYcT3WlH/DmW0tjpw9Be2KoE1CcX7Y85lUaGbaNq2ptELiqh+zVmLkw6exh8kuueBICs+9UwDrWfMqsU5KHHdR8WkL4Jau0AzKfKifoO6vxnNJ8ueq+mJkFc88thnaRUu7proWq8dcPNSoIeeEKKjbwzSwcbA9Gaaw1J1l3UGynC6B9pZyag8uAd+rWM6Wi9oBgpVctJwATvFftUj/0QTd7NTXJaP/XyVFGEBrS8D+poJwt+yk/jxfbUhFmpLuE0JJivweIASTcaFnspToCjko+kigYK4lPUZdWGnx5ydKVFEluMufRRW18hcH7BT5su2xgCOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(38070700005)(26005)(64756008)(8676002)(7696005)(52536014)(33656002)(4326008)(55016002)(6506007)(53546011)(86362001)(5660300002)(71200400001)(186003)(83380400001)(76116006)(8936002)(122000001)(38100700002)(66446008)(54906003)(110136005)(316002)(478600001)(2906002)(66556008)(66476007)(66946007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXhFOVYySExxRlpUR2d0cTBibnJ0SjB4ZnJIaVUzNldhMUhreC9JOG5NUmh1?=
 =?utf-8?B?MXpEM29zNGVYbUFLaEJOcG44UTZLZGFNV2w4T2hxZ0t5Sm1HQjRSM3QzVlB6?=
 =?utf-8?B?NTYzak0wWXZtNTlXTlZscGxpOVE3U21JVGdQRzc2a1dydFMySmw3dEVxSDhk?=
 =?utf-8?B?TjA2L2tWMnFmUFNqeXovYUVBUG40L3BNbDg0Mlk2VDhoSGdJNEdLUDhmeTBZ?=
 =?utf-8?B?S0hOR25HMDhHR0lkZ0Vqa0NWd2U4S2ZWVERCdzFQTFpVRW96UW1nVWJwWUM0?=
 =?utf-8?B?a2ViS2tUdE1pT1EvQ2syK05rdzJYcURMNmNLckR1YllRWjVBNHUvK0lzT1BP?=
 =?utf-8?B?bUlQRklnOUxhMHdPUTU0eTg1K05GTktWSHlMUUFITyt6Tmt6dGpRTmlacTdV?=
 =?utf-8?B?MnI5dG1HTEdXUlNPQ01tTTZZRzNXTjNtYVlFQjFKL0Y0NVk2N2RiSE96R2ZC?=
 =?utf-8?B?bmVMY3ZLaEdzVXpsbDc0NVZYSHNTby8rdngyQjBCdGp4akFkenp3aWtyTEN2?=
 =?utf-8?B?MTQvVndEL3dmT2RKZnVqYmp4VURGazdYdURWMDRYNHpEWWoxOHlQZk5rLzVp?=
 =?utf-8?B?aHdDMDNsbko3d0dudXUzQUMyYXBmdkdLb0FZWThMV24wSXFDaUoyb0ZzOVVv?=
 =?utf-8?B?aTgxeW5YaG5iUlVJVkhGeEZIUjBQT3NFdjRnQkZkYytaTTNZTytSSmVvS3NZ?=
 =?utf-8?B?Y3QreTY1OGMxaHZabUhLRmhyUUI2Q0d3c25FYnlrSTYxRUtNazZnU2JUSEFh?=
 =?utf-8?B?eGxNRmkzdVZ0MmJMb1hGcWJ2YlJqY1ZjZ0ZMQ0dmQURqTFZMSXVGc0ZWZTQ2?=
 =?utf-8?B?K1lvVDAwb1pOTmpkTkRNQmJKa0VWZzFsdFlRb3hnZllvbWV0cWhXNnVHMzRL?=
 =?utf-8?B?akRJWFhEQlhUMm01YWVtQytxNmVJNFVSWEVSMGE0NWw5WGVPRVZPZHQwR0g5?=
 =?utf-8?B?ai83aEZ1S0FNWHVEa0F4S1NPdXFRelNIYXRvTmZPelovOC9Vb0ZtNldIVWlx?=
 =?utf-8?B?d3NlTDdYTjljTGFzMnFIRDJ6MUxnc2ZOcENEdEhMWVZFVFpVUUhYeUdnYTVS?=
 =?utf-8?B?d2dPNHFIVVB1WGEzMEt6RlpqWmlRNCtIZTIxekhBOFJ0NzlDZGtKNHZ5ZWRo?=
 =?utf-8?B?dmE1UGVvWFBHYWRzWm5pQXN2VGxya3V6QTdLak41Y2E5SWJ6YmVHb2dSc2d2?=
 =?utf-8?B?LzI2NXpoTjZlenFHbThyQVVRVUJFTjhjK0JnOG55NGpONlZhMUp6T0FPREdR?=
 =?utf-8?B?dHdqZi9td294RkhlczBLUE12TThWRW5reXBLeXRIc1dLdXEwdXppUEVaWVIv?=
 =?utf-8?B?V05FamYvcjBSMFFkVjlteVhZNUJlRVJTQldNTEowQlluMGlzSCt5Sm5GTWFv?=
 =?utf-8?B?dXppb09IR09FU1BkT2NyL3kzRVhsaFcyTmwvdFAzTENhYWlKTFduNlJBY3I5?=
 =?utf-8?B?bHF3ZzFPdlhuRlptWjJ4NmRyeE5uSkl1a01pTXF0a0FPNm9pQWp1TG9HdHdC?=
 =?utf-8?B?bzJwbHR6cFJyUFIrdzgrL3BvRnVVSFdaSXRUc0ZvTnRhSzZ1YnJWWk5HVGZy?=
 =?utf-8?B?RGVkQmQ2K3dtbTFuaFFDWlVHeUdUUE52QmljdmlMNlhYM3IydlFsZ3R5dnIw?=
 =?utf-8?B?MHFHc2dIUWJqZC9MSDdlSnpQcnh2NFZWTW9ySGVFVG1JdGQ5QjJYTDBsdkVG?=
 =?utf-8?B?aHNRdStRcmY2MU91MGk0TEx4OTlpM3U1RWxzTUJKclZGa2RiZUQyc1Z2OHZx?=
 =?utf-8?Q?bfM8y8NrPHq3afmxX8SEuwySMvFx7ZCPCR4kqAv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d046fdc2-bf02-4f0b-c320-08d969351083
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 08:31:27.7541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XzIcUT626I2wJcr2/BgXUir3Vwgyl+xydkY3Drs0kyuvMg0FaW0imwHxsNb7GsqX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7514
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWljaGFsIFNpbWVrIDxt
aWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI0LCAyMDIx
IDEyOjI5IFBNDQo+IFRvOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT47IGxpbnV4LWkyY0B2
Z2VyLmtlcm5lbC5vcmc7IFJhdml0ZWphDQo+IE5hcmF5YW5hbSA8cm5hQHhpbGlueC5jb20+DQo+
IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47IFNodWJocmFqeW90aSBEYXR0
YQ0KPiA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC82XSBpMmM6IHhpaWM6IEZpeCBicm9rZW4gbG9j
a2luZw0KPiANCj4gK3JhdmkNCj4gDQo+IE9uIDgvMjMvMjEgMTE6NDEgUE0sIE1hcmVrIFZhc3V0
IHdyb3RlOg0KPiA+IEJvb3RpbmcgWnlucU1QIHdpdGggWElJQyBJMkMgZHJpdmVyIHNob3dzIG11
bHRpdHVkZSBvZiByYWNlIGNvbmRpdGlvbnMNCj4gPiBpbiB0aGUgWElJQyBkcml2ZXIuIFRoaXMg
aXMgYmVjYXVzZSBsb2NraW5nIGlzIGNvbXBsZXRlbHkgbWlzc2luZyBmcm9tDQo+ID4gdGhlIGRy
aXZlciwgYW5kIHRoZXJlIGFyZSBvZGQgY29ybmVyIGNhc2VzIHdoZXJlIHRoZSBoYXJkd2FyZSBi
ZWhhdmVzDQo+ID4gc3RyYW5nZWx5Lg0KPiA+DQo+ID4gTW9zdCBvZiB0aGVzZSByYWNlcyBjb3Vs
ZCBiZSB0cmlnZ2VyZWQgZWFzaWx5IHdoZW4gYm9vdGluZyBvbiBTTVANCj4gPiBtYWNoaW5lcywg
bGlrZSB0aGUgWnlucU1QIHdoaWNoIGhhcyB1cCB0byA0IGNvcmVzLiBJdCBpcyBzdWZmaWNpZW50
DQo+ID4gZm9yIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0byBydW4gb24gYW5vdGhlciBjb3JlIHRo
YW4geGlpY19zdGFydF94ZmVyDQo+ID4gYW5kIHRoZSBkcml2ZXIgZmFpbHMgY29tcGxldGVseS4N
Cj4gPg0KPiA+IFRoaXMgZG9lcyBub3QgYWRkIHN1cHBvcnQgZm9yIGxvbmcgdHJhbnNmZXJzLCB0
aGlzIG9ubHkgZml4ZXMgdGhlDQo+ID4gZHJpdmVyIHRvIGJlIHVzYWJsZSBhdCBhbGwgaW5zdGVh
ZCBvZiBiZWluZyBjb21wbGV0ZWx5IGJyb2tlbi4NCj4gPg0KPiA+IFRoZSBWMiBmaXhlcyBhIGZl
dyByZW1haW5pbmcgZGV0YWlscyB3aGljaCBjcm9wcGVkIHVwIGluIGRlcGxveW1lbnQNCj4gPiBv
dmVyIHRoZSBsYXN0IHllYXIgb3Igc28sIHNvIEkgYmVsaWV2ZSB0aGUgcmVzdWx0IHNob3VsZCBi
ZSByZWFzb25hYmx5DQo+ID4gd2VsbCB0ZXN0ZWQuDQoNClRoYW5rcyBhIGxvdCBmb3IgdGhlIHBh
dGNoZXMsIE1hcmVrLiANCkkgaGF2ZSB0ZXN0ZWQgdGhlc2Ugb24gb3VyIGJvYXJkcyBhbmQgdGhl
eSBhcmUgd29ya2luZyBmaW5lLiANCg0KSSB3aWxsIHJlYmFzZSBteSBwYXRjaCBzZXJpZXMgb24g
dG9wIG9mIHRoaXMgYW5kIHNlbmQgYWZ0ZXIgcmMxLiANCg0KPiA+DQo+ID4gTWFyZWsgVmFzdXQg
KDYpOg0KPiA+ICAgaTJjOiB4aWljOiBGaXggYnJva2VuIGxvY2tpbmcgb24gdHhfbXNnDQo+ID4g
ICBpMmM6IHhpaWM6IERyb3AgYnJva2VuIGludGVycnVwdCBoYW5kbGVyDQo+ID4gICBpMmM6IHhp
aWM6IERlZmVyIHhpaWNfd2FrZXVwKCkgYW5kIF9feGlpY19zdGFydF94ZmVyKCkgaW4NCj4gPiAg
ICAgeGlpY19wcm9jZXNzKCkNCj4gPiAgIGkyYzogeGlpYzogU3dpdGNoIGZyb20gd2FpdHF1ZXVl
IHRvIGNvbXBsZXRpb24NCj4gPiAgIGkyYzogeGlpYzogT25seSBldmVyIHRyYW5zZmVyIHNpbmds
ZSBtZXNzYWdlDQo+ID4gICBpMmM6IHhpaWM6IEZpeCBSWCBJUlEgYnVzeSBjaGVjaw0KPiA+DQo+
ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jIHwgMTYxDQo+ID4gKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9u
cygrKSwgOTIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwu
c2ltZWtAeGlsaW54LmNvbT4NCj4gPiBDYzogU2h1YmhyYWp5b3RpIERhdHRhIDxzaHViaHJhanlv
dGkuZGF0dGFAeGlsaW54LmNvbT4NCj4gPiBDYzogV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9y
Zz4NCj4gPg0K
