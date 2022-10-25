Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1011D60D30B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 20:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbiJYSL7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 14:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbiJYSL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 14:11:58 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2054.outbound.protection.outlook.com [40.107.101.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F77D8FD58;
        Tue, 25 Oct 2022 11:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCp6AjRbuQhNqt95cNH08CqFjcNSq11Gb1aieUilhBJOemsI04vfPWYh0JJPEHu2srTgwH5pqPjjg5l6I1a7gfzDZIhIcrVOn1uiGLr5wIK5kBn3T7p/w1Bn6MZcml4d1u3O+neIRHHV2dmNpk+e325NOQnmXiTtdUHga0TuJGncMzAaehaOph4NydHnXKmuPaljMB8nCAr4iC5hYNMWRRf6Xuth+/oZiZ6jTeRDPtfGdUzRsWJfN1KeswQIUB2khfHm9RziCrxVbF0W/D3fZCkjiVyWIDPcNl5mRwgEKcAnfu3syH6YG7EA4hSPa0owuqxpXHyFYcO4Hiypi7vZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZXN4wuKWBWSMNGgS3wSYJFClQ5kHk7fQ7jSk2lK7UQ=;
 b=TgkRKusrbgcrB70Vjr5M3PhowXBslaMbMopcp/SzllVxuJSl/r1BYmKNfebvxQMGi8TdrtgsaX2e1qKYra59q7JfdRrqGUf8guIPBM8e6aLH70NVfZbs2bRTjC+Gzsn8DPkZeeXOlwLKf+EoS/rKTkSz8qCIqlmVviWBmCruaFTUE6UWqiE6BdGrNYOWXv0wZ0HJsWyoohsPU49Yx5BeZ0pFqUqjbdPPOb17wF1JaTUMp5gNfYlue3Bg+KVQNUujenl5wFIjzV22bpSCHQjoglvjVnlmkT4WTs08m3v/NHOl03SFYPbLe9U0QtxBHeLTKvf5ZfYc5iPPfhc+xdS+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZXN4wuKWBWSMNGgS3wSYJFClQ5kHk7fQ7jSk2lK7UQ=;
 b=a3wV2GHJtdWYjbXtrL3J1ihAuqFC8wU49khG9LGuWJSa2xpN9mVqw1c088txE8nQx5YE/T7J2rzrYT+s6wpyv2SRN8ToO4Ejw2HUq0Lv07bU5iITizZ9qkXerk6ILp+dq2WVA6P7TDACxOtSmj09JnxCjK6+mKabua/1ygurBvQ=
Received: from MW4PR04CA0268.namprd04.prod.outlook.com (2603:10b6:303:88::33)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 18:11:55 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::5b) by MW4PR04CA0268.outlook.office365.com
 (2603:10b6:303:88::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 18:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 18:11:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 13:11:52 -0500
From:   Raju Rangoju <Raju.Rangoju@amd.com>
To:     <syniurge@gmail.com>, <shyam-sundar.s-k@amd.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <rajesh1.kumar@amd.com>, Raju Rangoju <Raju.Rangoju@amd.com>,
        "Basavaraj Natikar" <basavaraj.natikar@amd.com>
Subject: [PATCH] i2c: amd-mp2: use msix/msi if the hardware supports
Date:   Tue, 25 Oct 2022 23:41:24 +0530
Message-ID: <20221025181124.421628-1-Raju.Rangoju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d151ce-30af-4bb2-f552-08dab6b46669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoL+kdFGDxeO2G+sXYeZwK+8rA4leOG5eRs5ySvHnGv1CoKigSM3meUugksdhqJYdb8k/IBGxQprTpn/sYl/c1uh2d4DZSlNl43i52uWAEQWm1j9putAkIHg2yODCEmQXOKWsP7FJNCCga/g0l1DSI+t/FxuWrXLv2VUBqdBrQuRFiKiuoCdWbElDEvdxHd4e2t5YZ6GtQ8xRxDudDR0uHQWLJj4TUyD2J4BKUO+vQ96l5kGX4zvDkXeKFAKG1yrES95jyUPeBIbipcJM02gJ0k1C7qyLunf6zlvNUQ4/HMhAmVfKFCIjtCuTtLShagol9rQXUd3zRmVmYcZ4L50gV+nc0TSfjWrj7+bZwSv4r+eureqJ8zIG5fp6hhjaCb8N60SXIH01VVDVy615AUO2O1XD5bN2RgwuTg/CLWNpwOPj3UxQi6GHC6tA8PbdpFgjz9jdguidG8F46Pkh/SjSZFPvSoYm07DbGIoscHyC/euAH0RaXMb8N3WS8fbzs/YPgacbfhI4lfBW0W8W1XKqG7+mzK/wBC32W5qFFdABsv6RgRE7jgOHj2AC/ftBGzzR5ItTwAW89r9aqCqFUkdNhSihL5FlihHX98jjTDqfzMag50zXR2RKedVlJQdxnqEa9uKPkTpOGoCVSXEa6jrbimLmnCCDpD3RhxK0iDKFwNl8TszTpwv+y+7v4E50SxD1MhY2y3YdgsR/rewAg7JDpdnDMZXbJR1T7PX19J6ALApZezmTU2sTOej5sjmlQLhoXxuhEQK8+3pAWeAtSTgkKiharm5c5WfjPxeM0VTmHbT2CDOIAZc19h61hWdPVnCuMf6CDUoPMe/b+SoyZttYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(41300700001)(36860700001)(86362001)(40460700003)(82740400003)(2906002)(81166007)(2616005)(336012)(186003)(16526019)(1076003)(356005)(83380400001)(426003)(47076005)(8676002)(70586007)(6636002)(6666004)(70206006)(54906003)(40480700001)(26005)(4326008)(7696005)(8936002)(82310400005)(110136005)(5660300002)(316002)(478600001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:11:55.3528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d151ce-30af-4bb2-f552-08dab6b46669
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use msix or msi interrupts if the hardware supports it. Else, fallback to
legacy interrupts.

Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
Co-developed-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 30 +++++++++++++++++++---------
 drivers/i2c/busses/i2c-amd-mp2.h     |  1 +
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index f57077a7448d..143165300949 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -288,7 +288,7 @@ static void amd_mp2_clear_reg(struct amd_mp2_dev *privdata)
 static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 			    struct pci_dev *pci_dev)
 {
-	int rc;
+	int irq_flag = 0, rc;
 
 	pci_set_drvdata(pci_dev, privdata);
 
@@ -311,17 +311,29 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 	if (rc)
 		goto err_dma_mask;
 
-	/* Set up intx irq */
+	/* request and enable interrupt */
 	writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
-	pci_intx(pci_dev, 1);
-	rc = devm_request_irq(&pci_dev->dev, pci_dev->irq, amd_mp2_irq_isr,
-			      IRQF_SHARED, dev_name(&pci_dev->dev), privdata);
-	if (rc)
-		pci_err(pci_dev, "Failure requesting irq %i: %d\n",
-			pci_dev->irq, rc);
+	rc = pci_alloc_irq_vectors(pci_dev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (rc < 0) {
+		dev_err(&pci_dev->dev, "Failed to allocate single IRQ err=%d\n", rc);
+		goto err_dma_mask;
+	}
+
+	privdata->dev_irq = pci_irq_vector(pci_dev, 0);
+	if (!pci_dev->msix_enabled && !pci_dev->msi_enabled)
+		irq_flag = IRQF_SHARED;
+
+	rc = devm_request_irq(&pci_dev->dev, privdata->dev_irq,
+			      amd_mp2_irq_isr, irq_flag, dev_name(&pci_dev->dev), privdata);
+	if (rc) {
+		pci_err(pci_dev, "Failure requesting irq %i: %d\n", privdata->dev_irq, rc);
+		goto free_irq_vectors;
+	}
 
 	return rc;
 
+free_irq_vectors:
+	free_irq(privdata->dev_irq, privdata);
 err_dma_mask:
 	pci_clear_master(pci_dev);
 err_pci_enable:
@@ -364,7 +376,7 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
 	pm_runtime_forbid(&pci_dev->dev);
 	pm_runtime_get_noresume(&pci_dev->dev);
 
-	pci_intx(pci_dev, 0);
+	free_irq(privdata->dev_irq, privdata);
 	pci_clear_master(pci_dev);
 
 	amd_mp2_clear_reg(privdata);
diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index ddecd0c88656..018a42de8b1e 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -183,6 +183,7 @@ struct amd_mp2_dev {
 	struct mutex c2p_lock;
 	u8 c2p_lock_busid;
 	unsigned int probed;
+	int dev_irq;
 };
 
 /* PCIe communication driver */
-- 
2.25.1

