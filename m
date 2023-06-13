Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D57C72DFFD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 12:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242006AbjFMKpp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 06:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242000AbjFMKpm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 06:45:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F9CB7;
        Tue, 13 Jun 2023 03:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBW3VfdjmXdoVp/uQ/YcjB6IZu6ZiGX2jQemgKQOQ8nphh5k92FnEM6r12cX6JYvjof6fVfCx1F9CuRSwHIkO50bJ7aIS81FMj4ahP+dySHvsTww22oykrC1sINw/GyiVGoxtzJdF8v/znb6NxBFDtytfp56ZRTAXnIdLP3cHwrxYmO6SQWikAQ2itia2vGV9SOc+JjcYLeS7j9l7+YyVw7bBsq6DY9uq/YdXynoyFwoHwLBf8shSsFGZuddx5HCqp3BrdKKsCafD3FKamw7FImJtCg1xYNMRdspRISgOSGUUrvwJUO/cpKk1+QszXif30ughiM8BX3XmLc9cQn6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njjvnBD4wWwqc2DfK4fcSlYKfTdf/R7NXD13f6aMhtI=;
 b=ccU/4TjzgI+pDtECYyxe9613fluxGTytR25olgkLJGaMC/9qZq2SoYi3/JzH18S9MyljiJpdIgHhrtnPWqwJN2J03NoCjakkmumoNlhepo3qIo4ZFzXu8u+UveJ5iii3PBEZ2ZKBNlssFrc4Dp3myFivBmADfkW2wV3u8VUoQPR0DXKAI5onyZv0NiIx8TMs2xZzrUew2kpDRIXP96xhLM6IwDf2upGmZA43ofpxikRLKerxdsS0LSL+sL9tMb704fvQteVDGqO5cu4LLtrxoCM0MqeLcU8w4/fv4fYQRiEwEK/3+sGPrHW1Svb/9Q9IIQv4Lpe0JQiReP3jtEMtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njjvnBD4wWwqc2DfK4fcSlYKfTdf/R7NXD13f6aMhtI=;
 b=A/BVuVFevtMo7dLbe2WQCIgDajlGw9hIXU9MRXzO9niHEAVLEn7RbdDFBZlkYMYZkKUtkN4KNzB9JG93QtlfKhTN0kxU1vkOuZPIFawVBu0LYcVV+B1MaRSH+NHpLzLyuAALJg2ncyDXqjnmxs/j2qn/j6xYYEfyU4AxbKsJ2mA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9529.jpnprd01.prod.outlook.com (2603:1096:604:1ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 10:45:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:45:37 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>,
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACzT4CAABEtEA==
Date:   Tue, 13 Jun 2023 10:45:36 +0000
Message-ID: <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
In-Reply-To: <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9529:EE_
x-ms-office365-filtering-correlation-id: 69a453a0-84d9-4956-bb0a-08db6bfb5294
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aXpMpFe0eyhrtMaDKdm0aXOKXI3Ob1yd+OSnLsa3cH7OifzQcUjraTGYF7oGts3h/GaBOziHUi5HMuNzGYNks7PkTcbTtT3clKXhMpVLInqk8t8rfqdgAkHiR/1g6TgMoxHu/ekpIkJV2GFCV/5H+OQpoq/AjQ4zE70OuZeyOz1bcHM295V58u2ImiX0xsWYH2jE0U91j1ShUY15P2WFrie16gNYDgKV5LTNt1S9hEWLCBodMw8AEaeiYU188m0hvKXzGscJ3M2ik2HCx6QPx2Ls6MdBG0he8N4srllVYYuClNtvMYUfbnxq8qj8EMgIhf/ueWMHffdlZFXs/qfk6DocvUwBrnJ7y460ePCRqQbyGc4feu47a3I7ARVZZVRsXdko/dPaQEoIOqGeAnvo2iFNtDDnKM/dLzbtUPKy4U2M4c4rA+HPvN5M0cjcRRrvx1kC4oEqh9wDZ8wlDEFD7PfBPv6to2mfv6CKVxkkeB9/Fh1LN9vRVaG1gwKm/rjUnPMMBqtSMG61bN0asM0pmbIVo9zw7Ow8O9A1P3DtWC/56XDfU7M2L/vpc8ZsBC5DUNCPMWQtevvq2w3TsEwTgHgMJoZCgvO0FLWCpy5VpcQRmz4f1r8pY5iEKrVNCZi1HM95+5K2oUHLw2dXdemCIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(7696005)(316002)(41300700001)(86362001)(83380400001)(38070700005)(9686003)(186003)(6506007)(7416002)(7406005)(2906002)(33656002)(53546011)(122000001)(921005)(55016003)(38100700002)(26005)(5660300002)(52536014)(8936002)(8676002)(110136005)(66946007)(66446008)(64756008)(66476007)(66556008)(478600001)(71200400001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnBIYzdlVkFvWExsdGVXQ3Jlc2dEYkZGQzlQbEYwcWRXUllQN3djb1QrWHVN?=
 =?utf-8?B?YzVyVjZCZ0RJd2N3c1RGNHk3RmhHWFBTRGhVZkttMzJEWHM2NHBVM3puaDBR?=
 =?utf-8?B?TnpKYnc2ZVMvbFFCOU03SElKamtYcWhrd0htVVFDZ1hTYzZMdTdiYWtnK2Fu?=
 =?utf-8?B?dE1sUDF2ZnRsaStBY01QKzBOdzV5ZzlKV1hkbms5SVRKc1RPMlIyZ1Y0dnU3?=
 =?utf-8?B?SmVIQ0JjUkJzbWJqcGVIWVlpS3VhTW95ejQ3VVh3andsYXZjbDhJV1d4L1k3?=
 =?utf-8?B?ZzR0MU1ud2VlMUJrWTJlOWpVU2M4emNURTV0aWVlZlY1WFBWVmxmMjdjNTl3?=
 =?utf-8?B?Z2ZxSkdPTWZDU0d6dlNDRlpEV204THcxdCtwOVI0Q1hhU0EvWWhmdmsvK0Vx?=
 =?utf-8?B?L0ZZWHI1a3crUHFGRnZaeGtUOUI5dnFocjhoeEVDWEpSNlBtU0hDbzBZbUhx?=
 =?utf-8?B?Rk1VRjVKN3JzRTNqUHQ2c1hPUlFxQXNQWVEyYkJLZGJYU2lSSDllOXZpNGdz?=
 =?utf-8?B?TEpUNWVYaDJHcUFCV2RmcjhvUU1sTzRkN3NTU2JCeFJBU25CdDVoUjNzYUdZ?=
 =?utf-8?B?aDBkL250Mzl1SnU3ZjRBUTNObnlZbjZTRDBvaHYvY3R1a1JnY0RZblUzM2lF?=
 =?utf-8?B?NGIvblY2TUZGbjhuN1VCcEsxUkJRUUU0S2RDVzNyR2JjQUhvU2NqbWtGZjVx?=
 =?utf-8?B?eHUrWm9zbGEwcU9qQ2tQWXl5bHN1Wm4zKzNBZTFLM2RHM3U1NlplQkZST3BK?=
 =?utf-8?B?aHJwd1BxeWNzR3Q3UDBQbkdNeSszWHA3VUJnbnV4QTk0S2F5RHB1dXNSNURr?=
 =?utf-8?B?RmxBd3FHc3NqVzd4T3RwTVV2ellPVXZHWXdmdjd1Z294dk11dXY4SmRhTXFZ?=
 =?utf-8?B?N0UwQ0lrRWNHRk1tblpiZXB3dHRXQXNIUG13cmpwUUV1WkJaTE9jNkRaL3FS?=
 =?utf-8?B?M3c5elcyOUlSOUhYQUROWHNZODl1d0NXTnBuWW8vbHBNVG9FMTU5RE8wMlZr?=
 =?utf-8?B?U0pLc3JkV1NIYnNEcmVLdVpBdWtNRk85YUswQ1lnWDU3RmJpWHhpZmJlM01h?=
 =?utf-8?B?QVVwUDVLL09LaSt3TlkvejM4ajZFSjFsZFFHcm54ZXVvaTFpM1l2bFRmQ0Vh?=
 =?utf-8?B?cUpPT0thV3BoWlN1YTl6ZzlnZ0JLeTBBQUtzbGc4Z3pTUnBqYk5mWUFIVFds?=
 =?utf-8?B?QTFWcFAzTE1FQWQzVTVJczlmTzhicGdYb0Mxd3BlUEtrb1JnVFZieTZhcG1z?=
 =?utf-8?B?QktMVzc1dEdhUTdXS0RjUHhWS1lMbGVjc0V4MzBXdXRLRTgxd1hKZjAvcGEy?=
 =?utf-8?B?L25zbVlEMHE3M3NOei9keDJJakh5WmpIL0syUE42N0MzeXc0OU04WncxYkVv?=
 =?utf-8?B?ZC9YK2pRQTV6dGVJVDJNTFZvZVNEQXRPSkEwZWVVT2FWd1JNbGpzeEVzcVZn?=
 =?utf-8?B?M3ZERTlna21RSjViU2VYcXVoUWZkSW1hYmhlMUxZWE4vUUErenhqUHR1Rnhh?=
 =?utf-8?B?THJlbEM0RWVPUnh3czNYVHNma2l3VElnQU4wRktWbVd1ZUt0dGFIb1lqckhO?=
 =?utf-8?B?MUVyam5jaDl1OExpallXTVlFdVF3WHFxUnhEMWVCZlZFS25hOTMzOVBNc2FG?=
 =?utf-8?B?cFUxUmhEc3hVTTlZWDV1L1NUSmx2YTd0eVJjaGlWTUd5WmU3Z05VaE5LSXcr?=
 =?utf-8?B?L3djd2VJaEJTSC9DSjBzdHhYc3c5SjJhZ09TY2xqTGZEVmlIcGxUM2dFWTRC?=
 =?utf-8?B?bkIxS01lUXdjWmVONnQzaGxBeW1OVCtHS3J1MmpKWDJqN0ZpTmZ5bDk5TnZq?=
 =?utf-8?B?bEdNUmliSXZNTGsrbVhjWjN4ZGwxVHM4czQvNFo3dWMyQmJBRjFpVlRRTXB1?=
 =?utf-8?B?UGEvdGxHaHdLODhhOXFRVXA3Vzl5MWI4S0dSV1ppa0tIbndPRkhiL3BLbC9i?=
 =?utf-8?B?UFViT3Z5R3dQS05HdkpGelF5c255M3A3QXR4ejUrK3U4MUJiSFVCbkFPQUUx?=
 =?utf-8?B?ZjRBS2QyQjV6R1lJWmdjdUNZR0FVU25jeXA1TEJDL0NwNzhwVy9Qd3ljQlpZ?=
 =?utf-8?B?MTYyN0xnUnRTUDVnRHNpVmxtSmpvT05iSzRtQ1lpNlZOYVI5UlhkamFwK3FL?=
 =?utf-8?B?aUIwTG9yMWR5RnFmaXlqcmFvSzBBZ2E0YS94YzExdGthalB3eW5QcmY0Vzho?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a453a0-84d9-4956-bb0a-08db6bfb5294
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:45:36.8984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrM2SwLHf/O8X9waBW1jS7MSjdsGB8oEx/okuiUyL+QAC9oG2Yc6Pimfj1qDiaRzqT3iPs2ZVUDbI2//3z/bXIW6ksD3ASNnKTOBxpYKaqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9529
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
DQo+IA0KPiBIaSBXb2xmcmFtLA0KPiANCj4gT24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTA6NDPi
gK9QTSBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPiB3cm90ZToNCj4gPiA+IFBlcmhhcHMg
d2Ugc2hvdWxkIGZpcnN0IHRoaW5rIHRocm91Z2ggd2hhdCBhbiBhbmNpbGxhcnkgZGV2aWNlDQo+
ID4gPiByZWFsbHkgaXMuICBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQgaXMgdXNlZCB0byB0
YWxrIHRvIHNlY29uZGFyeQ0KPiA+ID4gYWRkcmVzc2VzIG9mIGEgbXVsdGktYWRkcmVzcyBJMkMg
c2xhdmUgZGV2aWNlLg0KPiA+DQo+ID4gQXMgSSBtZW50aW9uZWQgc29tZXdoZXJlIGJlZm9yZSwg
dGhpcyBpcyBub3QgdGhlIGNhc2UuIEFuY2lsbGFyeQ0KPiA+IGRldmljZXMgYXJlIHdoZW4gb25l
ICpkcml2ZXIqIGhhbmRsZXMgbW9yZSB0aGFuIG9uZSBhZGRyZXNzLg0KPiA+IEV2ZXJ5dGhpbmcg
ZWxzZSBoYXMgYmVlbiBoYW5kbGVkIGRpZmZlcmVudGx5IGluIHRoZSBwYXN0IChmb3IgIGFsbCB0
aGUNCj4gdXNlcyBJIGFtIGF3YXJlIG9mKS4NCj4gPg0KPiA+IFlldCwgSSBoYXZlIGFub3RoZXIg
aWRlYSB3aGljaCBpcyBzbyBzaW1wbGUgdGhhdCBJIHdvbmRlciBpZiBpdCBtYXliZQ0KPiA+IGhh
cyBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkIHNvIGZhcj8NCj4gPg0KPiA+ICogaGF2ZSB0d28gcmVn
cyBpbiB0aGUgYmluZGluZ3MNCj4gPiAqIHVzZSB0aGUgc2Vjb25kIHJlZyB3aXRoIGkyY19uZXdf
Y2xpZW50X2RldmljZSB0byBpbnN0YW50aWF0ZSB0aGUNCj4gPiAgIFJUQyBzaWJsaW5nLiAnc3Ry
dWN0IGkyY19ib2FyZF9pbmZvJywgd2hpY2ggaXMgb25lIHBhcmFtZXRlciwgc2hvdWxkDQo+ID4g
ICBoYXZlIGVub3VnaCBvcHRpb25zIHRvIHBhc3MgZGF0YSwgZS5nIGl0IGhhcyBhIHNvZnR3YXJl
X25vZGUuDQo+ID4NCj4gPiBTaG91bGQgd29yayBvciBkaWQgSSBtaXNzIHNvbWV0aGluZyBoZXJl
Pw0KPiANCj4gVGhhdCBzaG91bGQgd29yaywgbW9zdGx5IChpMmNfbmV3X2R1bW15X2RldmljZSgp
IGFsc28gY2FsbHMNCj4gaTJjX25ld19jbGllbnRfZGV2aWNlKCkpLiAgQW5kIGFzIGkyY19ib2Fy
ZF9pbmZvIGhhcyBhbiBvZl9ub2RlIG1lbWJlcg0KPiAoc29tZXRoaW5nIEkgaGFkIG1pc3NlZCBi
ZWZvcmUhKSwgdGhlIG5ldyBJMkMgZGV2aWNlIGNhbiBhY2Nlc3MgdGhlIGNsb2Nrcw0KPiBpbiB0
aGUgRFQgbm9kZSB1c2luZyB0aGUgc3RhbmRhcmQgd2F5Lg0KDQpMb29rcyBsaWtlLCBJIGNhbm5v
dCBhc3NpZ24gb2Zfbm9kZSBtZW1iZXIgbGlrZSBiZWxvdyBhcyBpdCByZXN1bHRzIGluIHBpbmN0
cmwgZmFpbHVyZVsxXQ0KZHVyaW5nIGRldmljZSBiaW5kLg0KDQppbmZvLm9mX25vZGUgPSBjbGll
bnQtPmRldi5vZl9ub2RlOw0KDQpbMV0NCnBpbmN0cmwtcnpnMmwgMTEwMzAwMDAucGluY3RybDog
cGluIFA0M18wIGFscmVhZHkgcmVxdWVzdGVkIGJ5IDMtMDAxMjsgY2Fubm90IGNsYWltIGZvciAz
LTAwNmYNCnBpbmN0cmwtcnpnMmwgMTEwMzAwMDAucGluY3RybDogcGluLTM0NCAoMy0wMDZmKSBz
dGF0dXMgLTIyDQpwaW5jdHJsLXJ6ZzJsIDExMDMwMDAwLnBpbmN0cmw6IGNvdWxkIG5vdCByZXF1
ZXN0IHBpbiAzNDQgKFA0M18wKSBmcm9tIGdyb3VwIHBtaWMgIG9uIGRldmljZSBwaW5jdHJsLXJ6
ZzJsDQpyYWEyMTUzMDAgMy0wMDZmOiBFcnJvciBhcHBseWluZyBzZXR0aW5nLCByZXZlcnNlIHRo
aW5ncyBiYWNrDQoNCkNoZWVycywNCkJpanUNCg0K
