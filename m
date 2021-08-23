Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EF83F4C96
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 16:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhHWOqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 10:46:22 -0400
Received: from mail-bn8nam12on2060.outbound.protection.outlook.com ([40.107.237.60]:2592
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230354AbhHWOqW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 10:46:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYu9+H85kpxX2Zhumu9zITLbz8daDn6v8GFiondfza5zoRaBOeCL84UaLZtoDT9tiXkPCqCuqQsB/TjXnryJJ/i1YzLpMCfaAFJyMTdvz7efKYZKVbRS9CSU15o4sRx94JUH/VeFV0jXH6yUC41D08QoyRS+ROFI9dWzYKkrHnc+mI31imWt5FaE3FaFPsf4rZ4d4oXt5sNTDuQt8nHfZGwxVvJkacnvi7vcc0J5VXso47rs/s96/cgJUyz4AOkDKM6Bqtl8cXNOFpTlQhnnApfzg/7NypVQJeqQI+7fWNDZme4RBiV5M5RFTKe90RzFwN7gGsAs2xQmPHAmSV882g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXF672+7NF+s0+EGQHO15zBr+4vSi58iP3SEvBXmHSw=;
 b=ZYvDRYxjrbwMEduFS47qMtbluVh0q+BeZg0Bw+wSqxNAwNLrD7wl9KsOqRUL9m1I4cGRlJEaJjqNCNTILQAaE8a5sfPD/mQ9YKHpD+NlEbcMq/eNbRR/rh2wJltqj+Lc8Gs1ORhhRTUY6CbBER80kmlwFzyCHP33s4vWvZQzvKzq2ofWtEyx0KmAF21toQtwuHuZF+ajf25mW9E5yq0r9QP1aPRCRdAAdu9zmXLUyfC/iqf4dxiHeOo56SQ3pLHfC5Zps07r+/6uwpWGbpo//XFFOaF5nKzC9lIZdF2zw4q8c1NIqq2g4SYEexdqbSHFoz+QAO99kXyKyHlqoXsdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXF672+7NF+s0+EGQHO15zBr+4vSi58iP3SEvBXmHSw=;
 b=O9yzh8kjaremeH2GZ597kBsfPzD9JlNm6FSy5Xahu9KISxEY7SScxHuXlANcOkUBwN16v5yI6r+tcHB3QT6V2NK5SLkgBfgnCAdQuPpqlg4y20WcwYQA/Pk3c7Zmji54OCKfQsW5iOW3HnmW+dORRJrFk1aaQlN+utZLmFUvRNBWD4dBf6Xzj+quD+g2rfWGEgNyQWRvKZ42wEdKTEShxo1SV5KZqAgw5XS0NbImgAZ2hHhI2i0t2bdJoHJwOLWbxsRzPJsFckjU1zSUXgdoeJUr294KgGokPOHQrgt8/OytTDJxRyZG4PstQclWe3jY291ZInCd4Ck3Y0zv7RhoMw==
Received: from DM6PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:333::10)
 by DM4PR12MB5056.namprd12.prod.outlook.com (2603:10b6:5:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 14:45:38 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::95) by DM6PR03CA0077.outlook.office365.com
 (2603:10b6:5:333::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 14:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 14:45:38 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 14:45:37 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 14:45:35 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 4/4] i2c: mlxcpld: Allow flexible polling time setting for I2C transactions
Date:   Mon, 23 Aug 2021 17:45:04 +0300
Message-ID: <20210823144504.1249203-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823144504.1249203-1-vadimp@nvidia.com>
References: <20210823144504.1249203-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29da1fc3-690f-4adc-2490-08d96644ac33
X-MS-TrafficTypeDiagnostic: DM4PR12MB5056:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5056594C57CBF2B88ACF95E1AFC49@DM4PR12MB5056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZ0l/srCQVzy3WFXodirlN7VSTyAZbWFr3sF65f1HK4WCFcgCdjkY+o/Aexb0eG7Gg3phlpi99KjbKbZrUI4uKHT8X5eQINnNxMvgkHtnn1mszRkpJN+KgvsPAklKLgROgURzMP2mTbKg7bvQ1DSyAQC3lRZ3qAOzilSXtP2wlqGLLZ2BQfjMInyulhWUgiW9rcsK1fTPGT2iHw+Oi37RNUlnBsNtQGIc9xlxp1EpGkWjRO3mkSHtoAkYS+Q2P1lZTUlg3pKdTs7Vq0NPZLxO6qlFUZy2Zk2lUrYJdLUKBMCTemFYNxjwdHQYsXgdyTIu1aE2aMW74vqTX9Bz7jjvXQ0J1nbdBZXXrAmw+4Ux/VvbxdPltJnv6We7V8dYc7SGtnU6Y9YKW6HINnofNUnVuvav0CPk1QPryTBCMAWpVuGSKvx1kc8rzOwhh3O/EjZMvOsN8D8/q0XfZjhJIZoLgzM6EaW+QsjiTdpfVmen6WaQP2eFZ3d4evG+3m1oWb5A7NbO2tzSa7eLSJ8GrggNO68li86NVXyGcalCUEzlbV1tvIVD8rGCKmdoUdke7YGcY/RUHZtiPPnkcGz1EH3dScq2vL0ou6vzq+hJv1IE1XhQW50lC/L9wLjh5qK1eAFOMsUdb40bh/uqZMAYjiA5nkFNZSvsOschWFlEvf1zmJtnlI9OZDDN+ZK4J/ErmUvRxIQLXosR9f9rccgwCNxWRXA+RdJhr8i6W6mm4aihGo=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(478600001)(54906003)(107886003)(86362001)(5660300002)(2616005)(82310400003)(4326008)(2906002)(36756003)(47076005)(8936002)(1076003)(7636003)(6916009)(83380400001)(36906005)(36860700001)(316002)(6666004)(70206006)(82740400003)(8676002)(426003)(16526019)(70586007)(356005)(186003)(336012)(26005)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 14:45:38.0599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29da1fc3-690f-4adc-2490-08d96644ac33
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5056
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allow polling time setting according to I2C frequency supported across
the system. For base frequency 400 KHz and 1 MHz set polling time is set
four times less than for system with base frequency 100KHz.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 615f0a98640e..56aa424fd71d 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -73,6 +73,7 @@ struct mlxcpld_i2c_priv {
 	struct  mlxcpld_i2c_curr_xfer xfer;
 	struct device *dev;
 	bool smbus_block;
+	int polling_time;
 };
 
 static void mlxcpld_i2c_lpc_write_buf(u8 *data, u8 len, u32 addr)
@@ -267,8 +268,8 @@ static int mlxcpld_i2c_wait_for_free(struct mlxcpld_i2c_priv *priv)
 	do {
 		if (!mlxcpld_i2c_check_busy(priv))
 			break;
-		usleep_range(MLXCPLD_I2C_POLL_TIME / 2, MLXCPLD_I2C_POLL_TIME);
-		timeout += MLXCPLD_I2C_POLL_TIME;
+		usleep_range(priv->polling_time / 2, priv->polling_time);
+		timeout += priv->polling_time;
 	} while (timeout <= MLXCPLD_I2C_XFER_TO);
 
 	if (timeout > MLXCPLD_I2C_XFER_TO)
@@ -288,10 +289,10 @@ static int mlxcpld_i2c_wait_for_tc(struct mlxcpld_i2c_priv *priv)
 	u8 datalen, val;
 
 	do {
-		usleep_range(MLXCPLD_I2C_POLL_TIME / 2, MLXCPLD_I2C_POLL_TIME);
+		usleep_range(priv->polling_time / 2, priv->polling_time);
 		if (!mlxcpld_i2c_check_status(priv, &status))
 			break;
-		timeout += MLXCPLD_I2C_POLL_TIME;
+		timeout += priv->polling_time;
 	} while (status == 0 && timeout < MLXCPLD_I2C_XFER_TO);
 
 	switch (status) {
@@ -498,9 +499,11 @@ mlxcpld_i2c_set_frequency(struct mlxcpld_i2c_priv *priv,
 	switch ((regval & data->mask) >> data->bit) {
 	case MLXCPLD_I2C_FREQ_1000KHZ:
 		freq = MLXCPLD_I2C_FREQ_1000KHZ_SET;
+		priv->polling_time /= 4;
 		break;
 	case MLXCPLD_I2C_FREQ_400KHZ:
 		freq = MLXCPLD_I2C_FREQ_400KHZ_SET;
+		priv->polling_time /= 4;
 		break;
 	default:
 		return 0;
@@ -527,6 +530,7 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	priv->base_addr = MLXPLAT_CPLD_LPC_I2C_BASE_ADDR;
+	priv->polling_time = MLXCPLD_I2C_POLL_TIME;
 
 	/* Set I2C bus frequency if platform data provides this info. */
 	pdata = dev_get_platdata(&pdev->dev);
-- 
2.20.1

