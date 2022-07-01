Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABFE562BD6
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 08:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbiGAGcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 02:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234844AbiGAGcc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 02:32:32 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7048E13F8A;
        Thu, 30 Jun 2022 23:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXL4JQvI/ME5MBIsupCHG+63Ia3/Kx7jxrNMop54F+CaP6i186E81bSyeFX4uqqRz4n3rWZXnSXaPMISLQ5jC53f2E84kyB20ZW8iEvLPG7DX2iYJIeDR81w1W8jK5ETVdm8qd2LEBYlanFsNS96+3nH9tYBL2vud+23ZJjPOzgSxNyz01DLkb3X0GZ2KztMjme8pqcFez17KwT9USWzAYS6LB637INn9oWV/V+kOCsz6ES2dxiS9Nxjx9FmHWalqNeMOTu8Y74OB7bU5orCSq7oqcgj/EmBQBF45Loyk/EtPey2i8aQL5lllBLl+xnUh2PeujCuxdsFZ7ekpF1BjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdLil5lCGYN5mbO0eAxBDpBC9HbtJa0frYjWZWy+ca4=;
 b=Ja08vwj1IxVhyQtJGutJVHWdYKkFXUr8i3ABLDerIjnXGUoLrEVVWuvZaTObSa6L9Id8PqSa3vfvEwwjjqbqmXTVI5ETdbkQUgPCa5NNnoN9vQPDp6F+GIvlNvPbB8+Sord3Wp/qJtuXkNjJKOCTEjYqxs9vtOVW1naAUoFGpW1bUmZIG0or1nUV5PbnJft7rjg/m38DrIe3ohtPmhf8ChijO1QfoTtWzCbS+dLlYcHpvwaV4q7ut/1R/FpuqZkPl32wTkUPGhJRsfQyx0wNZW867AKJNZy7JH3ThC0IpWxY3AcuTJtoKIIYDqoBffQejjasdeaB+rZei+EIA7FMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdLil5lCGYN5mbO0eAxBDpBC9HbtJa0frYjWZWy+ca4=;
 b=ahljCPV4d8wh7m25DzHE/Vfe1E6vmDYuax6Bzte5yXLNEXlAoXBnyKUnuDgAa7ULt3TjxVWy6YIK4ygLKb4VTDmIZ0cT+QJrR3LeIXtMxjiI11Wan2we++O6Qw4AE3B3GN6Aml2SnU2+NuN9LjHh9YK8b9zff7q5ekQiZ95r2ew=
Received: from PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10)
 by DBBPR04MB7577.eurprd04.prod.outlook.com (2603:10a6:10:206::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 06:32:29 +0000
Received: from PAXPR04MB8304.eurprd04.prod.outlook.com
 ([fe80::6c24:a20:26bd:60df]) by PAXPR04MB8304.eurprd04.prod.outlook.com
 ([fe80::6c24:a20:26bd:60df%2]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 06:32:29 +0000
From:   Zhipeng Wang <zhipeng.wang_1@nxp.com>
To:     Sami Tolvanen <samitolvanen@google.com>,
        Wolfram Sang <wsa@kernel.org>,
        Kees Cook <keescook@chromium.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] i2c: core: Disable i2c_generic_scl_recovery
 callback checks with CFI
Thread-Topic: [EXT] Re: [PATCH] i2c: core: Disable i2c_generic_scl_recovery
 callback checks with CFI
Thread-Index: AQHYipisQEgXaD6RFU2HjOnVd/mFf61mx7cAgAFWe4CAAPK9YA==
Date:   Fri, 1 Jul 2022 06:32:29 +0000
Message-ID: <PAXPR04MB83042668CE3A29542EF18657EBBD9@PAXPR04MB8304.eurprd04.prod.outlook.com>
References: <20220628024155.2135990-1-zhipeng.wang_1@nxp.com>
 <Yryn8PdQIH7RaUwO@shikoro>
 <CABCJKud+iQ=Mo_-78hh-KsPAe9gtjqR0kxCTc3GOhkQd_F0GHA@mail.gmail.com>
In-Reply-To: <CABCJKud+iQ=Mo_-78hh-KsPAe9gtjqR0kxCTc3GOhkQd_F0GHA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4176aa1c-1584-4e2b-b3df-08da5b2b78b0
x-ms-traffictypediagnostic: DBBPR04MB7577:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Q64k7BuqytmkwZwxvCaboO2NlfSAes04jWWXWk/xQ6+VRiK2zxjxSiCYuIE6PqS5XixJVb8ucWL6HO7OjtkbLsoZspPXnC2oQyfSEj/Jlm/DlfYiAI3lJi7gjZyQqpVJL5pCHvhlcp2mG8W4J3hj9StzaCXyd9UwfBIUaNi8JEefNFpQVdGDeL1WPQSb5ChNomPiFTWoMa6GsYf8ipo9tOw++GWE1ri8gZ6jysa4BejXYLO9yua6LHGeBgLRl3BswEi+tckf1clx5aRX+Q9ZqkQTfQl1in5GcT6wsAiqhuvtmczxhlVN+kjun1g+mDssUoMv3q2rOZVdwr579U9V2vIil+v7HlhRfp3t0lAwIfFp8kuFBeNSNfk7C8LUIkCO2TALbFuEOgmUou/B44G7Tw6rTFmAeOJ+t8H0TBqAd8YkJIY/mydmuT8vIJjSxDmdWOE3Fm+RuxSi7EwvwZvIV7qpQjbSMNeoj5Fh5Wh1XC1r7agTXhC6vf7Mxtj38edQFTASS7NuByGP1R0t2gnMJEfzCm2JcPpXPhd95pFW7Y8mtdNyw3j1Cl3vhr2TSHd52PKp6ELlPaFenixFGAc2R27ib7lIzdDXFHpU1EfhqUMGZaZuDTfrmOjxMyBeFwJ05b8FQp+BHwKunLJBK81y+PGxj8SoS9CvOAt0hvZ0IJ9N6d/+RkVqeXkD5f0anCDuqS7I0//cYjLNySUbPkJM0ms1SXYYXFYsVrY4ZGlNbLr50UpTqOmorNPGOKz9U9Y+5HoJXejug5wn8xaK4j7ZwbOhWsKLLwnMuQtQVJYCWg1iji8ws3WfjhfjQZUSpuvYF7rcMj0o0OjZNavOX7q3flsm6AT6weYosdjsDgNVygP9c6YCPQcwXz7qjORs4DN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8304.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(54906003)(122000001)(38070700005)(316002)(8676002)(38100700002)(66556008)(86362001)(66476007)(4326008)(66946007)(66446008)(64756008)(76116006)(55016003)(110136005)(2906002)(8936002)(5660300002)(52536014)(186003)(83380400001)(45080400002)(53546011)(966005)(9686003)(478600001)(26005)(71200400001)(6506007)(33656002)(41300700001)(7696005)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dEVNblllYTNlUFp0UEdRTEQvcGo0dDk1ZXc3TUE1MWpkWG9ON05hUTI4L1BC?=
 =?gb2312?B?d25SRnNDWVpEMkc4ZFFtWm1wZGlBeTBaQmtuQTlqVVlpVW92UzcvVFZGajFV?=
 =?gb2312?B?SFh6QzNjaThEd2lxb1NkdjlRWVJJeHVWT08rYmg3NEg4Y2pCdTlOd3NTQ3o3?=
 =?gb2312?B?UTY4c3RWcUpBcThQaEpqK3NRMmdNZ3VrN1REQXdVeXFabFN1RXUxMUZCSzd1?=
 =?gb2312?B?amE4b3lKUjJaYldIQnlubld5d3JlUnB2dEZNSEt1NFlKOERXRUlaY0NMcStl?=
 =?gb2312?B?VlV5Qy9tTWVXTlVnVTMrNFVLeS8xTGdxb2R1WmtaalFlbWswSDZpTzdsWkdl?=
 =?gb2312?B?dytwVG9zbmFJNVp0UURpanFidzh4ZVo3R2o1a00yV0plTisvUVlJWHFJVjg4?=
 =?gb2312?B?YkpFRHZ0WTJkc2ZmbUhlWEFqR1ZRblJNOEhyWDEyNzRwNjFpbUhBclpnQUdT?=
 =?gb2312?B?UzM0QW0vUVZHTnlNRi94Vy9mSTNYQXZKdXdsa1kzSDByZFQ3WVoxZWhGajJO?=
 =?gb2312?B?SEZDaWQ4RjV2YWJGNm5BS2NzTWk5MDNiZWMwZERnK1NEQUZ5YlFtN3lLL3Fv?=
 =?gb2312?B?M1krQmVLb29hRlRvOFNuVlA0aGxGUll1MWNVRHhHV3Nybks5Vm4vRXRVMnRH?=
 =?gb2312?B?eHJoQUZKV1hpL0lDWU9pTkpzNVlmekVuMGMvaG4zM3FhNWR5YlREWjE1c2Fo?=
 =?gb2312?B?NVhML3ZQSW00VFY5c0had3VUWnlHNjhJbzNCbEZqUHlXdjhkL2NhMHFtZWdP?=
 =?gb2312?B?aDRENmo2c3VNaXc5VmVJUmtjR2VtTlllMXJzR2Z0S2RlZ2p4cnVHNmRIMU1i?=
 =?gb2312?B?N0FTdzV1N3FVU1VlcUdNdFNEeS93K083K0FjT1VmWWYwNGt5RmE1aXhIVjQ3?=
 =?gb2312?B?RjVCSWxncDVpbmh1aXBGZjI1UVpYWjg3b3hHYlFYSWxwSFNaM3hvUFNreDd4?=
 =?gb2312?B?SmoyRGNPZHhDL0FEWFdpa3V3eGt4eWRubGt6WWc5dlVCeXVONkQyZHlxYk5H?=
 =?gb2312?B?bWZPYmdCZHZXN0kwM0xsN0h2MFdCU1Y4YlpGQlpTS3UrZCtaYW1qbjc0bERK?=
 =?gb2312?B?NDZMRTJKSkQ3R2tNK2VJMkplcTZkZ0g4MEdKN0Rxcnl0WUMvQzhtUjg1eUJZ?=
 =?gb2312?B?NzR4aDcvZ2Uvd0E3bnV2WktZeVBXdWpFRXFvVTZOdUhCQnpUaTl2WDVPbkkr?=
 =?gb2312?B?V1owVVloSnBNcDlDRGtQeU54TUIrY2h6a0pEV255K2F1NHRreXdReWlINTcv?=
 =?gb2312?B?VWxleU0yVzgxdk11RStrTW01SEZQSjN5V2I4Szc4djhIOUpSOXVnRTJwTG9a?=
 =?gb2312?B?VHcwZUJsa3NCbnM4aThLVnVVeUM3WXZpaVgrbWE2SW5KQzNSNW8vbmtVa1Az?=
 =?gb2312?B?SEdadW4zbHhSQmZjSEVTbkVwSGpiZ0haUXZCajUwSE1JQTBlajZEK3p5clZh?=
 =?gb2312?B?OXM5MW0zREw3czVSWXV4RXM3MnJQanNCSGRFM1BkeHdsK01hamVNSW5oSlpp?=
 =?gb2312?B?RTF0bzhDZkptZGMyVXpJbHVHTVhXRUQ2TTlwakhxTkFuU0pUVjRxTFpydWJ3?=
 =?gb2312?B?ZDQzdkZQdjBiNit0Ym5IYzR5V1lqdUNDRUFUTVdQNU56dEVqcWVSbWdnSHJC?=
 =?gb2312?B?RGozR3JTejduTjlSMGhTZ0VJVkZIOW1Zam15aFlDeGZYN1ExVzQ2MWtmczAx?=
 =?gb2312?B?OWVteE10NVZNbzdnNThveGFQY1N3ZUpWOCtsZzdLb2oyamZJWHEvWkZDZndV?=
 =?gb2312?B?ZEh0OHJmYStVU2YvNWNiVzVjbFVkdmFKKzgyN0R1VmQ4Sm1KZEtEVGxqWGZs?=
 =?gb2312?B?SWJBTmcxQk5EdFBWVnVMSGRNUmc4SjA4clMyWG04Z2FIV2ppa29OdVJLd2pX?=
 =?gb2312?B?eit1L3RKbFJXM2tqaFZVY3MxdHB6Z3NHUUg4Qm15VVRydEJ3NkJ3a2pHYitF?=
 =?gb2312?B?TWNoODZzUWJJQVJ4ckkxY3czbDRLVG9ubFc3WHMyRjNScjFJVUJZS1IwYXNH?=
 =?gb2312?B?R3lyMUJKYll6OWZHTENRRERoVnlWNDBYUVdkUTM2YjFzV2RGREtuc0YySGNh?=
 =?gb2312?B?M2xRNFZ2RStPOGZITEFmc0xyL3M2OU9peWFocWVtRy9MVEd0Ujk1UGxSVS9o?=
 =?gb2312?Q?ymRHJwzZmNbwL8qjZKjrLxost?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8304.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4176aa1c-1584-4e2b-b3df-08da5b2b78b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 06:32:29.2289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXADTxw9l7hqtYHYpUh9nqE30dfzwzX74+F+PWHR5kuEtQjmMGkhQm6JelCS7rL1jOFUPVboMG+KJjEvTjf/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7577
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksDQoNCkkgdGVzdGVkIHRoaXMgY2hhbmdlIG9uIGtlcm5lbCA1LjE1IGFuZCBpdCB3b3Jrcy4g
VGhhbmtzLg0KDQpCUnMsDQpaaGlwZW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBTYW1pIFRvbHZhbmVuIDxzYW1pdG9sdmFuZW5AZ29vZ2xlLmNvbT4gDQpTZW50OiAyMDIy
xOo21MIzMMjVIDIzOjU1DQpUbzogV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz47IFpoaXBl
bmcgV2FuZyA8emhpcGVuZy53YW5nXzFAbnhwLmNvbT47IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPg0KQ2M6IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IExLTUwgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQpTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSBpMmM6IGNv
cmU6IERpc2FibGUgaTJjX2dlbmVyaWNfc2NsX3JlY292ZXJ5IGNhbGxiYWNrIGNoZWNrcyB3aXRo
IENGSQ0KDQpDYXV0aW9uOiBFWFQgRW1haWwNCg0KT24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMTI6
MjkgUE0gV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4gd3JvdGU6DQo+DQo+IE9uIFR1ZSwg
SnVuIDI4LCAyMDIyIGF0IDEwOjQxOjU1QU0gKzA4MDAsIFpoaXBlbmcgV2FuZyB3cm90ZToNCj4g
PiBDT05GSUdfQ0ZJX0NMQU5HIGJyZWFrcyBjcm9zcy1tb2R1bGUgZnVuY3Rpb24gYWRkcmVzcyBl
cXVhbGl0eSwgDQo+ID4gd2hpY2ggYnJlYWtzIGkyY19nZW5lcmljX3NjbF9yZWNvdmVyeSBhcyBp
dCBjb21wYXJlcyBhIGxvY2FsbHkgdGFrZW4gDQo+ID4gZnVuY3Rpb24gYWRkcmVzcyB0byBhIG9u
ZSBwYXNzZWQgZnJvbSBhIGRpZmZlcmVudCBtb2R1bGUuIFJlbW92ZSANCj4gPiB0aGVzZSBzYW5p
dHkgY2hlY2tzIGZvciBub3cuDQo+DQo+IENhbid0IHdlIGJldHRlciBmaXggYSkgdGhlIGNvZGUg
b3IgYikgQ0ZJPw0KDQpZZXMsIHdlJ3JlIHdvcmtpbmcgb24gZml4aW5nIENGSToNCg0KaHR0cHM6
Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbG9yZS5rZXJuZWwub3JnJTJGbGttbCUyRjIwMjIwNjEwMjMzNTEzLjE3OTg3NzEtMS1zYW1p
dG9sdmFuZW4lNDBnb29nbGUuY29tJTJGJmFtcDtkYXRhPTA1JTdDMDElN0N6aGlwZW5nLndhbmdf
MSU0MG54cC5jb20lN0NjOTU5OTY1N2M5ZDY0YWU0M2JkMTA4ZGE1YWIwZWIwYSU3QzY4NmVhMWQz
YmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mzc5MjIwMTMxNTEzMTIzMzAlN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9
ZGpEWjhnTlBHbklLejdEZlg0dzNwc1pmNDR6SG5waDdGZmxPTGElMkY0UW5rJTNEJmFtcDtyZXNl
cnZlZD0wDQoNCkluIHRoZSBtZWFudGltZSwgdGhlIHBvc3NpYmxlIHdvcmthcm91bmRzIGFyZSBh
bGwgbW9yZSBvciBsZXNzIGhhY2t5Lg0KUGVyaGFwcyBhIHNsaWdodGx5IGxlc3MgaW50cnVzaXZl
IGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGFkZCBhIF9fY2ZpY2Fub25pY2FsIGF0dHJpYnV0ZSB0
byBpMmNfZ2VuZXJpY19zY2xfcmVjb3ZlcnkgYW5kIHVzZSB0aGUNCmZ1bmN0aW9uX25vY2ZpKCkg
bWFjcm8gd2hlbiByZWZlcmVuY2luZyBpdCBlbHNld2hlcmU/DQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgaW5k
ZXggZDQzZGIyYzM4NzZlLi5kZGE5M2M1NDcxZjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9p
MmMtY29yZS1iYXNlLmMNCisrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KQEAgLTE5
Nyw2ICsxOTcsMTEgQEAgc3RhdGljIGludCBpMmNfZ2VuZXJpY19idXNfZnJlZShzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmFkYXApDQogI2RlZmluZSBSRUNPVkVSWV9OREVMQVkgICAgICAgICAgICAgICAg
NTAwMA0KICNkZWZpbmUgUkVDT1ZFUllfQ0xLX0NOVCAgICAgICA5DQoNCisjaWZkZWYgQ09ORklH
X0NGSV9DTEFORw0KKyN1bmRlZiBpMmNfZ2VuZXJpY19zY2xfcmVjb3ZlcnkNCisjZW5kaWYNCisN
CitfX2NmaWNhbm9uaWNhbA0KIGludCBpMmNfZ2VuZXJpY19zY2xfcmVjb3Zlcnkoc3RydWN0IGky
Y19hZGFwdGVyICphZGFwKSAgew0KICAgICAgICBzdHJ1Y3QgaTJjX2J1c19yZWNvdmVyeV9pbmZv
ICpicmkgPSBhZGFwLT5idXNfcmVjb3ZlcnlfaW5mbzsgZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvaTJjLmggYi9pbmNsdWRlL2xpbnV4L2kyYy5oIGluZGV4IGZiZGE1YWRhMmFmYy4uNzMxMGNi
ZGJkOTQwIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51eC9pMmMuaA0KKysrIGIvaW5jbHVkZS9s
aW51eC9pMmMuaA0KQEAgLTY2Myw2ICs2NjMsMTAgQEAgaW50IGkyY19yZWNvdmVyX2J1cyhzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOw0KIC8qIEdlbmVyaWMgcmVjb3Zlcnkgcm91dGluZXMgKi8N
CiBpbnQgaTJjX2dlbmVyaWNfc2NsX3JlY292ZXJ5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCk7
DQoNCisjaWZkZWYgQ09ORklHX0NGSV9DTEFORw0KKyNkZWZpbmUgaTJjX2dlbmVyaWNfc2NsX3Jl
Y292ZXJ5IA0KK2Z1bmN0aW9uX25vY2ZpKGkyY19nZW5lcmljX3NjbF9yZWNvdmVyeSkNCisjZW5k
aWYNCisNCiAvKioNCiAgKiBzdHJ1Y3QgaTJjX2FkYXB0ZXJfcXVpcmtzIC0gZGVzY3JpYmUgZmxh
d3Mgb2YgYW4gaTJjIGFkYXB0ZXINCiAgKiBAZmxhZ3M6IHNlZSBJMkNfQVFfKiBmb3IgcG9zc2li
bGUgZmxhZ3MgYW5kIHJlYWQgYmVsb3cNCg0KS2VlcywgYW55IHRob3VnaHRzIG9uIHRoZSBsZWFz
dCB0ZXJyaWJsZSBwYXRoIGZvcndhcmQgaGVyZT8NCg0KWmhpcGVuZywgaWYgeW91IHdhbnQgdG8g
dGVzdCB0aGlzIG9uIGFuIG9sZGVyIGtlcm5lbCwgcGxlYXNlIG5vdGUgdGhhdCB5b3UnbGwgYWxz
byBuZWVkIHRvIGNoZXJyeS1waWNrIGNvbW1pdCBlNmYzYjNjOWMxMDllZDU3MjMwOTk2Y2Y0YTRj
MWI4YWU3ZTM2YTgxLg0KDQpTYW1pDQo=
