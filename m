Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D696D5E5465
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 22:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiIUURw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 16:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiIUURu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 16:17:50 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750C3A1A54;
        Wed, 21 Sep 2022 13:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajpWIxzlPYVbyfLKKLUxvFeRmVcD4ax1wN42I4SwJUnbt1L5Q8NV+x9Ak+2A2fXfD+yVMxk3u8EKYU4htfq01Wp3q8HV2PnkBIR6i9wAJjOr797XD9mnFg04uKmak5Qa7lbfnokSn08cbBzAA1NJmVU2z382127YkTMVWht9diFyDQHmg/lPMXGMfBRl4HAIK3hb++8++K+NRBS2JPpW4Mc9JYue9zNBUA01UyYsksEdmHIc75oRDFqZoJoM9YmnEdYgJiYAjeRsJxTnaX9R42YVFxmbH9DidwRu5lf/2jTezUVpmjit/eTUBbKAzSQL0kpJ3k84zL4GNAFFB8NJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN/erepkPBFZqDO13kxlE2xkzhQy/If6UJU+4y9Ce2c=;
 b=jitPYev3HNrxe07RZ/LR3S0trz22IGrM/U55sgx40ecv3hR++xWMu1pTJzw1TZsn5VPvrPltz7VBJQD+u7Fe8YV1FK7F2NTjmd6UoP+iXBvPEMo4rQrWW+PFfSN28ahbXqgMM340Z1z29Re79MIKXwJ9oayGSwBar53ok1PMQ1XlTu/QnzW+OwfHsucqJJqBtL8aCDI3e/IXetLnY1WcR646xzj4yVAP7qdnLePTk+60fMsvMJE2H6xPD1sS9YeZZf06u9lvrHTaKwHKiHfx/krcfG3HmcWM1ETTsJyDYyU/Wrvhgq2UxEkhDZ+lx0/fu8JL3rAm362tT2wF5PooQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN/erepkPBFZqDO13kxlE2xkzhQy/If6UJU+4y9Ce2c=;
 b=aENjxe4Smz5wKegPZwKrB4FC5IHBj1SG7bElhbe0xo11WIBO1A0dmvWWgvm/pJFUT5M+YexxoDV7a/Jq+YEEmMmDJkx1olSJ6wBrsKuHiRo+LWG9nJH6Xoq1Z+MKukwyPRpQSODlgu/rLVZvdI7pn2AbO6QpMJ3l3Bz5oxjwmKZKoAVGa5LekF9HHSX1CCHS86G2s3No4doyGNKC9hxfEx0ZdgsqVnooNUWblmBb78mt3Rn24MHpi3tRgbqLm7R3tLz2oThdkzwNflZPrXwLc1rsy1pSLyloq1h18fIMZL88cxTDzEn5pSNJhuJcCcVlKrUWbkcuJ9VjGwfe/rDJ9w==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Wed, 21 Sep
 2022 20:17:44 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 20:17:44 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: How to remove DT support from a driver? (was Re: [PATCH v5 8/8]
 i2c: i2c-mlxbf.c: Update binding devicetree)
Thread-Topic: How to remove DT support from a driver? (was Re: [PATCH v5 8/8]
 i2c: i2c-mlxbf.c: Update binding devicetree)
Thread-Index: AQHYzfUF4sHTA+d1NEqXr8XeY0T7cq3qTqcg
Date:   Wed, 21 Sep 2022 20:17:44 +0000
Message-ID: <CH2PR12MB3895AE09C7D7F8B8A09A6382D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
 <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <Yyttt3DiQpMZYejA@shikoro>
In-Reply-To: <Yyttt3DiQpMZYejA@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|CY8PR12MB7434:EE_
x-ms-office365-filtering-correlation-id: ebe55d9d-a5f6-4ca2-1823-08da9c0e57f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x7ECaPd/mOE0To6fCz9RnbYynNomUbsWOmibkVhNpa0UQKz+JWGu2e6AiZg1d1qE00Fe4RrflBe5ueBSVD3imhwtRO3UJY+YZeg33quZJtnSczDPKHmkzvl+8kwx/Kvrf08RLomKpeH4NUdDczpFo5F+PlbVwGy+sRd6FiO+aANFeqEgWvuYvcy8JF1jXeKuv1TPkrxmyGeVTA8WN3tVUt6h2LLSeyLv62jCcL0j9tl+IV2h0IyrSl3qCrBWaE0hvaquIpOD3wXy71f4NnjAvBircjjDPAK23xWfcTtLqwsE4rA9gdaT85Bgd3LsSozXr9FCw4MzANKJVA7ceQ4oS8ndA7st0jvhhp6LNQWfJexqLqCCKEmsgroDPbM6CRwnCead8TuvKxp/MOw5eRhsThFFVNFNY+qjcSvISGwfYj4C8HCsQ/UD+FW6jBA6UdFaP6FH/RyPC27jcO0ufvc2dMCE3G1HhydyGCeMtfjbOSzG8ljDYAfcEkt8rlV6SZqNnlE6YVLJM4e27aBQ0pH/cB0Gd5ngXvb8tXZWV+UB/T6Xm4iKxZg4QT535GTZiT/aHbfg743Ggi2rK+AFqa3mFB8K1YcVqc44H1puLTKcSNErZYESNPHgLqnLy6Q14HTaRdj2d4XW+DccTdr6eEPY/8cwMq9Ny+eHIgonA+ub8q1iEFAy+v2A6/wvTzaNa/2/TjMC7KOZNyrJEqEWiuXp56958btGAEAG9/6a5NMD+yq0oRBhrGPrqdSRU3lvB5GuK6oN1OEVixy7CTYSc4vBM0/NWjmURnC5w5CKbUYWIm1iag1Fl+oCvKtl7YQsS/06xkSy+yu9R1xVJyjVm6ZAagSM2Sz5+sVprynL/PSe7vg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(86362001)(55016003)(33656002)(122000001)(38070700005)(316002)(186003)(71200400001)(6506007)(7696005)(107886003)(38100700002)(8676002)(478600001)(9686003)(966005)(54906003)(64756008)(66946007)(26005)(4326008)(66446008)(8936002)(66556008)(53546011)(41300700001)(52536014)(66476007)(76116006)(2906002)(5660300002)(15650500001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODQ2Z3dOdWZ0NUlIYkwvb3d6YWZUUCtIYVRER1JkeDcwbWwzbExaWkY0eTds?=
 =?utf-8?B?N2o2OWR3cUowbUhvWFp3UVNQMmFCM21ySzRnQXpsTkVSSEpxMzBxek1sY1ZS?=
 =?utf-8?B?cDk1ZmJtNkFlSGlDbTNsQUxRWGhGMVdzMWtDSFVMbE5Fa1JwU1cwdnk1dGR3?=
 =?utf-8?B?Z0MrdXJVR3ltQUZwcFRLRFFibG1tcDBRWEJmeEJ1Zk55a1ZIZU5GdjBONi8x?=
 =?utf-8?B?QlBJQUlUTCtJWWZZakVVc0hjaWZsaklLaUlwRlhtVFdGL2taUHl1TTdyVGJL?=
 =?utf-8?B?MjhBUUJHZDZRTmVPQzRFNWY5TlNSWWZlSlE4SFpyZHpNM3YvZHNSbkp0KzFn?=
 =?utf-8?B?VjhTYVF3Yy9TVE1QNEM3Ui9iemwxbkk4dk40VlJBUDRrWXphVFJNMkk3Z3Fo?=
 =?utf-8?B?enRXeHlGUFBJdndOUEFRazMzWGwvdUIwS2FhNUFjM1FPaDFOTEhseEZVcHVK?=
 =?utf-8?B?WTFWTGJwcmhFUmp2akZjUStmbmY2WENTalN0UnB4TUxYZDl1ZTN2aTIrdU01?=
 =?utf-8?B?cGRVYkpBOW91bmZsZDNveHc4VFUycm9BY2YxSDMvcFdqeVBQWXljVjdwZEVJ?=
 =?utf-8?B?ZDMrbitGcnFnVkMxckpxMlpYSmpLWjdRSXRmbWdzSWxjRk1WcmoyQi9Mcmww?=
 =?utf-8?B?OWhHUnBUdDIxZEtaZkZoR2c3YXNvTzNOYlpZTkoxOGVnMjBCbHUrOUI1UE1U?=
 =?utf-8?B?WVNNanl0YW5kbUlTamlZeW1uWERCcjJVTkJGZ3pZalRyQUFVT241TjhaRGdW?=
 =?utf-8?B?cHpBR1BvK1h4YlhzQWFxUjlkMEx1MVdNaGFwTWJhNk1DUTQ3S3ZqMnU1U0Qy?=
 =?utf-8?B?UWlmSnB4Yk9lMmwrRGJNWEdHczYxUFAwTTBhRU9JdFREUWhqSGVZZ3htTktJ?=
 =?utf-8?B?RTY1dTJMK2RESEhwYTZyVXY4VFBLNEdocERKSTM4UXA1VnNnbGNraWZhMTRQ?=
 =?utf-8?B?cldSc3Mwa0txWE5pOEVwbkNBMGpleWhrRmZ2dkhuQ1N0VHRvTkUvQVRHZzhv?=
 =?utf-8?B?V01iSlZwVWt6Z3k5NGlyMHlhY1hmOVZKZVhGOStjRTJ1Ni83Mm9POUgwaHY1?=
 =?utf-8?B?djJMWVdEQ3I2dTJ4WG1sdjZ3Q2trRWtvYXJ3Qm9WM2ZJMjRha2JOMEpuK2c5?=
 =?utf-8?B?WlNmMVBnV2wrekxwYlA2ZjFMNXU5MjNyZm5sVTBwSmRRZUZQTEFYQVJZSVY3?=
 =?utf-8?B?QnlocXFqK2FNV3pCTkNyUUo2TVpYTTJwS043NUpEaWZrN3laL1NIZmpLc0pi?=
 =?utf-8?B?M21GaExuM2s5MzNRYVFJK2lsWnpudm4ydS9XbDIwaWJYL3BQeWtwOGlzSjBU?=
 =?utf-8?B?dytrVEhlc054SURKNFYzS0tjak1PMmNhc0htRTNORWtBNVRiSFJOMHVBWE1v?=
 =?utf-8?B?N25tUjVDZiszalFhbFQwWVhyQ01wYUVDZE5DdWp4U1lNV25IZzFOcFpZUUpm?=
 =?utf-8?B?bGN5N1JhbmVmT3pRNExXMXF3VEtDMTAyVmlwNzlqMmZSbTFoTFFNbkdSbFl4?=
 =?utf-8?B?eklnR24yUGFaTC9HVlRFRFhVUHFVMCtaNjBqT1NGWXRCVTBGVkc4eTUxTXo3?=
 =?utf-8?B?WURhYUtWU05OS21jWW1Lb2NxNG5tSU1IWW1XZVJ1VzRETFErOGNET2RxeWU3?=
 =?utf-8?B?T0FWSFk1ZkJIcTA1bzViRUt3U01kK1AyMkppN0pCanhzSTl5SXgvUnJFOHFy?=
 =?utf-8?B?R2JocXJSNGgzbDBTV2Z2bHBFREFoZ21UbGZqYTF0TVRhNlNiWUpCK1o3Yy8v?=
 =?utf-8?B?U0V6TGovVFBRMDR2MWZZZGNVN3F6aFJZRWhjRUpPMnNqcVhOalJFdWpLNHdI?=
 =?utf-8?B?anMwRytkd1dYQzVXWWZacUJMdGRYV1pkcjF4ck5ReGk1Q1hVemFuUDJXaWI1?=
 =?utf-8?B?NENZZW81TkdTZS82M2RYZzc0K3MydVRnZmJDbzJaY3NneEZtSkw1SWhURVRj?=
 =?utf-8?B?OWdSVndzdnRKVXY5eWZTMFR5NzFGTkVnYjhkZ0tkVGE0U3NQaHRWbkdKb21D?=
 =?utf-8?B?bUtCbnhpYjd5Z0FhdXlsVi9BSkdkKy9DU0FXMzViKzJIWGN3NTA3L3hJMFdt?=
 =?utf-8?B?SEkxcjVQbUUvZFFlMHYxUk1pQjF5MmdmZmxJRjJLSEo5RTZkSHM0dkgzUjhx?=
 =?utf-8?Q?ZirU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe55d9d-a5f6-4ca2-1823-08da9c0e57f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 20:17:44.4902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eI+PbFXsZj4tu81zIvgPHNmFyLQk4m+uURgPx0qNmYW3ycgZwqk0ZvSfzAfYyaDV0JsM4VGh7op4hJlmsncsVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzIGZvciB5b3VyIHJlcGx5IFdvbGZyYW0uIEFsbCBjdXN0b21lcnMgdXNpbmcgQmx1ZUZp
ZWxkIGhhcmR3YXJlIG5lZWQgdG8gaW5zdGFsbCBvdXIgaW50ZXJuYWwgRmlybXdhcmUgKHByb3By
aWV0YXJ5KSBiZWZvcmUgYm9vdGluZyBhbnkgY3VzdG9taXplZCBPUyBzbyB0aGV5IHdpbGwgYWx3
YXlzIHVzZSBBQ1BJIHRhYmxlcy4gU28gSSB0aGluayBpdCBpcyBzYWZlIHRvIHJlbW92ZSBpdC4g
QW55IGZlZWRiYWNrIGZyb20gdGhlIERUIGxpc3Qgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRl
ZCEgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXb2xmcmFtIFNhbmcgPHdz
YStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVt
YmVyIDIxLCAyMDIyIDQ6MDIgUE0NClRvOiBBc21hYSBNbmViaGkgPGFzbWFhQG52aWRpYS5jb20+
DQpDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgS2hhbGlsIEJs
YWllY2ggPGtibGFpZWNoQG52aWRpYS5jb20+DQpTdWJqZWN0OiBIb3cgdG8gcmVtb3ZlIERUIHN1
cHBvcnQgZnJvbSBhIGRyaXZlcj8gKHdhcyBSZTogW1BBVENIIHY1IDgvOF0gaTJjOiBpMmMtbWx4
YmYuYzogVXBkYXRlIGJpbmRpbmcgZGV2aWNldHJlZSkNCg0KSGksDQoNCj4gSSBoYXZlIGEgcXVl
c3Rpb24gZm9yIHlvdSBhbmQgV29sZnJhbSwgd2UgZG9u4oCZdCB1c2UgZGV2aWNlIHRyZWVzIGFu
ZCANCj4gYXJlIG5vdCBwbGFubmluZyB0byB1c2UgZGV2aWNlIHRyZWVzOyB3ZSBvbmx5IHVzZSBB
Q1BJIHRhYmxlcy4gQnV0IEkgDQo+IHRoaW5rIHdoZW4gS2hhbGlsIHN1Ym1pdHRlZCB0aGUgZmly
c3QgdmVyc2lvbiBvZiB0aGUgaTJjLW1seGJmLmMgDQo+IGRyaXZlciwgaXQgd2FzIHJlcXVlc3Rl
ZCBmcm9tIGhpbSB0byBhZGQgZGV2aWNldHJlZSBzdXBwb3J0LiBEbyB5b3UgDQo+IGtub3cgd2h5
PyBJcyBpdCBwb3NzaWJsZSB0byByZW1vdmUgdGhlIGRldmljZSB0cmVlIHN1cHBvcnQgYW5kIHNv
IHRoaXMgDQo+IGRvYz8gb3IgaXMgZGV2aWNldHJlZSBzdXBwb3J0IGEgcmVxdWlyZW1lbnQgcmVn
YXJkbGVzcyBvZiB0aGUgYWN0dWFsIA0KPiBpbXBsZW1lbnRhdGlvbj8NCg0KVGhlIGZpcnN0IHZl
cnNpb24gc2VudCBmcm9tIEtoYWxpbCB0byB0aGUgcHVibGljIEkyQyBtYWlsaW5nIGxpc3QgYWxy
ZWFkeSBoYWQgRFQgYmluZGluZ3MgWzFdLiBJIGRvbid0IHNlZSBhIHNpZ24gb2Ygc29tZW9uZSBv
ZiB0aGUgcHVibGljIGxpc3QgcmVxdWVzdGluZyBEVCBiaW5kaW5ncy4gTWF5YmUgaXQgd2FzIGNv
bXBhbnkgaW50ZXJuYWw/DQoNClRlY2huaWNhbGx5LCB0aGVyZSBpcyBubyByZXF1aXJlbWVudCB0
byBzdXBwb3J0IERULCBlc3BlY2lhbGx5IHNpbmNlIHlvdSBoYXZlIHdvcmtpbmcgQUNQSS4gSSBk
b24ndCBrbm93IHRoZSBwcm9jZXNzLCB0aG91Z2gsIG9mIHJlbW92aW5nIERUIHN1cHBvcnQuIFlv
dSB3b3VsZCBiYXNpY2FsbHkgbmVlZCB0byBiZSBzdXJlIHRoYXQgbm8gdXNlciBtYWRlIHVzZSBv
ZiB0aGUgRFQgYmluZGluZ3MgaW50cm9kdWNlZCBiZWZvcmUuIEkgZG9uJ3Qga25vdyB0byB3aGF0
IGRlZ3JlZSB5b3UgY2FuIGFzc3VtZSB0aGF0Lg0KDQpNYXliZSB0aGUgRFQgbGlzdCBoYXMgbW9y
ZSB0byBhZGQgaGVyZT8NCg0KSGFwcHkgaGFja2luZywNCg0KICAgV29sZnJhbQ0KDQpbMV0gaHR0
cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtaTJjL2xpc3QvP3Nlcmllcz03
MzgyNyZzdGF0ZT0qDQoNCg==
