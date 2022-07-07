Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDA4569B6C
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 09:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiGGHVG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 03:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbiGGHVE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 03:21:04 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FE220F78;
        Thu,  7 Jul 2022 00:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czM1sV2WVOcekCRZKYtr0mWpZ5hy2QyCmFHigfs6jNJk5e58mikLdOQ+W6Pv6iru61q7DNHclkncbCTW83n+MFz15kkSXFTVqKfFotDQK59WXBFlkajxfTEsi9N4Wr1gUTeymNQl+t7FY1Y1GxG5ptd6VkSUwpdRff8OrE9PGeS88w/Td8UwkvU97serzLXFihl4BKUF4hiP3V7TsiDm8I+4fCOa2Zgo/mZtbiizQG6joaOAJnUJn4LWB651o5J3CVkDfuOLVIcrto7BsooauAtQgQtg1RPrUkOauaKdhX2rUJGkdEHVkNdOdHiSm4JYFXujygfRyozwcgJxYhZ90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGG+Er5EPd/I2YXTwBOasM3tDfrasRghcAvDLZrE2s8=;
 b=kDnbSGpXc7uNPkVfXPD0WvtbPgTVjgFEgtkCPBgobG7UkwKHPUHC5JB3CA8NdE/LODTMYcbN2kSUUoWEQeStQyIvPeGn6rAmRVOs8kGmByvbr02hvnIfzZiVpGdPDGggeJGV5QF0YX1ANksVCvFQq7cDr7BANRFGNCZ/uljiacr7za46eCg0cM89gPiD9l8smYTLJhWcwZhZK6EA6noABza80fRU4t/V8e/ykHXcHaAjoe7CADah+rnKZHijNeEpKHda0iaA12qXVNAAZpSgoTFywHVphZpEfOe9HYtg+AyioarWLC06oTjWe6L1HiSd8BsyAaXDeft9qOOrgymoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGG+Er5EPd/I2YXTwBOasM3tDfrasRghcAvDLZrE2s8=;
 b=Q1Akg/zMS2cht2e8gG4nLLWvl2vtkDCixq5F/sY4QBi8RBr7oucBE9IcNNROaJ3G6Jc5QnjI9KpdEw+05lWOR86c+omFDlNkKumT3Rsw3xnXFP4bctGZEAtENrHA3p1kN3/pHA4OCwyQdolvofLJH3/uvlByDiH02S64pYHjvY4=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB4246.jpnprd01.prod.outlook.com (2603:1096:604:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 07:21:00 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 07:21:00 +0000
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
Thread-Index: AQHYjWkxMg1ZnbISoEmC77vxSwmcoq1q+VkAgAFdSICAAG5ZAIABgxGw
Date:   Thu, 7 Jul 2022 07:21:00 +0000
Message-ID: <TYYPR01MB7086921244A6D1B764368A54F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com>
 <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
 <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
 <YsGy2rqk1tKQJJ/b@smile.fi.intel.com>
In-Reply-To: <YsGy2rqk1tKQJJ/b@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b22f2318-4f67-4d65-0d4f-08da5fe93e29
x-ms-traffictypediagnostic: OSBPR01MB4246:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dE0smCJnRwTI/aD+r2QteR1JlTkbEjHlY+GudbPDHYrQbON4Y62/wzOMxlqEOUvdxMBiYRTUY2O8u0qukyUhVzep1UtdyXPkEPntgfRxkx/W/Ad5ha7XArDQ5M+7BzpesyTw5Bk2RePGoWlnv3NHwnYTPJitTQ1rNhpt64DhqDPzqkC4pp+Kz2HBUrCnN2haxQ2PQP1hHlPObBLw5mBjUyS4KRBfKuXlojXtUqRs7FzLfom2d1CaxjBJ8ZeBbjcX3df8dxV3ubTyriI0WpB4Qk/rgNpYeECxVOvvwflHM33YBeRp9twPfUDf8heF5BoE+Pkep1jXuDrDavNMrrSdEqeVHgKegeNqIJ8fHZfIKu3G/uHasJBr4cdSsLDr7QxBGIjPCvWLA8PwaJQn4XqzBygBzJpQG32nApLeiqH8dNMCPNppMYsoMrSPOZOGmcd2Bfyq2T2FthSR8TkNoUYI/8Soeoat345X1HE0We7td7uHcvEh46tRfCEFflTPcB4ThnQzbc+Rol+tZAR9W18RPNYTb/8X54Vf8eXjKQAIRvGRsO8jTfhJOizHVtPoUONBV2DDReg7kxE02Zmb0842Pis7MSo8t3is5BGSehHKBh6rEExfSiRJiEycnE/zTGrQfeUEvQFrOuizIFS2Sq5pHXrsCXKvbX/+fLP1XX9AsOru+8SuwB9JrcLfQt2oYbUISGnlY3xXV41RIR494ASlIemkmjWqGa+os1xGObRA/GlSIO+jbNkSM6h8OGhDAZ3m878HjvF75lTHzEM5hiqoeti5z7jW/K9mkDtBwVmenElcKDUuVRjmuTpzNwbsrsikO2YJVmZALm9U9Kd0wjopQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(478600001)(71200400001)(64756008)(966005)(38100700002)(7696005)(26005)(41300700001)(316002)(9686003)(8676002)(38070700005)(76116006)(66946007)(54906003)(66556008)(66446008)(186003)(66476007)(110136005)(86362001)(33656002)(52536014)(2906002)(7416002)(6506007)(5660300002)(44832011)(55016003)(8936002)(83380400001)(53546011)(122000001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IoBN/qicXMLhwVuASJUV7ossI3Rc7ssfh8M7QHRcHYpPkS2uBkzdMWgkDO6w?=
 =?us-ascii?Q?3YYsa7DSyuS2OINMxhA48qC0PU03GlBg/9Rj63sein52vvykLEkWEjKfNCcJ?=
 =?us-ascii?Q?xUexzLg5E2VvvA1QV+25yXXQUSUdTGj7Taq7oMc/TFK3pcvx1Tns24+SMhhs?=
 =?us-ascii?Q?UC3zPdReN7/OuoprsPyUX69oY21RRngm+HbvsMlPlsV2bEI9Zh3pEWhoRhYX?=
 =?us-ascii?Q?H0cY8VPFMUSR3slG6TA9hMlPuBQCPpDA9agMGlms1JqbwF/P9UyZwDo6nH2R?=
 =?us-ascii?Q?Ixq1RxETNpbEGCw3mIzOJbh0B5EWH31o/za3N6w5f1Jq2SV86Iwxqzq6v4Uf?=
 =?us-ascii?Q?ytshTYwuLYiA9Vh0D1iFPBjcpUqSPtaYmbvS0DoQRUbjEmU/ZzSuoyVK6Mwb?=
 =?us-ascii?Q?n5xVVjW01cl9yTQOALAyv8YwWRohbUwqSt94NMjDrwm1m5+wDK5dnGO/Vp3j?=
 =?us-ascii?Q?AL8SzrAjF0k/20EYTxZaFjdvvqxlI/miD/yu/bESpIHDQi4T6pfprnwz6Cnk?=
 =?us-ascii?Q?pTSwO5BWD25LfudwnfOXCCspA/+dtJJf0N6kDkdcDO20sWFDBqA+QVP0w0uW?=
 =?us-ascii?Q?tFWHniB25rlprsawMJ+Zv2HMFlstSraFRF0l0i2HcyXlFXMAF2txlzLbtPsx?=
 =?us-ascii?Q?GPosVGdbZ5YusY6NeXq8qWbE4OCGp9cSY93kxh7dA1AhgunkDzWl1eTWHHx+?=
 =?us-ascii?Q?ZLupZLQ0nZQY/CmLy4Bg478MZ3lxMchf6Juga37aD77/aS5J9FMbZMgEos6r?=
 =?us-ascii?Q?wwmK+wB8nrcdu+1loCd1/zIkowbOzoCeDYQygUkA+ZmT2nOK7MUQLAldQ6hH?=
 =?us-ascii?Q?KKyyLEks3ZVml1FtuyS2Ex4zrrf1f/FM8IzQ7G+V0Cl8gKDf4fQMhHeJz7Ri?=
 =?us-ascii?Q?bQEsc/jc/d98BNc6AVm6INBP/uWF5I+b1nky+4bMPUsCmlijofrGJFWOmXoJ?=
 =?us-ascii?Q?KqL6oHmnxCykttX3avr0NaiEOnIqymZHRbj27bWegxWq3mtTobnDiPBg9Nx/?=
 =?us-ascii?Q?6p8JFnlC+dpokSkqwIQVyoo9W7EmLWW0ln0XcZ5oDfxSRIPYlR8smzWnToam?=
 =?us-ascii?Q?m6FPnatsepVt9oOvtzyK3KV3bauagLL8K3GbXwPS+4h9X7kgtYQlMWZf6t5m?=
 =?us-ascii?Q?GfCZXd4tviM+ChIqAoAnYh/SplqaUYqxMEVjpZILJYsQqkyMHdsh+UN7Wlb9?=
 =?us-ascii?Q?9mmpNUI6O3IOw16kcsppMOPZvTNjVUKbt4sT/ut7C7u3DEVhfxfQfJJ0nLIF?=
 =?us-ascii?Q?/LZKCTJkguUOx4Eh3rI/9UZeYLg3AILvHePc4AYt61LfxfpYsp6Q1+FGdA6x?=
 =?us-ascii?Q?XC+k+pnLs21AiKhkSJ2E+NPEqVP8KPMxsFaOYiUT1k683RrCSknIajpe9xAA?=
 =?us-ascii?Q?hTIjUVMfiFEsyZ1+HNC19hI/2Es1KgY8Li5bc8n07ovliNgGcZVHv8vHEUrg?=
 =?us-ascii?Q?KTlcGSwTehN3030Yta7GlTwF1k5Wz48yDP/bXqC3C3eYIDRuE6GuoKxFEJM3?=
 =?us-ascii?Q?6uNF98FHns44bil3sE/V3gLtDG9Le4108+Z4u+E0QAzKsjSoMRxy6vmsRq6k?=
 =?us-ascii?Q?f1dOr0aIfTxyrcmDlg40pJbXEpJsHZXgxycyoBc//NOY8gjI12ceCDgpdHLs?=
 =?us-ascii?Q?Kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22f2318-4f67-4d65-0d4f-08da5fe93e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 07:21:00.0774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+aHjyxAUU6nTG7NTVCOq2pZwBdImXxD48L3IKVHs/K0uB+k1ITW0OqjHtmtw+vxYJpWyxcKmI/mdlkXtx1kCzxRpQvNkrwK2BMuh+jPZEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4246
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

On 03 July 2022 16:17 Andy Shevchenko wrote:
> On Sun, Jul 03, 2022 at 10:41:45AM +0200, Geert Uytterhoeven wrote:
> > On Sat, Jul 2, 2022 at 1:51 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> > > > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > > > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
>=20
> ...
All other suggested changes are ok.


> > > > +     pm_runtime_get_sync(dev);
> >
> > pm_runtime_resume_and_get() ;-)
>=20
> This makes sense only if we test for error. Otherwise the put might
> imbalance
> counter.
I added code to check the return value and to my surprise it returned
-EACCES.
Some digging later, this only happens when I have an i2c controller
enabled that doesn't have any children.

rpm_resume() returns -EACCES [1] because runtime_status and last_status
are set to RPM_SUSPENDED.

The i2c controller that does have a child has runtime_status =3D RPM_ACTIVE
as there is a call to pm_runtime_resume_and_get() on it due to the i2c
controller performing an i2c transfer for the slave device.

I am currently struggling to work out why this is happening...

Thanks
Phil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/base/power/runtime.c?h=3Dv5.19-rc5#n773

