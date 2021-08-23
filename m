Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A163F4C94
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 16:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhHWOqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 10:46:18 -0400
Received: from mail-dm3nam07on2053.outbound.protection.outlook.com ([40.107.95.53]:16160
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230034AbhHWOqR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 10:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFLqTlotARTkAFyNu6AXZnfGWjSLPPpGYp9jqG4JpBdFgEWtRgnGRH8LCyRfqbS933xlhWJvfPXOTGx36LED7eSJO5eaA9WV+yjp78Z1gYSK3KvHia/N3eUKFg+ZsohylymjbzLeZt4a0iuyCK0eitTFwZph29l+xig7fShuNqV9Qnsa0c2vAbL+20cgue9Qntzrpg/D58fKKAwRmU1r0hg31KuhiNnJ3wvoUUrPeKtcRj5Ly9YzKvTE4i9NuAS76w+9ZEXhcRcA4oHvIrU0qjhkwq6CdZ1PyDhZQkmCxIi3BqEwBPlxdEHVt21qE+W1cAgqQO2cJwmcd/NnWnsf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brskK6KkJLd7GMYWJYj9QFsecBFsQyHMV4VYCwbPnvE=;
 b=UF3oKdA66sIBs5ucolqu2IKbZ56d7seqzdLviq65CunyeCpPekU9Mbv1D2xkU5qFuWH0CLgwCbXlzRqcXrgPbtfsGkhmkPNvNrpaoUnlaDTEv1LH5iq3wmeWaf+GxlnFwX+CNJQUQaLhzIL94dVw7mJBgBJHi5Pj0rLh4OfRgQbF4NPg2kNGepr7m9N9GTu8thvenjXL5UouAEmInGc0nXFzfDLPjlvwBo1aMZoMmgGWEdoa3lPzS4i8II0SL8STWhK6YyZhDEp1d4uJlI7v+puhABl8K5YHq3fO8zufALbhfF7VWO6YRXUgL40gpDcp9SmNggKpgy78ORP7DscN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brskK6KkJLd7GMYWJYj9QFsecBFsQyHMV4VYCwbPnvE=;
 b=S6lz5yqY5fJaQv8U5lGunKd4G66n+gOh9uvI8jEy76ZxIA9hVH+6UOa8D4F1OyQWy5KJZwR5ZoiEyxAGWQ+bS+Ofx5D4ONCk5CDF8C6glEbJYC0cdyCnKGflR/dG3P33NBFKyiHqh6IOluo+5lzCoNHMcHRzvOL2FzmNhx7TtEb8sbwA8xt/NwKvi64tCDrLHebRQvDB4JUo11T46+vYJx2bGxDsJ2HGryDv/3VZ25XEUXqFh46aKTwDARXIKg3pQ4OQRVVub1M9fJdifgrB9NF5zNYK61bD0oqP3QaH87hlmASFu60E2Ex2K/Jl6Pu1aFjM6ZsNT0js8lYTIrVFJA==
Received: from DM5PR13CA0040.namprd13.prod.outlook.com (2603:10b6:3:7b::26) by
 BYAPR12MB4759.namprd12.prod.outlook.com (2603:10b6:a03:9d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Mon, 23 Aug 2021 14:45:34 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::db) by DM5PR13CA0040.outlook.office365.com
 (2603:10b6:3:7b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend
 Transport; Mon, 23 Aug 2021 14:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 14:45:32 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 14:45:32 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 14:45:30 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 2/4] i2c: mlxcpld: Modify register setting for 400KHz frequency
Date:   Mon, 23 Aug 2021 17:45:02 +0300
Message-ID: <20210823144504.1249203-3-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: ea9a0a04-f48f-42ae-cfb7-08d96644a923
X-MS-TrafficTypeDiagnostic: BYAPR12MB4759:
X-Microsoft-Antispam-PRVS: <BYAPR12MB4759206D57429204F7C3911FAFC49@BYAPR12MB4759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1egwCC1QeeCfr/enerIO6zIyj+/bNztkmJ5Pimutx8jZv0q+HgW8yf6T5xXGAFYzHSUPGxTF6ygPLJC6XoTu8I6NEBijMMYEZMPSetL3+PNKSf7aZun6J7hkPiX8ZqBwW+tBrm7/s7gH+ZkwGOs3hMa7Rl3C+lDl4jkiOFJzNXk+j+VWBNbE2gU4LvOyEdyhSxDh3Umn22KQw4e+PA4Q3aXAIR54+ofSQGmi9EioBYbt+bfjVhHjLxasa9ydEstRe1/KkPXC3mKSNw87kWTcpMK4+lt/PJF6831s1gIqlEzVzjRb5tIOHKhJ+fvteB8JitcVaE0HhRCoOTdIKm+ab1DHSjz0Hu19vV+HETuvcYYv+/IROm2u2CfGPd4prBmakApfr99197LEN/uqlYk6yVkjm0kvgWBC4BW+P36eMoLTRJbGJu8Y/MPErn8vfS06dF5YlElCrDlQ0UVxNNHSYQQC9SYJ1qpe2ELtyDBI9y87KmTp+R9WRY4+dEwdjmRC22hUQsKp/18AJR2H2m2cS4Xon0SVZ0BKa6yqLA9NqRMV9e5J3KgXmTdaMp6PbtO4NPSV//ovP7trzXWBtXNxLdW8g8hvV8ZkNT1XzydcVihziMqHkkwKdAqbceiab+6FnsnSLQIeG5x2CRydFZtgN460Eo0pgMjMUEecvjra4vcd+1pZFjpYuFa13k7fnUnnLFdoxNxKCeJZ+2di++YFsdRzpF96HdqFMu1bUgVHWZ8=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(70206006)(70586007)(36756003)(316002)(36860700001)(508600001)(54906003)(36906005)(16526019)(186003)(336012)(426003)(47076005)(86362001)(2906002)(7636003)(2616005)(4744005)(5660300002)(4326008)(82310400003)(107886003)(6916009)(8936002)(6666004)(8676002)(26005)(356005)(1076003)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 14:45:32.8523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9a0a04-f48f-42ae-cfb7-08d96644a923
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4759
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change setting for 400KHz frequency support by more accurate value.

Fixes: 66b0c2846ba8 ("i2c: mlxcpld: Add support for I2C bus frequency setting")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 6d41c3db8a2b..015e11c4663f 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -49,7 +49,7 @@
 #define MLXCPLD_LPCI2C_NACK_IND		2
 
 #define MLXCPLD_I2C_FREQ_1000KHZ_SET	0x04
-#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0f
+#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0c
 #define MLXCPLD_I2C_FREQ_100KHZ_SET	0x42
 
 enum mlxcpld_i2c_frequency {
-- 
2.20.1

