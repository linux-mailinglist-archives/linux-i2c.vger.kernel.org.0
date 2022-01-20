Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C806494CFC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbiATLaO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:30:14 -0500
Received: from mail-co1nam11on2079.outbound.protection.outlook.com ([40.107.220.79]:6368
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231256AbiATLaK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 06:30:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ1qs23P8O7NWBSlb57kJPjOJ+AcksfjiokOMkBg7NbOFixA3us46VerAW6/14zwWGnrpMsTBUGBbzZogNJ1fRNx4L3n8Wq1TPXtI30Y0aoXZ/VzRVZiRFYTv69ZEUSd75zPTczARHIld6YRY0ihEg2h6x826+mU/2pxllYwl4P8fs9YBNJJfI28yWK1rPbVwx2pN1YtDQSiF5RocvcHsQSaKLIpRZAUwlI9lj2F3j9LZwRDES6eAX0L1N3Y17Ftk15YIAYgRcCbS1iBiRcAEy2S5kPk2zlJWAFmqsVKXQpw3BQGYSY2ce5hG3+6vmbkmPwtTgYZglZjJw99iraHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqqpVql52leKi/3YcDdZrEfaWhnAkgvPwrzVzXxzdxQ=;
 b=Gpb/gheDEzgDf5y40j+iu0yzFcfpxQ/Iw55/GWMBtpn/Np9CxvLNM7mMq+M7+01vOPmS6zNxHayMSzRxewXoiK/g3st4z6ma2G2anDpfhj8EWTqyN/JAirayH3hERXdZBTuketCJxiI3jcbY4i0YfWc3DpkM6CMwZ4L0/unbLLsvfBdVu9DTIORNPZeYNzYtG3Doocq29unctXkPrXU7OBfColADIiszlxd4zSeZNmoeDiXT+U6xCBtTk6/N/fZwKgnDHd10i+gQSKFkvKNQVkWvKX8Cjt0xdK0Zc8kuHWUYaY8VwiB3Px+mIpgEr1mz7JivmhLU3pcYilTddu+GOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqqpVql52leKi/3YcDdZrEfaWhnAkgvPwrzVzXxzdxQ=;
 b=aNnYus16ZMJBMVibCxqhrvMVcVcjZUQw9pPCPf03pdyUqX40u5PMlo4BVM0VUZYMAdkLuJoZqkOJkNfRQ/n0fQlpPaOvwvN2gCMFA3hOZNxsDFGWv+xB+ZOEZsgnatVWyUoY4R6SYA73iMBnuJsdmSw0mmkuBBTP19E7vzzQRkwFWM2YEHGiYjC4SluvkfzAPxyASU7ZBAd+Y3Gbi3mYvHw31d/6Wiqg6rXRlMgiuwPsngkfEGpskENihNI8lwQdKVR+xt4HFFA8hp1xII9YhX1Tg7Q3BY9KrsELZhyPL1oKEvQYe/MWdkGOqAy64oTuJmPuQbiL8FEHZ5bkI5i3CA==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by BN6PR12MB1795.namprd12.prod.outlook.com (2603:10b6:404:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 11:30:08 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Thu, 20 Jan
 2022 11:30:08 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
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
Thread-Index: AQHYB77a/fG7hzWmEkq6PyblO45xR6xfhiQAgAwmIICAABDWAIAAAWvwgAAG/ACAAAmtUA==
Date:   Thu, 20 Jan 2022 11:30:08 +0000
Message-ID: <DM5PR12MB1850B893A94623B610ED4552C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
 <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75VfVJo=8FPX_Pw15X5B3awFXpuEq+=LryxB6M4Ub-YJ7uA@mail.gmail.com>
 <DM5PR12MB185098D36F665AC5702D47DDC05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75VfVt0b+rBTfvTTj4-M11DrM2EGdqb4NNNTq0ApvR+gpDg@mail.gmail.com>
In-Reply-To: <CAHp75VfVt0b+rBTfvTTj4-M11DrM2EGdqb4NNNTq0ApvR+gpDg@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1660ad9a-3259-4c1f-47a8-08d9dc083677
x-ms-traffictypediagnostic: BN6PR12MB1795:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1795FEEFB4121FC1243613B5C05A9@BN6PR12MB1795.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hzrzlUZYTps4h5QTqxb84onjA6LpGj6ohK5QyUdPbgAjjnDzIKmv8sUx8Nn9MqDIpHWeBwJ3gYaevZ+XBSIq8kK7wpUYvL4U0jzRc0vLzj7+NljcOn6jviWujDXasymIcd1LujSD/BWgrKvy7/b7kEzvpX5K4P1ptfh9Fcu/Xw9ODn2dyAn9hpEMNqDnIkFCQbxFsprJ/dXxJAP0wTDb2fZ2+FzudZ2Dc8ABbuwSL/5h8SRvgTZHum3ud0k8rgZNtvBVe9Z7HlFmrcAAJZZByC1jF3XrvwNlkQShs5wthNyAZ56Oi7yoNQ5H5nS91gFGbCOf/OhmM8CFQ8xjaozcv+yfST/Y0ea57dnNkRI6AnxaddbrfzG40RQiYZTrR3gI1vt2uDg6pRBc+Jnat/2ByaeTw+YXtVnAWyA2VuvWZTz9GfobLk5KCz5G4j//82c/R9gfek0B4Bo0/o076Qe5cOmur2xOFM/stBxcZ4a4ppCMi2eKtuZPY7qFYU4VEgn1cXrCOtnRgOX9/joRZS0s60cAbVrJy8SagkRs0AYBKlnDv5G79O0ekB/QmbmOnpMn2lxau++XHpYJyrWjKIDT0WjlJBe2NOOIq6TUdOWsRcCBTEeJLFFGWeY7VLE9nIJhPN1t1zG+tRSSwnrIgpB0b+4QumSSnhM5eniHQ0k/xgcNGLe/UHQiPelsw/LedggZu05PxOkkqftX05aMYds0Ag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(38070700005)(52536014)(83380400001)(55016003)(33656002)(5660300002)(71200400001)(9686003)(8676002)(8936002)(26005)(186003)(66476007)(66556008)(66946007)(76116006)(64756008)(66446008)(6506007)(4326008)(86362001)(7696005)(508600001)(122000001)(316002)(110136005)(54906003)(38100700002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M040ZnRhV1BxZEZEV24xMENwRjlXaEJxQURCUW02cHhwNkVWNG9uK1hmUUdO?=
 =?utf-8?B?VnYyRjEwVThOaDZNNG9ueEJZSjluOEZuVXMrd2ZINUJ5dHBjaXRrZEZjRFQ1?=
 =?utf-8?B?VExESnMwUitrU0I3TENaRW82eU80VFlxUm9IRW5rblVQbjVYVHhBUlRzTVlx?=
 =?utf-8?B?OXBydm1XdEtqQjNSdE5wM1M5SVM1Q1d0WCtYZmNNcTVGbGczb0gvSjVUdFNh?=
 =?utf-8?B?dWV5Ums5bXM2L3oyVW1jcGkxVGVUSmo2THRTZ3hFa0k3VUJXbjY4eFgrL0F3?=
 =?utf-8?B?eXdSb3dWMW4wa1d2N1JQSFZRUG5tUGp4U1VlbVZ0d083a1llQ1ZQUlZSRWdX?=
 =?utf-8?B?WUs2M05POS84ZGs2YzkxZDBFKzFBdWFqeXZyV01Pd3dNVnJWUGxuODhDRFZH?=
 =?utf-8?B?NUMrczVyTlpnUEdWNGptVFF4Z1owR2p6NWVmOSt6bTJxc0RrWm1Yd2h4a0Jl?=
 =?utf-8?B?bktGVnVTK3BxYVlsRmV5bTNhMFlDWHNkRFl6cWYxM2N6NVprSlBHU0dqdVJq?=
 =?utf-8?B?N2xDNHNCS2pYc3lOK0ROMXFRMlpvSHUrZVVnVHF4elljc0NHMlBJQWczSHdt?=
 =?utf-8?B?U3JUN1VXc0VnZHlMdUNuUDJ5dXRmS0x1RXI5L0E3bnMvK1Y0ZFlEc1VXZWsr?=
 =?utf-8?B?ZndmTHFFYXAxbm9Qd1d3TTgwQnRraGkyaWN4SXFNMjRFSDhpTEVlL1ZRUmRK?=
 =?utf-8?B?VkNFWkI5ZmRLNnM5QWdOQTFYVHNkVzR0MGc2KzJyaFIzTFFNSWlQcDJHSXlI?=
 =?utf-8?B?NGRWVy9TZHhuWS9sVDVhZnB0bnpBVHQwNE9oUDkzMERBeDhZUXRVT1U1WTJZ?=
 =?utf-8?B?UjNUSExHVklYNm5ab3JYZ2dJTWE1amZydFozdjlJK0I3L1hQZDRNL0ppelNU?=
 =?utf-8?B?ZGFpdFdybzlpdjFFTWFrU3R0UnpVNmFnblF0OWxMUG96L3Y5TXd4bnFZY3oz?=
 =?utf-8?B?ekc5WWlhRkJaSHNiWi9QcUNYb0lSeVUvZTRXR21wWDEzdVNlb016QnUzWGV5?=
 =?utf-8?B?VmJvVS9nQTlrMnpsSTgyZ29OM1A0cDg5RWh3aUVSOEt1QjVITmgzOTF4UUxE?=
 =?utf-8?B?SUZpb1NYU0V2QnhYMSsxS1JSNy95OWlBTUFmOW4rQ2ZnYllYdzZ4cXpRTkdj?=
 =?utf-8?B?Sm9EQ2RQL21ZbEpkeTJZdnBuYnlJaTVBY05iL2FFN3dDeXhmUGxNcGxiajJq?=
 =?utf-8?B?bDc2NE5WeUVOeTVSOGowdktKNU5ldlhSNFJqOVJHNXRHRGtVOGtBaUpEaUc0?=
 =?utf-8?B?YjVEckpJNGdGZlNwTE83bGVkbWxJMklBbU4rSDhCajRTUXNNOWFJaHRmVExj?=
 =?utf-8?B?TmtmQ290eGFYcm9RblduYXhXcitxSWV0UWEwZ3JCRnFXLzQyWmwyaFBRRXow?=
 =?utf-8?B?WDRLaWZjWmxNc3NzdjV5RzdaZE5vMVg5SDhXdE9JWk5tUnhHYmlQcG1makJp?=
 =?utf-8?B?K2NadHJCa2ZwcFlBVjUwdUhORUMzMUVwSTNEaEVabFF5OWNOaWk1YWxseUxU?=
 =?utf-8?B?OHJpOFFSRjEwK1JmRmNVbVJwa1hGOUpmQWR1V3VvR2RFOWJiVDRCdlM4ZDRw?=
 =?utf-8?B?NnJYL1BSWXIyMGh4eDVxOE5DOEowZFgxRERZSnV5bytnNitBeXpYY1JuTEdK?=
 =?utf-8?B?VDQ2VGRUNW1iN2c0OWd0VXRNZCtmSWNvMi9ibnhleUxJRkIzUHpMalYxTzEv?=
 =?utf-8?B?RWE0VjVPeFNlT2tyOUZtWWU0UktRWGtiVXRxRFFEeTJ3Y2Q4U25Db292aGRB?=
 =?utf-8?B?Q2R5bStpcGRndDBmVTY0Q0RiZS9zTGYzT3l6RXo4aEdqVy8xM2IwRTZ4VHc4?=
 =?utf-8?B?Yk1GdHNwbE45TWxQRGRzRWxWQ1ZqYzJ3QTRZMVdsclArT3F1RTNmeUtUVGVS?=
 =?utf-8?B?Rkk2WDZOdzlwVzFCNDJ4U2JOeWhKUS9mZVRIbUVqZmlOcmdSUlAvRE1DNEs4?=
 =?utf-8?B?ODRFMU56Nk5pd3QrVGRxaS90TllpU0VHM2Rnc3k2cmV2d3pWT1M0ZThJQVZh?=
 =?utf-8?B?bWExeVhxaUE1NXlydi9OdEZDeXFxekNHMmdTVk54Qlp1NzhmZ1hsNzBMVUhS?=
 =?utf-8?B?RnJPTWxNZnltbzRjZnUybmJhVnNlTzIvNWZ2Zm1LUldYcFRMeU9YejFORWlt?=
 =?utf-8?B?UDhXSXYvQU83R01sd3V5Tkh4QnFMSVN2UWZDQkdVbDBVRitMbTFLL0N3NlhD?=
 =?utf-8?Q?FKlZg8/xWqfGS4F0XwiobJ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1660ad9a-3259-4c1f-47a8-08d9dc083677
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 11:30:08.0334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDUYIy59X90F7oVYiW6uU7ewPA2RYcuIzxlixECsR05+iGUzV8WeqC2H46WXp6CzC7H7pgRAwxCcXh7EPcOfnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1795
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ID4gLi4uDQo+ID4gPg0KPiA+ID4gPiA+IFRoaXMgY2hhbmdlIHJldmVhbHMgcG90ZW50aWFs
IGlzc3VlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgaXJxID0gb2Zf
aXJxX2dldF9ieW5hbWUoYWRhcHRlci0+ZGV2Lm9mX25vZGUsDQo+ICJzbWJ1c19hbGVydCIpOw0K
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlycSA9DQo+ID4gPiA+ID4gPiArIGRldmljZV9p
cnFfZ2V0X2J5bmFtZShhZGFwdGVyLT5kZXYucGFyZW50LA0KPiA+ID4gInNtYnVzX2FsZXJ0Iik7
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAoaXJxIDw9IDApDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBJIGd1ZXNzIHRoaXMgJz0gMCcgcGFydCBzaG91bGQgYmUgZml4
ZWQgZmlyc3QuDQo+ID4gPiA+DQo+ID4gPiA+ICcwJyBpcyBhIGZhaWx1cmUgYXMgcGVyIHRoZSBk
b2N1bWVudGF0aW9uIG9mIG9mX2lycV9nZXRfYnluYW1lKCkNCj4gPiA+ID4gYXMgd2VsbCBhcyBv
Zl9pcnFfZ2V0KCkuIFRoZSBjYXNlIGlzIGRpZmZlcmVudCBmb3IgYWNwaV9pcnFfZ2V0KCksDQo+
ID4gPiA+IGJ1dCBpdCBpcyBoYW5kbGVkIGluIGZ3bm9kZV9pcnFfZ2V0KCkuIElmIEkgdW5kZXJz
dG9vZCBpdCByaWdodCwgYQ0KPiA+ID4gPiByZXR1cm4gdmFsdWUgb2YgJzAnIHNob3VsZCBiZSBj
b25zaWRlcmVkIGEgZmFpbHVyZSBoZXJlLg0KPiA+ID4NCj4gPiA+IERlcGVuZHMuIEkgaGF2ZSBu
byBpZGVhIHdoYXQgdGhlIG9yaWdpbmFsIGNvZGUgZG9lcyBoZXJlLiBCdXQNCj4gPiA+IHJldHVy
bmluZyBhbiBlcnJvciBvciAwIGZyb20gdGhpcyBmdW5jdGlvbiBzZWVtcyBjb25mdXNpbmcgdG8g
bWUuDQo+ID4gPg0KPiA+IFRoZSBkZXNjcmlwdGlvbiBpbiBvZl9pcnFfZ2V0KigpIHNheXMgLQ0K
PiA+IC8qIFJldHVybjogTGludXggSVJRIG51bWJlciBvbiBzdWNjZXNzLCBvciAwIG9uIHRoZSBJ
UlEgbWFwcGluZw0KPiA+IGZhaWx1cmUsIG9yDQo+ID4gICogLUVQUk9CRV9ERUZFUiBpZiB0aGUg
SVJRIGRvbWFpbiBpcyBub3QgeWV0IGNyZWF0ZWQsIG9yIGVycm9yIGNvZGUNCj4gPiBpbiBjYXNl
DQo+ID4gICogb2YgYW55IG90aGVyIGZhaWx1cmUuDQo+ID4gICovDQo+ID4gQXMgSSBzZWUgZnJv
bSB0aGUgY29kZSBvZiBmd25vZGVfaXJxX2dldCgpLCB3aGljaCBpcyB1c2VkIGluIHRoaXMNCj4g
PiBjYXNlLCByZXR1cm5zIGVpdGhlciB0aGUgcmV0dXJuIHZhbHVlIG9mIG9mX2lycV9nZXQoKSBv
ciBlcnJvciBjb2RlDQo+ID4gZnJvbSBhY3BpX2lycV9nZXQoKSB3aGVuIGl0IGZhaWxzLCBvciBy
ZXMuc3RhcnQgaWYgaXQgZGlkbid0IGZhaWwuIEkNCj4gPiBndWVzcywgYW55IG9mIHRoZXNlIHdv
dWxkIG5vdCBiZSAwIHVubGVzcyB0aGVyZSBpcyBhbiBlcnJvci4NCj4gDQo+IG9mX2lycV9nZXQq
KCkgc2VlbXMgaW5jb25zaXN0ZW50Li4uDQo+IA0KPiBVd2UsIHdoYXQgZG8geW91IHRoaW5rPw0K
PiANCkEgYml0IHRyaWNreS4gWW91IGFyZSByaWdodCwgYXMgd2UgZG9uJ3Qgb2Z0ZW4gc2VlIGEg
cmV0dXJuIHZhbHVlIG9mICcwJyBhcw0KYW4gZXJyb3IgaW4gTGludXguIEJ1dCBoZXJlIHNpbmNl
IGl0IGlzIGEgbnVtYmVyIHdoaWNoIGlzIGV4cGVjdGVkLCBpdCBtaWdodA0KYmUgcmVhc29uYWJs
ZSB0byBhbGxvdCAwIHRvIGFuIGVycm9yIGFzIHdlbGwuIE5vdCBzdXJlIG9mIHRoZSBleGFjdCBy
YXRpb25hbGUNCmluIHRob3NlIGZ1bmN0aW9ucyB0aG91Z2guDQoNClRoYW5rcywNCkFraGlsDQo=
