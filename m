Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9944AE846
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 05:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346129AbiBIEIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 23:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347580AbiBIDyv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 22:54:51 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967ECC061578;
        Tue,  8 Feb 2022 19:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdQ37TVN0xb3varW34eroGFdJ2JrUjZGjgdqGDntMDHCo91Bp/G37iJI4oA3xPQGoY6QUa+WPwolJG65X6nR017a7Og4Qmw3zTwYU+qTumAJuhSxQMPDuH7n87V4Py5+lVq/y0RMFOBEmWZD/CV/b2f9S90uDfQ/stgI8Md+niCFGYHtQfE+jVJKI1fU2A4hNaDEoQepxiYbbMIbhGcp+UMkeXarhnOj06v7sEfM4A5JooiPvP7NROtfC00TRspndB1M47J5TufCLjqpGG1Gun6dkGH2HClIgQg7Fm7aR35FzsRJJW3XvJuIWKTW6Beny/d0iZK8w3oxZbpfD/UwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHOgFp5f84ZYA8VZb2wzYftgynCFMkvr6moGY81RfdY=;
 b=e8sWxRirjGqNW4qvM9dK0zrjK7Q/qF+7ULCikX6Y/efvGuNRh8kNPaBHV+YAa3DyiaJin6dPjhANCpMZBvYLhkWSfdeUCjvI1bFdm8fesFQh2afDRgqyzOqtSBJdIz3x+lWIVQznrz7IO+9+uNapZsSQbtfI7Bdjbf/eI4YRAV2gestb2O1wRPzzWMqfdZh2w+A110H8Bg0n3YgRqEhHF83Bk0VnG0G3Te4Qe+UdE51pwXWzCyub8JrnkEM97vYM4ma8GDpqztHkkR59Pln1CYGSiKSVS8zWO243pONPtBEBVnRr12feR0xo1VBkO1LvNegptF0o/KLiDDjD5SZ1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHOgFp5f84ZYA8VZb2wzYftgynCFMkvr6moGY81RfdY=;
 b=npJGvI/wruwwLKGK74zdqxEmhDLOduaBCw21sn7yx43wRq2q9zAuy47GM3JvyYwmP/vln5UZ10rpPUcO6OSq/ctKhAiDFUhn1nO3oqUktlrrLT/18pcjPMPWm7koF0jL5iH8Cau43AdXnNeDW2On8n7rCmS05J8g8g7a7+JWS4yi6iyvFquteeky+JwgS96dbgXSnOtwwbpiK8KVcbtPG29E2jj1YPjmUConkhTUuiNBs4qH1KwCGOVomEdwIzdSfW0ujFhIBNmL0NEnXN66JzT90sNEz5FExa/Z6p+nqC/18SVcaiz7ssR5n876sd679a0LgfAGzcc1r3JlHMh+sA==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by BL0PR12MB5689.namprd12.prod.outlook.com (2603:10b6:208:8d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 03:54:46 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 03:54:46 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/6] dt-bindings: i2c: tegra: Add Tegra234 details
Thread-Topic: [PATCH 2/6] dt-bindings: i2c: tegra: Add Tegra234 details
Thread-Index: AQHYCIHaCU7SytsfD0uZtfa+2khitKyKpXcAgAAZTyA=
Date:   Wed, 9 Feb 2022 03:54:45 +0000
Message-ID: <DM5PR12MB185019E59EC5D39113F54F59C02E9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
 <1642080623-15980-3-git-send-email-akhilrajeev@nvidia.com>
 <YgMkUHUMaXQpMiZW@robh.at.kernel.org>
In-Reply-To: <YgMkUHUMaXQpMiZW@robh.at.kernel.org>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a83f6f-d82c-4faf-98d0-08d9eb7fe983
x-ms-traffictypediagnostic: BL0PR12MB5689:EE_
x-microsoft-antispam-prvs: <BL0PR12MB5689D9D4BAFBA667EF0B2EE1C02E9@BL0PR12MB5689.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oeUFK/mhtRpnCaVIwt/Gg+XWW+AIlCPMe6f0AQAh1/mo0FSS2kvcFJpG94n+5U35KsdizuX3K+aCek4VPhHlKm8H8mlWNuOgegmU+Ij33ZkLDqjbUvZxPZcdSbfyn0WR9+Ub1i724HiER5lpiVDGj3TfhRa2xOgAbQqrEUZmTwuO6SpHXnO2VG5zPvTtf6PrSbichOpbqKuD7uASJd1Q+wX+sieWRNm14DXUaF3Pl3dW4e3bAgL3nqafCoKmYja2GEWU0NH1RdiDVwkzZnr9eoXTc7fWgj5wuW72/S762nQEmy4jlkvUFdYC9+G+fm5XhLctWYylg85flZOqs13l8c9c/0lumZjkl2q6e/+RPZFOv+8OImBVXJBOPl33YOzjuEAapi2rID18kIZx03N5WSgTIsUBwzxngzKmMwYYOb6UoE1jSSOvJwPZ6TtazJZRiiQS2bY8/CP3EJv+NQUWUQkyt9fh51nVfSeEQQGSwfT4xP9MDvTnlrWLR1ueTZ7pxkypqJOZYQ0NMmTNnlo+YUhX1TZkj0loNEpnVsaYyhS1AFM8Wno0s0RcVnbDzDurfwXFKmi320bbDBEPajgr6Y/so6ESl7ZZx3LijZlzxXalrqdzPxZrElYkvyYmHuTd2hFAoWJSNhR2FfE2HdV4efQyOMbGjph38dkax5d3SGtojGjwgnbdhaBlQiLiMfyhsiExLPcDarVXLnxbTr2utZgnSemAreBFNRo8qefPs+5mL7w4wcgXnGlnmHzdcfT9H9o6nVBRMw+0Z2F7lIAVtENcjwdVs9YEt52zM/2IAaU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(52536014)(55016003)(38070700005)(966005)(2906002)(86362001)(8936002)(6916009)(4326008)(66476007)(66556008)(64756008)(76116006)(5660300002)(186003)(316002)(33656002)(122000001)(54906003)(26005)(83380400001)(9686003)(66946007)(38100700002)(508600001)(7696005)(66446008)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZOhc+dy0S+bDKpYSr93uR/h/1zDrzU29R6SDVzMFnUln4Uw3hoGKs/yMXl43?=
 =?us-ascii?Q?+eqJgZHAg+9Ph3FXm6szB5GFG+D9YM4BR8X0ukfOLG6mJQSe/mI77WdPMXMq?=
 =?us-ascii?Q?OfYt5Zg/1sch60/KWTWuHF2VKFnmJ/DX+camEbTIt7G33WAd1CRqqCduKniy?=
 =?us-ascii?Q?Mn4F0PJGL/+o+H1jO2INM8N14kzH11LYlP0BD+e0oL5e8Nqpl2vwDan8LODQ?=
 =?us-ascii?Q?JmqwRN0jwBf+AFjskC0guGcRsvK9HuM9FigdLOGq1RYsMD9Qw2FxX3yuA46G?=
 =?us-ascii?Q?SbO7AjgfrBrYz5/oSQLArIbaYwRuQ98nfrujo5Fy2VqD/HnEif0Pya5kT3H0?=
 =?us-ascii?Q?ZSoo4EaB85ipnfSCTBqshaiQ1kTjJeBDVuedviAl6WI/IYu9S4tw2tzIGlyn?=
 =?us-ascii?Q?W2XE+oXNh/raIKtmHbjxNZA23iSq+boxIcJ71eudgH3V4xvwGZ5pyTMWU11V?=
 =?us-ascii?Q?ZgXrsGGntEtygc+gYITv0Tg8qBuIjGrj07Dwo5I2BhIsFNu3n3zwFC0WVSNb?=
 =?us-ascii?Q?51mWcDiJ/0dvI8jP3Y7WbyEC8gSQZXUFIcrDpOmDwww/XUtg5388twWQS2CR?=
 =?us-ascii?Q?zs8F96cO6Rv9acKO9n/zYmKLc/eQnyxih5+DhiZl0DcTO0rTSOduaLfHod/o?=
 =?us-ascii?Q?DRvnrkcdXWf1mqPjI8bZ8MUFCM4H7ny2Lry6nyw84bV2FqvW5H+K2GAgKZor?=
 =?us-ascii?Q?Y3TiXvIqOqBfV2AgwRy3knYMxSJP3GYQ+SsNUlvxh7p6gtk29QitI8W5lLQ/?=
 =?us-ascii?Q?Qc33XMJswhF7PvVtOx0t4U4RJ+heQNNkH1i8RrZ7L7Jy7bP1npvS3u+tUtVd?=
 =?us-ascii?Q?bVAOG5slGH1VoZ+qj+0OfVnCKAAFTLcN6jIuiE8C9zjpyuC1GinKHHjCjXGz?=
 =?us-ascii?Q?p2HPpOZcuJbUQGlgiF+Ua48ntqfP9YAeR1kTHIRfIHV6CZEqdnzbVdwFxvYu?=
 =?us-ascii?Q?yfbphFgQv+SvFd1xkw9go4Uj6cGXpMTvuQFiahWuQQKMX8f8G6Yg1cJ4Ydtb?=
 =?us-ascii?Q?XbNXkGEKgyfDZh0O3phDEFkd54OvLpd6OKsk5Vxlz50FUZ9nFDP/oQXEoFZm?=
 =?us-ascii?Q?5AC2WoOB6LeyXrdzcl+YuXSRYexJyuKwCOCer0uhnA7XAbexobvlM1OGjPBM?=
 =?us-ascii?Q?OyqY9KBKm7RqTcK0LyA3Rtzp5vsslF7Ooi/+vS+4X0dgY7haR/AfqF9kTgZl?=
 =?us-ascii?Q?wglLX+mPVsILFSN6oFkoOX8qtK1IAJA+Q4nNFeEy2HhEg8yw9ZbC9FEMNQqW?=
 =?us-ascii?Q?N9VKEG6s5sMD9Xql6HtZD6logpH5g7buHgBB11W+zZJAK0T8fqmM86RLYojf?=
 =?us-ascii?Q?Wi0IeZje05j0hCFM0qjfs043p0oUvHA/3XhycbpbtncuN6j2uL6wmCmJIyIx?=
 =?us-ascii?Q?T5WQGOlmc3xtsZFUutQUM37ru1euavLlsJF60qIZfyhxKS0TSiAkkOeVrPlc?=
 =?us-ascii?Q?U5UBkG1XOd1D0bpk29TzLuRyJAX7T8rMInhlO91UABOR2Sre8K+tYuVnFJok?=
 =?us-ascii?Q?jliKT4ngJoUeYvTJOymgM9OG9j5vUR6gEd+mEY0hr6KLG8eE++OCjKYOijKs?=
 =?us-ascii?Q?E5JudHCN2KdSpS2KkAbiW59uPXeZu4ChdJBfy4vZkbcR7XfIomCcEbRfPATC?=
 =?us-ascii?Q?SE2VhTmydH6BTUU+B40RP68=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a83f6f-d82c-4faf-98d0-08d9eb7fe983
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 03:54:45.9944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2k/i7issDA+LJXxxC2xXV1Cfcdk4QKQ53iQDX6o0soYJDoCTvNWV9tRchAeh3vdOIzh9glXQCOg6UIqqEyVmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5689
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Jan 13, 2022 at 07:00:19PM +0530, Akhil R wrote:
> > Add documentation for Tegra234 I2C compatible.
> >
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 5
> > +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> > b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> > index 424a4fc..c58e256 100644
> > --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> > @@ -80,6 +80,11 @@ properties:
> >            support for 64 KiB transactions whereas earlier chips suppor=
ted no
> >            more than 4 KiB per transactions.
> >          const: nvidia,tegra194-i2c
> > +      - description: |
> > +          Tegra234 has 8 generic I2C controllers, two of which are in =
the AON
> > +          (always-on) partition of the SoC. All of these controllers a=
re
> > +          similar to those found on Tegra194.
> > +        const: nvidia,tegra234-i2c
>=20
> Sounds like this needs a fallback to nvidia,tegra194-i2c if it works, but=
 without
> optimal timing.
Yes. The timing for tegra194 works for tegra234 as well. So, this change is=
 reverted.
I had sent the patch updated. Latest is here - https://lkml.org/lkml/2022/1=
/24/335
Only the device tree nodes are required to be added now.

Thanks,
Akhil

