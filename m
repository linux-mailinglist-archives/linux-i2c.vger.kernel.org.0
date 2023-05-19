Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F090709B36
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 17:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbjESPWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 11:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjESPWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 11:22:13 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEE419F;
        Fri, 19 May 2023 08:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQCQuRHoI0BchSMy+p3wyctZZjuzWnM6cYSWEt0Q5RXVFgrfmRn3EesT97L9+zXtmz/rCVjaIeqErhSdc0emkgA7ooLxKgUYd6baACPNd9InFZpLdHiROBmNm/HIvOaOG1n4vTRUw7Hp22JDVH0tcT4uAn1ucxVm2X1RKADEZCA3/TlyhMd9TsBK7ZB2h3REgCx1bzIrEGl0M/g3kfTwywhlqB8NyRdEL7KEw7Glr1tU5A0FqMm603fvthdjzRPoSn7D9qA/7b3xz3W5x+ZRl7DNQ/SvaW6uAJvPabr9t8+UZdn+awOsUbzd7eIzzPdCR0DmY57O2/yoz2U+YEtw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVyUb3YGcK5u5cWowDFzoxSMFWSy20L32nLp7myQ3P0=;
 b=hfefXg431RCHSLTDAcmW00/CtscI4Ti7V5d6iu2Jpd6gmNpU33HCVLa1ujDJsjJWN/G6CVOCot8Hyx2Ujc9ok4xTzKei6foYTHnUuWLNoawa/tj0RKmITXPrMRmdnYzg59YM/TvbJim1JPz9MOqhW8aoqpbKnhaCppwn14HkWxRrxxsameC1DiPtdtmZ2SGCEinLqHdAnyMQYzHdKmdeyU36L6maIHq+Z3XtI7N6O7yvaWDPELhSr4p7LePiQxaNAxkmYkXZEkXTmYLQbCaClHUj8CTlpG6AliMMl7L7vsbPkOUGR0r3zsUAof13gTmHMJOh1Ej2yKnOql3AGbvcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVyUb3YGcK5u5cWowDFzoxSMFWSy20L32nLp7myQ3P0=;
 b=jK/YtS0ZEV67HnDB3oafpXOXrIbacwhzImNnEkoXI94MKAak5/Xa1XSR1O3phdqdkYgcxHtnaCLhwE2ecXdleRYOHclSx7sNXDjDeEi74EumQ9o5vAfemBrKDucRKxxQIkLwr4SjaygECs6DGh5+D+91R+Qh2iwauYTEhPz+Go0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9797.jpnprd01.prod.outlook.com (2603:1096:400:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.38; Fri, 19 May
 2023 15:22:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:22:06 +0000
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v4 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZiX0PREOdbV2Zp0SC+A3LuOb75a9hiCMAgAAphMA=
Date:   Fri, 19 May 2023 15:22:06 +0000
Message-ID: <OS0PR01MB5922CFC8A55898BDD9FCD911867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVHZqwW8e9zCZgx2mTBP_Tzcuswo04fxw-DCo__NDFS1w@mail.gmail.com>
In-Reply-To: <CAMuHMdVHZqwW8e9zCZgx2mTBP_Tzcuswo04fxw-DCo__NDFS1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9797:EE_
x-ms-office365-filtering-correlation-id: cbc23300-ff58-4a07-e596-08db587cce70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KYQIkBlLsz2xUlwjJXXGPNF0xxpm9fZxc2TZiyJqew5a4Z2uLw8a27KJrr5IK3415RrTgxru+3oFdA3RJ9nt7Im+CFVwgHLxYzIqG4efnoGEC60ugSi0oBbWQ1eKEnvS3kxMXUayOworwVTDwGfo5tthY8VP9C2G3CxnvM/vPtXIsiYjLk66+8pXY43NePf2+W4Fz5UTO54ufjzgWcRO+MGeVYS672jqvDVK+rH6gaH1GOjnlz6wquiZZphay1gVPxyWq5wmSaWVPyUpoG1e452+UN5ZUzqsVT7jNU+UwzCyPRGbIzdLqIw/ysIoDKYDXa2Gsu2mcfaSbhJJb9xveeGZ2ag3tJjPaaUNTw8hVbXm2ZbIRaYUixwrXSiQwADtGn38Zzj0Li2UQw038+QBeeXNkPMw+o4RqY3A/kzYttt4CZX82dwBXNzK3wGnWGU3lFLDAAV148lKNWzjS9aQR8FtVLPtGu+2VF+bW3QWeaE+QhlPIbtVDHKwVS4R2kJgSkr085XTjkGvdHyY3A1yx5QBoBCSAfWM755Kgkm7IAmQ+LvEmiqDzhll66KI/O0FXeylyMHFhNboQ+OiWwZVT4Rs9EsAGCz871TYkeiTzHucrLjCDKTbd5/OIv1HYL9F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(71200400001)(66556008)(66476007)(76116006)(66446008)(64756008)(7696005)(316002)(66946007)(41300700001)(55016003)(8936002)(8676002)(478600001)(7416002)(52536014)(5660300002)(4326008)(6916009)(54906003)(2906002)(186003)(26005)(53546011)(6506007)(9686003)(83380400001)(38100700002)(86362001)(38070700005)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUhqVWgycGNTMTFFSkZrZWhXU2xsekhqbkhTelBKMnBsZm5TSnRydGkxazVR?=
 =?utf-8?B?dWF3bllQMldFTWtnaHZRaThJQ2QzaXU3cm9TWDBkUmM4NVJwUGFiWEYrWU5N?=
 =?utf-8?B?bjlEYVFSOElIYVROamg3Qk1rYVpuSFRNdXBpVFkyU2hqZlZHMEZDZzBDSGxG?=
 =?utf-8?B?NTRVNlVzUVJRRlpKK0YvSHg4QUFrYngrV01pVlNHUEhEY1lSUkJ3NG1sVEpC?=
 =?utf-8?B?VlNjYitmTFVxeGVLeGk2M2ZiUVVKajdlT3RlbS9TMFc3OXZWUEdnK1NzZWpM?=
 =?utf-8?B?T0pyTk13Z2M3NFhSRDZXRUZOUkJlVVNwZFZ2SmtHU3F0WGVCZ29KOS8rcUcy?=
 =?utf-8?B?WDUwTFN6c0llV3J6dS9WNDVUZko2ZDlXVllUUlNDWG5tSW9MY1pJaXlIRjdP?=
 =?utf-8?B?b3YxNlJ0eVZaU1ZsNG9vcUFlejhIbXFnNVFKaExVdHpTSzVsanZ3bU15T0l3?=
 =?utf-8?B?MU0zcmNWOG85UlFmTkZnZ3hqK1E5ZlphSWtNQkViS0dsaldTNTVUNUdacjlI?=
 =?utf-8?B?MVJ3cWRNSTBmdVRWMU9MWVY1YXliYlRlT1UyOEVSd0FEbmxNSFhUR1NUK2Fv?=
 =?utf-8?B?b2dxOHVISTNjck9KWENQK2hpQ2Y2TlpnQ0lNVVE1bURoSkpxai9mSWZFdHFn?=
 =?utf-8?B?R25ERHBJTHRta0UxTFd4QzVUSmVaTjFUQnBYbGwvMkZTSXdKYkpZaHpkZDBX?=
 =?utf-8?B?c1g5bVhhdlZMck11cGZ0RGxkUkRVNDlLYUYzL1FYZ05iUzdCWHBGU3BoMThY?=
 =?utf-8?B?QkY2T1VMWEo5OGhDQ0xYLzgreEd0bnhxMUdydnpNTDRkbXdTdGdoZTZOV1Z5?=
 =?utf-8?B?ZjFRR1h6WnFCV0pYYTlzVDdieUhWaXJ6ZWh5SGlKRDdHRm9KMzhIY3FLV21P?=
 =?utf-8?B?dFhNR3BZbjltSGsxZ09QU0NJZWJNU2dYMWtid2RIdlk3ZWxGUDA4azhVcy9o?=
 =?utf-8?B?OHlmeTcrdUdEWmZmTThuckFwYWtqS0JESzJ2R0Z0anQ1cUUyMkFCTnpxcjVH?=
 =?utf-8?B?Mzc4aWNJS1Z2WEpUSkk3T3VUT2w2NnRPd3Y4dmJrcHhUMHpXOWdKcGQ0bkNi?=
 =?utf-8?B?TjZoQnptdG1GZnZTTm5QQWY3aTJlVFJGVGFzUXV4ejF3Z0ZRaGVYRXBpOTRr?=
 =?utf-8?B?SU9uRTVKZml4ZVhLclI3RjVhaHlQZGlrQ1JGSjFpdVdCVGR1QW01b0U0Ryty?=
 =?utf-8?B?c3JNOEhQVVJVY1RKUkR0MS9wSXVWVFBQaXVOYVh3VWFRWm9kVGlLMVZKMzFo?=
 =?utf-8?B?WXdMN3hoKzV5MW9vVlNWYU9pQVE1NmVtQW9jTm5tbWptMk5IUlREenU1T01L?=
 =?utf-8?B?UnlwdUFqY2dXOWhubm9lZXhxVzJNTmxhZ2d5N2RCZks4ZjVyNVViRlNHbHB4?=
 =?utf-8?B?QjNyVlVIQnMzczQ1a3lrWFhhUjMvNldDQ0dKdWxzam5ZZy9NK2U4cGk3U3Yw?=
 =?utf-8?B?S0EyS3p5dEFKS1gyT29oeUtKenF3RVJNSktoZkJ1c0ZtUEVwOWxCbFpkeW5s?=
 =?utf-8?B?OGdqZTJBZDROdEk2M3Nhd0NNR25SWjE0SjZpTkttTVJ0ZWRvd3ZLbEw0Ykha?=
 =?utf-8?B?NjR1SUZQMnNRM0Q4aTVyaXVPRVJnTm15SVRuOWVkNFVOQnlUQnJyN1VOcHJs?=
 =?utf-8?B?a2s1WnVMKzJaeGMvVWpyTjJoK0oxVC9hcVZraWd1N3E3YUo0c0s3VnRlMXcx?=
 =?utf-8?B?NURQY1BYSmVBRmUrUHBVaGNPcXg2bGR0bVJtMkRpT3Y2a0s2eWs5bXAzQ0tq?=
 =?utf-8?B?WFZSTk5VRjNHV1loUG4wcUEybk1LQ1VGcWlybExRKysrUEp1dXVnQkFBemJ0?=
 =?utf-8?B?TFRrTkx4dUlVQ2NyVVUreVhtUTlsOGoyYmZzUDAvU1UxTVM1L29ZdkxBSVAv?=
 =?utf-8?B?VEU2WC9nR1c3allIRU8vckVtWUp0OGQ4RnpGeGFQc3dSK001WjArczN3VmF0?=
 =?utf-8?B?UlQzWWF6TkQzUEdadnlVK1pkNWxNb3BQUVdZNVRwTlZ1SmNoaTFyMnN4YmR2?=
 =?utf-8?B?U3UxZzEzT2UvY0V3a1RZWWpBZEpwT3Q3Y29IVHdMaS8yRk4wNEloWWVHSFcv?=
 =?utf-8?B?Sm0yVHhNM2VQSFZ6OS90SldNenpXUlB3VWlCV1IxSlNhaGRyc1dmWHVHZjVC?=
 =?utf-8?Q?nUNq9tlNOc1KRiI1ww3N67d/x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc23300-ff58-4a07-e596-08db587cce70
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 15:22:06.5656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ma8zLAJj1EX99d2p6X0h61SXWkDHK1sq2E4Y9wZd6vxD9DPO0xhkEsQ7F6Np79e+F+rSaiMTFYbfMO/MleWxcC6OJBForKu0+jFFc4E4IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9797
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
UEFUQ0ggdjQgMDEvMTFdIGkyYzogRW5oYW5jZSBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJ
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMTozN+KAr1BN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gUmVu
ZXNhcyBQTUlDIFJBQTIxNTMwMCBleHBvc2VzIHR3byBzZXBhcmF0ZSBpMmMgZGV2aWNlcywgb25l
IGZvciB0aGUNCj4gPiBtYWluIGRldmljZSBhbmQgYW5vdGhlciBmb3IgcnRjIGRldmljZS4NCj4g
Pg0KPiA+IEVuaGFuY2UgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlKCkgdG8gaW5zdGFudGlhdGUg
YSByZWFsIGRldmljZS4NCj4gPiAoZWc6IEluc3RhbnRpYXRlIHJ0YyBkZXZpY2UgZnJvbSBQTUlD
IGRyaXZlcikNCj4gPg0KPiA+IEFkZGVkIGhlbHBlciBmdW5jdGlvbiBfX2kyY19uZXdfZHVtbXlf
ZGV2aWNlIHRvIHNoYXJlIHRoZSBjb2RlIGJldHdlZW4NCj4gPiBpMmNfbmV3X2R1bW15X2Rldmlj
ZSBhbmQgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlKCkuDQo+ID4NCj4gPiBBbHNvIGFkZGVkIGhl
bHBlciBmdW5jdGlvbiBfX2kyY19uZXdfY2xpZW50X2RldmljZSgpIHRvIHBhc3MgcGFyZW50DQo+
ID4gZGV2IHBhcmFtZXRlciwgc28gdGhhdCB0aGUgYW5jaWxsYXJ5IGRldmljZSBjYW4gYXNzaWdu
IGl0cyBwYXJlbnQNCj4gPiBkdXJpbmcgY3JlYXRpb24uDQo+ID4NCj4gPiBTdWdnZXN0ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0K
PiA+IHYzLT52NDoNCj4gPiAgKiBEcm9wcGVkIFJiIHRhZyBmcm9tIEdlZXJ0IGFzIHRoZXJlIGFy
ZSBuZXcgY2hhbmdlcy4NCj4gPiAgKiBJbnRyb2R1Y2VkIF9faTJjX25ld19kdW1teV9kZXZpY2Uo
KSB0byBzaGFyZSB0aGUgY29kZSBiZXR3ZWVuDQo+ID4gICAgaTJjX25ld19kdW1teV9kZXZpY2Ug
YW5kIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSgpLg0KPiA+ICAqIEludHJvZHVjZWQgX19pMmNf
bmV3X2NsaWVudF9kZXZpY2UoKSB0byBwYXNzIHBhcmVudCBkZXYNCj4gPiAgICBwYXJhbWV0ZXIs
IHNvIHRoYXQgdGhlIGFuY2lsbGFyeSBkZXZpY2UgY2FuIGFzc2lnbiBpdHMgcGFyZW50DQo+IGR1
cmluZw0KPiA+ICAgIGNyZWF0aW9uLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiAN
Cj4gTEdUTSwgYSBmZXcgbWlub3IgY29tbWVudHMgYmVsb3cuDQo+IA0KPiA+IC0tLSBhL2RyaXZl
cnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJh
c2UuYw0KPiA+IEBAIC04OTMsMjQgKzg5MywxMCBAQCBpbnQgaTJjX2Rldl9pcnFfZnJvbV9yZXNv
dXJjZXMoY29uc3Qgc3RydWN0DQo+IHJlc291cmNlICpyZXNvdXJjZXMsDQo+ID4gICAgICAgICBy
ZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gLS8qKg0KPiA+IC0gKiBpMmNfbmV3X2NsaWVudF9k
ZXZpY2UgLSBpbnN0YW50aWF0ZSBhbiBpMmMgZGV2aWNlDQo+ID4gLSAqIEBhZGFwOiB0aGUgYWRh
cHRlciBtYW5hZ2luZyB0aGUgZGV2aWNlDQo+ID4gLSAqIEBpbmZvOiBkZXNjcmliZXMgb25lIEky
QyBkZXZpY2U7IGJ1c19udW0gaXMgaWdub3JlZA0KPiA+IC0gKiBDb250ZXh0OiBjYW4gc2xlZXAN
Cj4gPiAtICoNCj4gPiAtICogQ3JlYXRlIGFuIGkyYyBkZXZpY2UuIEJpbmRpbmcgaXMgaGFuZGxl
ZCB0aHJvdWdoIGRyaXZlciBtb2RlbA0KPiA+IC0gKiBwcm9iZSgpL3JlbW92ZSgpIG1ldGhvZHMu
ICBBIGRyaXZlciBtYXkgYmUgYm91bmQgdG8gdGhpcyBkZXZpY2UNCj4gPiB3aGVuIHdlDQo+ID4g
LSAqIHJldHVybiBmcm9tIHRoaXMgZnVuY3Rpb24sIG9yIGFueSBsYXRlciBtb21lbnQgKGUuZy4g
bWF5YmUNCj4gPiBob3RwbHVnZ2luZyB3aWxsDQo+ID4gLSAqIGxvYWQgdGhlIGRyaXZlciBtb2R1
bGUpLiAgVGhpcyBjYWxsIGlzIG5vdCBhcHByb3ByaWF0ZSBmb3IgdXNlIGJ5DQo+ID4gbWFpbmJv
YXJkDQo+ID4gLSAqIGluaXRpYWxpemF0aW9uIGxvZ2ljLCB3aGljaCB1c3VhbGx5IHJ1bnMgZHVy
aW5nIGFuIGFyY2hfaW5pdGNhbGwoKQ0KPiA+IGxvbmcNCj4gPiAtICogYmVmb3JlIGFueSBpMmNf
YWRhcHRlciBjb3VsZCBleGlzdC4NCj4gPiAtICoNCj4gPiAtICogVGhpcyByZXR1cm5zIHRoZSBu
ZXcgaTJjIGNsaWVudCwgd2hpY2ggbWF5IGJlIHNhdmVkIGZvciBsYXRlciB1c2UNCj4gPiB3aXRo
DQo+ID4gLSAqIGkyY191bnJlZ2lzdGVyX2RldmljZSgpOyBvciBhbiBFUlJfUFRSIHRvIGRlc2Ny
aWJlIHRoZSBlcnJvci4NCj4gPiAtICovDQo+ID4gLXN0cnVjdCBpMmNfY2xpZW50ICoNCj4gPiAt
aTJjX25ld19jbGllbnRfZGV2aWNlKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgc3RydWN0IGky
Y19ib2FyZF9pbmZvDQo+ID4gY29uc3QgKmluZm8pDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgaTJjX2Ns
aWVudCAqDQo+ID4gK19faTJjX25ld19jbGllbnRfZGV2aWNlKHN0cnVjdCBpMmNfYWRhcHRlciAq
YWRhcCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8g
Y29uc3QgKmluZm8sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAq
ZGV2KQ0KPiANCj4gc3RydWN0IGRldmljZSAqcGFyZW50Pw0KDQpPSy4gV2lsbCB1c2UgcGFyZW50
IGJlbG93IGFzIHdlbGwoX19pMmNfbmV3X2R1bW15X2RldmljZSgpKQ0KDQo+IA0KPiA+ICB7DQo+
ID4gICAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAgICAgICAqY2xpZW50Ow0KPiA+ICAgICAgICAg
aW50ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzOw0KPiANCj4gPiBAQCAtMTA1NCw2ICsxMDYy
LDI1IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBkdW1teV9kcml2ZXIgPSB7DQo+ID4gICAg
ICAgICAuaWRfdGFibGUgICAgICAgPSBkdW1teV9pZCwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0
aWMgc3RydWN0IGkyY19jbGllbnQgKl9faTJjX25ld19kdW1teV9kZXZpY2Uoc3RydWN0IGkyY19h
ZGFwdGVyDQo+ICphZGFwdGVyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1MTYgYWRkcmVzcywgY29uc3QNCj4gY2hhciAqbmFtZSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRl
dmljZSAqZGV2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8gaW5mbyA9IHsN
Cj4gPiArICAgICAgICAgICAgICAgSTJDX0JPQVJEX0lORk8oImR1bW15IiwgYWRkcmVzcyksDQo+
ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIGlmIChuYW1lKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgIHNzaXplX3QgcmV0ID0gc3Ryc2NweShpbmZvLnR5cGUsIG5hbWUsDQo+ID4gKyBz
aXplb2YoaW5mby50eXBlKSk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0IDwg
MCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUihkZXZfZXJyX3By
b2JlKCZhZGFwdGVyLT5kZXYsDQo+IHJldCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJJbnZhbGlkIGRldmljZQ0KPiA+ICsgbmFtZVxu
IikpOw0KPiANCj4gJXMgdG9vIGxvbmc/DQoNCk9rLCB3aWxsIGFkZCAlcw0KCQkJcmV0dXJuIEVS
Ul9QVFIoZGV2X2Vycl9wcm9iZSgmYWRhcHRlci0+ZGV2LCByZXQsDQoJCQkJCQkgICAgICJJbnZh
bGlkIGRldmljZSBuYW1lOiAlc1xuIiwNCgkJCQkJCSAgICAgbmFtZSkpOw0KPiANCj4gPiArICAg
ICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gX19pMmNfbmV3X2NsaWVudF9kZXZpY2Uo
YWRhcHRlciwgJmluZm8sIGRldik7IH0NCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiBpMmNfbmV3
X2R1bW15X2RldmljZSAtIHJldHVybiBhIG5ldyBpMmMgZGV2aWNlIGJvdW5kIHRvIGEgZHVtbXkN
Cj4gZHJpdmVyDQo+ID4gICAqIEBhZGFwdGVyOiB0aGUgYWRhcHRlciBtYW5hZ2luZyB0aGUgZGV2
aWNlDQo+IA0KPiA+IEBAIC0xMTIyLDE1ICsxMTQ1LDE3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGRl
dm1faTJjX25ld19kdW1teV9kZXZpY2UpOw0KPiA+ICAgKiBAY2xpZW50OiBIYW5kbGUgdG8gdGhl
IHByaW1hcnkgY2xpZW50DQo+ID4gICAqIEBuYW1lOiBIYW5kbGUgdG8gc3BlY2lmeSB3aGljaCBz
ZWNvbmRhcnkgYWRkcmVzcyB0byBnZXQNCj4gPiAgICogQGRlZmF1bHRfYWRkcjogVXNlZCBhcyBh
IGZhbGxiYWNrIGlmIG5vIHNlY29uZGFyeSBhZGRyZXNzIHdhcw0KPiA+IHNwZWNpZmllZA0KPiA+
ICsgKiBAYXV4X2RldmljZV9uYW1lOiBBbmNpbGxhcnkgZGV2aWNlIG5hbWUNCj4gPiAgICogQ29u
dGV4dDogY2FuIHNsZWVwDQo+ID4gICAqDQo+ID4gICAqIEkyQyBjbGllbnRzIGNhbiBiZSBjb21w
b3NlZCBvZiBtdWx0aXBsZSBJMkMgc2xhdmVzIGJvdW5kIHRvZ2V0aGVyDQo+IGluIGEgc2luZ2xl
DQo+ID4gICAqIGNvbXBvbmVudC4gVGhlIEkyQyBjbGllbnQgZHJpdmVyIHRoZW4gYmluZHMgdG8g
dGhlIG1hc3RlciBJMkMNCj4gPiBzbGF2ZSBhbmQgbmVlZHMNCj4gPiAtICogdG8gY3JlYXRlIEky
QyBkdW1teSBjbGllbnRzIHRvIGNvbW11bmljYXRlIHdpdGggYWxsIHRoZSBvdGhlcg0KPiBzbGF2
ZXMuDQo+ID4gKyAqIHRvIGNyZWF0ZSBJMkMgYW5jaWxsYXJ5IGNsaWVudHMgdG8gY29tbXVuaWNh
dGUgd2l0aCBhbGwgdGhlIG90aGVyDQo+IHNsYXZlcy4NCj4gPiAgICoNCj4gPiAtICogVGhpcyBm
dW5jdGlvbiBjcmVhdGVzIGFuZCByZXR1cm5zIGFuIEkyQyBkdW1teSBjbGllbnQgd2hvc2UgSTJD
DQo+ID4gYWRkcmVzcyBpcw0KPiA+IC0gKiByZXRyaWV2ZWQgZnJvbSB0aGUgcGxhdGZvcm0gZmly
bXdhcmUgYmFzZWQgb24gdGhlIGdpdmVuIHNsYXZlDQo+ID4gbmFtZS4gSWYgbm8NCj4gPiAtICog
YWRkcmVzcyBpcyBzcGVjaWZpZWQgYnkgdGhlIGZpcm13YXJlIGRlZmF1bHRfYWRkciBpcyB1c2Vk
Lg0KPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIGNyZWF0ZXMgYW5kIHJldHVybnMgYW4gSTJDIGFuY2ls
bGFyeSBjbGllbnQgd2hvc2UNCj4gPiArIEkyQyBhZGRyZXNzDQo+ID4gKyAqIGlzIHJldHJpZXZl
ZCBmcm9tIHRoZSBwbGF0Zm9ybSBmaXJtd2FyZSBiYXNlZCBvbiB0aGUgZ2l2ZW4gc2xhdmUNCj4g
PiArIG5hbWUuIElmIG5vDQo+ID4gKyAqIGFkZHJlc3MgaXMgc3BlY2lmaWVkIGJ5IHRoZSBmaXJt
d2FyZSBkZWZhdWx0X2FkZHIgaXMgdXNlZC4gSWYgbm8NCj4gPiArIGF1eF9kZXZpY2VfDQo+ID4g
KyAqIG5hbWUgaXMgc3BlY2lmaWVkIGJ5IHRoZSBmaXJtd2FyZSwgaXQgd2lsbCBjcmVhdGUgYW4g
STJDIGR1bW15DQo+IGNsaWVudC4NCj4gDQo+IFBsZWFzZSBhZGQgc29tZXRoaW5nIGxpa2U6DQo+
IA0KPiAgICAgVGhlIGFuY2lsbGFyeSdzIGRldmljZSBwYXJlbnQgd2lsbCBiZSBzZXQgdG8gdGhl
IHByaW1hcnkgZGV2aWNlLg0KDQpPSywgd2lsbCBhZGQuDQoNCj4gDQo+ID4gICAqDQo+ID4gICAq
IE9uIERULWJhc2VkIHBsYXRmb3JtcyB0aGUgYWRkcmVzcyBpcyByZXRyaWV2ZWQgZnJvbSB0aGUg
InJlZyINCj4gcHJvcGVydHkgZW50cnkNCj4gPiAgICogY2VsbCB3aG9zZSAicmVnLW5hbWVzIiB2
YWx1ZSBtYXRjaGVzIHRoZSBzbGF2ZSBuYW1lLg0KPiANCj4gPiBAQCAtMTE1Myw3ICsxMTc5LDkg
QEAgc3RydWN0IGkyY19jbGllbnQNCj4gKmkyY19uZXdfYW5jaWxsYXJ5X2RldmljZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50LA0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBkZXZf
ZGJnKCZjbGllbnQtPmFkYXB0ZXItPmRldiwgIkFkZHJlc3MgZm9yICVzIDogMHgleFxuIiwNCj4g
bmFtZSwgYWRkcik7DQo+ID4gLSAgICAgICByZXR1cm4gaTJjX25ld19kdW1teV9kZXZpY2UoY2xp
ZW50LT5hZGFwdGVyLCBhZGRyKTsNCj4gPiArICAgICAgIHJldHVybiBfX2kyY19uZXdfZHVtbXlf
ZGV2aWNlKGNsaWVudC0+YWRhcHRlciwgYWRkciwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGF1eF9kZXZpY2VfbmFtZSA/DQo+ID4gKyBhdXhfZGV2aWNlX25hbWUg
OiBOVUxMLA0KPiANCj4gWW91IGNhbiBqdXN0IHBhc3MgYXV4X2RldmljZV9uYW1lLg0KDQpBZ3Jl
ZWQuDQoNCkNoZWVycywNCkJpanUNCg==
