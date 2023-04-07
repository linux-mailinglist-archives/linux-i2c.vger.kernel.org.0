Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E836DB564
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Apr 2023 22:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjDGUhl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Apr 2023 16:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjDGUhj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Apr 2023 16:37:39 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4794B7DA9;
        Fri,  7 Apr 2023 13:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtlA5KLCY7pWJmKBGyM6GRFu7oWEF/z0gcVZspLMIX3iRUSeNBGAKEEkNbPf9KR9md6H9A4LSufX9+ifZ9/mC/BWjfacDXGzAuXbh3Rw56RfET94JG2I/E1MVM5chwrP1JNWABZb0CMMzO2CP5IsokPKGf7hBige23Y2eqiHQiMfst46ZWTdFTJfmXdkhaU8eN1x2ia7FqgMnsn99ZP4Yxa60omDhJ2kMYcHfSyRN+7JTxeuDWpQdHuRl17duuGWwDB6uorrCTEdYe/IFbP0s/nzPlPNUxDZsUBagSDmiJIChN052e5YXSBmPs99yY2UozFv84JLJ4EAzsjilembmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRh9FAPnPiiNbXwswWSCRvsCSevVqq3LWNbXULXDEhY=;
 b=AVvwqZvp08xegJ4zLdGVIu5uLG6V2xH+iiFurtGIPapyHjQHXBK8NZ5unIe1Hu2uT/f40YvBWavoWLsQWVFxxvNzDqIB8z4/bcd5tuzd1pAl0eFvSRB6yQkSUvT6EM7NlZmInv0F80ydkvGm2o+AswyM/EM/8xxhBKOXw5z71tXw2XVJq3YumJKaPFhxycIdHuPBfdBIDKrVS/cmTeqRhdDTmjhWFuzivyeL/nv+SlwdylA6t0fpqy8dafeGIDKaAyIEBTemmhK9oP4LjVN2domuMSNFxidmSt7RP00ZtEqt2BjrS457FKN4tnCfKbjeexpK22xYDqcnUhESdHBz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRh9FAPnPiiNbXwswWSCRvsCSevVqq3LWNbXULXDEhY=;
 b=Y9d7LdHE9dS4FXVYGUatS7ejfcjyhSZqKNIsrv4MO3nZyP62GADWOMizd4K9XLoT81lQZ2+tGx3NhWDgsbmRdQ4oI5SQfDINM9UNRZrZjmsoM9MsLHnWgGXT4dBvUO8mEz3FLxY7Tq6H1jj6veot6eKyrAOKMhOeMdo5cV/R00U=
Received: from DM6PR02CA0119.namprd02.prod.outlook.com (2603:10b6:5:1b4::21)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Fri, 7 Apr
 2023 20:37:34 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::e4) by DM6PR02CA0119.outlook.office365.com
 (2603:10b6:5:1b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34 via Frontend
 Transport; Fri, 7 Apr 2023 20:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.21 via Frontend Transport; Fri, 7 Apr 2023 20:37:34 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 7 Apr
 2023 15:37:33 -0500
From:   Yazen Ghannam <yazen.ghannam@amd.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jdelvare@suse.com>,
        <terry.bowman@amd.com>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH] i2c: piix4: Print FCH::PM::S5_RESET_STATUS
Date:   Fri, 7 Apr 2023 15:37:20 -0500
Message-ID: <20230407203720.18184-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT008:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb6fda8-f769-40ac-e62e-08db37a7ead8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HsbxbwE/1iu6VGuOVzS74qIB5waMkt2SSfPQi6nT2oKuP2gGwz3yQ9WIWOTAXzv5hrLQ0PoioFvKSKfeNzK3m+aTJcawhaZdsbL9c8MOScQGxX4kcW+3sxlKbmUbAgItlTV0VKDYGKuFLcXPt4b7AvvLqXNc2fV8gbejxB5KT816/R5/Ga3Pz/FgPj85OcJQLKUT42wX5TqiTU9e4j/cCUQmRwTHXYe6oY51WY5jGiWpFpn4AUQKzwwRJDyRvlYg/7VQ5YfB78+hKbgZQdx0ElKUBDSdOcSRydA8XiU4DJeOOB0I4TzkVg935zLl4SFObs1K3f7/cUYnuM7DFr+7JBhDjZ5husbe7Q0lpe8igh5DSugeaYHEzJBwx22GHPJLy2vMNTsWLVYw1ij9LKojozKkFesLVHk2DXjGbV5l9s0v2rsiBN1OLdxIx6HABxfAvWrSyMY1IaYmzqKlARaBK+q2zTF6hLedYRuQ1oABKXWkKSoaQ23NQcmtehp6eDjJdN1nzLAp6EDaQ26G9YQZrzI3iMtGatR6PChvcHpS+Bz8Z9vGWOSPkP726dW3BK/agFLjZDPPBVBXoWTX7HAMSbGyd/Fzuh/K5cW1cBY1bDtVuo3ozJTX4xMTvuiUh9D6ZbbtPZlFBuzUwZ077WvZmeHKJGHkokfkaBVljyiC56ut0ldOkAh5OP/1HxtTdrNf1gmaH7sCn0glAh3a7hJ9ddjn5iNPBTDZ9am4mn02s2I=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(316002)(16526019)(47076005)(186003)(1076003)(6666004)(83380400001)(26005)(44832011)(36860700001)(54906003)(82740400003)(5660300002)(356005)(81166007)(40480700001)(336012)(2616005)(2906002)(426003)(8936002)(7696005)(82310400005)(86362001)(41300700001)(36756003)(40460700003)(6916009)(70206006)(4326008)(70586007)(8676002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 20:37:34.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb6fda8-f769-40ac-e62e-08db37a7ead8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The following register contains bits that indicate the cause for the
previous reset.

        PMx000000C0 (FCH::PM::S5_RESET_STATUS)

This is helpful for debug, etc., and it only needs to be read once from
a single FCH within the system. The register definition is AMD-specific.

Print it when the FCH MMIO space is first mapped. This register is not
related to I2C functionality, but read it here to leverage the existing
mapping.

Use an "info" log level so that it is printed every boot without requiring
the user to enable debug messages. This is beneficial when debugging
issues that cause spontaneous reboots and are hard to reproduce.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 809fbd014cd6..043b29f1e33c 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -100,6 +100,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_PIIX4_FCH_PM_S5_RESET_STATUS	0xC0
 
 /* insmod parameters */
 
@@ -200,6 +201,9 @@ static int piix4_sb800_region_request(struct device *dev,
 
 		mmio_cfg->addr = addr;
 
+		addr += SB800_PIIX4_FCH_PM_S5_RESET_STATUS;
+		pr_info_once("S5_RESET_STATUS = 0x%08x", ioread32(addr));
+
 		return 0;
 	}
 
-- 
2.34.1

