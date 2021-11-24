Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3364945CA38
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Nov 2021 17:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242161AbhKXQn2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Nov 2021 11:43:28 -0500
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:49619
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239320AbhKXQn1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Nov 2021 11:43:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRBt7JbNRElAvgBUI3gJR4wAunP07BBBONg3YIj3LA4121jarICem+BzhXqkGZCUj3AJetkhMQTsOh+7VXHhqsxW/SFjVm8Psi+OkPZtGGbGGwXJQOSOu3zfxRwsB8z7OSQtE9wytsmV4Xl06acHioUkXtArxGl9RY0j5WFXBvnbCknC2XOISJdlOw9b2VZZK/5YxKqq7vgVkB72N6f9Z3EMYnjZ/65XvP5j5ltvQ8U/cAt4Q8KXTlqg405J7R6htBLc6D0oCjWzy+AOd4p4ycn2yh4l8Cllbhb6wTpfYo9QudM9SO0e5ad3MG5hGM13glUmi/QZ4fEG5/qU8+Klwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyGxbwXXTWc3YP6yRODLnwb0wMmYrYCK1tstbxVJ4u8=;
 b=avRn8QRJbnZeaWjUWnqNiC9g8Z6FIjNsRZJbePU8FaG0rsr2IEd1AVmXOX9itZq4bOoyqO7RhD+O+aBm+RU2RxSj9C5brPlB5QwA/onbqFDyL42VxYJkrhyjEil+JgvA+M3LR64U+R7vyi7gZT2K18JfYhIQa63dXqfc7ywHk41gy5AOz8lnRChFTK9XQZrAC4ZR9gXls3edXolpcGcImVJlzD/CPD9d4PdrLt0VIeUzuh7VoFPTFcgV5kuKnVZ/cC0fE1aaUWysoqqIvYDyY2NK3ETXecXTkBiHwO4xxsmFNPDvsp6pySXyJIFT12FWykqoLEvPimmRwjD0tRdANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyGxbwXXTWc3YP6yRODLnwb0wMmYrYCK1tstbxVJ4u8=;
 b=iTTU7Vq1aSwgsZRDaprS9CgaoYmpILfNLMvPVv6YwPnzLUDgXCyuP+KKQR4NVCxQVSWCKl6zoKyuHbmwCHpasXN1bC44SivvPXisQU2D2aUwevfaeSfMGM6xTj+zT3A7kRQ82zAOI98dZFdEeOJpjvT49Te1cNNQTdLPcumVCd0vZBBuVPEhK2zZMlu8rIHi+5v7Bii5Hr7DwaVmneu5P5GdGPzTl6iGpM0ctYpQYjsY7bYCNorCF92fiBj+mA+2++9cp6N8dU/k21W4EZ0myHC4KE2SZrCnegqJ93BPX3RtQN7UiHSA0EJDCf/rnWviCiddB2jliRE1E4eYngLk8A==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5209.namprd12.prod.outlook.com (2603:10b6:408:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 24 Nov
 2021 16:40:16 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::d170:24c:2ca0:7e1e]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::d170:24c:2ca0:7e1e%7]) with mapi id 15.20.4713.025; Wed, 24 Nov 2021
 16:40:16 +0000
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
Thread-Index: AQHX4DoEbVec8BOkJU60fp9nQzQHYKwRKraAgADyRTCAALy1gIAABBVw
Date:   Wed, 24 Nov 2021 16:40:16 +0000
Message-ID: <BN9PR12MB5273CA3AA78636EB0500897AC0619@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
 <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
 <BN9PR12MB5273A7628D80076F4EF2CC69C0619@BN9PR12MB5273.namprd12.prod.outlook.com>
 <b06a5072-f0f4-c9f9-f9a2-8d76b4432415@gmail.com>
In-Reply-To: <b06a5072-f0f4-c9f9-f9a2-8d76b4432415@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b866e59-ee45-4e54-1243-08d9af691831
x-ms-traffictypediagnostic: BN9PR12MB5209:
x-microsoft-antispam-prvs: <BN9PR12MB520913BA4EE0B34E29496F3CC0619@BN9PR12MB5209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dGXLABdRHQUoE8sylHJTAqAk0yx4Ip1LylP0ophNg3ErXRIi6RhKnYCVTJV04HLq+1SBBS57zaX1wYUALO7p3g/RgTEJ97jX2amA5nCYvgPn29vSYeGH+8uR7ZdOPve8SUfE5WKfF7q4BHmgdhzVPcECpyE2wmNtQMyXscf2AxeCYdzGYB8g81XA6P3k4vokLpxwpj5uCYTDBsU1XByDvWK+CzBRE6xMhiNjhuDZQKRkm5iuKf8FQQym1b7zv8JVf8aBoJNnzoo/CC9CqhaYUVAGYawB7a8X3Qi03Gx4Gfjfp7dh1+5vs79ErZksHj5HqtBUYhLV7wVMpD+Cf+FyAMp3Jf1N9IGhWwAUaih5vJS5kgD2l+CC6wj1Tdy56SkAlbnVa5lrA7a4Q83Xxo6gcTc6KBQvhJL8MpJvf2XHo/7Whj1k5W3rWwy+dtnYD3QG9STo614i8vJfS1W1LwI/4oj/s942k3G5dEQO9cORolja3RB8EyCWFNOGhhcftn4cw0X2OnrwpcX7Y/yPQ3/YnR4KF1k26FbAFFJsej9btUstuz/6gVRYbIey5jRIxWSfQsp5utg9ePtE+qpo8rHUeOhGauYUwo4DSMX6o8Tl+/cJ9LJsYx7brS/aDpmZbcedZ8Y5Otaj7Gt0mX/0ptIB7beKQ6NTE63U9FjoTWkXA2289fL7hqbDJErYGFmJBofxXGLtcya1dzx7KFTylzIOES2/55+ZPdRRV1aoVRWPuxo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(4326008)(2906002)(33656002)(508600001)(66476007)(38100700002)(122000001)(186003)(83380400001)(55016003)(6506007)(4744005)(5660300002)(7696005)(26005)(55236004)(7416002)(71200400001)(110136005)(8936002)(107886003)(52536014)(66446008)(66556008)(76116006)(66946007)(86362001)(64756008)(38070700005)(9686003)(921005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3NiMmZjT2NxY0pIQW5yWmY0TFVFTmI4UVRkZzBoVWlralYyWnJQNTlob2hN?=
 =?utf-8?B?b295MGc5WVQ0L2F5YXQrRnlpbHVqR1loVUk5VFUvaGZXQmFvallCSUFENkVM?=
 =?utf-8?B?QkhycmZsL2FwQlc3eVUyR1piRS81allKSGlXSm5VNUg0OG9XQXVpOGthallr?=
 =?utf-8?B?VDVNb0ZsL0JvWU0rQ3ZyTmgzOFBuaVRDRzZKNGd4UVVlQnRhSXVwU0dwblVX?=
 =?utf-8?B?Q0ZEckFxSHRZcjdabmJSMmszdFgxanpIYTNreFBlMnlVdmlNRDM4NjFtTyta?=
 =?utf-8?B?RFNXQy9xa1dLeldOMCtnbmtXYlphZkFKU3dGQzRnbzVJM0ZvVXdsSVF5VmRu?=
 =?utf-8?B?MHJsOWpxcVd3RTNYTWc3dkU1TzNBK1FBckVCSjRNajg3ekE0a3g1OExRa09T?=
 =?utf-8?B?SnNqejJLMnQ3MzVoOGM5Y1VlOFlGWkFxV2lqL3lIYm80VmZuNXAxbjVtNWZn?=
 =?utf-8?B?MXJGWjd2RGVQUFVVVGRkbHRJalR5Z04xRExBS0VYYmFvL2wyRnMreG9kalZh?=
 =?utf-8?B?T1lzcFhjeGlMQTBYQU5xbG10Y3lVbGxtTCtIbUZvbmFWcEpBSDNRbDlMWGdP?=
 =?utf-8?B?TXFMU1huSkQ5VDFFOENneXdZLzVWOTV1alR2bjdITFpXRElwR3djL0NmWlQ3?=
 =?utf-8?B?ZWRuMlJwaXV6YTZwcXhNblhaVFk5d2FlZk40MnRLQmU0TTFPelZzbG5TNEV0?=
 =?utf-8?B?VkZNQ2JRSkg5MjJCWmtvYVl2UlBiTDJYMktuUmN5M1hyd2RuZjJkRlU1QWlF?=
 =?utf-8?B?K2RiZHBHeWZzNExGalE3V0pPbndGTmx4NFc5M1J1TVJNKzF5REdvYlpleFV6?=
 =?utf-8?B?Vkx6ZjFJWjNJdHhvV2JkSjJMQzY1RWR1TmM3aFBaUTlTeHdRajZMVjNGMkw0?=
 =?utf-8?B?S1hDY0FsVUx3L0F4S296dFdCTGdXR1hJeDlDdTgrMXM4S09HWmRKa2t6R2tT?=
 =?utf-8?B?QjBGSGg0YWNzVmR5WjcrUGZnZGp0cEJPa1VmVnEvWVdDK091YXlvN2labzRV?=
 =?utf-8?B?S3FWdTEzMm1sVU5XTUdISW1SRGNWUHo2NGZ0SmpTKzZHMGl6R2xCbFE0Nmh6?=
 =?utf-8?B?cUNJU1RiSE4ybWRTbTROc3RqRXNxcUhTY0NxT3JyVDZZOWRBZVQ0QVQ5c0w2?=
 =?utf-8?B?TWE1UVU0dEM1OW5CYW5Kck9YZTNFbW1MK2ZkcllTclJhdmxJbC9VUFFOU1pE?=
 =?utf-8?B?ckZubi8wQmw3MmlGcjJHWXl1WkdXWFg4YXAycjRwV0JBR2FiUjBwR0ZMbFVQ?=
 =?utf-8?B?VE1uMEZaZXd3OHN6RmdOWnRuSks3QzlBRHlVZVNLSlJqY3dsVVc5djJYT3hx?=
 =?utf-8?B?Q21KeFFCTmhpNmRVYlBzMkFWSHhDWXZxUnJtcEMybktrNzIwYlBVeGR2d1Na?=
 =?utf-8?B?RWFiM3ZnMHo0ME55SFhCRlhCbld3L2x4bThWS1RkTUtVLzJUeGVuajV3Y0R6?=
 =?utf-8?B?ZnRBdTVNMGpWWVd1STdnaEYydnZQMERkMkQxWXorZk91aTlCSzkyam95aWJ5?=
 =?utf-8?B?S2pKK2QwZE5HNUxlWlpPV2JwMHJYcll5Q3dIL0VFZk5XblhrRnVwemJpOXJQ?=
 =?utf-8?B?dTVMalYxK0lISDF6K3dhQjc1L2dINWFMZEtNZXBvM1VJWGE2cWNhN2lOd1pC?=
 =?utf-8?B?YlJ3MWRMVnV6VXRLY0ZPR1ZjNitGT3VxUXBlUFlVUEkxcG5jaDYvS3IyMlRl?=
 =?utf-8?B?VnVsUU52QTE4ci9SeFlTQzlnVCt2USthSHo0RlhaNkd4dU8yZU83Q0RjNHA3?=
 =?utf-8?B?ZzNXNkVMMDFtdnVIWkF4cmJrOWlIU2hFbVc0RDdlSnFuV2xvRlB4K1p4eGUw?=
 =?utf-8?B?M2tma01ZNzFJUzMvZzUyZFdPakZ3R3FJV09MaUY0YW5CcTZicXR3VDJqZVND?=
 =?utf-8?B?dm04Wmk0SG9ybTFEbk5tUmtSbkZEWTlKVlJIM3M1b1gxVkFDYjBuenBoOHNN?=
 =?utf-8?B?SUhFSzQ2UmpUV3pSVWFkeHNpTitSeVYzdVd0OWF6M2U5VXNpUGtnQWdLdDA1?=
 =?utf-8?B?T1ZqZCsvZXlJMHJaUWdxQkNmeXlqQm1SbTlzb3pKS3IydGlmQU9IWk5UWGpz?=
 =?utf-8?B?NlVOOUI1NjdsMjhSbEFHZjI3TGtUdjlnQlZlUzNLWS9NK0U4b2x5T0pxRnZ0?=
 =?utf-8?B?bGhEcERlZ0poU1RPaUkwRTFGeFBJL2EvbUpLcUQzY0ZmcHNpVTZuNmRSbWpH?=
 =?utf-8?Q?A5Yrkuv4chIYoMgDiJErBcc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b866e59-ee45-4e54-1243-08d9af691831
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 16:40:16.0956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBpCIA/m6JH/oLOAD63tvvYfEyFSUSWxIFL6GIxPgfCIRbIxHlA7joUMmkS0hncycGpUSv/tRY9Lw42/jqow7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5209
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAyNC4xMS4yMDIxIDEwOjE4LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4+ICppMmNfZGV2KQ0K
PiA+Pj4gICAgICAgICAgICAgICBpMmNfZGV2LT5pc192aSA9IHRydWU7ICB9DQo+ID4+IEhvdyBh
cmUgeW91IGdvaW5nIHRvIGRpZmZlcmVudGlhdGUgdGhlIFZJIEkyQyBmcm9tIGEgbm9uLVZJPyBU
aGlzDQo+ID4+IGRvZXNuJ3QgbG9vayByaWdodC4NCj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIEFD
UEkgc3VwcG9ydCB0byBvbmx5IG5vbi1WSSBJMkMuIFRoZSBkZXZpY2VfaWRzIGluDQo+ID4gbWF0
Y2ggdGFibGUgYXJlIGFkZGVkIGFjY29yZGluZ2x5LiBJIHN1cHBvc2UsIG9mX2RldmljZV9pc19j
b21wYXRpYmxlDQo+ID4gYWx3YXlzIHJldHVybnMgZmFsc2UgYXMgdGhlcmUgaXMgbm8gZGV2aWNl
IHRyZWUuDQo+ID4gQWdyZWUgd2l0aCB0aGUgb3RoZXIgY29tbWVudHMuDQo+IA0KPiBXaWxsIHRo
ZSBWSSBJMkMgaGF2ZSBhIGRpZmZlcmVudCBBQ1BJIElEIG9yIGhvdyBpdCdzIGdvaW5nIHRvIHdv
cms/DQpBcyB0aGVyZSBpcyBhIGRpZmZlcmVudCBjb21wYXRpYmxlIGZvciBWSSBJMkMgaW4gZGV2
aWNlIHRyZWUsIEkgc3VwcG9zZSB0aGUgQUNQSQ0Kd291bGQgaGF2ZSBhIGRpZmZlcmVudCBJRCBh
cyB3ZWxsLiBJIHRoaW5rIHRoZSBsb2dpYyB3b3VsZCBhbHNvIG5lZWQgYW4gdXBkYXRlIA0KaWYg
dG8gaGF2ZSBWSSBJMkMgdXNpbmcgdGhlIEFDUEkuIEJ1dCB0aGF0IHdhc24ndCBhY3R1YWxseSBj
b25zaWRlcmVkIGluIHRoaXMgcGF0Y2guDQoNCkJlc3QgUmVnYXJkcywNCkFraGlsDQoNCg==
