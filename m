Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD427604F7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 03:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjGYB7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 21:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjGYB7h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 21:59:37 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE89010EF;
        Mon, 24 Jul 2023 18:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfPTM4UcdW4fN1urnE3ERzdHNlYhvLbTVIigcPWWx4l3dJkRzaAyF5gZVgPJjUrSNTmMBwjlm8LYXsF3w6w9ymR5uN+KIw6QqzZTDNBQxWLWDlUkVZDo1QKJOGs88zAcZJ3rEHJfmPg1+MPKOgYte/eZaoa6i/p+dPLDThgOil2VKuxnEREY/BhG3QAQIvcPjCZr2V5+5jugllTGyMxqk9AVsAxURoI/wljxnaE8nxP9Oj3lhUfzy8K8CcrJdpAMkKQ59DuOtWM9boBEulibcR2FbfK/nZWpTgH2Z0cS/PscA7jnrX/hjDhHBelurfN7glhllzQbpakfyUCwY2M0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulP1vBMMT8D3O3sOAEJNrZtr2GEJn0DYYZAiCBDwLVo=;
 b=PemyDoZThH2P8S0HwE5YsJv8gc7TX3xp4sqEfoTBoyF4UWZQNAtZfv26Hk+zKDHDrCR8hFzqvpqV1pa7GLHRL51oNHCidyaKFD3cAH4Ms6hOWAmhA+iq6oUKiQTLiqrdpqG3cBSdJQUsqRW2jZLTBmf0n2FJVKU3xh9Uci+XIy2/SDygHaF1zMeu2jBcqBcBv3otqhbkVuZtn6gJG9z+iqHD2HUTkqKINFhIYOgxLCnzVGGmjEUuOysdT4Qtexoj10C9ox/5B4zGu7rzUoG9rWBIoEhfWUf/VLLLJduEtPKf8N+DRPw0ksSdfOLaLfADpmyyDuEORla7OWYeD51s7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulP1vBMMT8D3O3sOAEJNrZtr2GEJn0DYYZAiCBDwLVo=;
 b=Oiw4xzuXhISrj/sWdEXY35MYsZOulyhgx++dRXJLxkZaepl/UjdoEt7NU2hBblzKjqXkuvetD2E1fYilEt9g86NMKvPTBk33D3toJcef9wLev3PpVqtzJHCykPLZwbeHt5J9Z22apUuVvGxgpyCWN2oAIXiq1gf16vAxOcyGcyU=
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com (2603:10a6:10:1a::19)
 by AM7PR04MB7173.eurprd04.prod.outlook.com (2603:10a6:20b:122::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 01:59:32 +0000
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::7274:5109:64c5:b49f]) by DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::7274:5109:64c5:b49f%3]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 01:59:32 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 3/3] i2c: imx-lpi2c: add debug message when
 i2c peripheral clk doesn't work
Thread-Topic: [EXT] Re: [PATCH v2 3/3] i2c: imx-lpi2c: add debug message when
 i2c peripheral clk doesn't work
Thread-Index: AQHZvhzvYm9/5uNbQ0ORbbDi6FfRha/I2ycAgADfh9A=
Date:   Tue, 25 Jul 2023 01:59:32 +0000
Message-ID: <DB7PR04MB5003B6791D90142775B8E145E803A@DB7PR04MB5003.eurprd04.prod.outlook.com>
References: <20230724105546.1964059-1-carlos.song@nxp.com>
 <20230724105546.1964059-3-carlos.song@nxp.com>
 <CAOMZO5A28fNmMRwG6dX8vY2OkgvcmjqAJWQmjTXT9-OkAcYrRw@mail.gmail.com>
In-Reply-To: <CAOMZO5A28fNmMRwG6dX8vY2OkgvcmjqAJWQmjTXT9-OkAcYrRw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5003:EE_|AM7PR04MB7173:EE_
x-ms-office365-filtering-correlation-id: 1e4c8360-1909-4915-35a4-08db8cb2ca11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GwcKohRJzSxlZJouE5E/LRZF3t3KrUEsS3OErRU3afGHlxXGV5FiRvF5B2gu9j8wL/h9ntBd87DRuXySsFRaDcRrv+NEXBmnc4sfdPoA2EYfsWaYfdJjOuiZJXQD4miukhtdWPuJM5MILEcWYqagmJGiylApyeNFGIEO7cfOPf2xjMPA44q2Wa/WVbragmwnvkAprl0PLpVBRWa08ugIak7BUZHAQHC0e4scRhVsk8tNpuiwMXEDwZUQGvfVA8WLSznYtKXELYNzS4oAKW5jwrQGAFjAiXyqsmkXJuDKHrdLedukkb4A8+J4QWRN/uFepQBG72HHvUNlvT0SXCXRxcpxMjEJaFu6qNICMw24zYeJhzue7Wjk5Bot5F7p0C7BbMufKq4pvDdLtBK45ZtDFI3XdC1MwNUXpcpGNG+ezNGxbSeJweH+Qzlph72Z3keHF4JxCkzZHa4AxGYIy5DLUoOKWZ4lxR6L2Wf3sb/5Wxo4wtR1jVqeHqo+qMyOmYf0rZSZJDH99KFjQfnnLpWAi0dtMdWWIBT08a5ooqNVHYeLGhvoeW8JiNzLl1UA0Wx5xvbuCuZcBRmHUu5JtGhjKij2pLktLwhgOZ/Bm0kNqbXG2mGfLcaEoFusA16oglCH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5003.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(186003)(6506007)(26005)(53546011)(55016003)(83380400001)(71200400001)(33656002)(86362001)(54906003)(478600001)(122000001)(7696005)(316002)(41300700001)(4326008)(38100700002)(76116006)(66946007)(66556008)(66476007)(6916009)(66446008)(64756008)(15650500001)(2906002)(8936002)(8676002)(5660300002)(44832011)(38070700005)(52536014)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlVsMkdLWXN5Zi9CNkZucmxTbjA0RXp1MU5uQTc0cHl6UWlQNTh4Z0FIa1N4?=
 =?utf-8?B?dE9VMmVncjNPQkxVOUYyem1XNmc5aWZ5N3YzU0xrQUhzN1N2ZGdjTjJCT3JE?=
 =?utf-8?B?bVJEaHpHSnlra1lrTXJMSC9SaWQ0bHo0RndacDV3RmhUYTJEdGJrNFhYMDlV?=
 =?utf-8?B?RFJtUjRXK1dZTGR2ZW13QmkvSmpUZUQzTE9wMUJlYjltNXRiU1hweHkxYVU4?=
 =?utf-8?B?UCtvNVJiRzNQZTl2eGJiajBsRGFmT1BiTEVma3VIazFnUUxDcnZ4UTBNa2JN?=
 =?utf-8?B?NnFlamU0VDJSN2VGMGR4aHBMNVM0alRFOEJkSm80S2d2NXMyUFpmRndOaytP?=
 =?utf-8?B?Y3h3MWd6YkYzdDdPQmsrREpoTE5PQSs4S291WjJrTTBUREVwRlN1SWlDYVp6?=
 =?utf-8?B?T24rNmZRN3AzcnZ5d1ltRXRONjN0QVE4L1hXWEJmTzM2N05GcnN4R3JKMnMw?=
 =?utf-8?B?bytId21lSWJ6V05XczUzU1dTOEJUcmt5VWplUWptS0VxakZNak02MmJhQkxu?=
 =?utf-8?B?a3hoUkRXZ0pNK1IyV2VHdWh3MlJPT1gxTUxESzZQNXVkc1lVdVBFdUFFaEc1?=
 =?utf-8?B?amVqUzZxdmlMWkY3SkhCU05qaTVhQ0NkV2s2YVVSaW5udWFDOHBOcDZISVd2?=
 =?utf-8?B?WEJTNzB0aklPcHcxVFRBWFZVTFlpOVlwalc0VEROd1IzTlJ6aVRzOUxJeGhx?=
 =?utf-8?B?SUhGb0c4ZEEyNk5yeVdpY0d6T2RUWkNtOGxNcjIwNHUwazN4dWMyVTh6OU9k?=
 =?utf-8?B?R3ZkK25oWDQ1eFFtdUh4Vk95b0lNQ0xaWSttME1ENmJBM0pDTEF2bVhFQzVC?=
 =?utf-8?B?RE1UR0FVT0RmakZUYVVHM0hHMkpNdmR1dksvdngrUkhzTzNJclVicjQwbTcz?=
 =?utf-8?B?Z3k4Rks1Mm42WGNwNmxsYVhxa2RETkF3V2ZVOTd4SUMralRhRXVibjJ1bUdH?=
 =?utf-8?B?SVJybHNqeWtPU3ByRWx5TEZ0engraXcxenczR0d2OFRmSmtmRnYrKy80OTBa?=
 =?utf-8?B?QTVPYld6STFIV0x1MmxRYUdNYldrSWFXbGtKWkNkWll1bmNRSVZ5dkpFaExJ?=
 =?utf-8?B?MlhDUkthWi80QlZtcHUxTkRJTFRGSmhwdm1YYXU5dWl4Y0Yyb0R4bUU5TXQ0?=
 =?utf-8?B?YVowRE4rcEIrSmhseFBLZU1McFI5TUxjczk4V1FveUFuR05EQUw1YnFDcERZ?=
 =?utf-8?B?WkFUbkErMVFuMmxHczRWK0hUeWRpaVk1RWJWRG5zaXhmOHVscEFzeGxyV3la?=
 =?utf-8?B?Vmwrd2tOZXlueHoweldIdnp0UU9XUGFldzN6UTlPK0lKUnJubnVSVGdseVV1?=
 =?utf-8?B?S2wraUlWWEQ1bkYwVUVEc3lPZkc3TnFscUI5a0ZmNk1ITnhpN2FIVElKWUln?=
 =?utf-8?B?V1J6alhuSFZpK0JnbVlOc2sydVJLVTFMOUdPa09CcUhRdzlRVlI5bTM0K29t?=
 =?utf-8?B?SEVBVmk3cTZhOGxVSVVSa1N4Wm9Vb1NzbCtKeEowQkt4dThkMWxrS1VWS1JW?=
 =?utf-8?B?RXo1RjVGd2h0WFIraE9xUUlqbGVqbFZ1dVlPZlY1M0RvRTUwUnpQUWZSV05Q?=
 =?utf-8?B?aTNTUGUxMDRUSDZ4VllKbEMzd2tndmZsR3pjNTFaeEgydWdvSTdLSXIvdk14?=
 =?utf-8?B?Y0g0V0ZIeGRKcHRuQmtvVzZsSzgrREdtWVNwUis0SUxlZTBvRHpnSDl0Vkk0?=
 =?utf-8?B?TEU2cU9zdlBZU0JIWml1WG5zd3BxbmZyMFEzekw1dndKWWpGSEZ3NXY4emxw?=
 =?utf-8?B?a0pZUTBUSEdFZDcrU2xqdjg4M3o4NkFXZVN3WDA1VGFEcUUrRjc2Sm9DcnI2?=
 =?utf-8?B?K1NBY2QvaXEyWGowZnBmVm9ReDh3M2x6a2hUY2xvMlEydGV0Z1p2dXBiT3Ru?=
 =?utf-8?B?d1gzWFZaV2QvK1htaWtkZ0l4V0JoQVZTd0J6a05VeTVNanZZZ0N0VTN6V0VD?=
 =?utf-8?B?ZWpsS3paa24wMHBVUjR1aUFYd211YkR1VFd1ZGFURTZHLzROV1FJYk0vY3pG?=
 =?utf-8?B?MWJGNk5WeW4yZEluZVJQdFcrN1FZU000TCtzc0pqU21VbXhxQWxWRWtVanY2?=
 =?utf-8?B?SWN5MnVNcllSM1R1OG9ZTURxWm95V1VWdXhaM0RCNGNWQlI5bE9UcGthazdG?=
 =?utf-8?Q?Zxbw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5003.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4c8360-1909-4915-35a4-08db8cb2ca11
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 01:59:32.5081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClnIhC6CUiwCscXNEN7z654Yf2OQd3V0Ql/l6Azgr9Quo/qrcdBVVMSrBgiDv1PGrB1xBU4vgQgbOhMgsrwOhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7173
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzISBJIHdpbGwgYWRqdXN0IGl0IGFuZCBzZW5kIFYzIHBhdGNoLg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDI0LCAyMDIzIDg6MzggUE0NCj4gVG86IENhcmxv
cyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPg0KPiBDYzogYW5kaS5zaHl0aUBrZXJuZWwub3Jn
OyBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsNCj4gc2hhd25ndW9Aa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOw0KPiBD
bGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+OyBCb3VnaCBDaGVuIDxoYWliby5jaGVu
QG54cC5jb20+Ow0KPiBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgbGludXgtaTJj
QHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFU
Q0ggdjIgMy8zXSBpMmM6IGlteC1scGkyYzogYWRkIGRlYnVnIG1lc3NhZ2Ugd2hlbiBpMmMNCj4g
cGVyaXBoZXJhbCBjbGsgZG9lc24ndCB3b3JrDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4
dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4g
b3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVz
aW5nIHRoZSAnUmVwb3J0IHRoaXMNCj4gZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IE9uIE1vbiwg
SnVsIDI0LCAyMDIzIGF0IDc6NTLigK9BTSA8Y2FybG9zLnNvbmdAbnhwLmNvbT4gd3JvdGU6DQo+
ID4NCj4gPiBGcm9tOiBHYW8gUGFuIDxwYW5keS5nYW9AbnhwLmNvbT4NCj4gPg0KPiA+IE91dHB1
dCBlcnJvciBsb2cgd2hlbiBpMmMgcGVyaXBoZXJhbCBjbGsgcmF0ZSBpcyAwLCB0aGVuIGRpcmVj
dGx5DQo+ID4gcmV0dXJuIC1FSU5WQUwuDQo+ID4NCj4gPiBGaXhlczogYTU1ZmE5ZDBlNDJlICgi
aTJjOiBpbXgtbHBpMmM6IGFkZCBsb3cgcG93ZXIgaTJjIGJ1cyBkcml2ZXIiKQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEdhbyBQYW4gPHBhbmR5Lmdhb0BueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IENhcmxvcyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jIHwgNSArKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1pbXgtbHBpMmMuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBp
MmMuYw0KPiA+IGluZGV4IGU5M2ZmM2I1MzczYy4uMTJiNGYyYTg5MzQzIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gPiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ID4gQEAgLTIxNCw2ICsyMTQsMTEgQEAgc3Rh
dGljIGludCBscGkyY19pbXhfY29uZmlnKHN0cnVjdCBscGkyY19pbXhfc3RydWN0DQo+ICpscGky
Y19pbXgpDQo+ID4gICAgICAgICBscGkyY19pbXhfc2V0X21vZGUobHBpMmNfaW14KTsNCj4gPg0K
PiA+ICAgICAgICAgY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUobHBpMmNfaW14LT5jbGtzWzBdLmNs
ayk7DQo+ID4gKyAgICAgICBpZiAoIWNsa19yYXRlKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRl
dl9lcnIoJmxwaTJjX2lteC0+YWRhcHRlci5kZXYsICJjbGtfcGVyIHJhdGUgaXMNCj4gPiArIDBc
biIpOw0KPiANCj4gVGhlIHN1YmplY3Qgc2F5cyAnZGVidWcgbWVzc2FnZScsIGJ1dCB0aGlzIGlz
IGFuIGVycm9yIG1lc3NhZ2UuDQo+IA0KPiBQbGVhc2UgYWRqdXN0IHRoZSBTdWJqZWN0Lg0K
