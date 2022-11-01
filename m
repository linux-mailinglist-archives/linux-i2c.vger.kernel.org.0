Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900C1615446
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 22:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiKAVbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 17:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiKAVbt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 17:31:49 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2099.outbound.protection.outlook.com [40.92.21.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FFC1DDC8;
        Tue,  1 Nov 2022 14:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWIHfKLa6S6IgylREMSFZcEck4FtQequShhG+ObnukAfrMvLz3fTvjG9HSuaLNleMtFXckz+uwSxcqRKBiGi9/epg12ZSPtSeuHwDgwGDA3gNnpzWicbRi5ZfzOxHviwcyRRoBdM6G/9sah5O/O0EewM3EPg8tNB89ob2EAzfY7AhqhGq6zN9E5Ewk1MmfIZtSU+4CO3f7aFJIIBtCtHA4e3A9j+rJ+ySWKRDRJzHocDgmrsurrZd0cT1wx/Y3fRgM5Oi/6RM173Nrll8A9UQlgoWNDpepX0ApsQCD50jA/q77/BisnFMDXdJoJBEdpjSmMXzRF5W0azuJr0zIL55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsniODT6HUMwXBD11Bqaq/Udi8DypbsImK+5q/xkHXE=;
 b=ocBkIOVDRjffzOmCij8kLp1AR8XFgYz2sy5OG9o9+em/8A8JDElRDevDKrrYQkO45WxfCMf7Awc6X4Fi/O1+B6LjY3T20sqPtB/ee3TwpgMCnXo82NOkp3VxWjSTubXOBFQMr4mR1jBpljopzwDP2SY3Gw2fWLkJ1zJAXNUrFc9YJ+i70LpF9wqpOQsWbQC/ECoRxKoWA26Qmov3us859FTs+F1nVGV4hSSdTnNS24VXBJNfLQw7+TU8RCtbMoGO/L+Fucqf386CfJgYldF5y9b/ZJLQreF7xXr4ypGrDmZSiO64YuYtAC3rq0u6ngoeHtJ0wZ/rQRifRhDgVQir8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsniODT6HUMwXBD11Bqaq/Udi8DypbsImK+5q/xkHXE=;
 b=A7ur/Iy18iyQaiAvOjWdRnwpqdwGomuzDr+s/n8C692/3qAbdwx3fB2GCA25h9sOifZdP47aCxlK1zhuPA3wzq3mFF39zL8gBpu0HOFwHyIGw8FB++zDbX64zmEmmvDy02UlnZzEyQrpeTz3ivXlhm+NmpfPcjajp8xZM39eLjzSE2JYjyr0N5pruvqRoYjdyNe0f7tu2zLT3kEssmELI8s3WY3Tm2ssB/DWeqIUUi4D/S9g5Gq3yg6A5AdCz97LV85tWIAR8bW6zPyjrJTCr/2NJR6myBa1SbUu2m/ts1N/q2C4bb9uL3/q6myx0mCfEJGJgrph9QfcPF9r1pIS9w==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 SN6PR01MB4992.prod.exchangelabs.com (2603:10b6:805:bf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Tue, 1 Nov 2022 21:31:46 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::bc9a:11a8:3923:da92]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::bc9a:11a8:3923:da92%4]) with mapi id 15.20.5746.028; Tue, 1 Nov 2022
 21:31:46 +0000
From:   Arminder Singh <arminders208@outlook.com>
To:     wsa@kernel.org
Cc:     alyssa@rosenzweig.io, arminders208@outlook.com,
        asahi@lists.linux.dev, christophe.leroy@csgroup.eu,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        marcan@marcan.st, mpe@ellerman.id.au, npiggin@gmail.com,
        sven@svenpeter.dev
Subject: Re: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Date:   Tue,  1 Nov 2022 16:02:49 -0400
Message-ID: <MN2PR01MB5358655F098289AC079B79AA9F369@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Y2EWvokvkixLucg+@shikoro>
References: <Y2EWvokvkixLucg+@shikoro>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [dsFzYV4AxPXhhCmRqIzB6xUMLQkh0Dyf]
X-ClientProxiedBy: BLAPR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:208:329::28) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID: <20221101200249.9245-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5358:EE_|SN6PR01MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d8d456-e687-4567-4f4a-08dabc507979
X-MS-Exchange-SLBlob-MailProps: C/ir7cSdGlvk4pZpP26KJA3QdiG3+ltOBuKWVhnZ53d2Xg+RZ+OUWlfxUTbsO2ugAWgI7I2X3fD+fnFghTqxl+8e8C6VdHFgDQyDv7fo/SLS0BxjOv7hKMtilDmQSM8HeY9jlayrOpGRBFQHllxY58n3Z/3K0QO2ntfOlTQTVgrPrY5sXXBn3SOjJelGmggwkZzpXrzp97/USx2ufUceULrv36XiK6ehRV8OC44IWYBFemU/fj4SpnU/5zXTPv2DVczI3RG9yEprlP8/NEFpIKbXEibowpdG7tDHDvGwWMwbJnAWyQQRSqgTHidUAQMwerPJWnvYIkbRdD7cYaTMx3w/4Wkdx+cm/1Fdo0cDrEp2qckmBvBTQG03R+xMq7vN0ISubUQ11AOAzn3WTFdd6FNLF42X8k5oD96AGdO64jQSHnlyNTzHTEQ7vScmquaD8eu4RYwefdxz44HGr2bOkiOi4gTcu69/3yW0dydM45tkHDsqdm3EA8uE0SrSVqm6aKGLtlyoT8AWgvr8mwIyqisRqxn+VBZtRWZEaQPRsHNtsojb9iWKs9f3tC48cKsgZiHlDbo0atODz0bjm5XODGk8x5m+ca/ABSrmntKcnQXdBNlVffonnp7dJtN/uGWQzMU8V3lp8OVKBauhOZPAS0Q45mvNNJP/1GGKNTvgt4dVEeInOceIHDd1rbNjVf9SJK1N8L/3EFx5Qxx9dhZHsnGAv48ynXk46IkTO0jXWGnfpByDMyjrwDhMcwyIMXvg
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xole5h3uwmMTBQXhhfxd8Ie1NxOez1W/kVA7LayLvyRY+CL5toM3a/CGMGN9WvoghGbI+Aebuvcgr7EGNJvxGypM5oSDYrOo+bDGgzkaulT/+3GCxX/78+WVUjpx0NEtdHwuInBlWXDnt7WtOujs8zd/A5s33zYi03TB7KpdC5hgIKzMMp6RK0CrCQQxlYpLCVU/J2mRyACJBJXcXIBwmX0rZg6lP4Fw1kaPkUhYET6HwwXhUHyQELf2cQfWlwkTQEtp34W5Cui8TAmLz6a6EAs4rfH35J8/YghcPXAv8JuCq5K6rUUjpf4dhnNob4gmtUlX3CQx6+p8HOODezwQP/1H64gkYfcgK1FsM3OzykspHAlfFKktnd0h/H1dkplu592pVVcCEWOQv3hJ5+i9T8U0Ne47OarNa1O6Nh/BULhwBJFiVSdpCTf4IwBHNUXPknVxABBLAaKW39nELKix5OXwn8wh/rA0kjlX5uiAe0k37jLUxTAX/9kE1AELORN9ozwLqp6uQtlXwpFBoLrSWZLAZ8Q6AshDfLtIh0x3CUDGgfkqRT2g9tWAZLXQNfAD95RTSeOqwarcwzhNAV9XMUuMO+laDxn3/os2c3lCU4B4caF/qEOnz/oyLBlyKqAaioeAAVMacD9P1Uo4P9xTTacHejaUsAze4+qXN/eDyaI0SrkVkVCmOv4ZL7mb8ezns1uKfrUuluIZfd8oFH87EX0TZCaCk7+mErSGsjDB1iA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oiS+82nQociX7o9ZqYYz+elbHvuphRRDUTP7Mm1kFk7ZNc4XZkAeSGB3xv3z?=
 =?us-ascii?Q?Miukx5RQ7Hbks7FwiYyb0N8XtDaoH7Ai3qbZsTdUh2EKbFuQQqLTV5e8jRo3?=
 =?us-ascii?Q?cHazTXQSsuD+VTvRzUn5YZp8j2BQ7Xr6q/+NwiTud+MhW8uux2dhkdI5ZyT+?=
 =?us-ascii?Q?HwnPJr2QmjGRsjcSo6J/lptGDfRiuaWdNjIrX1bzaHjMLv8mFxz0BtavwMZ2?=
 =?us-ascii?Q?slbRxBkwe9I2uZ8OqcNGvl5CT/JptF2UzfHuWEF+3Z5XF/8bhkEnOKU/uo4X?=
 =?us-ascii?Q?eoIpUlXgP+X367rXLfVqRn1VvkgMGnNGAJS8WXFtmGWJBvxafcms69uTzXnn?=
 =?us-ascii?Q?8xM/xzvkZgWjvgB7mJU4/FHT9j5u8afsrao5h8a4MJYU6gj212bUrduF+kUK?=
 =?us-ascii?Q?kQrZfoc2OKTAk5KkXaMm2vlX54+1K9gfZYkyXu7T98R0oEoDA+6kSRLQWOrF?=
 =?us-ascii?Q?cdh67iqojEfhvsPeZUt0gfDS+X2hz7Ni4f5s+ePrN3Da7NTXFuq0g0wfW4xg?=
 =?us-ascii?Q?V32a+7P44kPY+Zw8DQB6mfZaPPYr+YVwg6txA49O7/LpU8B2nSh0TMozcpTI?=
 =?us-ascii?Q?HZuDNzBo9VZviKzGIkksYbX+Hyfpg/YtoFR0EvWv9Nnvnn29rQIJtQAUIZyV?=
 =?us-ascii?Q?rZh5LFrrg9S4EgNKYhCk85VwCoouPkudeMZSPglWkNCws7j8Qmo6BAmLWFe+?=
 =?us-ascii?Q?fp7sKfOTs+Gm5nDeO/0pEhI4NYvf1SGmOGAlKoTH7/tZee1wt5084qVqW/6O?=
 =?us-ascii?Q?Io3tet1jLAvsEKPV2QCSZlVaWIOK0WyuHMDliKqF+7JC9h2EpgTDVvch/ofG?=
 =?us-ascii?Q?FEc8eC3hJJY8s0b9pTH2NrPPjIL38S7GZvwy9POTZJFKMhaqbJ4cSPYTraLW?=
 =?us-ascii?Q?hgVbvPEHBpGdzmU2PxXAGrwV+QdsJYq/X9s6o9gGRHiobo4hR38AB+Ol41Kh?=
 =?us-ascii?Q?7hO6DOLDbqvYr9XQV/sn2S7JQZLrPmSk4dN6aQwk6E/Y4hDEMk/j3aXCCVuq?=
 =?us-ascii?Q?poiemRZdRMDMvFVltUBXK7GgOl/sLYY24hU45mOd3o3GJBGQViN27Oqq15bL?=
 =?us-ascii?Q?sfNpWK/xeI2bKz+tlRPo3wp9x4WgQV/KOPKTPfKvm9T2bvH3rkqItJc3/eOQ?=
 =?us-ascii?Q?maJYr+x0KOT4/ZP9MjBqsF3UG5YME05fneMg5q7IJRAuvAc1gaSnGcQrQBli?=
 =?us-ascii?Q?0CZv5mDHLfSNG53KSstJ60n9qH/svspDD6b2jGDuGK/AltpqexCr/ct2XF0f?=
 =?us-ascii?Q?2ni42rVxLtaYaFBlFXybKYp9cCS7T/9bCe9ZGJASlg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d8d456-e687-4567-4f4a-08dabc507979
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 21:31:46.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4992
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't worry I have not forgotten about the patch! I am working on a v4,
however I just got pretty busy with real life things so I ended up putting
this aside for a bit. v4 of the patch should be ready by the end of the 
week assuming everything goes well.

Thanks,
Arminder
