Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078B660C962
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 12:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbiJYKG0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 06:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiJYKFz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 06:05:55 -0400
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (mail-fr2deu01on2128.outbound.protection.outlook.com [40.107.135.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B4A14D1D1;
        Tue, 25 Oct 2022 03:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSAj5qIH+QAUlRsEUJuNewLA540O78BVTv0RhQ5HKmX71/20GW0kiP1o9a+ahfPQOWgiM8Bc44tb5KdvrgGGirY0Hj+vN1o2g5G2n63eMbBsiR6s7A9Fsqm0j/oPW6z7a1AThyQNyQlAdABmnII8msWaU96sTDu/JCyYNRYUP7HXKKbIluuPdecYH0gyrxS/mH1Yj7TY6FLw8FUanftFbG+A61GuPbC9crxxtDhNbhQT2FSAvi5qUlYu/pB+BqeQzwkJFHpez9QQ5dLmWHyVNRoYbMx6mH4IdBo3OGb6FsQOA84z2DIdl3CGEoNco8nVsZYplPihnWPns5ac1BrIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNArUKvg6XEKdJKyHp2ORzO8k03OVvRwpdDJUXm1HeQ=;
 b=aav6lzLGht19IxAiBIjhfxDUzIg2MWosLjOJV2WwSgM16TR9IJDKaQxrGNTVpy2JlAShYCsvU8BJBTv3SJJGdRxgzj310EDdvTj6wX3PO/eY7iCMfaav8GdIYtwn0Ux+rnFrFEpaWH9qcotSMmT8iiE6TrWJku0Q3Ge8dQmuGFuEcPRhC7zqTzO6nKGRmwXlF8dz65BRIOrxLkNlyJRGA0yY1eEA1LiQ1pGWhEQmP3712NBqJ6rySQnsunb+LdOl2TQLpR05UXKR3febtdxig2EOrNE0iAh6tqllZOfPBGKYGVySzuGQXqje96BxnqYO9Vlcfiuc9Ayyw9wrSDKk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNArUKvg6XEKdJKyHp2ORzO8k03OVvRwpdDJUXm1HeQ=;
 b=v1yRN+aa/BgKHWVMNYoirrU78zDG738x4CXj3KvYmXpRaXRwgjzcFie3NZDcZYY1txzckb897AYx/QrhR4SekYnjps6VjAJ3am8LqnlgqGPOCiNtwOnk1DRLHiw1ndVWLOROVxC+fWWv+qgnc3npdSw/JH4oYkR2pm9MrdRF94k=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR2P281MB1637.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:8c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 10:00:07 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::adc3:ee78:7f30:722]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::adc3:ee78:7f30:722%4]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 10:00:07 +0000
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
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Thread-Topic: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Thread-Index: AQHY6E7wvBBBhJwW80WXu2XBZbUGKq4e1OGAgAALmgA=
Date:   Tue, 25 Oct 2022 10:00:07 +0000
Message-ID: <ec8cc1bd-3150-dc5d-8b8a-870f21b52433@fi.rohmeurope.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
 <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
 <Y1ep5zN+wifkP7v+@smile.fi.intel.com>
In-Reply-To: <Y1ep5zN+wifkP7v+@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR2P281MB1637:EE_
x-ms-office365-filtering-correlation-id: f0f93381-9f90-4a00-e8b0-08dab66fb26b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STCN1LVuSq+lqUJmxisxIcRy3a4gtJ8EoQJWwLSLydxvcjmC840JQKLopDBw39BIGOJ3RGF6XRsQhKzAQVjS2jjgGIGwlch9SLZE3DkAn6xoCwmaOf/PVu6FKTYd15+27w2o1V5wJgmYq6QS9vvTDXhuvNQMQeSG1SAwX/bakJPHJVCJCC5P2PuhUwX1dZfiUz4w4m2sXIeYc+jFp35/SBod2jh83ipLdwtHmWwrZJNOO/YjhMJv3ecCzYuHbpzFVOt9Gtm563Ut9rhiqpx+1IYGYeo+JZy/R6LhdaCpzyHsRo3hwDRlg38JKhf9CZK6Bzeem7O7cBarGLIEiD1Nm5hFVgnpko7cIaM2vLQdUnMYfzYq0ACT1VwT+sy45/DC37bCg+hBKDcaPUENW2KZ0K/0tamVRxDuvvM9/bsyhnpAyra418hjEEkh02DDECw31U8VRAohTRKBBDB9lgVZnt+p1URW9hjWU28P4ZBpo95xREmvLCi3g+V3W0wXzxlutb1Rjx4nBor3WD9Q7/b3BvQ30x4+lY+kpv3srhCcSAJno40k75fY4y7voSnu6NPq7quFH8xQ3a47cflASjsP/i6bosJtV4PakKlrw+oJcqHdUUh6Sxq+wnFxS+y+bZJYgzxQO0gE1Q1Q8ouuR0mT6QXZ4fw5zdiWYX3a4zhTREDIhGgee1gznoMA2muZoQB4FvdtA6CuKBv3uwSkM2vgki4HRd4roQtbqVt42B/G42I7Wj5ylWG+tK/AAzcHgIk06LXgTW8F8fOn8Q7OHHeozI3ascj2p4ADCgfG3NLB7OGuIEZot4CZ9R7xmiFFSWv9Ms7N4SKJc/FNGsX7oX5x4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(366004)(396003)(376002)(136003)(346002)(451199015)(8936002)(41300700001)(6512007)(83380400001)(122000001)(38100700002)(38070700005)(5660300002)(7416002)(2616005)(2906002)(186003)(31686004)(71200400001)(478600001)(6486002)(66556008)(66946007)(76116006)(91956017)(31696002)(86362001)(53546011)(66446008)(4326008)(64756008)(8676002)(6506007)(110136005)(66476007)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0FDb3pXbkRxSkNmSDlRbDNQWHVCSlMxaVNrOXp5bVFlUkplT2x4M09UYXQ0?=
 =?utf-8?B?ZVRML21tMjZIZUo2bHYvWDl2STlMRjhaNkpic3dWaFJtT1JmUFdVRXp4clFo?=
 =?utf-8?B?eTdkK0FnSkdDVzVGSFMzT2FPM3JPeTFWcjVlTnBSSWtNckZWSXVybC9UTVBv?=
 =?utf-8?B?L0hHMGFCaTgzbEtVZTNnQTd6cW1kWEtXTjd3dGtMT0pYN25wMDV5QjVEM0lu?=
 =?utf-8?B?amNzN3Uxd1o3UGxSU2xQdzRFVExHRE9YOWNJdVFVSVhWa1IxT0VkYmVhalJQ?=
 =?utf-8?B?aytsVDZLRVVxMWdWY1cwOTVZSjUrSWJVVUlRVkliaDc2alA2YUNEaWthUHpE?=
 =?utf-8?B?bldPMkhWMkdiTkkzYzN3YXpoUU14R0hpT1MwTExNeFg0RmpQUE1menNWZm1P?=
 =?utf-8?B?Y2lkdUtGSEpsOFgxOVZQYmtob1JZMWhlTDdIN3VUU21mc1dBTGltd29rcTRF?=
 =?utf-8?B?T1NVRFR4N2FEZWVGcGFZa0pTUzBIWk53ZFNqMDRuU3NCZ0ErYnArS2ZhaEZI?=
 =?utf-8?B?TElEV2lNbnVKZU44cmhSQlNyQUdTVWhXQnlOVmFRRVdISS8vSmI2eU5HcDRq?=
 =?utf-8?B?S1ZLY1ZOWVhXek9saG1FQkM0RW12L0pScDNmSWI4WkYzbnp6TUJNRVVqRzhY?=
 =?utf-8?B?a3dBMzBwQTF0ckVZR0lKU1F2WjluZytFUEt6SlVUenlVOGE0Q213am9zaUkr?=
 =?utf-8?B?aGZVVFpnUi9qeVkvRXZ3U2p1blZqMUVhbVg0ZHhpMXhseEpKWENsYVBvZzcz?=
 =?utf-8?B?K0RHdVcyVmt1YkF5bjZKOTMwb2V4L1RET1l0ZWhmT2NBZGU2Q1VjeUVVT2Vr?=
 =?utf-8?B?TzkxQW9JaVNNbCtZOG4vQk9DOEphZ0xuVWZsbTV0bmlhbXEvRVFHMFRVWUtH?=
 =?utf-8?B?d3p6QkZYOXh3WTNyanRqZDVxSW9jMDdXZ0ErdGU0K3NFa1p1WEZ2OWZ6SEpZ?=
 =?utf-8?B?QVJnMHRKQS9ZUkRJTEE5bVRmUWtMN0t1YjhWTnBSRnhzV0NCVW5CZjhUUkpU?=
 =?utf-8?B?cE9DRW5yejdTVEtWUTU4SU5sVnJhalU1YnBjdUpDRzZJMlNNaEdROHgxQ0xl?=
 =?utf-8?B?eURjLzhzUTRSN29ZWE5WaGpLMjVRcndISjJ2UnJ3MW92dGRGMHg5RlVlWVQ1?=
 =?utf-8?B?M3VRUGs2QmNBNnRCOGZqemFuOENvV2dmQUxwYTFPWExNNlp1eUdXTDFlTW8x?=
 =?utf-8?B?cjRUVXZMVjNVUWxMd0tBcU1kTVBzc2tQd1BSV0J0L0lhZmg2bzVjeXFhR0Rl?=
 =?utf-8?B?Yy9wTTkvV1NPZHRSeU1BTWFvV0k0MnFUYzdydGNoWHBNenZjaDlhVWtTVktX?=
 =?utf-8?B?YWRIYmR0UUNiaVZTSUdkT0VBTndNRGMwZ2hvc0xkY0RhTm5TK3pZMElTYmxs?=
 =?utf-8?B?anA4UzBoVlVPSnJsYUtmbStiTTQxbDN0ZUlqN0cyKzlubHlISVhPM3hTL3JT?=
 =?utf-8?B?Q2NTYmNGZVRNSUEzY3I1STl0U2Y2blNRaDNtbjQrSkxZYkZkTmpUUkdhcmg5?=
 =?utf-8?B?NUNrSEM2a2o0aEduUWdVUkZlMEFtSHIyemhoMFFiMWVIOEo2SXZQQ1NadjFC?=
 =?utf-8?B?c09jU0xST0FvdUxBSDFVU0crRWRaRlFYZTBScndGMHQ1Q1BZdVJxdDZDTFE5?=
 =?utf-8?B?Ym8rdndIQUJTZnRxL25EbUxmSXcxaTBrMmtyNDhzQlNJTWNZTFB1UnJ3ajhX?=
 =?utf-8?B?dXY5Ym44ZFdUQThVTGJYdEpNbCtjaFJpdWRmQnNrM2pyUWpHMlZnMGhlOXZo?=
 =?utf-8?B?OXlNSHk3WEdud00yVlpQd0REUHEvQUdKcmVqQzBNK2lyNjVXQWd0U0FPZUZy?=
 =?utf-8?B?TVFWMTlNNm4rWW92K2ZycTAzdTJSb1QrUm9vWmFMNitpTE9mWGZkNi82aTdr?=
 =?utf-8?B?cVVGYWxtbDJVRlo3YWpGekJkL3FyRlFQaGdQL29Fa1BkeHZkTDJ1alJaYWpx?=
 =?utf-8?B?YnVtbndLRTRzbUlXck9NOUpna3Z1ZDYyNXV2dzZpdVcxYW5VWlRPV3NiNFgv?=
 =?utf-8?B?cDlKZUhYWEV0ZG9VYjE2Um1UV25UVDQwZFVNeXp0eVA1SjhETVJFVVhFakRl?=
 =?utf-8?B?Y2drMU1HVlRZZDc1cXcveWFXN1dyeGJuV2pzeGNkWHBKRlNDQWZrUTl6YjBt?=
 =?utf-8?B?N29yeDNXSkRKTjlNKzFNdjBzOEhuRUtFaDFFcFoyb3BhZjVYemRFTERoV1pC?=
 =?utf-8?Q?VbhrCiFSd/AJPCUvJ0jpqm4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DC0570757D208448FE4E60085E07354@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f93381-9f90-4a00-e8b0-08dab66fb26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 10:00:07.6763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XP2cPC38Q1hCCCBTSNUGNN/tqE/7M5oZDQN/7oFaUJlRe34NqhaCpUmoPk2wP9Myrw33yER56AtTEbONPAsUtJtAPJmWw//Yq2optww1bg6IjkmV/vcxT+PQxaNNl1vB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1637
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiAxMC8yNS8yMiAxMjoxOCwg
QW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiBPbiBUdWUsIE9jdCAyNSwgMjAyMiBhdCAxMTo1MDo1
OUFNICswMzAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+PiBUaGUgZndub2RlX2lycV9nZXRf
YnluYW1lKCkgZG9lcyByZXR1cm4gMCB1cG9uIGRldmljZS10cmVlIElSUSBtYXBwaW5nDQo+PiBm
YWlsdXJlLiBUaGlzIGlzIGNvbnRyYWRpY3RpbmcgdGhlIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24g
YW5kIGNhbg0KPj4gcG90ZW50aWFsbHkgYmUgYSBzb3VyY2Ugb2YgZXJyb3JzIGxpa2U6DQo+Pg0K
Pj4gaW50IHByb2JlKC4uLikgew0KPj4gCS4uLg0KPj4NCj4+IAlpcnEgPSBmd25vZGVfaXJxX2dl
dF9ieW5hbWUoKTsNCj4+IAlpZiAoaXJxIDw9IDApDQo+PiAJCXJldHVybiBpcnE7DQo+Pg0KPj4g
CS4uLg0KPj4gfQ0KPj4NCj4+IEhlcmUgd2UgZG8gY29ycmVjdGx5IGNoZWNrIHRoZSByZXR1cm4g
dmFsdWUgZnJvbSBmd25vZGVfaXJxX2dldF9ieW5hbWUoKQ0KPj4gYnV0IHRoZSBkcml2ZXIgcHJv
YmUgd2lsbCBub3cgcmV0dXJuIHN1Y2Nlc3MuIChUaGVyZSB3YXMgYWxyZWFkeSBvbmUNCj4+IHN1
Y2ggdXNlciBpbi10cmVlKS4NCj4+DQo+PiBDaGFuZ2UgdGhlIGZ3bm9kZV9pcnFfZ2V0X2J5bmFt
ZSgpIHRvIHdvcmsgYXMgZG9jdW1lbnRlZCBhbmQgYWNjb3JkaW5nIHRvDQo+PiB0aGUgY29tbW9u
IGNvbnZlbnRpb24gYW5kIGFiZCBhbHdheXMgcmV0dXJuIGEgbmVnYXRpdmUgZXJybm8gdXBvbiBm
YWlsdXJlLg0KPiANCj4gLi4uDQo+IA0KPj4gKwlyZXQgPSBmd25vZGVfaXJxX2dldChmd25vZGUs
IGluZGV4KTsNCj4gDQo+PiArDQo+IA0KPiBSZWR1bmRhbnQgYmxhbmsgbGluZSBhbmQgYmV0dGVy
IHRvIHVzZSB0cmFkaXRpb25hbCBwYXR0ZXJuOiA+DQo+PiArCWlmICghcmV0KQ0KPj4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArCXJldHVybiByZXQ7DQo+IA0KPiAJaWYgKHJldCkNCj4g
CQlyZXR1cm4gcmV0Ow0KPiANCj4gCS8qIFdlIHRyZWF0IG1hcHBpbmcgZXJyb3JzIGFzIGludmFs
aWQgY2FzZSAqLw0KPiAJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPj4gICB9DQoNCkkgbGlrZSB0aGUg
YWRkZWQgY29tbWVudCAtIGJ1dCBpbiB0aGlzIGNhc2UgSSBkb24ndCBwcmVmZXIgdGhlIA0KInRy
YWRpdGlvbmFsIHBhdHRlcm4iIHlvdSBzdWdnZXN0LiBXZSBkbyBjaGVjayBmb3IgYSB2ZXJ5IHNw
ZWNpYWwgZXJyb3IgDQpjYXNlIGluZGljYXRlZCBieSByZXQgMC4NCg0KaWYgKCFyZXQpDQoJcmV0
dXJuIC1FSU5WQUw7DQoNCm1ha2VzIGl0IG9idmlvdXMgdGhlIHplcm8gaXMgc3BlY2lhbCBlcnJv
ci4NCg0KaWYgKHJldCkNCglyZXR1cm4gcmV0Ow0KDQp0aGUgdHJhZGl0aW9uYWwgcGF0dGVybiBt
YWtlcyB0aGlzIGxvb2sgbGlrZSB0cmFkaXRpb25hbCBlcnJvciByZXR1cm4gLSANCndoaWNoIGl0
IGlzIG5vdC4gVGhlIGNvbW1lbnQgeW91IGFkZGVkIGlzIG5pY2UgdGhvdWdoLiBJdCBjb3VsZCBi
ZSBqdXN0IA0KYmVmb3JlIHRoZSBjaGVjayBmb3INCg0KaWYgKCFyZXQpLg0KDQpJIGNhbiBjb29r
IHYyIGxhdGVyIHdoZW4gSSBoYXZlIGZpbmlzaGVkIG15IGN1cnJlbnQgdGFzayAtIHdoaWNoIG1h
eSBvciANCm1heSBub3QgdGFrZSBhIHdoaWxlIHRob3VnaC4uLi4NCg0KWW91cnMNCgktLSBNYXR0
aQ0KLS0gDQpNYXR0aSBWYWl0dGluZW4NCkxpbnV4IGtlcm5lbCBkZXZlbG9wZXIgYXQgUk9ITSBT
ZW1pY29uZHVjdG9ycw0KT3VsdSBGaW5sYW5kDQoNCn5+IFdoZW4gdGhpbmdzIGdvIHV0dGVybHkg
d3JvbmcgdmltIHVzZXJzIGNhbiBhbHdheXMgdHlwZSA6aGVscCEgfn4NCg0K
