Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7215F760CF9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 10:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbjGYI2V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 04:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbjGYI14 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 04:27:56 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2084.outbound.protection.outlook.com [40.107.15.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B8C19AA;
        Tue, 25 Jul 2023 01:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NalaYTYlQF+vlPr9pWia7Dracu3yWIhcx2eD9n3N2fMkDO5+O1vC2kbdnz/LOAVooq5Wm7G8co5xoo4Flp7B9M68fg4iJhQsALDU+G5h5EV9kYpaOpMvR5dwQIpwsG2hXVMU9qYq6/tjN2iFipbagi+5NPZWA8xU/PtDN6OdGhKnccOtbvDl26HsH9MnM3R//aVCPp23iUy6+H9zbSce+wC49IsWXF446szN2yqsF6AEXYfVNvmVQzP/qZgZ8Zy2ANu4cmBesTzePj0FKot4tBXc+653Hu9FwPcQb4Qg5xefl9flH1YggddzF7uoQfIk4AvWbYaQGdyR1t0ZWEYBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MASy28P65nW4G7EzP2hrljzZyEeURzZY/LnNHvWd+dg=;
 b=kDy3JCslaJ5k29JJ01sPF7rNrxqiz6+rL+vrCMZ72dBAyVZ7wWfQI2Lg0G1cDt9MGnCLlnDYkMleuiC+MYJDfD9uEkI65p1EOmQZ6I/ZeKucYJ5daQC82FVrt1AYS5Xg738iuALLj2q3LJ/VScGE7CX739pdZp0xpNF2niRXQ6QNuaP0LqRGpEDqv650i66dKxbfouBFLdGUI9vCW4tLc5jOz2AfFe8/LDQ2yVerJQCSW/XDqvcgHOhWb1+1TxYx34ufqgeBqf2Y5fRDOlb987AdyJvhfUGgBUw910Ppo72iV9OIAOrHo0VpEJAqgll3n5RcsNjHsqDddVqC6brJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MASy28P65nW4G7EzP2hrljzZyEeURzZY/LnNHvWd+dg=;
 b=Bym56tEk3oMj2PdNghhnrhnZ6dl2QDf07VX7dvInDUe5vSTkdv/oTYDaH98qgy2pG6LLpHPdXaw7sVaYHInXzotkCuPPngmnXuF1ED3RcpfdeXbom1iRtCYWmCzT0R5dTi/wZu0ZB2S3MrfmIqU/p+9xgEML65MZXkJZeqFlkbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AS8PR04MB8562.eurprd04.prod.outlook.com (2603:10a6:20b:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 08:27:33 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 08:27:33 +0000
From:   carlos.song@nxp.com
To:     u.kleine-koenig@pengutronix.de, andi.shyti@kernel.org,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't work
Date:   Tue, 25 Jul 2023 16:31:17 +0800
Message-Id: <20230725083117.2745327-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1e4165-69a5-43b8-2273-08db8ce8fe45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C75De7JSSin1TW84cI8TPkbf6UqT1G5UbFFNeL34xgUbf6/WUxp8rJzrGymc/CLm05jcy3ZMGNjrO1r47aA2ExKK7ONhfDinyfmPbXatXj5MG37TOPAyxuig/S/GgkYi8p4BBcG4JqI83I4MWhOIwD+1IZ72x7oC3tEI5B2vSKf68AL77j9P16vSGpkBgttB0BLH/PNsztzpFBj77rA06a+nNg7vo0frkwKzzCZBv3vWN5RvPWEfkOxCfBpT8iY3CjhwyNamDAwStwi/LX0XLSfxalnnsDULHqCOFOE+pnprBq/alBu9TgrMpEYZNn0KgrdmBzb9tHjYOgbysM3ApVyDFUJQ/fzb0bUdc3x4jLtMKo6Pd0Ms0zlXPBfYzT02CAIGmK9lN/v6xXkPXVOMGNALvbaAxJRQpQEXzdFHjv6focrBH7zImEkt3/690CJvfgpnA+CMyhtzr8XeT9frFXiqOc6l6pTLGaRVPxJP6yeYdCrFVcqagxRd3btThxNgd+q/U7m0o7LtTBQ29xKB4OWyh7QV6hKRV6rvYdvZumqM6qI8jLJ8HXHEKRDz+KTah7UA1Esk182HMBHPZo7UnIQ1UIhtUjwwUYUZhvEthoHO5WhNvcLWuo3PTEi+x6G6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(4744005)(2906002)(1076003)(26005)(6506007)(186003)(4326008)(38350700002)(38100700002)(2616005)(83380400001)(41300700001)(5660300002)(66946007)(316002)(66476007)(66556008)(8676002)(8936002)(36756003)(52116002)(86362001)(6512007)(478600001)(6486002)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZwaZWpRFVRlXQKHtDOmnnqSHu2j8vboRVFnQJS4eLyLZSCIzWi0evPiNY+gr?=
 =?us-ascii?Q?CZFtTF0XD4VcAOvTLeWFis9Kttj8bQ2zelHSQxs/Hv4zwWohzTT8SV8irhd5?=
 =?us-ascii?Q?EJzwFIX7r9IaF9BhSfCIh60CkMf9gp9JqQ65Wc9l7O4Oc/mynoneDzrYPEP6?=
 =?us-ascii?Q?j1vpJ+1bKJ55505I9nGuewwpmNmE62y+x06Qe/TQQMtRx0PnbbWzxE42QhoE?=
 =?us-ascii?Q?MdRxEc8mUqAvA6vIdjEP976ndtxI/RwF3XhAuGAUm1pYT/PgcoLRW8/LC7LV?=
 =?us-ascii?Q?m/MZ+L/b+y9foBc3omiIDNCk3y1zEntL9BwrdfC0sYDh3mq/zA2dCvQNzlFf?=
 =?us-ascii?Q?Ja06IttwAg64b4LzyEcVMKvJBTdHzWN/Xan+7NEx3VKJ3fl7bSjB4vpXsDWR?=
 =?us-ascii?Q?QiADXAoiXGM0tzsWKtko3xtWYDD18ZCvNxLricYeJOnyG/VTzjLcpxroXF7V?=
 =?us-ascii?Q?vldPei7KsbfcmCj/A1UiS+MxTiwJRgw8JotMjsrax47UCuRwfMKwPKTlKqd3?=
 =?us-ascii?Q?YIoBiDSbdCaydg8EJDvhgx5VoQSfy4jw4SqUOEXy0ulUTbLYTqN+HoWTmW7o?=
 =?us-ascii?Q?EcdgxiUmd9usOFvLON/7Us2ZXp7d5JQMJYGDQFuc+RXIwQvyeGKPVJ1DdKKv?=
 =?us-ascii?Q?ROqs+OzMUnkJjQyBB6s8QYUPmPRpstLF5IddM2TMUL7ojeD+OWGLtmJlM6/L?=
 =?us-ascii?Q?YFv1WcXtR6Dw0gHiF9TvZ9pUXOYvU+hbt9FPxXlHW0m4JrAA+lkZjP2KoCr7?=
 =?us-ascii?Q?O+Ye5ZzbvFYRvrvLhO4znGYYeqPhT0Qaot1USVvi6Wg1ZKGJ09JP7LePrNWk?=
 =?us-ascii?Q?hEHTE5Oqh9j7bT8tvINKQTwlc3LoaD+fWvN3i+pQ9xsfAgrZFd2zi9CsVifX?=
 =?us-ascii?Q?dH6Ru6KpMMbhMIhfT8Z6CNTRto5SC+AB/gutyolqnitboplpNgSUUlNZCYVY?=
 =?us-ascii?Q?s5A0Aj6t6y8oJD0NCphS/AELJrSmJTHBFGInjjMpv+bFx2LHuY9VGKgztzPj?=
 =?us-ascii?Q?jkm7lMCNsM0yOD/tg27PudmDavJmH0rcaZGgOL0d7jeP3woo+wiRK0s3T0gm?=
 =?us-ascii?Q?vAwpVZFpe9OkH+zZlpCuQ2kKhjpDcfpw0IPTMhTxjluE1mUKLwzfTFHM12Lc?=
 =?us-ascii?Q?r92yzPFopHYOTWWsav8vliPlJslFMI5FXJXF7Tb03XpoBpA8SUIdfOSbxqAV?=
 =?us-ascii?Q?wK2mxjW8Pprm101BYYXaPrJckKKAmQpqv6LUu4FZG+ea3YGgjD+L8UWnPExU?=
 =?us-ascii?Q?VvcbAqzInJxF4pCTv0u7USdcKPyQuofKtkyQmJ5ogNlu12xBlzaWazEZUi/6?=
 =?us-ascii?Q?Nse0bpuX73rnIuqvKImpVg90hiKWfEmGzA+sGZUhingOjCTTOw+fTmiH6cFm?=
 =?us-ascii?Q?betgYz1d+Mc0PJ3QDgF3h9W2OzxgD54rUKh/1FPiA1sB2W63RhCdrbL5+6k4?=
 =?us-ascii?Q?UvD2t+9Zn6q5s/Miuv3vGb4c0S1igSVcSvQGOy6FXZubxd4gMiUuCs06CbK3?=
 =?us-ascii?Q?ylCPlXKDOV8TVXtmFLlox4kYD9FTcaGiNx9heAIAH2axvY1uAACi9vY9Y4bE?=
 =?us-ascii?Q?YI6uzqFnMT88e4iy4hV5mEdn+bYHJildi189dy34?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1e4165-69a5-43b8-2273-08db8ce8fe45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 08:27:33.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdXnR2YREnVtJu5PL1UuSHX5on99GJGkFAglZIl8TCoool0v0EAnjpWpNv8gViVC0Z+4zjHREJbny1v7wo/omA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

When i2c peripheral clk rate is 0 directly return -EINVAL.

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes for V2:
- adjust the subject from "debug message" to "error message"
Changes for V3:
- remove output error log when i2c peripheral clk doesn't work
- adjust commit log and subject
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c3287c887c6f..150d923ca7f1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -209,6 +209,9 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!clk_rate)
+		return -EINVAL;
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.34.1

