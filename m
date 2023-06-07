Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE67C725AB0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240156AbjFGJhI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240209AbjFGJg6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:36:58 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437EF1FE7;
        Wed,  7 Jun 2023 02:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmJifChrvAf4mcP/YqwpFfuuClDdJMccjWNkyRshC7XMCpPtlhGL73qXodMUiz6Azk38EpV8NP29nhpHtvasSqEfOudrnGzpeyAaISHWojMWOsO60xauLHQUlDUAsHG5BnzEQRNQic2O/c0P68x3EFmPbIr6BBbv3Rzips7uKQBDozRrL9e+ZsRQKFTmfD+Xb82luTqwynOegU0fgh438f5LRw29EaaePOQnwm+I6N3E+gfLsJ7LwiS8wYO8U+BpWRy0Y7zJe2m8oHxgtakkjzc1i4SKsrAQsWZe3pgB+InHLZtv31EUMdNOX+I4O+a6IAeFkhuT3LhfavYbUbF0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nyJN/HUIdYk9HKoGf7k5PybmVxiCnODFE0JCpkJhas=;
 b=LIiz3XHhWgRlxwfExQbf21GBak7HahEOX26mjZiVdB5PMIWkImKBEEjHdQKKdS7Ocuzk56Ny61nnUuakYvt2hvX4aLSAmI9HI2Su3C0DC3UXphpBbmWhMTAh2/vn9oSKMcAlWRjO1lyA4885yqjmnqr949wInTrhLGDtIfaSN6XBXAm4UGM7rszR/h+DjpyCqXaEFjHVXzgMNUYdUJ8XHjwdCCwcgF5+UM+YN9mbStvwA49t8IFZ9VMmfKvNCKfXK0i58ZUJ8oUvj92DD1wpY+VJn+/s3ERwvLdeeAeEyi208OnkNSZVjtbMAHAPPgsUS7S6Y6u93MyPTeqqaxijzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nyJN/HUIdYk9HKoGf7k5PybmVxiCnODFE0JCpkJhas=;
 b=Yir16xs0zB4IMqRN4q+UH6LaVd7Us1Lx6XzllblDoh3om30qzf5FODby0ojRNZVNI8WnXuCBJDWRAh7m9EDjpT9NYsQsFmE5QHca7rCNcx5T1UAwHrIV5MAiFf35dipQvbD2Z52X1mufEjSVAJL3RlJUQC5ZnorjL9bQ1uA/5WY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5547.jpnprd01.prod.outlook.com (2603:1096:404:8038::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:36:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:36:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Index: AQHZmHeP0tU6ipLwP0StWgcCj8giXq9+63MggAAodQCAAADcYA==
Date:   Wed, 7 Jun 2023 09:36:39 +0000
Message-ID: <OS0PR01MB5922F5406B7D72FABD8A3CD58653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
In-Reply-To: <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5547:EE_
x-ms-office365-filtering-correlation-id: 187abae0-6ac8-4958-aa89-08db673ab1fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NKpGvCPjsiQqtJ0oetkxYXDTvDMR6M0gAYM+RRk7tv53u1+Uyzu2mTqjp68bi6Hn0reThdhmRB3aVpSImwFps35mFlua8+um7jO3j3ZXa93TcUWFn3wJ3wCBye5CSJnQ+Forsm3DJ67TVy0H3133bLxaIipvYVYO199LcrjEPqA8f1EmwVFjooj4vCQAI348Mf0QVOqw7D+D9v0SkCKqqunjBXdmAIgNmRjuLHIGj0Zya4lkIHlWS07J58oCrBdbYWSkWGsEG0IplmfcoEJmosTt1n/6+et5WNokY97G3or3T+6tHCGJjRtkx/JWNuZGCt05KrH7pGF08fi29+u8Dbvf/V5vU9/YZEc/HF1kRKWg5hSCeY99OvvL57JUF6Qerw000ZjFg4+9BhZwpRLrNzoTlD0jEiu4YCiuF+07mH/NDZeoKtv2blp5PVLk2X5cRzJg3jdtLrYiPEM8cLOeRayHh5Lp/oFbyWcjT4Bf/jyTyN4hgcrJIuYQjlnjafH0iit7cZFG6m9W9P/TeaHxcdAjwkd06L6PlFxVNxigLQ0uuJIzNFCnaJ6wEo1vdttMyth9VrC6hp0oHoJNpYoEKUruiWCxomU2QzGS8bLJ+ODE1gXrx9c2bDMNNUD5Sxlm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(110136005)(2906002)(54906003)(38070700005)(71200400001)(478600001)(33656002)(86362001)(52536014)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(55016003)(316002)(66556008)(4326008)(64756008)(122000001)(66476007)(66946007)(76116006)(66446008)(6506007)(26005)(53546011)(9686003)(186003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWd5Wnpxb2dYbkZiaWtERlFBT0VKV1E3azIySFRlMTU4SGJTSUV3QTJqMUJT?=
 =?utf-8?B?dzBRdXl0VGJNb2pDanVFT3hmdGxEMVVTVkxEMnVwa3lzZDRnUittWXhNbjdw?=
 =?utf-8?B?RzRhSWxaMTV1ZUUvSzdYS1FtTGVTZnFUa2hwaGoyR3hQSzRhajRrVU93MkFL?=
 =?utf-8?B?S0FmcE8vUFZzd2pwY08wRnhsWkxNTTNHb1Z6b0RIN1R2TmJwOURxSE9XM2Z2?=
 =?utf-8?B?bnNWclpFYlJYK3JSelFIV2xTNlZoRjNjNEZ4bjQwMTRCNTdnNVdWN0ZQT0xp?=
 =?utf-8?B?V2E4QysvNDhPVTFDU2owNElnTzFTbzRMVlpYc0VUaTU1dmVmZWJCZzd0MzdB?=
 =?utf-8?B?TjRrWVdBMkV6SUpCMzhsMEZZYlV6TGhDZ1VsZ0IxMGtWVkhDKzlzeVVYUFVW?=
 =?utf-8?B?OEpVL2o5dnErVFZRWkRKWjZaLzI0VFVscVRPUWpmc0tidEpPS0lzRjNwVlYz?=
 =?utf-8?B?OUR4QzZ4TGpvbTdoUTJkM3N6dzRGM05qNjBkWEd4TmRiMG9mVlFZRlNHSUpq?=
 =?utf-8?B?N1NGaVhLNTlNOUFSWHFzNmg2aTVVQW4xU1lCd056VHhzem9FdEZ1WG5OVTdY?=
 =?utf-8?B?eDFzVXNvbnEzQ1Z2OERnT0FLTzVNdThwRHA0MHVyWVlId0FWYTE0SHZEczlT?=
 =?utf-8?B?WDZUcGlFUzRSU1h6Wk9lNGNhYVkyZzRTQWFmemluTmpUODBpRTROYWdOWGc3?=
 =?utf-8?B?cS9ZTmtkbW5PcmZYT0gzUngvK281Y250NUphQlN2NXZleU43WGpIQ01ERnNy?=
 =?utf-8?B?U2dqWksxYVl2VlJlL1BZdE5FSnVDZzlTVy94L1BxOCtIbnFtaGtSeGF5akxZ?=
 =?utf-8?B?U3dqM3hwZ0ltQkVhNHpGVldiVGVwM0FRMmV3RXVQVjFwQkkrNU5hTkpjT1p5?=
 =?utf-8?B?U2JQQ2Y3Z0NvMng0cjFBcG4yQU1QVVdERm4rOUprVms5NlRYNUU2aElhQ3RB?=
 =?utf-8?B?WXFmQ0p5N1oxN29EQitsbGZuRVc0Q3BBTjUyR0hvWFBvMENIc3lvOThIU1ZD?=
 =?utf-8?B?OU93TUpFVzM1M0tHWDgxaklkNm44RkdyNEtBVWtybGs4aUZ3SFQrbFM2S2tY?=
 =?utf-8?B?U2RYOVExdlAvTG92K21DN09TbWMxd3pPdStoMys1empkNU4zUFRLYnZieVZV?=
 =?utf-8?B?d3VmUHIwdmdybXhBY3J1OWNpUDdQdElLYUUrcTlRWHEwaGcwdGtCVklFVmRB?=
 =?utf-8?B?eWxjSHlFSkFTNi9lYlRxSTNzajFudVRzV3BsU0FGS2swSzZ1QmJQYlB0eVRr?=
 =?utf-8?B?a1F0WTZ5bElkYjJnZXNCdEpMOGVtSHkxS21qWkNGb1gvRE5xcDNvOTBTWTlw?=
 =?utf-8?B?Ym5MWjgxZkNoSUJ0RlVSNDlzNDBNUmUrRnRBNjNsTEF3VzdGRGRTWGo2eEY2?=
 =?utf-8?B?emtXSXhqOVV3VWRGVit4a0FNTTg2MWdGWHVVcUl1b3VRbUVDd3pneEJBc1pr?=
 =?utf-8?B?RUxKdDhTYm9nMWs3SmZVbnB4dVZ5ZUh3RTV1b3FIK0VmNThYTWN1YnFDclEw?=
 =?utf-8?B?MlZuR2xGNkhKQ0JIeFJyT2Q4VG01dnhoeVZCNjNrelZ2RzZVbEU0OWZ1dUFY?=
 =?utf-8?B?bUpYSHVGNzNvdFpOTlQ4UExaNFNrT01OeXZ5R294Vm9tMEpyRFZVZXF6ZkhO?=
 =?utf-8?B?SVBqWmxad0xKSmZWaTBhZ283ODYrM0U3TWVQNUZkRkgwTGF5Y1U4Q05ydGV0?=
 =?utf-8?B?UXljTi83ZnVlTVlkOU9ud3NLc1d2SXA1aUFSRXlBamsxbGdsdWdEU3IrVHg2?=
 =?utf-8?B?VGtDNkZERjJaazd3b0xIWTc4WWxMRkZLQWdRRnJZa1VaZCt6aStqVjZYbStP?=
 =?utf-8?B?emRHMUxGMnlCN1dUckR2OXh0WHM1TDk5bUlnOGhweTlCbHlHS0FRTmFKdEpN?=
 =?utf-8?B?OGp0a0JNUkpybmhpM2NqeWRtTGkwcW9UYzZHU2J4OHJlYVAybGliMmlIdUVm?=
 =?utf-8?B?NDhoWW5EOVhMcnNoeWJrYVNZanpxblV2Tmg0NmNMNlBza0plRzBjQkhSTXly?=
 =?utf-8?B?OFpOZUhNRUpDRCtHRTRNalQ0YlFNSVMzV3NqQUlLejZKcmd1K3g5ZG1hak5L?=
 =?utf-8?B?am1obFZOYmRrblNKNW9RLy9hcWxYSUx4ZUZHTjNFRHdidzEyRTJRRHRDazVk?=
 =?utf-8?Q?wiLYpoSA5APABpAkMpxEIS700?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187abae0-6ac8-4958-aa89-08db673ab1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 09:36:39.4670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sjWcj6wKR64FmCBcZ1LNXlwdYCozwRGKeBmUmVmOEJlwRR5gOaLkAJ2P7/57ED4cTcqrC6rskAOL4J40zA6ufEpI0Kdq4+JiWdg3SNUG89s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5547
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjNdIGkyYzogQWRkIGkyY19nZXRfbWF0Y2hfZGF0YSgpDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA5OjIx4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCg0KV29sZnJhbSwNCg0KV2hhdCBpcyB5b3Vy
IHByZWZlcmVuY2UgaW4gc3VwcG9ydGluZyBPRi9BQ1BJL0kyQyBtYXRjaC1kYXRhIGFzIGluIFtB
XT8NCg0KT3INCg0KSnVzdCBzdXBwb3J0IE9GL2kyQyBtYXRjaC1kYXRhIGFzIGluIFtCXT8NCg0K
PiA+IERvIHdlIG5lZWQgdG8gZW5oYW5jZSB0aGUgbG9naWMgdG8gdXNlIGRldmljZV9nZXRfbWF0
Y2hfZGF0YSB0bw0KPiA+IHN1cHBvcnQgT0YvQUNQSS9JMkMgbWF0Y2ggbGlrZSBiZWxvdyBbMV0u
DQo+IA0KPiBXaHkgbm90Pw0KPiANCj4gPg0KPiA+IE9yDQo+ID4NCg0KPiA+IEFyZSB3ZSBoYXBw
eSB3aXRoIHRoZSBjdXJyZW50IG9uZT8NCj4gDQo+IEkgZG9uJ3QgbWluZC4NCj4gDQoNCltBXQ0K
DQo+ID4gK2NvbnN0IHZvaWQgKmkyY19nZXRfbWF0Y2hfZGF0YShjb25zdCBzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2ID0g
Y2xpZW50LT5kZXYuZHJpdmVyOw0KPiA+ICsgICAgICAgc3RydWN0IGkyY19kcml2ZXIgKmRyaXZl
ciA9IHRvX2kyY19kcml2ZXIoZHJ2KTsNCj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBpMmNfZGV2
aWNlX2lkICptYXRjaDsNCj4gPiArICAgICAgIGNvbnN0IHZvaWQgKmRhdGE7DQo+ID4gKw0KPiA+
ICsgICAgICAgZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmY2xpZW50LT5kZXYpOw0KPiAN
Cj4gICAgIGlmIChkYXRhKQ0KPiAgICAgICAgICAgICByZXR1cm4gZGF0YTsNCj4gDQo+ID4gKyAg
ICAgICBpZiAoIWRhdGEpIHsNCj4gPiArICAgICAgICAgICAgICAgbWF0Y2ggPSBpMmNfbWF0Y2hf
aWQoZHJpdmVyLT5pZF90YWJsZSwgY2xpZW50KTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKCFt
YXRjaCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgIGRhdGEgPSAoY29uc3Qgdm9pZCAqKW1hdGNoLT5kcml2ZXJfZGF0
YTsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gPiArICAgICByZXR1cm4gZGF0YTsNCj4gPiA+
ICt9DQo+ID4gPiArRVhQT1JUX1NZTUJPTChpMmNfZ2V0X21hdGNoX2RhdGEpOw0KPiANCj4gPiA+
IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiAt
LS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvaTJj
L2kyYy1jb3JlLWJhc2UuYw0KPiA+ID4gQEAgLTExNCw2ICsxMTQsMjcgQEAgY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgKmkyY19tYXRjaF9pZChjb25zdA0KPiA+ID4gc3RydWN0IGkyY19kZXZp
Y2VfaWQgKmlkLCAgfSAgRVhQT1JUX1NZTUJPTF9HUEwoaTJjX21hdGNoX2lkKTsNCj4gPiA+DQoN
CltCXQ0KDQo+ID4gPiArY29uc3Qgdm9pZCAqaTJjX2dldF9tYXRjaF9kYXRhKGNvbnN0IHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpIHsNCj4gPiA+ICsgICAgIHN0cnVjdCBkZXZpY2VfZHJpdmVy
ICpkcnYgPSBjbGllbnQtPmRldi5kcml2ZXI7DQo+ID4gPiArICAgICBzdHJ1Y3QgaTJjX2RyaXZl
ciAqZHJpdmVyID0gdG9faTJjX2RyaXZlcihkcnYpOw0KPiA+ID4gKyAgICAgY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgKm1hdGNoOw0KPiA+ID4gKyAgICAgY29uc3Qgdm9pZCAqZGF0YTsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgIGlmIChjbGllbnQtPmRldi5vZl9ub2RlKSB7DQo+ID4gPiArICAg
ICAgICAgICAgIGRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJmNsaWVudC0+ZGV2KTsN
Cj4gDQo+IHJldHVybiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJmNsaWVudC0+ZGV2KTsNCj4g
DQo+ID4gPiArICAgICB9IGVsc2Ugew0KPiA+ID4gKyAgICAgICAgICAgICBtYXRjaCA9IGkyY19t
YXRjaF9pZChkcml2ZXItPmlkX3RhYmxlLCBjbGllbnQpOw0KPiA+ID4gKyAgICAgICAgICAgICBp
ZiAoIW1hdGNoKQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiA+
ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICBkYXRhID0gKGNvbnN0IHZvaWQgKiltYXRjaC0+ZHJp
dmVyX2RhdGE7DQo+IA0KPiByZXR1cm4gLi4uDQo+IA0KPiA+ID4gKyAgICAgfQ0KPiA+ID4gKw0K
PiA+ID4gKyAgICAgcmV0dXJuIGRhdGE7DQo+ID4gPiArfQ0KPiA+ID4gK0VYUE9SVF9TWU1CT0wo
aTJjX2dldF9tYXRjaF9kYXRhKTsNCj4gDQoNCkNoZWVycywNCkJpanUNCg==
