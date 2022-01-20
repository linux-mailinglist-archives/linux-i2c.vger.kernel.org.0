Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1B9494B0B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 10:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241875AbiATJs1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 04:48:27 -0500
Received: from mail-dm6nam08on2070.outbound.protection.outlook.com ([40.107.102.70]:15265
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233682AbiATJs1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 04:48:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib0uE0qWqPhg37qz2Qs6zJWP77waJBRYK/S8hgIzKESZumEs6f1v85VlKiidQwft/ln43Y1IDJxQksB0A1d1XPgNHl6u/23QW4b0/fKheEKMwBiDAGIePUeU0g2z65gPJFUDNzeOBaNpX6ZjsRwD8AUe9/JWIBD6pITlXltK2ssGtIPlokr8/Zwyb0h+oyIOvEF0KcCYxVC5XA5cvLnSdfk7F+Wbr5Lu7a79surBifFL5gKSRQuv1cgh2cEVgkbb7QYAYf7NGquu9kStaysZ2r57bQboKXEfCCnQqGt9faEQsk3PI59Fh/cKEKPPgaF8T3fhnlR4o+moTCdkQLH9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dowi54OZgwHPLeajJWVC7MUVuBOBjmGG+WM4Ynw2In8=;
 b=PEajxqXn5kfJ9j6RuQvqSr0WR/PaZ1kVkWyQR0PkOXKmae491WHcWNdtMxrZYxMdVEjxg3fUL1HBOYpbbi4QJClV/LzDST01Mx+gRbFYIt+59A/dC+zKtZtbuRs/1//zZJbqQ9w2s1fHpElZlsiYjcAUsGQcgOZXS0MEAOYg1KDSMzcek8LAwtZMFDc8XvqUcbvrl8DVe+CRGsjag9L0BudWUKi65NvmVmPOikNWKRLjK2D6naUOg07pxL0uLHdkilB8dGe0zlxknYka/KpXarOnBIUen7/kgWic6gn0Ty7feX+B/qx6SUE96t1XzyFwwYjLpMZytkyjKPTE8yZKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dowi54OZgwHPLeajJWVC7MUVuBOBjmGG+WM4Ynw2In8=;
 b=RdqheraNQntVSsp8+DSwv9QYqK/yRIc0nZGtef7y44fcX6TWUw19ZGgO1bIqhkgE5wOKJWTYHRXnd1+xJUhtitAvteQXSE/+o1QZsJKIZdoyETt2BJnw0dCE0BZutn89rKTEQayKdRRINn1I3a0NggTqXRO2Sk0Vdox9yY3YPY/94HN2yt03eEw6VqATSKCWyvQ+LHk7z0j1M4h4L9A2Wafw9+/3b014x66n1+IF922E4Vb5fsKr+ePQhFW1nIIm/akSqBv4VaXG5TRb85MhdZQiJ1sWOPaZ5JywK9reIHA1cwPcGtLhtf1Z+bmJuuDp2Pz5p7zZVBZ/KFwkNnOtRg==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 09:48:25 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Thu, 20 Jan
 2022 09:48:25 +0000
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
Thread-Index: AQHYB77a/fG7hzWmEkq6PyblO45xR6xfhiQAgAwmIIA=
Date:   Thu, 20 Jan 2022 09:48:24 +0000
Message-ID: <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
In-Reply-To: <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a59abbe5-6308-4251-a333-08d9dbfa00d1
x-ms-traffictypediagnostic: DM6PR12MB4249:EE_
x-microsoft-antispam-prvs: <DM6PR12MB42497F7F800A4CF30E9EB7FBC05A9@DM6PR12MB4249.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kCW+QtQ9nV41VzsgcBGa2cni17r0/zy8y/BR3ilqecW4KQWFiSwt96dxD64w3MHZm7GwdjlTqkARYLOmjzbYN71fkTv7uNizDSl8+DTVPOv1ccsVKmttVxTAqowszngUQP1sqB1ms5S89z14lYK3MtHYgDPDgEPuY6zF28XOcNu6AudnNC+xsxPbgM2MMGsEqCKCJFmvnvJQDfYaAeIUcB3+OW9GyM+b7tzzOBvlumsmkBJVLF1sRc7S67I+en2Yi1BXBlKYeBTcI5T+gSE/6LaX8UKUaXvchE1BJYsTkWLTmCM2VEli0SBPFoJ+wvvLnmSv9Eox7zAF/W6qso+7JRo4QS6ZVBMCMH2b7ilbTChKqI8j49295N0uVJ7dwe8nA3sjz/q08WmnQE52zysrnfQ5s3GYMuqEaBRLA1ohUxxVjWSb3/LaFiAkwUjQFXpqAdcWDzQ9T90DlREGhyXt1X1afB44dlyeOuqLr2x51c7TJjoprG5lvW04hh1lG0EV4Y/5T7rPC11aDhbo8E5pjE6ztUG7e2wPoBQ0R416cY9QeE9aiM88wVBpJj43wE3DUf3jjsX62JjvH3rJ4bOIoJM2se+fA5TLxFeYe160uKaWRJPufuVCM/M9kWujuyNStoeGjetCHNtDJKIDhHrW98zZZC5pI6wC4CRf3849ejCFCNCmYCfltA0bIEG1ePNjBOnnaiJoZ5Gag/9gtkQOJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(8676002)(5660300002)(38100700002)(6506007)(54906003)(86362001)(186003)(4326008)(9686003)(2906002)(55016003)(7696005)(122000001)(66476007)(71200400001)(508600001)(8936002)(66446008)(26005)(66946007)(6916009)(38070700005)(53546011)(64756008)(66556008)(76116006)(83380400001)(4744005)(316002)(33656002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnlqZnFQaGRLRjVOQmNQelVnMXd0STlQRTdrVWdsMmdyRmRtTStCbjRFMGdy?=
 =?utf-8?B?TlBXVjhmdFhPRDAwT25xdWxWOU14L0pyWXo4Qi83QlNWcUl2eGMwLzVXZFVL?=
 =?utf-8?B?MzhUMXVzSjJVbHlET2ZJalZxTWQ1K0ZDMWpGNkRsaFVEcDF6MlFuOENLSWtm?=
 =?utf-8?B?ak9aRnJCZmUxQjF2RGk4S3U5TDdUYW9WVjZEV01oTTF0bDA1ZC9Gc3FGMTlD?=
 =?utf-8?B?ay9KT0JCbXl5R3FhR2RRRi9EZ054T0FiclBSV0FoNXVGZFp1VUxJN3JpaFRV?=
 =?utf-8?B?bURPdm45VDVIWnlrOW5XdFlUMHcrdkwzeTZmdWtKOTh4NEVRWUdmS0QxSzBu?=
 =?utf-8?B?WHNCZDhzRVNvdGNKTjFRZ0Vjb2pnNEpWMEsySjRmNG9VSHJ5TXVDOThVV3ls?=
 =?utf-8?B?eGRFaURxREhDcXJqR3dtUndva1ZEc0t4KzhsK1NFOFVRbUtyZEI4V2RlYVNM?=
 =?utf-8?B?MTIxZy9pS3RhSmRaZkdGMzMxYzRnMyt1UFM4VFZYWHc2Mm9HN0dKU25ZdzFt?=
 =?utf-8?B?K3ZiMlozV3A1LzUxZkoycnBSRnl0SnpEV3BGQUc5dHVad3dRSUJFWnFGaUgr?=
 =?utf-8?B?UG9oTGg3UllteTZZcC9pVlNKMlpQTEsxbGxXdGR6UHJnNnRnVW9IVVNxVnMx?=
 =?utf-8?B?QVhrNFR2WnovYU5XOG56c1ZKbEl4WUVyL1NtYzd2RTFsMjVNZXhSSzBzZER0?=
 =?utf-8?B?Y1ZuZGJCbzRQS1J5YnFxK2N4MFB2SStabEtPT2h5L05TVmROODVCSzNKckJw?=
 =?utf-8?B?NklUZkVJWkNtV0s1eisvaS8yZ3hVSFlHNGR2TG5GQnI1ZTlGYzhjNloxdk1E?=
 =?utf-8?B?MjIwOXgwazZSRWlTOUlKU1VOaS9GNzlWOGRsbDZOSGx3QkEyaVlkZVRLSWxD?=
 =?utf-8?B?bWc2Mm5nUmF6UzhMZTc0Mk43d1BjejhrVnFNR1VHYk5kQnhLeVcrZm4rRXBR?=
 =?utf-8?B?MU9ocFpCM01Qc0ZoYTNLWHpSNU9YV09uN1NVRENuZmswSmZsaWV6MGRZWXJz?=
 =?utf-8?B?ZEgzQzA5TzFsdDROSlVGQXVPVVNXRnpyYWE5ajJDVVMzdHVybkVYOHAwMTRX?=
 =?utf-8?B?dEFaZnFwNlM4ajdCVHpCRTg4NFlHbWFzLzROYjhMc1pQM1hGekszdEQ4b01o?=
 =?utf-8?B?MVhZbzJsRVpnSzNxSWlibjdSbm9PazNhZklnR09NNk1OcCtzdnd0YXpmWWMz?=
 =?utf-8?B?M25IM1psWVZEZGhEZ1pHSVJsWUl1ZVdobDJIbTlOazltdXUveFBsMlBTNStq?=
 =?utf-8?B?NEZtYy9qMzFibTFQcTRiaXpCb3pWQy85UUViUlB2YXlmc2ZTbzRNazFFQ1Rw?=
 =?utf-8?B?K0l1c29YM1dXd0RFZDZIU0c4TGhJRDNSM3p2ZmJ2NUlNZ1ZNS2dXY05KZmdt?=
 =?utf-8?B?ZkduSFZZRzFQZWZGSnN5Rk1VdUdzY241T3pRVkkzZDlVby83VVZVS21kZ2pX?=
 =?utf-8?B?QWpuZzZIWm14QnBWeWRTaE1wdlFiY2ttRUk5ZDdWNisxTXVhbzNtY2ZSRVdO?=
 =?utf-8?B?UlRWN1Q1K2FMeWtkR05sMXJZVHorQnA0Z0EreHFJNmk3RmtlSk5TK3pSYmJ2?=
 =?utf-8?B?M2k2WVRaeGxROXpmL2c1b2tyZHRrU2RhYjI0Z1lreXlpRnBQRlVTWWVBTXZD?=
 =?utf-8?B?d2dQN1YwczlKbnhKMXJ5T01lWTVrbUJkblBrU1FRV2xlSkNHbkpxMk5GcWJo?=
 =?utf-8?B?Y005V0hqZ1lNRUQ5ekpzUzFZa0dGMXMvYnhjcTVBOEl1QmllVGVYNUI1bnpB?=
 =?utf-8?B?Y1VMeENtVFAwRTE0UEg4YVRqclpoVlZWWEdyd0RvenMzcUZyQkZnODNQcEVS?=
 =?utf-8?B?V20rWU5vVW83U1lOZUh0ckEwcndXeVIzU1Z4ck1aUDJ3Z21rbUFLKzQ2c0Jn?=
 =?utf-8?B?RDk4WkJUOWRvTGVJRmNqNmRLb1FGeEtWYjhXRTRsQkQzMUtGdDg5NkFQQkdD?=
 =?utf-8?B?ZCtHeFYzSVgrWXdDNE1lTnJ6NWRDNHU5MWQ3WUxXaytIQWpEOUMzZ0NYR0VF?=
 =?utf-8?B?UlZMZ0pmRUJpcG9UeWk4SEhqVHZ0TXhPMDVjbXhlS1plamkzRDF1c2xJNUc0?=
 =?utf-8?B?RW1waVE2RS9sTG5FOHI1TEpGaERMVmNsYmozbzJlc2NKb2hkc3FFVnlZa1Qr?=
 =?utf-8?B?YXkwMERlUmRxVnhTOC91RjlmRnBIc3JBWnR6Z1lKYnJ1MFVqd3RuZnpyUXdD?=
 =?utf-8?Q?KaHAiLPbjZRr/+KP1ez5kEE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59abbe5-6308-4251-a333-08d9dbfa00d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 09:48:25.0431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8H9bmWBvXsWC9bXffHRFv64C0jQe3LqUqRzWSQj2qZIx/c8Uo86tKmsJxhWZPZ6JOjYeaYeoL6oXrqLF2wVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiBXZWQsIEphbiAxMiwgMjAyMiBhdCA0OjE1IFBNIEFraGlsIFIgPGFraGlscmFqZWV2QG52
aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQ2hhbmdlIG9mXyooKSBmdW5jdGlvbnMgdG8gZGV2
aWNlXyooKSBmb3IgZmlybXdhcmUgYWdub3N0aWMgdXNhZ2UuDQo+ID4gVGhpcyBhbGxvd3MgdG8g
aGF2ZSBzbWJ1c19hbGVydCBpbnRlcnJ1cHQgd2l0aG91dCBhbnkgY2hhbmdlcw0KPiANCj4gdGhl
IHNtYnVzX2FsZXJ0DQo+IA0KPiA+IGluIHRoZSBjb250cm9sbGVyIGRyaXZlcnMgdXNpbmcgQUNQ
SSB0YWJsZS4NCj4gDQo+IHRoZSBBQ1BJDQo+IA0KPiAuLi4NCj4gDQo+IFRoaXMgY2hhbmdlIHJl
dmVhbHMgcG90ZW50aWFsIGlzc3VlOg0KPiANCj4gPiAtICAgICAgICAgICAgICAgaXJxID0gb2Zf
aXJxX2dldF9ieW5hbWUoYWRhcHRlci0+ZGV2Lm9mX25vZGUsICJzbWJ1c19hbGVydCIpOw0KPiA+
ICsgICAgICAgICAgICAgICBpcnEgPSBkZXZpY2VfaXJxX2dldF9ieW5hbWUoYWRhcHRlci0+ZGV2
LnBhcmVudCwgInNtYnVzX2FsZXJ0Iik7DQo+IA0KPiA+ICAgICAgICAgICAgICAgICBpZiAoaXJx
IDw9IDApDQo+IA0KPiBJIGd1ZXNzIHRoaXMgJz0gMCcgcGFydCBzaG91bGQgYmUgZml4ZWQgZmly
c3QuDQoNCicwJyBpcyBhIGZhaWx1cmUgYXMgcGVyIHRoZSBkb2N1bWVudGF0aW9uIG9mIG9mX2ly
cV9nZXRfYnluYW1lKCkgYXMgd2VsbCBhcw0Kb2ZfaXJxX2dldCgpLiBUaGUgY2FzZSBpcyBkaWZm
ZXJlbnQgZm9yIGFjcGlfaXJxX2dldCgpLCBidXQgaXQgaXMgaGFuZGxlZCBpbg0KZndub2RlX2ly
cV9nZXQoKS4gSWYgSSB1bmRlcnN0b29kIGl0IHJpZ2h0LCBhIHJldHVybiB2YWx1ZSBvZiAnMCcg
c2hvdWxkIGJlIA0KY29uc2lkZXJlZCBhIGZhaWx1cmUgaGVyZS4NCg0KVGhhbmtzLA0KQWtoaWwN
Cg==
