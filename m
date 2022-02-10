Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87564B11CB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 16:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243663AbiBJPh3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 10:37:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbiBJPh1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 10:37:27 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074BF1DF;
        Thu, 10 Feb 2022 07:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GO9g49AVGqEax+7bP/O/VzAhN9HeMAj0C+k6ycZOORU/QqqSx7m6Mz3zd0yAL9aKB8Pv4/eKptqXQ5t6BUXiG7usbE0WqiNXCbi5OXbXLnjM1iwrbBk8EV2Mktdmw8wik4+6S4OHnLdZMibgPfHpMw6filAk2ZZCgLFleMbhBvyd+8Z6wLV8OIhXZwARLnYugikh/7nMeQQNmmDfTbMOUiqJ1tzH4ayGqOAYUkPTQBJqzNRx18K1GnsRGCc5i5Me1rspy5TWUYgJDnBl+AeKqyUDYjrsAuTc+rk350koEayBs6TGj+89HmlHSv0VefBIRH/+9dXGGMmcDaR4hJVwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJEeEMyV6Nlb38k4MXvSJxXG6mRre2WYA9JBUTQNIPU=;
 b=MR7W5XehSYzPiCemqhaReap582xFsWLKIBX/5bF83YjGe5dT5m5rkmHCgvZKNvHfX+g8R46x2v48g30RrlLWZ8JMRtw9s/G0rs74qMaZAsQhTL+1mlsLUE/IUJynPt4DYqjRinil7JPCedhZ0LLpVJDinu5abL9uyvzH1zS8vurRpyaHAGfw9+tw2+xMA9XDx3jesjqVj08f84GsQ7NRrg+9Bio6S+R2gtwlz2KGdxTrBXsa8Tm4s53mPy7J6D6NrqkroR0uEu21edGfIWXEbRF00GwsNr+bjleVo/Dr0tYjdAQy6Ez9K2Ca5zj/LsSQHNNiK5fo0rkshnESQzoKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJEeEMyV6Nlb38k4MXvSJxXG6mRre2WYA9JBUTQNIPU=;
 b=EjgfUkFM6mEdgBICUlA3fVLS7E3rPJyo0rCFm+VDrfXHUFblZT4GIS29EMmXRc0T+Jeun1MSBCeDmc5PSxSRf324ASyrMppu1unkpGN01jQW9FJalPhT9L8yJAXcK1NOUhy1EaJvqijLO0+yUHR5PhWEfiE+BBjKDviGT7WKMlalRkM08FpgziPAaaO1OfgkIR7YKNR8thGicEg0eK4aswiBIQxMYRgHhceK7qhBfyd9AJLlxzOqPomXNtu5rk9c7PIe1GI9SWx7+QkjYeukuMhjlWHfHp4KqkjgTqA+VPCaksJg+PEX1a5cuVM4p6Dsmqz8vVKD1ZrbG/RaIYzNNw==
Received: from BN6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:405:2::15)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 15:37:26 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::6f) by BN6PR11CA0005.outlook.office365.com
 (2603:10b6:405:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Thu, 10 Feb 2022 15:37:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 15:37:26 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 10 Feb
 2022 15:36:30 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 10 Feb 2022
 07:36:30 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Thu, 10 Feb 2022 07:36:26 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <p.zabel@pengutronix.de>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Date:   Thu, 10 Feb 2022 21:06:03 +0530
Message-ID: <20220210153603.61894-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f675af9d-91e7-4dc1-f7ec-08d9ecab3d97
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB404764C0D7A3FF40F0AEBB42C02F9@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9qq6rCz6sfUBfxp0MP1X/H4T/s1NMteWXEsGW/ZL+d8ufO4ovHkoq1FF9Wv/NxYcwkUvEb5E4B/1v2FeSP1u43wo1pB5VrwgWJ7omDj68bIhq5ASSsb2J2lMUOyRhOiYQBjR69KJ2wFBRAuevTyNtc3rALQDFUfAJoxc0m/G1gegLn9cBfTaBApZ0P2NlBIsXxiVSrdbnP+Jzwc4UnPzglEHNd+UkEIoOJsiQNwXHSxKv6t+8ks6BH666jssgZYtuTjpRXF63CCcu2vlIM/D0Iod2N6/HSN4H8YPUh0XDOih1UZyBz5Hh2DWuXTtRgsoQusDSM4+8Ab2c9yqNaNNEXbH/yAnWSgHCdPXlfytusu9Z8Xd6jtkqgxr2c/ie+55zDfvktxCDQjyDVuH0wU4wVbVjwwkBtNLJfsN8azT7i4l6wN/lGoMq2E9Fd8dAqyBoQcSeDkLMgUpj5d+kggjP8WXra2Ih1oYP4ELcTIXWjt0lEdf/XRTuJo/GdABbspKhVxe8ezmUrVnTj4CxgvyJzRVw1zrzjlxY56C3eFYuwihk9gYgizkchID8ZkzbWOVgZXsFt/K3QtjIuWUrNEqC4zqnJcldnO5lhEev0hyKpv7mls4dXQU86pcdVgerYbq5mvNK8xwEGKSxL+pZf6X7+olxh6Q4vvTEaMJUUGNrbMDjjkkqWtwtseAq2nrcwDogzL0uztbsikhVcbLuqLRXR2OAaiH9Kwlapye2QPuwCVJDl+gUGKRZQq6KmUqNAjpLrVR9sF+DSJE2FP9c3bqQ==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(70206006)(36860700001)(36756003)(82310400004)(316002)(6666004)(8676002)(8936002)(83380400001)(47076005)(110136005)(7696005)(4326008)(81166007)(921005)(356005)(40460700003)(107886003)(2906002)(26005)(186003)(2616005)(1076003)(86362001)(5660300002)(336012)(426003)(508600001)(83996005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 15:37:26.4537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f675af9d-91e7-4dc1-f7ec-08d9ecab3d97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Emulate SMBus block read using ContinueXfer to read the length byte

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 03cea102ab76..2941e42aa6a0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1233,6 +1233,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return err;
 
 	i2c_dev->msg_buf = msg->buf;
+
+	/* The condition true implies smbus block read and len is already read */
+	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
+		i2c_dev->msg_buf = msg->buf + 1;
+
 	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
 	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
@@ -1389,6 +1394,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			else
 				end_type = MSG_END_REPEAT_START;
 		}
+		/* If M_RECV_LEN use ContinueXfer to read the first byte */
+		if (msgs[i].flags & I2C_M_RECV_LEN) {
+			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
+			if (ret)
+				break;
+			/* Set the read byte as msg len */
+			msgs[i].len = msgs[i].buf[0];
+			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
+		}
 		ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
 		if (ret)
 			break;
@@ -1416,10 +1430,10 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	u32 ret = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
-		  I2C_FUNC_10BIT_ADDR |	I2C_FUNC_PROTOCOL_MANGLING;
+		  I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
 
 	if (i2c_dev->hw->has_continue_xfer_support)
-		ret |= I2C_FUNC_NOSTART;
+		ret |= I2C_FUNC_NOSTART | I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 
 	return ret;
 }
-- 
2.17.1

