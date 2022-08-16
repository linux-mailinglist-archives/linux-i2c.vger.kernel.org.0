Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9893C5954B8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 10:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbiHPILN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 04:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiHPIKt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 04:10:49 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B594F53007;
        Mon, 15 Aug 2022 23:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i15Y8jdLysYdX0mqZr68+zupijyKVOoHI8RgrZwGZ+KrhAtYc381QF8oVADlSnITHMCyUOiO9ujHNCvk+PvhiT2FCUGqjUWd/jOkxF2YbVViJwwHHB6QEg7nfywkoYwfoKmiTOodo7mAnRJ1cGpNYM8vZCMyKE5x1Xl/JVZAIwqqYI0iL7BCiMaPU8H8PIiwzQ3VrvM8UwYUwOy9jxFVqWYSsahZeqpsW64WSSYAMalHzXYfbmh+kqgODaXPtCj5FAVPGk1tem3kQXrP/0+7apiB9i10Bdh5ZosUAU2mm7Pww+JpPjkgDtj9gyaT8kr7xdIf4SSFWhp7PytwojHujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX9N4/lYKYvKrHeOQSf97spC7ILD5dmtMEFJr3XeGXY=;
 b=GVjE+xKrO8auPgWuQe/62f7YoHOWB3UQ/3J1FX3laG0LZyoe4nnZexV0nvHm8HQFO7dS+7+o6lzjYLdSzy0AJQRskJ/pQtN/9K2FMXeaBqs4njDTdCkLz8iY/ylvlTdJRTHIeZuJyZWaF5aOWTqOFHtNoeJjkY8+2Z5qRIUZp6zHHuUv1RsiLMxglyJFiVAShg0DbC1CMyRHcw/GSIN478uIKUrqBFs60xei0HQ0r3H1xVCkgR5QtAUREqbFezlhycBKzp+czozZkvvCMMEqnj9F6w9Z+jxRx3t3tbiEloe53ONGANkspyIIT44HW3ls7Ei4WHXKoJ4idcg8810E9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX9N4/lYKYvKrHeOQSf97spC7ILD5dmtMEFJr3XeGXY=;
 b=Cj+QJtpHYDup5Et3cH918KA703xPUK4KtL7FpvGrGqaxTvEdwEZ8S0QNnku0dD2A0orByGClIJ3whRtOirvsNYiD1PT1VVxyNbHzmH8+QJhqpJsIl055CJGx4ZYavY+vaSqlu9gUNNjlbmn1xpXD6Pj2d6v/ODxc4yIyISKffz0=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 06:31:22 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 06:31:22 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
Subject: RE: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Thread-Topic: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Thread-Index: AQHYrgSSA2Yxdic4lUaQqa4Ze2PTqa2rDHsAgAQXC0CAAeuegIAAB+IA
Date:   Tue, 16 Aug 2022 06:31:22 +0000
Message-ID: <DU0PR04MB94178FD1DEE5CCC8AF162E48886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <f1add9c7-fc2e-a600-49a6-a6579f17db1b@linaro.org>
 <DU0PR04MB9417D62230578AC8CA4234F288689@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <039566a7-5c65-b2d8-7b45-c616863cb292@linaro.org>
In-Reply-To: <039566a7-5c65-b2d8-7b45-c616863cb292@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f0d4fa7-a26e-412e-8093-08da7f50efc4
x-ms-traffictypediagnostic: VI1PR04MB4688:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9Tb9bbsqiGPFXk7d1W3I+xWVuzwEN3Gim2BPlAbnyceBzHkCNs/i9ZRVmhDlASCB4lt8peMWmOz9lvqaJYrV5chMh8AK5P710H6iltDi2mVUUTrKVPc2D9o0or9Vx+gVvYgoDIn8vxyvoWvykjI1FI2EZZqYldyOsbzI5KXlW6IoKZguAu5lSdeHlUoBDNN06PTdkJDn5AA+EXDAVK59ZM1U5+w31BGjp7rpQVYs59z3buy7iSaxk+aTHpETS5Fu5BmixLYoZuf+nqqIc2vYPGGDuoYmyDTh9aqXJAHxGe/xBEzcK0QApvZlZIp+tqi8fCeYPZ9Cd9KdUUhhMyx4q8PxFDy19xF1t8nCQZhw6bEQDB7nYJI8tilCEJ07DIcYfNrleRhm1C+AedIb3xOOAVm0MFs2cscQXqz06CONuKX6nGavKB0OUV8dDrees6SxKQ4G1I5gRW66KSOBPgkGGzDJkabxS40ucMkjSxhSY/ahN2/bNSqnzyj5t2aRjYb+NORC8KR7Jl2MvA/rAiYOkKyS6UFAIoVa5XN5Fcvr4D6uqL4apuFzIDeSFEE33xlSKzkac7DuPwzBogQaMaq2rjqqfxdLskwVAo3RUIGSYFdM7Sd7SP/HNqdbTY2Q84S9jfodRiReICeaVDjBfyXP/tqo9h6e7yd/UP2I43B2/3H9/voyOIWBKkUTnDNAXHFUb+z+fC2zg2I2wff9qYGuH9HSysD03xk3Jc8Z5sWtV5ufc0htCkUESg5CRfFGetp4BkBxPLqVpdhNcA32StNDSK4unuYihUl2q+XbNGUMOYe+y5exgfHtW/X2dzyfEMo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(9686003)(6506007)(7696005)(53546011)(38070700005)(2906002)(52536014)(8936002)(5660300002)(7416002)(41300700001)(44832011)(122000001)(26005)(55016003)(33656002)(110136005)(86362001)(38100700002)(83380400001)(478600001)(186003)(54906003)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(76116006)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGZHK2ZmWkZ2TUhuWkRzTVNtS2xObUtIRTZFWGRiTVY5ZnNPcW5vN2ZxNFAz?=
 =?utf-8?B?R3FLOXlwQzRLcEcxdGlvOG9sVVZlbWxQMHNTd0VTWnVOODBETmRtZ3paTlFp?=
 =?utf-8?B?cEpmRFlQdW5EZVdhbVhtZUpvQ0R4d2dvWnN0SDBsdkI0R2h6dXoxYnFXUDh5?=
 =?utf-8?B?QldwWVEyUHZWTmg2VzdPbE9MM1g2RkdWa0Fobmszc2U5VG5XRFRuK3VUOGVB?=
 =?utf-8?B?bHk0eU1teHhFZHk2REdzT1M5T3BUOEJUOTRNTUNYWng3bDhLMVF3aUU5YnVH?=
 =?utf-8?B?Ung4c0FTNm9ReTRhcGZWZ1U1Z3lmWHF3UEdNc3FDYUNYNGlZTXZxUUlRWklz?=
 =?utf-8?B?cURhSE5OVEtQK0xSckJrNEJLczhPVzZSVUc3cTBXeHZML2dlSVpZdHVQTm41?=
 =?utf-8?B?cGVrQlFvZEFzR2tUUWVBMDYvL3ROT2RZdkxWR0FkYklyT2llYzRuZEdLU2gw?=
 =?utf-8?B?amptaTV3UDduc3dkUXg1a3owRnB4dHFmNll1OTh0cHJpMGZrVjJwM3pxdzNr?=
 =?utf-8?B?bXJZTFhxRk5PNzk3S0RZaGhWZjVLWDMvZk9iNXB4YVRQL1JncEVvWDhNVFNl?=
 =?utf-8?B?UWVnWCtuN2pBMENMN1daMG0xRytkZjZUcEhoZDhuM1pYZEZXYUs3S1llR2Uy?=
 =?utf-8?B?SlByVWFrR0loT2dOT2RCeCtINkVodGJ1dUpHOHhvamgrRDVlREtwRmppN0xh?=
 =?utf-8?B?TmN5U28xUHpQbXNIOVR4ajVvNmxHSTlHL3dsNHVPTDBzWUp4WVdxQVNnUG5i?=
 =?utf-8?B?ekRNUGJJRGo5SlVFeXMxVXhhYm92TjFTTkI3cWZQSzlLRFdLRWRpNlYvbmhr?=
 =?utf-8?B?NGFZMVY2NHZicjBFclVlYVNxc2lRS1JQNzBGa3BvSDF5OU1QMEJGeGJXN2V5?=
 =?utf-8?B?bkI1N0hybHV6UUhlK1BYSG1kT2tYSy9oQU96dktYV2xoMzZicXVaOXVnWm9V?=
 =?utf-8?B?ZkFUcFlJbnZJRThrUlcwQnMyQ0IvdGFzQ0RkdGd4cHdZRVp5bFVGcXlHZUVG?=
 =?utf-8?B?RlN0ZXRGQ1gzaTdBSGhuQUxnVExVOGZXeG1vWXFITlVaa04yOTVxcllBVmcy?=
 =?utf-8?B?c2ZDZ09IZzdYNkU2aG40bFg2c2ZHMlVUdHdVeTdiMnNoQXBVYWpJdkFhQ2Yy?=
 =?utf-8?B?bzNRVXNTcndYOVZKMzBic1pjZncrbWZTclVRRStKNTAxNGdvZktsN05Zck0x?=
 =?utf-8?B?ZmVKZUZGYW0zb3lBblBCTXZPbVBEdGkwdzB2eVp6aW1kaURZQzNrZHJ3WVln?=
 =?utf-8?B?NVRqU0lxOFZpemN2RjY2QVVnZmtad2JhRm5JTTU1SHpBemgwRFpHZHA3N213?=
 =?utf-8?B?aUZSdzJSbU1mL3kraDFoSVF0WTV0NDR2MFZjMHNvbXV3aU5YT3ByT2xxeS9k?=
 =?utf-8?B?eEFVRkxlS01MRGl1ZzVnSDQ5UFBYVFRFbTZPMHhyTHRZYnRVN0Y3VzUvbDdL?=
 =?utf-8?B?U0V1aGJabWJETllmaHBJakdBVU5GdnFvcUNTSWdlbkhaN3R0THNSdVhVK3p1?=
 =?utf-8?B?ZlRUWHlVajljczNNckFYaDhHdU42dHlKS3B2eHUwWElTMmhGM0ZQNXNtVGFy?=
 =?utf-8?B?KzFWblJYNm4vUmNnOE40VFYxMXJkbUFPSmtVVjR4dVR0eXBiTjFLQ3JoOGgx?=
 =?utf-8?B?TmZ4c1ZrMXlRN0ZUb2w1QzVKUVp3R0xRNko0VzBTVE1IQ3YzektjTzN2Qzc5?=
 =?utf-8?B?NEx0QjVuNmNqUDNNRTdTakFBOU43ZE1TY1djdWxjUDl6Tnc5TWszTThteTVC?=
 =?utf-8?B?TXE0N0RkZm1ydGF1NE84V1NJSWY3aEpPbTVvQ2Fkc2txNnNIejZONTBzNFlR?=
 =?utf-8?B?bFhNTUxXZnYzZXhkV2J3SEJ3SWlxTW9PcFNvam1TY2NBaHV5c1Z3cFN3NktX?=
 =?utf-8?B?M1dqMU1WN3NsU3hxVjAvMzI0aVhmWFhNbURUTStxS0t3QU0xQXdVdDdabXVX?=
 =?utf-8?B?L0ttV3ZRUXV3NjVnS25RZkxQNGhFU2pOZmkrTG55eVlOS1pjVmxYSWpIYnlF?=
 =?utf-8?B?Z0lnSTluNE4zSlpYOTF4TFNQVEhzalMxWGV6dWF4OHowajJycm1ZNzNOQmpH?=
 =?utf-8?B?enFPY2tvWVI0RjhJVTZ5TUY0ajZXRHd4S1hlRVFHVXBhMFFSeEY3SCt5ZGE4?=
 =?utf-8?Q?APv8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0d4fa7-a26e-412e-8093-08da7f50efc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 06:31:22.2621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6nl8DMF60xY6i5sBtdjqFPhjjrP/PgKyAB4BBneKJio0ou58ihX3d1diXzzi1AeD0wRdgnEMyoCx4gBIBPyoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4688
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gaTJjLWlteC1scGkyYzogYWRkIElQRyBjbG9jaw0K
PiANCj4gT24gMTUvMDgvMjAyMiAwMzo1MiwgUGVuZyBGYW4gd3JvdGU6DQo+ID4gSGkgS3J6eXN6
dG9mLA0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC82XSBpMmMtaW14LWxwaTJjOiBh
ZGQgSVBHIGNsb2NrDQo+ID4+DQo+ID4+IE9uIDEyLzA4LzIwMjIgMDc6MzQsIFBlbmcgRmFuIChP
U1MpIHdyb3RlOg0KPiA+Pj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4+
Pg0KPiA+Pj4gVGhlIGkuTVggTFBJMkMgbmVlZHMgUEVSIGFuZCBJUEcgY2xvY2ssIG5vdCBqdXN0
IFBFUiBvciBJUEcgY2xvY2suDQo+ID4+PiBUaGlzIHBhdGNoIGlzIHRvIGVuYWJsZSBib3RoIFBF
UiBhbmQgSVBHIGNsb2NrIGZvciBpbXgtaTJjLWxwaTJjLg0KPiA+Pg0KPiA+PiBUaGlzIHBhdGNo
c2V0IGJyZWFrcyB0aGUgQUJJIGFuZCBpcyBub3QgYmlzZWN0YWJsZS4gVGhlIGp1c3RpZmljYXRp
b24NCj4gPj4gaXMgdmVyeSBsaW1pdGVkIChvbmUgc2VudGVuY2UpLCBzbyBub3QgcmVhbGx5IGVu
b3VnaC4NCj4gPg0KPiA+IEFSTTMyIGkuTVg3VUxQIGFuZCBBUk02NCBpLk1YOFFYUC9pLk1YOFVM
UCBhbGwgbmVlZCB0byB1c2UgdHdvDQo+IGNsb2NrcywNCj4gPiBQRVIgYW5kIElQRy4gQnV0IGN1
cnJlbnQgZHQtYmluZGluZ3MgYW5kIGR0cywgdXNlIG9uZSBjbG9jay4NCj4gPg0KPiA+IFRoaXMg
cGF0Y2hzZXQgaW5jbHVkZXMgZHRzIGNoYW5nZXMgcGF0Y2ggNCBhbmQgcGF0Y2ggNS4NCj4gPiBQ
YXRjaCA2IGlzIHRvIHVwZGF0ZSBkcml2ZXIgdXNlIHR3byBjbG9ja3MuDQo+ID4NCj4gPiBJIHRo
aW5rIHRoZSBwYXRjaCBvcmRlciBpbiB0aGlzIHBhdGNoc2V0IHdvdWxkIG5vdCBicmVhayBnaXQg
YmlzZWN0LA0KPiA+IGl0IGp1c3QgYnJlYWsgQUJJLiBCdXQgSSBub3QgZmluZCBnb29kIHdheSBo
b3cgY291bGQgbm90IGJyZWFrIEFCSSwNCj4gPiBiZWNhdXNlIG9ubHkgdXNlIG9uZSBjbG9jayBp
cyB3cm9uZyB3aGV0aGVyIGluIGR0LWJpbmRpbmdzIG9yIGR0YnMuDQo+IA0KPiBEcml2ZXIgY2hh
bmdlcyBhbHdheXMgZ28gdmlhIHNlcGFyYXRlIGJyYW5jaCB0aGFuIERUUywgc28geW91ciBwYXRj
aA0KPiBicmVha3MgZ2l0IGJpc2VjdC4gSSBhbHJlYWR5IHBvaW50ZWQgaXQgb3V0IGluIG90aGVy
IHBhdGNoLiBUaGlzIGlzIG5vdCByZWFsbHkNCj4gYWNjZXB0YWJsZS4gQnJlYWtpbmcgQUJJIGlz
IGFub3RoZXIgcHJvYmxlbSB3aGljaCBjb3VsZCBiZSBqdXN0aWZpZWQgd2l0aA0KPiB5b3VyIGV4
cGxhbmF0aW9uIGluIG90aGVyIGNhc2VzLi4uIGJ1dCBub3QgaW4gdGhpcyBvbmUsIHNpbmNlIGl0
IGlzIGVhc3kgdG8gbWFrZQ0KPiBpdCBiYWNrd2FyZHMgY29tcGF0aWJsZSwNCg0KSSBzZWUuIEJ1
dCB0aGUgY3VycmVudCBiaW5kaW5nIGFuZCBkdHMgdXNpbmcgb25lIGNsayBpcyByZWFsbHkgd3Jv
bmcuIEFueXdheSwNCkkgY291bGQgbWFrZSBpdCBiYWNrd2FyZHMgY29tcGF0aWJsZS4NCg0KVGhh
bmtzLA0KUGVuZy4NCj4gDQo+ID4gU2hvdWxkIEkgdXNlIGEgZml4ZXMgdGFnIHRvIGR0LWJpbmRp
bmdzLCB0aGVuIGJyZWFrIEFCSSBpcyBhbGxvd2VkPw0KPiANCj4gTm8uIEZvciBzdWNoIHBhdGNo
IEFCSSBicmVhayBpcyBhbHNvIG5vdCBhbGxvd2VkIGluIHRoYXQgY2FzZS4gSnVzdCBtYWtlIHRo
ZQ0KPiBkcml2ZXIgYmFja3dhcmRzIGNvbXBhdGlibGUgYW5kIGJvdGggcHJvYmxlbXMgLSBub24g
YmlzZWN0YWJpbGl0eSBhbmQgQUJJDQo+IGJyZWFrIC0gZ28gYXdheS4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo=
