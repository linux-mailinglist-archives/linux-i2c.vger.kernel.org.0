Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969BA770442
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 17:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjHDPUv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 11:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbjHDPUu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 11:20:50 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9350B49C1;
        Fri,  4 Aug 2023 08:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlRqRM9PK0g/rmpwAJYNq5ThJaQjkiDKgKIOjO30cB4Fn+PDBXBNNXEpiYQzZaLFe8idrpwQDskYpWTnR373FxGA9W9rbY7fqjH72vGhdJQ7dhjGjtR85DeYy4MgO34ubbHWTROLLmdCdyvnoWX6tQzwUIZluahytnJcmy97MVr5dxtwVbBFMKmoC1oAFPApD237ozyVp9Kbfk2hfe2n+bXf8gxCJEgOyKVTLQ7SWxtW+y7DfvUJ5tVKQ6gxf1Exr8dirStRTwdstQeXoiKOQWtzPQWC4Bg3ZZReCin/feGWvgCZfevH1v9CS65T0FkS5BPOvg5SpgS64ilzoR9H+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j61N8tYjUUyx6WzPnge99fqxvjhrf/zorzgCwapioX0=;
 b=G3+UuQRaq2VM3EHy0PtuR/9CgBvMaM+yStu7R4a3rSPLwFmM1XcCNHUUzcZE5lq4RZAaE8l/sChOejZVaWSyM3hnMf9HI3DSxc/6acwYB6uw6+l0tzqcc0B4G3OSUIzfBFBqnvjVWgxqZscrlu/ja+ZbMztryIK4CTzfHgOmBww2ydHuO+zo1PhJAQSzbDvM378MOY/WeiWdUULlBgyS9+/Y4k9wdOZxUUlz24wxCui+kFvxVziIAYc4Cy7v6smvAj5xdfmqN3rxxR+Qbjq220HbHL8c9P2fuYPZsUlTh2llArHCBiTZTE+5hBMGrrOkJ6yAXUoxqMuRuorw9uVAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j61N8tYjUUyx6WzPnge99fqxvjhrf/zorzgCwapioX0=;
 b=rAom1PEFl0sREM8YrzpGy7T8s8pIQ4NIfECDQseEy4d1xaFJGvhvy60wX5K+oj2EYC8T+OkcOd8Y1Zow4I9QfR0qjRH6QXwpA4TOFTDPBAAjf6Kmti8dprbNzoibJvrnoe6J/Dwl1FZEJNXxJq9oXwW752a+/0O5vVYxXZ2tiN8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8048.jpnprd01.prod.outlook.com (2603:1096:400:fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 15:20:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184%6]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 15:20:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 3/4] i2c: Enhance i2c_get_match_data()
Thread-Topic: [PATCH v6 3/4] i2c: Enhance i2c_get_match_data()
Thread-Index: AQHZxqKiQ6rq0CTw60OAzQ2mpmXcL6/aONQAgAAGYwA=
Date:   Fri, 4 Aug 2023 15:20:42 +0000
Message-ID: <OS0PR01MB5922DE37B04156444E9B904E8609A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
 <20230804070915.117829-4-biju.das.jz@bp.renesas.com>
 <ZM0QRhrBkdNtZRz5@smile.fi.intel.com>
In-Reply-To: <ZM0QRhrBkdNtZRz5@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8048:EE_
x-ms-office365-filtering-correlation-id: dfea66bd-d8c5-4ce1-d51d-08db94fe5df8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j081XKlkI3xB/H+tX7+nyCAh7NjyBGz52LMC2WlzU3+VUUR64Y2B7MjDuHJXCtq58UDSik+32yNQWVjQMGR/z4++mBbtGvEt3H7mF7MsEmGdffDzSfX9fxWVR4xHXqmYCfmKjoWqEP+y2qSsOaAdYEsBdU+/NGg18myrkQqR2w7pCSzrLcab6zmhyo27sKTrnD5rmDYOYfwtFJojia1pMtfMB7VZ/MTtyJ4K+ejyHE4JhwHerJI5ESRxtx1+AU9ip923Fu3fdzx46PI/2m+wCTRyv4ANpjQw+YS1U7AwAvh9rEElNj6o96q9SV6Yy3UBSUfrWsr1fanmZuT2JbbHmAQph+03yLQWtNyS6pUCgF34ogm30zG/JwbNaXdFJOiaX1IeV5fgRaMUENNlhV5ammJcJaT9N+YghL+crCHk+nAHX7OIkVH5kiFM1k2gbER5E88NLXb7KhDypC55B5/uOGzCeUO/btoaHl2OQNmIbZPGqJXfo8MQQ1IzuK3Itj4mVxcM86ve05Ho9ZtCsFEfTudSirIjzfL+n7Jf2t2vjp51kjoB/jUFNwf+dbewmjNfu9qUUUoeS1HZ6VCDu/illOkOFQviBPRiX3svzLofoMUuSVwHjI+K9+ppYjwvCuUJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(186006)(1800799003)(451199021)(4326008)(66476007)(64756008)(66446008)(6916009)(52536014)(66556008)(66946007)(38100700002)(76116006)(122000001)(2906002)(26005)(6506007)(38070700005)(7416002)(83380400001)(55016003)(54906003)(33656002)(478600001)(7696005)(71200400001)(9686003)(41300700001)(8936002)(8676002)(5660300002)(86362001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pEWSdtIu7hbjT9qkhBWW0jiVHNOfJPcHnQsLrdEDkNpyrXe1nBjWtmoMMBpS?=
 =?us-ascii?Q?2MryX3UjWUaBpE3PyQMqJ4hI6b/6SUCvS+9+ghF2V0f29713V39esR6Nm2vD?=
 =?us-ascii?Q?cIuu0PZf3OJTw9tIMVdsaYvSUmCYeTAdmdbpJDRPqS54R6AcJvzAtHd0Wvc9?=
 =?us-ascii?Q?PlMBYJYrMLasd1273mx/85+wkv96F8VzwzR7uiULL2B7dHsu+hqYpRF8RIap?=
 =?us-ascii?Q?IGGVLlwFWMuifpLknqmsCta8sM3Nz2bNrHKrio+Ng2EhpVYWtbV8jYOxreOw?=
 =?us-ascii?Q?ez1r3Ft2IHxNnKj7AmT8gXR08nHEb6R6Cvf5OaqD3xZs6MaHzLpS/ABjAbvn?=
 =?us-ascii?Q?pOpqEOZ0EbtZ6U+ZGz/L66ONzlRyhVlkYRJHwqLC0o8y8AokTdh2TYn+De/9?=
 =?us-ascii?Q?9ZzFFzcu95x8nqipGkmqZYHOzO0P/DiYJ0Yc72bAF8qhZDowHST3CXEAbLgp?=
 =?us-ascii?Q?GtZhykBbAOzn59YYWWoW+u+uLlKC8LuRcyn9xg+s6pNQpgD0m0D31YDYsNm2?=
 =?us-ascii?Q?X7QMIWBTATqIZEM33S/g8hqhOklFFCyKrhmfqDng9F2dfjo168GHvD6xhuyJ?=
 =?us-ascii?Q?S5EpC0a+5AF93T4n1oHBcK5HV5dKP1/Bpzjl2D3UF46L/lV7IkdYgBpkQVoV?=
 =?us-ascii?Q?KeC2xBiH6ajRdCcTEceVD8ReCBBe6snqxldNJRtQBskAei6oi3be8aDWKVfm?=
 =?us-ascii?Q?vDQRggD2Uki5qOTKszwXwXUdpmNV3EO5/5ROHuJ2QPKhgPdcZsSV8s40NEFX?=
 =?us-ascii?Q?hZ5I6qBGvE02GfdTteUujSeHAfv/eATZ/zjln9N1JhjbIiwgj5EeGph2vDnP?=
 =?us-ascii?Q?nu/SialFDwZRpDtbf1UQyvoP0t7phRAMA0+rVCT7R4EgJbeDylnNqLk/8deI?=
 =?us-ascii?Q?pJNLJtLB9cMGbs6tZqZ85HJs91UIEaHdRuytgBy2lWmFygGquMyiK9uSRygX?=
 =?us-ascii?Q?uOoiwW5euya1yaIMqWZeVZPJZrShrhnQNJ/VavNHVbPEqpZiYbpsHPXJBl5N?=
 =?us-ascii?Q?NtP82egZgMfrGoeVedx2PbRFBWi5k7uKUmDsjoI3ESAYQsnqpBYgxNwIcLSi?=
 =?us-ascii?Q?JfsMulU5XWVpgYYopMYq1WXWVOdy3T+SNgKN35HaLSgCs2F3dFTmk3uxlCFP?=
 =?us-ascii?Q?9d1pinpwB8+ZvrhjUcUR4eexvPnE3shU71OanxrAl8ANT9uqDnkcPNN7jtm4?=
 =?us-ascii?Q?gmf99DvYqgYRoYeYcorf6zSt/b+gN2m/CQn3mjvm2MdXOr5UjpRjpDF5SmKN?=
 =?us-ascii?Q?05scHxpgfqMAZKaB9REub2pV6XDL/maoVP/dxUjP1bHOSzsMqeykq+dA5qwa?=
 =?us-ascii?Q?zAdmKLHg/P/+05TUYeK+KUMMYXh1H2Mh9448xwmSZsy21YC/CNBjcrzbTcC+?=
 =?us-ascii?Q?GxP+zjcn6noQXyHT5GCJganxmOh7cu3kUuylsZxPrAUxqreukAnXE3XFHTaf?=
 =?us-ascii?Q?v42R5i1vg8oXRpXB0B3ZDd8XejM9ovzLoo3CGQzhSBRzBXFrXvo8Yd/oD7se?=
 =?us-ascii?Q?pd89UI0DGeJZhjlaL5n2vy+GBBCi9DsvCMviVx2XmMNwpJ4AIOb91Btt8rh2?=
 =?us-ascii?Q?3o6Nt+6l/FeLvAIXJaFyG7SUcZi3hvle/LdwEh/d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfea66bd-d8c5-4ce1-d51d-08db94fe5df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 15:20:42.2052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMy/j30WqWx3o9bdV5rz7r5MwdDkB0Ob/CBKU6TdFUXUFECjeypTl9UtqSJV9KZ8c4ZawMxYkg8BvCF2BhHGGZt9asFeR+/nDml0pevXUTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8048
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v6 3/4] i2c: Enhance i2c_get_match_data()
>=20
> On Fri, Aug 04, 2023 at 08:09:14AM +0100, Biju Das wrote:
> > Enhance i2c_get_match_data() for a faster path for device_get_
> > match_data().
>=20
> Strange wrap, the function name shouldn't have a new line in between :-)

OK. Wrapping is not required, as it is fitting to chars

scripts/checkpatch.pl --strict 0002-i2c-Enhance-i2c_get_match_data.patch=20
total: 0 errors, 0 warnings, 0 checks, 27 lines checked

0002-i2c-Enhance-i2c_get_match_data.patch has no obvious style problems and=
 is ready for submission.

>=20
> > While at it, add const to struct i2c_driver to prevent overriding the
> > driver pointer.
>=20
> ...
>=20
> > v6:
> >  * Separate patch to prepare for better difference for
> >    i2c_match_id() changes.
>=20
> With this it actually should be patch 2 and patch 2 become 3 (there is no=
t
> much difference code wise, but logically this  can be applied even withou=
t
> the rest).

OK will move to patch#2.

Cheers,
Biju

>=20
> With the above addressed
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

