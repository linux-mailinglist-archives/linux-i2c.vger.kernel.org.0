Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C1072F743
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbjFNID2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243472AbjFNIC7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:02:59 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3624A1FDE;
        Wed, 14 Jun 2023 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7QqhtkSzf5s0VP7XXhCnOXL5zY5VXP+4M2MiMG9V5EMdO6hlH4H2PKlEzUUp1cJr1fyP5/MLULIs7eWAfAEcoBdPnp+W8H7lYRBzlpesYL+2fmm61byvqo8daZz/CQaTl3vBJeAyo8Mf5MaI8N8XIcaztPr1tFdqIvzT8IQ28b8zOUatqmxXZEc+vL2MUWlOXpyOeTvVaWarZTPhsskmpHsDAkdmUvNcP9H8mpljVc+jaINSUor71lKAG65XX0rf1Vyxe5Q6Q70A5rXixphQDQ7OnKNqfF+gUSlzjPdYg2DxvmY0kKqdJkJk8NKGMKdMHviBO9HgLVamE2jigawSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4vzAw0prVFfj5WZazPe+JRYyhR/GFK1/p2rE8KYnVY=;
 b=Mp1JpPTOOSJpImu43ITrKK6rbpz4iUegSFw0OFOHbE5mHcO68NQdLBRH5TcnjqmhcTgVvvP9Q7sHF1bhp0/jIjY0d8eX6IP7et7uPIFGt2CR0PLXh7lBXqAfA6YF8NT+I9ez7AohR0dNEqrqXV7swOivzMP3pGAEfQXqwH85Zxj2XzAhWdBqM0RwZ8d9oYEwFCsY99u22edsf4ssIdyeYXdf4XXl2IVu2RQEFsCISl1kt9m7HbkFAGpLYBEG1JPtxGDBFRLMtI50HC0JlZLcr7IlA4dvR1EAYGHrBsFR5meo9wKnGXQ6T3CQ+q/ueysJgkVHTBMiAyb/RzgkUsTIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4vzAw0prVFfj5WZazPe+JRYyhR/GFK1/p2rE8KYnVY=;
 b=E15ST/KAkDpa7txGDcKxTMmKPO5BP7CfH2rXNbkMOcasWBy8zzK47Xguoz5uKPc6tKVJi9hpmXrV7rWCNb33iqVeI4vcStOO4FKHEQjlYIcyRA+BArFVUFD0sdb/VrCvfRyTMPlTz2VCEVFHYgJrksmH5F3lNuzhpOFMa2LjOYo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10172.jpnprd01.prod.outlook.com (2603:1096:400:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 08:02:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Wed, 14 Jun 2023
 08:02:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACzT4CAABEtEIAAa5IAgAARedCAAQvgAIAAAV8Q
Date:   Wed, 14 Jun 2023 08:02:20 +0000
Message-ID: <OS0PR01MB59228A8E2675DC5A341564F2865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
 <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
In-Reply-To: <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10172:EE_
x-ms-office365-filtering-correlation-id: 10867497-8359-4b79-af36-08db6cadadd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3tBRm9dUbbgOSpiXbhhp9nV+P+GMIjMvYSZ0tZmZ669Z85ICxLojFdnOObuCp2n7Axse0eKRpUxYgDRN6oHyFxEYoA49bgqXQzcV5Qpkp3aq53ZIZCZ44TQMysmsFsyMj6NAgvY1xNNbSqfDd62ZsVUtU4I3AJcv9ai05Z9iUjvjKl4s0cOy8xZUsNj7ouzUHFfUTkjIpSAr5RXxY7OLJ52VV81mT83UVPnl9v5tdzVYDGokGzerLpYCZkEUXcQ9KTjx+McSCKStj7quVwpb2QlxNhqKP4X7bQrHKO/oHMjakRejNHILNrH4L+XTdMjM7nAeVjnb+VEzZluHa5NV3id8YD2zQDMKFs2SV//2EXFkWWNorPmZWm+Qr1TnVWhMR+5V7ci/oSaAvqydKC8cV8qMaiNruDOx+QAJEriX9GdDvGnIWWp4rQP1f/YqraozriiPUZPJz+HPyfXKh6SGVzhc1RpRiYZPhlgH82YOjC0KFekXRnROlKLiA9TmVWoLGX5XyXke/dZ3kU3cMYJmEmKm09yJ+vwcZpoOGFvbJcqnxNUTruY7tqtK1l/23Oex5fzsrYp3dyKBXxSIQ2WfcJtAVzNS1Q0Udhcp2nvDwSTKk7020bBMNpf5QQKXWmuu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(7696005)(316002)(41300700001)(83380400001)(26005)(53546011)(86362001)(6506007)(186003)(7406005)(38070700005)(9686003)(33656002)(2906002)(122000001)(7416002)(38100700002)(55016003)(52536014)(5660300002)(8676002)(8936002)(76116006)(66946007)(54906003)(64756008)(66446008)(6916009)(66556008)(66476007)(478600001)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2FmYVhPdHh2WUNHeHFHempERUt6UEVLTUZ3NE1PdDV4Y1NKK1VUNFFWUzdi?=
 =?utf-8?B?Nk14cVo0blRQWmtwQTFKV0lKa1FlNTFVbnhheEsvcUlxaFRjK01VdzYyYjhE?=
 =?utf-8?B?WXVXRk9xOU1BSy96Q3F2dGpqSjJuSk9ET3hESVhiOWF5S1FjQ3ZHS2ljZEc5?=
 =?utf-8?B?bmdNS2pPVnZkZFY3V3VnTUlNUUczQXpmVFpFL2FsN0IzQTkrNzBJVGNZOVV0?=
 =?utf-8?B?dUxnM0EyTVhoRW51eTZObU1YcG83YXpIYndzZE1ZS1F1ODUwam83MjhTclJI?=
 =?utf-8?B?Y0U2UWVUYzJndnlVdngyUVdoK1hMU3VqbStXSHdqNXBFbVo2djRSOXd3VjJ1?=
 =?utf-8?B?NUVCbTRyUC9UYkZmWTVFbTk4QnlXR0VmLy9Fb0tFZzFwdVI5ZGg2Qm9yOHR2?=
 =?utf-8?B?RkcxN2J6aTFNZjh2NmtOcnQ3bFowNGdhSWZISjBWZjNCTWpxREdxSmxtdzB5?=
 =?utf-8?B?Vkh6R0tvbmVHS1lSa3QvL2lFNzVPbzJ2QkhnT3ZMTHBmSE55TXNjQkpmUkdY?=
 =?utf-8?B?LzkxcXRNeTdEN2oxMkNvSmhTWjVPZjlYd2JqS1h4NFlWbzIva1BFVmpVRGNp?=
 =?utf-8?B?d0NZM0lmc2dubVNueWJSaEFpcXV2c3dPYVdlVmRUUEZIYkg4OVMvMkhWakZV?=
 =?utf-8?B?clpKWm9HNWdWRW1pUVFqSlBuRlRJMjRKamxuUnhaNUFnN3F1R2F0ci9XWWpa?=
 =?utf-8?B?a0VCOHM0VW12VitqdG41cFJ1WkhOVytSZVFnSTRINlo2UFpaSkN0V3NCV29h?=
 =?utf-8?B?cTJyNW1KekNIamo1NTRnMVlGUXBDTDRrTEtiUlZTU1Zvb1c5RmdHWHpCZ3dl?=
 =?utf-8?B?VW9yQ1huRkFvaE00QVExQ1Z4M3hndmFXZFRXTHloSmpDMktGcFZ1a1RCSW1L?=
 =?utf-8?B?SCtWL0dpdTk4ZDAxc2F1MjBqQkVRankzQTBpUDBUdzh6ZXQ2OGJUOHhMTmhG?=
 =?utf-8?B?M3REVFVQQlVLaUNlMlZ0TDBqTXZUV0t4NW5tbHFLdzlBaEwxK1BKc3ZYaksv?=
 =?utf-8?B?K2VPMXZsS0lORzZuMVUzSDJkcUZKSWZONXdKWUpvZUszUWo4SGJrV3hUbkVV?=
 =?utf-8?B?djhudVIzcFByVGJqdGgyV0V5ckc4QkpxRG80amRldGpJM1NabEZQSTdqTUVW?=
 =?utf-8?B?NytvbFhzS3g3T0hxNGN3ZjJjWFRUMmU1T0lvWkFxVWMxV09NeHNnT3pDQUFP?=
 =?utf-8?B?UCs2QnZwbHNCOGxVdyt3eDNvZjFNVjB6Rm9TZzlUVEh2a3JlamtCbXpKRm40?=
 =?utf-8?B?RUdJTnRWNVJFNlh4c0pnTHEyZXQxaUQvdXRZTEMxMFZlL1FYVStQbmFWQUtq?=
 =?utf-8?B?aFl6dWw0Z2xuNkZLYlhnRUF1ZUtNRjZUVG1Eb2ljQnRWZHI3Wnhvc2pSSXVo?=
 =?utf-8?B?S1I4SkwvUFp3aDhtT3hpNjIyOUVrdG9LRm13bjJPMkx0bDRvM29Wbi84UnpP?=
 =?utf-8?B?ak5YdW9WYlNjTURGc09GU3l3b2NpSUUvaVQ0bzJBVmJnMkVJbVZOdG42RjE5?=
 =?utf-8?B?WklvVVJnV2JrVE5WL0tpQW5OQ2RNOXI4cmp4MnQ5WFc2VkM3Q0JoMGN3Y0Ns?=
 =?utf-8?B?bHc5Z0pLelJrMVk2NmIxVW5aMG5xYTI3RlczTXBNUDkxSFQzdVFmZEVLMXB2?=
 =?utf-8?B?QnNFQlZiYklMK2NGZ2RjT3FzdSt1SGNsdUVrZE9ONHJyWW5pR0RRWWs1YlIz?=
 =?utf-8?B?RHBBL1B0VnErWUhrRmZOeXRVOTBNajJKaTErNzlkdXR1ekF3b012cjdGRnZI?=
 =?utf-8?B?d1FhSHVYREd2ejlHalNGYzc5Vy9XY0wzbnZMaDlNREk2dG5HaER5MWRtR25v?=
 =?utf-8?B?ZlNVVG1xQS95dkR5VmhWckJPYURxZXM3NzZTWktmUUtCQm9uVjJBeHV0RTl6?=
 =?utf-8?B?UmJ4aUwvTWxjZnkvREJNVUFKRFNRcG5LUUc1RHFIb3NIZDNTYVVBdkh6L2Zm?=
 =?utf-8?B?dDQrZ0QvQVRjcFlNQmJodUdtWGNzT1NjOHpNckc3SFplMDQzcGJrVnpuTXNi?=
 =?utf-8?B?dHNLcnIwVFlzbXY4N2VGTnJRUjJBOGlhcUUyN3ppNVBBenJTTzNHL0cvNHph?=
 =?utf-8?B?TVFtWWVWaWFBWnJGNStKWVFWd3g3bmZpb0c5a2hrcyt1VXZ2cmtVbHN3NlA5?=
 =?utf-8?Q?xO1wl4GxOgnd286gUEC954TkF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10867497-8359-4b79-af36-08db6cadadd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 08:02:20.4898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xx7wUDu9buCdvadT9htX0JkpqXHNoN8FpO112Brq4fMCo08Y7n7sdJwllfF+ElOdljUT1fWyKqB/D3PScg8wxrRQWarZBVmyS0U/hSHQWEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10172
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
UEFUQ0ggdjUgMDEvMTFdIGkyYzogRW5oYW5jZSBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJ
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgNjoxMeKAr1BN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UgaTJjX25ld19hbmNpbGxh
cnlfZGV2aWNlDQo+ID4gPiBBUEkgT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgMTI6NDXigK9QTSBC
aWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6
DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlDQo+
ID4gPiA+ID4gaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSSBPbiBNb24sIEp1biAxMiwgMjAy
MyBhdCAxMDo0M+KAr1BNDQo+ID4gPiA+ID4gV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4N
Cj4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBQZXJoYXBzIHdlIHNob3VsZCBmaXJzdCB0aGlu
ayB0aHJvdWdoIHdoYXQgYW4gYW5jaWxsYXJ5DQo+ID4gPiA+ID4gPiA+IGRldmljZSByZWFsbHkg
aXMuICBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQgaXMgdXNlZCB0bw0KPiA+ID4gPiA+ID4g
PiB0YWxrIHRvIHNlY29uZGFyeSBhZGRyZXNzZXMgb2YgYSBtdWx0aS1hZGRyZXNzIEkyQyBzbGF2
ZQ0KPiBkZXZpY2UuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQXMgSSBtZW50aW9uZWQgc29t
ZXdoZXJlIGJlZm9yZSwgdGhpcyBpcyBub3QgdGhlIGNhc2UuDQo+ID4gPiA+ID4gPiBBbmNpbGxh
cnkgZGV2aWNlcyBhcmUgd2hlbiBvbmUgKmRyaXZlciogaGFuZGxlcyBtb3JlIHRoYW4gb25lDQo+
IGFkZHJlc3MuDQo+ID4gPiA+ID4gPiBFdmVyeXRoaW5nIGVsc2UgaGFzIGJlZW4gaGFuZGxlZCBk
aWZmZXJlbnRseSBpbiB0aGUgcGFzdCAoZm9yDQo+ID4gPiA+ID4gPiBhbGwgdGhlDQo+ID4gPiA+
ID4gdXNlcyBJIGFtIGF3YXJlIG9mKS4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBZZXQsIEkg
aGF2ZSBhbm90aGVyIGlkZWEgd2hpY2ggaXMgc28gc2ltcGxlIHRoYXQgSSB3b25kZXIgaWYNCj4g
PiA+ID4gPiA+IGl0IG1heWJlIGhhcyBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkIHNvIGZhcj8NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAqIGhhdmUgdHdvIHJlZ3MgaW4gdGhlIGJpbmRpbmdzDQo+
ID4gPiA+ID4gPiAqIHVzZSB0aGUgc2Vjb25kIHJlZyB3aXRoIGkyY19uZXdfY2xpZW50X2Rldmlj
ZSB0byBpbnN0YW50aWF0ZQ0KPiB0aGUNCj4gPiA+ID4gPiA+ICAgUlRDIHNpYmxpbmcuICdzdHJ1
Y3QgaTJjX2JvYXJkX2luZm8nLCB3aGljaCBpcyBvbmUNCj4gPiA+ID4gPiA+IHBhcmFtZXRlciwN
Cj4gPiA+IHNob3VsZA0KPiA+ID4gPiA+ID4gICBoYXZlIGVub3VnaCBvcHRpb25zIHRvIHBhc3Mg
ZGF0YSwgZS5nIGl0IGhhcyBhIHNvZnR3YXJlX25vZGUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gU2hvdWxkIHdvcmsgb3IgZGlkIEkgbWlzcyBzb21ldGhpbmcgaGVyZT8NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFRoYXQgc2hvdWxkIHdvcmssIG1vc3RseSAoaTJjX25ld19kdW1teV9kZXZpY2Uo
KSBhbHNvIGNhbGxzDQo+ID4gPiA+ID4gaTJjX25ld19jbGllbnRfZGV2aWNlKCkpLiAgQW5kIGFz
IGkyY19ib2FyZF9pbmZvIGhhcyBhbiBvZl9ub2RlDQo+ID4gPiA+ID4gbWVtYmVyIChzb21ldGhp
bmcgSSBoYWQgbWlzc2VkIGJlZm9yZSEpLCB0aGUgbmV3IEkyQyBkZXZpY2UgY2FuDQo+ID4gPiA+
ID4gYWNjZXNzIHRoZSBjbG9ja3MgaW4gdGhlIERUIG5vZGUgdXNpbmcgdGhlIHN0YW5kYXJkIHdh
eS4NCj4gPiA+ID4NCj4gPiA+ID4gTG9va3MgbGlrZSwgSSBjYW5ub3QgYXNzaWduIG9mX25vZGUg
bWVtYmVyIGxpa2UgYmVsb3cgYXMgaXQNCj4gPiA+ID4gcmVzdWx0cyBpbiBwaW5jdHJsIGZhaWx1
cmVbMV0gZHVyaW5nIGRldmljZSBiaW5kLg0KPiA+ID4gPg0KPiA+ID4gPiBpbmZvLm9mX25vZGUg
PSBjbGllbnQtPmRldi5vZl9ub2RlOw0KPiA+ID4gPg0KPiA+ID4gPiBbMV0NCj4gPiA+ID4gcGlu
Y3RybC1yemcybCAxMTAzMDAwMC5waW5jdHJsOiBwaW4gUDQzXzAgYWxyZWFkeSByZXF1ZXN0ZWQg
YnkNCj4gPiA+ID4gMy0wMDEyOyBjYW5ub3QgY2xhaW0gZm9yIDMtMDA2ZiBwaW5jdHJsLXJ6ZzJs
IDExMDMwMDAwLnBpbmN0cmw6DQo+ID4gPiA+IHBpbi0zNDQNCj4gPiA+ID4gKDMtMDA2Zikgc3Rh
dHVzIC0yMiBwaW5jdHJsLXJ6ZzJsIDExMDMwMDAwLnBpbmN0cmw6IGNvdWxkIG5vdA0KPiA+ID4g
PiByZXF1ZXN0IHBpbiAzNDQgKFA0M18wKSBmcm9tIGdyb3VwIHBtaWMgIG9uIGRldmljZSBwaW5j
dHJsLXJ6ZzJsDQo+ID4gPiA+IHJhYTIxNTMwMCAzLTAwNmY6IEVycm9yIGFwcGx5aW5nIHNldHRp
bmcsIHJldmVyc2UgdGhpbmdzIGJhY2sNCj4gPiA+DQo+ID4gPiBXaGVyZSBkbyB5b3UgaGF2ZSBh
IHJlZmVyZW5jZSB0byBwaW4gUDQzXzAgaW4geW91ciBEVD8NCj4gPg0KPiA+IFRoZSByZWZlcmVu
Y2UgdG8gcGluIFA0M18wIGlzIGFkZGVkIGluIHRoZSBQTUlDIG5vZGUuDQo+ID4NCj4gPiBJIGhh
dmUgZG9uZSBtb2RpZmljYXRpb24gb24gbXkgYm9hcmQgdG8gdGVzdCBQTUlDIElOVCMgb24gUlov
RzJMIFNNQVJDDQo+ID4gRVZLIGJ5IHdpcmluZyBSODMgb24gU29NIG1vZHVsZSBhbmQgUE1PRDAg
UElONy4NCj4gPg0KPiA+ID4gVGhlIGxhc3QgdmVyc2lvbnMgeW91IHBvc3RlZCBkaWQgbm90IGhh
dmUgYW55IHBpbmN0cmwgcHJvcGVydGllcz8NCj4gPg0KPiA+IEJ5IGRlZmF1bHQsIFBNSUNfSU5U
IyBpcyBub3QgcG9wdWxhdGVkIFJaL0cyTCBTTUFSQyBFVkssIHNvIEkgaGF2ZW4ndA0KPiA+IGFk
ZGVkIFN1cHBvcnQgZm9yIFBNSUNfSU5UIyBmb3IgdGhlIHBhdGNoZXMgcG9zdGVkIHRpbGwgZGF0
ZS4NCj4gPg0KPiA+IFllc3RlcmRheSBJIGNoZWNrZWQgd2l0aCBIVyBwZW9wbGUsIGlzIHRoZXJl
IGEgd2F5IHRvIGVuYWJsZSBQTUlDX0lOVCMNCj4gPiBhbmQgdGhleSB0b2xkIG1lIHRvIGRvIHRo
ZSBhYm92ZSBIVyBtb2RpZmljYXRpb24uDQo+ID4NCj4gPiBUb2RheSBJIGZvdW5kIHRoaXMgaXNz
dWUsIHdpdGggdGhpcyBtb2RpZmllZCBIVyBhbmQgUE1JQyBJTlQjIGVuYWJsZWQNCj4gPiBvbiB0
aGUgRFQsIHdoaWxlIGFzc2lnbmluZyBvZl9ub2RlIG9mIFBNSUMgd2l0aCBpbmZvLm9mX25vZGUu
IEl0IGlzIGp1c3QNCj4gYSBjb2luY2lkZW5jZS4NCj4gDQo+IElDLg0KPiANCj4gU28geW91IG5v
dyBoYXZlIHR3byBMaW51eCBkZXZpY2VzIHBvaW50aW5nIHRvIHRoZSBzYW1lIERUIG5vZGUsIGNh
dXNpbmcNCj4gcGluY3RybCBpc3N1ZXMuLi4NCj4gDQo+IEkga25vdyB0aGlzIHdvbid0IHNvbHZl
IHRoZSBjb3JlIGlzc3VlLCBidXQgd2hhdCBpcyB0aGUgZXhhY3QgcGludHJsDQo+IGNvbmZpZ3Vy
YXRpb24geW91IGFyZSB1c2luZz8gSXMgdGhpcyB1c2luZyBhIEdQSU8gd2l0aCBpbnRlcnJ1cHQN
Cj4gY2FwYWJpbGl0aWVzLCBvciBhIGRlZGljYXRlZCBpbnRlcnJ1cHQgcGluPyBJbiBjYXNlIG9m
IHRoZSBmb3JtZXIsIHlvdQ0KPiBkb24ndCBuZWVkIGEgcGluY3RybCBwcm9wZXJ0eSBpbiBEVCwg
YXMgdGhlIEdQSU8gY29udHJvbGxlciBpdHNlbGYgc2hvdWxkDQo+IHRha2UgY2FyZSBvZiB0aGF0
IGJ5IGFza2luZyB0aGUgcGluIGNvbnRyb2xsZXIgdG8gY29uZmlndXJlIHRoZSBwaW4NCj4gcHJv
cGVybHkgdGhyb3VnaCBwaW5jdHJsX2dwaW9fcmVxdWVzdCgpLg0KDQpJIHdhcyB0ZXN0aW5nIHdp
dGggYm90aC4gVGhpcyBpc3N1ZSBpcyB0cmlnZ2VyZWQgd2hpbGUgY29uZmlndXJpbmcgSVJRNCBh
cyBQTUlDX0lOVCMuDQoNCglwbWljX3BpbnM6IHBtaWMgew0KCQlwaW5tdXggPSA8UlpHMkxfUE9S
VF9QSU5NVVgoNDMsIDAsIDQpPjsgIC8qIElSUTQgKi8NCgl9Ow0KDQomaTJjMyB7DQoJcmFhMjE1
MzAwOiBwbWljQDEyIHsNCgkJcGluY3RybC0wID0gPCZwbWljX3BpbnM+Ow0KCQlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOw0KDQoJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyYWEyMTUzMDAiOw0K
CQlyZWcgPSA8MHgxMj4sIDwweDZmPjsNCgkJcmVnLW5hbWVzID0gIm1haW4iLCAicnRjIjsNCg0K
CQljbG9ja3MgPSA8JngyPjsNCgkJY2xvY2stbmFtZXMgPSAieGluIjsNCg0KCQkvL2ludGVycnVw
dC1wYXJlbnQgPSA8JnBpbmN0cmw+Ow0KCQkvL2ludGVycnVwdHMgPSA8UlpHMkxfR1BJTyg0Mywg
MCkgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCgkJaW50ZXJydXB0LXBhcmVudCA9IDwmaXJxYz47
DQoJCWludGVycnVwdHMgPSA8UlpHMkxfSVJRNCBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KCX07
DQp9Ow0KDQpDaGVlcnMsDQpCaWp1DQo=
