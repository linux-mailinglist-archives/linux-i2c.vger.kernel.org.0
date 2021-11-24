Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA6945B535
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Nov 2021 08:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238275AbhKXHVz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Nov 2021 02:21:55 -0500
Received: from mail-dm6nam11on2075.outbound.protection.outlook.com ([40.107.223.75]:43745
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229633AbhKXHVy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Nov 2021 02:21:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvQnuRI0SXAeGRx/7IT0QCz6YxTGIwq/Twh+keQfww3wx64pXvo9LI069kGMN+euRmOJcqqKRBlEByjUj08CYgQIBM9UBGrZC3yym2OeSTB6oI9y0feC4P6qy1zcbfSGpWIglsq2KxdS/lzSIw4i3k1kD9xbsRY395PCYBwi/X0E8zadeNXBQNlvWEsM+OaUZX/4ynWR0xyTPXjcHXcmWbIxNSoQF7J8wGOi5gzznNZR5U/EO4dXSXB7up6xxxO86rrdCkHM6/1DAR5Qc8wh4n+hKqq7dSu4+/q24/mvCe9GTxcV8H3879ff0K4epGxfd0kQLGJqscCNOHHFBk3o6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7BV2XfA0dakYTzBXS3o8o4gVylEtKclYv05+5z+jnQ=;
 b=MqhAoQTY8WdLqq7VAknWuhnxylOCYdMbJVl7QW6l1dBZGvo0mm2VPjb/hv2q9YKbT3yMNxEKpFajw4Y+OAMPQtmx+xaxLmOxuS10BhnOgI+Fns4hpr7+JeoJPORzCINpMADLdyreM7aI4F6XSJz/rrMZP/ZtPisG9OLn8N6oRtOiMYOSPl1LTyjNFI1mhxaZT4bM4iLoT+JFM+tMm/PiW1uoAbT7DBNMNZQ/hpAKcc+HgEwT5u/5nuNL+lCOoqskiJElbj2QLH0la/F8PZdNmqniPnCfGX1zcgh6kBDqzcF6vpn2ixSJnhU9VzySjtEujlzEmqNhzdenmwAze55Czw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7BV2XfA0dakYTzBXS3o8o4gVylEtKclYv05+5z+jnQ=;
 b=C3cDNrZ6spDR4M+xCaitMyLFYtnGKyZb7Skh70n8jhaZ5UscAR7LveLkLEx4Tv+oZmBmR34DYoyApOwVL+ct7FEJPLHt1m3EnT6uEVdTiPl9mNutQy7cSkC6+uPHGjsP6Q3SG9nwXgtwZUn7vOFlKOcmc2rOn7rg1Nb/O+KydcuUzG0hUh+DsdNFF2sjVU43Letw8Kz9I5sJoqdSBC/ffLoYfjSwT8YOcPGXfScfjuhGN43qQ6Wx5bQZmy5gn6LT9SAYgnxlnPNDNxVekzc1OJoFiBOfFFxSiCtKcvPKsXM9rNK2YVFucEDHfe2rjg4Wp82QYZTzaFDfCIPLQqvqFg==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 07:18:43 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::d170:24c:2ca0:7e1e]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::d170:24c:2ca0:7e1e%7]) with mapi id 15.20.4713.025; Wed, 24 Nov 2021
 07:18:43 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>
Subject: RE: [PATCH v2] i2c: tegra: Add ACPI support
Thread-Topic: [PATCH v2] i2c: tegra: Add ACPI support
Thread-Index: AQHX4DoEbVec8BOkJU60fp9nQzQHYKwRKraAgADyRTA=
Date:   Wed, 24 Nov 2021 07:18:43 +0000
Message-ID: <BN9PR12MB5273A7628D80076F4EF2CC69C0619@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
 <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
In-Reply-To: <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bbe0714-2e3e-49b8-8149-08d9af1aa5be
x-ms-traffictypediagnostic: BN9PR12MB5116:
x-microsoft-antispam-prvs: <BN9PR12MB51168FBEEC47BCA447FEE9C6C0619@BN9PR12MB5116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9c31ZrI1gQsh+ohA2BuGudH5JAPR6WMQUQ8ZCSzDQKPUzaVDVbILkGq0qCNb4T1DoYrwK1GbHvLrneq3JifJ69/GI2kd/Tr32G93pydf1aNh1N+bLMzRX9o7WF/961dx0e5G6fDNJVg639mVl8U+PC5N9cYdJ6srMQDlh1VbV/r9JPys7frSERx4pGDZxx2uootuNZA1Cj7bo2hr6SrA9FNaVaNz4JvZEWAqnKowmXxjEa/j4ThOD4ZedjnHr/EzRblb9PErXfwf3+IAbQz6QfS2Or07O9wLE0Cee4LgYACDwpYDB+tAu0+NdV8G9xLJWS0myKDTTMnOEkj2rxhSmEHAIWKH8mESav6GWmyrk258DLYT7EbsEQqywxkUMdMc/4x4KmdrGuyWcnJrP1ep+4O2TogU1yyC3p+enpfZ1TBcArU9Ta7ruGx/mdaXHnxaph8vT9PiNqakBmxI/wJ6IXiGGkbbAdJeoIgSvN39txj9VaRo9hMMfU6MXnMdTUraj9eFivhB1QlyJsfxP84lkm+FlkfQpcbStBOH87zfZrOeBehZrJPJx7HkL9lunYvhj+dsruJf2qPZUotnQ8fwpPLdnxhWHnqE6Z8sIgZuLm4YS2vJFmZspbdEBMMPDcReo0h0UZoxD87OPPIoRC5UJ2UV2tfKKxyyDJzFgPN7O7ykx83oHJfGszpRP4xg9JMrKS35aQVIZEBe5Oud29QiDFp71HeK0GpYhKBmU4j4y0M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(7696005)(26005)(107886003)(921005)(186003)(6506007)(8936002)(52536014)(55236004)(71200400001)(508600001)(4326008)(2906002)(38100700002)(55016003)(66446008)(64756008)(8676002)(86362001)(66946007)(316002)(7416002)(76116006)(110136005)(9686003)(83380400001)(66476007)(66556008)(122000001)(5660300002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmNkMXBjZjlGcU1ma1lKenMrT3ZUZENUTTBXeExoWitwTlI1RXVhcS9LekxS?=
 =?utf-8?B?NTF1UWFNelE4eE1XVDNYN3lkRTBqekljRlh5S1FOVFlXTzJKSlBDeklvaDU4?=
 =?utf-8?B?UkhUeXZlSWN6TUNXRGN3WTFrYVJ5U20rbzIxbXdKQ1pudWc5QTNGek93NXM2?=
 =?utf-8?B?eEdNdkVWTTh5NEorM3prbGtHWXZvbHM4TG5yaXNtMzJRWWQweFJ2UmpXTEVG?=
 =?utf-8?B?WW13amlTQnZva2xsTG11d2JMdVYyU0J4bXB6UWhuK1UwbzJRV0NteVhVZDg1?=
 =?utf-8?B?dVRSRzh3bEprQkxSdWZ5V2pETnNybk41MTJ3UXFRMXFxMy9aWUJyMHVhZVdk?=
 =?utf-8?B?ZXl5RDhZdC9NK3R1UXpyVGRveHNZcW1abXlSTE45YmhCVEE1cENUMDQzSFBE?=
 =?utf-8?B?OUV5ODdQaTdSQ1VOaU05MkI1UVBvSzNXdVZYOVpxVnFJMmhFOVBGUUU1WHFT?=
 =?utf-8?B?bGh3MlN4NytkaXJVVDI0Q29pNkNQVUZFMFZhYjFxcURKNnl3a3JWajFMVXUr?=
 =?utf-8?B?eUxndmplTWlERTc4R2xnM2JFT1ZpZS9LTjNhd2xNdjBrTkRnYjRkVm9wNjlT?=
 =?utf-8?B?Y0wwY1U0ZDBLdkRRSmVkUzhES0ZheWl1K2dUeDlVUDNDellwTGpPSTZFUTAx?=
 =?utf-8?B?QXFBTTBXM3NzSlp0QzhuMGdXeldLSkdCYzhYSVZMYXhIemx6MDhGNzdDZ3dD?=
 =?utf-8?B?U1V0K3BZVHRDaWtOMXc5Y2NLS3ZhUHdXMzl4SDU4MnRwRTFqRUVNcm5XcGR3?=
 =?utf-8?B?ZzdNaUVBRFdEdEo2Q2djR3V2N1ZxUEJXc0hZTGhhSUw2ZjB0WWdySUU5cExj?=
 =?utf-8?B?bmJMUHdENFNoa1MwbEZmNU95ckhYLzJwOGhHWWU3dnpkS0lNdS9WbkFLaU9F?=
 =?utf-8?B?VWxFTTUyNjBLeDN5dlVmUWk2OVo0YlQyRk9xQVRLc3ZuYzR3MHRRUXF6YzI1?=
 =?utf-8?B?amhTSEs4ZFVHUjh6c0dtNFpibTVsSlhtZ1Jib2RlckxMYldWTWV2RVQxbzZD?=
 =?utf-8?B?bVZVTXZBVjZ2SnNPd2RiT3EzM2VzTzRzdnN5R1locUhjN2ZFL2R2d1laRHk3?=
 =?utf-8?B?VllaM2RmR2VycFgzS3RXaEpSM0dkVDBoZldONW9LTmRQaDZvVGZjbllvUUN0?=
 =?utf-8?B?bS90Z0dBNTloVjJDZUZwWWV3VWZLTUhyanluT2E2YmxIUkR0R0QxN0ZkbGNn?=
 =?utf-8?B?ZEdCNHg4ak82NjQyWkptUXBtVm9ObndKdHd4QW0vY3BnRFFGaVI2QStMUnBt?=
 =?utf-8?B?dy82V3g2TnZxNG9IdFRLZjd0Sy85dXJOOEkraUdoT3B3ZGFOTnpzNHFVVWd6?=
 =?utf-8?B?QkE0YjhPWjYzN1VrVHFWVStPRGp0ZW4zN3lZUFVzU3ppTFVRSjZXWXl5V1M4?=
 =?utf-8?B?ZW1ic2V6Ris4ZlRhV2dEbTZLUS85YlBNdVo3Q3FGWWxmMFBSRHA3Uk93T2dM?=
 =?utf-8?B?cnJFNXlZUHlBanEvSjE2bHF2VkNyck95b2s3c2xyU29lYlhlZ0c2dHpoSGl0?=
 =?utf-8?B?L24rY1hXaUl5dk1UaWFQZ1NvK1l1QzkrTktjME5GaWt5dkRvWjZUVlZzdGhl?=
 =?utf-8?B?bTdGUTBENEZjM3F6a0hZakhLWkl1MGZnQWsrRHQwZ3RLMnpibDE4UFU2a0RH?=
 =?utf-8?B?dlIwMkRIYzhRVXRuK0UyaW10bzBKYm1zZVhSdGE3NjMwaldqcFgyazNaS1Q1?=
 =?utf-8?B?UUlUdzJoalBEKzVIaDdka2JkUTBKR1U4Q1JMRUo3QUNyaTR3UFMwbytoMWpY?=
 =?utf-8?B?SXJQaUZrN0hsWGRyaCtxVVFKYnE0RzdCeEVZY2NiMm1xUDFHbzA2ZExkKzR1?=
 =?utf-8?B?UTA4RHl3czR5YlhKcHJUUi9Yd3JXRWljKzEweGxTM3QwN3Y3WDdNc2hFUTJ3?=
 =?utf-8?B?WnJuc3liZWdHZDBEZ1c1V0d6aHgwVVkwTjA2M0c4TDlmR2Q1V2ZSZzZKY0px?=
 =?utf-8?B?UHpDeVc5L0oxcEtSMnRuZlhIZ2hvcUhPWDd4K1B2SEV1bFlzbFIyejcwN0h0?=
 =?utf-8?B?aHJiSXVHRVJGQkdhOFM1UEI3WU4xc21kQjVtNkNpMUU5ajN3R0hYUU5VQzBR?=
 =?utf-8?B?d012cENNNzZvMkQ5em02eWYrTkdxS1hyek9INXdvbWlKMWNsbGIvcFdKdUZL?=
 =?utf-8?B?SnRuWnF1UEQ5U0hRdnQybzFMVXYrRUNKbVR0VFErdW1GRXd3ZjcxMkdPRVJY?=
 =?utf-8?Q?XFZhc6koaGtS0Ux+soQOMSw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbe0714-2e3e-49b8-8149-08d9af1aa5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 07:18:43.3983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9WqIApXYTdH8iI78ueSiJgiFEQVIaRGhIi/sdo7bbHD9T/+E/zx1SZ4Lk4nDI2cjkxft4uOPpUXgZt5kLcnKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAyMy4xMS4yMDIxIDEwOjE1LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4gQWRkIHN1cHBvcnQg
Zm9yIEFDUEkgYmFzZWQgZGV2aWNlIHJlZ2lzdHJhdGlvbiBzbyB0aGF0IHRoZSBkcml2ZXIgY2Fu
DQo+ID4gYmUgYWxzbyBlbmFibGVkIHRocm91Z2ggQUNQSSB0YWJsZS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2QG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDUyDQo+ID4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNl
cnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMNCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVn
cmEuYyBpbmRleCBjODgzMDQ0Li44ZTQ3ODg5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVn
cmEuYw0KPiA+IEBAIC02LDYgKzYsNyBAQA0KPiA+ICAgKiBBdXRob3I6IENvbGluIENyb3NzIDxj
Y3Jvc3NAYW5kcm9pZC5jb20+DQo+ID4gICAqLw0KPiA+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9h
Y3BpLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvY2xrLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+IEBAIC02MDgs
NiArNjA5LDcgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfd2FpdF9mb3JfY29uZmlnX2xvYWQoc3Ry
dWN0DQo+ID4gdGVncmFfaTJjX2RldiAqaTJjX2RldikgIHN0YXRpYyBpbnQgdGVncmFfaTJjX2lu
aXQoc3RydWN0DQo+ID4gdGVncmFfaTJjX2RldiAqaTJjX2RldikgIHsNCj4gPiAgICAgICB1MzIg
dmFsLCBjbGtfZGl2aXNvciwgY2xrX211bHRpcGxpZXIsIHRzdV90aGQsIHRsb3csIHRoaWdoLA0K
PiA+IG5vbl9oc19tb2RlOw0KPiA+ICsgICAgIGFjcGlfaGFuZGxlIGhhbmRsZSA9IEFDUElfSEFO
RExFKGkyY19kZXYtPmRldik7DQo+ID4gICAgICAgaW50IGVycjsNCj4gPg0KPiA+ICAgICAgIC8q
DQo+ID4gQEAgLTYxOCw3ICs2MjAsMTEgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfaW5pdChzdHJ1
Y3QgdGVncmFfaTJjX2Rldg0KPiAqaTJjX2RldikNCj4gPiAgICAgICAgKiBlbWl0IGEgbm9pc3kg
d2FybmluZyBvbiBlcnJvciwgd2hpY2ggd29uJ3Qgc3RheSB1bm5vdGljZWQgYW5kDQo+ID4gICAg
ICAgICogd29uJ3QgaG9zZSBtYWNoaW5lIGVudGlyZWx5Lg0KPiA+ICAgICAgICAqLw0KPiA+IC0g
ICAgIGVyciA9IHJlc2V0X2NvbnRyb2xfcmVzZXQoaTJjX2Rldi0+cnN0KTsNCj4gPiArICAgICBp
ZiAoaGFuZGxlICYmIGFjcGlfaGFzX21ldGhvZChoYW5kbGUsICJfUlNUIikpDQo+IA0KPiBXaGlj
aCBTb0MgdmVyc2lvbiBkb2Vzbid0IGhhdmUgIl9SU1QiIG1ldGhvZD8gSWYgbmVpdGhlciwgdGhl
biBwbGVhc2UgcmVtb3ZlDQo+IHRoaXMgY2hlY2suDQo+IA0KPiA+ICsgICAgICAgICAgICAgZXJy
ID0gKGFjcGlfZXZhbHVhdGVfb2JqZWN0KGhhbmRsZSwgIl9SU1QiLCBOVUxMLA0KPiA+ICsgTlVM
TCkpOw0KPiANCj4gUGxlYXNlIHJlbW92ZSBwYXJlbnMgYXJvdW5kIGFjcGlfZXZhbHVhdGVfb2Jq
ZWN0KCkuIFdoeSB5b3UgYWRkZWQgdGhlbT8NCj4gDQo+ID4gKyAgICAgZWxzZQ0KPiA+ICsgICAg
ICAgICAgICAgZXJyID0gcmVzZXRfY29udHJvbF9yZXNldChpMmNfZGV2LT5yc3QpOw0KPiA+ICsN
Cj4gPiAgICAgICBXQVJOX09OX09OQ0UoZXJyKTsNCj4gPg0KPiA+ICAgICAgIGlmIChpMmNfZGV2
LT5pc19kdmMpDQo+ID4gQEAgLTE2MjcsMTIgKzE2MzMsMTIgQEAgc3RhdGljIHZvaWQgdGVncmFf
aTJjX3BhcnNlX2R0KHN0cnVjdA0KPiB0ZWdyYV9pMmNfZGV2ICppMmNfZGV2KQ0KPiA+ICAgICAg
IGJvb2wgbXVsdGlfbW9kZTsNCj4gPiAgICAgICBpbnQgZXJyOw0KPiA+DQo+ID4gLSAgICAgZXJy
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJjbG9jay1mcmVxdWVuY3kiLA0KPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpMmNfZGV2LT5idXNfY2xrX3JhdGUpOw0KPiA+
ICsgICAgIGVyciA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihpMmNfZGV2LT5kZXYsICJjbG9j
ay1mcmVxdWVuY3kiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
aTJjX2Rldi0+YnVzX2Nsa19yYXRlKTsNCj4gPiAgICAgICBpZiAoZXJyKQ0KPiA+ICAgICAgICAg
ICAgICAgaTJjX2Rldi0+YnVzX2Nsa19yYXRlID0gSTJDX01BWF9TVEFOREFSRF9NT0RFX0ZSRVE7
DQo+ID4NCj4gPiAtICAgICBtdWx0aV9tb2RlID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAi
bXVsdGktbWFzdGVyIik7DQo+ID4gKyAgICAgbXVsdGlfbW9kZSA9IGRldmljZV9wcm9wZXJ0eV9y
ZWFkX2Jvb2woaTJjX2Rldi0+ZGV2LA0KPiA+ICsgIm11bHRpLW1hc3RlciIpOw0KPiA+ICAgICAg
IGkyY19kZXYtPm11bHRpbWFzdGVyX21vZGUgPSBtdWx0aV9tb2RlOw0KPiA+DQo+ID4gICAgICAg
aWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAibnZpZGlhLHRlZ3JhMjAtaTJjLWR2YyIp
KSBAQA0KPiA+IC0xNjQyLDEwICsxNjQ4LDI1IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX2kyY19wYXJz
ZV9kdChzdHJ1Y3QgdGVncmFfaTJjX2Rldg0KPiAqaTJjX2RldikNCj4gPiAgICAgICAgICAgICAg
IGkyY19kZXYtPmlzX3ZpID0gdHJ1ZTsNCj4gPiAgfQ0KPiBIb3cgYXJlIHlvdSBnb2luZyB0byBk
aWZmZXJlbnRpYXRlIHRoZSBWSSBJMkMgZnJvbSBhIG5vbi1WST8gVGhpcyBkb2Vzbid0IGxvb2sN
Cj4gcmlnaHQuDQpUaGlzIHBhdGNoIGFkZHMgdGhlIEFDUEkgc3VwcG9ydCB0byBvbmx5IG5vbi1W
SSBJMkMuIFRoZSBkZXZpY2VfaWRzIGluIG1hdGNoIHRhYmxlDQphcmUgYWRkZWQgYWNjb3JkaW5n
bHkuIEkgc3VwcG9zZSwgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUgYWx3YXlzIHJldHVybnMgZmFs
c2UgYXMgDQp0aGVyZSBpcyBubyBkZXZpY2UgdHJlZS4gDQpBZ3JlZSB3aXRoIHRoZSBvdGhlciBj
b21tZW50cy4NCg0K
