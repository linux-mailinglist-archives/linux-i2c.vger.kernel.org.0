Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C2559891B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344888AbiHRQlU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344861AbiHRQlT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:41:19 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72B9C04D8;
        Thu, 18 Aug 2022 09:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gF/XG9K8Fg8o+fk5Sum/HphYbNpe3cqCtVXcX6IutIQPIkhZSbAbNHopp0rJVPboR8X/BBh7zIJc+YZ0DbfMtMw6aIgsNBD6WSmur/Rbxd5kbMrwyFm/qgVYPUQJAFUkppO9L3ESerEf52S+CSa8mFD+G8JgJppkW41qSouk8umRld4kFaRpbOalhlZM6sKV5r/lhGdBgZ7tqy1TbhZPn0U+dbrVHrMsxjGoaC9ltsW/bjF28pqpxPrRx+1cUQ1ROmi444nk6YF/1GFHxwXapvX4ZkEBGfJ6REScVaThEKvUYf3+/f1J/4/u80Mb00af5EyLvHc/9YN5eDNpaAl90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKsQOoB3nLjgQjaXYKMpMGWx89dahlxVddKvurm0SR8=;
 b=Iw6bLxl0QZkzRO54clgaeqEMvLlssGrDG1YRMo5JsMq1n9drBoAgWOX9c2nY0V+/nR7MXXIUO5L+jhpGmchofqJqazTf7saLM0PH3BaoDS1YuiOLrmThWZQQW/nQvMFiYhT/hs/srvIsNAGLdk6dQn+T+NMCN9Ulc6+IrcNxdhqu+hPduetoBFPbAdp/H5UWiBLoZnR8ZTvk+J3SeUzMxDIJxYtN5rAOR1ds/uv/rmpPs08XTHaQ++DkXDNANPrgi4JEHtM5wKHgfLd4atJP87tWGRFTuWCVjtJ47uNCg0bj0QIRM56X9lJ6PCQGWWBleJIiWZ3Ql7e2IHsA/9KqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKsQOoB3nLjgQjaXYKMpMGWx89dahlxVddKvurm0SR8=;
 b=qFk+4CdauITK1aZFpyHeuF2SG2uWz1DWWqrlRL/6wGUC5SK85IVSOUsiOWYW4U23n/HKkUIof4aseNZqOktUB5hwYz4lNUnvr3xgxvef4NaBGxEBuEbihDMCxjNkIl8GzKEU8U7H2P+5keYnsVQ/YFXtKX+gNMbcCL2Om2RLh3zyx+90OVlxS62zLT+zl/zak/iXqFPwMNw2YN1nPkD+9KJg4O/YVyj2XFPpnAK3uX7w0YeUr7wWgs/N4hey4a+TB/uAYpnYo8OtL9DBtCp6Qmk9JXr+XISmRn/wpccj4aU08jFdbINxze78LjtYNkKQ8YDii05yVShKYniTRGCQ/w==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by MN2PR12MB3981.namprd12.prod.outlook.com (2603:10b6:208:165::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 16:41:12 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5525.017; Thu, 18 Aug 2022
 16:41:12 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v1 3/7] i2c-mlxbf: add multi slave functionality
Thread-Topic: [PATCH v1 3/7] i2c-mlxbf: add multi slave functionality
Thread-Index: AQHYscMrHymxVB5XaEeo3ffpS0GiMq202tkAgAAEMmA=
Date:   Thu, 18 Aug 2022 16:41:12 +0000
Message-ID: <CH2PR12MB38951C2E2A1BED034B449A5FD76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-4-asmaa@nvidia.com>
 <20220818162554.qfzt34v3hddy3htf@the-dreams.de>
In-Reply-To: <20220818162554.qfzt34v3hddy3htf@the-dreams.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76bd1d41-85c3-4365-f806-08da8138763d
x-ms-traffictypediagnostic: MN2PR12MB3981:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FtFAPjsHZwGuMdTrhHSTtyXm0Hm2yWRjQ8k/BAA4KKri2K3vUz05+eFvdvza9tAvEmmcbbHqy/vAni44rpmp6jtuJ58xlRZdO2WDPNUm+DiDDL+qyJMFBOp2nWT5cd7pNRI0ZjG9R11iVA8OoAW0n+x8g3uvPfatbAQdVQ35vRB15bebxbUe8mEOYUr3nDJ7MELfvS3/kIaSKgaosLIsfGXXr58GRUSlmrWHja2S7XArJWyFiImWWwjDbJ7gWUZhIKbg1VOF7tjq80GZwSptIMEZcceXgubAle0wC0vW3TYx7ehuyTFpdKu5FafBuAYMFrgHWL/KbF2Gs3mEft1jpJrCaqKNEXtJ/ywsapvvBEIHKTb4IlVmc/O05lu93ieJwqF3orUmfLHMOBOWml4lZzNHJI+2SdEnb8U5vn2WQhqUrkxmjYB9CBq6A7bQkTgXPAm+s25oHsDkwbRUpvi1OLm1gx6a5HTgeWdja7zJxTCIyVM6jeDjSEvVoNKfSxMtDeWAJm077Q+ZvIzDQbFjyMMp0zfyLVhP0GESOi2UyTg+b93j7WUcyA5C1KLqH25VSCdEMjRMDJDvKDRWVCB89y3g7+v3hMdfZbIMCeT45FFvhieDxawSqxbA2JGTpT/gx9q79P3vDe42y7L1zAYEEZvZjEB9fkNZ1etbfS6LeGwe/UCBof1V0rZqbdSCN5yCfdLjTtzUK2BTU0tnHJznm9q3Z3/9sUzd/C5h9heHCD8k1DZck7pjxRNXUCx/OtNovOkRyyc2WYH2/j3MI8dZmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(186003)(9686003)(53546011)(86362001)(6506007)(7696005)(33656002)(26005)(38070700005)(38100700002)(122000001)(83380400001)(55016003)(71200400001)(41300700001)(5660300002)(4744005)(64756008)(52536014)(66946007)(66556008)(66476007)(2906002)(8936002)(4326008)(8676002)(66446008)(76116006)(6916009)(107886003)(316002)(54906003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nTbqMGvEoOe+//yoPvXzr6ja8jqd5FIFoQ0HArdoYBQ/y4Wb2wHYmU7Vo+HD?=
 =?us-ascii?Q?0NAx2590x+o9/Hy6eRhBtjNaBC7o3vNT293vTe4UUE32o90gW4pRUf6NJxfT?=
 =?us-ascii?Q?x6i6q1Y+jstW7okdXXWCa1TYlRXUSDNx+JBBwYkw7YCih5P8hz5CVpyy1HaN?=
 =?us-ascii?Q?fArCR3k1fCUOALklzStlVNag9JtAsPF2rbb2tpAVT6PRpwhaItpAkIuGZGoQ?=
 =?us-ascii?Q?RNgyvMBhGIIaYWUl98aR5X9zY4Nn5ghQulKaX+cRnnoNh4tBVrntnqTmIlif?=
 =?us-ascii?Q?DwMhxg8duASDf0+C1BbKFCDkcbYb3X+yHdJRy60P8Jsz4d1C29smt3lGAaLl?=
 =?us-ascii?Q?SH/uVpSkLmjDkjkqATy0Ea5lqEXMWgtHZs0MntBu2SwKF7tcvht4/dV+Q4l6?=
 =?us-ascii?Q?1Pp6bd/1yP1MUQEtZUBc/649WfcNFY/XevLnhm3Fgnpi3asj1v8OBis+ibCV?=
 =?us-ascii?Q?Wl74p3akiv5CShTgbirDucou//tUFuf1VU34/+pIhz1Fz2eo75sTD18Y+OD7?=
 =?us-ascii?Q?DUhNGyAHITOPF8oBox/UTi+wTvwRnY3B/RXx0H3xlpZYbfkl5Y4rDMohi8yC?=
 =?us-ascii?Q?iMlqVbBm7PJckOQj5LVii6CQfNu3ol27RjgWqjQoY1J1hfCVR3epvDyWRLet?=
 =?us-ascii?Q?x9bCAm6ddiW7C1dk4Pr+5kQzb+fVdxyXe/eBC6+7NG9Qv34iVg2ji5xCMFTB?=
 =?us-ascii?Q?m1l1pmfXlYIGv9nHx112w13Q3/AQHYWPbp8jefV1Y8WLRqcDbV57eWnOHDr1?=
 =?us-ascii?Q?FvBdECGZxzyIcZmb6WFQQkTuz7X52rVpp8rv/MKFfgVkjqD753bqtPTNYwvP?=
 =?us-ascii?Q?YLjLMmxbpXPvv2Y6HJvKdjRk2IwfqJojr4PzCAJuMkiBMk8cyO6MIwWrKcnv?=
 =?us-ascii?Q?hFrEQKi4jDrWmlqOuIYvLiMeMXNfP9+/x/gWoSWF/yL7J5v46Km3zfPk5ca6?=
 =?us-ascii?Q?28TSJgOgyog6vPXXqlTu2JlVLS1gEOQBWD1VfaM8XFOe/D4gI7rjm0MdcqbZ?=
 =?us-ascii?Q?8ggqLh/v/o5ftQVSCz4ynjyutmXiXsO+9wNGQc/laWwcgQZhwV4HNJTGp4if?=
 =?us-ascii?Q?TD2bE6RkCMbH51BKUYegyTDfLttBy7ipQty66a01ByiqjCEbkDvlr9lV2uBp?=
 =?us-ascii?Q?4u0ADoAT/+4HQr0HZyukR3zaHF87HSRS+ynU+ilezyp7zb/1hp/D8K2Zv8jG?=
 =?us-ascii?Q?q8jNW/yGn9JL8g4AgFbiyDHIFWWt+J1MagHKn9LralqInk3wvfUyr5kPhVV5?=
 =?us-ascii?Q?x2pPzla3a13wYUFXgd4GGmc1bGAApSMrzktiTp6unO3c3eTw1TkB5tcUFwtU?=
 =?us-ascii?Q?G40M3WT0a6aWzuqHw6VtQt3bG1x1DpK6mMNC5ocs5N6ABpSxv/0eu9KVRWTH?=
 =?us-ascii?Q?y9KcUsTWUpI6iv/xrJnxf9qhcJNXEpCaIGSVPVhaUZCdbF93y/Ckke6kEaC9?=
 =?us-ascii?Q?B4MjXkjGs7MqiZINtXMiux0+BNTtUTcNpC4xq65cOkBspuyW/vZnEL1An926?=
 =?us-ascii?Q?qLlbr27QbOZOtNPE0ccQifdDSCIEVMzr2gJbfl9ng19ulTbJ2prdQ6C02KbI?=
 =?us-ascii?Q?KBN9WflYQgUZwcL8l0A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bd1d41-85c3-4365-f806-08da8138763d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 16:41:12.8114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6d/0Bgic7bNYr2oSdkDUhR9SueZffmKWkzsWSdY33q1O5TenI+K73xMZorYtpaW13Ub5p1rlPO4RTzv0Ujelw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3981
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

Sounds good! I will have a separate patch for this.

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>=20
Sent: Thursday, August 18, 2022 12:26 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-i2c@vger.kernel.=
org; linux-kernel@vger.kernel.org; Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 3/7] i2c-mlxbf: add multi slave functionality


> +// SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause

This is a separate change, I'd say. Also...

>  MODULE_LICENSE("GPL v2");

... this has not been updated accordingly.

