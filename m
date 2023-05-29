Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76BB7145D5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 May 2023 10:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjE2IAD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 May 2023 04:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjE2IAC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 May 2023 04:00:02 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2047.outbound.protection.outlook.com [40.107.14.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACFDA7;
        Mon, 29 May 2023 01:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL3MtjuYALEVYygR96N5/3p88mfSw+vjHGFM4hKRPGR/AoJY0PcvP3QIA0YNXEGbdzLOnIRJiobAldV4Jb86qbJ9D8CxCkjqRu4MfqnBIaBXp/7GyJ7oxvIiW0c9JlLOGcU6lhaUbSn9qTvXHaMr8wzKpQK2EuPQfg/IYzRFxOZXk3f2kGq9+D/C0Tghu2kYNUDV3vSeRG73QrK32eNQuX3Oy2XKwNZC8e6NF5nBK4xpXeo2g2uKsVH8DB5Ag+D4QiyiUaI3WO/XbgRrqEASxa+P8PuSunKRMBLVAjXkGY2TPAe0il2HxzDHZCoGcNo5DnRg6fcbvABRE7LT+MnZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7dZR9hkSDnJvP7ioS3I6wEg2oXWrF5cCdXRjyNyx8o=;
 b=iC5keAR8tzg4j43FBzdHaVAY2JSmrtDLrNQi0KrAzI1PKw4svZnoFXgZjzCsaZ25ZyPJUG6PUBOWqrG6vURBuXQ4AlZCvzQy4PUbT0pmPam2bYlq58RuHtzowoOfTxDrHwSn29GScEyT+L6McbCv4JVx+styzyjDdPsXYN9jRau0+PZMgz8utZSmkEBS6ntSUq5dhGT0lHbdOM+K72DMyDxBG3byuibtLuXiDdvAxyyn4oYZlL2ZjCP5aJaxWM6vDOk8SIY8I33emMQSrSyiTyEU9XTakHcztAaLm8RzXQhco28FztnvBHxhpGyrtaSqYLPRlfCDuNovSytQm+aZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7dZR9hkSDnJvP7ioS3I6wEg2oXWrF5cCdXRjyNyx8o=;
 b=JTze6pmLlkgj8AcmrD0GQXCpZQALdNPVTiyP1njPDXB6iCb2Z9G+Pjx4/xlJoGgXrgS/ZAlF47PYZLbd8sWy1+zupQh1t3iE/Qzrcw8EhhgSIynAHxuZr8t/XhcSxvZJSsrk2w/ltTfhJdqdtjAdxKHgZqveDRN8vFgAtgk6D7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AS8PR04MB7765.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 07:59:58 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 07:59:58 +0000
From:   carlos.song@nxp.com
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
Date:   Mon, 29 May 2023 16:02:51 +0800
Message-Id: <20230529080251.3614380-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AS8PR04MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: a88fa800-cd8a-4a5a-fcf7-08db601ab21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wwsBL8TPguA1gy1z069VhKM5SD2pala4ooYnHcFui9ROP++/w7EIJewWpMqKlJ0Kcs66IbAVrcKtNThiZrZB6JJVWTM9e9eX54AvqZNo/0kOk4NtB1W/cyF/qEtclwW0OkpPAmGM5dunv2wSTkYyCidJOC+fOiq2gBr1wxqQY8Jybi6q5HaGRgCuw7Ky+idnIiIN8hRTRk9HkEG4duVPL7tKmon1u9PTO8nBl/6lXNeuk2QB3UVysIcHw6MyXyXEkCVSPwKpoG1ewiLkxogwX8DE9hEDkvlKiZKduv0VBTrZjUZ7+YfCxn8z8ZiqxYN4okqv1ltGPuY0fA0x1jEAxYLtqU46FAtNTrUY83BeER4kdPNmdJzJ/4FV8sZJPzs/KIR2gzgtr2eRSwDmXgHTJtltcYLQAmFmV8cAF8We9VawlqnPXZLN6vbtTrOCd/A1tMfAI45DNnNeQzRF6+xJVlpMPinQje8TT8PDV8jOAMENA2ZxvKn3lcrTMrLG+E8oIfDZJiyf1aCeiEBMtHHO6eJoH4X1fQSzB83cDCpYynzunFAcAACv0umjQoLmNjkznzF7hkTihHvRBvIn5JFSehDUirR/5fdOuk5n8zwdIAMQIotSs6v/QpeENs1jOEp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(38100700002)(41300700001)(38350700002)(6512007)(316002)(6666004)(4326008)(86362001)(52116002)(8676002)(8936002)(6486002)(2906002)(2616005)(66946007)(9686003)(66476007)(66556008)(36756003)(6506007)(1076003)(26005)(83380400001)(478600001)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CNVdcU01lT5P81e9Mc1JPYpPQh5P5JMJiOkzE26Nk0yry1LwYELLn6cyMNoi?=
 =?us-ascii?Q?BCp8w5l2scb0jmX6EI8PzvpC4DDJcC6o9/HDmWa7Ycv2Pyfjw/m9qYs7/0ot?=
 =?us-ascii?Q?5ZxqOv4wTwUBF0WD13i5F/XhnmEuEOPUxeYy7os8xa0QAyLkGJ92POAYT2f3?=
 =?us-ascii?Q?gi2kqO1PXiZBe/WBAU2+cHoEFBDCA3R6xKZdcxZEGk4f6QFaN+ix04kVgTHu?=
 =?us-ascii?Q?F0r5WHBZl4dTMYoWLdtHhOAxKa4i2dcNCt3GGhGLurk2LZ3YJQZ30G25xawf?=
 =?us-ascii?Q?WZlVY/T6kAsLnskee495HK0T2KhO5oLQaXA7IJXvGvYcByp+zlTq/vuxx5xf?=
 =?us-ascii?Q?VOsH5E8k4FY68G6+t2VTlgTuMiOF3S/KgdNdniLk1V/5TQ4MqCz3A+K1oqsG?=
 =?us-ascii?Q?eDLWt0kx6B4dXJFzFfkFB8xo52aiSM99qfNUzvcUed15TcfrepGQqrVPOuVp?=
 =?us-ascii?Q?eEcYMZSCOl7/O/dsQspzfHKD4gyaVDga7aY4zW6sISDONgxxSNlL4PRr3Aa+?=
 =?us-ascii?Q?dRHfPAG7mAOpUZnp1Z89pi0JHSGl3LVYHpWsJ7EKbUVlDq8DQYjCwJhLpctE?=
 =?us-ascii?Q?nfSS5LPm4LTsquLRCv0F+AAAMb72vvWbyXT/504xp37NL1UV785ydWyGmBuX?=
 =?us-ascii?Q?NtgbIToIPdygi8mfMt4UFgcOqgmnn6+S69PRcsTUVzIldT3+0Me4TGAFOm1K?=
 =?us-ascii?Q?12zYjVni34upWl5GxQWgLFVtf7cDW7VdlPVnX2deAXfWI4e+cDvfemjB6DR0?=
 =?us-ascii?Q?sYtrAvueFjlZex2BhNJID41zfy8RqFLhphHBRLHwDLyQ9FHQWSOc7i+sLI24?=
 =?us-ascii?Q?3RYbuowAeuZcPMctTeBm+wB626xa62E6qgi8uN2SZX/YK+3N0YefE2+UBpUx?=
 =?us-ascii?Q?CiQpXwdGJKXlOc6x8U6uN6ADHIjHmoFd8UZSiDW9EIQVv+4nMY0EDnIPvzEz?=
 =?us-ascii?Q?5jQfHclhN1ElTiDBLLiG/l+sVjPC5ZbdJhFP7mnxTR/wGzfYwooqo0qu7PcK?=
 =?us-ascii?Q?VAQFChrtwggBphY1aa1mjAybuyYpjOC+1xJ5B/C8b4KXYjE09BpZms2nJw6e?=
 =?us-ascii?Q?2n69+vibgUgzTcJwjiurWI7f/dJxyMSWTE2OBi8cmcubTIh9VgQomzZGKqi1?=
 =?us-ascii?Q?n7jj1/UIJX/NXNhT7ENU6BxdahJohZPF18h73PMutjdSjwdOyXhCF1r64bur?=
 =?us-ascii?Q?MKBhXsZ58X340L7D5E0pmYZe1SLGD525tR6NiScXHuTASILkUCvSIsb3U9kK?=
 =?us-ascii?Q?aRbw+72w9JCFA18xBndfXhOtSs5DJDqsYMrCan/kBwBXGB1jsmLDyFutFXbJ?=
 =?us-ascii?Q?u1xFdtsyjTyrI8vKR3lw4OvzOIFFl+BZ1gt6zMJtP2W8xyuY0WUdJDm6W++u?=
 =?us-ascii?Q?roDlFThzchp69Zk3gQ/84qZUn+d6dsEEBOLkNAmgn/m2GdHfQUHM8NQs/AfE?=
 =?us-ascii?Q?txGuR8xczBk1VWSvb5/ggoBMK88d0NmyHfEI2JGoSJyrbNrBCaPY+1lRgaGF?=
 =?us-ascii?Q?IlFXY2Gi2vEThxZA7g7/+Z21HzfCBQQS5lcuMAs/2FZiR7J4pb0EcrrdQo4n?=
 =?us-ascii?Q?KzT34CT0Y/If2Y8AIkm3ZYooapPItOoyTLE3khdJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88fa800-cd8a-4a5a-fcf7-08db601ab21f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 07:59:58.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJsr+EQtonhz6zUiPfh9Bq4jI8uJ8XQn3hgOaplo5Goh2bGdxzyyLNWtpDhRw9mjfFSg94KtWLYRc50gZUlfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7765
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Clark Wang <xiaoning.wang@nxp.com>

Claim clkhi and clklo as integer type to avoid possible calculation
errors caused by data overflow.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 40a4420d4c12..7dd33564cbe1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -211,8 +211,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
 static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	u8 prescale, filt, sethold, clkhi, clklo, datavd;
-	unsigned int clk_rate, clk_cycle;
+	u8 prescale, filt, sethold, datavd;
+	unsigned int clk_rate, clk_cycle, clkhi, clklo;
 	enum lpi2c_imx_pincfg pincfg;
 	unsigned int temp;
 
-- 
2.34.1

