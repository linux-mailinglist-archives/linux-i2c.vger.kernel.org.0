Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A65E56A860
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 18:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236439AbiGGQiX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 12:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236371AbiGGQh0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 12:37:26 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34D02D1F0;
        Thu,  7 Jul 2022 09:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEJmM52DZhrqQ+pIQZ80SmPYU4i7OXPW6xuf64mInmYdfirAisTy/Qd52fJl553UyhmfFTU04T0ntz/ROO8yXkUkiQJ7it7LxYGl/QD6Hxr/74vO2dxCXvDlyMEW4c16g/RR17UStSmvz8vZ3JOShUwdWEREeEU3t5oGOdiDtvu+z1rnqyCX6dFvdwVL3pEYJ6jZMGLlnXSxH7SjfvyqFBAwgSy4xhzbBCwn3jtbPfMRuA5cv7gk5Qhm/SJb5thByfjz3R2d09d9ERKB5GTfvNvewSLs5P/LjWUNaYMATonVFiacHOd3NWSuxqDPQwa4uENbHCwZMF3s0ev0DU5Cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds6RL47j/kBvcKoJeOp4FNlSQsFtRNyHra1VFAjL8zY=;
 b=Z1E1MnFRU3hy3xpfC2wC6bAydgNJ4S+P2zcZmlF4Asgn2TtUqWGSG8MDnMmACf1s2ZkTchoIRMxT/2XsuLx5Z30+/hFt+D/SB1wQSnjUhdwtAg23VaAa/0TREB8AuBtWoHicRZwXNATc7wh8MY4oM5KCjEc2h7au3BrL5BNOtv8m2qKAoSn/bMbY/bzOJh6HhZZ9w8NyO3xYwEQigtoOXHtzjGxq6xZ9eP+Ll7TBYpF6w9u3JpxAZyOM4DZ2cFKjwVjTIXhFsEjPHONxyUn6wPqURBpoFfJKA0hvcJ9T4qVR2a7zejY1j3EDreK3mSiqIhIb8SB7zLcyTW0ZE6hTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds6RL47j/kBvcKoJeOp4FNlSQsFtRNyHra1VFAjL8zY=;
 b=V0FOfT5O+kJi3porSxEZEmlSxyecwQz9zNw1VpuOJ9OunZP0kJwzO8+DqBpGK36bnmMH9zGrqph2W1ScVUgnB20WCRoXdg07JSrclq5W2lFCLYlUw3WsiJraKlncCMF3+iUdQuICqcrvhQdzmGn2y5o+xI4MP7rWU9BTUIgU6mI=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSZPR01MB8563.jpnprd01.prod.outlook.com (2603:1096:604:18c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Thu, 7 Jul
 2022 16:37:18 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5417.017; Thu, 7 Jul 2022
 16:37:18 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Topic: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Index: AQHYjWkxMg1ZnbISoEmC77vxSwmcoq1q+VkAgAFdSICAAG5ZAIABgxGwgASWB2A=
Date:   Thu, 7 Jul 2022 16:37:18 +0000
Message-ID: <TYYPR01MB70869DD9107B4A3B2319AF4DF5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com>
 <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
 <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
 <YsGy2rqk1tKQJJ/b@smile.fi.intel.com>
 <TYYPR01MB7086921244A6D1B764368A54F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086921244A6D1B764368A54F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d9981af-31cd-422a-2e5a-08da6036f53c
x-ms-traffictypediagnostic: OSZPR01MB8563:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5dpWSfUyqxI23K1G9qcL9DqLDBtiNMCuV9C6U+IXzkPRovliLCL/OzX2r+LeAmqncbUCxdkxvxHjjar7dYAVRRq5RcYsCstL/erXmFKE/6vIjCYE7J9AyMrTGujkVTePnVtaIXzOoWIoHRAqIj3hy0HK6d/ZcdnASzP5aUliyzN/lhUc/G9S4N4ASteXYY1XWcKpLzWNWQpFkn5yGBlaaMz/AKFJatF/lo4vQ27Zf3PMiJrHnOXLLjRVpaLVlylVrwVMejVC4AMUnrsZjHRqf21UeNxJxbsPmBzYYhgRK0OM62H0pFDGtVmglpo3w15DCRoRMZpoWAC3VmpfhkfIW5VI1LaSUCrpCrjz/yJyn4KMl1fDJTXSzNz8xl9mTioysHv6VqYgs5QDm8S5TZN8BjemLYArF8LBudkFFYr3SztbOXqT3j8vNU7FjdY5riXIaXOnsLqQ2gchkGBcDs6CUJ5R1LbtQOpW1mJIgpSpH5OxzqHmqsTRXoKlz059L5Z2J4Rw3YGu44G7Zs6QXWVYeIWla1amOdwfdw6eBW637k2yyrot/StR8rHV54vW1XhJWzFc/PP0sDqWRsHT+9JkpwJo3IEuTcL+afWakaOvnJD9Kv2PfmyAg3vm6rVVySIoj7u72aaJc+aN+WuXqwAqnIpvIgtGig+p4fl67dbOd+79hXE+F7WFhY6u36KYh6yTMoVllmejJ7nz/T3VVeQ1EgoiI+eheOcvZzsNU+SWDRYfcQ3qpAVHCjaRhYKYu/5b89/f05QqiZjHtImfQILBHOOsTmicxWqEaWlMTP3zqxT9Jagfmg7H1XbdhkD8HxM7foO8c7+T1AOxAXCr61hAp+3nprovucegrevtpols+wwkpQnNVCqurcbeXJtQ2XI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(76116006)(66556008)(64756008)(5660300002)(66946007)(66476007)(8676002)(7416002)(66446008)(186003)(4326008)(52536014)(53546011)(86362001)(8936002)(6506007)(966005)(38070700005)(478600001)(41300700001)(38100700002)(122000001)(7696005)(54906003)(110136005)(71200400001)(316002)(26005)(9686003)(33656002)(83380400001)(55016003)(2940100002)(44832011)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AEE04JHLpf3cfNCwqNQDjdJ57dmZJXEwt93IN7dQeSA1+eftuWtMWHM89ynO?=
 =?us-ascii?Q?PyvJbLVJX1balcW4+CHwMK9MBuHUDxSHJEiBXlRNFAICS/NEOYSjX89DYiK7?=
 =?us-ascii?Q?oMJjYUWO1CF+awcKw8REgw0j3sCmvoP3Z5OU3PDvD0CsvWB7nxBEBtRXvYpB?=
 =?us-ascii?Q?eTEvcWuWqblfSLUS/8j6oybXQTGnRNSOBwUQ/fRahDcBvUw7ULDPrt0Pk7bB?=
 =?us-ascii?Q?gL3CDtPp0jWge6/x8Xv083skyhEO3MeMzIPAcpbs5Yj6rBhW6HOZQsTCWb/g?=
 =?us-ascii?Q?qcOLj4s0b8GBUX6E0M0AXGVSqZV1RDSJcuv4Sm6z0CIoO1vhtf4SFdziWsbp?=
 =?us-ascii?Q?SW9ZfxUk9Hga9HUPvNqoBjSZBSqcQhBhTrTycdJ0aXcqf56dc5A0jfP6JMGl?=
 =?us-ascii?Q?mEaXMTeVD0XW3cshUp+xD0wtBESwytmeToRca8hntDpzOWZembH+ZpBS/oT1?=
 =?us-ascii?Q?SkoKHyLHgiMp23DnAm++JhNfjWR3upMfYj5hG6GgytuYS5G2PQygxjeToBrS?=
 =?us-ascii?Q?HeEiR0dz5btnGaiL+NS3SJQENjk9OaVbBL+0EXq+JQC/BNW0kGwI+MqXTyxU?=
 =?us-ascii?Q?fmrbKE3lHtEDduJIVpbpSaPBuLNAZtErqG2imLnG7SSsoxC/p0YR5rd/pdcP?=
 =?us-ascii?Q?hpBb1br/oZUdKQeAzubga+icQp+JZicVNuL9wgQkcwmvMQo45ML8ZPpudjNT?=
 =?us-ascii?Q?IJvVkOSKbG0ow+6C1xPcmlEniWyDCyiiMk7zhJvRPNd0OtMJ5d79PUKcjt5Z?=
 =?us-ascii?Q?QEe4UsAjyh2kHxutS+JgsLvcaadp/3cyyaCBveIRTsAxWIG/B8W1Ng5++zpD?=
 =?us-ascii?Q?KnVBisif13xq5enEy4kyatLnQZ4KzVQMiS/y6hXdpPeqNRYCDCvMuFQLx3O9?=
 =?us-ascii?Q?qKwyG2VwR3AvnwJsQpzx1A8QVWChRs0Y7EPS9O/iSrnHM6k8oXLxdAK3xLPV?=
 =?us-ascii?Q?zdTI5MMieCMS5w/ZQp1ZoSvuEbuWi/2lhxjzCoT1FR/y6eO9s8Mt9EpJ4HQ2?=
 =?us-ascii?Q?XmAxIMJGMGJRg6LPubGSeuJRK04PtKAmdTSris+oXeBH05h5Lmzt4S1Y7ALb?=
 =?us-ascii?Q?Tq8hgQnVqokuhU+swFSC37yQKBq8eUu6WYsO2zMONazJ2WiePo/R6tXl/YI6?=
 =?us-ascii?Q?z7OpdyO4T89HfY690eqcBJEOmNemdbFGUbtGdnwJQL32rVfwlTNZPtcMgpOW?=
 =?us-ascii?Q?NKTjKJGSJ0D64OhQIIZjP7Wo3hZgz6OOyskYaK8TtcfFfWEIjjsUlYQSZS+6?=
 =?us-ascii?Q?LiOi/7AKSBCLhY8K4R4kaUwJTtB6kBcvKU11fV7pW6GZGCbrfoRUlQCCzzLx?=
 =?us-ascii?Q?LLPAq9XDfWkIJ1JQcwMrsMG4oBBzifzust/AzOUHleeVeAwloQw7pshR+Dbo?=
 =?us-ascii?Q?NjaufYgBbd0DEQ6JKIzYDxKdRLuYEEU3oBxB5JjdLfK32m8rTzvhOoxYZM/+?=
 =?us-ascii?Q?FmfZL2f7b9whbspp+vuzQ7QgjwNntyRbxWaI4N1XuyMUgrvLwKbi3CAUV/r/?=
 =?us-ascii?Q?Xif5bc5yw5QoxlQPL+vWWt2Rsr2Ax59yKRKzAdGMnwcpFU1rCXyuBmcDYmoi?=
 =?us-ascii?Q?IJqkzs4Qme6QbPPQF8lcyeiaXYiY06vdF/aqqGJkOIN4KO0TDQj8G6x3TmDZ?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9981af-31cd-422a-2e5a-08da6036f53c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 16:37:18.4896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RV2AzuqxORxHbuIJ4Moz2bLgaLMkhh5Yb/+ApGd84hlUjwsnckXf7mpJ7OEkvsZxr1bVPuYEoRemUmdg7fauGZYL9QCvhhH4MvF6i7GeaFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8563
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 07 July 2022 08:21 Phil Edworthy wrote:
> On 03 July 2022 16:17 Andy Shevchenko wrote:
> > On Sun, Jul 03, 2022 at 10:41:45AM +0200, Geert Uytterhoeven wrote:
> > > On Sat, Jul 2, 2022 at 1:51 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> > > > > Yet another i2c controller from Renesas that is found on the
> RZ/V2M
> > > > > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
> >
> > ...
> All other suggested changes are ok.
>=20
>=20
> > > > > +     pm_runtime_get_sync(dev);
> > >
> > > pm_runtime_resume_and_get() ;-)
> >
> > This makes sense only if we test for error. Otherwise the put might
> > imbalance
> > counter.
> I added code to check the return value and to my surprise it returned
> -EACCES.
> Some digging later, this only happens when I have an i2c controller
> enabled that doesn't have any children.
>=20
> rpm_resume() returns -EACCES [1] because runtime_status and last_status
> are set to RPM_SUSPENDED.
>=20
> The i2c controller that does have a child has runtime_status =3D RPM_ACTI=
VE
> as there is a call to pm_runtime_resume_and_get() on it due to the i2c
> controller performing an i2c transfer for the slave device.
>=20
> I am currently struggling to work out why this is happening...

First pm_suspend() works it's way down to __pm_runtime_disable():
  __pm_runtime_disable+0x134/0x1e0
  __device_suspend_late+0x28/0x1c4
  dpm_suspend_late+0x158/0x230
  suspend_devices_and_enter+0x1c8/0x4b4
  pm_suspend+0x210/0x28c
At the end of which, runtime_status and last_status are both RPM_SUSPENDED,
and disable_depth =3D 1 [1]

After that rzv2m_i2c_suspend() is called triggering the EACCES error
condition [2]:
  rpm_resume+0x338/0x630
  __pm_runtime_resume+0x4c/0x80
  rzv2m_i2c_suspend+0x24/0xb0
  pm_generic_suspend_noirq+0x30/0x50
  genpd_finish_suspend+0xb0/0x130
  genpd_suspend_noirq+0x14/0x20
  __device_suspend_noirq+0x68/0x1d0
  dpm_noirq_suspend_devices+0x110/0x1dc
  dpm_suspend_noirq+0x24/0xa0
  suspend_devices_and_enter+0x2f0/0x4b4
  pm_suspend+0x210/0x28c

I think using runtime PM from within driver suspend/resume is simply not
supported. However I had some difficulty following the runtime PM code,
so I could be wrong.

Phil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/base/power/runtime.c?h=3Dv5.19-rc5#n1466
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/base/power/runtime.c?h=3Dv5.19-rc5#n773

