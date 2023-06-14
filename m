Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE0B72FBE7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 13:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjFNLEb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 07:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjFNLEa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 07:04:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7B5109;
        Wed, 14 Jun 2023 04:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFOtfdRqSssBENo0bc1eCr0vNspUWQfUvnFZoDZ+p2zn+7r5LbeCo9HnNUOMCbEMBnnbniecV9pqNRIovXzd6E+dTgQJ+BFgRWX2VjFTXbsQ7DZJOxJRs9LR5vcSo0ry4SWsB9u9ST7N1ZyH+T1Z5fmI25ND04KevLmkvy2oy2VpzP5KWQQy9/k1yH3tcWwys2AqqNQsTtAhj2KV00/xDjJPkf8zuf1LscWrJhfovtb94DRMSaWnBU4vUb1MpH6hIKYoSLmccPv5lRalVZHIsjFdCuTXjS1kkNJ/gCv0lEUh9ZYCUxgxGBi+qhmmcm+AJQBFvgeDDUuc0/qyZiQM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klWjXuiHLt9ujxJFrHujq/TgcATZnioQfCLeqYOJeRA=;
 b=litlXRrQz6ckl2G4QJiBBv6jZOgj1iKyG7q/ZS1mrQzUwtxPachy9JJ8DUwCM+QutPIku/jVOQHhZTrzK4UriEc+RPsJQNUKtY/NCzU9sHmadM+LNcw5tQVKKr6ZS0uFXjRSXk3YtIBtmM8FDskjfFbwAM1hfKzGJtQL5QZ1Iqt89YX05BxI4QHC3wfVye8/TypdN3ZUu4mkFxsUxbJpYEEgqt+PViEVM6FXRxLwZP2PnwcWf8WwhBwWG6vdIwacg02qylvx8gPeZTuWxmzBM/bCuhA758O1mhn/aPdJlwFqbB+av5zPauhINYwyB/nv2PxcSBaem7WS070vGeDmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klWjXuiHLt9ujxJFrHujq/TgcATZnioQfCLeqYOJeRA=;
 b=Wmi41FGEQvZk2W1dE+TOCa5uukBOB1WW2WMYanysjGYfVe8rD8Bo2pfVroNumryk2+hEh9DlxOWJPbtAMeZvb1rWABfgXlhoaME70zgLe0xuu1SIK7Y3UiN/7Ltb+F35gmygfuY+Ipb2BzRncSaDTAoJuSEteQe88rm+mlfy5KM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10840.jpnprd01.prod.outlook.com (2603:1096:400:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 11:04:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Wed, 14 Jun 2023
 11:04:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcCAAD30wIAAjmJQgADWpQCAAAETwIAAEREAgAAUKOA=
Date:   Wed, 14 Jun 2023 11:04:22 +0000
Message-ID: <OS0PR01MB5922763D0F2F124EDF67CCEB865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614081314.GD17519@pendragon.ideasonboard.com>
 <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10840:EE_
x-ms-office365-filtering-correlation-id: 7f7b15ad-f56f-4c11-afa2-08db6cc71bff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WkTeZmR6ZVBW5Q+0OyYUHyNypg8WpEK3JIkYQq75YK1bKU2P6VA2YEoqaON9JP6fB+MOBEZOPW/6n7ra6XiXKm1mhbUgpWwqKgAoYRgCOSZfdzyoDw5jjUwt6nkj99vNHFEPAg6H79M42Vo0IiU+jjkyzfH9hF9Ib7NS/yZHrNP8E/a5QwUJN7xPGvQffe921TXlibMP+uXPV0HAor/AoUDikgPeWRRkgB8q1cHbup1aarAkUmqbiKycnAT++xIjdrVvJut/vF2AFQyIf1j4uJ8n/iT2gH95U8XZR3Mzp814+i4uElyqoytJHyaDBq8bvRyp7T0AgpB1sDmD5DxnR8iIooAj4G+EYFYrksZ7ldsRwA2zIxjYvD8BUbmOtCB/XlepJNEBmx73Mz7RJGDQWDPFbgmo8zD3/cvLEC5HhVeonPpINRHKlvv/2gHMVqkNg767tXtwsKoxBi74ZhE4veifIbloCcP0WRgWHJ+xavcW8/WBvRG35Ylqz5tgwlBPaU6AfdREcksArVh99Pthy1zaVvgAewb9IQusRkF7+3v2EZ0dBJ1dhHm2JD/cACVWuCGVf6pGf0qLoUTJ/teYGsBJVWXZOe72/WAcqB8s7tCeC6uvbSJX5hSieQaXykXf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(66556008)(66476007)(55016003)(83380400001)(64756008)(76116006)(26005)(71200400001)(6506007)(6916009)(9686003)(53546011)(8676002)(54906003)(186003)(7406005)(8936002)(52536014)(86362001)(7696005)(478600001)(2906002)(7416002)(5660300002)(38100700002)(122000001)(38070700005)(41300700001)(4326008)(33656002)(316002)(66946007)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzFJZ2xJUmV0YnFjdFQ4L3RnQmVHTHpDRU5PaUNhRVREWUp4Mmt3bGMyV3p5?=
 =?utf-8?B?M0JpTjFsQzA2UUdlS09raUtRbFFtakhGTGtzZFNnUmxBUkJlU29heWwya2h2?=
 =?utf-8?B?WERENk1ndmVBMS9obG1FRTVwc25oS0hOM1lGWkJwY204ZUR3K3NYSzRhR0U5?=
 =?utf-8?B?bm41YVdOVHg4dyt5V1ZnMkhjK0t6UTRhRTc4cGVyK2RtKzM0R05yQldLb05B?=
 =?utf-8?B?TkdHb2xLWGJubHJ3YUR2aUhHaEZjdlNISFpaYXRHMkRRN0dNT0gwWDM2V0tZ?=
 =?utf-8?B?UWNpRy9tWlBFbHplbTBQMWY2dGE4OFROaDVXVFR5NW5ObXBzUytIcXhuWnI0?=
 =?utf-8?B?MlVpWC9tN093NzJIenRrOU52NGdEN1l1VXdYRTM3NHJBYnQyempieVBJOVUv?=
 =?utf-8?B?Rkx3Zlc5WGt6TVBjaWxiWDJvVGJUT0ltLy9sVkxuQWJRMlFkTVQxdXV0UkJT?=
 =?utf-8?B?akhId3h0RlBVVDkwSEQrTHlSWkFIRlMxREt5OWxxZmM5WGZXSlpQeXRqUzRW?=
 =?utf-8?B?S1ZsZzlDb2E1bWlSZGlKNEtKL1pEK2hyUDEvZUk2dFBMS25raUtkOFgwUkRL?=
 =?utf-8?B?RDR6QjdGYytsN0djYjdkdlJnaG9NZVE2bHh6ZUwvTzJxRE5xOWJrY2lBUzV3?=
 =?utf-8?B?Qk0xNTFyeTROOWkyZkQwM2tjc1d2N2dMSFdkTmR1VU5RaHlGckFtdEZ4MFJs?=
 =?utf-8?B?TCtuejRSdVoxZGhTTlR5Z2NqNHVBT2I0UjhHVFEvcXNXUzg5c3k5NWdYK0xo?=
 =?utf-8?B?bnhLTVhGZWt1cDRERmhqOW9ub1pWMWQrNVRDTGNzUElIa3VWOEk4M1NGcGNm?=
 =?utf-8?B?TlJzNWFCVzkvMWc4WnVoUnl6bVc4eTA4RVhSZlM5WlBaMEcyOTN2c3lVekM3?=
 =?utf-8?B?bU1wUHcvY3ZsR3BzU2toaHVVZkIwRDJXUmdoTXFhUE82OGtwNmNNMFFCK1Nm?=
 =?utf-8?B?NWZDcGg1V3g0Vm1XMlRDREJVL2Z1eG1ScE16U0NoMnU3ZGFhRWZNUmdCbzJl?=
 =?utf-8?B?dmdkYkhDYlp6MTNZWDNlYzdPcUpMaHYxemx1YXR1Y256N3R2d3l0Sy9RV0NT?=
 =?utf-8?B?VTJrUFB0cXBvYmZCb0gyTEVSUkVBU1JRRDRjK3hRSndwVW5BNjBaWVh5RHdM?=
 =?utf-8?B?YW9DL2R3cWpZNHdzWEF5MUxGc2RhRDRpeWRtYnUxWWpOS2V4bFdKa0ZlQmIv?=
 =?utf-8?B?NmxSK2NjbnhQK2ErWisxcWpvRFkzbjhTS0ZDMzdxaGFSaktMUmc4emd2dlJo?=
 =?utf-8?B?RElrZklpL3hNTDRWdVdZQ09ldVM5WmxRZ2JNNndHbk1jQ0FjSUJucStKd2Rn?=
 =?utf-8?B?YVBGa0FuU0hRaklHeTdhRHJjYk4xL1MvUGs2eitySDlVVXlHOUhCWEM0dlYw?=
 =?utf-8?B?SVl5KzhOYzIvcXgyckZQZDdEUUI0NDlGTGdTL1QyOC9venlWWWhhK3BMa04y?=
 =?utf-8?B?WlZhdjNTa2svS3ZPUU5yaFdEK2Nta0ljL1F6QnJET1cvOUg3djdYaFFTcUVq?=
 =?utf-8?B?NkdCTjF3RmFNSkxId3dqaXhTTVJ3RlNRZDhmTHNFUWhlYkFpRmY1WGI1dkJC?=
 =?utf-8?B?UzBBbm5jT00xR25SeGFFRmVmQzRTUnUxWkJtZ2svY0JiZ0ExaGRCSEQ5d1lH?=
 =?utf-8?B?UEFUTlJEQUtqaHBrWnQ4cG44WVM1SDE1ZlJKa0JPVmhmMGppQ1JYeEJjUWJB?=
 =?utf-8?B?VU1lMlVIY0YwTS9ZL0xHN3l3OHRqZjM0eFg2OGFoZDJZQXhqMU1nMTB0am1l?=
 =?utf-8?B?Y2k2RXJoMGlUUm1PYXRhcG1ZdHlkMGduODhZQjcxaTBrK203UTFiOURKMmJm?=
 =?utf-8?B?cUpVcjBYSkxiY09VclNHTnZ4bWk4bVZndFJDbkJBUy9zZmVWNmM2RUdWR0NN?=
 =?utf-8?B?QloxQmJrWmkvczlBYXdkQkk0ZU9OczVPN3JLdFhacExsYlFvUjBvYUhyS2ZD?=
 =?utf-8?B?ZmZEODFTN2VLc2VmWng4SjUxZURlaytNRisza2w0VTg3M3haby9rMUF0RXE3?=
 =?utf-8?B?M29sWFBxdVovYjJRUGNtbFlFYXI2WjA4SThCaW1vaWR6dGRoZE0rRVRpUmJs?=
 =?utf-8?B?bDgxVldWNTFrOElLb3dPY0ErY3RTVmY2ME5ZTDJYQW9sclpkR0tkdEQydVl6?=
 =?utf-8?Q?J/NsffN92QoLI09KVyknoTDkb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7b15ad-f56f-4c11-afa2-08db6cc71bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 11:04:22.6815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVCdpQmva1TKN/5Agkoha8rnX3eYVB6hOUKlNCbHSusQdkw2jJvr8qCSJdjPlxpKr+ewp/3jVs54y56xFJDp79kFjeUg5jHxsOwlLA/Fsgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10840
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
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTA6MjHigK9B
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlIGkyY19uZXdfYW5jaWxs
YXJ5X2RldmljZQ0KPiA+ID4gQVBJIE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDA3OjMxOjQ2UE0g
KzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUg
MDEvMTFdIGkyYzogRW5oYW5jZQ0KPiA+ID4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBB
UEkNCj4gPiA+ID4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMDEvMTFdIGkyYzogRW5oYW5j
ZQ0KPiA+ID4gPiA+ID4gaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiA+ID4gPiA+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UNCj4gPiA+ID4gPiA+
ID4gaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiBIaSBldmVyeW9uZSwNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBQZXJoYXBz
IHdlIHNob3VsZCBmaXJzdCB0aGluayB0aHJvdWdoIHdoYXQgYW4gYW5jaWxsYXJ5DQo+ID4gPiA+
ID4gPiA+ID4gZGV2aWNlIHJlYWxseSBpcy4gIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpdCBp
cyB1c2VkIHRvDQo+ID4gPiA+ID4gPiA+ID4gdGFsayB0byBzZWNvbmRhcnkgYWRkcmVzc2VzIG9m
IGEgbXVsdGktYWRkcmVzcyBJMkMgc2xhdmUNCj4gZGV2aWNlLg0KPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiBBcyBJIG1lbnRpb25lZCBzb21ld2hlcmUgYmVmb3JlLCB0aGlzIGlzIG5vdCB0
aGUgY2FzZS4NCj4gPiA+ID4gPiA+ID4gQW5jaWxsYXJ5IGRldmljZXMgYXJlIHdoZW4gb25lICpk
cml2ZXIqIGhhbmRsZXMgbW9yZSB0aGFuIG9uZQ0KPiBhZGRyZXNzLg0KPiA+ID4gPiA+ID4gPiBF
dmVyeXRoaW5nIGVsc2UgaGFzIGJlZW4gaGFuZGxlZCBkaWZmZXJlbnRseSBpbiB0aGUgcGFzdA0K
PiA+ID4gPiA+ID4gPiAoZm9yIGFsbCB0aGUgdXNlcyBJIGFtIGF3YXJlIG9mKS4NCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gWWV0LCBJIGhhdmUgYW5vdGhlciBpZGVhIHdoaWNoIGlzIHNv
IHNpbXBsZSB0aGF0IEkgd29uZGVyIGlmDQo+ID4gPiA+ID4gPiA+IGl0IG1heWJlIGhhcyBhbHJl
YWR5IGJlZW4gZGlzY3Vzc2VkIHNvIGZhcj8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
KiBoYXZlIHR3byByZWdzIGluIHRoZSBiaW5kaW5ncw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IE9LLCBpdCBpcyBpbmxpbmUgd2l0aCBEVCBtYWludGFpbmVycyBleHBlY3RhdGlvbiBhcyBpdCBp
cw0KPiA+ID4gPiA+ID4gbWF0Y2hpbmcgd2l0aCByZWFsIGh3IGFzIHNpbmdsZSBkZXZpY2Ugbm9k
ZSBoYXZpbmcgdHdvIHJlZ3MuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAqIHVzZSB0aGUg
c2Vjb25kIHJlZyB3aXRoIGkyY19uZXdfY2xpZW50X2RldmljZSB0byBpbnN0YW50aWF0ZQ0KPiB0
aGUNCj4gPiA+ID4gPiA+ID4gICBSVEMgc2libGluZy4gJ3N0cnVjdCBpMmNfYm9hcmRfaW5mbycs
IHdoaWNoIGlzIG9uZQ0KPiA+ID4gPiA+ID4gPiBwYXJhbWV0ZXIsDQo+ID4gPiBzaG91bGQNCj4g
PiA+ID4gPiA+ID4gICBoYXZlIGVub3VnaCBvcHRpb25zIHRvIHBhc3MgZGF0YSwgZS5nIGl0IGhh
cyBhDQo+IHNvZnR3YXJlX25vZGUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT0ssIEkgY2Fu
IHNlZSB0aGUgYmVsb3cgY2FuIGJlIHBhc3NlZCBmcm9tIFBNSUMgdG8gbmV3IGNsaWVudA0KPiA+
ID4gZGV2aWNlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICAgICAgICAgY2xpZW50LT5hZGRy
ID0gaW5mby0+YWRkcjsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgICAgICAgIGNsaWVudC0+
aW5pdF9pcnEgPSBpbmZvLT5pcnE7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiBTaG91bGQgd29yayBvciBkaWQgSSBtaXNzIHNvbWV0aGluZyBoZXJlPw0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+IEkgZ3Vlc3MgaXQgd2lsbCB3b3JrLiBXZSBpbnN0YW50aWF0ZSBh
cHByb3ByaWF0ZSBkZXZpY2UgYmFzZWQNCj4gPiA+ID4gPiA+IE9uIFBNSUMgcmV2aXNpb24gYW5k
IHNsYXZlIGFkZHJlc3MgYW5kIElSUSByZXNvdXJjZSBwYXNzZWQNCj4gPiA+ID4gPiA+IHRocm91
Z2ggJ3N0cnVjdCBpMmNfYm9hcmRfaW5mbycNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBXaWxs
IGNoZWNrIHRoaXMgYW5kIHVwZGF0ZSB5b3UuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBpbmZvLmly
cSA9IGlycTsgLS0+SXJxIGZpbmUNCj4gPiA+ID4gPiBpbmZvLmFkZHIgPSBhZGRyOyAtLT5zbGF2
ZSBhZGRyZXNzIGZpbmUgc2l6ZSA9DQo+ID4gPiA+ID4gc3Ryc2NweShpbmZvLnR5cGUsIG5hbWUs
IHNpemVvZihpbmZvLnR5cGUpKTsgLS0+aW5zdGFudGlhdGlvbg0KPiA+ID4gPiA+IGJhc2VkIG9u
IFBNSUMgdmVyc2lvbiBmaW5lLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gMSkgSG93IGRvIHdlIHNo
YXJlIGNsayBkZXRhaWxzIG9uIGluc3RhbnRpYXRlZCBkZXZpY2UgdG8gZmluZCBpcw0KPiA+ID4g
PiA+IGl0IGNvbm5lY3RlZCB0byBleHRlcm5hbCBjcnlzdGFsIG9yIGV4dGVybmFsIGNsb2NrIHNv
dXJjZT8gYXMgd2UNCj4gPiA+ID4gPiBjYW5ub3QgcGFzcyBvZl9ub2RlIGJldHdlZW4gUE1JQyBh
bmQgImkyY19ib2FyZF9pbmZvIiBhcyBpdA0KPiA+ID4gPiA+IHJlc3VsdHMgaW4gcGluY3RybCBm
YWlsdXJlLiBpbmZvLT5wbGF0Zm9ybWRhdGEgYW5kDQo+ID4gPiA+ID4gQ2xpZW50LT5kZXYucGxh
dGZvcm1kYXRhIHRvIHJldHJpZXZlIHRoaXMgaW5mbz8/DQo+ID4gPiA+DQo+ID4gPiA+IE9yDQo+
ID4gPiA+DQo+ID4gPiA+IEkyQyBpbnN0YW50aWF0aW9uIGJhc2VkIG9uIGFjdHVhbCBvc2NpbGxh
dG9yIGJpdCB2YWx1ZSwgaWUsIHR3bw0KPiA+ID4gPiBpMmNfZGV2aWNlX2lkJ3Mgd2l0aCBvbmUg
Zm9yIHNldHRpbmcgb3NjaWxsYXRvciBiaXQgYW5kIGFub3RoZXINCj4gPiA+ID4gZm9yIGNsZWFy
aW5nIG9zY2lsbGF0b3IgYml0DQo+ID4gPiA+DQo+ID4gPiA+IFBNSUMgZHJpdmVyIHBhcnNlcyB0
aGUgY2xvY2sgZGV0YWlscy4gQmFzZWQgb24gZmlybXdhcmUgdmVyc2lvbg0KPiA+ID4gPiBhbmQg
Y2xvY2ssIEl0IGluc3RhbnRpYXRlcyBlaXRoZXIgaTJjX2RldmljZV9pZCB3aXRoIHNldHRpbmcN
Cj4gPiA+ID4gb3NjaWxsYXRvciBiaXQgb3IgY2xlYXJpbmcgb3NjaWxsYXRvciBiaXQuDQo+ID4g
Pg0KPiA+ID4gSSBkb24ndCBsaWtlIHRoYXQgaGFjay4gSSBzdGlsbCB0aGluayB0aGF0IHR3byBE
VCBub2RlcyBpcyB0aGUgYmVzdA0KPiA+ID4gb3B0aW9uLCBJIHRoaW5rIHlvdSdyZSB0cnlpbmcg
aGFyZCB0byBoYWNrIGFyb3VuZCBhIHByb2JsZW0gdGhhdCBpcw0KPiA+ID4gYWN0dWFsbHkgbm90
IGEgcHJvYmxlbS4NCj4gPg0KPiA+IFdoeSBkbyB5b3UgdGhpbmsgaXQgaXMgYSBoYWNrPyBJIGJl
bGlldmUgcmF0aGVyIGl0IGlzIGFjdHVhbCBzb2x1dGlvbg0KPiA+DQo+ID4gUE1JQyBpcyBhIHNp
bmdsZSBkZXZpY2UsIHdpdGggMiByZWdzLCBjbG9ja3MsIHBpbmN0cmwgYW5kIElSUQ0KPiBwcm9w
ZXJ0aWVzLg0KPiA+IFNvIGl0IHdpbGwgYmUgcmVwcmVzZW50ZWQgYXMgc2luZ2xlIG5vZGUgd2l0
aCBzaW5nbGUgY29tcGF0aWJsZS4NCj4gPg0KPiA+IEJ5IGluc3RhdGluZyBhIGNsaWVudCBkZXZp
Y2UsIHdlIGFyZSBzaGFyaW5nIHRoZSByZWxldmFudCByZXNvdXJjZXMgdG8NCj4gUlRDIGRldmlj
ZSBkcml2ZXIuDQo+IA0KPiBFeGFjdGx5LiAgUkFBMjE1MzAwIGlzIGEgUE1JQyB3aXRoIGFuIGlu
dGVncmF0ZWQgSVNMMTIwOC1kZXJpdmF0aXZlLg0KPiBNeSBiaWdnZXN0IGNvbmNlcm4gd2l0aCB1
c2luZyAyIHNlcGFyYXRlIG5vZGVzIGluIERUIGlzIHRoYXQgb25lIGRheSB3ZQ0KPiBtaWdodCBk
aXNjb3ZlciBhbm90aGVyIGludGVncmF0aW9uIGlzc3VlLCB3aGljaCBuZWVkcyBjb21tdW5pY2F0
aW9uDQo+IGJldHdlZW4gdGhlIHR3byBwYXJ0cy4NCj4gDQo+IFRoaW5ncyBmcm9tIHRoZSB0b3Ag
b2YgbXkgaGVhZDoNCj4gICAxLiBUaGUgZGV2aWNlIGhhcyBhIHNpbmdsZSBpbnRlcnJ1cHQgcGlu
LiAgSXMgdGhlcmUgYW55IGludGVyYWN0aW9uDQo+ICAgICAgb3IgY29vcmRpbmF0aW9uIGJldHdl
ZW4gUE1JQyBhbmQgUlRDIGludGVycnVwdHM/DQoNClBNSUMgaGFzIEZhdWx0IHN0YXR1cyByZWdp
c3RlcnMgZm9yIEJ1Y2tzL0xET3MsIHNvIHRoaXMgaGFzIHRvIGJlIGhhbmRsZWQgaW4gUE1JQyBk
cml2ZXINCm9uY2Ugd2UgYWRkIHJlZ3VsYXRvci9JTlQjIHN1cHBvcnQgYXMgY2xlYXJpbmcgb2Yg
bGF0Y2ggcmVnaXN0ZXJzIGFyZSBpbiBQTUlDIGJsb2NrLiBSVEMgaW50ZXJydXB0IHNob3VsZCBi
ZSBoYW5kbGVkIGJ5IFJUQyBhcyBjbGVhcmluZyBvZiBBTFJNIGJpdCBpcyBpbiBSVEMgYmxvY2su
DQoNCkN1cnJlbnRseSB3aGVuIEkgZW5hYmxlZCBQTUlDX0lOVCMgZm9yIFJUQywgSSBnb3QgSVJR
IHN0b3JtIGR1cmluZyBib290IGR1ZSB0byBsYXRjaGVkIHJlZ2lzdGVycy4gUlQNCg0KICAgIC8q
IENsZWFyIGFsbCBleGNlcHQgUlRDICovDQogICAgcmVnbWFwX3JlYWQocG1pYy0+cmVnbWFwLCAw
eDZjLCAmdmFsKTsNCiAgICB2YWwgJj0gQklUKDYpOw0KICAgIHJlZ21hcF93cml0ZShwbWljLT5y
ZWdtYXAsIDB4NmMsIHZhbCk7DQoNCiANCg0KICAgIC8qQ2xlYXIgbGF0Y2hlZCByZWdpc3RlcnMg
Ki8NCiAgICByZWdtYXBfcmVhZChwbWljLT5yZWdtYXAsIDB4NTksICZ2YWwpOw0KICAgIHJlZ21h
cF93cml0ZShwbWljLT5yZWdtYXAsIDB4NTksIHZhbCk7DQogICAgcmVnbWFwX3JlYWQocG1pYy0+
cmVnbWFwLCAweDVlLCAmdmFsKTsNCiAgICByZWdtYXBfd3JpdGUocG1pYy0+cmVnbWFwLCAweDVl
LCB2YWwpOw0KDQogDQoNCiAgICByZWdtYXBfd3JpdGUocG1pYy0+cmVnbWFwLCAweDY0LCAweDNm
KTsNCiAgICByZWdtYXBfd3JpdGUocG1pYy0+cmVnbWFwLCAweDY1LCAweDBmKTsNCiAgICByZWdt
YXBfd3JpdGUocG1pYy0+cmVnbWFwLCAweDY2LCAweDNmKTsNCiAgICByZWdtYXBfd3JpdGUocG1p
Yy0+cmVnbWFwLCAweDY3LCAweDAxKTsNCiAgICByZWdtYXBfd3JpdGUocG1pYy0+cmVnbWFwLCAw
eDY4LCAweGZmKTsNCiAgICByZWdtYXBfd3JpdGUocG1pYy0+cmVnbWFwLCAweDY5LCAweDFmKTsN
Cg0KDQpUaGUgUkFBMjE1MzAwIGhhcyB2YXJpb3VzIG1vbml0b3JzLCB3YXJuaW5ncywgYW5kIGZh
dWx0IHByb3RlY3Rpb24gZmVhdHVyZXMuDQpJZiBhIGZhdWx0IGlzIGRldGVjdGVkIGR1cmluZyBu
b3JtYWwgb3BlcmF0aW9uLCBib3RoIGEgbGF0Y2hlZCAoc3RpY2t5KSBhbmQgYSBsaXZlIGZhdWx0
IHN0YXR1cyBiaXQgYXJlIHNldC4gSU5UIyBpcw0KYXNzZXJ0ZWQgaWYgdGhlIGZhdWx0IGludGVy
cnVwdCBpcyBzdXBwb3J0ZWQgYW5kIG5vdCBtYXNrZWQgb3V0LiBDZXJ0YWluIGZhdWx0IGV2ZW50
cyBjYW4gYmUgY29uZmlndXJlZCB0byBzaHV0IGRvd24NCmFsbCByYWlscyAoZW50ZXIge0ZBVUxU
X09VVH0pLCBvciB0byBrZWVwIGFsbCByYWlscyBvcGVyYXRpbmcgKGRvIG5vdCBlbnRlciB7RkFV
TFRfT1VUfSkuIEEgbGF0Y2hlZCBmYXVsdCBiaXQNCnJlbWFpbnMgc2V0IHVudGlsIGNsZWFyZWQg
YnkgdGhlIGhvc3Qgd3JpdGluZyBhIDEgdG8gdGhlIGxhdGNoZWQgcmVnaXN0ZXIgYml0IGFmdGVy
IHRoZSBldmVudCBoYXMgc3Vic2lkZWQuIFRoZSBsaXZlDQpzdGF0dXMgYml0cyBzaG93IHRoZSBy
ZWFsLXRpbWUgY29uZGl0aW9uIGFuZCBhcmUgdXNlZCB0byBpbmRpY2F0ZSBpZiB0aGUgZmF1bHQg
aGFzIHN1YnNpZGVkIG9yIHBlcnNpc3RzLiBGb3IgbW9yZQ0KaW5mb3JtYXRpb24gc2VlIEludGVy
cnVwdCBhbmQgRmF1bHQgYW5kIFN0YXR1cyBNb25pdG9yaW5nLg0KSWYgYSBmYXVsdCBldmVudCBz
aHV0cyBkb3duIHRoZSBSQUEyMTUzMDAgcG93ZXIgcmFpbHMsIGFsbCB0aGUgcmVzZXQgb3V0cHV0
cyBhcmUgYXNzZXJ0ZWQgYW5kIHRoZSBvdXRwdXQgcmFpbHMgYXJlIHBvd2VyZWQgZG93biBmb2xs
b3dpbmcgdGhlIHBvd2VyLW9mZiBzZXF1ZW5jZS4NCg0KPiAgIDIuIE9uIHRoZSByZWFsIElTTDEy
MDgsIHRoZSBpbnRlcnJ1cHQgcGluIGNhbiBhbHNvIGJlIHVzZWQgYXMgYSBjbG9jaw0KPiAgICAg
IG91dHB1dC4gIFBlcmhhcHMgdGhpcyBpcyBmZWQgdG8gc29tZSBQTUlDIHBhcnQgaW4gdGhlDQo+
ICAgICAgUkFBMjE1MzAwLCB0b28/DQoNClRoZSBJU0wxMjA4IGRyaXZlciBkb2Vzbid0IHN1cHBv
cnQgY2xvY2sgb3V0cHV0LiBJdCBpcyBzYW1lIGFzIElTTDEyMDgsIGJ1dCBkaWZmZXJlbmNlIGlz
DQpzaW5jZSBzYW1lIElOVCMgcGluIHVzZWQgZm9yIFBNSUMsIEkgZ3Vlc3Mgd2Ugd29uJ3QgYmUg
YWJsZSB0byB1c2UgUE1JQyBpbnRlcnJ1cHQsIGlmIFJUQyBjb25maWd1cmVkIGZvciBjbG9jayBv
dXRwdXQuDQoNCj4gICAyLiBEb2VzIHRoZSBiYXR0ZXJ5IGNoYXJnZXIgY2lyY3VpdCBpbiB0aGUg
UE1JQyBpbXBhY3QgdGhlIFZCQVQNCj4gICAgICBpbnB1dCBvZiB0aGUgUlRDPw0KDQpUaGVyZSBh
cmUgdHdvIHBvd2VyIHN1cHBseSBpbnB1dHMgZm9yIHRoZSBSVEMgY2lyY3VpdCAoVkNIRyBhbmQg
VkJBVCkuIFRoZSBSQUEyMTUzMDAgY29udGFpbnMgaW50ZXJuYWwgY2lyY3VpdHJ5IHRvIGF1dG9t
YXRpY2FsbHkgc3dpdGNoIG92ZXIgdG8gdGhlIGJhY2t1cCBiYXR0ZXJ5IHdoZW4gdGhlIG1haW4g
VkNIRyBzdXBwbHkgZmFpbHMgYW5kIHN3aXRjaGVzIGJhY2sgZnJvbSB0aGUgYmF0dGVyeSB0byBW
Q0hHIHdoZW4gdGhlIG1haW4gc3VwcGx5IHJlY292ZXJzLg0KDQo+ICAgMy4gQXJlIHRoZXJlIG90
aGVyIEkyQyBhZGRyZXNzZXMgdGhlIGNoaXAgbGlzdGVucyB0bz8NCg0KTm8sIG9ubHkgMiBhZGRy
ZXNzIDB4MTIgYW5kIDB4NmYuDQoNCj4gDQo+IEkgb25seSBoYXZlIGFjY2VzcyB0byB0aGUgU2hv
cnQtRm9ybSBEYXRhc2hlZXQgZm9yIHRoZSBSQUEyMTUzMDAsIHNvIEkNCj4gY2Fubm90IGNoZWNr
IG15c2VsZi4uLg0KDQpJIHdpbGwgYXNrIENocmlzIHRvIHNoYXJlIHRoZSBkZXRhaWxzLg0KDQpD
aGVlcnMsDQpCaWp1DQoNCg0K
