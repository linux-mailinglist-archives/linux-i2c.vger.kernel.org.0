Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E4D704B13
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 12:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjEPKv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 06:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjEPKvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 06:51:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ED01B6;
        Tue, 16 May 2023 03:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaaeKLjERKS0lNdHjMXaUIflTAKYLg7Xqv8QcyLbtyuo3gx7iSOkIQ+IgosynCeN0wbf0CwCvij3qeBoveOnq7QLYAoY/Pog6BXJyM658+4JOkMGJdScAvBtK8DqdI2Te2nYP52EGqjQXCAHt521g8aaKVCzq6CnwLH4HSRKw+TlMokU4JIfZvl34qvRfuM/nYj/iyNoj8BQS1Xv9p7WVCuWYA5sBAHg4OWkVMLp1Tq9B82rS413/uXjxqqwR7b+EuooDxcXs9bnZwV5zkB6NwEpcS1nEBAGkULoMOxun6VhUKoBTgIBP7GDB8nxpNNRwPHGq9sARev3qcjDnz1fgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR8cMCUcLj5f79B9g3a1QxUaCJ22naxdds6sYqn3bCg=;
 b=cPrpz89nFPi9Obi+045Ydne10ESQtnG67wf4Ie04VFh8R0ZK5nWsDbueS7rvM446B5DMntx9LpRyk3aNJnLyvvmW+TwNXFzsZFQlGHgGttbhGMfKpJSZBzvYyiGqjHSvKnGzsIrBvcsz52RC5MDXEDFBR7BY8x72fgt3ecu9kVucoofQIUlVgmGW73i61mSpFXGuJLXmQrfkLuDrSV03Z52c19rBm3tajyB7Wtqa5y3i7x2FmRAf/NbBy6v2DNuiAaNRAeET3XMevRRTrxvjufSpzntKpNyMhMoKx3Zd5oXLKLXKi72VvsgxylNfFf2/VJ03n1FBIDKxCqnR6QyPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR8cMCUcLj5f79B9g3a1QxUaCJ22naxdds6sYqn3bCg=;
 b=aYpPdTWpn+ApwTKU2G+a9c3BNMxS445uzFQvdX9AO4Ry7w8JI9+SOOlnJQcetB0G40pF5kzJ8sE2dOb1MSbISucwA1SorSDtaOMDXOF9pvwIX7eJHBzcjl6sF4qS3FcFfpi3VG/ISzrNnODKZtWmaFY+tRvPfpJ2bI84d/x9z2Y=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5820.jpnprd01.prod.outlook.com (2603:1096:404:8053::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 10:51:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 10:51:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/5] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v3 1/5] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZhbtaOfdgl4yzBEO1jwfLBuHRka9cifQAgAAye/A=
Date:   Tue, 16 May 2023 10:51:50 +0000
Message-ID: <OS0PR01MB5922929B8041871BCF9F4D8D86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVYPZftcTP5E0f1uwkTsunn9KAOtLeDNqiFoKx+m7OQDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVYPZftcTP5E0f1uwkTsunn9KAOtLeDNqiFoKx+m7OQDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5820:EE_
x-ms-office365-filtering-correlation-id: bc6e2264-2920-408f-71d3-08db55fb8d83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jjm6sWytaQ3Mdzwvp2GUsZmOreuiOli8z2oYyXGFZ2mNBapdTpvPcPZ9uVNXyUSbcSVUY4tpr4nSQtC8zxYmCCi1voCBh+H3j5PktHmU1pKj6bHwiPO686VXYf6i5nbhA8KiKFXcfyhhKwGQ2ZX6Q8u1TIEeSP10FYagXXpUMoWKpPx/hD72hey2jZEDb+dqNlP2GeuQ9x91oFYnJGU5NuNKoUbvtOErq7GF7ZSX7oU/M0ozd9JTg8JdH0z2HaSraQbIoi6CSOGfcWcLhOY5JhLmKSlnuDQVRpVaXJvRKkFMAUOZZA/njn6ZWWNHrLWTNCCCSSlWM2j9ZYNQ5AG2kFyNdMqXZba2/kkGcvGUQafCsKS19qmuY4tJPSYkEjY++QBOSRskRTVQc2mAQ+W7lQZMcsGOrdbbZnTIVaV23s4Zne0xTAxdOjRjewWnTbumv4vDmE8OQBv0MtKUqQcBFgcNJHrATA7HZmSt/4HdSYVruvYhcCTh4L1Zjw/4iYL7FRZVnRTWiMo12nIFyyo9ZE/1ekamJ8eFCMv/8pyrCal+g9utpQo8QbAHrmqLFVoeV2GzjYsXi83WuaoEO8VQpN9FIav24zTNPi7VqMltqDmkvIMuzOQ2VxgORPURJLUw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(478600001)(66446008)(76116006)(66946007)(66556008)(66476007)(64756008)(6916009)(7696005)(4326008)(316002)(54906003)(38070700005)(33656002)(86362001)(6506007)(26005)(9686003)(186003)(53546011)(8676002)(8936002)(52536014)(5660300002)(7416002)(2906002)(71200400001)(55016003)(122000001)(41300700001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnBGOTFYRFdsVkdHNXRqMk1nbjdLSFZjSXhrMHJMTnlnSERxakxielRCaDdw?=
 =?utf-8?B?d1pMYlV6djhIWURNZWJ6QnNRcWVHaHYwSlZOSVlySUdGeW9LV1d0aWcvcVFv?=
 =?utf-8?B?QmpLa2VPWWhhVHd6QWF5TjdCUVp3dmw0d2hyeExmcHA5RnlzcjNYTE0ySVVs?=
 =?utf-8?B?aHViaVQ1NmFTMUFmNzZFd1hGcjBIODlvMWFyRW1aLzdaTWFad0NneEd1RTZ6?=
 =?utf-8?B?Y1B1aVBhVElsU2pyNVFwdGxQajVxNHRQTysxQldrTHovTnVST0E5WlpQQ3lV?=
 =?utf-8?B?UFpTckxsRjYybmJYMEFZcjNIRHMyRXh5bEdaMUxobkNvZlE2Z0tLRE1BZ0tw?=
 =?utf-8?B?R0Fpc2tnQWpiM1VSOUJ0STdxbjZacUthZEN2dlBETzJVTnJXRHhOcjkzbVRz?=
 =?utf-8?B?Q0lwYWxuSG80YmRWRjJpa2pOS3l0YlpmVU9GZmRhWlZ0VWU2d2RsMHcxeWla?=
 =?utf-8?B?bnVqMFkrUlo0UFUvTjlVdXVuWDB1Ykp5UlFOdkxoOVgreWZBQ3pIRWNhSHVH?=
 =?utf-8?B?RklCZVFKRVZoUC9pcUhSZHI5VHQwOHpPRTQwWU9uUXliNjRhdVBRalljT1hY?=
 =?utf-8?B?NGtOWG95L1dRWVorbEtsbFdIbXIxWi9maW1wMHhFM1FrVTFpdWE2ZGo2Ly9y?=
 =?utf-8?B?ZG9xMlZqYnJLZ1dkeWppcm5OZ1NQVVB4Wm8wRVZYL1BjY0xubkN6SHgyNWts?=
 =?utf-8?B?bGpEeUtyMWNnSXF0YmJJWmMwYXhBaWU2WkFkdHdIcXVTaUl0N3VvK04xNWUx?=
 =?utf-8?B?cDB0OTZyZnN3a0t6RDdkbXZ5SzFKMFV6WFZPMlJaUTJoNjFNWDhzNFdTNWxy?=
 =?utf-8?B?MjFnRlNGVzJqenRQQzZRTDE1M0lDWi9uVElURU1pcU8rK29HbFlGV3BQUXVy?=
 =?utf-8?B?a0xGZFJRbC9UbnppdjE3bkh6NU9MRFVsSXpGRDFMWTIyVUR1S2RrbG9iQmcy?=
 =?utf-8?B?TVlxa1NmY0VhR0dhejB5Ky92Rks1VkJaTEZ3N2UzYkNSZEthT3AzVnk2cEt3?=
 =?utf-8?B?eWhWQkpyOGg2RFpwd2hOWDBPcldwb20vdWIzVjlMckVEclloT3RJRTRic3VR?=
 =?utf-8?B?ZGRTTStkdjduWVVwZFlKNGppRjdBUXk5QjlBcElFbmlCZHRQaUx4OFdlRWxj?=
 =?utf-8?B?UFkzdnRMUDMwQ0hyUGNvdmQ3Y3FjOHdnSTNTWXJHQkNXODczUFEwQTY5bCtM?=
 =?utf-8?B?U2pXVzlraHlEWlhFc0R1YzVFc3NwdVN6OG5RemsyRXRTam1aSHdnK011MVNU?=
 =?utf-8?B?bkI4dHBoa1BuamcvSXlNVlpER2Y4Y2ZVVmVOQ2YrWVNyNThqaUl0S2ErVUVa?=
 =?utf-8?B?by9wSkhDRit1QVQvQXh0elZoM24wQ2RLZ1QwOG1NNzdMS1VHTlhtTEJ1WERw?=
 =?utf-8?B?ZFNzMk9ndVdnNWVaZHRCSnBiVGViaElha1QwT1JlakJxT3Jqd2JVY3lveVZz?=
 =?utf-8?B?UWZFQTh3eVRaTGpoTzE2VWdZdUFmcEVZS1Z6UVFzVWpPbnovdThqbnoyaWZ2?=
 =?utf-8?B?dHdoTFRLRWxlaXR0UGFuQVkyR1hVTzE4RVVpZklrQnNTU205SExQL3NaRGt4?=
 =?utf-8?B?ZUlKQTZJancxNjBKQ2ZSVXpGQlEwYUlDQVZzZWY2cUZjTzRETmtycWl1a2M3?=
 =?utf-8?B?R3dYOC9LZTNsT240UDd0alh6OFMzTG9qQytYQW1xdVpjYjM1aFp6Uk0za2Ra?=
 =?utf-8?B?cjZSMzJFNU5TcWhFR29WR2VZVFpJSUx0cjRDc3ViemQrS1hEcS93SFRxUFJD?=
 =?utf-8?B?R0R0cE8wM1cyMkRoYW5PTmIzckd1bWdEOUtNc01KbmU4Z0E0VFNMbnM4dWRj?=
 =?utf-8?B?ZHBmRzZEWEE3aStRYi9lWFNJQVcvMzMrcGFIOWRCYmdya3cyZVM0SURsZmVR?=
 =?utf-8?B?OG0zYjdiT1lHaEtSZ3JwOEFMcHdVVjZmaWlsNCtxZXBGQS9BaW0zUjVlVWhn?=
 =?utf-8?B?RmszL2ZDa2htSndTd25tbmw3T1REMXJvUUFadk9oeUpBSnpKZXBWUGIvTUR6?=
 =?utf-8?B?Z1VzbWMrYk1PcXhjM1VqS2VHL1p5eVFqWC9XZ3draWxGdlB4YmhCZHdaOXNL?=
 =?utf-8?B?TTg5STlJeDc3NGxJcyt1bXlTRXpBOVZQdWx0d09QaEpqLzhXN0hSSEdZT0dQ?=
 =?utf-8?Q?YNLCycay2l8hVBSteVaZ72H1E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e2264-2920-408f-71d3-08db55fb8d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 10:51:50.2165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwJ8KFtyMywT/QWTqiuVB9JfSIg3aY6UGhzA76zvfStxlkDMqpNVDJMzaLuz9gp8jawkKNSYfc2Pd+44Th5LvYlWXPl8NWl6ITxAbQU6Hg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5820
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
UEFUQ0ggdjMgMS81XSBpMmM6IEVuaGFuY2UgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNhdCwgTWF5IDEzLCAyMDIzIGF0IDY6NTLigK9QTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFJlbmVz
YXMgUE1JQyBSQUEyMTUzMDAgZXhwb3NlcyB0d28gc2VwYXJhdGUgaTJjIGRldmljZXMsIG9uZSBm
b3IgdGhlDQo+ID4gbWFpbiBkZXZpY2UgYW5kIGFub3RoZXIgZm9yIHJ0YyBkZXZpY2UuDQo+ID4N
Cj4gPiBFbmhhbmNlIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSgpIHRvIGluc3RhbnRpYXRlIGEg
cmVhbCBkZXZpY2UuDQo+ID4gKGVnOiBJbnN0YW50aWF0ZSBydGMgZGV2aWNlIGZyb20gUE1JQyBk
cml2ZXIpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjM6DQo+ID4gICogTmV3IHBhdGNoDQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBMb29rcyBjb3JyZWN0IHRvIG1lLCBzbw0KPiBS
ZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4N
Cj4gDQo+IFNvbWUgc3VnZ2VzdGlvbnMgZm9yIGltcHJvdmVtZW50IGJlbG93Li4uDQoNCk9LLg0K
DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiA+IEBAIC0xMTUzLDcgKzExNTcsMjcgQEAgc3Ry
dWN0IGkyY19jbGllbnQNCj4gKmkyY19uZXdfYW5jaWxsYXJ5X2RldmljZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LA0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBkZXZfZGJnKCZj
bGllbnQtPmFkYXB0ZXItPmRldiwgIkFkZHJlc3MgZm9yICVzIDogMHgleFxuIiwNCj4gbmFtZSwg
YWRkcik7DQo+ID4gLSAgICAgICByZXR1cm4gaTJjX25ld19kdW1teV9kZXZpY2UoY2xpZW50LT5h
ZGFwdGVyLCBhZGRyKTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoYXV4X2RldmljZV9uYW1lKSB7
DQo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBpMmNfYm9hcmRfaW5mbyBpbmZvOw0KPiA+ICsg
ICAgICAgICAgICAgICBzaXplX3QgYXV4X2RldmljZV9uYW1lX2xlbiA9IHN0cmxlbihhdXhfZGV2
aWNlX25hbWUpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGF1eF9kZXZpY2VfbmFt
ZV9sZW4gPiBJMkNfTkFNRV9TSVpFIC0gMSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGRldl9lcnIoJmNsaWVudC0+YWRhcHRlci0+ZGV2LCAiSW52YWxpZCBkZXZpY2UNCj4gbmFtZVxu
Iik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7
DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gDQo+IHN0cnNjcHkoKSByZXR1cm4gdmFsdWU/DQo+
IA0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgbWVtc2V0KCZpbmZvLCAwLCBzaXplb2Yoc3Ry
dWN0IGkyY19ib2FyZF9pbmZvKSk7DQo+IA0KPiBUaGUgY2FsbCB0byBtZW1zZXQoKSB3b3VsZCBu
b3QgYmUgbmVlZGVkIGlmIGluZm8gd291bGQgYmUgaW5pdGlhbGl6ZWQgYXQNCj4gZGVjbGFyYXRp
b24gdGltZSwgaS5lLg0KPiANCj4gICAgIHN0cnVjdCBpMmNfYm9hcmRfaW5mbyBpbmZvID0geyAu
YWRkciA9IGFkZHIgfTsNCj4gDQo+IE9yLCB1c2UgSTJDX0JPQVJEX0lORk8oKSwgdG8gZ3VhcmFu
dGVlIGluaXRpYWxpemF0aW9uIGlzIGFsaWduZWQgd2l0aA0KPiB3aGF0ZXZlciBmdXR1cmUgY2hh
bmdlcyBtYWRlIHRvIGkyY19ib2FyZF9pbmZvPyBCdXQgdGhhdCByZWxpZXMgb24NCj4gcHJvdmlk
aW5nIHRoZSBuYW1lIGF0IGRlY2xhcmF0aW9uIHRpbWUsIHdoaWNoIHdlIGFscmVhZHkgaGF2ZSBp
bg0KPiBpMmNfbmV3X2R1bW15X2RldmljZSgpLg0KPiANCj4gU28gSSBzdWdnZXN0IHRvIGFkZCBh
IG5hbWUgcGFyYW1ldGVyIHRvIGkyY19uZXdfZHVtbXlfZGV2aWNlKCksIHJlbmFtZQ0KPiBpdCB0
byBfX2kyY19uZXdfZHVtbXlfZGV2aWNlKCksIGFuZCBjcmVhdGUgYSB3cmFwcGVyIGZvciBjb21w
YXRpYmlsaXR5DQo+IHdpdGggZXhpc3RpbmcgdXNlcnM6DQo+IA0KPiAgICAgc3RydWN0IGkyY19j
bGllbnQgKl9faTJjX25ld19kdW1teV9kZXZpY2Uoc3RydWN0IGkyY19hZGFwdGVyDQo+ICphZGFw
dGVyLCB1MTYgYWRkcmVzcywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqbmFtZSkNCj4gICAgIHsNCj4gICAgICAgICAgICAgc3RydWN0
IGkyY19ib2FyZF9pbmZvIGluZm8gPSB7DQo+ICAgICAgICAgICAgICAgICAgICAgSTJDX0JPQVJE
X0lORk8oImR1bW15IiwgYWRkcmVzcyksDQo+ICAgICAgICAgICAgIH07DQo+IA0KPiAgICAgICAg
ICAgICBpZiAobmFtZSkgew0KPiAgICAgICAgICAgICAgICAgICAgIHNzaXplX3JldCA9IHN0cnNj
cHkoaW5mby50eXBlLCBuYW1lLA0KPiBzaXplb2YoaW5mby50eXBlKSk7DQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIEVSUl9QVFIoZGV2X2Vycl9wcm9iZSgmY2xpZW50LQ0KPiA+YWRhcHRlci0+ZGV2LA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0LCAiSW52YWxp
ZCBkZXZpY2UNCj4gbmFtZVxuIik7DQo+ICAgICAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgICAg
IHJldHVybiBpMmNfbmV3X2NsaWVudF9kZXZpY2UoYWRhcHRlciwgJmluZm8pOw0KPiAgICAgfQ0K
DQpPSyB3aWxsIGludHJvZHVjZSwgc3RhdGljIGZ1bmN0aW9uDQoNCnN0YXRpYyBzdHJ1Y3QgaTJj
X2NsaWVudCAqX19pMmNfbmV3X2R1bW15X2RldmljZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0
ZXIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MTYg
YWRkcmVzcywgY29uc3QgY2hhciAqbmFtZSkNCg0KYW5kIGlzIGNhbGxlZCBieSBib3RoICJpMmNf
bmV3X2R1bW15X2RldmljZSIgYW5kICJpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UiDQoNCkNoZWVy
cywNCkJpanUNCg0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgbWVtY3B5KGluZm8u
dHlwZSwgYXV4X2RldmljZV9uYW1lLA0KPiBhdXhfZGV2aWNlX25hbWVfbGVuKTsNCj4gPiArICAg
ICAgICAgICAgICAgaW5mby5hZGRyID0gYWRkcjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAg
IGkyY19hdXhfY2xpZW50ID0gaTJjX25ld19jbGllbnRfZGV2aWNlKGNsaWVudC0NCj4gPmFkYXB0
ZXIsICZpbmZvKTsNCj4gPiArICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgIGky
Y19hdXhfY2xpZW50ID0gaTJjX25ld19kdW1teV9kZXZpY2UoY2xpZW50LT5hZGFwdGVyLA0KPiBh
ZGRyKTsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gaTJjX2F1eF9j
bGllbnQ7DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoaTJjX25ld19hbmNpbGxhcnlf
ZGV2aWNlKTsNCg==
