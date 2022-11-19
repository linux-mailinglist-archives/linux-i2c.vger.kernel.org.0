Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77242630CFD
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 08:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbiKSHjG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 02:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKSHjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 02:39:05 -0500
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120088.outbound.protection.outlook.com [40.107.12.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903836B9F0;
        Fri, 18 Nov 2022 23:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx+0fvr3j35PMFEayGvOjCzcvCQ3Xv1V217oSgQP989FAfbPHBlx5BHR/y+nhEz3CIYqVh4GUua6RQbBnNOKDrxe6TE1MU72z3CWC8TJ2oLjtcFcC/vOhSgjFCp8fvt8fXKeTLIv0ftSIXsYxL26uCyJwW/tND87AQn037SCcGOSJbdHNSs0fN7GEWwNfkBwm5EXmr5PD8vxkIOVwHDG2N+UgvVPjvUI9tnQ6P3wweSmenwwsKHHhSKKwooQpPYRTDXpPTx1vdKtSubej6Skcxs66my1li1wJATI1AxH7DUr4KYoCNU2yFElxaX6gj5keYBf/dmVK3NJBie1EQWXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm1bBQ0NZ1S7qrqFXSqG02l4h1ImG6L81gRoQKQjZx0=;
 b=HthOL2yLZhsP+HRloRwSfnazQAjp0qZ3LAWArDetNXknnyqyesbHbaO7CiPbJ6QXjsYRxCN7NIxwoSN84qh2KRJ4oWrJBzUm9+Is73sCqh8m2kIkhxkS+txmNc7yKyZsZqEiXgLtsKtwd7DwgJcoZBdYxV4znA20gE14EckVKSOnDvXNNYOpMZE+nF3AkP8ykiy2PBluZ4w1M35BoifQ0hU3Bax875otBCyFwMsCK+IZfh2+lfZfOVDmU0vVvZ5LyqjQEyLw4Ypd/KkyQz1Xnt0UvMvilvt4dL1fglrFn2qnCfThqkIcnHXN1Uav1b8MM93z7dW933De8t+d2zONVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm1bBQ0NZ1S7qrqFXSqG02l4h1ImG6L81gRoQKQjZx0=;
 b=ipwo/4vYUEyoOT9PuKO2dCw1/fFFIYW6ORT8kopKl+Mpm//KH965WW0vbpoLbsnn8y/xjRSFiIo0xlzs4GVssnCP/7jXBBBwMGkjYI+de+lHOdtypRhfLlCbE5yM49X+SHm6wKN9I+075LdnxplOTku8KCf1eSFK0+FxlwqDpnuhHhuy7yrLUCGfG72vjWDPynl+t7cLXXKUcpkvdn7FXBZvbiZRwbCaJR5AtTNRHThi8tSkRGkjcR46S5iFZ9jZfSRbJr920UwDfCkgrxj0pkABCFsQtPLcXBBblPqWsEdI2ewaHn5F9aonyQry1jR8PTwHLGwcbmO8YNdBZ0e0+Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1717.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.9; Sat, 19 Nov 2022 07:38:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 07:38:58 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Minghao Chi <chi.minghao@zte.com.cn>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 289/606] macintosh: ams/ams-i2c: Convert to i2c's
 .probe_new()
Thread-Topic: [PATCH 289/606] macintosh: ams/ams-i2c: Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5+/Ga/O6Mma8E+IACdP5oxDG65F3LmA
Date:   Sat, 19 Nov 2022 07:38:58 +0000
Message-ID: <1d2ae1bb-d4ba-35cf-63b6-f23a0187a223@csgroup.eu>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-290-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-290-uwe@kleine-koenig.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1717:EE_
x-ms-office365-filtering-correlation-id: baf3aba7-3626-4383-3b06-08daca011eec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h6dcJOAIgS6yD35btAcaNSK4lB8KSmaVzXeEzgc8+gtI6HHC16oUfhCMdw0L3xGzJgFVXdH5oev5ko/IzsoAJTV5R+j+ll1VfUfoKPMiivmdYzdbDToj8t+lpXTadBwIK66ne3wwZMbNUyXB2soZ7YtVhJgDolSxSK7RfiKrvl/yiSRhKXkSXtIwWERVvMFcP/hbulXmHeZ0YwR1y+J8R3ute17VgEoEH09KhCZ/C88jr/GccGfejAm/Uz7iMSwt9Zl+fCphAhyxBO3iGxcDi20cBuBKgn7HVQoCKeu+U+ed2pTc/nTrztlj4JC/Cj+rYDyhMltv+9+BhYQJbfoBLlkzfQAMD/x2egVJz0YyE0JDXMhYRxLAQi3ymIIYD0Is9cyqWXsYvXsieoZUsit17o/lsPuXjz9lKkimWLFA4Dl0e8ekL0kXA8hshwj16YhIv6HFLK2SViqYZhof3IpMv1EqCmjsQm4D6Bx8+IqhnkuTQUwKdHsW9HdEgGSeHwE6/zvbTL9x28nJbStjx3pw7wctCx1xJpdCoBOgwKHeVRhCeVBw4Oe38p26AYzvnbocDFlEm4CoS38MoS/4uN81N9But5oJbvO6GFNKgn0o7XUm5kojfjzrSsZ8fNte0rJIPmiSCxObFiHAXXrd3FVnuFiAVcHkOpDvueC/4E5t4GKExXNen3rneknk0GkmDY+/woYAWTlLrYgDFihPEW8vKI3ncIAAk+CL1+x0dSnj2jN1191WSI5/E5q31KCBDlhJv6z0aY3dyG2F+jzVMS1gt5ugHqoueZteegVkr1KXHagCB/05A61yiVEqSEpZFF3vPHIXgOt5ztrBCP15iHeQyUqwQ7Wwdt+aFmX4ncd3cVcHtRSJdEy659yXFJ1bOTg+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39850400004)(366004)(136003)(451199015)(31686004)(83380400001)(44832011)(7416002)(8936002)(71200400001)(86362001)(31696002)(38070700005)(36756003)(2616005)(186003)(38100700002)(122000001)(91956017)(54906003)(316002)(2906002)(6512007)(6506007)(26005)(66446008)(66946007)(66556008)(66476007)(64756008)(41300700001)(8676002)(4326008)(110136005)(76116006)(478600001)(6486002)(5660300002)(966005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGFhVUlHMHM3NlU1MVBkN3RlL3AyWWpsNStiaTFJcFFpOFhBMyttdkhjbVlT?=
 =?utf-8?B?STYxNmFmVlhBT1p6dk1IMFd2SkJ1c0k5cXhxdEo0NC92a0RiMUR0dmZtaHJN?=
 =?utf-8?B?ZjRVRzVnRzN4T3plcWxoNE9GZkI3K0FtVGNGQzlkMXhKVmhkZkFLVVVuYm1x?=
 =?utf-8?B?RFlPMW1NTDdHU1paWG5pdjA2eXlrRmJscldYcHFvODBEREdzZVQzQlpFOURM?=
 =?utf-8?B?cnpwb1Q2aXpVbTNVZFNLUksxcU9SRUZkeWpUdnQxQzYwYUp2UVpDRWprd0NL?=
 =?utf-8?B?bDVIalQ2MkpYODBNbmhYTk9wMXlXOVU0bmtwdVBBUGJjNGovcmRpRzlPQTdY?=
 =?utf-8?B?SXFhcER3d0tkTlZidnlkdlA1VXV3ejFQUUdqNFNRaDNqbFozMm4yMzVqaXFv?=
 =?utf-8?B?OEQ0QTdTMHBOM1JZck1lUFRTRVRlTGxGMWFhYlVqNlVFVFB5QmVhb0czNFJQ?=
 =?utf-8?B?b3RKL2NvcG5jMGt1ejFyRGZRUDRMSDdpYTZoc0x6OE45MDAzYmJIeE0vV0hF?=
 =?utf-8?B?MkEwQjdEMUxrS2Y3TkJ2b2dvT1VWNU84R2VtNm9naFBmR1FwUklUeE1LYVR2?=
 =?utf-8?B?T2FyNk9pVGF4Ym9Hek5wT3J1NENNcGp4TWpJN0hvS21VeU1GOHgxK2dSNWcv?=
 =?utf-8?B?dFloWDd5RWtMNXN2MDgzNzhkdjVHbEZGYzlaakEyQSttdVdMUXRzeUxWNmJu?=
 =?utf-8?B?QW1UL1F4eVhjTE5ZL0I2WENDYUFlRDBMbnNJSmZOQzRVdFd1aDR1aU12aVZB?=
 =?utf-8?B?Zm1ua0VGQjBiK2NVYUxiaGx3RXQ1RlZiblVOSEhMSmxkN1ZTS1lDTnZVQ2Ry?=
 =?utf-8?B?THNkV3kwdlNQZXJzZG1yblpBKzZuYzB2Q0JYRXFOSzA4azZrakhNVHlXNi9R?=
 =?utf-8?B?Q3ltSXp1VDRwVTFCVHVOQmRCVHRxTndONFE1b2dCdU1mWVBtamF0VkJSc29t?=
 =?utf-8?B?ZUxZSGxzUGUvV3lPQUw3K2krZkNaaVg4S3NTOW1VQThrNkw0TTJPN1RGaEVZ?=
 =?utf-8?B?dkkyUFBmWnNiQnd5SHN1RU50TWNZejltYkJHd2xEV2NHZjlwd3VaOFZuOUJV?=
 =?utf-8?B?L0Vmam54SmNJdGJTaWlYQ3Z2WGlXeXZxWDJiUHV2UGdWS0paTVNQZGg0OGxn?=
 =?utf-8?B?cHY1bmtWQkgwZHFCOGZURXFrbkN4ZWtLMTBPdnJzK0dzc0NkZElUcGtadmF0?=
 =?utf-8?B?RjBiaUFySUd1V1hlVm1YVkUxenFGODViTUlQejRxODJiK09kZUtUM2MyQlRI?=
 =?utf-8?B?Qi9OWnVmbWNPbVhHd3piMm8vM1FFanArSzdDNkNrdFZEQXpDMWdLYUZhWSs1?=
 =?utf-8?B?S1diMjl3dU9DMzN0bG9YZVc5dFMyQ05mV3Vid1lGeFFHK3dNSDc1eDdqZk82?=
 =?utf-8?B?dDVla09IRWlHTXNrODN6YVBFWEkzUzVzcUpxLzFQWXlaUnZBYk9TSW5sSUVh?=
 =?utf-8?B?SkdDOTV2c1N2OW9xWnQ0SzVyQkhZazBFQkNkdGs2cm1LVCt3S0cxUzZWOU5O?=
 =?utf-8?B?aE85TXVyZEoxM3l2NUg1TUFOcUdpRUpKNk1LdUdrY1lFeGYxcm8xRDJxdXRY?=
 =?utf-8?B?SFZ4RWpYN0RBM3g3a2RxbUZ3d3pnSGY1azkvZzMxRkFpVWZlbWNxRWdQK1Uv?=
 =?utf-8?B?Wmhvc2N5eVlpS3hHRjdOdTdnVTF2aktKNzJWYWlXMFhIb25obnlQQkM1bkgz?=
 =?utf-8?B?dHcxeUZobzh6Qzd2RTNiNHUwb3N0RUJBczVpcmpCY0JvTGV0NU1GNGNZL1Ns?=
 =?utf-8?B?bHNEcGpzMkIzbjFpa2JoSzdHM1FHME1FaDMwc1dDZEViQlUwOHFmYVVBQUxL?=
 =?utf-8?B?eDVPc2N6QVMzMFk1ck9vQytYNVdRWDRMUnRlVU9jUlhiMmJpREhQK1R6WmV5?=
 =?utf-8?B?M0pLRU4zV2FuUVdFWGY2ekhTNjhnTlNtMUorSjBUYzZaM0hJd0QyZUI5TGRY?=
 =?utf-8?B?WEx2WWxsNWVOMkpHNGE2ZkNGbzhrRE1VR1Z0U3NkNlNrN1BwcElWeGFacmdS?=
 =?utf-8?B?QktnU3VQSnBjakY5bnExWXByM0k2b1RQV01RVDMrb0E3OFVheFFpaFFQUDU0?=
 =?utf-8?B?UG5jUHBzU2pkcUNtdHNRVG9MMjJMQUJoWldnL3JlUVlVOW9tN2Qwd0ZyQTdh?=
 =?utf-8?B?d1JRRENYMU9DRlROM1lDL0xOT2ZqY0hTNnpFV1FHNEtXN2lGNVhZSlQ5a1FT?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4DE39AA3104654EB943302E6A978807@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: baf3aba7-3626-4383-3b06-08daca011eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2022 07:38:58.8456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oqf1+J2Oo4RLo8FO0BR71xL83hB8sJVK+J33geM2a7PYQiWnTMjhnbDmeVFAaoy5mNuJNb5TnT6RjqkvNOoW636AEtTVMN7yhSMo+NjJIkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1717
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCkxlIDE4LzExLzIwMjIgw6AgMjM6NDAsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IEZyb206IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+DQo+IA0KPiBUaGUgcHJvYmUgZnVuY3Rpb24gZG9lc24ndCBtYWtlIHVzZSBvZiB0aGUgaTJj
X2RldmljZV9pZCAqIHBhcmFtZXRlciBzbyBpdA0KPiBjYW4gYmUgdHJpdmlhbGx5IGNvbnZlcnRl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+DQoNClRoZSBwYXRjaCBpdHNlbGYgYW5kIHRoZSBvdGhlcnMgc2Vl
bXMgb2suIEJ1dCBjYW4geW91IGdyb3VwIGFsbCANCm1hY2ludG9zaCBjaGFuZ2VzIGludG8gYSBz
aW5nbGUgcGF0Y2ggaW5zdGVhZCBvZiB0aGUgOSBwYXRjaGVzIHlvdSBzZW50ID8NCg0KU2VlIHRo
ZSBwcm9jZXNzIGFib3V0IHN1Ym1pdHRpbmcgcGF0Y2hlcywgDQpodHRwczovL2RvY3Mua2VybmVs
Lm9yZy9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sIGFuZCBlc3BlY2lhbGx5IA0KdGhl
ICJOTyEhISEgTm8gbW9yZSBodWdlIHBhdGNoIGJvbWJzIHRvIGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcgDQpwZW9wbGUhIiBhbmQgdGhlIGFzc29jaWF0ZWQgcmVmZXJlbmNlIA0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMDUwNzExLjEyNTMwNS4wODMyMjI0My5kYXZlbUBkYXZl
bWxvZnQubmV0LyA6DQoNCglJZiB5b3UgZmVlbCB0aGUgbmVlZCB0byBzZW5kLCBzYXksIG1vcmUg
dGhhbiAxNSBwYXRjaGVzIGF0IG9uY2UsIA0KcmVjb25zaWRlci4NCg0KVGhhbmtzDQpDaHJpc3Rv
cGhlDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9tYWNpbnRvc2gvYW1zL2Ftcy1pMmMuYyB8IDggKysr
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFjaW50b3NoL2Ftcy9hbXMtaTJjLmMgYi9k
cml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWkyYy5jDQo+IGluZGV4IDNkZWQzNDA2OTlmYi4uYTRh
MTAzNWViNDEyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWkyYy5j
DQo+ICsrKyBiL2RyaXZlcnMvbWFjaW50b3NoL2Ftcy9hbXMtaTJjLmMNCj4gQEAgLTU2LDggKzU2
LDcgQEAgZW51bSBhbXNfaTJjX2NtZCB7DQo+ICAgCUFNU19DTURfU1RBUlQsDQo+ICAgfTsNCj4g
ICANCj4gLXN0YXRpYyBpbnQgYW1zX2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LA0KPiAtCQkJIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCk7DQo+ICtzdGF0aWMgaW50
IGFtc19pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCk7DQo+ICAgc3RhdGljIHZv
aWQgYW1zX2kyY19yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCk7DQo+ICAgDQo+ICAg
c3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGFtc19pZFtdID0gew0KPiBAQCAtNzAs
NyArNjksNyBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgYW1zX2kyY19kcml2ZXIgPSB7DQo+
ICAgCS5kcml2ZXIgPSB7DQo+ICAgCQkubmFtZSAgID0gImFtcyIsDQo+ICAgCX0sDQo+IC0JLnBy
b2JlICAgICAgICAgID0gYW1zX2kyY19wcm9iZSwNCj4gKwkucHJvYmVfbmV3ICAgICAgPSBhbXNf
aTJjX3Byb2JlLA0KPiAgIAkucmVtb3ZlICAgICAgICAgPSBhbXNfaTJjX3JlbW92ZSwNCj4gICAJ
LmlkX3RhYmxlICAgICAgID0gYW1zX2lkLA0KPiAgIH07DQo+IEBAIC0xNTUsOCArMTU0LDcgQEAg
c3RhdGljIHZvaWQgYW1zX2kyY19nZXRfeHl6KHM4ICp4LCBzOCAqeSwgczggKnopDQo+ICAgCSp6
ID0gYW1zX2kyY19yZWFkKEFNU19EQVRBWik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGludCBh
bXNfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+IC0JCQkgY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQgKmlkKQ0KPiArc3RhdGljIGludCBhbXNfaTJjX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ICAgew0KPiAgIAlpbnQgdm1haiwgdm1pbjsNCj4gICAJ
aW50IHJlc3VsdDsNCg==
