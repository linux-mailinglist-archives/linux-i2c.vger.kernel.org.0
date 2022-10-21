Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342E860772A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 14:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJUMna (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 08:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiJUMn2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 08:43:28 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F8ADFDD;
        Fri, 21 Oct 2022 05:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moyeelbGpf0J8a11wVasHBTtX4GZFRGIk82KLXie0n2TDJ/gBOcf4lS/NqpPJmBw8l6SWWKQa3y1rgdepyn0QFZWHoVkC2T+sBlnCIN8gMPbwmpaDhjh+TbjWCGXnAvThiqNj5jMhdqDwkprpAX9yBA3gcrBxYU6Y3JY0U1y+XR9cYE9JVg6higO+iFB4x62f9/gEc7+JAAaZ1blKNcU2EapCiz3w5yhr60hmfE/Q8M2tmtUoGweGHME1XW0vZ76XWgEAN4pH/C/oqkwqGmSzPQzgBlcSOdRFdupteAP7H7P3rRR+Jj6FhVWo8ftRkLXNBAs1ZMK0psogYJedZzJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C5s8hZasQRg4eVUhkMWVNAP4bf9bTuxYz+rAxzo0hQ=;
 b=Rnrvg8X40uH4HIKy+TSgUgBIbkZc9LJqS6WZVXRbqjz9+FkjRiufTyIpoKTdUE4ICQSRmylaa/OOuZHmFkw8leqCBPCyWL6ChP+z+qZgXHXLkPbIiM4CAxslXF+Xup7x04aXgr3Z4SsFMFGnkAWGmEn0YFLoP69c+/W1Naom6Xs9SvJDc2ACUaYvdJCHhoQpxs6TUfGYL/yf9Et2TiJ2vWRccPleXLwm9iMEVI5I8Mfjl1C8M6+rTl/k4bfC6WOaLdmgiJQWjsMIZyOPJ3STb3FwWMiQ/b5XbLOylvPdYXOK1OiDwh/ytC0M19Yiz99xpEaujUBXiI1p+gh2nwfn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C5s8hZasQRg4eVUhkMWVNAP4bf9bTuxYz+rAxzo0hQ=;
 b=FNaWMMWg9EEJlzL4QoYBo8GOe4MInQRrUEy6tAwov6cxhCijrGE9tHRix8a5bPQk6au4xebYeFJy0prhuxxp6DSkw3tGSiOtm/rcQSJQdPiGi9nLe8COsPlMN4zMQ89y3dgRl5eySp8KcxM3u1pZHyLjeGDHtTF37qRKib3zAI03F55BHH0QtSLYc5CHgn9d1UQIU1iengRPl1z1LLs9tbYqUlyL4pOTS16h7BiuiN9YyWTFiqQCPeaSp553IYYGxDx9wIno4LkqjcoIZ8Ck7vcer9NbOWDEWQSipCUzM1XgTvBg4aQf4PpI18IdGtmWj/STr2ZnCqq4Sx0vvCTLmg==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 12:43:21 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::cf12:a39:173d:7df0]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::cf12:a39:173d:7df0%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 12:43:21 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>, Adam Borowski <kilobyte@angband.pl>
CC:     Khalil Blaiech <kblaiech@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
Thread-Topic: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
Thread-Index: AQHY5RhmoKgZ/4UfPEGEzMx/b4RuGK4YysUg
Date:   Fri, 21 Oct 2022 12:43:21 +0000
Message-ID: <CH2PR12MB3895DCAC7DEF7085633C51C9D72D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
 <S229897AbiJTWqk/20221020224640Z+957@vger.kernel.org>
 <Y1I/hRG9XGTFDTr3@shikoro>
In-Reply-To: <Y1I/hRG9XGTFDTr3@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|SA0PR12MB4397:EE_
x-ms-office365-filtering-correlation-id: c32e4ffa-9fca-4c00-6a69-08dab361d60f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ffVBcjeOaeU9jyK3nxDRmdFZd7YJ+GcvsjHZl7Dcfu+t0pRV8b7UUt2ctnO8/XiOwCZ4UAmmGpXMwD/yKJFRw1qnBkigd6VbLjD5K3gGpBgJsJlBwT11iYv9q9b8VND0MDeaYmZYDJjLFZviCkxqNzDx6r2G3f1/Da3cUPOV85Sonf6FMWWlJ383lQVM7FtX5l/QcMZzdz/4D2qqJmR6AEdrWvGBIpaDzTTqfHylfdlxmRyzja5CAPLIFcOR8ZaNGLIl0K05fWiJGjgMgKDHoR2NNPxHUAVzozr+QyPgjagLevERtUeDk+2EUdF6ULJxAF+UtwXLW5cwo2SLSilk+YaGnVA/A3MoNF0oQWYFvxvgxrfp7Q/dvl15FPArpbRwI+nhYZNG34ldh5aYMviBTHhnNBlt5noU0nCwtIEc0K5NTf9Od6UzrFdtQQ4nsrkjZxakZRtqUeT6BfZWNX/AxMTvj5mGFXvdOWY8jp/TSTTHlly0AjxWmozQGMCzLaDiqbk/fPdtlNGQ+BWW5nwnsuCwSocyNtgjMKaCBLqipq3KCPy5nlZZ/gihZpM1BZjSm3eCwmJEeq0sJr0UQfgegybxHj1hN8TVp6y0fTQBx3DmD5ESqo0UasOf/gRJLvI9GNZHX8YsTDLhZJNG+GjSZKIrtDR74sH1Hl+UdK7SZqFyaadirgjzeTGobBj7qYjzVkod5n+c1N3OPYdN3KFmBY/X5SGDTj3tGvfF5pHCJDuGH5qv4fxki4vIa8MVpOdUg9l+PM3kZWZhfsn2/hdog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(2906002)(5660300002)(55016003)(38070700005)(52536014)(33656002)(41300700001)(4326008)(66946007)(66556008)(8676002)(66476007)(76116006)(8936002)(110136005)(4744005)(66446008)(54906003)(316002)(64756008)(9686003)(26005)(83380400001)(53546011)(6506007)(7696005)(186003)(38100700002)(71200400001)(122000001)(86362001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BBl3ogTXF4XTnqhV1XW7fzrneijEhm1vgFFB3QBRYpABKOi52NwcezblIXxq?=
 =?us-ascii?Q?Zx9X0ju5Pr33j6uFtVBgIOUd1sEXijYgo7DXh3LBQ9D/cnHgsisFTLOR3yhs?=
 =?us-ascii?Q?GGsXs2IBSwyz5Osx14LZ+b2tQ1WgAcvDTu7Sn0vmTCZAHZ+64aXmhUNgWlfg?=
 =?us-ascii?Q?IZT4p29dQ9IgLOsTiBF49wn0kjX2Q68lK8ayR24ztdBItiswK/x0med8Lt4M?=
 =?us-ascii?Q?mtCTyhefvYWkZNE80kDiOnwuayUQE2LI0stk1BuwVGlHOhD4AzzcsaydpEsx?=
 =?us-ascii?Q?n9iO+Wfa4IQVsNfs6wwDyd7vFNKQ0fnnseJ2ALRJLNjol6/6GYVodCTpwZbE?=
 =?us-ascii?Q?iJ2efxX2Ixpnrw0xPLZO2zOA7kRX+1Qctsg2DIH+n6gzdpPvH+goC0zfhGY+?=
 =?us-ascii?Q?T/RMiBpqZdr4K7QyoLI+w06F4jzbF8L1u6F1pYhL1iywGdbwtuNlb/VqVlWz?=
 =?us-ascii?Q?Mj6wp0ILs4ifGIVqvBVZ6lonRvJMS8kmyOEZt8uXUGtQBqLIzKxBSq+PmclM?=
 =?us-ascii?Q?YHNtBWcxPHfE23nazLgRuUc0S5zf7V4ALAh9CjbPy/AFqRjYQqrHQxR3zEOs?=
 =?us-ascii?Q?tp/rXF9noG278g1aov7IDHvs0Baeo4TH4bS0zoQAXEphqhQ0cFSgk6YAld2W?=
 =?us-ascii?Q?QY3zDS/YbX006a/vPOB9qfcLZbNoE6eDY39wH0DfBEiIzuPd7TRYq5lKFmuS?=
 =?us-ascii?Q?GzxFBKrY7dXITFOTm+LdMpWZvraGAjOrgezbMkcx8ehoKtZUSxi2H7Z395tF?=
 =?us-ascii?Q?ilH8vmw8Et+DFHKDSqAYgl4qlHGY7DPNzg4DPCcpObf7VDKbGpowCLcd0Vn7?=
 =?us-ascii?Q?eoiabJAEFvHDIoIXJeFkUJKqgDwfEicLJvMZ916qkEJAOf9+TxbOlQFbQyt4?=
 =?us-ascii?Q?QeZjXOr0GZCL5NJYShPeR0Ree9rrVilmWtJiyEtIrFVQrDCePgNzgzggZA2N?=
 =?us-ascii?Q?HQKrRZVXznpvSEPBMqPlJwOZIKto1MHYY1JVz19P3pzUSP24XGAyqf+wGbX2?=
 =?us-ascii?Q?61EFwzzBdwiq7fDYrsYfq9+2Nlc6JPYY9MvwkMnwWRYXPk3lp7mG0bwhhEzw?=
 =?us-ascii?Q?CoG9RdM0/nP9h6w6J1i9syfVxhFebXVs4vUSKtyY99cQdRG1f4TXlQd8WD82?=
 =?us-ascii?Q?PybGAwuPoKB6EG+WYC+hMxI2yN3edotxOtqydCHxWc1ywHTBv4muY5jBsttL?=
 =?us-ascii?Q?DYGClQ5XBuTuOabnAdqihsw8SjfGtyTcETbOPjyDSHuWP74N2Ez4bhb5/A4Z?=
 =?us-ascii?Q?pO5pxsTV4cLOPivt2rEdV95YJZFaTapCyQVArnt6jPxWLBzZnkHWAlx2y/Y6?=
 =?us-ascii?Q?nVB11TUYFsj/thS1m2Ob75OV8UhsQT72elVCRpPQqa2NQNhUNSu/Su9dPN38?=
 =?us-ascii?Q?i49Vm6y4QBNsJGXVwsEMgaiVq9N8JOolJK2odBr+A2Zzcf0lTOH5W1fi5DG7?=
 =?us-ascii?Q?G02Hb3ViV4JgwkPMoJCxBRkyWpdCNiya0HpLAiXgyoZkm1DdBKf+reEZXM7Z?=
 =?us-ascii?Q?GGlC18IM8r2y2eMPPVgVl717ebU6k4AE7X83e3hAr/IhP/A8Ab27uzP7se/m?=
 =?us-ascii?Q?pHQwSj6J/19VRZGfAFk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32e4ffa-9fca-4c00-6a69-08dab361d60f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 12:43:21.0724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYKUySAgNKRHRRgX57FLd4KqBPa5n8e+7tVd7WT9IGPG3ixywOUG6+F9y8bxPYGCBpvEs5CRGuR3pOnviJb4pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

LGTM. Thanks Wolfram!
Acked-By: Asmaa Mnebhi <asmaa@nvidia.com>

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>=20
Sent: Friday, October 21, 2022 2:43 AM
To: Adam Borowski <kilobyte@angband.pl>
Cc: Khalil Blaiech <kblaiech@nvidia.com>; Asmaa Mnebhi <asmaa@nvidia.com>; =
linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage

On Mon, Oct 10, 2022 at 08:33:51PM +0200, Adam Borowski wrote:
> This fixes maybe_unused warnings/errors.
>=20
> According to a comment during device tree removal, only ACPI is=20
> supported, thus let's actually require it.
>=20
> Fixes: be18c5ede25da39a0eda541f6de3620a30cf731f
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

Applied to for-current, thanks!

@Asmaa, @Khalil: normally, I will not skip the driver maintainer's ack but =
wait for it. I'd like to make an exception this time because I don't want t=
o get another dozen of patches fixing this build warning. Since Asmaa alrea=
dy acked a similar patch, I hope this is okay with you.

