Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828E27849AD
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 20:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjHVSwP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 14:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjHVSwP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 14:52:15 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475C6CE5
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 11:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZczQyalqIWYyDDNSn2iotjiao/sWfSQW5w1u8ptLuOTEmtVr89OLvlbJNUW/v2RsmH/J7ULOp2Q+/Ggqu3bxnGRKjF45LGHj7FU/mLdFRnqKni9gAqC2gGzJvWnN783gw1DaTOdW0yEu3/X8dusYy9dx4fIZ79Fr1GSuj2L7O0l7ljBfet8FaWqxokaUKeWwh9A/5RGevMCGa/B2kiFH9CtGfp3kOTOTokl+WfeMMEzN+sU8Sf+Ok9m4Kzf6tX0njn8tZQ7/uGGVzAD9+7PBDsy8CWG6+KrGDlVWhygPwnCML/k9drnWDTpRwYBYqfnFCKcDkggtCH0Ng+XsfBUx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdTsG4GGruMk91tt+BKyTFJLMvd1mVqhkKmmGcT/FN0=;
 b=LVqgRAWQkaeyo0dzXcf5oh8xi/vtJGXwdwK7aDcYkE7YL4Hhuh+UuIMisbbwxC1dXDGr7VShWbskvdAEJhwI3OK1Kj4Tdzp5Dt/Myez2mZ9jkuRKxLzYmAAZZA2uKRQyqm7pkE2wB4pgEpqpK7EZP3JuLmbYX3AEfC/7jJcpzNSzZSefjuL2QzE8KbXbfvMO9pi09Q1C/7zfVEZraPI/JfBUmz/DsSDDQ+HFGcz/hSYnqLYZ+3i1GDBQ+oVBqZu1ZSrg6uHjODJkNK1QOPyHtpKiQq2aF5q2Quk9KveEfbT6I30qrw/Yiw4PgnBVn6ugk2vNnfxYNwraTSYWUAcMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdTsG4GGruMk91tt+BKyTFJLMvd1mVqhkKmmGcT/FN0=;
 b=uLa2eLRvhbJgS6v7Iaolhpc4Cpo/ic/K5PjZVXAQqM85ZFvXXz9ozEQf/j9RdqeAxZeKEBL55IIJBxa8wqDylD7eIrN9N2mX8ub8NCZM4qNJuP6S1NCbTZM8Ng1HGY684vCojUCVozjpIWnIN6oA5G8D/12xM4DC2AhTm22+MG9h7jolrmu8sx3QnIa35SfSfQ/1pO//dtYsFN8RHB5ON3Egw2o36EjbEOska6GkkrOvqFTBrRUQMUdmHkBnpG/Jwug/kY/enMYIxffFWnFCNKuHQBlCrU3ooIbsP6oefDSIdWbJno/B+64ebPZdLNGlsa06Mcn7tPDV2DGMVW7eyQ==
Received: from CYZPR19CA0012.namprd19.prod.outlook.com (2603:10b6:930:8e::21)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 18:52:11 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:8e:cafe::a2) by CYZPR19CA0012.outlook.office365.com
 (2603:10b6:930:8e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Tue, 22 Aug 2023 18:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.80) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 18:52:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 11:52:02 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 11:52:00 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 2/2] i2c: mlxcpld: Add support for extended transaction length
Date:   Tue, 22 Aug 2023 18:51:37 +0000
Message-ID: <20230822185137.36215-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822185137.36215-1-vadimp@nvidia.com>
References: <20230822185137.36215-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 22df15e1-d46b-49df-4622-08dba340e4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zb08ZJWYRjXi7d4yaAEQKUC6xxwBR7f8wJLtnzAriK4kaXZ3ptBJt1z370mXZyVwG77Nuw3wmTYXsaIuRhbc2Io8Z7gTIiIf7RqqsCilTEwSlJNnIvYYjlpEHf6wcFFztE91dknj1UuZOoZS+wMyLI3Gx6KzWUeD6NdMryrWph+BWsu/Kp63L8k2spNtgB34T6Jj8vDp9anHZTxO9NIdiJy+ELE52iiYaQCnjv9bvx7R2kr2GnTPOjmViKmODkhEt2fouousfZku5wHUD3Kz6EVBoGAvI/6uD/I8vZUG5p84LKu53IaeQRhh9aXlHANS9fROjm+KK+tY7JRvYmI/7ANuXZmM3eiWCxP5CDQ9RmUyVd7gC+pu9r5Kuo2XkzYSuNgkUo5ejuwjQl4gYdW8IAMy/pTvt61J0TgQKRNwn8xI2gmWWDaGgYwSx/i+DzQEPcmPojO78unHF4zk59uiG05BiTnyCBuu+moaPTUjdUel3fz9wYDBPPEsOpu8tCJilcUSWkgusWvx/gJztNY49f6vRLbidGjRl3KRU1KQwIAHlljIA/V57h9xRsuc3hZDQgEFe3CSLU+4FbwxUhokx1DGf5wA9mTIbliOY3QDUjunN67AufTlT1vEQcs6pOKrC+Q19cXXXg8urZGoSTVyQcro+WFc2iuctRE61fBm8Q1Sa+epaBwGU6eTiyqpeqWMoxmDxT5E0qfRjiYZRV4skZ/NySbDJi5EP5XANfmfuEH+0Hi7d1ObEni2LgN+iE3KJ+5MCdzIH0Pmj5/jNta1lqpqtLlQKoNSpDjFfovcAZ8VQ91nvmTgNAm5S1bise0b
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(83380400001)(5660300002)(426003)(336012)(16526019)(26005)(36860700001)(86362001)(47076005)(8676002)(2616005)(107886003)(8936002)(4326008)(70586007)(316002)(6916009)(54906003)(70206006)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 18:52:11.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22df15e1-d46b-49df-4622-08dba340e4b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for extended length of read and write transactions.
New FPGA logic allows to increase size of the read and write
transactions length. This feature is verified through capability
register 'CPBLTY_REG'. Two bits 5 and 6 of the register are used for
length capability detection. Value '10' indicates support of extended
transaction length - 128 bytes for read transactions and 132 for write
transactions.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index c42fd4b329e4..6fec64ea67fb 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -22,6 +22,7 @@
 #define MLXCPLD_I2C_BUS_NUM		1
 #define MLXCPLD_I2C_DATA_REG_SZ		36
 #define MLXCPLD_I2C_DATA_SZ_BIT		BIT(5)
+#define MLXCPLD_I2C_DATA_EXT2_SZ_BIT	BIT(6)
 #define MLXCPLD_I2C_DATA_SZ_MASK	GENMASK(6, 5)
 #define MLXCPLD_I2C_SMBUS_BLK_BIT	BIT(7)
 #define MLXCPLD_I2C_MAX_ADDR_LEN	4
@@ -466,6 +467,13 @@ static const struct i2c_adapter_quirks mlxcpld_i2c_quirks_ext = {
 	.max_comb_1st_msg_len = 4,
 };
 
+static const struct i2c_adapter_quirks mlxcpld_i2c_quirks_ext2 = {
+	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
+	.max_read_len = (MLXCPLD_I2C_DATA_REG_SZ - 4) * 4,
+	.max_write_len = (MLXCPLD_I2C_DATA_REG_SZ - 4) * 4 + MLXCPLD_I2C_MAX_ADDR_LEN,
+	.max_comb_1st_msg_len = 4,
+};
+
 static struct i2c_adapter mlxcpld_i2c_adapter = {
 	.owner          = THIS_MODULE,
 	.name           = "i2c-mlxcpld",
@@ -547,6 +555,8 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 	/* Check support for extended transaction length */
 	if ((val & MLXCPLD_I2C_DATA_SZ_MASK) == MLXCPLD_I2C_DATA_SZ_BIT)
 		mlxcpld_i2c_adapter.quirks = &mlxcpld_i2c_quirks_ext;
+	else if ((val & MLXCPLD_I2C_DATA_SZ_MASK) == MLXCPLD_I2C_DATA_EXT2_SZ_BIT)
+		mlxcpld_i2c_adapter.quirks = &mlxcpld_i2c_quirks_ext2;
 	/* Check support for smbus block transaction */
 	if (val & MLXCPLD_I2C_SMBUS_BLK_BIT)
 		priv->smbus_block = true;
-- 
2.20.1

