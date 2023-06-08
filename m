Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837CE727D69
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 13:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235873AbjFHLAw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 07:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbjFHLAp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 07:00:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCB72D6D;
        Thu,  8 Jun 2023 04:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeYlThGVRTSa+PmO/tHMO7a7N34xKs2biqYRy2fCSBMWxsGxbv8+vNrHvQFdjEjvuBTAHz98a9Ztm/Y4xIgabZB9D+eY9ypcRvyvIGQPVLHPI2dkxnCJ02MLzLvtqLU7ObCrN/p9HToxkxj2uTWvs+6vmeLPCPrf2elSwsqwXFfSh4G8YBlmx3bPU8sMZ2eF4/PnPu6fUEmzAcwXr/cXxVuDsJwPO596ofCsxOUHOkCjXiCsgdBDObVx7ALIYA39wheio7GzExpKVOaApgxd0Byhy6lloX+ewsyJ9OyzBja2oRN5ZDAlBT6eNkTBmrJyUFV4fuietkfT5jA9doSyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtuXr4XMsVaJwWxKSA/panwh6Yj+yoZtuZOAM73Vkic=;
 b=d3dAkUS6uTARF5yLqga2Oz0SCMW//iLq5p/rCcmRZhDUWizZOSAeG+beWfeCF4gmSYNp0zF7uU2SRXL/2KLiosjH8z6xjpJfWi8fN8KDDN12bu5uMLyCH88ivBNZJG7VG4+dxU47vFzzm7jhGKYYsv5D9350Mfi7XvUIGmvxK1wOzvb6vlIhqFLT43xIzAPmV2k4VwOX9+KBBJvco3vkwI8VnNKhb7qutG17zivf0C0N4MwVr2UWnmGIYhnl95P5yyErPcxBnbxg4YjYnhBkXcT6rz/EHyWwNIn19o90wdMLQ9kFEf13K19Nz+ukrkORVMuzUZUQz43lLPUFtYM5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtuXr4XMsVaJwWxKSA/panwh6Yj+yoZtuZOAM73Vkic=;
 b=MftiiaRBLXl/zc+BkZfvbwZVADcjFpH+OHShkQqKjhJhWm5DDhJ3GtpthkrEN92axhNR3ua6dAgXTdR+h0qV1clTLAoCe1xjkXAy15I4JAOBQRfZxuVG2PJSuMkkisVu84BNbkzDLe5/aN9SQMK5M2vOLJQ+/McCEsrErUUvwk4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8510.jpnprd01.prod.outlook.com (2603:1096:400:171::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Thu, 8 Jun
 2023 11:00:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Thu, 8 Jun 2023
 11:00:19 +0000
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsA==
Date:   Thu, 8 Jun 2023 11:00:19 +0000
Message-ID: <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
In-Reply-To: <20230608103929.GO5058@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8510:EE_
x-ms-office365-filtering-correlation-id: fceb500a-80a8-4f36-f742-08db680f8c9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rZ3oQscJXsFM0N8LvtgZeKMwSskvheoGOQxoNrfMTDBxUXfTwW9p7NdEYHjF1LGZg0zAv+iwT9RXw0tASsqwQ8TBVwqJr1FJO1edIccEDxfoTZiqSmcPG9IaSPzcz2CXssl9uF7X02WfpSLEGw6PhEMxQWeg4f5rv3OhYocyPWpMFhJB87/vDBtS4bkvCNcpVa0sTokwR4ia6DhpcvpXsfCC0pKwJbutX3C9wavniQdx+68yEt4Nd16SIWP12Lwr9uAAt/IaoAxFkKCwWDj9Gx8cexKCI4ZbC7qsS+HWS+pjueQXYF5DcGBBgH/tVvhgHnf3fbk2k03KH35DM0QCBo4b0KDvyIf0dbcRtInHGlIGdeg4eEMvtTBvTXXRxG4kOF1NIejHPamlBHM5faTV6rA3t8VtmY9q/Xqttfu4j/t/wSux8MlDCXs1k5gPwvVu9KZ4LXZJmggwBrYz3M7nYDaTuCkILjsSyuGK4ovM9BUUYu0QaCL51oHAuyM8vyqR5LLTvZzChHQoJRLgQpVPG04EEkGF3Vkc4a8i8v/B3FDHbMy2TBrCTkImguNeckPkTzj1PLTW8dT27/P/45lEvfoKtYLPlcn3KhfPA6prTOHdkS6Ml1el0o8sgt++mFUX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(55016003)(54906003)(122000001)(478600001)(8936002)(8676002)(4326008)(6916009)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(316002)(41300700001)(38100700002)(186003)(83380400001)(7696005)(71200400001)(9686003)(6506007)(26005)(33656002)(86362001)(5660300002)(52536014)(7416002)(7406005)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDArQUYwWSt6RUVKVkltY1dmeHg5eXhKdjNLV2tDa1JiSWpERFVCczVlYjUw?=
 =?utf-8?B?UlIzcjhjZWZZeHlnc1ozMVpmQU5oU0NmSzM2RDdjc0VGQWlMWnQySVI4bzBT?=
 =?utf-8?B?WEtQeSt4Z1YrbEZuMDJicjZKcGZITDVjY2F5U0NleVBuRE95Um1pMm5oRkhm?=
 =?utf-8?B?ZnNQNzdLakxMQ1BlZktpUEU4OHFPS2wwZllLcVJmTExzQzdpenQzZ210VENN?=
 =?utf-8?B?Yjh1MGZEQ2lCQTdqc3lKRFRxTGlzUUt4a2VRd29ndDVlZVlyR3pGeEJsRk13?=
 =?utf-8?B?Wjg3L1R0bndSS2V5T2FwZEJnSEV0TVJ4MTB2eFAxcmUzZXJia24zbEJwOXUr?=
 =?utf-8?B?bjNUR1NqWXBJb1hJUkczNUJITTN0M1hQd0dOZnpWSUdvSGVra2thdkhrQVRv?=
 =?utf-8?B?cFY4T3pwQmw4VnZsZTJTZy9JUFNScXl2OTZHWlhSSVVFRWN5WWdXU21GTzBD?=
 =?utf-8?B?dmdxbWFWZlczZG1rRTM2aEN0blZtNzI2c2ZpT0NzeitGeHo3V1dZQkY4ZHRn?=
 =?utf-8?B?OXQwYUdGN04wc1BkcE9qN0JJZ2Y1cUhSbk9uNUZZS3ZJcnd3bFFod0JUOUo1?=
 =?utf-8?B?MkkrRVRLazI4Wm5NVnloZWZRVUExdjJoclYyZUlKME9TVWZIejQzcm5TWjh1?=
 =?utf-8?B?VTUwRy9pbDQzdFlYYXJJM3hKemtUaXNWWkhJVC9OdkhVbS9FRC9iSGEvMzR3?=
 =?utf-8?B?Yzl0WjdLTnh6SVlyL2dPL0hQblE5ZVV4dVFpTHV2WHdxY3BLanpabENtZk1l?=
 =?utf-8?B?cTJHKzA4SW9rdDVESG1yS0pYWVFpcThiRXBNeUhDZjVOREFhRDZHTzhTYmZB?=
 =?utf-8?B?UmpITXZIN01HTlB3YktLbDJaQWlUUmpVay94WG9hV1dQQjJaaUZlQ1ExOUdP?=
 =?utf-8?B?K3pWclhLOCtwa284WXhhZ1RMdnBOcWhGcm4vNnRyN0pYTnRhTVpMSVJaNjI4?=
 =?utf-8?B?VmcvZGowUTlyL1lKNzJSbGE2NWV4bjVNUkJ6SUx6MG4rSEIyTmtmamM4M3h1?=
 =?utf-8?B?NnFOQkZSZ0k1S25tc2EweGF0bnFSWE1QajM1N0R1bnBIZ1FhVVgrVGpWakUz?=
 =?utf-8?B?NVdkNGk5ZWJxVW9oNkhjNUhhMWxFNjhlMjcyODFtTUFsOFBic3N6dVpoRVpC?=
 =?utf-8?B?YXc0K1hDeVZJTkk1cjRBUUxuMDh5aXVDbTY3blpTbUN5Q0cvVG1uWWtPbENw?=
 =?utf-8?B?aklTdm9IVFFWQ09YakdsMnF1OFBTMGdsNldRSlB4T3NNVlVpWGpPRHIxaWZq?=
 =?utf-8?B?WmI0ZXVJdHU3eG9UV2xBWlJSSDUyVCtUNUdpN3hmVVNyalU2MktpRVdxTTZG?=
 =?utf-8?B?WWk3WDdqRVdNd3lQL1hVQ2VSZUJTZlp4UmhMQ1V2NmlKSGRsZC9jRzlRQ21v?=
 =?utf-8?B?dG0rQVpEMVBLTEJYN3preTJQbTZZL3o0VTZPMzNMejNWZGxabUJOaTBsdmxv?=
 =?utf-8?B?S01IUmxrRFYvN0NkbFp0TjRvdVRNbWd5bXRuSkN0M25vbVBueGhZUmJSeDlX?=
 =?utf-8?B?RTJ2c09zcC9FZDlOTEhLRXBBdVI1Q0x4NmRYdy9zM1R3d24yUTZIcE5vWkZH?=
 =?utf-8?B?eVR0aHJOb1FUdEM0bXJKN1QzeUE0QkZaSnV5VEk5RVpFclZWNE50V01seUpN?=
 =?utf-8?B?MmxablFlSDhFOUU1MkpzMFgzejlwakxiZVNLdlE1cWs2UGM5L2xhb1UzbGZC?=
 =?utf-8?B?WnNWWE1rNWZ3WERwc1BOazVtMmQvSzhwN0ZFZ3piVzhQK3J6UDUvMit1TVBM?=
 =?utf-8?B?NFJlUjFrNzVUcjE3MG44a1prSWRNUVFQSGF3NjdFb3JOSFYzWXVwdEZrMWNT?=
 =?utf-8?B?U2FGZFkxWVRMcnpsSHlLcHpxK1hiWEw5Q2hKN2VxRVNpS3VXNWE5KzROT0ly?=
 =?utf-8?B?VEptTG9PSU9BZjRLWi90LzJXbzBSci9QN3Nyald2UHlhaENxNmVqNVBkSHFS?=
 =?utf-8?B?M21iUkNOdjV0U0krSHJzRzlpc0xYS3dIdmFWNjRpM0FDTkhQbG50MytlVkZz?=
 =?utf-8?B?dTJFK21qTDVHKzJPbGlSRWtUbDAzU2xsZWNYc3ovcHhScVQ1WW1qZzlzVzZq?=
 =?utf-8?B?WGJMK3hISU1SZE5uWkFtYWxWcjBySEwwVGM2UEpIcXBmalpZbXRPWnZTb0Ft?=
 =?utf-8?Q?WXmRh+xO5+aDILCXU3Fw9SZyt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fceb500a-80a8-4f36-f742-08db680f8c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 11:00:19.5716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYwCi8djK5JuJjn+jJ6O1vkl/WvrKNY6u6qm1iCOz9+hpMHiRQKBPtIneYC/yw/0Hfin0YFHSaLXOv4vMoswVb4r6o2yWBDQ3vtu+8g+P9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8510
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
UEkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAwNjo0MToz
NUFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUg
MDEvMTFdIGkyYzogRW5oYW5jZSBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UNCj4gPiA+IEFQSQ0K
PiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UNCj4gPiA+
ID4gaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiA+ID4gPg0KPiA+ID4gPiBIaSBhbGws
DQo+ID4gPiA+DQo+ID4gPiA+IHNvcnJ5IGZvciBub3QgYmVpbmcgYWJsZSB0byBjaGltZSBpbiBl
YXJsaWVyLg0KPiA+ID4gPg0KPiA+ID4gPiA+IEluIEJpanUncyBwYXJ0aWN1bGFyIHVzZSBjYXNl
LCB0aGUgaTJjIGRldmljZSByZXNwb25kcyB0byB0d28NCj4gPiA+ID4gPiBhZGRyZXNzZXMsIHdo
aWNoIGlzIHRoZSBzdGFuZGFyZCBpMmMgYW5jaWxsYXJ5IHVzZSBjYXNlLg0KPiA+ID4gPiA+IEhv
d2V2ZXIsIHdoYXQncyBzcGVjaWFsDQo+ID4gPiA+DQo+ID4gPiA+IE5vdCBxdWl0ZS4gYW5jaWxs
YXJ5IGlzIHVzZWQgd2hlbiBhICpkcml2ZXIqIG5lZWRzIHRvIHRha2UgY2FyZSBvZg0KPiA+ID4g
PiB0d28gYWRkcmVzc2VzLiBXZSBhbHJlYWR5IGhhdmUgZGV2aWNlcyBidW5kbGluZyB0d28gZmVh
dHVyZXMgaW50bw0KPiA+ID4gPiB0aGUgc2FtZSBjaGlwLiBJIHJlY2FsbCBhdCBsZWFzdCBSVEMg
KyBFRVBST00gc29tZXdoZXJlLiBBbmQgc28NCj4gPiA+ID4gZmFyLCB3ZSBoYXZlIGJlZW4gaGFu
ZGxpbmcgdGhpcyBieSBjcmVhdGluZyB0d28gbm9kZXMgaW4gRFQgYW5kDQo+IGhhdmUgcHJvcGVy
IGJpbmRpbmcgZG9jcy4NCj4gPiA+ID4gSSB0aGluayB0aGlzIGlzIGNsZWFuZXIuIEZpcnN0LCB5
b3UgY2FuIHNlZSBpbiBEVCBhbHJlYWR5IHdoYXQgdGhlDQo+ID4gPiA+IGNvbXBvdW5kIGRldmlj
ZSByZWFsbHkgY29uc2lzdHMgb2YuIEluIHRoaXMgY2FzZSwgd2hpY2ggUlRDIGFuZA0KPiA+ID4g
PiBSVEMgZHJpdmVyIGlzIGV4YWN0bHkgbmVlZGVkLiBTZWNvbmQsIHRoZSBjb2RlIGFkZGVkIGhl
cmUgYWRkcw0KPiA+ID4gPiBjb21wbGV4aXR5IHRvIHRoZSBJMkMgY29yZSB3aXRoIGFub3RoZXIg
bGF5ZXIgb2YgaW5kZXJlY3Rpb24gZm9yDQo+IGR1bW15IGRldmljZXMuDQo+ID4gPg0KPiA+ID4g
RllJLCBwbGVhc2Ugc2VlIFsxXSBhbmQgWzJdDQo+ID4gPg0KPiA+ID4gQXMgcGVyIERUIG1haW50
YWluZXJzLCBtb3N0IG9mIFBNSUNzIGFyZSBkZXNjcmliZWQgd2l0aCBvbmUgbm9kZSwNCj4gPiA+
IGV2ZW4gdGhvdWdoIFJUQyBpcyBvbiBzZXBhcmF0ZSBhZGRyZXNzLiBBY2NvcmRpbmcgdG8gdGhl
bSB0aGUgRFQNCj4gPiA+IHNjaGVtYSBhbGxvd3MgbXVsdGlwbGUgYWRkcmVzc2VzIGZvciBjaGls
ZHJlbi4NCj4gPiA+IEJ1dCBjdXJyZW50bHkgd2UgbGFja3MgaW1wbGVtZW50YXRpb24gZm9yIHRo
YXQuIFRoZSBlbmhhbmNlbWVudCB0bw0KPiA+ID4gdGhpcyBBUEkgYWxsb3dzIHRoYXQuDQo+ID4g
Pg0KPiA+ID4gPiA+IEFzIHNvbWUgcmVzb3VyY2VzIGFyZSBzaGFyZWQgKGtub3dsZWRnZSBhYm91
dCB0aGUgY2xvY2tzKSwNCj4gPiA+ID4gPiBzcGxpdHRpbmcgdGhpcyBpbiB0d28gZGlzdGluY3Qg
ZGV2aWNlcyBpbiBEVCAod2hpY2ggaXMgd2hhdA0KPiA+ID4gPiA+IEJpanUncyBpbml0aWFsIHBh
dGNoIHNlcmllcyBkaWQpIHdvdWxkIG5lZWQgcGhhbmRsZXMgdG8gbGluayBib3RoDQo+IG5vZGVz
IHRvZ2V0aGVyLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRG8geW91IGhhdmUgYSBiZXR0ZXIgaWRl
YSBob3cgdG8gcmVwcmVzZW50IHRoaXM/DQo+ID4gPiA+DQo+ID4gPiA+IE5vdCBzdXJlIGlmIEkg
dW5kZXJzdG9vZCB0aGlzIGNoaXAgY29ycmVjdGx5LCBidXQgbWF5YmU6IFRoZSBQTUlDDQo+ID4g
PiA+IGRyaXZlciBleHBvc2VzIGEgY2xvY2sgZ2F0ZSB3aGljaCBjYW4gYmUgY29uc3VtZWQgYnkg
dGhlIFJUQw0KPiBkcml2ZXI/DQo+ID4NCj4gPiBMZXQgbWUgZ2l2ZSBtZSBzb21lIGRldGFpbHMg
b2YgdGhpcyBQTUlDIGNoaXAuDQo+ID4NCj4gPiBQTUlDIGRldmljZSBoYXMgMiBhZGRyZXNzZXMg
IjB4MTI6LSBQTUlDIiAsICIweDZmIi0gcnRjLg0KPiA+DQo+ID4gSXQgaGFzIFhJTiwgWE9VVCwg
SU5UIyBwaW5zIGFuZCBhIHJlZ2lzdGVyIGZvciBmaXJtd2FyZSByZXZpc2lvbnMuDQo+IA0KPiBJ
cyB0aGUgZmlybXdhcmUgcmV2aXNpb24gcmVnaXN0ZXIgYWNjZXNzZWQgdGhyb3VnaCBhZGRyZXNz
IDB4MTIgKFBNSUMpIG9yDQo+IDB4NmYgKFJUQykgPw0KDQoweDEyKFBNSUMpLg0KDQo+IA0KPiA+
IEJhc2VkIG9uIHRoZSBzeXN0ZW0gZGVzaWduLA0KPiA+DQo+ID4gSWYgWElOIGFuZCBYT1VUIGlz
IGNvbm5lY3RlZCB0byBleHRlcm5hbCBjcnlzdGFsLCBJbnRlcm5hbCBvc2NpbGxhdG9yDQo+ID4g
aXMgZW5hYmxlZCBmb3IgUlRDLiBJbiB0aGlzIGNhc2Ugd2UgbmVlZCB0byBzZXQgdGhlIG9zY2ls
bGF0b3IgYml0IHRvDQo+ID4gIjAiLg0KPiA+DQo+ID4gSWYgWElOIGlzIGNvbm5lY3RlZCB0byBl
eHRlcm5hbCBjbG9jayBzb3VyY2UsIEludGVybmFsIG9zY2lsbGF0b3IgaXMNCj4gPiBkaXNhYmxl
ZCBmb3IgUlRDLiBJbiB0aGlzIGNhc2Ugd2UgbmVlZCB0byBzZXQgdGhlIG9zY2lsbGF0b3IgYml0
IHRvDQo+ID4gIjEiLg0KPiANCj4gU2FtZSBoZXJlLCB3aGljaCBhZGRyZXNzIGlzIHRoZSBvc2Np
bGxhdG9yIGJpdCBhY2Nlc3NlZCB0aHJvdWdoID8NCg0KUlRDICgweDZGKS0tPiB0byBzZXQgb3Nj
aWxsYXRvciBiaXQuDQoNCj4gDQo+ID4gSWYgWElOIGFuZCBYT1VUIG5vdCBjb25uZWN0ZWQgUlRD
IG9wZXJhdGlvbiBub3QgcG9zc2libGUuDQo+ID4NCj4gPiBJUlEjIChvcHRpb25hbCkgZnVuY3Rp
b25hbGl0eSBpcyBzaGFyZWQgYmV0d2VlbiBQTUlDIGFuZCBSVEMuIChQTUlDDQo+ID4gZmF1bHQg
Zm9yIHZhcmlvdXMgYnVja3MvTERPcy9XRFQvT1RQL05WTSBhbmQgYWxhcm0gY29uZGl0aW9uKS4N
Cj4gDQo+IElSUXMgY2FuIGJlIHNoYXJlZCBiZXR3ZWVuIG11bHRpcGxlIGRldmljZXMgc28gdGhp
cyBzaG91bGRuJ3QgYmUgYQ0KPiBwcm9ibGVtLg0KDQpPSy4gSG93IGRvIHdlIHJlcHJlc2VudCB0
aGlzIElSUSBpbiBEVD8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+IFRoZSBib2FyZCwgSSBo
YXZlIGRvZXNuJ3QgcG9wdWxhdGUgSVJRIyBwaW4uIElmIG5lZWRlZCBzb21lIGN1c3RvbWVycw0K
PiA+IGNhbiBwb3B1bGF0ZSBJUlEjIHBpbiBhbmQgdXNlIGl0IGZvciBQTUlDIGZhdWx0IGFuZCBS
VEMgYWxhcm0uDQo+ID4NCj4gPiBBbHNvLCBjdXJyZW50bHkgbXkgYm9hcmQgaGFzIFBNSUMgcmV2
IGEwIHdoZXJlIG9zY2lsbGF0b3IgYml0IGlzDQo+ID4gaW52ZXJ0ZWQgYW5kIGludGVybmFsIG9z
Y2lsbGF0b3IgaXMgZW5hYmxlZCAoaWU6IFhJTiBhbmQgWE9VVCBpcw0KPiA+IGNvbm5lY3RlZCB0
byBleHRlcm5hbCBjcnlzdGFsKQ0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQg
UGluY2hhcnQNCg==
