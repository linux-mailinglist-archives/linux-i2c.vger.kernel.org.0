Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB36493624
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 09:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343855AbiASIUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 03:20:40 -0500
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:59009
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1351871AbiASIUj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 03:20:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znrg3QuKJPyuvVjyu0F13x5Yuv+i5aignnLN4ty3lyJU2z6X7JVtJYtHbl35ubdQo2Ak5cqMJbo41QZFjhtrMizI9h2xF/Kr+s8OhoHUa+WM07RIcZtOyNr6aM6yfBiKwg7LHyRRluVgYbe0JCsQnXIhf1GTgcfBrCKxgp9DL9BG/nRbTbibidqcQxdB7+IYyGjeY0H3ofj6z/sR4ODnqMkEgq5yvL4tqWYRDbkyWEk8NMZS8jMot7gkUndIoz2ivjoE7+JDIDizrh3Ak0IZvT12CN38DtrQX6WuCTEw7/5zg93IcLOD3BHYKtAuzQsUXqEUxZF54AAHvqGjKsbjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bH/ROxVtO9e3fgI9GbUF9ZXnyAV0rlKol2uRrt+WEI=;
 b=FIhpjwq/Wyz3/yygyJq3tf9HfXPyUHSTVU5oltYz0kewMH6hZXcDkxQOV4+4Ds5Da0/pjZzoLwnmszKDslSfF1YIwDlM9R+MEipIe97jvz5eDkpvcwzTFabHw1yJ7RwfcOXKBWr8YSsEPFUYQHT3So89QhCqBNFUTVTDS3HLwU9cxupj6LhIltwVlPXp2lolHOJbvxz2Ae6yvsRsOK/fALSCaZ/2/VcgsyWInh+k2N/YkFadDlwEWa5dHv/CPWwRQiXhFy00zrEqeGffj5bs8szw2tRXFQ7WY060CmQUJtT+VIiaMZEAisMXWvd9uhoJkm5uFeZRlW8kmwgUTfsjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bH/ROxVtO9e3fgI9GbUF9ZXnyAV0rlKol2uRrt+WEI=;
 b=HO5toQeMQQdWnzGzvEj8t5OzL+05puKfByY5VrocSE2/MaXBUdiOKJGnxP2lFWetGa12xtGysp2Dww1uadnGc/AJWAGEbN8JGQTo385dZ6OdRblQ7HH8/Up8Rh3ievJjnKAAj+RmTOTH22H8MV4T2LjKpsPHjw6FjPf3zIktMQwTJ3eDjqwT9z9QYjTg9y9WBmx/lxH+rEkHvQbNqX1hIkQuhA2AeG+sl4RtTYq4Jo/0lRkn/AlTvU3dKtFHaH7thA6A2+AYEoykMofnPnaQE+7BgeuhMhMAn0MjqPPMOrtTsBdO0vqxIDaL+0wRsP9k7SwmLFlFuuqfq8afUFE/pQ==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 08:20:36 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Wed, 19 Jan
 2022 08:20:36 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Petlozu Pravareshwar <petlozup@nvidia.com>
Subject: RE: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Thread-Topic: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Thread-Index: AQHYCIHac1H6WD0+TEykLyGIHAPGEaxpShYAgACuXxA=
Date:   Wed, 19 Jan 2022 08:20:36 +0000
Message-ID: <DM5PR12MB1850237ECA6C115AD776635EC0599@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
 <1642080623-15980-2-git-send-email-akhilrajeev@nvidia.com>
 <d9a21970-b403-4674-dbd6-5dfab0a83a3b@gmail.com>
In-Reply-To: <d9a21970-b403-4674-dbd6-5dfab0a83a3b@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29f90a0c-f207-4123-09e1-08d9db249247
x-ms-traffictypediagnostic: CY4PR12MB1463:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1463088150E35DB4CB4AC5BDC0599@CY4PR12MB1463.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AafRev+B9NLWCtXVRA33Xzn/sSswxXEIROMfPe7qhPatJK4Wjm46jraVNNmlrfqysh7OVjxJOOa7uHHidV9WtJZJLTtIoROXU0bMI0kigqbuYhOXoKvrYFdd2+ZTlpPlTPZwUPxKPvBrlLlsnOdl1m2DNPudVWf1+0c5TiucFEz72R1YNu10X/bNffCs8qawOMdzTxgDg5aqWVPB2YqYNnCQfqvBYtExoBqnfDItLnZJmp/3rJewHMMOjX1bdSVRiAPhgdsBswaOjJuhRiwfnppFv2d2/IjwR7oLte1f6gYiLxtDAoq3siV1CixZlZxhOZQcTUFi20AInD7zoXKQszs/0XnlqL33mcH0pvXUj9DnDf2VXs6vuR7nwgzLDae6j/lOBgSrgLEhuxnmLE9O9TNIXeQTMvKokpGxVt9IntHLwaA95AXlgUvvtod95mIpJqaMdlzuEhEd6JxPR7dCIFTIp+sfEYNGE2f9NQ10Da0OTY0ldfazHRjVUN5c6xKaq4H6QKCvSYdUeaHKLCYw2ZsJ4gNuIDYLWNbCTV92pR2khn5moB8LmzgvX5Ea/Jr1QJ0Lb4lagaFuCWwYJiZ5tYok01bT5OB4q0w1mPW/vefDXhgH+96EYxwYZgMzgw8wJO795qEw1XhasoTbQ0RVyBN2DB2PWiqKUSL3Bs/HzLM8RfQz4yACyKtyb99zxYf37oEjaojwK85f9stIDWEJDPb7UWzgNy39nhhd63UeHz8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(122000001)(8676002)(66476007)(76116006)(508600001)(52536014)(38070700005)(33656002)(316002)(6636002)(66446008)(71200400001)(5660300002)(921005)(66946007)(64756008)(66556008)(110136005)(2906002)(6506007)(55236004)(9686003)(186003)(26005)(55016003)(8936002)(7696005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWh3VCtmYmJtLzlDQVdlTi9DZzIrczdTUmNxWmJvNlMvck5qSGlGZ3BBMXY4?=
 =?utf-8?B?WGNiZ1Y4NXhTeStkT004WFRjZ3ZYTHFqNDhMNFFhSUk0TEkyZWpvYU0xR1l5?=
 =?utf-8?B?NjNscHIreXU1cXA5aGd6UCtMS3RZK1VpL1d3RTBoM2c5SC82bUR3MGJ5T0Rs?=
 =?utf-8?B?di9DUGRMZDJxcC81T0UxbDJEYzJCTHh4bWZGU0FvWHNKa3lnNFR4c0dRMXVV?=
 =?utf-8?B?Z0UzdktMTkM5NWFxeFNEMUhTNVBvQ3RXbDBVTzAyVmEwMzUwd2UxSTMxNmVT?=
 =?utf-8?B?cURvY29NdldWbXdUVldsSkVpRU1KYThYU0VpM2pQQW15V25FeEZtTDdEWnJU?=
 =?utf-8?B?b3RwSVhTWHZ0R284Tlg0V2syc0ZpTjVnQUNkQ0E0dk5HVHVYT1B2K0ttR1dL?=
 =?utf-8?B?d3dvc2ZqeitzRmhXWVQ4aTJBcmNTUDBtbHhhb3hZbU1XN3dIOVJwRjh3T3hZ?=
 =?utf-8?B?VUdXdkVjVGZDWWl4VU5veEIraThycnpHSVhuUU9SRVZKRU5hWE5rbkNLZjBv?=
 =?utf-8?B?QmRvTWk2TDdlRUNQeURSQWR0dURVeWx3WVFERTBVZnpZRVpoMDI5Vkd2cURs?=
 =?utf-8?B?ZTErUlBqYTI2bzA4NElNU2VhM1l0V09JODVvOU9Zd3dhd1l4VGdWK0ZjZDlw?=
 =?utf-8?B?TTY1QU1ROE5UOGthTTZyVjBaKzFLTnpJVWlmblZiZStzNEpEcjdaelRpSmhN?=
 =?utf-8?B?QmNqMldWRnNpejlPWUxacy9lWGIvWXJnRTd4RFFKZlhiK3R1RmpuN2hvSGFv?=
 =?utf-8?B?NjhOMFRubW9xWmZsLzFQTnJpYzhNcUhBSUpsbjdKNkFRdGRaVm5ab28vWFpi?=
 =?utf-8?B?M0pDT0dmQWU5OXpIRUgyS0NRdWVub043cjZYaHBiQ0dvbUdPVnhpV21kV2ww?=
 =?utf-8?B?b09nSFFmNGhzTXZGc0VXbklmbmFsdC96dkZOMGxtUXVqZUE3dzZ3K3M0SHpT?=
 =?utf-8?B?YVFYVG9QK2VHdEZhd0NUUTkrQmlaeHF2UzBYM0JEWWhlVlpzNnl1WU9obThw?=
 =?utf-8?B?bnFXMzBnblFTOTZ5RGpMYmdLdzVqVExabDl5YU1sWWljY2lPd01rZ0hRWjZa?=
 =?utf-8?B?bm5kWjU2bnFuMTJjbWFmdmxVN25mWUNQV1QvL2IwaXdOVnlvY0tRQUpEYU1S?=
 =?utf-8?B?MmZYZ2Z1Rkxjc25QUzJlaWFhVDFoWTBkRjd1T0tnT2p5eG5lbUtoK1VGaEJi?=
 =?utf-8?B?UVcvenFjZkQ5OHd2Wkx0aVhPRlI3R1o5YmR2eVY4YmVpbGRCRWg4d1lsN3M0?=
 =?utf-8?B?TnhrUVlScUNoVFVrR0NLVzhNL1NaSU80aXAyZjV1b09zUWkva1h6MEhoa3Fj?=
 =?utf-8?B?L1FlZHhYTzliMjZUMnZUYllaQ2hRbk5SM2hiOTRjbEU4alQwZHNmTWVhZHVR?=
 =?utf-8?B?QU5vaGJkckRZdUZOajdJeGFNL3VzbzZicnNaZjNHUEtwdnRuZnNGRFdsSlBp?=
 =?utf-8?B?Y1ZrUVppOG9LVjdVM2RvdkhOSGNhYnJMTkdYTzVkdFRLdUpvdk84S3J1TVl6?=
 =?utf-8?B?dzdkaXRvM2ZxcUJvZW42NVgvaG9vaWQxVU55VW9vL3lWNDdzQ0JvaCs3ZDlS?=
 =?utf-8?B?TjYrdmRKZ3lWa3lSNU9EN1FFR0szUEdKZEFpWjBJL24zb0ptbVFKVjVRY0NU?=
 =?utf-8?B?QUpUN3dDNFVMSTZMTXAzakxVTGJCOEllSkhwcWs0VEhZZkg1emw3clZZY2dW?=
 =?utf-8?B?VG1SZithVU9KMEd4VS9Ld2pWV1krR1RWNFIyVDBqWmhsVmhIZXpHMVdIUUFI?=
 =?utf-8?B?MkFRVXNxSmp6VXZSMXlUUko3OFRJVDY5WnRTUDdwUG1Vc2xkb3I5V2hESVRi?=
 =?utf-8?B?cjdDNHExVDhGVThkQWszdmFweXdOdFgxMkpLTTc2NW5oZWtEYjBPbWFCK1pP?=
 =?utf-8?B?bExqV2hLT3FhcFpBQktPdU1jbHJxdks3MlVZQWkxRmx3VnRLVkI0N3hKTFpY?=
 =?utf-8?B?dlFRSDNuay9wQ0tmclc1TEJQRHlOdk5OMFAyK1FaQTFvcXNBOGVKd0tZbTdL?=
 =?utf-8?B?ODFPOGpvUjFoUERwMVBuV0k2aXFUc0RObXRJa21zaWRuN2xKTEhHRzEwcWU3?=
 =?utf-8?B?RS9HRkpUcm5Wa0ltdjB5U3VlOE92ckZSb01RZ3FOS0pjNER3ZXI0cGpqWVBp?=
 =?utf-8?B?Wm5rNzh1bFpQZ3pCQnp4RmJDeVZZcHN2ejNHNWdrL0doblI3T1I4b3BKQUVI?=
 =?utf-8?Q?tEEHLZcuqRd2RvpWmVPAdrA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f90a0c-f207-4123-09e1-08d9db249247
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 08:20:36.8133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYBGcPTHlJtkJ9Oms+7u5tcKRu6pCfwqkI7LtkY/aPX34axio+Wx/DGcJ534YV0ilv/5hMLaKIZ1avVVwYiHRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1463
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAxMy4wMS4yMDIyIDE2OjMwLCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgdGVncmFfaTJjX2h3X2ZlYXR1cmUgdGVncmEyMzRfaTJjX2h3ID0gew0KPiA+ICsg
ICAgIC5oYXNfY29udGludWVfeGZlcl9zdXBwb3J0ID0gdHJ1ZSwNCj4gPiArICAgICAuaGFzX3Bl
cl9wa3RfeGZlcl9jb21wbGV0ZV9pcnEgPSB0cnVlLA0KPiA+ICsgICAgIC5jbGtfZGl2aXNvcl9o
c19tb2RlID0gMHgyLA0KPiA+ICsgICAgIC5jbGtfZGl2aXNvcl9zdGRfbW9kZSA9IDB4NGYsDQo+
ID4gKyAgICAgLmNsa19kaXZpc29yX2Zhc3RfbW9kZSA9IDB4NTgsDQo+ID4gKyAgICAgLmNsa19k
aXZpc29yX2Zhc3RfcGx1c19tb2RlID0gMHgyNCwNCj4gPiArICAgICAuaGFzX2NvbmZpZ19sb2Fk
X3JlZyA9IHRydWUsDQo+ID4gKyAgICAgLmhhc19tdWx0aV9tYXN0ZXJfbW9kZSA9IHRydWUsDQo+
ID4gKyAgICAgLmhhc19zbGNnX292ZXJyaWRlX3JlZyA9IHRydWUsDQo+ID4gKyAgICAgLmhhc19t
c3RfZmlmbyA9IHRydWUsDQo+ID4gKyAgICAgLnF1aXJrcyA9ICZ0ZWdyYTE5NF9pMmNfcXVpcmtz
LA0KPiA+ICsgICAgIC5zdXBwb3J0c19idXNfY2xlYXIgPSB0cnVlLA0KPiA+ICsgICAgIC5oYXNf
YXBiX2RtYSA9IGZhbHNlLA0KPiA+ICsgICAgIC50bG93X3N0ZF9tb2RlID0gMHg4LA0KPiA+ICsg
ICAgIC50aGlnaF9zdGRfbW9kZSA9IDB4NywNCj4gPiArICAgICAudGxvd19mYXN0X2Zhc3RwbHVz
X21vZGUgPSAweDEsDQo+ID4gKyAgICAgLnRoaWdoX2Zhc3RfZmFzdHBsdXNfbW9kZSA9IDB4MSwN
Cj4gPiArICAgICAuc2V0dXBfaG9sZF90aW1lX3N0ZF9tb2RlID0gMHgwODA4MDgwOCwNCj4gPiAr
ICAgICAuc2V0dXBfaG9sZF90aW1lX2Zhc3RfZmFzdF9wbHVzX21vZGUgPSAweDAyMDIwMjAyLA0K
PiA+ICsgICAgIC5zZXR1cF9ob2xkX3RpbWVfaHNfbW9kZSA9IDB4MDkwOTA5LA0KPiA+ICsgICAg
IC5oYXNfaW50ZXJmYWNlX3RpbWluZ19yZWcgPSB0cnVlLCB9Ow0KPiANCj4gV2h5IHRlZ3JhMTk0
X2kyY19odyBjYW4ndCBiZSByZXVzZWQgYnkgVDIzND8gTG9va3MgbGlrZSBJMkMgaC93IGhhc24n
dA0KPiBjaGFuZ2VkIGFuZCBzb21lYm9keSBqdXN0IG1hZGUgYSBtaW5vciB0dW5pbmcgb2YgdGhl
IHRpbWluZyBwYXJhbWV0ZXJzLCBkb2VzDQo+IGl0IHJlYWxseSBtYXR0ZXIgaW4gcHJhY3RpY2U/
DQpUaGUgdGltaW5nIHBhcmFtZXRlcnMgYXJlIGltcG9ydGFudCB0byBnZXQgdGhlIGRlc2lyZWQg
ZGF0YSByYXRlIGZvciBJMkMuIFRoZSB2YWx1ZXMsDQp1bmZvcnR1bmF0ZWx5LCBjYW5ub3QgYmUg
cmV1c2VkIGZyb20gVGVncmExOTQuDQoNClRoYW5rcywNCkFraGlsDQoNCi0tDQpudnB1YmxpYw0K
