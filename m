Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58158697D7B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 14:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjBONdQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 08:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjBONdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 08:33:14 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BB5358D;
        Wed, 15 Feb 2023 05:33:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeIjioxoUTQPE4ZVT76rF+/RbHBozV6eZy/JhrXFMkZrgVtd+Gkurca4tJImbXBvHEfZZPlUyMMBN8Ji1hrlxzMxGazICXG6sahPLJH5erAXK5aBspY2Npxz2LFYqQQSrUlMtQ0tDZz/VciuQeSwjtkGINVUfczqV1nR0Pqredfrj8ed303ROBkuC4HrxvsOkTJxt64TyvKxhxI6FbE6zxzZWPQFTCM8v02j45hKMBdX972Zqt1SdE9arD7oevqIHNNxrPQ89QUWnfAAGEb+M2+3FL4RWogwTl9fXBsdq7svQOj0vXnlDN5aojyjxEibfBbaqil+7ctO380ju7YITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NntkIq1M06a9B+y/OJna6QefVd/HKbYhpe1gAyG6RY=;
 b=LiINGttGqQ5JeMFSALPYWtTssVSKv3aM+6j0LNopbqT7MTOE7TDOssc4CKCgmRGD1RnSHUjkuwqFbPVqKKMImED40ABKH2KuLD2da4P+QYL7hj40YiyRyi8MOjsU6q/WSR7o5P2T8w3lRqLrc+3vY3YICs2Y7M3nXuKJTBnpmlL94npBgfxAGQIwj6Ge/Nuz7udL3Mpv3XVEd1BRUsI2oZbEcx68YSVeIYSlov109JjmmCPvQ+0Th8IdbtA3hwHAp1OnIFuHUdtlsEimzU4PnBRPqNtfAVuCSBRH89bqk1MHT5Zo0nIzs5UD33NYEvLS89rshaFvdcaYwo/cZ5hpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NntkIq1M06a9B+y/OJna6QefVd/HKbYhpe1gAyG6RY=;
 b=FWfAlA3RHmsrffjnDzqkyA8JrklUmVSwEIpKCrc7IUwK3pPYh37leM05r8veFcLo9R/Yg3qQ9usVRcR3HLzBjQ45t+CyVHCnWnF1OLwNHXyNkG5brjuYs2PCbVI0GEToUwtQaxnm7CPx4/WDklv7fbAOxCxWe5+PETelHrf4IvI=
Received: from BN7PR06CA0049.namprd06.prod.outlook.com (2603:10b6:408:34::26)
 by CO6PR02MB7748.namprd02.prod.outlook.com (2603:10b6:303:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:33:10 +0000
Received: from BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::97) by BN7PR06CA0049.outlook.office365.com
 (2603:10b6:408:34::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Wed, 15 Feb 2023 13:33:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT055.mail.protection.outlook.com (10.13.2.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.12 via Frontend Transport; Wed, 15 Feb 2023 13:33:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Feb 2023 05:32:54 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 05:32:54 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=42320 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pSHu1-0002ig-Ue; Wed, 15 Feb 2023 05:32:54 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 022B61055BB; Wed, 15 Feb 2023 19:02:28 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V6 2/3] i2c: xiic: Update compatible with new IP version
Date:   Wed, 15 Feb 2023 19:02:23 +0530
Message-ID: <1676467944-17426-3-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT055:EE_|CO6PR02MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: e48e83d1-2416-4eb8-759b-08db0f592dcb
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEeHQAg5GSyjYBzthvU+Xn6i/hZxaRgB9xj8WRoLDT8AD1dDTNwkYGsmg+IHkViwoZd3veS8kHA5d/3hEiXIq0qA/0Vl0CZKzISxDgr2nqqSDa8kvC9YdYNkVLD5u2Sa4aPcL1L3AuaUxUbhp/vCj88NMW6CG1hIHB3sgBR1aJlnV7yPrTSdP/BUyaw56iPjOEoTSkXFb+1SneNE/csGIBuyLZ3JPw/WtZnUhyiyOLXFjAqCVo7eL4UXDqI8nJRG61IoiKJpkSknRFMM8TlSZKHL0F2ETmQ2+/7Qw0TV2GydB6tE+ytOLWX+fLA9lEJ0R18bjlqGU6eLTyDCCW4pjfY4FehQxLHB1VP2SlSQ8NHOvnujja2muYluj97uLou0OacyLpXz1RIQIMc8Uz9uCuHd4fxo0DnBjo33TSeQwAeT9bSR6Zk2vOila/pxpGBRlxtmX1eitEV+zQwOS6+7fQ6j5ZUh76TFXQyTdsNCKMx71R9pMnaGjCjS9ewaC8GHNPVpFiLRlIiTYk2BfSkDBL8uGu6vbIu/9eeMvIUfQC86QXu2s1qLPIBMY6pjJlXIMjxmKf2zLhTGj8vI3tg7rK7vx8eM59D+H3O0eG2er6HMAm8Nqn7OtpGEh76KHIQD1yUMr+Ho76tGL3/RaIhVKYKxV691zNu2WhbDG/m2UC00Ls6RpHxPcx8jyNAwmmJ29hheUdEAIbUpHEt3djQ0nnM63kPZecYPF9IWY5bCamVYZoz7iA99F69kP9Kvx95X
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(376002)(136003)(396003)(346002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(2906002)(15650500001)(5660300002)(8936002)(7416002)(70586007)(70206006)(8676002)(4326008)(41300700001)(44832011)(316002)(54906003)(42186006)(110136005)(478600001)(36756003)(36860700001)(6666004)(107886003)(336012)(6266002)(26005)(186003)(42882007)(2616005)(83170400001)(7636003)(40480700001)(356005)(47076005)(82310400005)(83380400001)(40460700003)(82740400003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:33:09.6465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e48e83d1-2416-4eb8-759b-08db0f592dcb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7748
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
Older IPs are handled with a workaround in which they are using
xiic standard mode for all these effected use cases.
Add the new IP version to compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
Changes since v1: none
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8503b5016aaf..682b3567e83e 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1074,6 +1074,7 @@ static const struct xiic_version_data xiic_2_00 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{ .compatible = "xlnx,axi-iic-2.1", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-- 
2.25.1

