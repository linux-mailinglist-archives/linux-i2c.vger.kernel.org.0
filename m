Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763FD2DBA96
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Dec 2020 06:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgLPFZg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Dec 2020 00:25:36 -0500
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com ([40.107.223.80]:24263
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725769AbgLPFZf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Dec 2020 00:25:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmIERudXlfnvUIs5N5bkxl/PlKb4PCPk1qnTIWFP52cWkwx42yAYk7Yvz4LEgGOBqFJckDUQ7te3uPhic5RmFmayjaVlXaIhOUP9Hfzn04LkM92bxfWpR10nMpcPYDaHR6SnF2HqIFn8QjnD05lA/IcWx8VwdQkFvXprsMiYueZsYA/6411K89qNUsoav1CoFW1NKEg6w5ml5Mz75wNnHt/X8w1gD86eLKjr+eETSuP1ljv5hgpq7oEhzIGteKdiuWjik+wKARFpHOv5ZXW2SMEMjSVyUl7S4MUu5Re0g8FYlPVirVKYoGLXTbNkSlBwUm8nBNuYjoENA4DdfkgBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSHyvUV2qzlSRHiYEb0GMLRXElAm4OM1SaM93lMUFw=;
 b=MR6d8H5aYNKaiMwncyVuTOOkrZaO6D6oIk5K8054L0ya4GI37YaJuZEEtnkx2YTv1IJGY5Wxak5VveQm1m1QI423uTpVe1r0dqKcEiOIuDiUvFCZ/HytdMyyr625ipF7qBgykndxuf/xGIwOxzDRHCQ7DDBsB5x/CIMuXdeLgUo8OVw/+RRTF09bSpee9cpw2DO0K6N7XSf2t72tfrGLCsDhNu4HQWU7n6lch04WKczHpgF4F/loDwRjP5vZMv0awpAE7lyu/BZuAs3xzkof92Y5zWvt6gMAEE0xS3jYKI5jW0oag1dgKXpAldJ40XxZiCsNm+RD9Jvq0YUWI/41jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSHyvUV2qzlSRHiYEb0GMLRXElAm4OM1SaM93lMUFw=;
 b=ELrN9HHqe3XVYVPzAPKsfh9NS57RQQHI/EgRbzHpcoBJnES0R4X4vVUQ9H0k2h4xCqHxdSdApalsiggVCEEjJXPCuIPskR5BpAYy0H0DvUGmR1ZpUsWy6surnq24J+eLWBtBkEAXIdtedqGylYOLcxqUOITrjl/WGMPX7Z8coVs=
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3617.namprd13.prod.outlook.com (2603:10b6:a03:21b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.10; Wed, 16 Dec
 2020 05:24:42 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%6]) with mapi id 15.20.3676.016; Wed, 16 Dec 2020
 05:24:41 +0000
From:   Yash Shah <yash.shah@openfive.com>
To:     Bin Meng <bmeng.cn@gmail.com>
CC:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        Peter Korsgaard <peter@korsgaard.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Thread-Topic: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Thread-Index: AQHWzR6JqEv/BdKn8Eapft4N/qmyd6nwWDeAgAD9P4A=
Date:   Wed, 16 Dec 2020 05:24:41 +0000
Message-ID: <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
 <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
In-Reply-To: <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [210.16.112.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29bf9f61-d1e4-41a6-f20f-08d8a182e439
x-ms-traffictypediagnostic: BY5PR13MB3617:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR13MB3617423047955F0F0ADB806182C50@BY5PR13MB3617.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v46q1aiGwjGe1NAAsMQgFeSVNVsiQ8kU80u7v/9275yHf0KGpKTqktA6R0MMksPRVnDuuNiNujFye8Dw/KvmimoToKZvs5kGmVs6Hw7zbF94KLC62vGVK7qp7YIyPjfTksiFcFVAb448xowj49BxQw3M4lnl40OwephJ2IrNcY1S0rdEDbNaVF1VNWWgxcragy7sD/A8QhP2K1nDhZLHUjJOhsTVZ4H7hMgNnnScbkx7bw1WZZYnHC4YKxI0tpBDQfDnJznhihqTZWCrxj5e3bVVrzQzCYCXqcbndKy+8bI9AquzhKg9LxEr+NTgsvENcFfM1Ol9EItTKldqlyENsktr2ePDHyh+eRp0nW0a+9I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(376002)(366004)(39840400004)(136003)(346002)(5660300002)(33656002)(66556008)(64756008)(7696005)(6506007)(66446008)(66476007)(8676002)(83380400001)(26005)(8936002)(2906002)(478600001)(86362001)(186003)(7416002)(9686003)(6916009)(66946007)(52536014)(316002)(55016002)(54906003)(4326008)(76116006)(53546011)(71200400001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?alBRdGtsTlI4RzIwYVZ6dmJZc3A4SkJiempFWGxieDZIZlZ5NEprSEk3UEhu?=
 =?utf-8?B?OWNkZzBHcnJhVDVzVDBIZUZQWndiUE0vSG1HNVdPUzZFQVpxdHZWRzBFUXFl?=
 =?utf-8?B?bCtNQU1IVHA1S09aRUZJMjhPbUR4T0RycUNjVWhWWkVWVmhUVk5VdGs5b1RB?=
 =?utf-8?B?L1hxS094Y2xCRU9WRHcvNlJJUW5EZXFnQU03NmlwSDV3czgrcDlVbWg2Q2ZS?=
 =?utf-8?B?cVB4R2gzMjhMdlRlTzVnMTBwTU55T2JUS2ZjdmdQUkJQdktOWkh4VEZkZ2RY?=
 =?utf-8?B?bEdtYjdIU0ptdnRXUGI4NloxNXJ1NEVPbk1nNDcxL29QdE1LbWM0YXE5NUw3?=
 =?utf-8?B?L3kyVTRCK1BNeG90azZLS0V4ZG1XNjQvdlV3WXBqZHNuT2RyVXRNWXZnQlQ4?=
 =?utf-8?B?RlJOYTdtRzIvL01rZE5FM3FiTDJFWTlkeEdyUzZlaitjcVpnb2ZSY0NKNVpi?=
 =?utf-8?B?NEprOGdBa0ZBMG14aC9vMWsyN1RsT1A0ZVMzZ1FIaGdEaXZSL2ZKb0tzaEEz?=
 =?utf-8?B?T0dueHI2WTVydWpFTlhNd2p5akpnVkhBaUpmQjRmTnlQU1dvOGhBRVFFd21O?=
 =?utf-8?B?N1I1MnF0Q3ArVHhXUnplMldKY1V5ODRCRi9OVmJuM01kbVJOUjFYWDREQkxx?=
 =?utf-8?B?ZDBtZUhCeEVkbmM3S0pDUkE1ZS85M2hVSzBrbW1sNFBBTmJXdTRNVXdveldL?=
 =?utf-8?B?VnUxMlFIbjRmcFRlbTNwRWFTblFFL2ZCRFNRZ052V0FyR2FLTmI4VW9QS2dq?=
 =?utf-8?B?VEp5ckNTeXYrWi9lbGs1Q29FSkEwUyt6bGVwM1l0SDhPMGx2VndMaENvdFp0?=
 =?utf-8?B?VVpSVjRVMm5rN1Z3SUFma2R0YkJWYzZIY3NkZGJVN2dxNmlCdXJvWVVtL3lr?=
 =?utf-8?B?N3VhOWk1TTJLTUhnQU0yN3cva0I5RlZHdDl6Rk1VMWhPanJNQjBoRmtwelQy?=
 =?utf-8?B?cHh6V0VJZzNCbktucVVUWENickdIUE5IQ3BxeWxhbTBhYUZ2TFVaclF0bFd2?=
 =?utf-8?B?S2RaOE9KWVJncFVaVVdoandIQzBJNWRIdHVkZisvVG5KbEl0NStVcjVUYWJB?=
 =?utf-8?B?S2Zub3g5dDlnVUpDU21OamZxblVNN1FWaEF3L3ZMaE5NcVQ1MUlrbXJwSHJC?=
 =?utf-8?B?QVQ2Nm9HcDQ5Y1JmRWhiTXowK0pSRU9KQ0tpR3hLenVkanJlSm1aRHZGYlVP?=
 =?utf-8?B?RmhiYTRNTGhtY1dHMVpiZW1DSGlOcFJrOFp1RllSSllkUmwySzErcGNuRDlD?=
 =?utf-8?B?UTNOcFhXK29RRC90V3VnQ01DYkV3M0haNnhWdlFBTWNKVHRGdXUyS0oxZmoz?=
 =?utf-8?Q?4lrXcAwteIA1Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bf9f61-d1e4-41a6-f20f-08d8a182e439
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 05:24:41.8254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtHNmWdDg5r/zSsqCbcITxKQAk853Q5GWsFcuO6cunHnRlH/jJUK1sXUQIXPK5kR26oBg59fHX5fdz96Zdnc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3617
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaW4gTWVuZyA8Ym1lbmcuY25A
Z21haWwuY29tPg0KPiBTZW50OiAxMCBEZWNlbWJlciAyMDIwIDE5OjA1DQo+IFRvOiBZYXNoIFNo
YWggPHlhc2guc2hhaEBvcGVuZml2ZS5jb20+DQo+IENjOiBsaW51eC1zcGlAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1zZXJpYWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcHdtQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsIDxsaW51eC0N
Cj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LXJpc2N2IDxsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnPjsNCj4gZGV2aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc+OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0gPGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZz47IGJyb29uaWVAa2VybmVsLm9yZzsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz47IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PjsN
Cj4gbGVlLmpvbmVzQGxpbmFyby5vcmc7IHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZTsg
VGhpZXJyeSBSZWRpbmcNCj4gPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT47IGFuZHJld0BsdW5u
LmNoOyBQZXRlciBLb3JzZ2FhcmQNCj4gPHBldGVyQGtvcnNnYWFyZC5jb20+OyBQYXVsIFdhbG1z
bGV5ICggU2lmaXZlKQ0KPiA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPjsgUGFsbWVyIERhYmJl
bHQgPHBhbG1lckBkYWJiZWx0LmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPjsg
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDcvOV0gcmlzY3Y6IGR0czogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIFNp
Rml2ZSBGVTc0MC0NCj4gQzAwMCBTb0MNCj4gDQo+IFtFeHRlcm5hbCBFbWFpbF0gRG8gbm90IGNs
aWNrIGxpbmtzIG9yIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZQ0KPiBzZW5k
ZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVHVlLCBEZWMgOCwgMjAy
MCBhdCAzOjA2IFBNIFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIFNpRml2ZSBGVTU0MC1DMDAwIFNvQy4g
RlU3NDAtQzAwMCBpcyBidWlsdA0KPiANCj4gRlU3NDAtQzAwMCBTb2MNCj4gDQo+ID4gYXJvdW5k
IHRoZSBTaUZJdmUgVTcgQ29yZSBDb21wbGV4IGFuZCBhIFRpbGVMaW5rIGludGVyY29ubmVjdC4N
Cj4gPg0KPiA+IFRoaXMgZmlsZSBpcyBleHBlY3RlZCB0byBncm93IGFzIG1vcmUgZGV2aWNlIGRy
aXZlcnMgYXJlIGFkZGVkIHRvIHRoZQ0KPiA+IGtlcm5lbC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaSB8IDI5Mw0KPiA+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOTMgaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUv
ZnU3NDAtYzAwMC5kdHNpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0
cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpDQo+ID4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2
ZS9mdTc0MC1jMDAwLmR0c2kNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAuLmVlYjRmOGMzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsMjkzIEBADQoN
Ci4uLg0KDQo+ID4gKyAgICAgICAgICAgICAgIHBsaWMwOiBpbnRlcnJ1cHQtY29udHJvbGxlckBj
MDAwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0g
PDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDA+Ow0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NTQwLWMw
MDAtcGxpYyIsDQo+ID4gKyAic2lmaXZlLHBsaWMtMS4wLjAiOw0KPiANCj4gSSBkb24ndCBzZWUg
YmluZGluZ3MgdXBkYXRlZCBmb3IgRlU3NDAgUExJQywgbGlrZSAic2lmaXZlLGZ1NzQwLWMwMDAt
cGxpYyI/DQoNClRoYXQncyBiZWNhdXNlIGl0IGlzIG5vdCByZXF1aXJlZC4gVGhlcmUgd29uJ3Qg
YmUgYW55IGRpZmZlcmVuY2UgaW4gZHJpdmVyIGNvZGUgZm9yIEZVNzQwIHBsaWMuDQoNCi4uLiAN
Cg0KPiA+ICsgICAgICAgICAgICAgICBldGgwOiBldGhlcm5ldEAxMDA5MDAwMCB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUsZnU1NDAtYzAwMC1nZW0i
Ow0KPiANCj4gInNpZml2ZSxmdTc0MC1jMDAwLWdlbSI/DQo+IA0KDQpTYW1lIHJlYXNvbiBhcyBh
Ym92ZS4NCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KLSBZYXNoDQoNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljMD47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDw1NT47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MCAweDEwMDkwMDAwIDB4MCAweDIwMDA+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwweDAgMHgxMDBhMDAwMCAweDAgMHgxMDAwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBsb2NhbC1tYWMtYWRkcmVzcyA9IFswMCAwMCAwMCAwMCAw
MCAwMF07DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicGNsayIs
ICJoY2xrIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnByY2kgUFJD
SV9DTEtfR0VNR1hMUExMPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JnByY2kgUFJDSV9DTEtfR0VNR1hMUExMPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICBwd20wOiBw
d21AMTAwMjAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
c2lmaXZlLGZ1NzQwLWMwMDAtcHdtIiwgInNpZml2ZSxwd20wIjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwIDB4MTAwMjAwMDAgMHgwIDB4MTAwMD47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYzA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8NDQ+LCA8NDU+LCA8NDY+LCA8NDc+Ow0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmcHJjaSBQUkNJX0NMS19QQ0xL
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjcHdtLWNlbGxzID0gPDM+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAgICAg
ICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgIHB3bTE6IHB3bUAxMDAyMTAwMCB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUsZnU3NDAtYzAwMC1w
d20iLCAic2lmaXZlLHB3bTAiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eDAgMHgxMDAyMTAwMCAweDAgMHgxMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBp
bnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDw0OD4sIDw0OT4sIDw1MD4sIDw1MT47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY2xvY2tzID0gPCZwcmNpIFBSQ0lfQ0xLX1BDTEs+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICNwd20tY2VsbHMgPSA8Mz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAg
ICAgICAgICAgICAgY2NhY2hlOiBjYWNoZS1jb250cm9sbGVyQDIwMTAwMDAgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NzQwLWMwMDAtY2NhY2hl
IiwgImNhY2hlIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjYWNoZS1ibG9jay1zaXpl
ID0gPDY0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjYWNoZS1sZXZlbCA9IDwyPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjYWNoZS1zZXRzID0gPDIwNDg+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNhY2hlLXNpemUgPSA8MjA5NzE1Mj47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY2FjaGUtdW5pZmllZDsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljMD47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDwxOSAyMCAyMSAyMj47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDIwMTAwMDAgMHgwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgICAg
ICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW86IGdwaW9AMTAwNjAwMDAgew0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NzQwLWMwMDAtZ3Bp
byIsICJzaWZpdmUsZ3BpbzAiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVw
dC1wYXJlbnQgPSA8JnBsaWMwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHRzID0gPDIzPiwgPDI0PiwgPDI1PiwgPDI2PiwgPDI3PiwgPDI4PiwgPDI5PiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDMwPiwgPDMxPiwgPDMyPiwgPDMzPiwg
PDM0PiwgPDM1PiwgPDM2PiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPDM3PiwgPDM4PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4
MTAwNjAwMDAgMHgwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ3Bpby1j
b250cm9sbGVyOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZwcmNpIFBSQ0lfQ0xLX1BDTEs+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAg
ICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiANCj4gUmVnYXJkcywNCj4g
QmluDQo=
