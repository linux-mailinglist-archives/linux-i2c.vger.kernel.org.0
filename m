Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91EE46293E6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 10:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237601AbiKOJJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 04:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237475AbiKOJJw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 04:09:52 -0500
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (mail-be0deu01on2111.outbound.protection.outlook.com [40.107.127.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DC9102C;
        Tue, 15 Nov 2022 01:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WooWiRgn8HgB9eamUvmYMT5Sh2vk1gWEKYnZAvaA+j5NAYKMGsCYHOv5/SaG1sGVc3yEdwVBTaV5c+e5Cj5DRhwj6KFMIucNT2qJvmmXoIqrYSlgcIJMbkQJDgFgca/mnwTLHGFvUr6FQUzW/bDA+D0F+7upKwe6eQmsvutg8TgieIAPJ965i6rRsYcQCOmdhfdplSlMfWPi0fjq6UZLq+KmrFZLl31ZYijEGBiHJxR/rv566EFs0rAX3w3nSDyL0V6IpNqSf6jmvpK1QLcaSBS4eTpyto2pJiCqVqCaUDJ0e7tTrN8Ps4BZuweCwLy06x0PLqjQf4DoGg2FdgtVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0cLATsyN2NJRmAVr/pamEssad4YALPI1zqsicvnmso=;
 b=Kh9OuPyXfwDwtiZUyek1EKSccQmrtAZ5+c6LO5pfJTQON/oIVcctYMMIIviOOsdCcTl/P0bHN3jjV38ho5hthU1+JVKNjEUd9jGVRqJ9w6sBAeBVTdnPGLH5gs6HW4UsDOPOBLBvOLEtO6AZLoeNkxtT5ozyHVctyCaagl+dUnalru7U2VNShuOZ98MjaG2x2J5T79I7jGEveLvJhHAbAIhUlOAVoJWSy5VVBz5+qqSny5xkdZ0XCUOTDm2h/pOh+w1i2qHShcqlzrvHCC/irhpLv7mX0k8oRP12ALfSGkotnh9/WjKHqbrPSi65PUBdWSrLVINDZ1EwM3jciEdqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0cLATsyN2NJRmAVr/pamEssad4YALPI1zqsicvnmso=;
 b=P4vGJ9xGIXjqHl5HzNHM/6eNPfKlw3FDjuJ+qCAF6nPN2tQo+qMkJGj1vvKCDvlTmqsTeqL9WPHm1iDZ313Jy036f3eq7mk0OfJ6H3k1Dj1CtFq4tvYBt2CX67CuCyWCe8g/Tr+xGmb3G9c9+kkbLBIJfJDVkAb7qxXWT3HMVPI=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR0P281MB1707.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:6f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 09:09:48 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2%4]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 09:09:48 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
CC:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return
 value fix
Thread-Topic: [PATCH v2 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return
 value fix
Thread-Index: AQHY6IQ0xgSEEJWZ1EWKRbVV0zX+nK4fTQ2AgAJvHgCAHhbQgA==
Date:   Tue, 15 Nov 2022 09:09:47 +0000
Message-ID: <09e27a7e-eff1-2174-05b2-f4dafa8f1bf5@fi.rohmeurope.com>
References: <cover.1666710197.git.mazziesaccount@gmail.com>
 <fbd52f5f5253b382b8d7b3e8046134de29f965b8.1666710197.git.mazziesaccount@gmail.com>
 <Y1gPDyS2ck90pDF1@smile.fi.intel.com>
 <4bf2c0bf-27bf-f4d1-f72a-0f82c53f650c@fi.rohmeurope.com>
In-Reply-To: <4bf2c0bf-27bf-f4d1-f72a-0f82c53f650c@fi.rohmeurope.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR0P281MB1707:EE_
x-ms-office365-filtering-correlation-id: 0b58c769-ce39-49f1-14b2-08dac6e92529
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pKh4v3opyNbkF4gw19BML/pe8GVCDUn3fPVJ0/KvPzZ2NU5Ba4uKstTjGoQrd/qhI/yrUKgzZPtecL2Z5LwsC9XK6ssSk2gB0t/omL95ohvPXejp1nkCEG6uXPZjB2U9uL9iH9I9dJ/1rGkGe0A4GdY/snK4nbvLbryuHM+G4iK1vvJ3jufBzvux+LKhvbVHEZTSn24BqUGBowuUkcXPUdH8zyTfhAKcvgpojP1DnIFC7xjLUwstCMtFANOjsS6aJFXH/NXAFQteM2tFMRNhKDEJS8zBW85A1zOVRmudmrcv1yr5kHbJYPIUXzAJSeo3p69VUWJcp9Lnw5F6D1wnwqlt7JGze4gDWkSqy91Px2I4qSBfKcvsiOSUgAOcGfbVnXgtRbD++Njr4TrK79dw2ZjS79K1szao4e2/ELEUubNWJPqWWeOZqVObOcyjn8zG3tHv16FNrmPKrwd2ajghWXXtN3l4GFBLtqRZ594LH0PblGHcDtxr6+wadtA5IjQfPndcVIy2FcnLih0zkBP2BpCrdsIsDH2+ka4vNZ9vnZnCWvI0CJ3RVwh6TRCFV8OOV2DkuR3zZNjzA4zETjBOI74f1Tr9w+3ciK+sX9qVnuAPkhd3miQsMZuQf6/LnS70RAsW42cb1ioN2Snp462DxU2NVsrnYJZjzeUELGc/LdwxcN5hhoBCDy7oRykklRrcLfdl3nKyWKwMxNfz5UoZ+j2X+P8/e6NG0ghk2KfGwoD/5Aunr8HEaCIB63IWjTP6IZc1jPIh5k8+03u+LG4bttetfXdIlchyAS1whFUkzvc4rnrJr75he/3ZKoh6CPlgHpqyl4SD2FePryB7ZMqlWE0/ZnGtmBxHCrKg63kPb0g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(451199015)(91956017)(66556008)(8676002)(76116006)(66446008)(64756008)(66946007)(4326008)(66476007)(316002)(5660300002)(7416002)(8936002)(122000001)(41300700001)(186003)(83380400001)(6512007)(2616005)(71200400001)(38070700005)(6506007)(53546011)(38100700002)(31696002)(54906003)(86362001)(110136005)(478600001)(966005)(2906002)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1BqS0N5Ykc1cVF5WGZ1bjQxdG5NbHNaSzBjK1owSURYMzkzbmJGQUh1OHV5?=
 =?utf-8?B?OTYrcWpaek9XZ3hmNVliMU9waDEram1VWlBPYXIzR2twRVg2R1IrWEVMbmdz?=
 =?utf-8?B?UThXazJaQ0h4QVU5aXZGMVMwYXN1TTJqQitiY1VaZ2JJT0d5UkxXWWVMSDgr?=
 =?utf-8?B?VytXM3EvWjlVSVRQUkY0VG1LajYySkEyZDk1RjV0YXFlZERJOUZLL3V1ZDJT?=
 =?utf-8?B?RmY3SzczKzZNam1IdGttLytvYzhuK3Y3cWduVkJGa0NvelZFamo5MEZGNFR1?=
 =?utf-8?B?bklOQWJTNTBRZUEvcXBHZTJ5N2JvZDlrZWgvTUlrbzBDR3FaZFR6aXVNZHo4?=
 =?utf-8?B?SHV4RlRUSjhCUzAwTGw3cFdFSGd6VEdSTHVZcHVBRnY1ZjFkTTRCb3gxUTZm?=
 =?utf-8?B?OFpPeUcxMWVmaE9McENvL1V1cldzL29rTld5d09iMHhpM3oybE9YZTZRUDFt?=
 =?utf-8?B?N292WUNaU1B6STJJUnN0bmFCeVZBUDE0M2ZTVGc1UGM4YXhVb05SYmFieGE4?=
 =?utf-8?B?aHFuODdUQUVpVzZqZ0VIbjVtQVRtWlpCeVJxY1BVZzluRjd1WWtwTk1XZXox?=
 =?utf-8?B?emowVW9CTmFqazhJSStoczVIR05PcllvQmU0alMzRERrNnFUY1cwaitXajZY?=
 =?utf-8?B?YVNVWFV1aUh1Q2dYNHBTOUxzKytGcjdmMy9BaXB6aTZTOTUzVDM2Q2ZTUEVw?=
 =?utf-8?B?c1N6R3Jpb3lxdktRazBDZ3JpbXk1QTkwRlBsdkVxbkE4T0t4M3VnZmhJNTVD?=
 =?utf-8?B?ckJsaU14UWJBaHM5ODhlRGV0aVdaakFONS9ibjF4SnhmZjB2enYrd0d6RTZa?=
 =?utf-8?B?eWNHQ2VCci9CMXoxOE1kSENzM0FxM09aaERFb0ZQeXpmKy90eDFldm1GU2hZ?=
 =?utf-8?B?MnRnQWpxM1hsN1V6YmMxUnlyUmlsSnIrUjI5RkUzUWhCSkNZQVpWNThDM3E1?=
 =?utf-8?B?ZHdCd3VUa2NxZjYrWmIxcEZBZk5oQjI1Sm1IbFdJVUxSNGk2U2MyUURTQWZJ?=
 =?utf-8?B?bFNxb2xhMHJrNUUyT2NaQkR2RmR4cXAweFhhY3dZZFYyTDhLSFN2VFlSVlhh?=
 =?utf-8?B?VVRvd0NNajF4Umo5WndPUVpTOVZ3OEcrU0RnNWhjNVZlbmZvQXhCNDdYNS9z?=
 =?utf-8?B?anlGUElaSVV5Ryt6YVJPMGNMRTF2UkttVVNlVzJLSDd4YjA2cEM5NU52RkVI?=
 =?utf-8?B?dUI2YVowT05aaE5SOEUyNFFOa21WRlFPU3h5YjVmMHFCTHpYSVhhejhXb1hJ?=
 =?utf-8?B?V0hqTGFaRVFmaXJiMG5vRUp5VXVwSUZlVlpySDE1cGQxM3lNRXdRdFhIU2hS?=
 =?utf-8?B?bURZY0d4MmorU3RkZXdCN3RtSGtJUVh4OGdjTDVrM2JOSyszM1ExQkE2dDlh?=
 =?utf-8?B?cmMvbGZHSy9tR1RuOCtBejducVphaHJMZ29naXR5M0xYRTFNSmc3d0dpRU5x?=
 =?utf-8?B?R24xQ0ViZmVZSHZsQWMyRFBZc2RSZWFiUWlINXQxZE8rM3B1MEhid2tzTDZP?=
 =?utf-8?B?clR3ODd6a1RyOEQ2YnhNSkVPa212bllydGFZN2hTT0lNb0tGUjhFZHJ6SjRl?=
 =?utf-8?B?bkFxZlYrMXhGSTFyTWVYMExSY1pUTElBQks0eTdTbmhNQlN6S3RrMlQ5bEtN?=
 =?utf-8?B?MEVlRXh5d3pjMWdRTGtobE9mR291NnhiWmx2NXBUZDFBRjZldHdPNEgzcFIw?=
 =?utf-8?B?MDlTN0VUb2JDL3FSc3hCSXJaN3B4bmVCWExXUHJpYmVjSDNNa3R1OVJIaUdR?=
 =?utf-8?B?V25LYW52WXBoWHlDcTNRVjBNVXRsaE1FaHdxWlRSbVJ2SVpXbDN1ZjNPUzY4?=
 =?utf-8?B?ZDRzSnZlVWJRNGZpTkZhVlRSV2VjSnBzM2VtRnFnc1NxZjFSME53M2J3NzhS?=
 =?utf-8?B?eXY2RWJmOWtkd3QyaXJpbUJRcis2RjVJckRnaE84Y21QdFJvbFFxZTZiYXRZ?=
 =?utf-8?B?NDhNem03cUwwWmxOTXVQdUhmM1pySW05V20rb1FPbndWVDY1YlhYMG90MHBz?=
 =?utf-8?B?Zk1IOUlSazVWNDArcmxjQUcvM2xtbFJMejFxMDBoamVkc0FmaHJDaDRDTmgw?=
 =?utf-8?B?djdMcVF5d1JtUGZOMEZBTkNPNkJ6eThpSi9XV25IbWpqdmlmVURMaitGaGhT?=
 =?utf-8?B?RDdGd2JOQnZvVDJ0c1hVeUl4STVLYk1RR0lGK25LencvamNkQjE5QlNhNHJx?=
 =?utf-8?Q?k0MFcKXY3jA6juXHR32zBdA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <792F8913F01E3647B129BF886594D9DA@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b58c769-ce39-49f1-14b2-08dac6e92529
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 09:09:47.9162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PESXLXTcA8T7+FPUpnBTpuzHFN6GvGc5/gRF/Htne1k3xi0ZqSvszbvRhD2DmCwTzaybdW6OkxziXZxpMHxwRboGgNME58ky11e3zBmpqLwV4+MrEnpx8h2PCUswtRUd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB1707
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMjcvMjIgMDg6NDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gT24gMTAvMjUvMjIg
MTk6MzAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+IE9uIFR1ZSwgT2N0IDI1LCAyMDIyIGF0
IDA2OjEyOjExUE0gKzAzMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4+PiBUaGUgZndub2Rl
X2lycV9nZXRfYnluYW1lKCkgd2FzIGNoYW5nZWQgdG8gbm90IHJldHVybiAwIHVwb24gZmFpbHVy
ZSBzbw0KPj4+IHJldHVybiB2YWx1ZSBjaGVjayBjYW4gYmUgYWRqdXN0ZWQgdG8gcmVmbGVjdCB0
aGUgY2hhbmdlLg0KPj4NCj4+IC4uLg0KPj4NCj4+PiBEZXBlbmRzIG9uIHRoZSBtZW50aW9uZWQg
cmV0dXJuIHZhbHVlIGNoYW5nZSB3aGljaCBpcyBpbiBwYXRjaCAxLzIuIFRoZQ0KPj4+IHJldHVy
biB2YWx1ZSBjaGFuZ2UgZG9lcyBhbHNvIGNhdXNlIGEgZnVuY3Rpb25hbCBjaGFuZ2UgaGVyZS4g
RWcuIHdoZW4NCj4+PiBJUlEgbWFwcGluZyBmYWlscywgdGhlIGZ3bm9kZV9pcnFfZ2V0X2J5bmFt
ZSgpIG5vIGxvbmdlciByZXR1cm5zIHplcm8uDQo+Pj4gVGhpcyB3aWxsIGNhdXNlIGFsc28gdGhl
IHByb2JlIGhlcmUgdG8gcmV0dXJuIG5vbnplcm8gZmFpbHVyZS4gSSBndWVzcw0KPj4+IHRoaXMg
aXMgZGVzaXJlZCBiZWhhdmlvdXIuDQo+Pg0KPj4gVGhlIGVudGlyZSBlcnJvciBoYW5kbGluZyB0
aGVyZSBsb29rcyBzdXNwaWNpb3VzLg0KPj4NCj4+IFRoZSAnc3RydWN0IGkyY19zbWJ1c19hbGVy
dF9zZXR1cCcgZGVzY3JpcHRpb24gc2F5czoNCj4+DQo+PiDCoCAiSWYgaXJxIGlzIG5vdCBzcGVj
aWZpZWQsIHRoZSBzbWJ1c19hbGVydCBkcml2ZXIgZG9lc24ndCB0YWtlIGNhcmUgb2YNCj4+IMKg
wqAgaW50ZXJydXB0IGhhbmRsaW5nLiBJbiB0aGF0IGNhc2UgaXQgaXMgdXAgdG8gdGhlIEkyQyBi
dXMgZHJpdmVyIHRvDQo+PiDCoMKgIGVpdGhlciBoYW5kbGUgdGhlIGludGVycnVwdHMgb3IgdG8g
cG9sbCBmb3IgYWxlcnRzLiINCj4+DQo+PiBTbywgdGhlIHF1ZXN0aW9uIGlzLCBzaG91bGRuJ3Qg
d2UganVzdCBkcm9wIHRoZSBjaGVjayBjb21wbGV0ZWx5Pw0KPiANCj4gSSBkb24ndCByZWFsbHkg
a25vdyB3aGF0IHRoaXMgbWVhbnMuIERvZXMgaXQgbWVhbiB0aGF0IGlmIElSUSBpcyBub3QgDQo+
IHByb3ZpZGVkLCB0aGUgZHJpdmVyIG5lZWRzIHRvIHRha2UgY2FyZSBvZiBhbGVydHMgKGluIHdo
aWNoIGNhc2UgdGhlIA0KPiBjaGVjayBoZXJlIGlzIHZlcnkgdmFsaWQgYmVjYXVzZSBJUlEgaXMg
cmVxdWlyZWQgZm9yIHNtYnVzX2FsZXJ0IA0KPiBkcml2ZXIpLiBPciBkb2VzIGl0IG1lYW4gdGhh
dCBvbmx5IHRoZSBJUlEgaGFuZGxpbmcgaXMgb21pdHRlZCB3aGlsZSB0aGUgDQo+IHNtYnVzX2Fs
ZXJ0IGRyaXZlciBzaG91bGQgZG8gYWxsIHRoZSBvdGhlciBzdHVmZiAod2hhdCBldmVyIHRoYXQg
aXMpIGFzIA0KPiB1c3VhbC4gSW4gdGhpcyBjYXNlIHRoaXMgY2hlY2sgaW5kZWVkIGZlZWxzIHdy
b25nLg0KPiANCj4gSSB3b3VsZCBhcHByZWNpYXRlIHNvbWVvbmUgd2l0aCBtb3JlIGluc2lnaHQg
dG8gdGhpcyBkcml2ZXIgdG8gdGFrZSBhIA0KPiBsb29rIGF0IGl0Lg0KDQpXb2xmcmFtLCBkbyB5
b3UgaGF2ZSB0aGUgcmVxdWlyZWQgaW5zaWdodD8NCg0KV2hhdCB3b3VsZCBiZSB0aGUgYmVzdCB3
YXkgdG8gcHJvY2VlZD8gSSBzZWUgMyBvcHRpb25zOg0KDQoxLiBmaXggdGhlIHJldHVybiB2YWx1
ZSBhcyBpcyBkb25lIGJ5IHRoaXMgc2VyaWVzLg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L2NvdmVyLjE2NjY3MTAxOTcuZ2l0Lm1henppZXNhY2NvdW50QGdtYWlsLmNvbS8NCgk9PiBXaWxs
IGNhdXNlIHRoZSBpMmMtc21idXMgcHJvYmUgdG8gcmV0dXJuIGZhaWx1cmUgYWxzbyBpZiBJUlEN
CgkgICBtYXBwaW5nIGZhaWxzLg0KDQoyLiBhcHBseSB0aGUgMS8xIGZyb20gdGhlIHNlcmllcyAi
YXMgaXMiIC0gYnV0IGRyb3AgdGhlIHJldHVybiB2YWx1ZSANCmNoZWNrIGZvciBmd25vZGVfaXJx
X2dldF9ieW5hbWUoKSBhbHRvZ2V0aGVyIGFzIHdhcyBzdWdnZXN0ZWQgYnkgQW5keQ0KDQozLiBk
cm9wIHRoaXMgc2VyaWVzIGFuZCBhcHBseSB0aGUgZG9jdW1lbnRhdGlvbiBmaXggc3VnZ2VzdGVk
IGluOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1kxZHpDQ01DRHN3UUZWdk9AZGM3NXp6
eXl5eXl5eXl5eXl5eWJ5LTMucmV2LmRuYWludGVybmV0LmZpLw0KDQpUaG91Z2h0cyBhbnlvbmU/
DQoNCllvdXJzDQoJLS0gTWF0dGkNCg0KDQotLSANCk1hdHRpIFZhaXR0aW5lbg0KTGludXgga2Vy
bmVsIGRldmVsb3BlciBhdCBST0hNIFNlbWljb25kdWN0b3JzDQpPdWx1IEZpbmxhbmQNCg0Kfn4g
V2hlbiB0aGluZ3MgZ28gdXR0ZXJseSB3cm9uZyB2aW0gdXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpo
ZWxwISB+fg0KDQo=
