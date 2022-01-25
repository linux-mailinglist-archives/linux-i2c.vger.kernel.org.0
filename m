Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C19949B043
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 10:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573993AbiAYJbG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 04:31:06 -0500
Received: from mail-mw2nam10on2088.outbound.protection.outlook.com ([40.107.94.88]:48224
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1379691AbiAYJIh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jan 2022 04:08:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdG/mPjkRQip4sJhQJouh56kDEDKaZL1tv7r4vqK8Idu9bxAPlh0C4GEhSGKI+JHCb2o4TaBneZGwlza3vFqEZnCNi9mQ/dHTHdi7EYrtg5Dy2qTngC6AZ4HLGO3VeFSfq5OTREPD55zOybbzFneuKoEeSpIWPgvApfDQo7UoMI2kGCJRMpJmHp6XdOQFrnL6f2KvEMmCA390XsEot/wTJEqMRmC87Qm7D9oY0Rm7PVX3EFfJ3lwPSIh2wfD3MPKOkJDLD9E7kiThHwCD9WXsyG9sWvAQ8owvJo06NR8ALEuaYWAXeQtdCIptygi36XT8znKGG7KYbg/CeLXnWEvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzkqF3CuXAbyLSKc1MLu1CCbkfd3U+dE+ZAOlYufDCo=;
 b=SloL92YNMDE2SBFTwnb6+PcUCrZWcw3whQRjyNFMYH4k96vV8r1fZEQ57ZBv/hJ/u53uGFMXM1yp7njRS4Z15A8JvXo8lP6coq2ZpHTAWmejNcouQF7HyfVAU9DuSkOHhq/JYTil33zB/xpYSgzN88ajUjeuhVBXok3BCbXF/a+PGnbGdY54ixnUg4PF537mGDzXdPSXxkZ5VPHxmNqR4LacT1/61x3R0YHC0ml75Bi1fKAsGfQVTy3blF1MIlLpsoaWOaN+RXgbfrK6Xqa9wPVUa7uP9Pjg3H+WIYtDvG/5SGosqv4acp5PMyMTLI1+oA9R2g8LqV/Wj8SLpfHRHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzkqF3CuXAbyLSKc1MLu1CCbkfd3U+dE+ZAOlYufDCo=;
 b=U4wXsvR4CZ7CB+AXx19vdxEXoB+/R5PBAOCF3HZ1LQzodX4a+PHM+5jbo23bYvDjTqDMmyDkQRpr7h90378X2KvM3ucPfI9kWVWgyJj0TOfKZxhTWFznWMBKTxSrPvxE4P+qdgNYCappgsNllK1uqyWEZ8OqrlUN1GX2PzDvFZzZx/rMip8KJNgWguRn/L75aP9p33VXK49kmrirQhNcMgFKl5fn8h55s4l9IIxwOf1WkH7d66SJ2/2WoVuRcOcR9hV0CEHGEhcloCFG8MJfBFAujXu22IQ+OCgAVz9DUotTWMJsSLPw96agF2P5/m+EH3d3Thq8AI3q6BeIgO7P6g==
Received: from CO2PR05CA0100.namprd05.prod.outlook.com (2603:10b6:104:1::26)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 09:08:31 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::af) by CO2PR05CA0100.outlook.office365.com
 (2603:10b6:104:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 25 Jan 2022 09:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 09:08:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Tue, 25 Jan 2022 09:08:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Tue, 25 Jan 2022 01:08:30 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Tue, 25 Jan 2022 01:08:26 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <thierry.reding@gmail.com>, <sumit.semwal@linaro.org>,
        <p.zabel@pengutronix.de>, <christian.koenig@amd.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: Add SMBus block read function
Date:   Tue, 25 Jan 2022 14:38:22 +0530
Message-ID: <1643101702-16206-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f6c050-8a05-4f9c-30a6-08d9dfe241ca
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB494373E12527C314B972EEEEC05F9@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdA7mAcvTb3gxonG3AsBSPnMBUpVEDEn8SeidZlc1jFIx/HXaD0jLbKcO/ujxpy29FOxDpczmCkkTB5AYDBtzwgMSAnRPcxCv60R7Mk+oxZ1a3ma7wKOjdEikli3/+0t1l1CxV5YKakbDRlf/fSyyLvwgmsoMF8L/nJs1f+mhUGk0G2ic7ejhtQP7Y83Ruq5Wq1s4Cwc4VMqhmPC0cmgXFVGBU7IAf2DQaQyCv80ITdhPK9i+dHq7R1n/eKj/AU2LWmowrtXctjN5uu02ArY5SDlFyaQwkf3x8s8fSUZ9hhoYTUOl138YvXKYbndJchm9sNTwhmorLln2CATV8YhTQJsHBRKTEJ0y4yq7lD1JOGdexh3kpIDBFYQKriZM/ZajwaH8+lFpMoMwbUHtTMLlAW86RL7VPg5/EMQuek8ouXd6IeAuaanovGEJMDyo2N6hU7XHW3cr26avYz7nH4CjugVutR1aReXUzSRrNz1Y5jR7VRN0MrZ+qV2WGemg49O2mL+hHtcmRonFhoJ48cvuPMgWm9ZuYni9ykf17SapE+Wkz9wdiPEZYISJYHug7vPynR+4cdx0Qy7BRyWeRCJpUt6pNFbnjAtPdAKl73Hko1QReiU2mr04M9QgkkeiqEP00hse5qhT215U89KsvQdDtRA/HENLSegbSlXWn2OlwbLiZBvvxbFGd2iBmaWLOssq6U/MVGBGWv6MSX/wRMIJ/KbNbl8JRMt9HJoXW0FvaS42Kc2N2+mY4NgXJrTMQfzaOdzrDLTusK0HhKEaJpyKOrHg8AGBZMHBARoYMfxXFNQiq96jEoVf7bf6mETPE85XBmdGBb6EaKyPR+VMbzADnhI/kuuptANgK5/n3oDino=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(110136005)(316002)(81166007)(36756003)(8936002)(26005)(8676002)(36860700001)(6666004)(426003)(86362001)(107886003)(336012)(40460700003)(186003)(356005)(508600001)(83380400001)(2906002)(5660300002)(2616005)(921005)(47076005)(4326008)(7696005)(70206006)(70586007)(82310400004)(83996005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 09:08:30.7914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f6c050-8a05-4f9c-30a6-08d9dfe241ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Emulate SMBus block read using ContinueXfer to read the length byte

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 03cea10..2941e42 100644
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
2.7.4

