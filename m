Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF2D559AD3
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 16:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiFXOAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 10:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiFXOAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 10:00:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D4C4DF4A;
        Fri, 24 Jun 2022 07:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaXsUK6atNcwnfEm7Vi0a1QpLMEJ6ZutezH8UiL1ExkJpfHLuE+IZ9SFEVdWA+U12CRvD1utVuCLXBl8nWiTDe8CTn3IWPm6sLLRaaB4J3tsE9n7t06Xz6VWR+9BXPh1VC7TVXVvQEeEow9gd1MqvN5081syePmcAwfutiUIkAq0zFITJmS9Y9X1dvQ2XK4V9/5fjTNl0mZNWD1cTOkAII3qC2mG2JN8h9gnBt+Cc1rYeoVaE1vslnDh82RkgR2IZa6iKO+0DEUWmRRgnRq21eHbuazJUxoXwDgnCeSVvuYXWuyMP5BUnByXnOegK2LN4If0YvxlazAXVY/31DBHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JCPqKwdu5gvzP4o2chFhmf5gzpX6/ZmGV22+TpfmZk=;
 b=Uu+oCWAyit9AryG3ykYejnkDNpqfsh1EcJ9zYZUlDBQiLqM1nIYymTIvhu1hizyutsUteJRqSn37e/49rPY5F5ieGupideUQwLNXzfnRjPrjSD8hbw7mNQAg90IHaQq+bwSbADMXdxoTfDEMY3M1DxE3w+SKqGJ+XOs+ku3XSz+uWT0zHu7fYZ7G0YsAM0CW/qkdZNuobiZrEHtX96DRtAdBmE680IBDeEa7sQwUWfcGpMViTD+IUhJ/S02B+A0lZ7b+9dKos5FarOdjCYjdzjX9KCdR4csiPRoJ7rxftqPv56KtGBWKuarxy6mBT9czO8BDqdH9rQwk/EUGCEwoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JCPqKwdu5gvzP4o2chFhmf5gzpX6/ZmGV22+TpfmZk=;
 b=jvUaYf11YlETHj4D44pLtdPUpSdTyWuSz9P6RqaV+GK1kdVKRVAX2f42XDpaVw5XxB4RDb0FHo9Vqxtzj6Teo2ASSFIDtpze2jPJ+nB76pJayTy4+1YR07Qrlgwx7StoVlexA1Ll34qgduJLggthGWGt+kJbTBd9lpiqQPzAF5Y=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB9466.jpnprd01.prod.outlook.com (2603:1096:400:193::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 14:00:37 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%7]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 14:00:37 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Topic: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Index: AQHYh7O5Gmbz6jaenU+JJ4T6rEztn61ea16AgAAqjFA=
Date:   Fri, 24 Jun 2022 14:00:37 +0000
Message-ID: <TYYPR01MB7086629BBB3EAD51AC364925F5B49@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-3-phil.edworthy@renesas.com>
 <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
In-Reply-To: <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16c6b6db-00de-4b39-079e-08da55e9ea5a
x-ms-traffictypediagnostic: TYCPR01MB9466:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BB+duxR09fps4xO/Am6/AONOLvpNivcnXT65XzZIL2mI/IQAVackKhCy2aPO0xJTh3giQ/6RTyZZAgv8Q5v014c99rkO+M4cD2LeYbzMLIb+Bvnwb+GHyxwsGahoyFfvEbkHgJSFMTfXWai+c/lTX582PzSEag8STTqhRgnzMExkYycI5FDKfB+IVkxtCPmsyMrRgZLfThdl4yfMSr66dLq5uwuoDpMlKbkLn5id7vLCM1J4umRGnALXJSvE/8TkXpGeWJhz3zEP0WKaIsp5gxN3PSp2lTgj/RW7vk5nhudJNIpHOJrLd/AeDnCZjMFg2sx9LClyUjS8xL0VN9RYyTQFRtUL4JImPBId63npLurB06D7tyZJtL2wLmYJfMr3uWxYqV8jYAM02gYbSUmnSDVr8WCxgYBVY1h7C8kNkbi095UVR1HmKvZHqd24hVX9aCmc+TDnrMn//GoYTfIufW3j4w6PlheywJn8Xvs4WzSJ6vNY7ZwF5ksNpox1l0irCN7stpgMR3dEWyU4hJWv3EQm7y8nYvakOrALG03sDOdHZtR0qt6WX5KmveDIhaTjca1OM0dUeVj+YLE0j4uVOBRrp1atuyLuPEI45tYqm6GWvAE4I6NZjDmwjH7YiMteZ/4aYck3zfyo0k3SAsVUKMXG8PrUXKYBlzFhpFlBmkMA90T5RVPJzkAKlhWGXIJ8sXgJg29Me91TnTzk+lD8gzURazt/XnCfYlEY4oZEXrtObgsCLf4rVUehLEoSGXXQ49rniw5Swhb/aIwQyF3GjO8caEx1/Jo7vmjsJbPCPC8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(52536014)(5660300002)(7416002)(4744005)(76116006)(186003)(64756008)(44832011)(41300700001)(2906002)(9686003)(53546011)(6506007)(33656002)(71200400001)(7696005)(478600001)(83380400001)(8936002)(26005)(86362001)(54906003)(122000001)(6916009)(55016003)(66556008)(316002)(38100700002)(8676002)(66446008)(4326008)(38070700005)(66946007)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ylc3RlJudVloeHB2MTU5R2NjSzNWWGVENnNsZjR2SVllN00rSVBxL3pHdXc2?=
 =?utf-8?B?VVZNR1gyZ0ZJUGNRSzFDdmhKTlJvd28rZ0ZSV3ExVHdPcHdkWUxNVHFIQTF0?=
 =?utf-8?B?Y202emJHZFA1ZEJZT1RTMVd0QTB1SDB3M3NML2RBdE5kU2dtUWw4SnpMMXlK?=
 =?utf-8?B?QXJQWStvNExvcmZhTlcyMXZpTytEd2k5Qks1N05qVFAzMzZIc3FhWG0wcnJk?=
 =?utf-8?B?RFEzQm00ZFN5NFYzVzdodkVwdVpzNE9PbU9rMmlkTWNCeFlFdmtWeHBUVmdj?=
 =?utf-8?B?Um50Q0JtQWVQUU1oS215RVFveG1ncktTRUxaTUNzOHJwOGhaMkpBTUZkelJK?=
 =?utf-8?B?RDFwM0pwZk5TUm1qVUF2RE1qQVgzdGRBTlYxUTk2b0lCWEt4Z25EWHpucU5o?=
 =?utf-8?B?Rm1tcnhRYlF3M0I5M2Mrd1JuRGcxS2JtSmFIVlpjakdvakFOREpNTDI0RjE5?=
 =?utf-8?B?RFN0bklIaGVoclJDM3hMb0tUNHE3bmlqd1hZTTBtaG5WcVVid1F0aWFaQ0p5?=
 =?utf-8?B?QUtLRnhBUHVJdTN3aFZJREgyTTR0YzVudFNnVkhLUFQ5ckNid3o0RHNNTHpy?=
 =?utf-8?B?ZmE5bjZYa1FPNHFrY0Q5SDU5YUlOU1pGV0NNM3IvQ3UwdjhQWWZOeVZ6SVpr?=
 =?utf-8?B?aVNsbGY5WGVZWkwxZnRLUmFTQ0c4S0QvRG1uS0tHTjh6NkZoNFJCblhuT1hm?=
 =?utf-8?B?ak1yM081VEZNTzNnR0dsMUwrb3ZZTlAvKzRhTDZheVZrVHB0ZWRnSkNBcWJV?=
 =?utf-8?B?Q0g0TUsyYWF6eWp0NGFEQzVhWmRRNTNpWDVlQk5uQ1ZVNFlBbU80L2FkQUZm?=
 =?utf-8?B?eDRqeFUvVngwMC9iRmhpZktYYXV6YmxhWTZpV3Jhc2p2OHZLRzRnRVhTbjhV?=
 =?utf-8?B?cjRxbFAvU3pvOHRzZDdKWHA5eG91WW8rTlp1eFpkSTBJMzJyMWFodDJJWFcx?=
 =?utf-8?B?ZlQzTXVRQklUa1FpYUNpOEdsYi9wanJEbGp4SCtmdzR5V2ZlVzdOZnNmeVhJ?=
 =?utf-8?B?ek9jTFlGV0s5N2VRWGZuOUV6ZXhwRVFHQW1OQ3BGZ0dXODFPei9sT0dTOCtv?=
 =?utf-8?B?aUFldldHVDFTbTFkaWVTY0o3YnhoczI0RjNjQnp3NWs5RExhWlhyeDI2YVdx?=
 =?utf-8?B?OHQxbGdneG93MEROVTY1bjd1ekNJY0sxZVoxbmNrUTgxV3VwdG50bWJRYVMz?=
 =?utf-8?B?Zlp0Qm5JckNLNFVocUVGWHpoQTd3bk9CQVMvU25RQzRENXJaZ0hZQWxGUjlw?=
 =?utf-8?B?YXdWZ0c4Y1pYcFI4K2svTkNHMi9sYVhNalJHem5HQkhHMnNLVm96WDQ1ZkRm?=
 =?utf-8?B?VFVUT0VkNE9ZMEFiRk1DSWNpeEVaU1lFUnlBVGorRXpueVE1VE9tSjVXUjY5?=
 =?utf-8?B?dmRhOEtnSFNZQUVMM0hVMW1MRGZpYVE2Tk5UWUVzQncrSXgzc3JZNXRZeko0?=
 =?utf-8?B?NVJnOEhONGlNL0NwdloxSTlDKys0QnkyY1pCMXh3YmFlYjZIT2M2bHFBQm1u?=
 =?utf-8?B?bnRyeGpMTEZVN3hQRWt5QjVKT1RXcnJVS05waHBhbk8vd0huWHZLbzhEV0lE?=
 =?utf-8?B?aFV3L0J0OU9UdFRzSTh2TTFGU1NDd1BqTkUzazhLMEJsZUIydUxHY25XdTVi?=
 =?utf-8?B?T3plZHNlT1NYRXF4UGxOWnZQMzdZTytHOU1aM1BzUng4VW5QM3R5RU1jaFpJ?=
 =?utf-8?B?VEUyanhQWWtJSktyc0Q4K3JMS2NTVHBPaDgzQ3dJOTFMeW5ibURhS0ZHbmt3?=
 =?utf-8?B?SEszaUhPWWdIMis0M1VpdjVSMTliWnpGNFZrUjhGN2pXWTBMMjVwc2MvYTY1?=
 =?utf-8?B?RFdkZXBWYzAwTjE3eUZ0NWJWTkNWeWFjRU1WM3pFUk1LREZLL1h6UVlJZ0h0?=
 =?utf-8?B?dmQxb24rUmhIbElpbjRLVTlWN0psTGVZa2F2c1dLR0tycnI4ZjQwcHNsU3BQ?=
 =?utf-8?B?T1k4M3Ntb00rcmsxZDlNZmdiTVNsUVAxTHJxb0JoaDhmNit6Q1ZVbVo2RzE4?=
 =?utf-8?B?M0U3L1hhZzQ3TzVCL3YzUnRnU2d1WGR1VXdIQ2xkL2lhMDg0cXdqVzQvWkFG?=
 =?utf-8?B?cGkxSHV5eVlGVFBwais0dW9yUHhER1BzSjZGdUdPQy93enU2b0N6MGFwcm8y?=
 =?utf-8?B?b0kwZHFvMVJkZVJBSERkak8xVFovbkV6Q1BUb3Nkc1NtZUZ0a3VFRXVUWDFB?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c6b6db-00de-4b39-079e-08da55e9ea5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 14:00:37.3699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cUQnRBM7ZiqL85ppS/UQcRyylt/wtY7SyamrGDLWpEgvzN/g/RookOVUoWilC/seCd5xHc58qK0fwlTJppcWTOavaZ7tNxafl9gc2WXY9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9466
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQXJuZCwNCg0KT24gMjQgSnVuZSAyMDIyIDEyOjI3IEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+
IE9uIEZyaSwgSnVuIDI0LCAyMDIyIGF0IDEyOjE3IFBNIFBoaWwgRWR3b3J0aHkgd3JvdGU6DQo+
ID4NCj4gPiBZZXQgYW5vdGhlciBpMmMgY29udHJvbGxlciBmcm9tIFJlbmVzYXMgdGhhdCBpcyBm
b3VuZCBvbiB0aGUgUlovVjJNDQo+ID4gKHI5YTA5ZzAxMSkgU29DLiBJdCBjYW4gc3VwcG9ydCBv
bmx5IDEwMGtIeiBhbmQgNDAwS0h6IG9wZXJhdGlvbi4NCj4gDQo+IEkgc2VlIG5vdGhpbmcgd3Jv
bmcgd2l0aCB0aGlzLCBqdXN0IG9uZSBzdWdnZXN0aW9uIGZvciBhIGNsZWFudXA6DQo+IA0KPiA+
ICsjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+ID4gK3N0YXRpYyBpbnQgcnp2Mm1faTJjX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAuLi4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
bV9vcHMgcnp2Mm1faTJjX3BtX29wcyA9IHsNCj4gPiArICAgICAgIFNFVF9OT0lSUV9TWVNURU1f
U0xFRVBfUE1fT1BTKHJ6djJtX2kyY19zdXNwZW5kLA0KPiByenYybV9pMmNfcmVzdW1lKQ0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArI2RlZmluZSBERVZfUE1fT1BTICgmcnp2Mm1faTJjX3BtX29wcykN
Cj4gPiArI2Vsc2UNCj4gPiArI2RlZmluZSBERVZfUE1fT1BTIE5VTEwNCj4gPiArI2VuZGlmIC8q
IENPTkZJR19QTV9TTEVFUCAqLw0KPiANCj4gUmVtb3ZlIHRoZSAjaWZkZWYgaGVyZSwgYW5kIHVz
ZSB0aGUgbmV3IE5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMoKQ0KPiBpbiBwbGFjZSBvZiBTRVRf
Tk9JUlFfU1lTVEVNX1NMRUVQX1BNX09QUygpLg0KV2lsbCBkbyENCg0KVGhhbmtzDQpQaGlsDQo=
