Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEF3495F47
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 13:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380485AbiAUMuZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 07:50:25 -0500
Received: from mail-bn8nam11on2045.outbound.protection.outlook.com ([40.107.236.45]:33440
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346928AbiAUMuZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 07:50:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPY12KxhnSg+ot7LmBwnkZdZXWzoJyI/Jt9n6UnurDrwP4f24WszhmwT0L4d9SxRq8CvASRIdk9v0Xn+eF4/MfBTRMxMU+qCK4IleBPM2+Y1cuSqICSTwO5T3h64bwTE9QQwvKFi0fiIEC8lahvr9dCRIdZeW1rjpe7QodtQ6RqpDIWoarLikiQd6/6M+jvOmhZMrSPeeK6y6vXy+5u22M8IVATz1DTvnWflGnL7Ql3xzt/pujBryDPSMVQvdSrbgrpPJ25vcWd1SEfAO3U/dIdZ+AHLVZYpRAU4AK4nl4lZRy8YgQhEU8x1X29X2vLHZmcWicyT47hRIWh2FGTMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/D9JMLKC1oJYPZBNwDsqChQWU2yvX/Elvtoq5tA89U=;
 b=ZXJnY0LZrTOcuS/kvVgdN/2zsOHvMfcZPM8cKPTw1BIrE7mMEWzPAXd2OoAugb6PeokE20LCGWjALfOU3REP2DMFcGFHJhDkCOLgdVEGu+Zd0RuoEHW8ECgVL4elSmqLdBfoEu9jcqeTwr88lnpQYVnj6D+gX0OoSSSPepbdrz1JjklsWrN1LZDXLOeaAP1PKe6lHaD8am2Cp1fQmNQoTA+v4qnP8eD82t3hnl2THAjGVwdrX2z3rA6lIJ/BrJ3x6UpOscQaLjS9muEqbSBfQIGqfefp2W/DXZlKLoYIywK2/W7uUWIS4H2/Id+Sh8+giGF4uvTDi0KXsIQu8Hp9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/D9JMLKC1oJYPZBNwDsqChQWU2yvX/Elvtoq5tA89U=;
 b=FFBi6n/BZxiBsfNsb1UQlweRcpc4asJonObHmpyysv4U+SiMvfADfFc4zWRF4BNZVEXOJjFKzWv0dN7LRt2v8mLoadicMC/ULmJ+nDmgTUIMaAR6+uoYnAkxWxsKf4Hm4aa6dfFSERyA8+3aHkGEJBQndZEoPr3fADWFpLc3AWmdfh/d1Qfi8Q6eRveRXitCOIO8BwcI17jxvxWMnFbiB5MZKHbZlPUvdB4EpNOVjw62gmjVOM0pHtR2e6wqB3cxAr1MkVN43vvmqanAwmjalX2y51OMEEAmp6xl1EvuKSSKLg8pMwRuYIXM26Wc8RD6pYB7J/TC1ot5MqcDQvEgzQ==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by BY5PR12MB3796.namprd12.prod.outlook.com (2603:10b6:a03:1ae::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 12:50:22 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Fri, 21 Jan
 2022 12:50:22 +0000
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
Thread-Index: AQHYDgP6phflghtEl0OHgSBGD/B6PqxsAakAgAFob8A=
Date:   Fri, 21 Jan 2022 12:50:22 +0000
Message-ID: <DM5PR12MB18501911339A0274CBE20BB4C05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
 <1642686255-25951-3-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VehSCxszDV3UQCEnPk7OCXRabRMJEStjpCamBG6X1iaCw@mail.gmail.com>
In-Reply-To: <CAHp75VehSCxszDV3UQCEnPk7OCXRabRMJEStjpCamBG6X1iaCw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 539ab1e5-978d-4901-538b-08d9dcdc9646
x-ms-traffictypediagnostic: BY5PR12MB3796:EE_
x-microsoft-antispam-prvs: <BY5PR12MB37961FF42DF44F2E01BFBE0BC05B9@BY5PR12MB3796.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gBtgXTeZn3NocTR8L9i1VwTsYJ+U9Ouu3/gb69VSMbvREvnleCSHd+MXOjBBFurLVWfHSmZWZKCF/STw0eyOSQKDiVMGj4Ki8Scvyj5uj5UuzOMWlAXcJcVyl60KPnIEr3fW3GfB+ESifJ3x7TxGBL1NJ8PSeP8d6kAFC0jHcNyarCxac6dzEDZhcQGnDgsEUgooyrmxQ3rev/HOqSvz16xDcvRGlIUA2Aku08J3UVIXKx6r42LiUq1VqoJaUIOCQ6/ACzExoEHrUnjwBezVYvA0pvk7OO4M+qDTxE4y0f4j79X6X2htx8fpM9gMih+N0xPYPzLJfrUjW8yu+FWu38TFV+WgqAgNfwaqNf1jOlzyxHvzK2LwM2E65/AGkB1ZQHtE1eGMov58Qljl7/iBIE3/5Mvfy0T+gmdXfmA9PcSVT6IgQGedg1Ay4YPWD/pQ+wOQcUsuwptAG285luSpoCQmHuhmWpLvyB02URSiG7u+gibF0JzRkgc6hYT3xc4LoyaLmyygYOqMbCFm/Lw17TsdAmxxtHbecbxQ4Pm20YM3mRKknrtkGSXmGqbis2sbVmv852TOgRjO9Nq3/89yNjaOf1LeyxPPhpPJfYOEzhni0Shei+p7kI6UbljxMbUiK1Ea3rte5woxcivTkPKcCZ/jeIK5pw+SnN5zzd0hLgumMoklf1uvsm6G60cr8T+EvijEAcAdC/4q5m1oXK+VBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(83380400001)(66476007)(186003)(8676002)(55236004)(9686003)(54906003)(5660300002)(33656002)(6506007)(38070700005)(86362001)(2906002)(316002)(4326008)(8936002)(122000001)(26005)(52536014)(55016003)(38100700002)(76116006)(66556008)(66946007)(7696005)(6916009)(4744005)(7416002)(71200400001)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1kyM3lYdXZONXlTbU5TVmU1RjQwSExzZC9zUEc4c3JtSjZGdGpQZXAyaEdy?=
 =?utf-8?B?dzVXSEt6S25EOVNQdzZTN0RPVERsK1dCYW9iZ2diNHVZNDl2Q2U1cEhkYjZR?=
 =?utf-8?B?QTdRUGRvam1xMGZmSzNRZGFFZVJNaWNhdWozNlk5eFNNSVZQNDh4TDAyWmVu?=
 =?utf-8?B?dExaenM4UmVIVnJHcUZodllMUFJtMkpmclFqdkptOGFVWnJlS2l3ZUEzcFVa?=
 =?utf-8?B?T21yNzVMNTg0TG1GM0RUZTNLcG9QNENQK2VNWkhyY2FzK2RRclNMK1pKNHR6?=
 =?utf-8?B?dkNBNkhNdTZqVWdxZ2pTVFlHNmdKWXd2MXB3bVJMbWhhYmExWDVaY010RE5N?=
 =?utf-8?B?aysyclNnU0h2ZldDTmNWSjhQWGF2dnBCOCt3L3k2ekNlUHVpWDhYWFZZRnhj?=
 =?utf-8?B?UDNqSkJuT1VyekYwWXU3UkRDaUpqbjB0Ni9qU3NaVWFrcXU1S2FXS0N2S1FP?=
 =?utf-8?B?cHdtZUxDUzZvWjJKN3F2NUc2eGhoeWlVakQzSHFXSmRwVm1JVHlHUHdtTW4x?=
 =?utf-8?B?Q2Rwa0dXWlZDc3NNU211QXdkZVhEdlEwSnZjSWxIbnZRd1pqMkF4d2E0QzIr?=
 =?utf-8?B?aThzdXIxbkxoWTl0bHR5SWVsWnVBRktHT3pseTV6K2VlRzFCL2tCS3h0cXpR?=
 =?utf-8?B?ejkxUGtFNWhFOHZUTnhOTm5pODJnTEhHQ2I2alVaS0V3cktBd0JMbWx3VU5z?=
 =?utf-8?B?R0xRakY5Q1NEdHZYV0IxaVBKV2lFdGlobmxTQjEyN0tTczBrdmFBRjYrdXVV?=
 =?utf-8?B?ZjNPdUJsaWkwN1R5eGw2LzlueXlHeXM4aEVxb2xmQ0QvV05lL2JtcDAwTVlu?=
 =?utf-8?B?bnphMzNSVFptUkZYTVlFTSt4UWVmcTNtNklUQVl6M3BjT1dDSG14QnJVcHZi?=
 =?utf-8?B?K1RNNWh0dkFBMmI4YU5kd1ZhRVBrUlNnSExwOWJJcjVMdDRZQlpkN3NPV1lp?=
 =?utf-8?B?YnZJR1F6a0p3UnVjSHZjcmtFeWFNRHpWNXhHbzB1dDQxR3NkUEhpTnd2cHNy?=
 =?utf-8?B?YVZNVkFZYlhqT2IzT1FLYyt0cUVoZ2s5STU2cnBGeGIwMmNFT1YxcGhwVU1m?=
 =?utf-8?B?WkdiN1lSK3YwMmlrY0orak4yOVo4S2lHWkduNG9LMkJYN2tacGVyRTJqUE54?=
 =?utf-8?B?S0lNQytvekwzeFFzQURLSngyQUJIVDMrUm1BLzgyZERVOEhFREdBb3pSdG5R?=
 =?utf-8?B?SUw5RlNKVTl0aWtvZUh5TGV1djRTTm1TNDlDVEF1dEVXUGN2aUZJaEt0VDJ6?=
 =?utf-8?B?bTlMN1l0TW9wVmpzdm04Z0x0MVBNMDIvMjQ4SkR3ZTBnZkpwWVFSaHg5czA0?=
 =?utf-8?B?R1ZDVGFaOE1OYlhiUWRMK3Q0aWpMbWN1MXNlQ3Vhc3k0TGYwY0h5aTFOMXR2?=
 =?utf-8?B?S1M2WFg0bkMxTnVtMzY1b1BmVWNKMy9VeFN2Y1hlZlBtRC9IVEV0VmgxR0RN?=
 =?utf-8?B?Yng5bU9SWkNOWUJtc3dOY1JXdE5JM2lxcUE2WnFMT2ZxN2t3S3NQZ2hFQ3RS?=
 =?utf-8?B?TWp1dWpSakpzNWd2N1lVdGROcDc0eTFPcWcyVkNWZG5SMjd2azhnUmg2blFV?=
 =?utf-8?B?ZHhQdWhCKzk0NDVuR2VpOWhTbXdVdzg5QTJkczc3ZkNsU28yYmZVOStNcE1t?=
 =?utf-8?B?VTY5K1FBL2R3QTc2bVUxMlRnUEovK21uN0FFZUw2azhOcnFKWlVVRHd4bGhl?=
 =?utf-8?B?N09GSkpCeDZ1RUZKWE51WGhZM296R3I3ODYyeGRFanlCb2oxdnlURHhRcFhC?=
 =?utf-8?B?eDV1VDVvMm96MFMySERsUzBWMDI5SldSNC9HKytab3ZZUDlwc01EbitTRFFw?=
 =?utf-8?B?MUJ3dUc0NVVsRmY1UUtOeGtjb0dSMnhqbGptV3ZHd0lCQ3E4Tm45WVo5MjhB?=
 =?utf-8?B?MnVySjRiQzQ2L1NYcGJxemphYlMvSlZwSVVNZDFXeTRiSS9udlNobzFWM3da?=
 =?utf-8?B?M2xvT01sUDFQaG9VQzl0VE5ES1ZCMnNZOGJDL0xFQzJRcVZOUWR2ckhZSm5J?=
 =?utf-8?B?WXVjekU3RzgrMktJeXFoeVNjRlZFWVJQWmVzS0d4Y1dVQk0yeVpvVytNdEhj?=
 =?utf-8?B?NWdJRkp4RDVQNythb1BTSmV0bDJraVVudEVZU25VeXlIL3BwMUNpUTZzazRJ?=
 =?utf-8?B?RUl1YndzNStxZWVsUDVSeTVVWDdpZUJZS1NDSmh6am10L3MvNEpiZEY5YXFx?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539ab1e5-978d-4901-538b-08d9dcdc9646
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 12:50:22.0805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txkPvkrrVzy+BAqjEKoEdeFbXkxHGm7t0YPAA0kA6unfASk2QGUohCDrDNjEW5cMh+uGyUaDiyh/QXvi2S9vZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3796
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+IEFkZGVkIGRldGFpbHMgYW5kIGV4YW1wbGUgZm9yIG5hbWVkIGludGVycnVwdHMgaW4gdGhl
IEFDUEkgdGFibGUuDQo+IA0KPiBBZGRlZCBkZXRhaWxzIGFuZCBleGFtcGxlIGZvciAtLT4gQWRk
IGEgZGV0YWlsZWQgZXhhbXBsZSBvZiB0aGUNCj4gDQo+IC4uLg0KPiANCj4gPiArICAgICAgICAg
ICAgSW50ZXJydXB0IChSZXNvdXJjZUNvbnN1bWVyLCBMZXZlbCwgQWN0aXZlSGlnaCwgRXhjbHVz
aXZlKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAweDIwLA0KPiANCj4gSSB3b3VsZCB0aGluayBv
ZiBzcGxpdHRpbmcgdGhpcyB0byB0d28gc2VwYXJhdGUgZW50cmllcyBpbiBiZXR3ZWVuIG9mIHdo
aWNoIHRoZQ0KPiBHcGlvSW50KCkgcmVzb3VyY2UgaXMgcHJvdmlkZWQuIEl0IHdpbGwgZXhwbGlj
aXRseSBzaG93IHRoYXQgeW91IGRlc2NyaWJlIHRoZSBjYXNlDQo+IG9ubHkgZm9yIEludGVycnVw
dCgpLiBTb21ldGhpbmcgbGlrZQ0KPiANCj4gICBJbnRlcnJ1cHQgKC4uLikgeyAweDIwIH0NCj4g
ICBHcGlvSW50KC4uLikgeyAuLi4gfQ0KPiAgIEludGVycnVwdCAoLi4uKSB7IDB4MjQgfQ0KPiAN
Cj4gQnV0IGl0J3MgdXAgdG8geW91Lg0KSW5zdGVhZCwgd291bGQgaXQgYmUgZ29vZCB0byBhZGQg
YSBzdGF0ZW1lbnQgbWVudGlvbmluZyB0aGlzIGV4cGxpY2l0bHkuIFNvbWV0aGluZyANCmxpa2Ug
LQ0KDQogICAgVGhlIGludGVycnVwdCBuYW1lICdkZWZhdWx0JyB3aWxsIGNvcnJlc3BvbmQgdG8g
MHgyMCBpbiBJbnRlcnJ1cHQoKQ0KICAgIHJlc291cmNlIGFuZCAnYWxlcnQnIHRvIDB4MjQuIE5v
dGUgdGhhdCBvbmx5IHRoZSBJbnRlcnJ1cHQoKSByZXNvdXJjZQ0KICAgIGlzIG1hcHBlZCBhbmQg
bm90IEdwaW9JbnQoKSBvciBzaW1pbGFyLg0KDQpJIGZlZWwgbWl4aW5nIHRoZXNlIGluIHRoZSBl
eGFtcGxlIHdvdWxkIGFkZCBhIGJpdCBvZiBjb25mdXNpb24gdG8gdGhlIHJlYWRlci4NCg0KVGhh
bmtzLA0KQWtoaWwNCg==
