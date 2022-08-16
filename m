Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723A25956CB
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 11:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbiHPJm0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 05:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbiHPJlx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 05:41:53 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10059.outbound.protection.outlook.com [40.107.1.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2D1792D5;
        Tue, 16 Aug 2022 01:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwQ0oiRMI2vlUDco2VIppJERtLzt9FAqNv0x6BuSgeFyaRolt1HKCZWLZmZyhyRTGkWLece3GAcdn3wSyvloT3khctclL9mbrDPm2XVzyZwv6cqA5Rq9wGG5qsYE8n6r8i0MLhOb3Gz9v//ezYzFLaIB8NNhq84vWJz9pauK/HaJSXuybA1DTHpDUBLDZsO2mElX4owepiNJndgMukdJGQjEv3DJVk9kyBQkc06fwD0+zosPGZyLi5yfFShnqWikC2PhXHgyMq4YyqPfGdsG5bUq/2+fHoZmptnfc4WQEmDggUWxhLdlztRCcmCRCTAvj8a7LVdIcsyItawE0IB+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViUpip4UF7c/K52mOThVdnGqyovJjHlReaIov+3QmHA=;
 b=naZnOrjK9gBIoGmH1MqQX2Z1DgWaXebaD6HkjhJUTGLHcK3VQGgk54HXC93fkqVpwggmI5NPGt1YgbCymYbuW8dv5aGhU/69xsWpsDrAN5phmHTjH5GRywc6wsum8DjFpXZLXM9pukGJPehFQ0k4PYA09CknDPalIYEFKpHVkVNpsJU6E2q+KG/5O51Z3yvcqsVLRTv5efJGU5pHan2lIZost2a6/K5sHLfRQA3idP6/M5CIH9sdmQTgFWigHlTrxdLLkHsYstkjUWqoVtwN4Mpv4swoF9d+3UMzAH+CipxrXPTU2mWet2mOoQYhZUrQOuZ/9z+Q8KDuHvjOcGR86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViUpip4UF7c/K52mOThVdnGqyovJjHlReaIov+3QmHA=;
 b=S/f7KyXrrvfUvnumtMaW6mCEN5n7somiQg4WYxgJkP6wwBOlZHOps36ZOV12msZVeW8/GxkzLgRTkagYfaQXFbf47/ZcW2meV7kDmws/bhpKAHlxyuEvrst8SX/U9usHaBg3bj190gZSqOO4176dbiDh4lGzh8zlgVtNZgJ9igU=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8170.eurprd04.prod.outlook.com (2603:10a6:10:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 08:43:54 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 08:43:54 +0000
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
Thread-Index: AQHYrgSSA2Yxdic4lUaQqa4Ze2PTqa2rDHsAgAQXC0CAAeuegIAAK22w
Date:   Tue, 16 Aug 2022 08:43:54 +0000
Message-ID: <DU0PR04MB9417EF15DD50EC51B4FBBCFF886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 60e4499d-0c63-40cc-4a8c-08da7f63738c
x-ms-traffictypediagnostic: DB9PR04MB8170:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dC8gyvkxMzQxvuXQtpJmSybYnvC4eH5BMqbfV3dj0m3jCW/9o2wzoY/VtNITPNa/MekXjezs7ZMQ0RBApp5RDAj1j55X5qErEpGYkafEKh7jGEdtAVKW9XhrwgsLXxCEmoN3eDwrl8bu9SNsVwiELo3Xtzg96yD+wXHsH7HjICJ/v6eZikqlwWLE4XqsOTZk0q3/Ydhq7HePSKSFdqC8KptIi+ryIcatfa8XUoroLyfRNRHzQCjwHYHtSnHW4J9RIYM+8sZYKzVBiHlLswRV9PwxJF1uwHOdL14Y3MIWnb73j6n+vBGwV57blZbvq04IUcajm5Ng9Dr08bwt7RF1ooKq2MYVVIgCcRaRTlDiRTeNGPuWHMGXkP2D/JeJ+PgNp+j3SGaRrvnGiJtRShA4RDARU9RXfqmOtmee+CObhcZV651jBMaj/LsbQiV/Cfw1tODgxqPzCeglRItza5gzAyugln2dEQXf4R95fZEvoPBg9IUMarWsi8mRVnf6luvq1oqvpy0ugbwmlYqzsqhY1TX7Nf7/hix5A4bucXYGj/vE7Ha0kSzkTXXDkNvjlbfMCiT5LuQWeF093YcQTbJdLRG3bicpWlSFvzvekyqnlFp7rB2zbUwQboy7oHBMoBFbJOmEERt8vLKyyDZQIBlJz+xHLOFh4vBh0H6/q0F3D6a9gv0W7Q5OidJmZn1LY/CqegrZj28EO/c5HupyKZ9TOOQL8u69b3UZVmv4Df/YdEw+F5hbYdEvPQplAgwEjCbIfQk8MeB6pFO4JgSidf0IenExMu6U37Ypw0wOzIoHwwOT1NQpuujYvWdmL5hS9ELq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(41300700001)(7696005)(7416002)(316002)(71200400001)(4326008)(66556008)(8676002)(6506007)(54906003)(64756008)(66446008)(76116006)(66476007)(66946007)(110136005)(26005)(8936002)(52536014)(2906002)(44832011)(53546011)(9686003)(186003)(33656002)(86362001)(83380400001)(5660300002)(478600001)(38070700005)(55016003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGdlUW94Z3JYTmZMTGVsNHRmZ3VDYkpqRU5LbFA3RCsxNHVRNE1zMXRTTHQv?=
 =?utf-8?B?MGdkNjFsK1VSaWdpQ01WR1VFQjE1Qk9ORERFQkczUXFkd3hma2x0ZmFsOVdt?=
 =?utf-8?B?MS9TQlFtOWdNdHRxVmtncXFvaXB6OUNIY3M1QjF0MUc1eVdXNFE2dmFPSGdI?=
 =?utf-8?B?T043L2hVcmNMOE5YdTd1Y09zUSsvRVNMei9FbFMvdmhpM1JaeXFEZkRMdTBL?=
 =?utf-8?B?RVZ2cllsTi8wVGs0WWQxVk55WXRCcXFQS1pFME9icTA1TWo4WHhMVExQc2Zl?=
 =?utf-8?B?QjFWcElGL0hkQmxPYnhmUEIrRE5XclFLWi9wMG92QklSVTFBY1NadDNpVDZO?=
 =?utf-8?B?WUtzUGJlNU5pOUMzdlpDdS84WmlxbkFyVnpHQlFTN0NxTGQvRTVxRjltMlo1?=
 =?utf-8?B?SDlhNzNUNUZTVDl1WEZKdmdMelNMMWFibHUwaFFjK09HUjVzbytzS0Jzb3NR?=
 =?utf-8?B?eEFKdG5SOXJpVWh0YXNwYXlzUDNyRkZBQlZNUXN0Q2k0Q0p0MkNyT0hiWlBj?=
 =?utf-8?B?UlMzUlMyN0xlUmZZT2NFTnRuaDVnS2x2R3hqc3VRNnc4UEIzem11UGczb05U?=
 =?utf-8?B?SkFJRGFKSjBtOS9TL292b2lsNnBFMkp6TDdTYTNONlFSNG9pVFA2TWFEMlFC?=
 =?utf-8?B?V1pBZXpTRXQ5d0hHNUd5ZXpLUDVtRFgvZXZOVFFSRWhldXhKS1ROaG9acVI2?=
 =?utf-8?B?akkxKzU4SUFxeUFTeUJQK3BhVVpUUENqNzNZY1F0MGJwcXg3bW43TmpmUXlh?=
 =?utf-8?B?STZzaUZCTDh2d0hRd3FzVE8xd3JOK1p4N1pTaUxTc3I0N2JoRVNIVnMzc3Ju?=
 =?utf-8?B?d3lXdDhPR3ZCUFp3Z2xOaDlENXg0OTJkcWhGR2J6NTZoYkhPTjdYYzNZVll2?=
 =?utf-8?B?TVd4RHl6eXVwY29aSG9yZTJrY3JGMWRGemZJWVUvbWx0dW1ZclNhZ1pycGVu?=
 =?utf-8?B?L1RCTGljaW03M3dFdnVWVFdOSXVUbG5aK0krZklpemJNY29WWm5IdjZXNmxP?=
 =?utf-8?B?UFZtTXNEU3lCaGZPNWFZeitUVGRsOUJ6WlRjeEtlUFZETGVwT0hvQW5IaUY1?=
 =?utf-8?B?K1dmWUpCc2F5UFNsUHVucFVrMForNi9LMm9MbEtVYzI4VVN4YU94UmRkaVFB?=
 =?utf-8?B?VFZIaG1VdGkwZkZhcnptd2p2d2NXNTVvNVVIOWdmdkwwY1RjVHhoNTZQaEZO?=
 =?utf-8?B?SGR5cXBjeU1GUXR1RWxzekd3TDc5YVRMQnF2YnpSR0dqdTlCcjZWcnl1NHlZ?=
 =?utf-8?B?SGYxbkQyRmN1QUl1NHNUZUsxRENkb0NacjlKVzRVTlNkUVBlaHBHYnJWYi9x?=
 =?utf-8?B?R3RHVGliOGdXaENHVWoxMVprQVdtQ0JteXl3MitMUmcwOGd6YnVBRkY2Qy8x?=
 =?utf-8?B?cG9OaXozWk9FeEpLZmxUUERqUjdmdEU5TE1DdmpoYTYxSkZLSm9Nc2V4Zmtm?=
 =?utf-8?B?dC9nR0l1Wkp4MzhLSnYwRTZYTkVYQ0NuYTdQRUtwazhZQ0lNbks3NGswaHI3?=
 =?utf-8?B?M0lRWmlTa2JYdkFDZUw2Z3VJbDNzdWxQMkpic0dCaTV3bnU0aUxrY2hXUGQv?=
 =?utf-8?B?MXVOek8rV0Q4bUg1NXRGR2FrQ0FxZExocWRqbWV0SUNkUUFpQVJ1RkxwanRJ?=
 =?utf-8?B?Kzdpc25xcHFlZTRkRC8xSjAzNC9xaVdCQVZMa0pNT0FLSk12bWRCT0xMa1Nz?=
 =?utf-8?B?cXZXVFVPQlptcmY2bHFFaURORVRQZ21zeG1nS1pxSlYyNWdlNUkwdzRTaitR?=
 =?utf-8?B?Q1JSeGphTFJoV2RGWGpMTUM1TW5vL2lZdXlTcW12UTdQQUtITGIyU3hGc1dl?=
 =?utf-8?B?Y2w5RDBKZHd4ektlN2NQS1QzOGNZRWJXdE5CdU1JK0VaVE42M1ZvRXJMUUp0?=
 =?utf-8?B?bDJxYWw5TW1mQmtaTEpsbTNUVTB4a3BmTEp3eFVXOWtHSWpOY1BrazFhYTlM?=
 =?utf-8?B?ak1lMEhHTmZCM2pUcVp6c05DV1NiekdHZVF0OE8yeVhOZ3Y3R1V4NHIyNmxB?=
 =?utf-8?B?TUxqeGNCQis2czZReGdSaDZidEtsVFNpWTdKcUxHcGRLYSt3ZE8yOU5NNi95?=
 =?utf-8?B?aU9tVnFFSmlsdkx1R2FDWmpubnorL3BUU0dDMWVKWHdjb1pVREhlMjVTT3RE?=
 =?utf-8?Q?IC14=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e4499d-0c63-40cc-4a8c-08da7f63738c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 08:43:54.3254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/aQdpnntXr5BPLNoA8niQyetm8prqDj4duhgixCSnY6h36gPpXNZX2/fz6oEoO60IdT63EZObhv2U3uWO1Gng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8170
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC82XSBpMmMtaW14LWxwaTJj
OiBhZGQgSVBHIGNsb2NrDQo+IA0KPiBPbiAxNS8wOC8yMDIyIDAzOjUyLCBQZW5nIEZhbiB3cm90
ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzZd
IGkyYy1pbXgtbHBpMmM6IGFkZCBJUEcgY2xvY2sNCj4gPj4NCj4gPj4gT24gMTIvMDgvMjAyMiAw
NzozNCwgUGVuZyBGYW4gKE9TUykgd3JvdGU6DQo+ID4+PiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4NCj4gPj4+DQo+ID4+PiBUaGUgaS5NWCBMUEkyQyBuZWVkcyBQRVIgYW5kIElQ
RyBjbG9jaywgbm90IGp1c3QgUEVSIG9yIElQRyBjbG9jay4NCj4gPj4+IFRoaXMgcGF0Y2ggaXMg
dG8gZW5hYmxlIGJvdGggUEVSIGFuZCBJUEcgY2xvY2sgZm9yIGlteC1pMmMtbHBpMmMuDQo+ID4+
DQo+ID4+IFRoaXMgcGF0Y2hzZXQgYnJlYWtzIHRoZSBBQkkgYW5kIGlzIG5vdCBiaXNlY3RhYmxl
LiBUaGUganVzdGlmaWNhdGlvbg0KPiA+PiBpcyB2ZXJ5IGxpbWl0ZWQgKG9uZSBzZW50ZW5jZSks
IHNvIG5vdCByZWFsbHkgZW5vdWdoLg0KPiA+DQo+ID4gQVJNMzIgaS5NWDdVTFAgYW5kIEFSTTY0
IGkuTVg4UVhQL2kuTVg4VUxQIGFsbCBuZWVkIHRvIHVzZSB0d28NCj4gY2xvY2tzLA0KPiA+IFBF
UiBhbmQgSVBHLiBCdXQgY3VycmVudCBkdC1iaW5kaW5ncyBhbmQgZHRzLCB1c2Ugb25lIGNsb2Nr
Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaHNldCBpbmNsdWRlcyBkdHMgY2hhbmdlcyBwYXRjaCA0IGFu
ZCBwYXRjaCA1Lg0KPiA+IFBhdGNoIDYgaXMgdG8gdXBkYXRlIGRyaXZlciB1c2UgdHdvIGNsb2Nr
cy4NCj4gPg0KPiA+IEkgdGhpbmsgdGhlIHBhdGNoIG9yZGVyIGluIHRoaXMgcGF0Y2hzZXQgd291
bGQgbm90IGJyZWFrIGdpdCBiaXNlY3QsDQo+ID4gaXQganVzdCBicmVhayBBQkkuIEJ1dCBJIG5v
dCBmaW5kIGdvb2Qgd2F5IGhvdyBjb3VsZCBub3QgYnJlYWsgQUJJLA0KPiA+IGJlY2F1c2Ugb25s
eSB1c2Ugb25lIGNsb2NrIGlzIHdyb25nIHdoZXRoZXIgaW4gZHQtYmluZGluZ3Mgb3IgZHRicy4N
Cj4gDQo+IERyaXZlciBjaGFuZ2VzIGFsd2F5cyBnbyB2aWEgc2VwYXJhdGUgYnJhbmNoIHRoYW4g
RFRTLCBzbyB5b3VyIHBhdGNoDQo+IGJyZWFrcyBnaXQgYmlzZWN0LiBJIGFscmVhZHkgcG9pbnRl
ZCBpdCBvdXQgaW4gb3RoZXIgcGF0Y2guIFRoaXMgaXMgbm90IHJlYWxseQ0KPiBhY2NlcHRhYmxl
LiBCcmVha2luZyBBQkkgaXMgYW5vdGhlciBwcm9ibGVtIHdoaWNoIGNvdWxkIGJlIGp1c3RpZmll
ZCB3aXRoDQo+IHlvdXIgZXhwbGFuYXRpb24gaW4gb3RoZXIgY2FzZXMuLi4gYnV0IG5vdCBpbiB0
aGlzIG9uZSwgc2luY2UgaXQgaXMgZWFzeSB0byBtYWtlDQo+IGl0IGJhY2t3YXJkcyBjb21wYXRp
YmxlLA0KPiANCj4gPiBTaG91bGQgSSB1c2UgYSBmaXhlcyB0YWcgdG8gZHQtYmluZGluZ3MsIHRo
ZW4gYnJlYWsgQUJJIGlzIGFsbG93ZWQ/DQo+IA0KPiBOby4gRm9yIHN1Y2ggcGF0Y2ggQUJJIGJy
ZWFrIGlzIGFsc28gbm90IGFsbG93ZWQgaW4gdGhhdCBjYXNlLiBKdXN0IG1ha2UgdGhlDQo+IGRy
aXZlciBiYWNrd2FyZHMgY29tcGF0aWJsZSBhbmQgYm90aCBwcm9ibGVtcyAtIG5vbiBiaXNlY3Rh
YmlsaXR5IGFuZCBBQkkNCj4gYnJlYWsgLSBnbyBhd2F5Lg0KDQpPbmUgbW9yZSBwb2ludCB0aGF0
IEkgYW0gbm90IHZlcnkgY2xlYXIgYWJvdXQgIA0KIm5vbiBiaXNlY3RhYmlsaXR5IGFuZCBBQkkg
YnJlYWsgIg0KDQpBQkksIEkgc3VwcG9zZSB5b3UgbWVhbiBkdC1iaW5kaW5nLCByaWdodD8NClRo
ZSBJMkMgYmluZGluZ3MgYW5kIGR0cyB1cGRhdGUgd2lsbCBnbyB0aHJvdWdoIGRpZmZlcmVudCB0
cmVlLCBJIHRoaW5rLiBTbw0KZHRic19jaGVjayBtYXkgZmFpbCBjb25zaWRlcmluZyB0aGUgUFIg
bWVyZ2Ugb3JkZXIuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQo=
