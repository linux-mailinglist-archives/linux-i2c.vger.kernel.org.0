Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7DB6B718F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 09:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjCMIvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 04:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjCMIuT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 04:50:19 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::603])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F8D37545;
        Mon, 13 Mar 2023 01:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAbMbwksodbpiZxYovPfdQvvq/O06ST02BKevrFsK4jVw+M7iK6wAQd79z+abEZLEiYJGQn9ee1qYOXOKNs1oRg4UhzIxLcKNEBPcdH7dRt7RkrpMomrjC3+rgGIfXrm9LLoGjqMHLpuOOO4v4iBSG07FUaEw66YUQD0c/CAQq8nSF+LVMQz6+da7tDtCszAsJsiYX3XjxzBSVgSJDOF5oJ/2d9aFEj658B3CqjJgN2TLMfI8XlETzjtSGHy/G1Oafgl3HXONYh99lEpAh22lOsrv5iMAqF0M8SVKpKXqfRRG9qvwonq5wKdNR5gPYuoYDSQA7s5W3uvcgSvKvzNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC1tGOB1gRYUrCtIa2YDHQD3JSNwcTd+dhYDqz/fUio=;
 b=TCjjZoqB1oL6icQbNz8qidxLZAt02rr3nonNRcpjr7WGATGhghHn8ks6LRFO62H+tr4bHnAXOubZtlUH/Nln5CdeU2gnSMsqBc+iiQw5Rx/Cc5Lu3LSEl1N2imGDekGxhVdAkNdCyegl99HyFYBGliRVBwxUzPuXwLCQHD4v6MnSu3teFz/F+ZkW53AyUu/v3tfCECZq2CKg+vtSyLci37PbZLX1A2wdjFxywGDDipQS+PoTTHQ1/lqkJDOqJj3qBHsBq8TZ8BP3IxSfk2ADDLtcZubNnziOkSt5sGOIgULenkczqRPimr6HZl6A4UZz4U/4PhP2eznTFscGiQUbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC1tGOB1gRYUrCtIa2YDHQD3JSNwcTd+dhYDqz/fUio=;
 b=Z7OhmAOpp2ZiQLPaaQy2tb3HcZCFlWNZW3tYjsnYKnBhxvmRP2T2ttOwoElszaUlGsKYTQfz4IDX8RiOWYugCsxdMuC1Fuk+WHzQuyPl60kuzVjO6CmfdRvq74YhsbzhCLncRh2PTaPdi9OSAktye5HVpeOGm8n9Hk2Na9ZvXLC+zTOvZBA6vGt1kS5+lpnepRo2KtZLv1ONkluNb4xcqDKhXdXKTJoy6GxMBQ+sQ8fxwmc0IpkgpRcR49BsrsT6Qy1z2alq7m2MREhyvRiKGgEBd56ho6MPzRtR2d+rY/gNwhGjYy1uV3IITjLsqM2hP+CeyBmrSQ75xS/yWfkfjA==
Received: from TY2PR04MB4032.apcprd04.prod.outlook.com (2603:1096:404:8002::7)
 by SG2PR04MB4105.apcprd04.prod.outlook.com (2603:1096:0:5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 08:48:10 +0000
Received: from TY2PR04MB4032.apcprd04.prod.outlook.com
 ([fe80::e8c5:5f9:2a10:ae23]) by TY2PR04MB4032.apcprd04.prod.outlook.com
 ([fe80::e8c5:5f9:2a10:ae23%6]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:48:10 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "garnermic@fb.com" <garnermic@fb.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>
Subject: RE: [PATCH v1 3/3] misc: Add meta cld driver
Thread-Topic: [PATCH v1 3/3] misc: Add meta cld driver
Thread-Index: AQHZKliEB9QfLl+uU0OkdbU+k336oa6ifDwAgFY+BDA=
Date:   Mon, 13 Mar 2023 08:48:10 +0000
Message-ID: <TY2PR04MB40328E5E7FC548F3FD207E1083B99@TY2PR04MB4032.apcprd04.prod.outlook.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
 <CACRpkdY2ohNNJnnFUZscVg1ETEZBOCby7p-B-uCrrGwvLcQZ7Q@mail.gmail.com>
In-Reply-To: <CACRpkdY2ohNNJnnFUZscVg1ETEZBOCby7p-B-uCrrGwvLcQZ7Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR04MB4032:EE_|SG2PR04MB4105:EE_
x-ms-office365-filtering-correlation-id: b30f9df5-43fe-408e-f982-08db239fac9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRByDpiqTisZDOffsMdqMO99kmuRREqenzEb9wCmlihIq58OgE7dCOiZ45SWJ7LH4q488Nl9NpMymWnIvc6UEAxgxwI7VEnqlqAK1fEDocHqbb9zPMTDRmCGtpQzg8obrCrFJRPLWvmSZpHSDvs7xuSKe4HbvxAhADmXuVzoxKsJthS5B6J9Jk2N0aWXXpVUjVaTcvxPpZaGmyGXAMEWV2NqS6fiszsdcgNH7N14hl4qy6zhHavAyzrHj+B6+XfxJonGs0tx+JALzxCggeRXLWGBmhtB+/Mfl9nVihY0wLsGELUUlWivcVSkEQiMVUVHFBq4yoWMWGzWY96KUzijhjKrOt7GDlDwyb2Nvx72aiGc5sJyswbxVyoShbi4lpRaP2bv5bJ9OOVMmoyUvOv3UcYvxQWo2RQBNaTTngjY+6+PeS4TV79nBBvhl1b+oHHUyn9gWL5HhbgiUxhDV55w/MHl0NlSX8kd9+eP84wBK417mKynT56x7/vMiijzdUmxdRO0Zh2J1Z52MsmmBjUfvhRSwXIFxyvfSxL+zs4RxUazJPkHHQGB/TmjXLO2AeBlZEYC1DEOOoLexwjHrTEw0t5Vh9VMqIyjJGS5pjCkcH4/bzvsCn2CiUY5tMPAtoGy21KoyrqdWi0GsfD/luHNV2o0+UQWOQ2lcPMKHrbzCDZZmkXwQYwEt6fAExWdmMa333ZBbSOzEJd0ws31WicjAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR04MB4032.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199018)(7416002)(186003)(9686003)(53546011)(6506007)(26005)(8936002)(83380400001)(52536014)(38100700002)(5660300002)(38070700005)(33656002)(66476007)(64756008)(55016003)(66556008)(66446008)(4326008)(76116006)(71200400001)(2906002)(7696005)(8676002)(41300700001)(122000001)(110136005)(478600001)(316002)(54906003)(86362001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVg5REpTT1BySklDWlFWMjJKYm5aT3R5c0hBOTZSZUxwS0k0cjc4Q05jSHJu?=
 =?utf-8?B?OGM0MWpHWE1oL1hmNm9ya1phUkdoU2hDOG5vblQxSEhJbGd0Y09TOW9HQXFK?=
 =?utf-8?B?QzNQeDR5a290WWZTMmpCQi9mSzdURzNkZGFmdkdoa1FocjFxOFZ3NENlWmJt?=
 =?utf-8?B?TUx3MWNxL3ZYNWZKOUdsWldtaSt6cXJqSjUwVFNlTjlPWTNjejFTMEx6TUMy?=
 =?utf-8?B?NHhOME9qZGdKQ2tLVHNVK1QxaU1wUHAveEdLMkpxcnVkNEdxekVRZnFkclFl?=
 =?utf-8?B?ZmJMVXRTTXZlZnNITk42by9mb2VaRTdSYTFWRUJKekxhcDFMYkRWU3Rhb3ZL?=
 =?utf-8?B?OWtHOERTYVQzankwOWN6aTdNM0RhRDYyb3BwSU9uNDV2SU5Ob2Y0NmVvL1N3?=
 =?utf-8?B?RWE0QXlqY1hFQ0wvNUZtdWpmbjhZNmVQLytlWjFRNjRZR2VQcVF2QXRnb3hk?=
 =?utf-8?B?Sk1aYTJlcnpBTUIyeVBKUzdHL1ZscHQ4Zmc4c1pZZVpJYS9IekdRTGJ5K25P?=
 =?utf-8?B?VHhRQUYza3drSk96M0F3VFF5dWZzSlpGU1VsYXczcGtmRUpSMmY4clhOKzlJ?=
 =?utf-8?B?WG4rTUxQTk5NaURxZmw5eEY4eHNXRVhoNE9HWVAzOER6WkNxL0xwRTMyVnlt?=
 =?utf-8?B?OG9kbkF5SFNwc3hlVDJEbE9UOCtsUHNQUm1EeUJVa3lMcmhwbUJLTUhUT2gz?=
 =?utf-8?B?RTRETmw0WnhNNGJxQ0V3L21zMGRxYlJyY1h3NzVra1N1SG9Ieml1VGZhMERk?=
 =?utf-8?B?VVplNnFZRVNVMDZyTG5pN0hqSHNvYStlZjZuOEVhRGI3RkhwVnNicFhYdlM3?=
 =?utf-8?B?Y0pKZW9zU2FOdmZhYmxVcHpCVWoxb1FmQVpkdFdONlE1L0FBaStJWTR3ejU4?=
 =?utf-8?B?Q3A3QTkvTlRUUExCK0x3dzFEbHRQRGZpbUg4Z2VYSVovODJYeUpkVDJwTHdl?=
 =?utf-8?B?Mm44MDFkUWlaYk8zVEQ5M0h3UzNHZngzbWV5RndqL2ZRSnJwYmV5SkVhR3Fm?=
 =?utf-8?B?V21pRDhIUGNYcnpXa3NZWUYzeVYwTVg4ZDN5eGQ1NmlHZ0Zkazc0VFVrU0NQ?=
 =?utf-8?B?VHhSSGNjZFM2bzZsSmJYbmhzc2lQQ0o4SGFuMlVsR3BwdGhBTXo1U3RmZlBx?=
 =?utf-8?B?OGhRZk5VaHAxL1FQODM0ejlvK1d6UEgxbHhBRXB0UTVZaE4xYkI2OElKV0hC?=
 =?utf-8?B?aFp6ZkVmYXRaa0w1a3VxYzN6NHVXUlB3UnJXem9JOHgrTUg3R0xrbFQ3VjRY?=
 =?utf-8?B?bHZEZWFXMWpzS2dHMXBZamhJZzZJNEN3dmZReGZRSEU0SVltT3FHbllxY3BO?=
 =?utf-8?B?WU1MbDk0VTFoS0F6cDVTRnl5cFdkaHV2dEx1elJrWlNwS0VNWld6Z0NHWER1?=
 =?utf-8?B?ZmcxVnQ1UmR3QjhoV3djMkVmdWtReVlTZ0dsYTEzdEJLVTM0dUJFUDlFWTZ1?=
 =?utf-8?B?QTZSdjBDWmZJQkNjWUdnUk5wUnovZWpwVWhZWE1La3VSOWVBUi9vc0dHSjNy?=
 =?utf-8?B?QlJ1ZjNUOGNPQjBMV0JWZlRhU0FMZ1dlYjVBKzB4eTk4bi9hTkJsbG1kRVQ0?=
 =?utf-8?B?RzB2N2VzTmR3WmFTbzJTcUJQUWV2a28ySVVGM0FycFlFYXhGWVM1V0NlbG5O?=
 =?utf-8?B?V3ZaNENWM0xnYTZ0Q3dKaFlQc0drMnhpdkJhOEVCdmI3aUI0WHNNSzBhNHE2?=
 =?utf-8?B?bHN1aXpCZ250bGI0VmxxK3F5WittcjB3TzhqOGQxVllaSjV5QVFBbW80eVRE?=
 =?utf-8?B?ajEwaDFRblBIUEFpUXlmbW14WWIzaW5xZ2YxN3ZpQjgvTDhiT083WG1KL3BP?=
 =?utf-8?B?YnlMYWlwdW4xd0JsKzBSbWl6VGtJZnZpQTRiVm1ZRjFFYk5WTmJvUGVhY2Jh?=
 =?utf-8?B?QmYyc0ZNN1hTeThFMW84SmhDaHNCWGlkUFMxTmZWWWlCT29mWk96UFBNMHNu?=
 =?utf-8?B?VDBCNmk3eG5ReG9QV3ZVZXFHQldjUCtGaWdOc2cvVnM4TkE0eVgxQnRaV2Y2?=
 =?utf-8?B?OUNkRy9PUXp3RXhWeld3Ykl3TnBnQzFSaG45SUI4UEtOSXRBMXhWZFA1cjJw?=
 =?utf-8?B?RERoc0RldStteGVJWis5ZkR3RzRMN1JOb2xPNU5RZ21VZHE0VW9FUEw2M0lH?=
 =?utf-8?Q?3/wauGoGtEcguADNaMAUNUuPc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB4032.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30f9df5-43fe-408e-f982-08db239fac9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 08:48:10.5551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iVHgiglpoBnRW/6na/5OP5mWLtpd4YjnLLaaJ2lbQdDa/HDZr+HkFSq050Y23WFgM95foir4Hl3HxR6nz7fj9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4105
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGludXMgV2FsbGVpaiwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldyBjb21tZW50Lg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNywgMjAyMyA3
OjQwIFBNDQo+IFRvOiBEZWxwaGluZV9DQ19DaGl1L1dZSFEvV2l3eW5uIDxEZWxwaGluZV9DQ19D
aGl1QHdpd3lubi5jb20+DQo+IENjOiBwYXRyaWNrQHN0d2N4Lnh5ejsgRGVyZWsgS2llcm5hbiA8
ZGVyZWsua2llcm5hbkB4aWxpbnguY29tPjsgRHJhZ2FuDQo+IEN2ZXRpYyA8ZHJhZ2FuLmN2ZXRp
Y0B4aWxpbnguY29tPjsgQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT47IEdyZWcNCj4gS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBnYXJuZXJtaWNAZmIuY29t
OyBSb2INCj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3Nr
aQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgU3RhbmlzbGF2IEpha3Vi
ZWsNCj4gPHN0YW5vLmpha3ViZWtAZ21haWwuY29tPjsgU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBz
aG9sbGFuZC5vcmc+Ow0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgTGVlIEpvbmVz
IDxsZWVAa2VybmVsLm9yZz47IFNlYmFzdGlhbiBSZWljaGVsDQo+IDxzcmVAa2VybmVsLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAzLzNdIG1pc2M6IEFkZCBtZXRhIGNsZCBkcml2ZXIN
Cj4gDQo+ICAgU2VjdXJpdHkgUmVtaW5kZXI6IFBsZWFzZSBiZSBhd2FyZSB0aGF0IHRoaXMgZW1h
aWwgaXMgc2VudCBieSBhbiBleHRlcm5hbA0KPiBzZW5kZXIuDQo+IA0KPiBIaSBEZWxwaGluZSwN
Cj4gDQo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9uIFR1ZSwgSmFuIDE3LCAyMDIz
IGF0IDEwOjQ2IEFNIERlbHBoaW5lIENDIENoaXUNCj4gPERlbHBoaW5lX0NDX0NoaXVAd2l3eW5u
LmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBzdXBwb3J0IGZvciBtZXRhIGNvbnRyb2wtbG9naWMt
ZGV2aWNlIGRyaXZlci4gVGhlIENMRCBtYW5hZ2VzIHRoZQ0KPiA+IHNlcnZlciBzeXN0ZW0gcG93
ZXIgc3F1ZW5jZSBhbmQgb3RoZXIgc3RhdGUgc3VjaCBhcyBob3N0LXBvd2VyLXN0YXRlLA0KPiA+
IHVhcnQtc2VsZWN0aW9uIGFuZCBwcmVzZW5zZS1zbG90cy4gVGhlIGJhc2Vib2FyZCBtYW5hZ2Vt
ZW50IGNvbnRyb2xsZXINCj4gPiAoQk1DKSBjYW4gYWNjZXNzIHRoZSBDTEQgdGhyb3VnaCBJMkMu
DQo+ID4NCj4gPiBUaGUgdmVyc2lvbiAxIG9mIENMRCBkcml2ZXIgaXMgc3VwcG9ydGVkLiBUaGUg
cmVnaXN0ZXJzIG51bWJlciwgbmFtZQ0KPiA+IGFuZCBtb2RlIG9mIENMRCBjYW4gYmUgZGVmaW5l
ZCBpbiBkdHMgZmlsZSBmb3IgdmVyc2lvbiAxLiBUaGUgZHJpdmVyDQo+ID4gZXhwb3J0cyB0aGUg
ZmlsZXN5c3RlbSBmb2xsb3dpbmcgdGhlIGR0cyBzZXR0aW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogRGVscGhpbmUgQ0MgQ2hpdSA8RGVscGhpbmVfQ0NfQ2hpdUBXaXd5bm4uY29tPg0KPiA+
IFRlc3RlZC1ieTogQm9ubmllIExvIDxCb25uaWVfTG9AV2l3eW5uLmNvbT4NCj4gDQo+IFdoeSBz
aG91bGQgdGhpcyBkcml2ZXIgYmUgaW4gZHJpdmVycy9taXNjIGFuZCBub3QgZHJpdmVycy9tZmQ/
DQoNClRoZSBjbGQgZGV2aWNlIGlzIG5vdCBhIHBoeXNpY2FsIEFTSUMuIEl0J3MgYSBjb250cm9s
bGVyIGJhc2VkIG9uIEZQR0EgZGV2aWNlIGFuZCB0aGUgRlBHQSBtYXkgYmUgQWx0ZXJhIG9yIExh
dHRpY2UuDQpTbywgd2UgcHV0IHRoZSBjbGQgZHJpdmVyIGluIG1pc2MgZm9sZGVyLiBJcyB0aGUg
Y2xkIGRyaXZlciBzdWl0YWJsZSB0byBwdXQgaW4gbWZkIGZvbGRlcj8NCg0KPiBNRlMgaGFzIHN1
cHBvcnQgY29kZSBmb3Igc3Bhd25pbmcgY2hpbGQgZGV2aWNlcyBmb3IgdGhlIExFRCB5b3UgYXJl
IGFsc28NCj4gY3JlYXRpbmcgZm9yIGV4YW1wbGUsIHNvIHBsZWFzZSB1c2UgdGhhdC4NCg0KQ291
bGQgeW91IHBsZWFzZSBndWlkZSB1cyB3aGljaCBkZXZpY2UgZHJpdmVyIHdlIGNhbiByZWZlcj8N
Cg0KPiANCj4gPiArI2luY2x1ZGUgPGxpbnV4L3N5c2ZzLmg+DQo+ICguLi4pDQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9rdGhyZWFkLmg+DQo+ICguLi4pDQo+IA0KPiA+ICtzdGF0aWMgc3NpemVfdCBj
bGRfcmVnaXN0ZXJfcmVhZChzdHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0IGtvYmplY3QgKmtvYmos
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJpbl9hdHRyaWJ1
dGUgKmF0dHIsIGNoYXIgKmJ1ZiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsb2ZmX3QgcG9zLCBzaXplX3QgY291bnQpIHsNCj4gKC4uLikNCj4gPiArICAgICAgIHNucHJp
bnRmKGJ1Ziwgc2l6ZW9mKHZhbHVlKSwgIiVkXG4iLCB2YWx1ZSk7DQo+ICguLi4pDQo+ID4gK3N0
YXRpYyBzc2l6ZV90IGNsZF9yZWdpc3Rlcl93cml0ZShzdHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0
IGtvYmplY3QgKmtvYmosDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBiaW5fYXR0cmlidXRlICphdHRyLCBjaGFyDQo+ICpidWYsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxvZmZfdCBwb3MsIHNpemVfdCBjb3VudCkgew0KPiA+ICsg
ICAgICAgcmV0ID0ga3N0cnRvdWwoYnVmLCAwLCAmdmFsKTsNCj4gKC4uLikNCj4gDQo+IFdyaXRp
bmcgYW5kIHJlYWRpbmcgc29tZSByYW5kb20gcmVnbWFwIHJlZ2lzdGVycyBpcyBzb21ldGhpbmcg
dGhhdCB0aGUNCj4gcmVnbWFwIGRlYnVnZnMgYWxyZWFkeSBjYW4gZG8uDQo+IA0KPiA+ICtzdGF0
aWMgaW50IGNsZF9iaW5fcmVnaXN0ZXIoc3RydWN0IGNsZF9yZWdpc3Rlcl9pbmZvIGluZm8sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGRfY2xpZW50ICpjbGQpIHsN
Cj4gDQo+IEFuZCB0aGlzIGlzIGZvciByZWFkaW5nIGFuZCB3cml0aW5nIGJpbmFyeSBibG9icy4N
Cj4gDQo+IEl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIHVzaW5nIHRoZSBm
aXJtd2FyZSBBUEkuDQo+IA0KPiBJZiB0aGUgcHVycG9zZSBvZiB0aGUgZHJpdmVyIGlzIHRvIG9w
ZW4gYSBob2xlIGZyb20gdXNlcnNwYWNlIGRvd24gdG8gdGhlDQo+IGhhcmR3YXJlLCBhcyBHcmVn
IHNheXMgd2h5IG5vdCBqdXN0IHVzZSB1c2Vyc3BhY2UgSTJDIHRoZW4/DQo+IA0KPiBJdCBzZWVt
cyBhIGJpdCBkYW5nZXJvdXMgdG8gcmVsYXkgd2hhdGV2ZXIgdGhlIEFTSUMgaXMgZG9pbmcgdG8g
dXNlcnNwYWNlDQo+IHRob3VnaC4NCj4gDQo+IEFyZSB5b3Ugc3VyZSB5b3UgY2FuJ3QgdXNlIGFu
eSBvZiB0aGUgZXhpc3Rpbmcga2VybmVsIGZ1bmN0aW9uYWxpdHkgZm9yIGRvaW5nDQo+IHdoYXQg
dGhlc2UgdXNlcnNwYWNlICJob2xlIiBpcyBkb2luZz8NCj4gDQo+IFRoZXJlIGlzIGRyaXZlcnMv
cG93ZXIgZXRjIGZvciBwb3dlciBjb250cm9sIGFuZCBJIGJldCBpdCBjYW4gYmUgZXh0ZW5kZWQg
aWYNCj4gbmVlZCBiZS4NCg0KV2Ugd2lsbCBkaXNjdXNzIHdpdGggb3VyIGN1c3RvbWVyLg0KDQo+
IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0KDQpUaGFua3MsDQpEZWxwaGluZQ0K
