Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5E646FE00
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 10:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239480AbhLJJmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 04:42:18 -0500
Received: from mail-bn7nam10on2052.outbound.protection.outlook.com ([40.107.92.52]:9600
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239366AbhLJJmP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Dec 2021 04:42:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4cAj42pIXiRUMxPybPy6bWDASs6zfD1GDv3vHC8aEQfk7rMLzPiREbOwQ8ZfvUmdgheFGduozK0Um+iP7hbd8Wyd/2s7q6ZrsmzK2bVHwkSzz0S8ESCOBsREAtH5IJ3ULHHJ7v+KfEmsbQgD6undabRPI7BvUZLikP4lR7M+DCtMuO7R700ihdss0REFFS3gpa/ndWxGES6BtfyRGEYJFoOvPAnZ0mFY6e3ggTD0p2nzqjdHSmfbKj0S+x7HtkY+u9vNjWt4pAtfEYis9I2P8sbxWzNph00rrpBTHacTuFfjVMZ6Ewm0yg9dUh9ybQapgcp7OqYUSXWsZPiAYOvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ina+kzk0Y1ePiERk5eZJAmMQLvjDuk6C4ze070WAnc0=;
 b=RNMngPRCrTPKNm4k2uUZUAixQ5fPCnueCu3Mm63/wCkSF1C4W23u+6kjhSNV/BDzXh+MYwvanNLqDGjietQsEAiksxY6DEwHE5Qfz9lXLMYTTnpoJarGNuEmhaK7d1Fdi3KJ+didMaBpHq+J9sKz43EdR23UkIhklkroUvZfGXF3Mndr6rtX/hLrPtwDIWZTI5UlmYWeFGv9lHKETGEnUcjv0Rc0BWkIHeNRaUMErLO2U8jzXltKT++BebeAT/wAbaPbPUbNnuXoSSrn5+IZ9xW9YRb2FSSAZz5lH1IT8levkgQnk7li0RRhYDk2OeHvxi6/Dgixm330L88+NQ1kmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ina+kzk0Y1ePiERk5eZJAmMQLvjDuk6C4ze070WAnc0=;
 b=KfQi73cJN8z5mon5XDiEL2EAvt+BdHxWBo5tCGYgsIPPMsMuhNhEsSCjpEA5ZmYeCq9JgHCeZ4lg0v/WAyzR6ti/vkpaHXT1peDLPC5paspp1WZGRPOw5TgGu3NVp819Oc+chHTIiDRCSE9zuKMrG8E9L0odfgKph3YtvYvsvazk1M/ExRSNcS2+bJw/xEpAukD36ww6iW1Ftaq0yfgovLNeZDDD4zdo4Fx24jkPAQ0VaQ6i/Sj1qt/Fp381QGTooDvm3272oLYFi/q+kqB6P+z9YfqaX54pfQjHH53YkcdTEWelk0u7raBD7lIOcqLTKPiHM/LyLJNlyqNSl/56pg==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 09:38:39 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::18e7:e0b1:5caf:b4b5]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::18e7:e0b1:5caf:b4b5%6]) with mapi id 15.20.4755.022; Fri, 10 Dec 2021
 09:38:39 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
Thread-Topic: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
Thread-Index: AQHX7Q51DiMSOsap0UOB30Jpk4oaIKwqSIAAgAAIUtA=
Date:   Fri, 10 Dec 2021 09:38:39 +0000
Message-ID: <BN9PR12MB52733A443AA5D5A690CE7132C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
 <72ea6030-5f2d-4f51-3a42-8386c3638c65@gmail.com>
In-Reply-To: <72ea6030-5f2d-4f51-3a42-8386c3638c65@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 043c5037-b4ec-4da5-3e01-08d9bbc0d8be
x-ms-traffictypediagnostic: BN9PR12MB5306:EE_
x-microsoft-antispam-prvs: <BN9PR12MB5306020B9D68D4F433DA11BAC0719@BN9PR12MB5306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGWJHP9S7N9Butz7v+/nlLfJYm/jYCDao2pS02qXXYp96Ar7j4qnM5IbwFI4FsBL/0FUbgFmqACTF9ENKGy0Spxy2sHa6zs8Cdc6Ti6Brc3k4JNPQZQCshe/OsGV45ePO7j/ZPfZlA8U1QiO9a/hcZ2SxSgbz1jbcf0r2vMIyOAUgsp2vIdMJ8oKK00rMYCLz0uRXpEMtIzwMBCr7FynqdyrluNBVMQXP0AZEM0aRbTtYgwdkab+HtNsQ1EfKh6SI8Iedh6Y8CkAXzHFAXtYpUsbjBfH2QZulpXMlgtBRh+9NsW6Cf9ks//fgR/qCQ8aLhiCl8Ok8EXyYY3unVAkMgC2hajgAp5Lm/vBJiR9hQDwgeFr63P1qLfJDIm2sUkTwzhtUpVToqjpG9Vu7CQgOZgsBCWthHOZ53D+4q6RtRqI30EOI9BHhJ7/x8NUl6IKZq+3SCoBishfgXnkB6vY/b1nxW8QgN9ufLtPMWlk3hcG3nj4u0D9rHetTtANwKgENcGX5SEBgcz0Yp3e5zE7n4k2p8FrGvIQWc5LfMyg8Gnm19JLrqV/uARnEpnWHeP787W1uG3Qsk4xD8Ao83Wg0NORbNFd8Q643RYZYdqI46HQqkNGX294AcXiZkfDgHAyBtA5zOn2cBkc+EJpZ7S4T5kTvObOOJs4AaND5hbhg4o9kBEzbe9s8JH/bp2zSlVOUeG9hPv4j5aqNZPgdvbPYUlBqt3D7zKbTjIw4+PUcOI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(86362001)(64756008)(26005)(186003)(76116006)(66476007)(66946007)(55016003)(8936002)(15650500001)(316002)(66556008)(6506007)(71200400001)(122000001)(921005)(83380400001)(38100700002)(66446008)(5660300002)(9686003)(7696005)(7416002)(33656002)(110136005)(8676002)(508600001)(2906002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTlhclYyRzRjY08rTnZrbVBPZlc4U3VVTDZ4WWRobHlrdGthbWgrYzBZemtv?=
 =?utf-8?B?TXVqVXkrQVZMV0FydlhTbWNYeWJiTkh5MTRCbGRGVkxtcUZPdlhJQ0Z0Q3Ix?=
 =?utf-8?B?eDcxdE5oWGh0MU5PVXl3WnRXbFEwUXNadE5jd3R0aTdDNDkwWnIyc0kxdWRn?=
 =?utf-8?B?aWs4V3Y0M1JRdC9yc084TUM0L2IrUnNpYU8zUGtwOXV4ZmhHWVRWQStKUm12?=
 =?utf-8?B?NDF3dlNXemJ2S2NWNTJTS2xZaHpNTHV2VmQ2VzlxT3pEbTJBYTJJajR1bm1R?=
 =?utf-8?B?dUtKZDdaRDI4aUFFbThuUWwrWlo4Qzl0Kzd3MEU2Z1pIVlhSN2hsYXNWUzlO?=
 =?utf-8?B?bzFWZ01yb3BXUWRxOFZVbkczLzZkR044MnBiakppZkVhSkJMNnVzTnE3ZUFV?=
 =?utf-8?B?NTJJVnhnbVFiSEh5eVVpaDVCN0QyNVpEam5mN3cvYmQxV1V3K2lxdW11Qm5K?=
 =?utf-8?B?em9FSjdwOXJyQ1NUS3d1MFNxczBFS2hvNkV5QnJiaVdoUzlKdmo3eVQ4cU5v?=
 =?utf-8?B?c2dtNlhxL3hEdW1ML1d6MWgvYi9TVldrU3MwNjU5dXQvd3BpTTJhb1dIVFJC?=
 =?utf-8?B?bUJDNWV1cmFKQloyNUNkb05DdDlXeUtFb1p0TEZhMldYUzlCWmRnYjBHdFAy?=
 =?utf-8?B?bG5nTVZqZmxHR1YrQTNDd0YxZ3Uwa2hiM3RhaFZLdHl6TSt4ZnQvbk83eTBI?=
 =?utf-8?B?TzVwbTlrblFDdi9DQTFGeGN4L3AxZVVMdXpqQXJCNzZJQ1lRRFF5Yi9DRSts?=
 =?utf-8?B?VXpTRXYySW1tcFRLemljUUdQRjlRRXVVYkk5bGdUQ2thK1VhV2J3V3A1d05W?=
 =?utf-8?B?ak1qb0ZSTUxlTzNIc0FmbzJWdnNwYkc3SDlZdFROdWRHVG5HU1E3QTcrUEdo?=
 =?utf-8?B?RURwYWNsd1BQQXVsS3NKZHZlcFcyM0wxbnpvYmcwWTdaejVtRFZGelE5QUpU?=
 =?utf-8?B?RmtObHBha3dkZnovU2hvbEpqdm1URnJRaXZDa2dwYzFYd2dKNG1NRGk3c0tr?=
 =?utf-8?B?ZzNJTC9POWxhUVpGUlRhdHpUdVJ2bnpISnc2RmFYbnoxNFpCNkc2eWtKOEtJ?=
 =?utf-8?B?MHNnKzZpNkdyODVvQVR6dUtmUENiVkxUaFVqUnBDaXpIL2xWU1IxdWxJbGFQ?=
 =?utf-8?B?QlJjMVp5cHhDUGZUbHNRZy9TaUo5eGlDZE5aYXNBWEdjNXlsQ090TW5uTFNZ?=
 =?utf-8?B?aEoxa1RXZStUbUxqZHFBS0R5SGxpUUhQcGpYRGtsbHlYcWUwaExTUEpNZ1FG?=
 =?utf-8?B?MzNZVENQeGRRNDFnc2p0cHhOMCtqUDZ0WVJKMSszMWRhSHpyYlFrWHQreUdv?=
 =?utf-8?B?NzlTTkM2MlM5TE9Mc05RbkowNStIUFR0eGVCTkRhSy9pOStIK2pSWEZQWDE5?=
 =?utf-8?B?ZlZJUG1MRTJLZXU0ZU5YaGJNYnpMTG9TdnM1OUNpZzYrOEY4VTlWSFlwQlNr?=
 =?utf-8?B?WWdjbTE5alk5MzVqdE0vUWlRSVZRNC9Tcyt4K3JSUDAvQnExS01QNUNOMmdN?=
 =?utf-8?B?NWRnQVZOZEloM0xxK3Z0b2xKV2hyUm9va2xCT25FaHI2RUJnNUVTR1pteHVk?=
 =?utf-8?B?WHJIRXNvdjMxU1A5SU1FanJZVEUycmZvKzUwZG0zeGFsOWFLdDhqMG5NMGdE?=
 =?utf-8?B?VEw1Q29iOFhwSFB2U0krMFMrZWFMVmZ4eVR1OE56VktkUHVtL09tbnZDZXFT?=
 =?utf-8?B?VUE1eG9tRE1oUXFjRlcyRHRxTkNlNGlXSzBxVCtIWjBjK0xOaXNXdGgvZ2Fy?=
 =?utf-8?B?SFNlK1Yzbzl4WEFKQ2I0TDVDcHQrRTFVVXlINnVObWRtNVR2SU1DaHAxaVlv?=
 =?utf-8?B?alZuYjRKNkVJREZXam1nT2VlOEZiSmxyM3ZqYS9KK0tNRGs0eVRDK0JiUWJP?=
 =?utf-8?B?NDd3Kys0Q2RvNThUbFpvVGprZFR6YzhPRGZBM2cvZllzNmM4TVUyNlZVYlBo?=
 =?utf-8?B?WUNKekxLWFp1eVRpa0RBTUFNQnlGTDcwMjdHZFZ1cHNXNnkyQ1hWb21wODdx?=
 =?utf-8?B?Nk41a1ZhTWdHSjkyNE5uelpIbWJDeFZITUN0VUZZV2d6NXM2UHBsZENkaWIr?=
 =?utf-8?B?cDc3TVpPbEU5ZExVWlpKNEJJK1FPQnNLNVVRNXhyR3cydHBQQWJWbGpsSDlj?=
 =?utf-8?B?RlhKL2QxdDFhTGJMY1R4N1YwTVpFMFE4clpjdG1ucXBVTFR3Q2F4d3hJTEtx?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043c5037-b4ec-4da5-3e01-08d9bbc0d8be
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 09:38:39.2892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZA4qsSekYx1llwW+VVRjxENWFjXCaMpf/tFEkc453Ej3FbUuMh9f5iNHLRhgpvEM3al2M6QH4MQK3D9Sajbobg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAwOS4xMi4yMDIxIDE4OjA1LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4gRW11bGF0ZSB0aGUg
U01CdXMgYmxvY2sgcmVhZCB1c2luZyBDb250aW51ZVhmZXIgYW5kIFNNQnVzIHVzaW5nIEdQSU8N
Cj4gPiBpbnRlcnJ1cHQuDQo+ID4NCj4gPiBGb3IgU01CdXMgYmxvY2sgcmVhZCwgdGhlIGRyaXZl
ciAgcmVhZHMgdGhlIGZpcnN0IGJ5dGUgd2l0aA0KPiA+IENvbnRpbnVlWGZlciBzZXQgd2hpY2gg
d2lsbCBoZWxwIHRvIHBhcnNlIHRoZSBkYXRhIGNvdW50IGFuZCByZWFkIHRoZQ0KPiA+IHJlbWFp
bmluZyBieXRlcyB3aXRob3V0IHN0b3AgY29uZGl0aW9uIGluIGJldHdlZW4uDQo+ID4gU01CdXMg
YWxlcnQgaXMgaW1wbGVtZW50ZWQgdXNpbmcgZXh0ZXJuYWwgZ3BpbyBpbnRlcnJ1cHQuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMgfCA1NA0KPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy10ZWdyYS5jIGluZGV4IGE1YmU4ZjAuLjNiNzAwMTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy10ZWdyYS5jDQo+ID4gQEAgLTE0LDYgKzE0LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1tYXBwaW5nLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2kyYy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaTJjLXNtYnVzLmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQu
aD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gQEAgLTIyNiw2ICsyMjcsMTEgQEAg
c3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHsNCj4gPiAgICAgICBib29sIGhhc19pbnRlcmZh
Y2VfdGltaW5nX3JlZzsNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdHJ1Y3QgdGVncmFfaTJjX3NtYmFs
ZXJ0IHsNCj4gDQo+IHNtYmFsZXJ0IGlzbid0IGEgd29yZCwgc2hvdWxkIGJlIHNtYnVzX2FsZXJ0
LiBTYW1lIGZvciB0aGUgR1BJTyBuYW1lIGFuZA0KPiBvdGhlciBwbGFjZXMuDQpUaGUgYWN0dWFs
IG5vdGF0aW9uLCBJIHN1cHBvc2UsIGlzIFNNQkFMRVJUIy4gSWYgeW91IHNlZSBpdCBpcyBiZXR0
ZXIgdG8gbWFrZSBpdCANCnNtYnVzX2FsZXJ0LCBJIGNhbiB1cGRhdGUgaXQuICdzbWJhbGVydCcg
YWxzbyBsb29rcyBnb29kIHRvIG1lIHRob3VnaC4NCj4gDQo+ID4gKyAgICAgc3RydWN0IGkyY19z
bWJ1c19hbGVydF9zZXR1cCBhbGVydF9kYXRhOw0KPiA+ICsgICAgIHN0cnVjdCBpMmNfY2xpZW50
ICphcmE7DQo+IA0KPiBXaGF0ICJhcmEiIHN0YW5kcyBmb3I/IFBsZWFzZSB1c2UgbWVhbmluZ2Z1
bCBuYW1lcywgbGlrZSBhbGVydF9kZXYgZm9yDQo+IGV4YW1wbGUuDQppMmMtc21idXMuYyB1c2Vz
IHRoZSBzYW1lIG5hbWUgdG8gcmVmZXIgdG8gdGhlIHNtYnVzIGFsZXJ0IGkyY19jbGllbnQuDQpJ
IHRob3VnaHQgdG8gdXNlIHRoZSBzYW1lIGZvciBjb25zaXN0ZW5jeSB3aXRoIHRoZSBjb3JlIGFu
ZCBvdGhlciBkcml2ZXJzLg0KSXQgc3RhbmRzIGZvciAiQWxlcnQgcmVzcG9uc2UgYWRkcmVzcyIu
DQo+IA0KPiBJIGRvbid0IHNlZSB3aGVyZSB0aGlzIG1lbWJlciBpcyB1c2VkIGF0IGFsbCwgcGxl
YXNlIHJlbW92ZSBpdC4NCldvdWxkbid0IGl0IGJlIGdvb2QgdG8gaGF2ZSBpdCBzdG9yZWQgc28g
dGhhdCBpdCBpcyBoYW5keSBpZiB1c2luZyBhbnkgb3RoZXIgDQpmdW5jdGlvbiBsYXRlciwgbGlr
ZSBpMmNfaGFuZGxlX3NtYnVzX2FsZXJ0LiBNb3Jlb3ZlciwgSSB0aG91Z2h0IHRvIGtlZXANCnRo
ZSB1c2FnZSBjb25zaXN0ZW50IHdpdGggb3RoZXIgZHJpdmVycyBoYXZpbmcgc2ltaWxhciBmdW5j
dGlvbi4NCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+ICAvKioNCj4gPiAgICogc3RydWN0IHRlZ3Jh
X2kyY19kZXYgLSBwZXIgZGV2aWNlIEkyQyBjb250ZXh0DQo+ID4gICAqIEBkZXY6IGRldmljZSBy
ZWZlcmVuY2UgZm9yIHBvd2VyIG1hbmFnZW1lbnQgQEAgLTI4MCw2ICsyODYsOCBAQA0KPiA+IHN0
cnVjdCB0ZWdyYV9pMmNfZGV2IHsNCj4gPiAgICAgICBpbnQgbXNnX2VycjsNCj4gPiAgICAgICB1
OCAqbXNnX2J1ZjsNCj4gPg0KPiA+ICsgICAgIHN0cnVjdCB0ZWdyYV9pMmNfc21iYWxlcnQgc21i
YWxlcnQ7DQo+IA0KPiBBbGwgcHJvcGVydGllcyBtdXN0IGhhdmUgZG9jIGNvbW1lbnQuDQpBZ3Jl
ZQ0KPiANCj4gPiAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiBkbWFfY29tcGxldGU7DQo+ID4gICAg
ICAgc3RydWN0IGRtYV9jaGFuICp0eF9kbWFfY2hhbjsNCj4gPiAgICAgICBzdHJ1Y3QgZG1hX2No
YW4gKnJ4X2RtYV9jaGFuOw0KPiA+IEBAIC0xMjMyLDYgKzEyNDAsMTEgQEAgc3RhdGljIGludCB0
ZWdyYV9pMmNfeGZlcl9tc2coc3RydWN0IHRlZ3JhX2kyY19kZXYNCj4gKmkyY19kZXYsDQo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiA+DQo+ID4gICAgICAgaTJjX2Rldi0+bXNnX2J1
ZiA9IG1zZy0+YnVmOw0KPiA+ICsNCj4gPiArICAgICAvKiBUaGUgY29uZGl0aW9uIHRydWUgaW1w
bGllcyBzbWJ1cyBibG9jayByZWFkIGFuZCBsZW4gaXMNCj4gPiArIGFscmVhZHkgcmVhZCovDQo+
IA0KPiBQcm9wZXIgU01CdXMgY2FwaXRhbGl6YXRpb24gaW4gY29tbWVudHMuIE11c3Npbmcgd2hp
dGVzcGFjZSBpbiB0aGUgZW5kIG9mIHRoZQ0KPiBjb21tZW50Lg0KQWdyZWUuDQo+IA0KPiA+ICsg
ICAgIGlmIChtc2ctPmZsYWdzICYgSTJDX01fUkVDVl9MRU4gJiYgZW5kX3N0YXRlICE9DQo+IE1T
R19FTkRfQ09OVElOVUUpDQo+ID4gKyAgICAgICAgICAgICBpMmNfZGV2LT5tc2dfYnVmID0gbXNn
LT5idWYgKyAxOw0KPiA+ICsNCj4gPiAgICAgICBpMmNfZGV2LT5tc2dfYnVmX3JlbWFpbmluZyA9
IG1zZy0+bGVuOw0KPiA+ICAgICAgIGkyY19kZXYtPm1zZ19lcnIgPSBJMkNfRVJSX05PTkU7DQo+
ID4gICAgICAgaTJjX2Rldi0+bXNnX3JlYWQgPSAhIShtc2ctPmZsYWdzICYgSTJDX01fUkQpOyBA
QCAtMTM4OCw2DQo+ID4gKzE0MDEsMTUgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfeGZlcihzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdA0KPiBpMmNfbXNnIG1zZ3NbXSwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgZWxzZQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVuZF90eXBlID0gTVNHX0VORF9SRVBFQVRfU1RBUlQ7DQo+ID4gICAgICAgICAgICAgICB9DQo+
ID4gKyAgICAgICAgICAgICAvKiBJZiBNX1JFQ1ZfTEVOIHVzZSBDb250aW51ZVhmZXIgdG8gcmVh
ZCB0aGUgZmlyc3QgYnl0ZSAqLw0KPiA+ICsgICAgICAgICAgICAgaWYgKG1zZ3NbaV0uZmxhZ3Mg
JiBJMkNfTV9SRUNWX0xFTikgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSB0ZWdy
YV9pMmNfeGZlcl9tc2coaTJjX2RldiwgJm1zZ3NbaV0sDQo+IE1TR19FTkRfQ09OVElOVUUpOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBTZXQgdGhl
IHJlYWQgYnl0ZSBhcyBtc2cgbGVuICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG1zZ3Nb
aV0ubGVuID0gbXNnc1tpXS5idWZbMF07DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9k
YmcoaTJjX2Rldi0+ZGV2LCAicmVhZGluZyAlZCBieXRlc1xuIiwgbXNnc1tpXS5sZW4pOw0KPiA+
ICsgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICAgICAgcmV0ID0gdGVncmFfaTJjX3hmZXJf
bXNnKGkyY19kZXYsICZtc2dzW2ldLCBlbmRfdHlwZSk7DQo+ID4gICAgICAgICAgICAgICBpZiAo
cmV0KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiBAQCAtMTQxNSw3ICsx
NDM3LDggQEAgc3RhdGljIHUzMiB0ZWdyYV9pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXINCj4g
PiAqYWRhcCkgIHsNCj4gPiAgICAgICBzdHJ1Y3QgdGVncmFfaTJjX2RldiAqaTJjX2RldiA9IGky
Y19nZXRfYWRhcGRhdGEoYWRhcCk7DQo+ID4gICAgICAgdTMyIHJldCA9IEkyQ19GVU5DX0kyQyB8
IChJMkNfRlVOQ19TTUJVU19FTVVMICYNCj4gfkkyQ19GVU5DX1NNQlVTX1FVSUNLKSB8DQo+ID4g
LSAgICAgICAgICAgICAgIEkyQ19GVU5DXzEwQklUX0FERFIgfCBJMkNfRlVOQ19QUk9UT0NPTF9N
QU5HTElORzsNCj4gPiArICAgICAgICAgICAgICAgSTJDX0ZVTkNfU01CVVNfUkVBRF9CTE9DS19E
QVRBIHwgSTJDX0ZVTkNfMTBCSVRfQUREUiB8DQo+ID4gKyAgICAgICAgICAgICAgIEkyQ19GVU5D
X1BST1RPQ09MX01BTkdMSU5HOw0KPiA+DQo+ID4gICAgICAgaWYgKGkyY19kZXYtPmh3LT5oYXNf
Y29udGludWVfeGZlcl9zdXBwb3J0KQ0KPiA+ICAgICAgICAgICAgICAgcmV0IHw9IEkyQ19GVU5D
X05PU1RBUlQ7IEBAIC0xNzI3LDYgKzE3NTAsMjkgQEAgc3RhdGljDQo+ID4gaW50IHRlZ3JhX2ky
Y19pbml0X2hhcmR3YXJlKHN0cnVjdCB0ZWdyYV9pMmNfZGV2ICppMmNfZGV2KQ0KPiA+ICAgICAg
IHJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IHRlZ3JhX2kyY19zZXR1
cF9zbWJhbGVydChzdHJ1Y3QgdGVncmFfaTJjX2RldiAqaTJjX2Rldikgew0KPiA+ICsgICAgIHN0
cnVjdCB0ZWdyYV9pMmNfc21iYWxlcnQgKnNtYmFsZXJ0ID0gJmkyY19kZXYtPnNtYmFsZXJ0Ow0K
PiA+ICsgICAgIHN0cnVjdCBncGlvX2Rlc2MgKmFsZXJ0X2dwaW9kOw0KPiA+ICsgICAgIHN0cnVj
dCBpMmNfY2xpZW50ICphcmE7DQo+ID4gKw0KPiA+ICsgICAgIGFsZXJ0X2dwaW9kID0gZGV2bV9n
cGlvZF9nZXQoaTJjX2Rldi0+ZGV2LCAic21iYWxlcnQiLCBHUElPRF9JTik7DQo+ID4gKyAgICAg
aWYgKElTX0VSUihhbGVydF9ncGlvZCkpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VS
UihhbGVydF9ncGlvZCk7DQo+ID4gKw0KPiA+ICsgICAgIHNtYmFsZXJ0LT5hbGVydF9kYXRhLmly
cSA9IGdwaW9kX3RvX2lycShhbGVydF9ncGlvZCk7DQo+ID4gKyAgICAgaWYgKHNtYmFsZXJ0LT5h
bGVydF9kYXRhLmlycSA8PSAwKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHNtYmFsZXJ0LT5h
bGVydF9kYXRhLmlycTsNCj4gPiArDQo+ID4gKyAgICAgYXJhID0gaTJjX25ld19zbWJ1c19hbGVy
dF9kZXZpY2UoJmkyY19kZXYtPmFkYXB0ZXIsICZzbWJhbGVydC0NCj4gPmFsZXJ0X2RhdGEpOw0K
PiA+ICsgICAgIGlmIChJU19FUlIoYXJhKSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKGFyYSk7DQo+ID4gKw0KPiA+ICsgICAgIHNtYmFsZXJ0LT5hcmEgPSBhcmE7DQo+ID4gKw0K
PiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW50IHRlZ3Jh
X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0KPiA+ICAgICAgIHN0
cnVjdCB0ZWdyYV9pMmNfZGV2ICppMmNfZGV2Ow0KPiA+IEBAIC0xODIxLDYgKzE4NjcsMTIgQEAg
c3RhdGljIGludCB0ZWdyYV9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRl
dikNCj4gPiAgICAgICBpZiAoZXJyKQ0KPiA+ICAgICAgICAgICAgICAgZ290byByZWxlYXNlX3Jw
bTsNCj4gPg0KPiA+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGkyY19kZXYt
PmRldiwgInNtYnVzLWFsZXJ0IikpIHsNCj4gDQo+IEknZCBtb3ZlIHRoaXMgZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfYm9vbCgpIGluc2lkZSBvZg0KPiB0ZWdyYV9pMmNfc2V0dXBfc21idXNfYWxlcnQo
KSwgZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGNvZGUgaW4gdGhpcw0KPiBk
cml2ZXIuDQpBZ3JlZS4NCj4gDQo+IEFsdGhvdWdoLCB5b3Ugc2hvdWxkbid0IG5lZWQgaXQgYXQg
YWxsLCB1c2UgZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoKS4NCnNtYnVzLWFsZXJ0IGlzIHByb3Zp
ZGVkIGluIHRoZSBpMmMgZHQgYmluZGluZ3MgYnkgZGVmYXVsdC4gSSBmZWx0IGl0IGlzIGdvb2QN
CnRvIHB1dCBpdCBpbnRvIHVzZSBzaW5jZSB0aGUgdXNlIGNhc2UgaXMgc2FtZS4NCj4gDQo+ID4g
KyAgICAgICAgICAgICBlcnIgPSB0ZWdyYV9pMmNfc2V0dXBfc21iYWxlcnQoaTJjX2Rldik7DQo+
ID4gKyAgICAgICAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZf
d2FybigmcGRldi0+ZGV2LCAic21idXMtYWxlcnQgc2V0dXAgZmFpbGVkOg0KPiA+ICsgJWRcbiIs
IGVycik7DQo+IA0KPiBHUElPIG1heSBwcm9iZS1kZWZlciwgbXVzdCBiZSBkZXZfZXJyX3Byb2Jl
KCkgaGVyZS4NCkFncmVlLiBBbHNvLCB3aWxsIGNoZWNrIG9uIHRoZSBvcHRpb24gdG8gdXNlIGlu
dGVycnVwdCBkaXJlY3RseSBpbnN0ZWFkIG9mDQpHUElPLg0KDQpUaGFua3MsDQpBa2hpbA0K
