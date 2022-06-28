Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9172255CB55
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 14:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244850AbiF1Cr1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jun 2022 22:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343784AbiF1Cq7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jun 2022 22:46:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4637227CE9;
        Mon, 27 Jun 2022 19:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA+KcigLfVXdQYrcg/GZj+Xeaic5psOj0mkoI6Dqd8Rl741PYFVXmm5zO/TtHt+vIt/G6ERcbumH8hNZXBsXl95bMfN4Aexrgudj1BzkAG2+0ciPGxOHkPrI5xjRjXQdSteTUoS0BSFsc2WvrfHb6T6O/zBFbFqKXykjD/BiKydr7mwmOLRqrkotScprYUeEMKHhxessgVp9bgGHsJSoA6n0ge5VqXZSk5I7Yo7fSoz2wVfx5CxbvWp0re6CX7kf+GuxTxHdT/VKEtr05O8GBqiNSEBjo0cQZGGQv8JV5tKf1BPYqu5q5vS6rREEbulhCAtv34SE5cZs55WKng8QPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etxzazSc954sWPRVXqa/8rCjRcMUNzBN+7wbumjRfHQ=;
 b=Dw18Aidqgo1t/TTsdEceuDJnUgzf8JT5Au4L2IdDDstMth7OI+Fzki9h2zyS/4k52g0hC1GK6Pj9SXZuny6AlAaUB5suH6KNDhN0BN+omnItgkGSt7mzpH2QH3/kiB9W9cttN1qfHclKoeEJPy/9b9+6BOsqBdAeryBpJFEHpLxS0yedOnyMa2co4QY+1ew47ezGy9TGN5LDmylzcr7Nq/ZhwQH+IcvE84N37xpXUF9pqYjz1RvYBlvMSuqgZQVFVOngkCkKTGQuq6ZQ7nhFydgpGUE2HfAIWYXLvUhCgXLPd92BO1+zYzBL4nDomivSYMcq0oAwg+pSBTRlrRiqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etxzazSc954sWPRVXqa/8rCjRcMUNzBN+7wbumjRfHQ=;
 b=SSG3tjJnatZLaLTrPdMN87af+zPIdAhaPL/3/YxRrUefSwC9kWRPdWl5WwlFq6+WGpyBz/nJk6qUOwPm5/xHiZILZLJI0o6/bfCML/H2+L6su/AmpCHeShm/O9CctBzcQ5K2q5kqnD57s7F+Ff5Rsx4b9TlsQjVXPjN0CxDXL0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10)
 by AM0PR04MB6963.eurprd04.prod.outlook.com (2603:10a6:208:18b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21; Tue, 28 Jun
 2022 02:42:15 +0000
Received: from PAXPR04MB8304.eurprd04.prod.outlook.com
 ([fe80::6c24:a20:26bd:60df]) by PAXPR04MB8304.eurprd04.prod.outlook.com
 ([fe80::6c24:a20:26bd:60df%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 02:42:15 +0000
From:   Zhipeng Wang <zhipeng.wang_1@nxp.com>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: core: Disable i2c_generic_scl_recovery callback checks with CFI
Date:   Tue, 28 Jun 2022 10:41:55 +0800
Message-Id: <20220628024155.2135990-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0132.apcprd03.prod.outlook.com
 (2603:1096:4:91::36) To PAXPR04MB8304.eurprd04.prod.outlook.com
 (2603:10a6:102:1bc::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5141d08f-b66a-4765-320d-08da58afcf50
X-MS-TrafficTypeDiagnostic: AM0PR04MB6963:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxzBhuo5HgV5bewMDSAgnWLgpeelrc7bHYgz1PsjU7cKnU+YDuylPWp3E3FAO545A/4dhzn3T20LG36WgnP9PemhiuozEnZoJR1/T8VZP/lYjLquAIrc3e6SHkOMo3zZGtUf9y6a4UsjkQfhJ6bVDUJ5Wf426dviTf/wzMxmzrV3MWfqfuldWXzzMS0yvfwKO4jQ5Jz5UfbD6aMQO02mawroZxyrknTXdm8/zmj0EbYeksfoEjkZSnAaQ7s6cTQQ6hSM/sDZMNrwqFsxrEPuW1knONfUqKgHx8mpoX17SGShXws2EVjy4cEkZrlHbvHRMEkfwD9zjYr89xGhM7vE5+5IfAUyywpldZMQ3u4H0UTEgPrOZpPgPSDS4dUqVZcHgIu155ujYfDXKuYIH7gQzmhSqiu4OkDR+WMlqdOsqH1r/D34Y291BI7cRCSDlGD1LqG89pNq3ZyAEzN71g80yUoNVz+ghHSZso869K905eKHeoNkxW6F3QmWuaYRjpd2K5H6/zNAr74jpCLQLB7U2aSnXCiq3r/3sa7LOmURgCuK5yLx9x1hwVQKINFZbxSMCTe32yUPMfY1g4P3HG0u2Q5fp+EIkeBv1a3bHZfT+YkGkj/0T6FqGpZw3s2rK1BeFfiEHss70quCP/vXhGvSR65xNpXVrjH5jdGja3xfjewgS3CImwM9NY9hIazgrT6EC89m+VdSHxchkf84IWo/HjYQLmaEDwID1EUZi0+OinSIKBJldq0arVotU7a8HccbUW5EhMhf6qOFSYN9BO6Pr4TPi3NAmGibjwFotJJMcb7i6E3gXn95oJYjsWf7xvP5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8304.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(66476007)(8676002)(4326008)(66556008)(66946007)(6486002)(478600001)(2616005)(1076003)(6512007)(26005)(316002)(8936002)(5660300002)(6666004)(41300700001)(86362001)(2906002)(6506007)(6916009)(83380400001)(186003)(52116002)(38100700002)(38350700002)(36756003)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AL+wcdk4aJjXVLMKomHbE7c/zNYb3ugmicnDlFPeMbPnyh74mFjOWZo5FMov?=
 =?us-ascii?Q?wvfpQOewxaZ81D/cV70e9wL/v/mhhQInut6UBB+4wIiup2knPSz5SOQqI85y?=
 =?us-ascii?Q?RhWuShwAqQnO8BvBhG+xKSjcVZJOriQKu+y832HHHc1a8wJAmOOH1NFa1npx?=
 =?us-ascii?Q?RPqjxqBUJhrR3FXk8iHEXqhcBpOn3ZiNL+KubE9SNzcZ1NOLiwjhznPTN2AO?=
 =?us-ascii?Q?WBvhOZ/bwSOWcfI/7hke8jcB/odEtds+q3xLhHfd4MCfd1ufds1T6lY0yBHK?=
 =?us-ascii?Q?QW2rjVVOJArcODOzK/1oXfZ3r+sP+k4XhLFVZTzLcAeJL1+6oexJdXi17nHT?=
 =?us-ascii?Q?KsVYqCE2dc/40NiAdepahGj7wuKml0JL4h7gZnZVMBDVxVAIMLviFX3NSQkg?=
 =?us-ascii?Q?7QDcasaXP9PwWW7rKzYqQ5FAasGQr2wBSMOeKIq5b75tch4UXk70MyDuNKg0?=
 =?us-ascii?Q?87WsYIszV4g6CgLLeYB48XpEvy+MZuamgBljzlYXsdDheECu7t8ogf9Ex5FJ?=
 =?us-ascii?Q?CR8iFqffeWFWpuwfAc1yZ9GbDv6iFZ05aez1V405AkXyACDD5ZfFLANMaEBQ?=
 =?us-ascii?Q?c2iaDnO2tlwm78Zbr6+JToqgUwwTFDQK0MYZpupY0bmdqxYbflQdok1GWGbW?=
 =?us-ascii?Q?xrqHAdywVnkuE1j76GTuR1AwI/KIejyZ+Y7yMgubBIoN3O9SOGTRYSjImvLS?=
 =?us-ascii?Q?X7unOuFSu6WojixP259ABxm4SjofK0zXLy7P6SgEnvIYOo1ZZtwGmcCU7HAX?=
 =?us-ascii?Q?zbWrzLRSCImhpuKPWDHcCBcbb5/lYln0sBaJ1QFv8y8/djdT261r0mzOabvk?=
 =?us-ascii?Q?Z4TkJXiHAS+/WMHizlt1iqrqkOO+fBBR3fw4Hi+XWiDTpj0jaJcvedhBoNTI?=
 =?us-ascii?Q?eZLMsznsZ74EaMXAzAmYGgLYyUDKJeDmz5CtPrPcEgfbijUfKwOMMtxbwAaB?=
 =?us-ascii?Q?E7f9YnK21v0un+1gVBwcnCm8glKaHhehaqUPRwiQ+JZ0rqLeREInJTsrFw33?=
 =?us-ascii?Q?Nur6HTj9GD57XH2cJcO9O/lLI8oZUG/rkACWDSwHueLUXbMwpFfKyQ7KOX21?=
 =?us-ascii?Q?KTXatAj4WmbsaJdbvaEVa28VUjVtl9pX5F6gNeWWZZEfNYvc54Ft6Ec83s3q?=
 =?us-ascii?Q?Q/PKva5X2uiy6JdV0H6eNq/zeKr/mbHAFCDQSXZy0wBSbUPtLHbN3RB0EWgt?=
 =?us-ascii?Q?OvQWjSfdKSIfPMUvp4bOoGLXDr//PC6k/glnmi0AJwXaJuznrJn8tXo5SWbj?=
 =?us-ascii?Q?yeQjL/eOwphJvApyPFVGM5VH1D1ovPu1a6G+wDRe/+8pZlvtKT6jJsJ7LD6I?=
 =?us-ascii?Q?KHXxA8feCuv+bo6VUK0MRPTV22N5vZgh9H70GuIeVbk1zKFTUJN+CL2lfBch?=
 =?us-ascii?Q?8vgLsoQczNsjimDAXB/TJklxt2CEI5JC7BryefNawFLUvrCNRDWIrxWBwkvK?=
 =?us-ascii?Q?D0Tlg0NK/a1yT5eo2bls4pD3WPeDHJA2tDd3RNkEBWb2ALrFfYa0RQc5PYIf?=
 =?us-ascii?Q?zeTYpxEl9BVJWuHpE4AHhfik7Tc4bHgHCQ8XqKG96SYI46CYL6K2RX0Hn+se?=
 =?us-ascii?Q?W3F/Miahxa/JAM7kSFRmmiC+rBo8QEhCUM20/wsTMjGYkTeCyYVRKTFnoldE?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5141d08f-b66a-4765-320d-08da58afcf50
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8304.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 02:42:14.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpHGvmOu1onbG5yJFXuudSphI008MsVQ6b2xos9kpVIJh9w2WuMs8zonYlUMj6f+qtQ0sCcnaerBT4bVmXiGyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6963
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

CONFIG_CFI_CLANG breaks cross-module function address equality, which
breaks i2c_generic_scl_recovery as it compares a locally taken function
address to a one passed from a different module. Remove these sanity
checks for now.

Trigger I2C recovery through SCL connection LOW.

[    2.452853] Kernel panic - not syncing: CFI failure (target: 0x0)
[    2.476964] Call trace:
[    2.480104] dump_backtrace.cfi_jt+0x0/0x8
[    2.484909] dump_stack_lvl+0x80/0xb8
[    2.489273] panic+0x180/0x444
[    2.489282] find_check_fn+0x0/0x218
[    2.500079] i2c_generic_scl_recovery+0x390/0x400
[    2.509573] i2c_recover_bus+0x3c/0x84
[    2.509582] i2c_imx_xfer_common+0x60/0xd50 [i2c_imx]
[    2.521005] i2c_imx_xfer+0x1ac/0x3ec [i2c_imx]
[    2.531196] __i2c_transfer+0x2b8/0x910
[    2.531208] i2c_transfer+0xd8/0x1cc
[    2.531216] regmap_i2c_write+0x54/0xa4

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/i2c/i2c-core-base.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..87bca6d8514b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -334,7 +334,8 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 	 * don't touch the recovery information if the driver is not using
 	 * generic SCL recovery
 	 */
-	if (bri->recover_bus && bri->recover_bus != i2c_generic_scl_recovery)
+	if (bri->recover_bus && bri->recover_bus != i2c_generic_scl_recovery &&
+	    !(IS_ENABLED(CONFIG_CFI_CLANG) && IS_ENABLED(CONFIG_MODULES)))
 		return 0;
 
 	/*
@@ -415,7 +416,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		goto err;
 	}
 
-	if (bri->scl_gpiod && bri->recover_bus == i2c_generic_scl_recovery) {
+	if (bri->scl_gpiod && (bri->recover_bus == i2c_generic_scl_recovery ||
+	    (IS_ENABLED(CONFIG_CFI_CLANG) && IS_ENABLED(CONFIG_MODULES)))) {
 		bri->get_scl = get_scl_gpio_value;
 		bri->set_scl = set_scl_gpio_value;
 		if (bri->sda_gpiod) {
@@ -424,7 +426,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 			if (gpiod_get_direction(bri->sda_gpiod) == 0)
 				bri->set_sda = set_sda_gpio_value;
 		}
-	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
+	} else if (bri->recover_bus == i2c_generic_scl_recovery ||
+	    (IS_ENABLED(CONFIG_CFI_CLANG) && IS_ENABLED(CONFIG_MODULES))) {
 		/* Generic SCL recovery */
 		if (!bri->set_scl || !bri->get_scl) {
 			err_str = "no {get|set}_scl() found";
-- 
2.25.1

