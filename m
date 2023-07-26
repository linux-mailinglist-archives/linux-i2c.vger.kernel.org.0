Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E234E762F4B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbjGZIJL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbjGZIIS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:08:18 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88587359E;
        Wed, 26 Jul 2023 01:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wrho+CbNwVBQtS6lVEW8H630SeQ6zIVaAkj5AL551VZwK3xg+vgi94NKF0rz3Vzu9aPUzGkRpspAZvq6ss2WFmLmkgpVU/Qnt1PIMuxnfufF88nrX3+mQivzusT7Y/5JxHg0hqGQBx3gM4h1OtpeDYX4E3LcVijS+YaYg20+Avp4VDMQ5f6/lt9fUVqSpcbRj8lI5NzVzLpRwKfXDjxYXB2VRufxdgDxKVNQcN1Jel3wkARGZ3GbsIBTNPcRsUdxBrC6mAAVyI2IEzORlp1NLe2qhIQWbzJJkJ8UlDQn9C2EVYMLNhD2EfDpQehMbXc47uDTGXfOwrBagHbmZlOQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaa+ogpgk1cY/Q2s/NNSfWF9UjtDzkEKU4EKKlUMunU=;
 b=mSRf/kJ792De/7CjBvd6QHkkfiwmz9eYxdfhGIys0u/vbxeEbIHG7ArlEhxbzdQ1paEEi47eVNXiq7hjF1JaJqby8iwcx1AWJXWPpTqdQL05MpcSeLexJDj7yzlKpU6D5tD5yoeISuC2p0cpR7oyyp61AFDRHFX4wnM0Pd8Lo4hr9MXklHlfxrSN00NhngEXacOMXauzlm33YKH9479CbbvcIl56gnhUaH/3wlaOCi7nRKWVswyKBeaiRjj7ptag9HTlJa2EenWkZXItjiApo+kIsw7qVIXtplWTDlbJLX0yHpQPwpIu/uR8OltzV2VbVnVHvirn1vi4Blbifz4DnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaa+ogpgk1cY/Q2s/NNSfWF9UjtDzkEKU4EKKlUMunU=;
 b=KUPm9HJ+pE6Epqm/wCH6r9EOWtOH2lvNRaru265vyVN5JSbz6BQNPAi1QQSr4/Fh+HrlGytvbYAQpC5UbGB1IXoIJAhV6luXBikw8NWm/fCemvkpWZEDuvCqhxuRQpz9op5wt/o2lRarKHXjEgwLTpIzV86vjgh5SYUIihb4h2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 SA3PR01MB7988.prod.exchangelabs.com (2603:10b6:806:304::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.25; Wed, 26 Jul 2023 08:00:39 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 08:00:39 +0000
From:   Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, tamnguyenchi@os.amperecomputing.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: designware: Handle invalid SMBus block data response length value
Date:   Wed, 26 Jul 2023 15:00:01 +0700
Message-Id: <20230726080001.337353-3-tamnguyenchi@os.amperecomputing.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|SA3PR01MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1820a6-df0b-4b0d-340e-08db8dae667a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z6zMcElSmkg2Utas8OWzEVRrgKK0pXe07KHN3eeHtvn08ryf+mOiesb1ND/VC6GLw8x9kkvCxwgoUL4rmKWRly4zU/vfPBjUjmatHvi0HkkmMCDv3mP8hFNm1jvTdN1RZ3ZZREySus62YSEYnbi6YvCRWFuxjRehHgYblTBqerpVsxLzU04WPjWga9xRKdLa531ees0NhmRN2wMg3Ifn1ckgrDTLm0oW0lt+TyprPWX1lZsn6ubWfiItchrTJ3+1hXnTTwlxCBU/vckRkU1AancPe83j216BzoJEWUMUPr0sjku/616iJxrB+zQ5FD7hZY9aKj34kkyqxP6QHm3ZO9yhPE/nO0xNYo9pwhty1aYu78mWmv9bHducTcL+sjaJWBKb359iKqTwDnbrTqWA2AmjMH+rDA9RirXY8cZ0ZfYzHkZDjNuoZFui6HKw+xRCSdLV1UWqzJFRXsveCFavggVMO6Hqz/cUEI3AioKKOLouXVegxtzMfVlJ04MVX02Mhr3AYQpjBkBEcBdeixmrJXByGApD0iXU29UrJbQ+14fYBxw3uVoEKxLiS+/IUGpIvfEH1PWTwV8d+k2vB5tjmQz/gPyBFY1gJ4TeVJtYtP8vJhyXjwbbkdF8QnIuiuFO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(86362001)(38350700002)(38100700002)(6486002)(6506007)(1076003)(41300700001)(52116002)(66476007)(66946007)(316002)(66556008)(4326008)(186003)(6666004)(26005)(6512007)(8936002)(8676002)(478600001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZN6Ns5uSPFHfVhP+y1EGxzayEjlkzvWShf4lRYtAH8jdFKsDndHSC3PvwXES?=
 =?us-ascii?Q?g+RLYestnWlJI6E2Y7d08Oj30V5imJjq9bTng5badTOTY9rO/8yMUT473uaU?=
 =?us-ascii?Q?oTC1ykF9qaBA+4xjpvoM5RDPNHL77uh9BRh9fFac6jzHdOoX/jGJi7xWPUU0?=
 =?us-ascii?Q?ocecxgtehbNrnREdc1Qu8JWgn8XRTC0h0eEY1hhFgVsDDqrghi3fEZkTvZgc?=
 =?us-ascii?Q?GmU72DcXDXrVQAX1vU06zXPIlvYX5nVyCODdiu1qK51Cazus/88kh/yCBy7E?=
 =?us-ascii?Q?wTOyhZz+UhpaEN1DUjGdqLJoP2kqH8wBLoyAMHQ9R1iSEB2oc+NGsuQFiY5A?=
 =?us-ascii?Q?e3kJNr6gRJVnDhZIev31ZHS+OR4+fLBnvllQbeFxXKDsmmC692sA6AIibrdt?=
 =?us-ascii?Q?MB/szBcHz7QhXS104jWJTuXfF4izJsyXzcfuHaLOZK86bigVUPcK1zB36Dhn?=
 =?us-ascii?Q?xOHVlxWHSaRXLg0kv8XEMtAwMF08Ut5MWow6wptjlwWnTk7rOgUUzdy4dHgC?=
 =?us-ascii?Q?T3DtHwXXvUZTu0duJ58uThFBlC6kZV77Fq7Py6rXCqfdFOjX3+CfNMtEuPzr?=
 =?us-ascii?Q?ag3OupwMgNkm5Y2Z6+RpmDJ643/ugDtw9h3o56Ew2rRHib4zcSI4sjOPTi/d?=
 =?us-ascii?Q?DcGR5DbIqMYwJc4eu9FwR6tzX6Y/F4p4RyVthN4ior6HcPvFUEpZd5YzjEXg?=
 =?us-ascii?Q?Jr9NqjITeX1yEarbRAI7TuDYVJbm50P8rQzTER1rOaxlYCZ0wXbInm6QrJ8+?=
 =?us-ascii?Q?taTqpkAHbHiYeRRp9vYHJ1xqi0BXkcmb7wZ/Eqhbj0vxv6jI6AQ1yd/k74vU?=
 =?us-ascii?Q?Qb4QLOYVbbDyo6G9+m8eNUbF6GVi7nLUqSf4UXk0uXQCNrsL6YiqsVeXpgnq?=
 =?us-ascii?Q?W//RzLSzv4VzLMen4YEcgFtdlBWucfYB9OzDXWb2VIv9vhKpUyT6WFNG1Fnf?=
 =?us-ascii?Q?r9/q+nE3kXuskd6r7kDLHrkwwAHeNxMGKacbROsPnG9kmHuRkhu+jEJhmNSJ?=
 =?us-ascii?Q?xWEJU7iotZMSns9PPaepwtL7e+PX8gg0XTcdqTbnQJgqKj+zIvijCvxhK6Hh?=
 =?us-ascii?Q?jmu7HevV31IVbtXg/N0a+vslwH3Aui1jEcjYtTmTbVKAXWCylmVhGgCBoX+v?=
 =?us-ascii?Q?rroIX7r+bX+3VODMIayqmSsfI/LRlAJxW/J927C7LlQHanwzUy8N4e7LYPgd?=
 =?us-ascii?Q?Mx0Z15jqwl13fxPoe7h1QMD/ugn6O8wmB0U/P62sPk/psXN0Byl9Df4fto1L?=
 =?us-ascii?Q?TCtdcCtNawgIUn7Ruo1DuEpenbAR+pLBE0pR7EdpD1c35iGEKbJmonwNVv2e?=
 =?us-ascii?Q?Ka1BdSr6LGnXUP7Ki6q1DX2UtC20anfPHNa7KfehirunRVFSTFTFo8rz3mq1?=
 =?us-ascii?Q?l1FR+B8prmWsX8zOpyWc58/O7r3OIxY/8qV3p2OdMz4B8idixASX5l4eggs2?=
 =?us-ascii?Q?EwlIVvZJWo6JuL21Jy0qhnCm6NMKwf1/wCyLsP5y920znfijzo8kDvGilYGF?=
 =?us-ascii?Q?S6Vio9EqfdUjPl62xpx8IJy+qbcMiKh+MGwEnPcCOqquTq5a3LYYNmpauvrt?=
 =?us-ascii?Q?nzMFXfsCk9B2q45cD1w8Mz+teWhgi4XTHiaNZOyPCEJw6sKR+/392683VX3f?=
 =?us-ascii?Q?lSwPDZssLbab1pJ5lPATJUQ/EFCe+9P7zwVZRrMTxPMn?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1820a6-df0b-4b0d-340e-08db8dae667a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 08:00:38.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JNWAfrHM21i/9P70b1bBbiEY2eDEgDfzaGatOonoWAMFuTygYy5QJF76LDP7Or15Tiru+652wwl8Veiz6XL10Lr2ByVzl2qGQ7L/4+IOcF6p64Lx8jNzQ7TpS2MjOhI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7988
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the I2C_FUNC_SMBUS_BLOCK_DATA case, the invalid length byte value
(outside of 1-32) of the SMBus block data response from the Slave device
is not correctly handled by the I2C Designware driver.

In case IC_EMPTYFIFO_HOLD_MASTER_EN==1, which cannot be detected
from the registers, the Master can be disabled only if the STOP bit
is set. Without STOP bit set, the Master remains active, holding the bus
until receiving a block data response length. This hangs the bus and
is unrecoverable.

Avoid this by issuing another dump read to reach the stop condition when
an invalid length byte is received.

Cc: stable@vger.kernel.org
Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e96276d1b002..c51fc1f4b97e 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -528,8 +528,19 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			tmp &= DW_IC_DATA_CMD_DAT;
 			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
+			if (flags & I2C_M_RECV_LEN) {
+				/*
+				 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be
+				 * detected from the registers, the controller can be
+				 * disabled if the STOP bit is set. But it is only set
+				 * after receiving block data response length in
+				 * I2C_FUNC_SMBUS_BLOCK_DATA case. That needs to read
+				 * another byte with STOP bit set when the block data
+				 * response length is invalid to complete the transaction.
+				 */
+				if (!tmp || tmp > I2C_SMBUS_BLOCK_MAX)
+					tmp = 1;
+
 				len = i2c_dw_recv_len(dev, tmp);
 			}
 			*buf++ = tmp;
-- 
2.25.1

