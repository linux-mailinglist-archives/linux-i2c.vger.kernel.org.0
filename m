Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358D64776FF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 17:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhLPQI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 11:08:29 -0500
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com ([40.107.93.52]:26113
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235546AbhLPQI3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 11:08:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5xRvUc8KOZDV0Q0A4v+gzxZy73+7gXhZjzzae7rgjMpGBp+A28HpRcpV3plsEjNUwmkFY2YSh8Ib5TwM3LgsKEu4Y19YAW/8gO2UyGyBTKbLa15d3woTmnVJjmdNKvtdpRw0R5DWYAMn9bts/YbCvxC9eCB7ht5cILX+edkM8VKWiERaI3jrbAuq7pLiTTV/ZO1S2iWQFYTpgPHcwtaPzUvpjnemKcftsRWkHMwqqGoZ712WhPgZMG4qPfkq14GtJ3lgt6fKF/AO+nDfpgOWu0u6Dc9wAL12u2SdX6RA6/FthfImBXksSzIw5lEyiUgvjrzuwTXp/r0qt3ky5a8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6vT6Iz0dIXGB+syG0bWYDzxDlVnYOhszyfYVZfZBMs=;
 b=YM20stnw9Hb6sYTcen4RTSaGNbjKBF7mO2tI8eT293Qts4Iob2c3ny/WogFEhY2mrAxSJujhGuHWR2RsspVXBXetjP/cUtDFj9ugL7ZpZ1Gp+iuFgHelWg1LjcCDYIOq+KLQ8t7voLk+0suVwthoT74Fx80FYdZd6zTCKhj7RPsloz58IR+SuGB7nfP7lnmEGH48+kOJ1aqzNSvsnrWJaEdCw2yom29WBbmWY7+0DACHtvfH64dOj7RG2k7KCFwD+qgZiLyqVCFMnlRtWyz2UzA2spE2duoTs6U5Mf/hHxDx3rArPl7ABNXanWEF09M9nofGboBqA3lFiIs4CqYMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6vT6Iz0dIXGB+syG0bWYDzxDlVnYOhszyfYVZfZBMs=;
 b=axNu811O7KpZNAXza9FymnrQIfeGRNIgakwm4LCvA2VEyVOW50zVSD8veo8zWJPdKAPuV/mo/qdKq/TO8TFBQPxuUqLWiRe9nvuQOgorj8juBWZk4uBAREZ7otKgx9YhOg6xTy+iE4399t/a28t9Njul1A4X2WDsPUMfR0TZEFE8FBMTq7e99w7oHtza3FCy8IINI4/dNAWXeWMDl967tpALA5pQPc9CCH7+HxxeCtlaS/arwfqoC1DW6GA4j7LNWcdKpznR6irS//z9ZiDMXnBvrC14BeVOZzK9KovHCl7TG8twxHz89ya0rCdUDaxLWdKfWJGdynBGUiQvcGcmRg==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5082.namprd12.prod.outlook.com (2603:10b6:408:133::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 16:08:27 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::6867:d54e:5040:2167]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::6867:d54e:5040:2167%5]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 16:08:27 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: RE: [PATCH 2/2] i2c: smbus: Use device_ functions instead of of_
Thread-Topic: [PATCH 2/2] i2c: smbus: Use device_ functions instead of of_
Thread-Index: AQHX8n7my/abMo8OBEe71trFCBr2/aw1NiAAgAAG55A=
Date:   Thu, 16 Dec 2021 16:08:27 +0000
Message-ID: <BN9PR12MB52732B801C0D15BBBA71B8DDC0779@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
 <1639660402-31207-3-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VcvrM0qLQE-04UZEkxbAvkE-MNSN7RGC7mPxj+1hoUyTw@mail.gmail.com>
In-Reply-To: <CAHp75VcvrM0qLQE-04UZEkxbAvkE-MNSN7RGC7mPxj+1hoUyTw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7209adfe-f317-4314-e951-08d9c0ae4b80
x-ms-traffictypediagnostic: BN9PR12MB5082:EE_
x-microsoft-antispam-prvs: <BN9PR12MB50825D71A689A8E6E3C1972EC0779@BN9PR12MB5082.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wENDPHpsaIQ8QRwDnfwCHAMYfGJ0I23VyS/Dq60ymdN3D+0/bgctsCxUpElXXB+5Fk5E1QW8ta0jZ14fjbX1X/Fv4TOofNfyvKm86P5Sasu7x3N43LLyB6KkBozZo0C105U+Ph5hkk3i2+Y+14AnXr5dAkk9jx8USAOaabz+JHB2pRTla6d6UzgVkbT1eBM2MPA0rMHmvdnej7yreL9UvMags31Z5VP3VmAezo4O6+nMIUJTcc0kgIRZ67juV9VynG0tk+1kXkxyn6K1luGJO5td5OaEzBe+6w4zl7bKQUkYaK6/gPucK3qqIG6jXQg+k5NaYu3dSbIQQ4MSxacy/8JkdPBUUeabnTNtEmweK1BGUvVaVtFRBTmjq5vIKZDuhM4L3L44On7SrBYQskNgv20UqbfnE2V7tOjBrAm0lFt6mqj42VTs9SrU6o3ZgbJr9kc4nBPhLAY2fDWJCXQsf4ReoERrQF0pF2gxb0mxj7pk28vNetQyllAAxWTXlwZ1An6LRtPLV273P8Y8iZMJtzha3SYQdOVfarfHz9NQI9v2gN+s6dJpVz7L8KsJSbRkvdOjK5UQXMUqmg/+FPYuzIuBNu22g6EvBgDh4qUxTko6tHkYJsHmqEKPLL9Xb0st4ZKlPj/9sn2fpnP82veAR65Diov9QoaSJoKyszYtNl8agRU77IJ0ehMubDUwS0ffGbwUc4jLnnACtzysMz4ntQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(52536014)(8676002)(7696005)(33656002)(4326008)(6506007)(76116006)(107886003)(38070700005)(71200400001)(122000001)(53546011)(26005)(2906002)(55236004)(8936002)(86362001)(66446008)(55016003)(6916009)(9686003)(66476007)(64756008)(66556008)(38100700002)(7416002)(5660300002)(508600001)(66946007)(83380400001)(54906003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzBOcTRyNTFqQ1Q4NTEyUEdNTjExNitRek1EYzJka3ZrQjRmQlVEVGRkWXh1?=
 =?utf-8?B?WDdRblBxMWt1T1V6Q2pDOTJMemduYXFXdFl3MlpkUFlHbDdhb0ZHOEdoN0c3?=
 =?utf-8?B?WjdLcWlkdElzdzBGSTluREEva1BzcTdOWFFGZDhiYTJteHA5N29HaGRvckNt?=
 =?utf-8?B?ZU4yY0RtN2Zpb2F2QkIrSHU0OTJhN1ZxY2gwMXhwazlyYzQ1OUViYTcxdzZ2?=
 =?utf-8?B?b1NkdWxYQzZ1aXRVdUM3SW50b2Faa2JqeEY4N1MvbTRDR2tNSGt3ZFBsa2U4?=
 =?utf-8?B?WTQyQnk1blU3SGxJVmRYNzZnc1Uram1WenhFeWJOdlprYmhYVXEwK29SUEhZ?=
 =?utf-8?B?a3ZJYkMvalAvdE80SE1JQmMzdnVjZ0NtTVZjYnBTSlhkUWhUMThxTVJad1FZ?=
 =?utf-8?B?VGFYZ1BWQkU3VEgxby9leTZuN3gwWHBxUC9SSTBZUzFxMjlGS1ovZnpkMmhi?=
 =?utf-8?B?NFdmbGRSeGJURklVTzMzSUhMYnlMZm5Fb2ZkMnBDZnN2WXkvMkozSFVWT05M?=
 =?utf-8?B?VFBVQXFWeE1WNWdJbVpLQWtvZk5wdUlTYklKVm43UGV5eDhoV1h5TTAxc1JO?=
 =?utf-8?B?SHdDbXpUMmJXUHRnbTlMd1JHclNpWmtJbG9rWlcvaThwVTI5V0FKbFJNRG9h?=
 =?utf-8?B?d2hIbTZINWE5WFROdzlra3N6QjRRYmlMdjhuRjJZcVhONGsxVUtnMnI4QzJO?=
 =?utf-8?B?aUs1L0habXR2eXRLa1RFQjI5UDdKL0VLNDJUQVBxd1E5NUN2Z3BTdWZEbWl2?=
 =?utf-8?B?TEtJKzFtWjU5T0RDUWxFRU95OE1NWkU0c3lncW4zRVVwVGJwUm9DMEhqRFVm?=
 =?utf-8?B?V2lMREJGc3o0V1AveVB1ekYyNVhlQ0VKL0YvWU5sNWZVU0tKako5VmdHSzhN?=
 =?utf-8?B?alk2NmwwbTNsdWVHUVlib1laNEtscm9RbjBQOHYxOTJFWWx4eHJpWUI3ZmFO?=
 =?utf-8?B?dWxsQ295bFRabnc3ajNEME8zbkg5S21RVzZvWlZrNnNkQUpTWWNvakVqaVNT?=
 =?utf-8?B?MTFqc0Zxbms4eU5BK2o3NkUrZ053dE1GMWFabWpoY2MzTEtUQkFyb3Vtc2s3?=
 =?utf-8?B?NDNNUzFoZzRUb2c1dmFudXI3TlNZVW9pL0FHZnpreUNSR09QVXNzdjlESUo4?=
 =?utf-8?B?b0NaTzR2Y2p1cGoza1BVRnhkME9mTmlqNFR2NkkyM3VpQzM2ZUFzSjhvNDdE?=
 =?utf-8?B?M1paT1FtODFvTWNqUFFQZVJ5MEoyaXpzbWFHZzVyaG55cjdXOWtnSDV3N21v?=
 =?utf-8?B?cFBhbFl4ZVphVTdmRjVidG95SHZWMStWS2dHQ01oai9tOFJLakJxclVjZ3VV?=
 =?utf-8?B?NmFXTEtseVk3U2tNQUFOWHRJbXErclhTU3pleEkvdHcxZ095V29menpTSFli?=
 =?utf-8?B?aStuSmE1eFJLZ0h3Rmd0a3FFUWZ0WWkzbWJISlM4RHl6bEFLWVBmUVJpM290?=
 =?utf-8?B?SWxFTHVjQTBLNUpzSVNEbElSaTFGMjNzY3R3MFlwR282SEp6dFRUOGY2blg2?=
 =?utf-8?B?SnhXWG1nU3IxS1N5c1dsM3hyOHBJQkV4WG1RaGl4TzQ2dFViZnFGYklqc1I0?=
 =?utf-8?B?c0RaQnBSLzlVZXZWUVZjcWdVOVpVNXdaOFBXUkVjNlNSTDVTLzk5YnNWNTI0?=
 =?utf-8?B?UElhNjkxNEJPQmlESEU4UE9GRkVJa2tzMzNydi9ZQTBSVVAzOWdhMUErbWhP?=
 =?utf-8?B?ZzR0Yi9vY3F4RmxVUUJUaDB1SHplRWV2MWNScEdpTStuL2V2SlMrVnBteG81?=
 =?utf-8?B?cDRXaDladjBCd2NLWjZZRjB5YzF5RDE4Y3ExZHpGeDhtMmxOUjdyZHZ1M0NE?=
 =?utf-8?B?WGJWbFhoaTd3VWh3SUtGYWpwOFJVNGsxVndSSU1sUzlOZ1JQOGh1N2ZVTDZs?=
 =?utf-8?B?dE56clBJZFYyRU54SW5zQkZDdlVHVGRxUGdqMGpFR3pYRFJtS016SmwwbGNJ?=
 =?utf-8?B?UlZZQmc2Z2I2emdsZW5pNysyQ0JvNks1b2lJOTZvU2pBVHYzSzNySjQ2elpC?=
 =?utf-8?B?V2NGUTZuV0JDWE9CeEFjV1Y2b3BjZjNaenlobUFuQWlNTEJYYnNJVmlTaTdp?=
 =?utf-8?B?V3BNMGEzdzNOSlE2QklkdWExeFRoNFZQaWp2S216ZGdkV2tSVkF4N3ZHWkZi?=
 =?utf-8?B?aE9rVy9XMmRVbTRRVy82MFJ6MW1sdTFoS2V1THZ0WldkTU1Fc1QrY1FEQ28w?=
 =?utf-8?Q?LaIRFz1YEiQX1RxEHgYeY+U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7209adfe-f317-4314-e951-08d9c0ae4b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 16:08:27.1499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9D66grxnvUJbavmGiFtN1BPXa19g50UbHO4FBq8j80Sa0GS785sJEyYvPmuP+v0NKZl9dt8NAb2utqvJtEU1sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5082
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiBUaHUsIERlYyAxNiwgMjAyMSBhdCAzOjE0IFBNIEFraGlsIFIgPGFraGlscmFqZWV2QG52
aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQ2hhbmdlIG9mXyBmdW5jdGlvbnMgdG8gZGV2aWNl
XyBmb3IgZmlybXdhcmUgYWdub3N0aWMgdXNhZ2UuDQo+IA0KPiBvZl8qKCkNCj4gZGV2aWNlXyoo
KQ0KPiANCj4gPiBUaGlzIGFsbG93cyB0byBoYXZlIHNtYnVzX2FsZXJ0IGludGVycnVwdCB3aXRo
b3V0IGFueSBjaGFuZ2VzIGluIHRoZQ0KPiA+IGNvbnRyb2xsZXIgZHJpdmVycyB1c2luZyBBQ1BJ
IHRhYmxlLg0KPiANCj4gLi4uDQo+IA0KPiA+IC0gICAgICAgaXJxID0gb2ZfcHJvcGVydHlfbWF0
Y2hfc3RyaW5nKGFkYXB0ZXItPmRldi5vZl9ub2RlLCAiaW50ZXJydXB0LQ0KPiBuYW1lcyIsDQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNtYnVzX2FsZXJ0Iik7
DQo+ID4gKyAgICAgICBpcnEgPSBkZXZpY2VfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKGFkYXB0ZXIt
PmRldi5wYXJlbnQsICJpbnRlcnJ1cHQtDQo+IG5hbWVzIiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInNtYnVzX2FsZXJ0Iik7DQo+IA0KPiBIbW0uLi4g
QWRhcHRlciBkZXZpY2Ugbm9kZSBpcyBub3QgdGhlIHNhbWUgYXMgdGhlIG5vZGUgZm9yIGl0cyBw
YXJlbnQuDQo+IERvIHlvdSBoYXZlIHNvbWUgY29kZSB0aGF0IHByb3BhZ2F0ZXMgb2Zfbm9kZSBm
cm9tIHBhcmVudCB0byBjaGlsZD8NCkFkYXB0ZXIgZGV2aWNlIGRvZXMgbm90IGhhdmUgYW4gb2Zf
bm9kZSB1bmxlc3MgdGhlIGFkYXB0ZXIgZHJpdmVyDQpzZXRzIGl0LCBJIGd1ZXNzLiBJIHNlZSBh
bGwgdGhlIGFkYXB0ZXIgZHJpdmVycyBhZGQgdGhlIG9mX25vZGUgYW5kIA0KcGFyZW50IGZvciBh
ZGFwdGVyLiBBbHNvLCB0aGVyZSBhcmUgbWFueSBwbGFjZXMgaW4gaTJjLWNvcmUtYmFzZSBhbmQg
DQppMmMtY29yZS1hY3BpIHdoZXJlIGFkYXB0ZXItPmRldi5wYXJlbnQgaXMgcmVmZXJyZWQgdG8g
YXMgdGhlIGFkYXB0ZXIgDQpkcml2ZXIgZGV2aWNlLg0KDQpCYXNpY2FsbHksIGFkYXB0ZXItPmRl
di5wYXJlbnQgYW5kIGFkYXB0ZXItPmRldi5vZl9ub2RlIHdvdWxkIA0KdWx0aW1hdGVseSByZWZl
ciB0byB0aGUgc2FtZSBkZXZpY2UgKG9yIHRoZSBvZl9ub2RlIG9mIHRoYXQgZGV2aWNlKSwgDQph
cyBmYXIgYXMgSSB1bmRlcnN0YW5kLg0KPiANCj4gSS5vLncuIEkgd291bGQgZXhwZWN0IHRvIHNl
ZQ0KPiANCj4gICAgICAgIGlycSA9IGRldmljZV9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoJmFkYXB0
ZXItPmRldiwgImludGVycnVwdC1uYW1lcyIsDQo+IA0KPiBoZXJlLg0KSXQgd291bGQgdGhlbiBy
ZXF1aXJlIGFkZGluZyB0aGUgZndfbm9kZSBhcyB3ZWxsIGZyb20gdGhlIGFkYXB0ZXIgZHJpdmVy
Lg0KSSBmZWx0IGl0IG1hZGUgbW9yZSBzZW5zZSB0byByZWZlciBhZGFwdGVyLT5kZXYucGFyZW50
IGhlcmUgYXMgbW9zdCBvZiB0aGUNCihvciByYXRoZXIgYWxsIG9mIHRoZSkgYWRhcHRlciBkcml2
ZXJzIGFscmVhZHkgc2V0cyBpdC4NCj4gDQo+ID4gICAgICAgICBpZiAoaXJxID09IC1FSU5WQUwg
fHwgaXJxID09IC1FTk9EQVRBKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiAg
ICAgICAgIGVsc2UgaWYgKGlycSA8IDApDQo+IA0KPiBUQkggdGhlIGVudGlyZSBjb2RlIHNtZWxs
cy4gIkludGVyZXN0aW5nIiB3YXkgb2YgZ2V0dGluZyBhbiBvcHRpb25hbCBuYW1lZA0KPiBpbnRl
cnJ1cHQuDQpJIGZlbHQgaXQgdXNlZnVsIHRvIGhhdmUgaXQgdGhpcyB3YXkgYXMgaXQgd291bGQg
cmVtYWluIGFnbm9zdGljIHRvIGRldmljZSB0cmVlIGFuZCANCnRoZSBBQ1BJLiBXZSB3b3VsZCBu
b3QgaGF2ZSB0byBhZGQgcmVkdW5kYW50IGNvZGVzIGluIGFkYXB0ZXIgZHJpdmVycyB0aGF0DQph
cmUgdXNpbmcgQUNQSSB0YWJsZS4NCg0KTmFtZWQgaW50ZXJydXB0cyBmb3IgdGhlIEFDUEkgYXMg
d2VsbCwgSSBmZWVsIHdvdWxkIGJlIGEgdXNlZnVsIGFkZGl0aW9uIHRoYXQgY2FuDQpwcm92ZSB0
byBiZSBvZiB2YWx1ZSBtb3JlIHRoYW4gdGhpcyBjaGFuZ2U7IEkgYmVsaWV2ZS4NCg0KVGhhbmtz
LA0KQWtoaWwNCg==
