Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E588C725982
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239559AbjFGJHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239540AbjFGJHD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:07:03 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7061F173B;
        Wed,  7 Jun 2023 02:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWZQJh0/9pC6yC5qF2iAWqZ+QKZ+//wmgmyeehMrxNSlEM0wWTb+YP9wxZQCeyOImaAiDoz43pSFyLOmK+iKAlvOiZ/d+In2VbBJrSCRFE1562tZ6dQ1Km3kZZWhgm2JZ8JMW0LYucNdSuzYLnX1O+70hoNtTZHX7NjpXlm1sDRNHAcvNqP88v3rer6oWMeDAP/X/d0CEwyYRmKBtEOfZFXMsDj0F8EP2nfxt8IqvtHwJQ8prm9zMgWAXucvuUnkXMf88yueaF3zebNGB2FIal5frmiu1MyW6yNjbVciscRim1M4r6yQkztoUAWT1jHwqls18IllMmeStOgmoWQ2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMMFswKd8VYZ41l/sM96dBBeaLNwFMxKlVXJfW6nHW0=;
 b=ECylHqPNEqYBERCGWbUnwpecuIK1tAwy4niZwqM4iIuec0jlOupKqwu/PqVEgnCFJCW49gMC6B/TbmTxNvT8DWj2Ty/87tO+xlaothXD4kv8J+yHwAQhyBSgNlDk83/S+krB2l4kufrwftyKDMW/egwNTkl9fc0GvaXJC/43eHAT9gmsuy6p3sTLWuikjDwCnZ9Hki8f1oumKt0ghLAdasOg5WN84e+2IOzscl6a5J75U6G1O+KaZdk42cGFt3aIxeF6rDCZms4PBxQiUs2Z1GGCENJQqNgQ+hXVBTcTmxcxSXM7vR8/4mTgZ3vMlEuLKhesyBFTeNtliV3mAW60Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMMFswKd8VYZ41l/sM96dBBeaLNwFMxKlVXJfW6nHW0=;
 b=JpgJCr3GWW4PNwv42F/vxAYNkg9mgGlpLMxH7GV1jT1bIW6+5tU/iiRHT+ki1j6/6yzMXqib1S/JB4XSiTEcPxcWSRgRTnvdSzVT+WJvSfA0PmZsisa8d28BSVYWWd6Mup7CUQaDv7CuornXmecd747wNiPD6gpTp67pKPkD4LA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8305.jpnprd01.prod.outlook.com (2603:1096:604:187::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:06:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:06:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Index: AQHZmHeP0tU6ipLwP0StWgcCj8giXq9/DA2AgAABKTA=
Date:   Wed, 7 Jun 2023 09:06:23 +0000
Message-ID: <OS0PR01MB5922875318FB233B86FBF8CA8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
 <ZIBHJ9XdvX0FUQKz@shikoro>
In-Reply-To: <ZIBHJ9XdvX0FUQKz@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8305:EE_
x-ms-office365-filtering-correlation-id: 5f947e6a-dd9a-4ee7-befd-08db673677b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5s1a9q/J+QaDfsVN1uC7wsQlNkiLjKxR4KdniuiKQOU+EgQfKAbTFqS4Qp3C3V076XP0Fixj83ofOChrjl+jTO8Ozs3nGgCTwU4KSO561EnVT8ah71gRTywQ4dmGzc9WkJT60mYNgO4j6nA2RrP1Kcmxv3o0SQID0dynEAX0hpEgeGzyRUL/Mpvc1Y44Dsiy4kAvBzRwPVmyWJt5LDY5Bus6mN+QASILOOAJtx9hmzKohw41fjxoIkFZNmaQjlDCaRzXReg3z6O50skg+bqHMUSNwy7kGhaYyRIe/879X/FhuX3j4c0Yrft/k0bz2JKsGwNb59PjI6293lx6MOvIo15DUPuOo6up2yq0nqMMxFyW533QiQbj8aSLoQmrKZRhWq1QySFlTY5XcDT2H0fB5oxTpMfpHS+ilA4J4BqQUFuCiMs9WfERALU+7mfKauoqbZOmev74CazSjEPDVDqYYpqpsvayNV0OaRY5R27wqhOE8luqG3x2+kk/N1xLUsmeynXGtHDLrJLE+Y+Wsw+CCeOnioYkkcYaY5mUvjEiFsrVzv+PVW0kGtSy7FkuyqHCn29sXD1qYRgrNGU7IYqk/fJesS4CAmBa272lyVqQtY2ZP+ohEZGYVg+cbmDckFY0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(186003)(6506007)(9686003)(26005)(86362001)(4744005)(2906002)(7696005)(71200400001)(8936002)(8676002)(478600001)(55016003)(33656002)(38100700002)(6916009)(122000001)(5660300002)(4326008)(54906003)(64756008)(316002)(38070700005)(41300700001)(66446008)(52536014)(66946007)(66476007)(76116006)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hDl5i8hkzs2z/8fFg1p3ak01nubMwccJDDx9+zVmWq4l3je6U2fOgidvspjP?=
 =?us-ascii?Q?OZojr3jkOTqVUNW5eGe2gF7NwOcCuiJqIenDnCFZUSRUyvYZHKqFNO3vbRSf?=
 =?us-ascii?Q?/av5hnet8DG3oGjpxHtpSOtZaeXcrHSHiw032PwkHxmHr6xkf4Ry4aJhzpCO?=
 =?us-ascii?Q?ZBmgn39b61CGlOMAPONDxJLUbwlO72zXFMKLhWWH+s2xfXdwiREZi5NzKbYg?=
 =?us-ascii?Q?tjzdevcy30N3LW9bs5x/uFulej8lKkmm2F2pxncZbo1PHDwfSNoYUKdhjGP5?=
 =?us-ascii?Q?kkfwerYBOSycBQGh0W/WAVN9S285ij2CjidxMasXEOcNDXjh3FYUtJ4nppcH?=
 =?us-ascii?Q?AoI98/4n3cFvhNVmojMKAdwN+jlfyNxxFF2KGqiwApb2sFbMSsO1ddujAEs/?=
 =?us-ascii?Q?TfS2BHODT0/uoRrlIWpEi3+KAmUsRYkedSqBr0QJdv0TsphWNowh+lU6tgGK?=
 =?us-ascii?Q?f1dF0XdKIpBn4CGz7yyq3YzX7+k48qhHVlBgIE8XKgUf+6eBbCII727a3Vej?=
 =?us-ascii?Q?PnG3PBfYeHQC4yv7Pmd7dDqke6OA4tJc3TPNGydQmuu6J0Neix6eWE/Dok9a?=
 =?us-ascii?Q?V0uLwA+c86dr84UqVHL4YrItebADJKVuzM4PYb5z0DM5AgNI4x9IxWd8DotC?=
 =?us-ascii?Q?rLF8deKRYnpTk4rDLv1FPwxHhJyEHpSrZZWnE4xbSnVZEia4e3tVtNFProA/?=
 =?us-ascii?Q?PiJ3GKG3+V0iL7k4M+I7R14hcHr18g8bqbhYcTgQJPTSokThl/jiLfsRgkWC?=
 =?us-ascii?Q?JPMV2yBqQxuDD4pwJZc6olFLbLmrt7AibTK7g5Gsneds+S3/yTL1pxalID0F?=
 =?us-ascii?Q?cY3BxdrSkd7KXfWDxBRs5uBo7QDxaCb2nPyVyshFPVGIuc0Jq9h+YRddDDq1?=
 =?us-ascii?Q?kzYxa3O4ma4gZWkKJGcVJFUMaGDN/OlZALNuMHdfMi4fvWMsQzEhVbAbwrHt?=
 =?us-ascii?Q?bFi/VZLHhK8UzDE0poqwmIlSHsj6vazfxZwbZVq/oa+J5p13CQifKX1wKzQM?=
 =?us-ascii?Q?I6U4ePGPI0vyLqybwF573gmbhoy2tmDrOMJc+GzSIDfh0Eb6V1rpKx6vm+WZ?=
 =?us-ascii?Q?6TyDgnA5YUwBeCxkIoHnvJXNfweHGb53MApZoa/Kr0SBHRFIdrXt4JgF9+vK?=
 =?us-ascii?Q?XsaF/x7M1J09Za+RH/eGWCLkxKv5BgrzUu3TEIrK7LcVCMHP7F+SCxlhpJb1?=
 =?us-ascii?Q?YU96bTG1+fHvmU7j8Zt6G6MRzcHyAAfbdF0QH7Eew8CcCtK9GXNYutdhztrZ?=
 =?us-ascii?Q?watMHzmbHXcctTk1BccqBDvJyWT00vT4b29UKtfoPjt93HvjN0WHIN0urKtC?=
 =?us-ascii?Q?a3Q8pOmzqAVJeUIKgGJos+wc1ZiUYh71u4VhsD+LVwyRRW/sFal2cE1s7HCW?=
 =?us-ascii?Q?FKNFjkPoEoE4kFrtFY8AMFyt3g7PPymh+GaSUXPJPnHHnDTEc7omXU3ByMWv?=
 =?us-ascii?Q?v4Y3qE1OSGZ/+Z3FETaqleZRMsaxUueHCARaSnMD0hIj05Dk/8Jiv5p2riCp?=
 =?us-ascii?Q?9aVCKUUeFdLVtxfsK4FTteFMuZFc+rMzVtTo72AaNl/i7zPaQFVU4z2dB2xI?=
 =?us-ascii?Q?XAMf7lxk404ILNRaINm/mX3ZuzGLt5UYhGnIoNk6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f947e6a-dd9a-4ee7-befd-08db673677b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 09:06:23.6815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jy8Ax0O1P/MNWiYN1XG+jnconDWAHJsFaSsyjmjvrKDC51f8f3aii0Quf9YJBU9IPaQKsRUlcTMeMQ5u1tioED3/nsrr0r9AlED8YlCZKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8305
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

Thanks for the feedback.

> Subject: Re: [PATCH v3] i2c: Add i2c_get_match_data()
>=20
> On Tue, Jun 06, 2023 at 02:05:19PM +0100, Biju Das wrote:
> > Add i2c_get_match_data() to get match data for both I2C and DT-based
> > matching, so that we can optimize the driver code that uses both.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2->v3:
> >  * Added support for getting match data for both I2C and DT-based
> >    matching.
> >  * Added Rb tag from Geert and retained the Rb tag as change is
> trivial.
>=20
> Not so trivial, I think. Codewise yes, but the scope of the function
> changed as it includes DT now. So, in deed, I would appreciate a comment
> from Geert if he is okay with this change.

OK, Will wait for Geert's comment.

Cheers,
Biju

