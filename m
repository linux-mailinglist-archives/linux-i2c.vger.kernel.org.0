Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A9D598E4B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 22:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243240AbiHRUnW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 16:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345210AbiHRUnV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 16:43:21 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA4B25C7E;
        Thu, 18 Aug 2022 13:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPsY9CTRjcPBWdOtEt3Dw9Lc8CfS+AwTW5PDIJlGillPwpIyr2EPA9TkzUDHITSPBOaLm6JEroqcNJTfvUHdk8q1YLQnbrtsVqouqzIk8zIEqv4oOJ5Npz5BXHshDo6lvmx5aQOVYD7pCN3AvD/xz1fqGIM/nh9u9aJosFNL7LT9/lqX1utcf23L6OesoQL7kyWF0+59r1msAZ36sQAY+QW8lbvOUOp3az4A92HG+06Wpu1FLyzfSveeVtD05RWQ5a59h4HEMIFAwrY05rokC2aFkrKVcoO98m4V37RJkOYNUwEU8myEWVpCRdF8ZmLfm3lEzskyiXh45L0/DfWyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4tBShPftvYSiGTy/RfPXi36h+F2vRH6Xt/jxfqF9Fw=;
 b=ZpQ4v10G4sucNjUwMEtZeidllZbBISCa1zWIiO5dOu7NTU51PM6VJAOaRo2NUKQ9BB1s9SKdiQlQnmqgFo3BHaOdC75SORXBSMeNd1VKNARdoN2K3+qh06Sb5U2u3/85UyFj/fytk23WfB9+T3RO2mPOmAtvtvyPFkI+oBzts3F2/KbkEYNwWHLcQk2NKF8RFvqmPbYhOgm6aJPdsyNrDqK/Q09F+yygYf1oUBR9c4p3qaWhVNwpUh8QrYtMvOYwAjx1i3uBJLRBMgETYw2j06OMrz73bvlIhN2OMk65FMY7ErgxtmFusb2kIJ95NTbT0Km/EhU4ap6VGKgZCQANcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4tBShPftvYSiGTy/RfPXi36h+F2vRH6Xt/jxfqF9Fw=;
 b=t70YJtlw3UNV40dahDxpNcdqbhR+ZVmiEf+sHCEqHs3X7MBbtZfylXKbS7qJBhxq/w+BTw+gArvCyu1ZM4+inQtYocG+Uc0O1AzNnR6YJFUNsOw+Ead3iVaEmE14Q4wmZe9YuGrblizv99zCIJhYem46VHpa+T9AzPsIq0tB66rxTxj3YiKHg5xWVr2WNJQxm3oQsXnryaHfGY6/AcQPMkwpJZkMfNkI9hH/jGl3mDcXQW29eFXX4D2XjqS60VnKkOWCR3Rcywgqxjw0ncLURBK+oz1WoRlb2FKF+ScAslyHkVLXbkJ5+vaOZiC4lGe6LRARzDbajTttG626S+bYdw==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by DM4PR12MB5327.namprd12.prod.outlook.com (2603:10b6:5:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 20:43:17 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5525.017; Thu, 18 Aug 2022
 20:43:17 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v1 6/7] i2c-mlxbf.c: support BlueField-3 SoC
Thread-Topic: [PATCH v1 6/7] i2c-mlxbf.c: support BlueField-3 SoC
Thread-Index: AQHYscM2Cy+qxZ4NgkieNJDDEidD4q20xigAgABb/KA=
Date:   Thu, 18 Aug 2022 20:43:17 +0000
Message-ID: <CH2PR12MB38956F5C8AE7574B3539AA1FD76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-7-asmaa@nvidia.com>
 <20220818151150.GK1829017-robh@kernel.org>
In-Reply-To: <20220818151150.GK1829017-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afe8751f-0409-440d-57d3-08da815a4772
x-ms-traffictypediagnostic: DM4PR12MB5327:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aTCk3ifO4QUf/2VPhPIiIdJoaGZixIySVAX2xCRLZLmBQnERxJdBKRJiPckbkCRc77IS9m8aFxrhSfEBoeKm/Wqw9iMUSrREg+rB7iGYRB4XHlKfFR0I4l8iXQXUGsMl3hkgSr6Sy1CQUxIqaO5SypjZ8y+g9jYj/oT8oBmcawfOFG3NgHQZ2bWSzOuSoehgHnpeI9yafOqFp6KPXT1fVBqPDGMPA0JWmZBO4iRPI1EFcUkIzS4IRzmXlchtHRR9Q1DxmK+SufK8GaHr4TNozaNGX2NiAo7wOeytPh8F2QqwJTAf4b+4DLBHRQhxOzM3YSxWCBU/iHk5j7xw1tXwAzYJXePyDgEdehnjbtWCKUo+RR9C0aqcQiQCb9gqcnDZ9UAEIDJ37svsu+CBwIVQG9O8Zvw2gqIDr8MyQABAjGXVinKY4VRWT7HDEvsj95lCgZ87IzFHCtaGhk+OIFcQA2tBGyN7tNpRn2WaYQZT55zbs41vc/Qz7aKiV6oiyCqKazqPz5mxfB0IUvNXC+6i/c0QF8dkcPl5P/nHaAydpauJCERDo+45DI3qGzThZonQe6XBrD4YhLd1jXT1SqDsCq9DC/xC3aU8e510KxlBz1Iyy1urLW1DVpkt88XaZUmQp1OeIe8gEQxnkJ7xUMsfKKEUykjEGScGPeHEY3sBA8vSid5khn5rheGBgKJcLiZ/2Z+cTFb1Wou2bC7dcsXKTaTRl3DOEwKCWFl2gIHILSQkDFFig8gEEcx1Y7Cy0IFV8V0Ij4KUTXp4jRM13cadzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(478600001)(64756008)(186003)(5660300002)(55016003)(52536014)(107886003)(8936002)(83380400001)(6916009)(54906003)(86362001)(7696005)(33656002)(38070700005)(122000001)(6506007)(53546011)(26005)(71200400001)(41300700001)(316002)(66946007)(4326008)(76116006)(8676002)(66556008)(2906002)(66446008)(38100700002)(9686003)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B4XdV35yu3nR1iB6XOJcedWUMRzfQvzI8gjSQlrlv5FsEHzV6PY/Itdy30Zt?=
 =?us-ascii?Q?WmiaFK/ztIHB7JE+/SBeOTas1vo2GWH2eIddtlrhu2Nerva8ZxeeK6Upcbz/?=
 =?us-ascii?Q?5hQOj0gR01Db5Yy+0SnV1hwCdmtULD79EoJCenvELJBNMl/aFIcoBxG2QwVB?=
 =?us-ascii?Q?b78WZrTbxYwcX6daxr1075jWnaZ46mZV/fa4CzuF4PYk4SAdtqqiBuejGpBK?=
 =?us-ascii?Q?/78O1KJmwvwFVCidcO6mj1lrXMfIO+ANXTqLOXoQZOWSNGROA27+zLJ37che?=
 =?us-ascii?Q?nLVbo5adcVohhpAFlRvazqzCI0QIaxODeOR5WZklocEy5X+QBPDfHHhBGXTH?=
 =?us-ascii?Q?21gl+Hogh0n/VwEAYMFMUF5RvKLLg8eLypvajzdX/bTahPDK8vT0ZSHVaoOA?=
 =?us-ascii?Q?UiphyJFKyNuanwtxTQhccYibi+LThX8iI3JAej9OcMYOKkIFBEOILnJXgBkH?=
 =?us-ascii?Q?8I/Pw8F6wvWXfonnNWlNbA2+9/hp11fvu2GNuaZEEscjcUU4mEEB8OysaTl6?=
 =?us-ascii?Q?4Xpia87N+7JpOjtL08oXydNDGakoR8pIc2B5L7jOBQ2PzVPwXOrKUOvgoP8f?=
 =?us-ascii?Q?79+GY4no9brCViPX/uaK+i8faPsfr46t+x65jnL0AZbQol8ta+Pb6/UM3FOS?=
 =?us-ascii?Q?jLich5mOTriRgeMx3VVmYlO/U/2i51asRk7z6cXICZT62BtZcXcOYhUQRIJ0?=
 =?us-ascii?Q?OzekyiF1ooYM1lTAk/flGpjDPSFSeRuMGNiq6k2rRUrwkISXdjjPy8V+hJg9?=
 =?us-ascii?Q?2YcZk+Jf3WCA5UOoEEt+w1JdzR8Z4x1Rg5FGpaV+4b4VentUP3+YySMd7QdJ?=
 =?us-ascii?Q?5YdncGj+db38xGH5WOvj+EiQ767qdaL+uM7ixkMriMj4NO4vlsHHlg8/gEuq?=
 =?us-ascii?Q?4t3sgAEctoQBhno9L08et8MkK+7mAUgf1mOgegWpx61wGYxkuEenE6rTBfgq?=
 =?us-ascii?Q?PBvWvyEH0MCetA7KAJYm13Zwco/p2fGY9J+LRo7MEvyk+lhSP1Dwb+Fxdexz?=
 =?us-ascii?Q?7lY0UCdzwcjAEI+dwwOAFi3icbfYflUzrt/ZVGM/sQ4Zjr5qFV1yFxA5niyT?=
 =?us-ascii?Q?nePLohCf7sVqxPS/r+2652eTq2879cGDFFa331K8XkP2fhzAmRnQj9yhkSJS?=
 =?us-ascii?Q?z7/WE1U+6l3NQ1u0cLN1af2o1dqEmebRrnyDQpayRgd+xpVA6Nled3E5vWvM?=
 =?us-ascii?Q?yowl4Nky2/SmLUmp9XKg87P+xAkBV2vntWtO7U4oxh+3nYazZHcPYr2i3bKv?=
 =?us-ascii?Q?qtkcMkhJJ38beFckB7WFzKC4ilUokzjYbbm/8nW14eK4HMFxvjclUDYs0zrq?=
 =?us-ascii?Q?FxViYRDrMtFw0O/IQ5KMwiv0gGtaYdvFpjQWUgAujJlmwSYzCGG/i4S7TsDm?=
 =?us-ascii?Q?5DBVK6BcxxZ5QCrqbQvxeIhZRZ9Nt4WHMZMCwjn92Hq4UKNpWhT4kgQNEfWj?=
 =?us-ascii?Q?Sak3bG/8WLaIBPg6LHd0O4lhj5YH+TPfON69xsSDgL/2NZtcHkQlC344O/46?=
 =?us-ascii?Q?3hwMEtK52M67okfdARgDRDVy6PUmRcoUhukV1KqYeUgzM2AhUL6n+bCoK++e?=
 =?us-ascii?Q?ml/aCIrFKKpE6p38ETg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe8751f-0409-440d-57d3-08da815a4772
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 20:43:17.1905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eIS4ixmr2VKCqm6QeSxA/uMo8lnv7/9JqxeWAwlXchj7IrUvCfShJ5G3ZhiQ6Ji5if+J4irQpftmG1dkQGujUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5327
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you for your feedback. I will address them shortly in v2.

-----Original Message-----
From: Rob Herring <robh@kernel.org>=20
Sent: Thursday, August 18, 2022 11:12 AM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-i2c@vger.kernel.=
org; linux-kernel@vger.kernel.org; Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 6/7] i2c-mlxbf.c: support BlueField-3 SoC

On Tue, Aug 16, 2022 at 06:54:11PM -0400, Asmaa Mnebhi wrote:
> BlueField-3 SoC has the same I2C IP logic as previous
> BlueField-1 and 2 SoCs but it has different registers' addresses.
> This is an effort to keep this driver generic accross all BlueField=20
> generations.
> This patch breaks down the "smbus" resource into 3 separate resources=20
> to enable us to use common registers' offsets for all BlueField SoCs:
> struct mlxbf_i2c_resource *timer;
> struct mlxbf_i2c_resource *mst;
> struct mlxbf_i2c_resource *slv;
>=20
> Of course, all offsets had to be adjusted accordingly, and we took=20
> this chance to reorganize the macros depending on the register block=20
> they target.
>=20
> There are only 2 registers' offsets that do not fit within this schema=20
> so their offsets are passed as SoC-specific parameters:
> smbus_master_rs_bytes_off
> smbus_master_fsm_off
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  30 +-

Bindings go in a separate patch.

>  MAINTAINERS                                   |   1 +
>  drivers/i2c/busses/i2c-mlxbf.c                | 397 ++++++++++--------
>  3 files changed, 258 insertions(+), 170 deletions(-)
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml=20
> b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> index 93198d5d43a6..cb3a012914e0 100644
> --- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> @@ -8,6 +8,7 @@ title: Mellanox I2C SMBus on BlueField SoCs
> =20
>  maintainers:
>    - Khalil Blaiech <kblaiech@nvidia.com>
> +  - Asmaa Mnebhi <asmaa@nvidia.com>
> =20
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml# @@ -17,11 +18,15 @@=20
> properties:
>      enum:
>        - mellanox,i2c-mlxbf1
>        - mellanox,i2c-mlxbf2
> +      - mellanox,i2c-mlxbf3
> =20
>    reg:
> -    minItems: 3
> +    minItems: 5

You just broke platforms with 3 entries.

> +    maxItems: 6
>      items:
> -      - description: Smbus block registers
> +      - description: Smbus timer registers
> +      - description: Smbus master registers
> +      - description: Smbus slave registers

You can't add new registers at the beginning of the list for existing users=
.

Either add to the end or it has to be conditional (if/then schema).

>        - description: Cause master registers
>        - description: Cause slave registers
>        - description: Cause coalesce registers @@ -58,7 +63,9 @@=20
> examples:
>    - |
>      i2c@2804000 {
>          compatible =3D "mellanox,i2c-mlxbf1";
> -        reg =3D <0x02804000 0x800>,
> +        reg =3D <0x02804000 0x40>,
> +              <0x02804200 0x200>,
> +              <0x02804400 0x200>,
>                <0x02801200 0x020>,
>                <0x02801260 0x020>;
>          interrupts =3D <57>;
> @@ -68,10 +75,25 @@ examples:
>    - |
>      i2c@2808800 {
>          compatible =3D "mellanox,i2c-mlxbf2";
> -        reg =3D <0x02808800 0x600>,
> +        reg =3D <0x02808800 0x40>,
> +              <0x02808a00 0x200>,
> +              <0x02808c00 0x200>,
>                <0x02808e00 0x020>,
>                <0x02808e20 0x020>,
>                <0x02808e40 0x010>;
>          interrupts =3D <57>;
>          clock-frequency =3D <400000>;
>      };
> +
> +  - |
> +    i2c@2808800 {
> +        compatible =3D "mellanox,i2c-mlxbf3";
> +        reg =3D <0x13404480 0x40>,
> +              <0x13404200 0x200>,
> +              <0x13404000 0x200>,
> +              <0x13404400 0x020>,
> +              <0x13404420 0x020>,
> +              <0x13404440 0x010>;
> +        interrupts =3D <35>;
> +        clock-frequency =3D <400000>;
> +    };
