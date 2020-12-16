Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697B92DBB14
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Dec 2020 07:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgLPGN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Dec 2020 01:13:26 -0500
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:25237
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbgLPGN0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Dec 2020 01:13:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biR7a+X7KL8uQMqHC8tIwsqT6DnBVLyrS87CZ486dbw8w2BiquwntN2x1HLS1kL4krufMMlPg4XPX8KYRJDibWNUR+ma/kXvzzmqFO3h8sarlOTNyMLu4SSFsfcCFy5JoPAtoV1r+9vsaYbgmrw27P/miAqvTmQvRhOW/PYT2NaVymvyHOxdCunvPyZbhrT4mcNyh/UNe/i92Rk1mt7J9+LZAdrsZfTLs+BsugoItYtMJ+/oYI4NEy1jIZrGMXl9eHt7iTPu/UjbthMNt2vJhd66Fugj2IMIEFWzzAhSUQegOf1PyYk7vBPZArUiyaVcFd0NaPz46zrgJkoNV6XSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJm7MAd6NfKxZlD4uEyJO8/8qZ3oKzMykT3TGj/i184=;
 b=aGPjIyn1CyRViLzCXlR9NDpToLHkCu4FNaUHMgfltp5yfuSrks8hF86bYofuADtGLQ7BB3Cn0/1bniJ1UIchk/512JkolY8fsxruw5El4nIUpdQ24rDqh1b69nhYHdPxvwn0G2VL1gFb9qDVw0Uy/Z+pjSh/jcNskHTe+j49BNubDKxXRPYmqzlTBq/d+Gt4VV0GMVKCPRYGeML2i94G2F/xnMXN9HhXWPF0w5YhtgtZZ9fiCawZS3TwBBgwcFEg0S7ZDko1seyd2Jpg6gI8/y6LPNZB22rrE+zx6qCl2NMPH0rSy4XGyF1LXur85A4RULf9JBhnULD6qHcAv3xVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJm7MAd6NfKxZlD4uEyJO8/8qZ3oKzMykT3TGj/i184=;
 b=JhoPaSYh1jR2OhKq22hySFNblSZYDPMeN36k/vhuxax2exrkHwszSPMixyOHsyjDUIgjNTNbvuBIjJp9qMiUb5EFgytlaUXr7S3qP4m4bSfCCJezr7+ykeHNHs6/O0yPt+iqTllqREHAcye010auef579G1QW7X7Nwp7kATgKFg=
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2839.namprd13.prod.outlook.com (2603:10b6:a03:b3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.13; Wed, 16 Dec
 2020 06:12:31 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%6]) with mapi id 15.20.3676.016; Wed, 16 Dec 2020
 06:12:31 +0000
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
Thread-Index: AQHWzR6JqEv/BdKn8Eapft4N/qmyd6nwWDeAgAD9P4CAB/NigIAAAXSg
Date:   Wed, 16 Dec 2020 06:12:30 +0000
Message-ID: <BY5PR13MB4453C2D078F13E60DAE356B982C50@BY5PR13MB4453.namprd13.prod.outlook.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
 <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
 <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
 <CAEUhbmWrCpKraUpijggkiNXa40OAnN9YJF1iFWnrnrhJZN1joA@mail.gmail.com>
In-Reply-To: <CAEUhbmWrCpKraUpijggkiNXa40OAnN9YJF1iFWnrnrhJZN1joA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [210.16.112.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82edec86-dd9d-496e-ffb9-08d8a1899268
x-ms-traffictypediagnostic: BYAPR13MB2839:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR13MB2839913A8C4EB394C687AFC782C50@BYAPR13MB2839.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZIPlPvwYzFQKUI4VhDBTSPvJvsgjzzM4XLE7OQfCxVkXSz9VteUtDotoWTOWLS5+sz4hoxSyBTivvgcw8JmUTYp4LcAfdFJSvKPhMwQl5hboxL6x+5L+vTjUgpyMyJYF+M/K9ts1ghHFdvOLkp76iv7GPRArHG9Nezb4qnbAELeEfmVZSQITu4kJhANmOimKZbMlqm35bXkPL2FcvkHYvfnAS0gQ4S9D445OQLNa0Y4o9zUK3xAxOZUwqu9+2BfFBu/MX6FmLi+u76/ZIDAkzzmXwhd7/k/k67OsdMoI3VBdkWA6CgujuX91X90I14MmNcIH+5iB4uKrICpMoa9d4byCFcxZOXfaPIcfmwcJLXI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(346002)(366004)(136003)(39840400004)(376002)(396003)(53546011)(8936002)(7696005)(5660300002)(316002)(86362001)(55016002)(9686003)(7416002)(8676002)(76116006)(2906002)(52536014)(54906003)(6506007)(66446008)(66556008)(66946007)(6916009)(4326008)(64756008)(66476007)(83380400001)(44832011)(33656002)(71200400001)(186003)(478600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bnZZM0lMcUNqYTBNeTh1S2tSc3BEY0FmQ3FJblVLeDI3b1hUOXNFbXp0WDhs?=
 =?utf-8?B?b0JzRmptTzhkZ3M0KzNma01EaVNMSVJna3JwUzNzejN2VW5VU0NyN1UrYUZo?=
 =?utf-8?B?Qk5EYU9tTlBZaDhUSzdtbVBLelFyMm9YNFFZRVIzYkRTYlQ4YzByQU9yeWs3?=
 =?utf-8?B?OStxNlJJQUh6V3p2cVVJNVF3b3RXL1F6NDZiQ1FVR2dJaUM1OFBuYzJnblBH?=
 =?utf-8?B?dXVjTnoxWEdScHFlMnF5YlRIcjE5b1duT2N6bFBUdWRpQk5TcVRQckh1azJS?=
 =?utf-8?B?S1BoaWlGTjBJamhVemVDMDNnVmRJT0NwV2gzYXlZTjFnY2ZrSkxpakxDcndT?=
 =?utf-8?B?Y2puK3h3K0N3aHA2UFhTZmNaK0xsZ2kwK2sralczSGFkQmhHK2dkU2RZVHlV?=
 =?utf-8?B?Q3QxOGJYcEVLa0E2T2tFM0VJeUpiNGRtaFkxUlpCWVBxSk1rNXlQck9VcjhG?=
 =?utf-8?B?dmFQRk4xZUFDUGQxZGRrdVdtTSsySm9FSVRJT2JVVmk2Z3R4aXlOVWhwVnA5?=
 =?utf-8?B?dWsyb0ZSVURra1pkMGlZYVZjMnhMcllCM3dQZnNPLzBvblpmbEZJejYrYnU3?=
 =?utf-8?B?Q1YyQStUcktlMWVkcWF6aTlob01mdWlwYUR2NjNEN0JnTVpvdGFzWmk0ajEz?=
 =?utf-8?B?K3Nsa2dTOGJQNXZRQzNNK21lREpscXVCTEZXMC8vWTZaaGVCUGR6V081TG9r?=
 =?utf-8?B?dUNaNXZJSFFnQXJUQ0Y1UnJaTXZzWE9sU2tZSi9sNTk1WFdkdjVzQnJNNDRm?=
 =?utf-8?B?UzJ3R2JHSFcwNXhybU9JTlkxR3ZJQTZDVUFNQ1VIV2xHbitmc0lNUWZibXdR?=
 =?utf-8?B?WGhNODhUa2NQM2NrRWwwZnZIVU9GWEVMNUhrRkErbGZnSjB1L0ljN0Npc2VS?=
 =?utf-8?B?THhlUGYvbWxXUnR3UXNSR2ROaERKSnlibUNFNDJ0WUxpQ0NnR2Fkd1E5Q0t6?=
 =?utf-8?B?ZXltR1B3Tmdsa2MzWC9UakQrVnhpZ0xIZ0hPMmZrVGFXQjNTc1Y1dGNXZEU4?=
 =?utf-8?B?aFlmYlM1d3VXWE9kK2JOdURBNFJPMFV4K2ErZkVsbENBVFFRNzJtSUw3QlBI?=
 =?utf-8?B?MThiTmQ0TjIrK1JxSWJBbW5qTG1iQkJocHFvNVpERjdvMnhVdzlJQkhGdW1U?=
 =?utf-8?B?RVJxVHFjYm0rVjN1OVNvRE5vblYwK2hMRmFGSXBsREszUzdiVTlJSERCZU9N?=
 =?utf-8?B?bUEvb1dkTjczZlQ2MUYrb1ZjRTRHaWg4S1BMQUlTaVNINDBjVnVRRVU4NnRy?=
 =?utf-8?B?TmNUa1J2NUE3bmFicVRBTzRnRkR4eUlqQ0QwUlpKRzkrZllQODZwRVRkelEx?=
 =?utf-8?Q?hwEhLpQmU96hA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82edec86-dd9d-496e-ffb9-08d8a1899268
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 06:12:30.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWeSGkm3RgdQA3Y+VOf4d5ghCD/M3fht8PQkfMZdKUOxIw/0RrMvhxW3cTW/BfGbcus0BITiO5AZmqLi8xxKSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2839
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaW4gTWVuZyA8Ym1lbmcuY25A
Z21haWwuY29tPg0KPiBTZW50OiAxNiBEZWNlbWJlciAyMDIwIDExOjM2DQo+IFRvOiBZYXNoIFNo
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
ZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgWWFzaCwNCj4gDQo+IE9u
IFdlZCwgRGVjIDE2LCAyMDIwIGF0IDE6MjQgUE0gWWFzaCBTaGFoIDx5YXNoLnNoYWhAb3BlbmZp
dmUuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+DQo+ID4gPiBTZW50OiAx
MCBEZWNlbWJlciAyMDIwIDE5OjA1DQo+ID4gPiBUbzogWWFzaCBTaGFoIDx5YXNoLnNoYWhAb3Bl
bmZpdmUuY29tPg0KPiA+ID4gQ2M6IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXNl
cmlhbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiA+ID4gcHdtQHZnZXIua2VybmVsLm9yZzsg
bGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsIDxsaW51eC0NCj4gPiA+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1yaXNjdg0KPiA+ID4gPGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmc+Ow0KPiA+ID4gZGV2aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0NCj4gPiA+IDxsaW51eC0gZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc+OyBicm9vbmllQGtlcm5lbC5vcmc7IEdyZWcNCj4gPiA+IEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgQWxiZXJ0IE91DQo+ID4gPiA8YW91
QGVlY3MuYmVya2VsZXkuZWR1PjsgbGVlLmpvbmVzQGxpbmFyby5vcmc7DQo+ID4gPiB1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IFRoaWVycnkgUmVkaW5nDQo+ID4gPiA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPjsgYW5kcmV3QGx1bm4uY2g7IFBldGVyIEtvcnNnYWFyZA0KPiA+ID4g
PHBldGVyQGtvcnNnYWFyZC5jb20+OyBQYXVsIFdhbG1zbGV5ICggU2lmaXZlKQ0KPiA+ID4gPHBh
dWwud2FsbXNsZXlAc2lmaXZlLmNvbT47IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5j
b20+Ow0KPiBSb2INCj4gPiA+IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEJhcnRvc3og
R29sYXN6ZXdza2kNCj4gPiA+IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPjsgTGludXMgV2Fs
bGVpag0KPiA+ID4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgNy85XSByaXNjdjogZHRzOiBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUN
Cj4gPiA+IFNpRml2ZSBGVTc0MC0NCj4gPiA+IEMwMDAgU29DDQo+ID4gPg0KPiA+ID4gW0V4dGVy
bmFsIEVtYWlsXSBEbyBub3QgY2xpY2sgbGlua3Mgb3IgYXR0YWNobWVudHMgdW5sZXNzIHlvdQ0K
PiA+ID4gcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
PiA+ID4NCj4gPiA+IE9uIFR1ZSwgRGVjIDgsIDIwMjAgYXQgMzowNiBQTSBZYXNoIFNoYWggPHlh
c2guc2hhaEBzaWZpdmUuY29tPg0KPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gQWRkIGluaXRp
YWwgc3VwcG9ydCBmb3IgdGhlIFNpRml2ZSBGVTU0MC1DMDAwIFNvQy4gRlU3NDAtQzAwMCBpcw0K
PiA+ID4gPiBidWlsdA0KPiA+ID4NCj4gPiA+IEZVNzQwLUMwMDAgU29jDQo+ID4gPg0KPiA+ID4g
PiBhcm91bmQgdGhlIFNpRkl2ZSBVNyBDb3JlIENvbXBsZXggYW5kIGEgVGlsZUxpbmsgaW50ZXJj
b25uZWN0Lg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGZpbGUgaXMgZXhwZWN0ZWQgdG8gZ3JvdyBh
cyBtb3JlIGRldmljZSBkcml2ZXJzIGFyZSBhZGRlZCB0bw0KPiA+ID4gPiB0aGUga2VybmVsLg0K
PiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZp
dmUuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZl
L2Z1NzQwLWMwMDAuZHRzaSB8IDI5Mw0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5MyBpbnNlcnRpb25zKCspICBjcmVhdGUg
bW9kZSAxMDA2NDQNCj4gPiA+ID4gYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAw
MC5kdHNpDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NpZml2ZS9mdTc0MC1jMDAwLmR0c2kNCj4gPiA+ID4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Np
Zml2ZS9mdTc0MC1jMDAwLmR0c2kNCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+
ID4gaW5kZXggMDAwMDAwMC4uZWViNGY4YzMNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9mdTc0MC1jMDAwLmR0c2kNCj4gPiA+
ID4gQEAgLTAsMCArMSwyOTMgQEANCj4gPg0KPiA+IC4uLg0KPiA+DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICBwbGljMDogaW50ZXJydXB0LWNvbnRyb2xsZXJAYzAwMDAwMCB7DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDA+Ow0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLXBsaWMi
LA0KPiA+ID4gPiArICJzaWZpdmUscGxpYy0xLjAuMCI7DQo+ID4gPg0KPiA+ID4gSSBkb24ndCBz
ZWUgYmluZGluZ3MgdXBkYXRlZCBmb3IgRlU3NDAgUExJQywgbGlrZSAic2lmaXZlLGZ1NzQwLWMw
MDAtcGxpYyI/DQo+ID4NCj4gPiBUaGF0J3MgYmVjYXVzZSBpdCBpcyBub3QgcmVxdWlyZWQuIFRo
ZXJlIHdvbid0IGJlIGFueSBkaWZmZXJlbmNlIGluIGRyaXZlcg0KPiBjb2RlIGZvciBGVTc0MCBw
bGljLg0KPiANCj4gQXJlIHRoZXJlIGFueSBkcml2ZXIgY2hhbmdlcyBmb3IgdGhlIGRyaXZlcnMg
dGhhdCBoYXZlIGFuIHVwZGF0ZWQNCj4gZnU2NDAtYzAwMC0qIGJpbmRpbmdzPyBJIGRvbid0IHNl
ZSB0aGVtIGluIHRoZSBsaW51eC1yaXNjdiBsaXN0Lg0KDQpZZXMsIHRoZXkgd2lsbCBiZSBwb3N0
ZWQgc29vbi4NCg0KLSBZYXNoDQoNCj4gDQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgZXRoMDogZXRoZXJuZXRAMTAwOTAwMDAgew0KPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLWdlbSI7DQo+ID4g
Pg0KPiA+ID4gInNpZml2ZSxmdTc0MC1jMDAwLWdlbSI/DQo+ID4gPg0KPiA+DQo+ID4gU2FtZSBy
ZWFzb24gYXMgYWJvdmUuDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPiANCj4g
UmVnYXJkcywNCj4gQmluDQo=
