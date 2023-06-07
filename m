Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1688C725C9C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 13:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239981AbjFGLDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 07:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240116AbjFGLCw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 07:02:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8387E2137;
        Wed,  7 Jun 2023 04:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoUcw77zNnKvfee0CJyHzcpKKVDvBfTsE7MnZcxwZDvjnIIz+/VSLnieIVGFO3QQsIa7Az58QLLJ0FsElOV+Vwo+SB3BpMGuJj0YdkODpH+5FIJ/xxzMNW5+QODwTGa5p0M0QjaDG7oHjtFHVzW7t0mEho4h2YkAIfTleTREC4O3taW54oN4Rcpoqd5YxxjOBide3UEb7h+dJdS04+M02HUMQ5zUjVyW8IXQomobX5HhaEumPV+5YLEDF1ug8nw5qfGESyQuKT2G1zzxRdgKX3qp5AZyTUf5nws1FSfx0CK+LVufv2lVaG7RIcxnt2hpLDHyJdhhL+i6DiV9bMprGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59NBuX7U4or4wJhdtc/iqvL15ppNRQWKqctJz0PBihA=;
 b=ftQqToKRKwO+95lBm5TMEeKl94AyY3h9o9JtdnA8QEx3F3Ip/Iz/4P9VXa+o4XcmqgVDAlM2cmnn+iiha4oFqR3Ho3bwEAEZ5+NIK8khK3K+Mz4ALg5vHV9lodcIdodTlVXeD/BNOxfn24e4xbr2/1m8s9Ra3VSV/QAFp9CblVFEi9SAxGzmSJeIVsJaaBEeggUZsBz8RvZjUIHh7tPeK3ER80k15NJjgIExlsgCsUsXzqnZMqk0me9ya5M0X0PeIgFbzEEhG3Q4jtE/js3QhrWHuXTeWaUMBLq9ZSD49LVRsvomAfrrRDsQWN/Lfa2hGgW9rcVGMIqOxBjNMfroSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59NBuX7U4or4wJhdtc/iqvL15ppNRQWKqctJz0PBihA=;
 b=VKu5SOwKDWFUQZElDsDLyBYMD9rq7IcVWk0kRORz6ygTFsqi/axQZ5EeaL6MhpYIRXh+DGcSKKSTcp1uYlmtRX8I27oTTuG+o6/eWTUjnWYHrqo/DTaFcotRDxAfbBc3EhahYsaSrYgDUWxt/WdHMu/VuaaV7t8qpmRq3YJHibU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9610.jpnprd01.prod.outlook.com (2603:1096:400:1a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 10:58:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:58:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?iso-8859-1?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4A==
Date:   Wed, 7 Jun 2023 10:58:46 +0000
Message-ID: <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
In-Reply-To: <ZIBFc3y9jD59lZ3A@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9610:EE_
x-ms-office365-filtering-correlation-id: 436204e5-af62-419b-d7d5-08db67462ab2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TxigxkwWF63ifHqlUbeQdJf/EXwlI51wd7tIGZVOpZ6Sp4cs0E92G2XS6VCTgyVz2TlrZ43nqGKpHu2Iz8afXTSZI78mB+tEJ0vJdJRzX0pfwetcRI2dzByNzb2VZhwmGRP60ZF5hPkDq98vskIJ5S2uJToNEmOxu7MuLN/MlQCA/IJpPzfXJYaDM+QWd24dwEzu9LJbi8brj3CO9gn7BO+90f/W9Zt3vrrXW6KCNFoSLghckz4w+js9B2t7TyVuvv42bU43EqgDKpisCfqja7o8tfM5LGamXuvyDqoo0zNXcbC5Y7+YmHGKw1tywcQc4c34Ft6VZmxIG93CQjn45U2c0VDLR9wxnq4aTtgZ5q84JTfE2uoLTlHsQC8AynORXFdq5s0WxaBvVds5LmUkIrAjXXo0ZjSw0CjPygy7dDTa9e8lAeMQw0aEzShikskUDDvWR0QaJBUAthHEyiMQz7NE8Vo2g/Rw67BJSb8vqh6L+zqn7PDJcQ3bENR+jFVDa5mYc5Ah7Iu6yJk955sGeIw9JV+yj2qlN+CBGwUbdn6egPSfvKsfrLxaPb0pok0d8zM5t/ctBsXx2vXvFnBBfQT/zQq2bnww0cklPmX3MNB7i6LLWs8Efi0ggsw0adDXHIMq4pPeKwyLRZPC3zYn6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(186003)(6506007)(26005)(9686003)(966005)(7406005)(83380400001)(7416002)(7696005)(71200400001)(2906002)(8676002)(8936002)(110136005)(54906003)(478600001)(55016003)(33656002)(41300700001)(38100700002)(5660300002)(122000001)(64756008)(86362001)(4326008)(316002)(66476007)(38070700005)(66556008)(66446008)(52536014)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v8rVt55j5DtooV70OIn4yothEEE22gKDs+lWJ/1CRh/4wVub6FpMKftEwk?=
 =?iso-8859-1?Q?Fs2ukdldceK52cBiPExr97SNEawwmtUKxvdeFR6Zb4NJjv/IQ2icXupRWg?=
 =?iso-8859-1?Q?tINL32nhcgAwxX58Hv3goQiXBT4r5enRgwMoktOUJGT+tuPo6ZR9tqhKoT?=
 =?iso-8859-1?Q?63FSzVVomn1fo8fZJMqhoXWoqa0lIn7eHfFQGTV/ZHHWUXbKOFGHDNFCbr?=
 =?iso-8859-1?Q?OX619n2K0cozW6T+ZCCCZTWXj94mtYaxKyzr1nwTXzusYqnzRk3a3/9YUq?=
 =?iso-8859-1?Q?tJH02DodD3ebtm1Ql35mThzQuum2irsgMjTAj+VmRjNVc78EONYM2UM1tC?=
 =?iso-8859-1?Q?wk14+XJlGJ/R3Ar0fwTfkjaLSYIOu09cbRmDQG8J36HaGOpEpS3LJTjKSS?=
 =?iso-8859-1?Q?YZgve3DHOlPvO+MpPz3USHsV8SACCDyZIWIf7fxd2DQeVWPoICRX6GGjVc?=
 =?iso-8859-1?Q?Ws6u1ShazDpQ6TZ6wLwlF3rozAYje7cy1JvClxKK59i1OeZ7mBLd1289xH?=
 =?iso-8859-1?Q?XYEerWLWlSiqPtQLJwKfGK9u/7Qg7GLfGiafmXbT2EsZHX3i8NPV17BZl6?=
 =?iso-8859-1?Q?67poZ9MEpQ+JT92bpySfVXPCpBkEjTWuqXfDdpYsq0cwGbjeDAG2zfPX0J?=
 =?iso-8859-1?Q?iTzJtJziJPJw5AZzYjNz3Mbli0FBPInlQ1tR00jYVMdGsvYbtbJI3KZ3pM?=
 =?iso-8859-1?Q?ZeTe4cnIFZ300aiLoOY4dGX8c7wXWmqoiv7ftkLkEfkjDq3NMMQy5RIfnY?=
 =?iso-8859-1?Q?hSlrgE9aMTdFReYXWRy9GiPq2iKX9kYnvv3YcR8eHYegKKqGeOfbuN5cK6?=
 =?iso-8859-1?Q?V9BoQiyZ/lZ6tlnoUBJ7S7A8myCo5DLV6PF1tiT8ISj/oWNWuA8nF4qpKI?=
 =?iso-8859-1?Q?IWmI6IslBenc+oDZPIdu3dc+Dc7JzR7+OdYRc5muxYcadNeV+k+yIDp7Gl?=
 =?iso-8859-1?Q?SeDO3Sg7vf9GSRC+beDVQccS6NnfU59Gvz4Hpqddvr1Y8hZnHXYx5NgRF1?=
 =?iso-8859-1?Q?mxfEXMEAtIxbSWViYcpmdqrSGBucKSo+xgefY4KNYadknwYTyI1oyPblWG?=
 =?iso-8859-1?Q?6qcZNIFtTJ+leNTDYJ4dZN86AFycNKI1pWtM7SCOkGeaysb/RNrlRx3Ana?=
 =?iso-8859-1?Q?4Um2OKj3Nn32OuMOJY7h3YX/9mYw8CKwUslXza08PPM2hJHZQgPCZZDtlL?=
 =?iso-8859-1?Q?YbQAx2EYCi0AXlke/b0h331ftGFzb0MLcrb3akou6rBrm4l9+hiEWRe61e?=
 =?iso-8859-1?Q?CEfESfN2UkMn01KZWxSrjFeU0gd4yWbzgjc/rBCl48ZG4XXiScMjSabnUH?=
 =?iso-8859-1?Q?aMA8WoMs8cusIaE7Lya0CpfPxqHNjWAKB1XA6Dw8bwuhAwOMtmr6YpALwg?=
 =?iso-8859-1?Q?lpRjfGv3Oe18JrubZ/tfhQPDmSpmjwLGoI85iswtDcNkNZzILs8rNPMEk2?=
 =?iso-8859-1?Q?+YQqFNt/WK0NGY6nOfz2p4z9jZIoZIvG25BMvJWBn6AslliuCZHwaC29oJ?=
 =?iso-8859-1?Q?MPAc/aoSxrDpQjcLWGuOC7tugFCj9z/KMSd6Vx2ZSxLg2VXoLp+Oka4vDJ?=
 =?iso-8859-1?Q?w6zMpuMBv083VYH33PPt9HxGLznKmW+jJCNDmp76SX6WFqEbnSU0znuA4Z?=
 =?iso-8859-1?Q?8ES/Ni1Cxm2v96yLKKj7oIKTwDNTI3Q/2ZtU362blZgJcAQLl2/QpZmw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436204e5-af62-419b-d7d5-08db67462ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 10:58:46.4782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BN7yJ8/2LG2qaDP/zkVxLUWOIJNtvBmsDWP//hshITRcD7UhNOfXTgqBuCjLZbjYDbp4DaIqph0yqY9msNqPDhknwsZasATOWfrZGOF4teE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9610
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi Wolfram,

> Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
> Hi all,
>=20
> sorry for not being able to chime in earlier.
>=20
> > In Biju's particular use case, the i2c device responds to two
> > addresses, which is the standard i2c ancillary use case.  However,
> > what's special
>=20
> Not quite. ancillary is used when a *driver* needs to take care of two
> addresses. We already have devices bundling two features into the same
> chip. I recall at least RTC + EEPROM somewhere. And so far, we have been
> handling this by creating two nodes in DT and have proper binding docs.
> I think this is cleaner. First, you can see in DT already what the
> compound device really consists of. In this case, which RTC and RTC drive=
r
> is exactly needed. Second, the code added here adds complexity to the I2C
> core with another layer of inderection for dummy devices.

FYI, please see [1] and [2]=20

As per DT maintainers, most of PMICs are described with one node, even thou=
gh RTC is on separate
address. According to them the DT schema allows multiple addresses for chil=
dren.
But currently we lacks implementation for that. The enhancement to this API=
 allows that.

[1]
https://lore.kernel.org/linux-renesas-soc/bce6cbcd-b693-4027-7d17-8e582b8fa=
2f9@linaro.org/

and=20
[2]
https://lore.kernel.org/linux-renesas-soc/CAMuHMdVrH5R4mAjm1c9zRqiGhNsfT7Y1=
3xxaV-v05T-MCJ6=3DRQ@mail.gmail.com/

Cheers,
Biju


>=20
> > As some resources are shared (knowledge about the clocks), splitting
> > this in two distinct devices in DT (which is what Biju's initial patch
> > series did) would need phandles to link both nodes together.
> >
> > Do you have a better idea how to represent this?
>=20
> Not sure if I understood this chip correctly, but maybe: The PMIC driver
> exposes a clock gate which can be consumed by the RTC driver?
>=20
> Happy hacking,
>=20
>    Wolfram

