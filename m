Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7F77849AC
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 20:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjHVSwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 14:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjHVSwN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 14:52:13 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E87CD1
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 11:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaeC+65BPAvC1/xXOyGJv2GGLyDXF5FQsGUvKECHduBToJLKa3cg6utGqLTWtoJusDj1j9OPDQcHmnyE2CPD5UrDzFZlP+iqVnk0YrCZSBVnCQRyddimk23B5tX0D/xvBlgHEgmd3/SqsBLvy1qNgBjUpqqNKPZD7lqaPNIQ/G2RBInELGrUpVtASxT+hgDs2hDQpTrxKuA+3U24qVe3R46SMIy/zqhm+c0UBYNPQ0L4kcc3WdLCDP7A5Ey+RxpzGfzPIxCEE/HjqyltqtFnX85Ph7DdfcJKsj5khp1aSrQPHJW6Tp/Qb+V1oSXMExTVW22N2MqTVO8E+XhKqpLX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcWSTCqfpbZUKa0E2NEHSMPyw4nHRAK4MsV84sZ9Y9E=;
 b=YWxj1suQhEVF0s9PMrl6L7f9e1egI7sjutm+3A2mJtcdAi5oA1XAL5xrdibLATN5QaTeBOejwnKSd1Xt9u0VBoFnOw4X5T1lYmRZVf+NfhmjCAbCmQb29OsU85f5OAQIY4JINqAvdda7GgiqG+Mq8g/Fvz/YKr194DuIGMm6KV1d2xwlqYcFDkW4V6qk4dtywV7DxKpf5jrxLVT+G7T+LEdI55kOTCyqi+mlwOcdxR9dVRBrAXt+GlKBuvnHJQzzHJJ3PWoKJKXAcaG45REPwVOvyiCyKj1pVZmEWD/WqO3y0vC7Lis5pr07fZJSR0tAQ/4Pne/PoEtLqNoi6EEpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcWSTCqfpbZUKa0E2NEHSMPyw4nHRAK4MsV84sZ9Y9E=;
 b=kvRknGpeVORBhgoU52O1Ov4RUYt+jo61hMF6n09ie5Hm/YCoza9w4GC7c4alTt7C8/vzyWmdKVjidSMlgUvEqp3i4BxwlesxT3BfTajzVoLbAVOoP6Bf3xEUxMLHLk7QBGz8qmAITjG78kqRCIO7dk0MXQCAuG7aUPUqXO50/nh/+IFLb35TNvCPehx5bw/HONr5b+7IkfIrmq0ZaN98qAbavWyd8Y2jufmkBSJ1EXiyLN5qUwpWugIvngOIH0/CFmd1bF0w2Xz/b8+BDpaFXIwvQnuL+VDEsvfMyLshlY6D2bMk41LsPneOg8Yduwp26SXp4248adqq1ogQ55sd/g==
Received: from CYZPR19CA0018.namprd19.prod.outlook.com (2603:10b6:930:8e::24)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 18:52:10 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:8e:cafe::7a) by CYZPR19CA0018.outlook.office365.com
 (2603:10b6:930:8e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 18:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.80) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 18:52:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 11:51:59 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 11:51:58 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 1/2] i2c: mlxcpld: Allow driver to run on ARM64 architecture
Date:   Tue, 22 Aug 2023 18:51:36 +0000
Message-ID: <20230822185137.36215-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0973b871-e31b-42d0-3fa1-08dba340e38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIFSrX0SYINIkU4KAXuWsQES/yMWoca+/fcMGjvpNR8gr4rR/u49MbnBMyth3F7gpSfDEw62E7+4LgFl2Mrs9x6mFLoEmgd0VBHTgmX4/D/tukwwxy2V/pQupcq+7qe+K2M99prBjDPDibEBQhOf+lmgJ3hs3CG/McVf5DFy7qLRgKBa/3D1bpxzzttPkujay3+FcZCnJen+LpxFPhUC2XfRcXjW+pNJLyTZcCNZiZe5yy5+/psEZrQWaPnDvamlW1k5SHk6EyqBzHxrzvveqBv+lYDyNJkho6vtKZ/TrmLHccmooc5bS5dCccpxvet+e+OatwKcRgKuKVIS1fPQKWorvDz3muAEtWGj6/aqyok3okPw19lwLX2d/TeGKG12hqCGiy5uJEdpVAQ+9HFpnmWyLjNaj0Jv+lP3NQPaHnXvgA+zIzSFkLRwP8eKrLnN6InZyJxc9c5lEi0XdLBCV9n6HwIfdB0ZqpHEt4qzpas0xLrVXaFz+7Pu0pkRXOt7q4uuKnUnxBEEgFABxrV4A5UItPx4qKlyduKicWVHGio2McRudnjeKMOyXaSANrKKDksBYHRX8IUGTII8szXhryF97o+oKod6yTJSjbNbgb7mOs35JBZ5sb4RmR35iqqO7T6m/1Y/8erHKjTwz+gYehiTgsLsPYvHYAJYlL7vLWkg0SK/kgWu3f3SZH91c/ss5MK/Ypg31/H0gWGZUfYDAzm0mFrEBJzfRgtdgr9M4tNXcxozzJRJvJsvyjf34S7TZT++Ub5VLoYStdlFDwlaDQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(54906003)(70586007)(70206006)(6916009)(316002)(8676002)(2616005)(107886003)(8936002)(4326008)(1076003)(41300700001)(40460700003)(36756003)(7636003)(356005)(82740400003)(478600001)(6666004)(40480700001)(4744005)(2906002)(83380400001)(86362001)(47076005)(36860700001)(426003)(5660300002)(26005)(16526019)(336012)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 18:52:09.2686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0973b871-e31b-42d0-3fa1-08dba340e38a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend driver dependency by ARM64 architecture.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9cfe8fc509d7..169607e80331 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1384,7 +1384,7 @@ config I2C_ICY
 
 config I2C_MLXCPLD
 	tristate "Mellanox I2C driver"
-	depends on X86_64 || COMPILE_TEST
+	depends on X86_64 || ARM64 || COMPILE_TEST
 	help
 	  This exposes the Mellanox platform I2C busses to the linux I2C layer
 	  for X86 based systems.
-- 
2.20.1

