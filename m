Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795E57280B7
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 14:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236608AbjFHM5e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 08:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236328AbjFHM5b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 08:57:31 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059CE2D70;
        Thu,  8 Jun 2023 05:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlgQgPurQ7aBbeOb/Hrov3WOgKkcY/cq17sQ/v70ktyviotw7KVplBZk/IHystD8oQcgF7tqxe0nECLLrZQ2yl1p9ayWNEZOxnXb6XL1Y/xIaKmReyYJFV4W5WcxWKQWNH7R9VgHHf3OEY7Vpqw10JBsiIpgd6BPEI4l2u5r7VhIvXloTyzc4VF4L6cq+KcIcJ8F5YpuVJXd3tkrbluh8QJJ0UFTLwuf+wSoPhXR8ebCcFUyZh7RxPehPAwT6bdrwlxh8EZgfnH4l4fbvxY49QKcymh2qE/Ar+qP+bVjw3VBiQwuZO2hz00oSh5EmXSs2Edo5uUAmpefUoEXrBtIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzT5uN0bG29qxggYRkLw/c1lgWTWBv4FL3UpZ+XI6aI=;
 b=cCvA5Xy7D9/z6wBBQZlNon0QBnwXFZtuSIerEfPdpf253KY4yXQxPdJxYGORD6Hq2pVqDXI1Fyu2GQOJuzc+ItvICKQuB5hxEnnfpfi1J4wZ5uCde/7OgZPsEgKkNewT3pm9+kWQ1iUn3WvMfs0clXCh0n6iqc//e4VGSzKTPJp7TGEUtw9kMaXRyAgISLg9NTip4oEOXaqUxfC3JX8RKoY+GdyOntNIVbE/57bmFW14lgFfVnZS3Ke/TrY+vJd7kLnXdw4VBUdZQhZK+sqHuWOg8EJmc4ZqeqebMkD2gYWaTBvHlx7AnfMbWsO7HGHjad+MvA9CuYxU/RaPXLO8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzT5uN0bG29qxggYRkLw/c1lgWTWBv4FL3UpZ+XI6aI=;
 b=c4GMKzK6PpOqltzWDuC8NHPQJZT7oFuCIUa3wIzj2C+zIjLK5WKXbgwsiZ5mjxrofFuUANzh9CLl3WbkHx7dOpmMiIcpfc0iaxHJLEN/doD94SZr4r5TRMG7yhB1G3emKfBkL/EmPLOTz86+eVVROqwwSQ/2f6OpBt9vDXAZHlo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10161.jpnprd01.prod.outlook.com (2603:1096:400:1e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 12:57:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Thu, 8 Jun 2023
 12:57:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmA=
Date:   Thu, 8 Jun 2023 12:57:15 +0000
Message-ID: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
In-Reply-To: <20230608125019.GD26742@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10161:EE_
x-ms-office365-filtering-correlation-id: 2db3f2cf-6bfa-43fa-ec1d-08db681fe2bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8ltsi8E1wVZ2v5UYh8Q7ScJtgAVXDfmWuAlraVmo1movWf4ZnH2PvTfsRJ++Qq64WBp6JatUfXAMk97fa8mAOQDQ2BvJ2eXkL+AuI+7So4pgmfymWuqzg4MuZa/EbFc2lZrpATUnH5EbjhkYMs1JwHjr0tofcI7MLKbTk6E01JgiqOUS7fKs+UPv5KpGYgu8NuGXEIBFih9h/POmAFrzN+koE/3Hvg8/tDPQbC0kdRn4BByH78lNwN/dQvjxq75PJ0113S8ygjoIuOpsiRHEXkm7SxVE0lJC9FJzq/MBdDPRxhbuKbBq9JhDNt0f5n23I4rTq7DKkeegB+OQPTn46MrSQAkNzMyC+xn9d8LxFlsISFSYNarlAf0KLJdAE72SU9ZBo2op+MGfvCkUYK7OTTg8c5bgjX8kSS6qgKcBGYK+pb/uMZp8ZZ2d/dflvxwJPDLvYjb10mECV5s1o6M3OXQly3qdw2pJgYzlqarq3CYQdU51A816aXP15qMG0Setim/2A/c+8Cm2FHaH4aJU4cD6SxYlzxvu6IgMql0JzSaZh6hckAujxR+Q3e6o0qdeRaRZh023osqeuyL6JtJ5aAf2S/vAa76YkE4PR7F2ufKGtFAILmXpktTTwgWL46E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(55016003)(26005)(186003)(41300700001)(52536014)(5660300002)(9686003)(6506007)(33656002)(7416002)(7406005)(4326008)(66556008)(64756008)(66446008)(66946007)(66476007)(71200400001)(76116006)(8676002)(83380400001)(478600001)(8936002)(54906003)(6916009)(86362001)(2906002)(38070700005)(122000001)(7696005)(316002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlBEOG1WUlhpWklsRFgwZ3dZWVlKY000dkxxY2VTN3RkV0NVVHpQVWJrWUgv?=
 =?utf-8?B?S0JmdXB6blB5RlBORjBnTHRTZHdzbjVQT09qa3BVMTNBMzFQZnZtSjBZd21H?=
 =?utf-8?B?NnlmeXVjcWFwb2ZJbGpVZVM2andTUG1YNXNWUVJPVXRuT2JRZEtJOWp2K05I?=
 =?utf-8?B?UVNDM0JhNHF3TWZVZHorWE5qR2NsTDlUTWZnUDF4OHpRQUVDZGdPRXJGcERq?=
 =?utf-8?B?YXBRVkxOcVJMcE5GRzdTcmJad1Bkd2cvejhEY0l0bm1HbkllbituaVJvaFBk?=
 =?utf-8?B?RlZWSjQ5TW1XQlBaZ2RtNlpZWFNsYkk1V3huc2FZOVZWMFZhMUYxTkZoUVh3?=
 =?utf-8?B?TmNEdlpqZm93amVINnFxSW9icTljRXh1Q0ptOHU3RDVtL1RqUllNK3JKeDA4?=
 =?utf-8?B?UlUzY2xNQzZTM2phdE9wRWN1YjhYWkNsOTdFd2M3aWJYd28wbGk1KzF1Ukw2?=
 =?utf-8?B?OWxiYVF2KzJ3emw0aHNXUUFvUDcwZU9HN0N0KzlHbGlPVVpwR0NnYndvU09T?=
 =?utf-8?B?dVc1a1RBMGRZdkJTdWs5TUcxSTZnRFlCVlVrUXZQd040OEJvMUc4NEo5R0tp?=
 =?utf-8?B?enhsbjR2dHFIWVZiTGJzTTVsRDdqbW1TQUViQjlxSjRkd2t0MmRLUFdxUlFZ?=
 =?utf-8?B?OXpITWFxZGtpaEY3U0VhUGJ2MkgrRkNuamticGhKY1V5MUJ2T0ZkUll2VGRP?=
 =?utf-8?B?Q2ZwV3MrUko1SHNNV1Q2di8xV05NS21VWGVqZTNYTThsSWJ2Q2tuNmFybFR0?=
 =?utf-8?B?T0JvZGZqVGU4U2ljYUZKM2FTQWRkVEpJSjVXQTF0dHNhRFVaRkpuZFhiMGd6?=
 =?utf-8?B?QnZld0lIUFV4NDQ5QlZZWjFndzJaNDIvL2xmL3ZsSnRqZk5xSEJ6NERDS0la?=
 =?utf-8?B?amtCR21kMTFvVkE1MlowVG1QdnVuTHJLc3V4clRVUUkrTjE4TFdhVE5wRnBL?=
 =?utf-8?B?blFUMGhKeUFldWlzZG5YUUdHOGttN2EyUXVWdXRLOEJJcDlRS01NMC80MDFW?=
 =?utf-8?B?L254S2JyUmVqNURYN0huV3ZpNC9mUHo0WHRKaG1sUEpFV3JsaWJBREFlckNy?=
 =?utf-8?B?eDFRMXF3VWJoY01qMEJIamRRaGdmNVl4Vk9JN0ZMeHFQdzdsSGErYmtoT1pr?=
 =?utf-8?B?Wkg3UFJxdCtTSVBRci85TlZFVTNMeWN5Yi9DamZ2MkJodVFJVnVNZHh5QTIx?=
 =?utf-8?B?MFR5WUtUNDNoZHpyUFFRajVMUmFBdWViYlZ4cUhxL3ZxRCtFOS9rekZjSnJq?=
 =?utf-8?B?Z2dUWHduL2ZHUlM0aWxNMXY3bitTK3ZXZFpGZEtVZnpkbmtwbXdSZVdoQTJr?=
 =?utf-8?B?aFRiOU1aME01RHoxMVRvTnpGNlVZZHlyOEpOcU5zSUNvalpZWlNMd3BFSEQw?=
 =?utf-8?B?dk1DU1UwNm5rM0hFT3N6emUwUHhud0xTc053M0ZvQ3k5aXZTMEZZMk9oOUk5?=
 =?utf-8?B?QXg2Mnp2V3hXOUJxZjhqbUtnTkNoZFdLZWVPSTBsRkhWaFdVcnF5Y0N3VGhT?=
 =?utf-8?B?WmVKMDdONU9VZnZsK2RpamdWNExUSS9UTzd4VHRwSldXK2hUcjJ5Q21TSkpO?=
 =?utf-8?B?NVZIYzFjR08zZ1FLQ252TDhWcGdYc2ZxVVRFY1RVemZiM0xxZzlOUUZSRE91?=
 =?utf-8?B?NkJmN0kxbzhsTndQNkQyRGVSSkJnNFAwWmkxZlFZRFIzaG5XRXlYK1VMSGVS?=
 =?utf-8?B?dmVvVEQwVFR2OGlBVnU5OVpVbGpJUFVnd0hXMUNGN0FlV0wvRm9PU3NLRUVq?=
 =?utf-8?B?WStkYVcxWmZkeVN0Z1Y5Tmhsb3pRV2VWbmpqL3RWdGdhUkZuY0JBS3lva2Vi?=
 =?utf-8?B?NnBreGNGb2E0WlFZdVB6SldsanBwMmVWYWZ0dkNJSzg4MHl6QzVNV0Jyd2U3?=
 =?utf-8?B?T21oeksrdGNkR0taSkE3dFRsNHRaSFNpeHpoRWljZlZONWE2aFJUanNyNHVW?=
 =?utf-8?B?T0Z2R3RNS3pBeFNrVVAwRTVQMW0vb1lMZk5EeXNyQkhoNzg3c0QvRkhKL1NB?=
 =?utf-8?B?VW1Rd2NxU0t3Y0FIK2hRdTdoL3Z3b2NRZmNOTEY1WW5wY0daV05BTVEwajA0?=
 =?utf-8?B?dHJZaGc2QjRJbnZSYXhKb21meEt4VmFJWSs5dHBCeEZrSzJmakEvYWdsTTgy?=
 =?utf-8?Q?TdhLGQLrKXflr/8+fhrawYBFy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db3f2cf-6bfa-43fa-ec1d-08db681fe2bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 12:57:15.9989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTqZbuqb91hnf/Zq7Wy00SJa2JzDFPMVEE/yZoGa1V1hW41GMBG4uakn8ucaT3UGwbqZ02NA9gmWzdWyjGbSCkl3Y0oD5WXJ+3z8w68E8Xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10161
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBB
UEkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAxMTowMDox
OUFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUg
MDEvMTFdIGkyYzogRW5oYW5jZSBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UNCj4gPiA+IEFQSSBP
biBUaHUsIEp1biAwOCwgMjAyMyBhdCAwNjo0MTozNUFNICswMDAwLCBCaWp1IERhcyB3cm90ZToN
Cj4gPiA+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UNCj4g
PiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJDQo+ID4gPiA+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UNCj4gPiA+ID4gPiA+IGkyY19uZXdf
YW5jaWxsYXJ5X2RldmljZSBBUEkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBIaSBhbGwsDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gc29ycnkgZm9yIG5vdCBiZWluZyBhYmxlIHRvIGNoaW1l
IGluIGVhcmxpZXIuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBJbiBCaWp1J3MgcGFydGlj
dWxhciB1c2UgY2FzZSwgdGhlIGkyYyBkZXZpY2UgcmVzcG9uZHMgdG8NCj4gPiA+ID4gPiA+ID4g
dHdvIGFkZHJlc3Nlcywgd2hpY2ggaXMgdGhlIHN0YW5kYXJkIGkyYyBhbmNpbGxhcnkgdXNlIGNh
c2UuDQo+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsIHdoYXQncyBzcGVjaWFsDQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gTm90IHF1aXRlLiBhbmNpbGxhcnkgaXMgdXNlZCB3aGVuIGEgKmRyaXZlciog
bmVlZHMgdG8gdGFrZQ0KPiA+ID4gPiA+ID4gY2FyZSBvZiB0d28gYWRkcmVzc2VzLiBXZSBhbHJl
YWR5IGhhdmUgZGV2aWNlcyBidW5kbGluZyB0d28NCj4gPiA+ID4gPiA+IGZlYXR1cmVzIGludG8g
dGhlIHNhbWUgY2hpcC4gSSByZWNhbGwgYXQgbGVhc3QgUlRDICsgRUVQUk9NDQo+ID4gPiA+ID4g
PiBzb21ld2hlcmUuIEFuZCBzbyBmYXIsIHdlIGhhdmUgYmVlbiBoYW5kbGluZyB0aGlzIGJ5IGNy
ZWF0aW5nDQo+IHR3byBub2RlcyBpbiBEVCBhbmQgaGF2ZSBwcm9wZXIgYmluZGluZyBkb2NzLg0K
PiA+ID4gPiA+ID4gSSB0aGluayB0aGlzIGlzIGNsZWFuZXIuIEZpcnN0LCB5b3UgY2FuIHNlZSBp
biBEVCBhbHJlYWR5IHdoYXQNCj4gPiA+ID4gPiA+IHRoZSBjb21wb3VuZCBkZXZpY2UgcmVhbGx5
IGNvbnNpc3RzIG9mLiBJbiB0aGlzIGNhc2UsIHdoaWNoDQo+ID4gPiA+ID4gPiBSVEMgYW5kIFJU
QyBkcml2ZXIgaXMgZXhhY3RseSBuZWVkZWQuIFNlY29uZCwgdGhlIGNvZGUgYWRkZWQNCj4gPiA+
ID4gPiA+IGhlcmUgYWRkcyBjb21wbGV4aXR5IHRvIHRoZSBJMkMgY29yZSB3aXRoIGFub3RoZXIg
bGF5ZXIgb2YNCj4gaW5kZXJlY3Rpb24gZm9yIGR1bW15IGRldmljZXMuDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBGWUksIHBsZWFzZSBzZWUgWzFdIGFuZCBbMl0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IEFzIHBlciBEVCBtYWludGFpbmVycywgbW9zdCBvZiBQTUlDcyBhcmUgZGVzY3JpYmVkIHdpdGgg
b25lDQo+ID4gPiA+ID4gbm9kZSwgZXZlbiB0aG91Z2ggUlRDIGlzIG9uIHNlcGFyYXRlIGFkZHJl
c3MuIEFjY29yZGluZyB0byB0aGVtDQo+ID4gPiA+ID4gdGhlIERUIHNjaGVtYSBhbGxvd3MgbXVs
dGlwbGUgYWRkcmVzc2VzIGZvciBjaGlsZHJlbi4NCj4gPiA+ID4gPiBCdXQgY3VycmVudGx5IHdl
IGxhY2tzIGltcGxlbWVudGF0aW9uIGZvciB0aGF0LiBUaGUgZW5oYW5jZW1lbnQNCj4gPiA+ID4g
PiB0byB0aGlzIEFQSSBhbGxvd3MgdGhhdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBBcyBz
b21lIHJlc291cmNlcyBhcmUgc2hhcmVkIChrbm93bGVkZ2UgYWJvdXQgdGhlIGNsb2NrcyksDQo+
ID4gPiA+ID4gPiA+IHNwbGl0dGluZyB0aGlzIGluIHR3byBkaXN0aW5jdCBkZXZpY2VzIGluIERU
ICh3aGljaCBpcyB3aGF0DQo+ID4gPiA+ID4gPiA+IEJpanUncyBpbml0aWFsIHBhdGNoIHNlcmll
cyBkaWQpIHdvdWxkIG5lZWQgcGhhbmRsZXMgdG8gbGluaw0KPiBib3RoIG5vZGVzIHRvZ2V0aGVy
Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBEbyB5b3UgaGF2ZSBhIGJldHRlciBpZGVh
IGhvdyB0byByZXByZXNlbnQgdGhpcz8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBOb3Qgc3Vy
ZSBpZiBJIHVuZGVyc3Rvb2QgdGhpcyBjaGlwIGNvcnJlY3RseSwgYnV0IG1heWJlOiBUaGUNCj4g
PiA+ID4gPiA+IFBNSUMgZHJpdmVyIGV4cG9zZXMgYSBjbG9jayBnYXRlIHdoaWNoIGNhbiBiZSBj
b25zdW1lZCBieSB0aGUNCj4gUlRDIGRyaXZlcj8NCj4gPiA+ID4NCj4gPiA+ID4gTGV0IG1lIGdp
dmUgbWUgc29tZSBkZXRhaWxzIG9mIHRoaXMgUE1JQyBjaGlwLg0KPiA+ID4gPg0KPiA+ID4gPiBQ
TUlDIGRldmljZSBoYXMgMiBhZGRyZXNzZXMgIjB4MTI6LSBQTUlDIiAsICIweDZmIi0gcnRjLg0K
PiA+ID4gPg0KPiA+ID4gPiBJdCBoYXMgWElOLCBYT1VULCBJTlQjIHBpbnMgYW5kIGEgcmVnaXN0
ZXIgZm9yIGZpcm13YXJlIHJldmlzaW9ucy4NCj4gPiA+DQo+ID4gPiBJcyB0aGUgZmlybXdhcmUg
cmV2aXNpb24gcmVnaXN0ZXIgYWNjZXNzZWQgdGhyb3VnaCBhZGRyZXNzIDB4MTINCj4gPiA+IChQ
TUlDKSBvciAweDZmIChSVEMpID8NCj4gPg0KPiA+IDB4MTIoUE1JQykuDQo+ID4NCj4gPiA+ID4g
QmFzZWQgb24gdGhlIHN5c3RlbSBkZXNpZ24sDQo+ID4gPiA+DQo+ID4gPiA+IElmIFhJTiBhbmQg
WE9VVCBpcyBjb25uZWN0ZWQgdG8gZXh0ZXJuYWwgY3J5c3RhbCwgSW50ZXJuYWwNCj4gPiA+ID4g
b3NjaWxsYXRvciBpcyBlbmFibGVkIGZvciBSVEMuIEluIHRoaXMgY2FzZSB3ZSBuZWVkIHRvIHNl
dCB0aGUNCj4gPiA+ID4gb3NjaWxsYXRvciBiaXQgdG8gIjAiLg0KPiA+ID4gPg0KPiA+ID4gPiBJ
ZiBYSU4gaXMgY29ubmVjdGVkIHRvIGV4dGVybmFsIGNsb2NrIHNvdXJjZSwgSW50ZXJuYWwgb3Nj
aWxsYXRvcg0KPiA+ID4gPiBpcyBkaXNhYmxlZCBmb3IgUlRDLiBJbiB0aGlzIGNhc2Ugd2UgbmVl
ZCB0byBzZXQgdGhlIG9zY2lsbGF0b3INCj4gPiA+ID4gYml0IHRvICIxIi4NCj4gPiA+DQo+ID4g
PiBTYW1lIGhlcmUsIHdoaWNoIGFkZHJlc3MgaXMgdGhlIG9zY2lsbGF0b3IgYml0IGFjY2Vzc2Vk
IHRocm91Z2ggPw0KPiA+DQo+ID4gUlRDICgweDZGKS0tPiB0byBzZXQgb3NjaWxsYXRvciBiaXQu
DQo+IA0KPiBBbmQgZG9lcyB0aGUgUE1JQyBwYXJ0IGRlcGVuZCBvbiB0aGUgb3NjaWxsYXRvciBi
aXQgYmVpbmcgc2V0IGNvcnJlY3RseSwNCj4gb3IgaXMgdGhhdCB1c2VkIGZvciB0aGUgUlRDIG9u
bHkgPw0KDQpQTUlDIHBhcnQgZG9lcyBub3QuIEl0IGlzIHVzZWQgb25seSBpbiBSVEMuIA0KDQpC
YXNlZCBvbiBQTUlDIHJldmlzaW9uLCB3ZSBuZWVkIHRvIHNldCB0aGUgb3NjaWxsYXRvciBiaXQg
aW4gUlRDIGJsb2NrDQpmb3IgUE1JQyByZXYgYTAgYW5kIHJlc3Qgb2YgdGhlIFBNSUMgY2hpcHMu
DQoNCk9uIFBNSUMgcmV2MCwgb3NjaWxsYXRvciBiaXQgaXMgaW52ZXJ0ZWQuDQoNCkNoZWVycywN
CkJpanUNCj4gDQo+ID4gPiA+IElmIFhJTiBhbmQgWE9VVCBub3QgY29ubmVjdGVkIFJUQyBvcGVy
YXRpb24gbm90IHBvc3NpYmxlLg0KPiA+ID4gPg0KPiA+ID4gPiBJUlEjIChvcHRpb25hbCkgZnVu
Y3Rpb25hbGl0eSBpcyBzaGFyZWQgYmV0d2VlbiBQTUlDIGFuZCBSVEMuDQo+ID4gPiA+IChQTUlD
IGZhdWx0IGZvciB2YXJpb3VzIGJ1Y2tzL0xET3MvV0RUL09UUC9OVk0gYW5kIGFsYXJtDQo+IGNv
bmRpdGlvbikuDQo+ID4gPg0KPiA+ID4gSVJRcyBjYW4gYmUgc2hhcmVkIGJldHdlZW4gbXVsdGlw
bGUgZGV2aWNlcyBzbyB0aGlzIHNob3VsZG4ndCBiZSBhDQo+ID4gPiBwcm9ibGVtLg0KPiA+DQo+
ID4gT0suIEhvdyBkbyB3ZSByZXByZXNlbnQgdGhpcyBJUlEgaW4gRFQ/DQo+IA0KPiBZb3UgY2Fu
IHNpbXBseSByZWZlcmVuY2UgdGhlIHNhbWUgSVJRIGZyb20gdGhlIGludGVycnVwdHMgcHJvcGVy
dHkgb2YNCj4gZGlmZmVyZW50IERUIG5vZGVzLg0KPiANCj4gPiA+ID4gVGhlIGJvYXJkLCBJIGhh
dmUgZG9lc24ndCBwb3B1bGF0ZSBJUlEjIHBpbi4gSWYgbmVlZGVkIHNvbWUNCj4gPiA+ID4gY3Vz
dG9tZXJzIGNhbiBwb3B1bGF0ZSBJUlEjIHBpbiBhbmQgdXNlIGl0IGZvciBQTUlDIGZhdWx0IGFu
ZCBSVEMNCj4gYWxhcm0uDQo+ID4gPiA+DQo+ID4gPiA+IEFsc28sIGN1cnJlbnRseSBteSBib2Fy
ZCBoYXMgUE1JQyByZXYgYTAgd2hlcmUgb3NjaWxsYXRvciBiaXQgaXMNCj4gPiA+ID4gaW52ZXJ0
ZWQgYW5kIGludGVybmFsIG9zY2lsbGF0b3IgaXMgZW5hYmxlZCAoaWU6IFhJTiBhbmQgWE9VVCBp
cw0KPiA+ID4gPiBjb25uZWN0ZWQgdG8gZXh0ZXJuYWwgY3J5c3RhbCkNCj4gDQo+IC0tDQo+IFJl
Z2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
