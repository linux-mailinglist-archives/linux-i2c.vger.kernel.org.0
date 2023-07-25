Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30FC76050C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 04:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjGYCHd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 22:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGYCHc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 22:07:32 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D82710F0;
        Mon, 24 Jul 2023 19:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaLg52xxPabDDh+dvMzhOEnM7UHH88361RK9o0G4uiVCnY3EMdOwDA664Dv3T5xJnY5TMgw9/JjKM0S7a2jOxeOTWKlD3ej3vhIQcUaU+34ZRKt2iGz/EEBFHTbTxuLh3AXyvEiP+Ap2sbX+6JCr2OyQXqqBE5Q8Vmo1Ok+TmVOX5d1N5mCm20W88aZ3cqZ348xifOzI5DtmnEJ7r9kwDB70xj22AdugJhOFkRH5D0yMKrnyucjpLreOc5Khh2DdS0FD4OyNogOem8Q8KdwJx/Lab4m1hGItq4v54swiaFTS0vIasNAww9zq2ALTUv3vPDBv3qm36eXBTc2M7cFBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TmTaDcemBUDKWKS7+4xZtSWSU/KeNUm2eXDJCFsIkk=;
 b=fI/vygQ3kBwjKhu1JeNjSwh6JIpjg9mkqG/dkkmFP/B1yYCiqYMbx2R2r13J0cuC3ovKdf+3OX61A3ODofUPR3LnDOmxqUtW1lmmkIb416bqO0BhsWs0IiXCzewHJLpHQxPjAKABiEXP+VJbkP0saT9O5Dn/BkavZZcXfov1nN3oemtG3uHincWmYO37mIGHoktsl0q+X/j7T+gahNyQj5SGiGnH9D/+aUIOuOBYCx677Y6LASUEENVfEoEbf1j1N2asEl0gozk76TAa+plKyB0NcTFWci5v02aXAILjgZl9y+oU6ACeixNv2TKFkdhv2krG2wrUCNmnuHeps6Bocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TmTaDcemBUDKWKS7+4xZtSWSU/KeNUm2eXDJCFsIkk=;
 b=mb+GlkRJEdnMk7Um+C2zFaRR4wKyb5Fa3w0TG6G09nBe2RpPIjBQL14ljtd6XWp7BZMKNwwW4I1l/vktop3rX2xHXvu1CfE+3NPno2DXHY7uakXxG44tWqeyXPbxdmDHv+JakUK77ogV4U2+OTjWZa0nlA1VB+D5EhcDloTdrrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com (2603:10a6:10:1a::19)
 by DB9PR04MB9991.eurprd04.prod.outlook.com (2603:10a6:10:4c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 02:07:26 +0000
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::7274:5109:64c5:b49f]) by DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::7274:5109:64c5:b49f%3]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 02:07:26 +0000
From:   carlos.song@nxp.com
To:     festevam@gmail.com, andi.shyti@kernel.org, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: imx-lpi2c: add error message when i2c peripheral clk doesn't work
Date:   Tue, 25 Jul 2023 10:11:08 +0800
Message-Id: <20230725021108.1977494-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0167.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::23) To DB7PR04MB5003.eurprd04.prod.outlook.com
 (2603:10a6:10:1a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5003:EE_|DB9PR04MB9991:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c79d4dd-41cf-4d8a-9334-08db8cb3e490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASMk5A2s8FPxkpdY2v5hMGYBQ8e8hOmMCk02kA8B2nYB3KnIvXE6vwQQy9YGdUp7SttO0T7hnvp606tR+h9grMIxxtdkQuBtnHk0KOfGX+QULwTwUGWiTbZy0uFNf4J37fDwVHzyMwSawFaNBfnWPYKeSLlnamHdwneebHjQ2lYXrDwYa+HK1PsHyfVsN5JS/D2t9BpZNcUAQkuRnFo+sgXhjHDIksi2AwqNJALxVcnS0NY8IDxx2GzxqMJDrHEtj8mh10/iUhyB0FhENdVhj1cOnU6TvwwCMfF0KTfWn2QnUJGkAvbZTPkVpkZH2jCFbNlUSr37lWUmVNUxs4VRm76z8KiWVpjG4EBSUPOGLnV/CX4j9s6DrH8hTpxvKK/mpxG9D3tA1FWvXZbmbjpXJZeCGpy2xzPb2B+L9T+QCo8w7xxRuWtZzK3GUXSmEUacGulAhnPtlayeMoxXXPLcOhoe0mzWPiOnIHkl4jizbdil/pWwzw8CCylkUNRNOr93u/IP84AHoOJGcuIK1Huw30s99epKbdDcI65y46BPbDSfU/BUN+Esvi2qSbwVhtZRdrFWMOrz6HTynWfrrk+uBzro5r7Coxmj//qDoU3HEpFaLKJbJm36/MellbQgN+mJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5003.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(83380400001)(2906002)(38100700002)(38350700002)(2616005)(15650500001)(4744005)(6512007)(9686003)(41300700001)(316002)(6486002)(4326008)(66476007)(66556008)(66946007)(8936002)(52116002)(478600001)(86362001)(6666004)(8676002)(186003)(36756003)(1076003)(26005)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JoxqCoYPbj7sAVftlQ8X8CCjSA3XONQEbEGdGiPY4ZvwWG8LBFdr4ANLt+i2?=
 =?us-ascii?Q?JoeTZbN89/RhyJNKKNGBMHyZ8Gh1w2GOqknOFlsThqLqDoo/dH+Rmy5cBRmF?=
 =?us-ascii?Q?lVh2ySqGTEe4K7o+U7fmOyWUFcxSuYxytI7F6IVmstnqyW2Df78pao+vpK9F?=
 =?us-ascii?Q?S/Mp2vpgBczjfYnjTaZ0Jh8yiZpTcLDSvL7b5D0gR+DdF4hZw3VwsLOya5tB?=
 =?us-ascii?Q?49sitIuYpVv34fq6YF3WcuRoqYNSa3+1sqKMDaPd9NH6vxes+gc1MfU3VMn7?=
 =?us-ascii?Q?tqxBOzvf0wJ3LcjypHan6gDS9ahcFeaiZLia3/+gxe8ks3VyO30TV/DpVwVJ?=
 =?us-ascii?Q?KPv+Bj5OPY4MPkGgeAX+GPYZB9PNq1GwSWMuhtZEW+y6Fm6UcZicXqTjB4y0?=
 =?us-ascii?Q?oJ6a7sBZolCH52CxIZF6CIlG4XDTngQZcyb0K0uILWcTYBVrh1OAA2QSqAy2?=
 =?us-ascii?Q?bzJ7AZBvkrQL8mNeyomJujQ0XdNZf1WwPndBKDSyVZdXkFrVJQVIHi+yhPmY?=
 =?us-ascii?Q?904vF9ZWqI79iy7I7Lnw0trMee3972T1vCrcdyG1oh0HPegIppMFjxwteqxC?=
 =?us-ascii?Q?O0q352ddV805r5iXeDX5eMEbhc1ZgRnQa51A84kNsayswn81owwlhGBdWyUA?=
 =?us-ascii?Q?685fFJZJJH/9xwaXkgeerwe+eESIj1xjtRFCPGp8SmzR7mNS8AtsszqxCPpW?=
 =?us-ascii?Q?I759nIedsmbuBM5Vsz21FxUT+CSxG6NgKcMLKyRraIg1q0CJIYXRwQfjYZJe?=
 =?us-ascii?Q?P5G+jFSWZrQaA7j5G3KUS6U6Dpu+YVbqoNlwkn7pi422lTdu0C6WOWjKOdnz?=
 =?us-ascii?Q?txh5Zw1+zPwxOGDJ1Y4WbNsnNZ9qhognYoyTDJBHsliQMK9W4FWNi/MXMqQG?=
 =?us-ascii?Q?UzQyuPk61TdiWv12gdAWnBydXpg8viEiQQthtcdM2VXtrngHQrrSeMoqcfGz?=
 =?us-ascii?Q?FiKE7kTO8zP4C6Xtr/do7VfyLAR6tw+gdwRa5CezEEqVSf8okpT7I2D7gXs+?=
 =?us-ascii?Q?H4H9TiomI1G8JPNuhAz+CSer5k5wONwy9kWJNFsNQOwch1OGCrEvyq/B9rjI?=
 =?us-ascii?Q?sXWGFEctQxgnSxjOav5yQyQ1eZ2nGzm+2N1I0902RuIzCTB4exp1AcNiJz5u?=
 =?us-ascii?Q?KXrG7E+NTMDL8ZGtZbY3PZBbYpWz3zIZoU0j3P7nS0gXVq5eDPmioXoLR3dq?=
 =?us-ascii?Q?cRd0phR+clLfBj4BCtKcaO6SwizbkjVqyfrfYKmipsTe0Uucds/liFDv/r8o?=
 =?us-ascii?Q?kfGQYquHOzbCbKmKpiWt0MYzPN422VhOFo5HOKS7sgUZik/SjJGbmZK+bbZe?=
 =?us-ascii?Q?m9fMZdChVI6r+hRJdEhLk5T/yvyuhhmR8NHqoJ8C8jP/1bLudfDK0Dt/r5vI?=
 =?us-ascii?Q?pgFZpUvLpyAKY1DagHVaZ1DywSgaEZW+VaZr7y8gsksIz9AO1qH9MBDRH24H?=
 =?us-ascii?Q?Y3UvrKw6j6ebVJtT/fKmw2Z0DryAW/eCsj8uIPgLKAlSe9q3GtDgavX1MdYC?=
 =?us-ascii?Q?vloS1KN6AUr6chJ57H22D+tx8+y+Ps0kxKbhYCkH9pcVvO0qFdLtBrevS9Rl?=
 =?us-ascii?Q?AwrGfpVdA2oIjDrOVg9DISbWx/GuDNAeSjhJWhdw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c79d4dd-41cf-4d8a-9334-08db8cb3e490
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5003.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 02:07:26.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbRSks00n5VHM5EHiIhWraVXxrx1dGOs/RcRmUphHsxEvaCjvrPutg7ztjVeIDQe8EXqZK0aQwgi47JYWDVVgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9991
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

Output error log when i2c peripheral clk rate is 0, then
directly return -EINVAL.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes for V2:
- adjust the Subject from "debug message" to "error message"
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index e93ff3b5373c..12b4f2a89343 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -214,6 +214,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!clk_rate) {
+		dev_err(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
+		return -EINVAL;
+	}
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.34.1

