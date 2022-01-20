Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3841C494BAE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 11:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242282AbiATK3N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 05:29:13 -0500
Received: from mail-bn8nam12on2059.outbound.protection.outlook.com ([40.107.237.59]:31392
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242171AbiATK3N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 05:29:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBXYIbqJ+jqGd/qsHA9caNb01RmwloiIZQVdJogrdqUtrjMQvCQV2IILn7yBDGg+Q7EmSFCouHLxPLi9ffdYcDVvGOxWmMeBhyvyWRB2XqK1i9LsY6ViOdLE5RysgkcLTrD+KE9ARRjghA6vgCtB2oewQjbs/MAiFSOB9VHvfnEPSbYGLpE0zHxnHPYUs00gEh7RSi1UqSyvCG1HtKgOpdQADLj8bw6tot1pefPRp+c9pNpMYeaJiCcmxXKQw4eJ52Z1bLXPnc1NtCo7BZ4NqLUecJJuf03Y+iVWcuE7vqS7kGBbMIcvSowSfSohb0ICEZopkOekORmlP7e7/fFqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TgWe7TBvPwQzhljkwSBWMCpRRjB33IzTFrxx0cbrhs=;
 b=PPl4E5JtG8Lk3Tnu1HA2jvtXIMR1unK4/yIhm4ddE0S882lo2lD1+A/BttIUaLbUzfh5rR7IgJ0TKuj18bQtipkfeCpB5/9aYcfiXGjXxAMYq1Yo8zuctC1kuJz3C2AMwKf8jtOjaSaUMy/nPf9KPegFEZ9oIlyqQQVqFe0xgrFxh6I0RTkVtPlYFrrZPVfx70b08Cw97PSoWrDj4RfeXLT39W6r0PxQQwsJTUoJInkk3fvw0trdL1ExRcVxSW/s7DNDRFfhysn7RX0l9e3xv20AdVpSen5URKA8N8qaGHsPRq5BGZPhhC7QA9JlfmVSw3EAcu+dd8ossaOEAvr/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TgWe7TBvPwQzhljkwSBWMCpRRjB33IzTFrxx0cbrhs=;
 b=H0KaYeNDZsqUZpJihhqj0Vdw/URVJNF4uITbF/k8VNB+SHcw4jtbaACOuFya+CsBw+Kd7XPbBarNm11PI5+Fd1tOaqxGrfrgOyPVpZBgD7tHV1PXXE3r4xaxHs9Txx5cNBwGN+jfwhN4xlfBUU6zwAvDqmJY40BkgRJERxOPxReVURIx1GbURDNnevvIiaiGcfJvL9jHL+mIaO0oa1PTMAksn9V9hff/nTv7Il3hMGxAIzRxtmO8bJ79HgxnN6x3RXhQGsdD3VS1Yhxqp1taGnHn6Qu0iTmrwlZbqXKOM8obOptZPJrNmlt2MPuLObVuKfeaJF8vuDBH3Mm+VW/csw==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by BYAPR12MB4725.namprd12.prod.outlook.com (2603:10b6:a03:a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 10:29:10 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Thu, 20 Jan
 2022 10:29:10 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of
 of_*()
Thread-Topic: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of
 of_*()
Thread-Index: AQHYB77a/fG7hzWmEkq6PyblO45xR6xfhiQAgAwmIICAABDWAIAAAWvw
Date:   Thu, 20 Jan 2022 10:29:10 +0000
Message-ID: <DM5PR12MB185098D36F665AC5702D47DDC05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
 <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75VfVJo=8FPX_Pw15X5B3awFXpuEq+=LryxB6M4Ub-YJ7uA@mail.gmail.com>
In-Reply-To: <CAHp75VfVJo=8FPX_Pw15X5B3awFXpuEq+=LryxB6M4Ub-YJ7uA@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5e6e557-41a0-42aa-b0e9-08d9dbffb237
x-ms-traffictypediagnostic: BYAPR12MB4725:EE_
x-microsoft-antispam-prvs: <BYAPR12MB4725443443FF3DAF20E1BB8EC05A9@BYAPR12MB4725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tygfOUeOY0iLmcUsD6x69VEDKJ697C8bH3cbzvn4IBBVE3lXz9KGUxwa/OceR+kRso9L4oaInwurFAAO+M+Z9uiy7q9UjGhfZlwi4sS/xoIzTBh8vLCH8FuMSjkOqEqZJLLPQQaBuBZdUO7l2eRecbsQXf58xGQpgr4Nbbss8qBRbGfW2TLK6UW1UCSDxD2erWxf1GXqQeKE/bZAjvHWJVrvKpa1WOM4tv6JcTBpt+4wJp2kuf1yRnqlKsgGg/72Z3NL5jK7TeIiDjJjY48ny9XxY6uZr3Bmy3duEyWtlGRuIKPzhQV7o7ySwCEdmEml6FSnLkEYxnzKUpbVY/rT2brA0BFTYUsYQhMurrKN4LaWP+u+wBSbHrPbGeob1s1LT0v01y80GdXUOVN9QSxz2HIS064lFMeD4H0HNsDnOzXRfCxOVVhnKbq8w4YofrUyJi0Q8785v46kW//pKLU70PAP5cHzjCATuTRQu7Tr68Fd+DnuDB+aTkAn2Oz18LXQ1XBWITPOyYGk7FkVTwo+BYVTPw5JGcXDHguSNWvfxNqdcq+MaWpWrHTzPq9V6ZVrxSqZC1GACpdmJ0eWM5jLKk9M1y2SFpZ4wCJJoftRSmMCGnRVkZalQzI06Nr2hqvc5ytx8FHgAldGbiqyoeQ09D4Qmv4Z2zGAokCwFbMp7NGnaSS7shPlKD8v7oHcnjfrXOEWlFxrt8AUdY7Ydh2WjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66476007)(76116006)(55016003)(66556008)(66946007)(508600001)(7416002)(38100700002)(64756008)(5660300002)(4326008)(316002)(33656002)(86362001)(54906003)(9686003)(83380400001)(71200400001)(8936002)(122000001)(38070700005)(6506007)(186003)(7696005)(6916009)(66446008)(8676002)(52536014)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFByNXVNTlB4V0ltL2loNjBOTkhhajZmeCtGd21NSUtBb0h3SlRJRU1JajBH?=
 =?utf-8?B?YUd1YXIzSkowc0FqS3B5VGVQVWQrSHArSk15U1MvQ2NDODdaNmJna255cnBq?=
 =?utf-8?B?Y3JsRlpuNU95ZnVPRndzSjlGQ1dCczU3K1haNURNSlZqZndxSE5MYXpqWlQ4?=
 =?utf-8?B?U29Fem15Z1lHbmZPczdOZ1dDK3FrOXBqNDZqZTF5cm5LclZLNUt0cG1mRERP?=
 =?utf-8?B?SHlpM1FoNXI0cmZzVlpkSVhhc0ozR0d2ZDR4ZCtGWHVIWGlWM1Q1UzdodElh?=
 =?utf-8?B?K25zcFRCVGhGZjg5dkw4dFpjS0dLRzFNWHlQQUQ1WVNIL3dsbzdxa09icjB2?=
 =?utf-8?B?dDJVTU93bkJZbTk2QWY1amlFWlNKNkNVTDFFRElXdWgyK1ZUR01OcjZWQnJZ?=
 =?utf-8?B?dytqeWdaSTdvTE03SlNBRUtOaVBQM2NpMDl1aGpEaHFGYTJDNkJialR2WEp6?=
 =?utf-8?B?NDdJMDVNMmxBMjljamJTdzJlUTRGNlp2NzdBdlY5RWQwbWpvOEQvTkNIWUpX?=
 =?utf-8?B?bXJxQ3IrNGlHWTArUDlkR2plclcrODB5K3FDSEhYZmZvYjdpWWVPR2tqcTQr?=
 =?utf-8?B?K0FsWHd0RXJDUGI4Szh3SUxrLy9TTm9GakVvc0ViMXFHUEdSRkhSSjkvUFNx?=
 =?utf-8?B?Zy9VNnVWcU9hKzdrUkc3blFmWmNTUW12Uk90RTR6OVZyKzRFRWVseWtmb1FW?=
 =?utf-8?B?ZStmdE43THJSemdlV2R0cWRoT1BJU05RM3RobmJ2VHM4Rzl3aEdNS3dvSkVy?=
 =?utf-8?B?MHczaU4zcWU1YkNDayswZFNIbVNKOXBHMUZGT3FKSUt5MUpZbkg1MDB5S2R0?=
 =?utf-8?B?L0JwYkJqTE95aDRQK1VaRDcvWTNaVEpqNVNiZUExWndJelB0T25ma1QxeVA0?=
 =?utf-8?B?ZkRwSzBCcGZMU0dNWDYwcm9wMHBhVit5SUFPaCt2a25IemJIVWpuQUpJZ2NP?=
 =?utf-8?B?OE5IQmJWTXI1Q2NrUG9pWGN5aElBVEpBT05mc1BaUkpjVDZUVTBoeElZcVY1?=
 =?utf-8?B?L044YUxzVnpiRlJONk1BUUh4aDA3WGNFZ3EyS25DZGNaMisyaTFtaEd1UHlL?=
 =?utf-8?B?WXJ1VEFlSnZhWkhmVkZoMkxYMG4xSUR1REIvdG9jNXQrSzcrTmwrWmttZldJ?=
 =?utf-8?B?akxMM3YxLy9QL0FlVHpFV3FIaldSYXlrM1l3QVBBbmRoOGVDd3RLS0dRSEFx?=
 =?utf-8?B?aFRVenloRFhPa1FyWE93UGxYazdTckFlY0VMM3BBRGxIbFQvQkx3S2I3b2li?=
 =?utf-8?B?aVNiTEVOT3pCWTJaNjlkVWpLamRiUDg0N0pUbFNqY1doMURDU3ZZN2h1b2N3?=
 =?utf-8?B?OUNuOFpuNWsrSCsyRjBIeVEwdnczNWdDZkJiWEt4OGpad2VmN1hTQnFmRzg0?=
 =?utf-8?B?ODJrWWhsRzNwazF0Vkp3MXFlZG94UTJmNE43eVpjY0pzSzhHeG50WUJyQmNY?=
 =?utf-8?B?SDVnMEtSZ2lUMU9JR1RYMnBEZmdoNjFiMjJzZjlWSUUrdUNKaHoyY1YxVzdp?=
 =?utf-8?B?WHBteEhOZlFpWXFjQ1F0Q1NnYThYN3JtUzhvSHhyeVdWUVh4WU8yYjdkNU9W?=
 =?utf-8?B?QlZLbktnNlVyRmxGK2hxUENWTCsxS0FNOU0wK2UxOHZ1Q0s2TjhLOXBEVVhz?=
 =?utf-8?B?ZU5TMk5sQW90SmVCV2s4NDFwQUFlN0cvQjRCM0p1SzRDV0FGL3JhRnVCUFFH?=
 =?utf-8?B?UFJNVWpRZkxrVWFua3NHQUdaUmdQTVZhV0pZWllqT25rWVpHNGFJVk5DVXVM?=
 =?utf-8?B?cFJkV3pNZXhvR1N4c3Q5MEZjdCtWYTFEMTNEUy84S1BUZVVBSFpHaks3cHlY?=
 =?utf-8?B?a0NyMzg5N29oVGREZ1BSMlpRVnR1Zjd0L1dmUzloRlJobWR5ODI3MmRZeERl?=
 =?utf-8?B?WnBhNElJOUJKYVRQRitLMURJc0I0V3owRTJNWkg2QjIyQTE3WVQ2dndrRFA0?=
 =?utf-8?B?bDMxQkNYWjdMdzArYWtZRWlmaWVMZUg5Zy9sYkcrNmJ4L0t4c1ovTjd1aFFT?=
 =?utf-8?B?YWJid3A0WFU0QkJTSVlKcUQ2b1ZEMmFTaTAvd1h3OW14dk5GcXBwaUdyMlJM?=
 =?utf-8?B?eWptL2t1aStDTnUwb2luRzFNYWJpNVhtb0w1SWt2ODVKVHBzT2JidHlzUEh2?=
 =?utf-8?B?NWZYMGdSdmZiTXlPc1AvQXB6aHZJbHY0TDJYUkhqRVdFUUtPamR2Z0RRd0JG?=
 =?utf-8?Q?JMCmJSkgd9xMEsRZb44kKi8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e6e557-41a0-42aa-b0e9-08d9dbffb237
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 10:29:10.1836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8aq9yGaAH9X1DE5abT+HfGDNwNbR9fUJW1MGc5EAnSFhmlLn/f4IAaPUr7pmtfiiTuZwd1CuxmTIuOubhpezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4725
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAuLi4NCj4gDQo+ID4gPiBUaGlzIGNoYW5nZSByZXZlYWxzIHBvdGVudGlhbCBpc3N1ZToNCj4g
PiA+DQo+ID4gPiA+IC0gICAgICAgICAgICAgICBpcnEgPSBvZl9pcnFfZ2V0X2J5bmFtZShhZGFw
dGVyLT5kZXYub2Zfbm9kZSwgInNtYnVzX2FsZXJ0Iik7DQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICBpcnEgPSBkZXZpY2VfaXJxX2dldF9ieW5hbWUoYWRhcHRlci0+ZGV2LnBhcmVudCwNCj4gInNt
YnVzX2FsZXJ0Iik7DQo+ID4gPg0KPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGlycSA8PSAw
KQ0KPiA+ID4NCj4gPiA+IEkgZ3Vlc3MgdGhpcyAnPSAwJyBwYXJ0IHNob3VsZCBiZSBmaXhlZCBm
aXJzdC4NCj4gPg0KPiA+ICcwJyBpcyBhIGZhaWx1cmUgYXMgcGVyIHRoZSBkb2N1bWVudGF0aW9u
IG9mIG9mX2lycV9nZXRfYnluYW1lKCkgYXMgd2VsbCBhcw0KPiA+IG9mX2lycV9nZXQoKS4gVGhl
IGNhc2UgaXMgZGlmZmVyZW50IGZvciBhY3BpX2lycV9nZXQoKSwgYnV0IGl0IGlzIGhhbmRsZWQg
aW4NCj4gPiBmd25vZGVfaXJxX2dldCgpLiBJZiBJIHVuZGVyc3Rvb2QgaXQgcmlnaHQsIGEgcmV0
dXJuIHZhbHVlIG9mICcwJyBzaG91bGQgYmUNCj4gPiBjb25zaWRlcmVkIGEgZmFpbHVyZSBoZXJl
Lg0KPiANCj4gRGVwZW5kcy4gSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGUgb3JpZ2luYWwgY29kZSBk
b2VzIGhlcmUuIEJ1dA0KPiByZXR1cm5pbmcgYW4gZXJyb3Igb3IgMCBmcm9tIHRoaXMgZnVuY3Rp
b24gc2VlbXMgY29uZnVzaW5nIHRvIG1lLg0KPiANClRoZSBkZXNjcmlwdGlvbiBpbiBvZl9pcnFf
Z2V0KigpIHNheXMgLSANCi8qIFJldHVybjogTGludXggSVJRIG51bWJlciBvbiBzdWNjZXNzLCBv
ciAwIG9uIHRoZSBJUlEgbWFwcGluZyBmYWlsdXJlLCBvcg0KICogLUVQUk9CRV9ERUZFUiBpZiB0
aGUgSVJRIGRvbWFpbiBpcyBub3QgeWV0IGNyZWF0ZWQsIG9yIGVycm9yIGNvZGUgaW4gY2FzZQ0K
ICogb2YgYW55IG90aGVyIGZhaWx1cmUuDQogKi8NCkFzIEkgc2VlIGZyb20gdGhlIGNvZGUgb2Yg
Zndub2RlX2lycV9nZXQoKSwgd2hpY2ggaXMgdXNlZCBpbiB0aGlzIGNhc2UsIHJldHVybnMgDQpl
aXRoZXIgdGhlIHJldHVybiB2YWx1ZSBvZiBvZl9pcnFfZ2V0KCkgb3IgZXJyb3IgY29kZSBmcm9t
IGFjcGlfaXJxX2dldCgpIHdoZW4NCml0IGZhaWxzLCBvciByZXMuc3RhcnQgaWYgaXQgZGlkbid0
IGZhaWwuIEkgZ3Vlc3MsIGFueSBvZiB0aGVzZSB3b3VsZCBub3QgYmUgMCB1bmxlc3MNCnRoZXJl
IGlzIGFuIGVycm9yLg0KDQpUaGFua3MsDQpBa2hpbA0KDQogDQo=
