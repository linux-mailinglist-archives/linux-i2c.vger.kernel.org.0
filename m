Return-Path: <linux-i2c+bounces-11355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF8AD4A1F
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 06:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 203E53A571D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 04:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0C02AE6D;
	Wed, 11 Jun 2025 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FHnF/aIx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2678EBE;
	Wed, 11 Jun 2025 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749617223; cv=fail; b=Nd14t2zYthxgxvPAFe/3oLQTdrkiXNRMS1lWPVnY/EWxR+vZ72Nn0xcGvLecxxQqJWArmRHH94HzYw+DdDfgSClCPFQ8CvgquAMVtgN+FHHyqQE89ZQM2l8rcSx/mgEJO+09Il1dgWrJOqaSqdxubvaou6AtQawlkUk4G3UZo2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749617223; c=relaxed/simple;
	bh=9+ecf08c8WsZtrm+3AH+BSYAL3f0u64ZuTCjJ2KJIU0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LJ58CUajgsrktL8rFCfu3MQiNn8dz8OfZThtvMxQn4PBVIrBpFdKxaaWQjiHr7r9OY9dFIFPeMxYKXS9kt0TVpmAf3dipcHznGwmCYDdNzy5+raABQQl1mBf9anfMgYsNzUeAv0Yzm6slNNBJ5gYj4jyVLid4cRNrXU6z65RXEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FHnF/aIx; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJUgym+OIfNLG9TW0Vt6uWvJMNT2FlJ2KAVUeXpGr9zIVy8ch3UMzgdFZ6VY98n+evColOmjSEtbIdUPVD5/NokcrSv+4IsW0EUc7fKS3XuOCGRHA+PaeZj3CGGJAEa1VyOsdLQGai26VgKo/YuU9I0VPh2GnnUDTlOjE3PuWS9HfrlY5axPO5oDim62VudvAAvl/5Cm/uVd1OHT7Me0i5K0Zc4y5sToOu9Ne0fMCXdtqxIZK8dOcSszZ1sCfuFC56JPZn8FRzl70zVe5gIv1lh+n39kgz3Mw1a0nUiH7IKcSIgHbTlX3IZIC3G+iERQMKOS7Ton1C/KxDaloexNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8caeNbbLf7FC3JQlKO6INk1TIVz7yFSbyLHkHf/TIcw=;
 b=qkYE/asx1EpJFXBxcUHEGLDR4F0izAULI+fCNUn6xvJ3V7wRkFgbZvHszIyS0jo0kDH2O+Qt9Kt5oltKn90COjxDkTDdbCbYZTiXgvVLezA+vxMJrCkccJB2PTp4wG6+B+CJ9TmshSTnLDZ09qT8ZCz7zxoWPHQ+zS87ChBqeN9Qr5rt8PRHB541mia5UIxfkVNUGIJAckcEQOhOAVUW6G0GEN2NcN7baCNMPgUojoyEZCKNRhU3dyL0gQS3ykbImdw8UD/D3E4fXwxZ9XY/7ZB3WdzYaArtpr1U3wpwKswbHRa1HNLVlXpRVL+xtX6L5goCjic5g/7LFbJyj+r6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8caeNbbLf7FC3JQlKO6INk1TIVz7yFSbyLHkHf/TIcw=;
 b=FHnF/aIx59LHq66eLalHRUH0PQ/aSuf3g9p3OGT5/CQb3OVGFuGIAShvWxOESAD0H8B+v3igp/eXH2PYA8ckTM+JBuBlaBLHG1/dobNXycgvyzjdZAA0k8pr+Z1crS/b9yJC21tq6MbvJ9tmtDQRIDT7zqn7WC0vE7fCB6nMYZE=
Received: from PH8P221CA0063.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::15)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Wed, 11 Jun
 2025 04:46:57 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::55) by PH8P221CA0063.outlook.office365.com
 (2603:10b6:510:349::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 04:46:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 04:46:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 23:46:54 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 23:46:51 -0500
From: Ajay Neeli <ajay.neeli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <srinivas.goud@amd.com>,
	<radhey.shyam.pandey@amd.com>, Ajay Neeli <ajay.neeli@amd.com>
Subject: [PATCH] i2c: cadence: Add shutdown handler
Date: Wed, 11 Jun 2025 10:16:29 +0530
Message-ID: <20250611044629.27429-1-ajay.neeli@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ajay.neeli@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0771f628-ac6c-4566-d9e7-08dda8a2fe46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3h1Dm0hbuCCCUaQWVi9YenOevB0f5kiGTV36mRSAa4gMA7teFmwaCnGSf5a?=
 =?us-ascii?Q?XqM/30pG3sbmmmZ9FxQc7SAqdWEj0KXkSsUGndu/SmC0kb7ZoXfTJqm6m+S4?=
 =?us-ascii?Q?lI/wEQXSQVYS2DHcKHqznx6WIH59GppKCVywGMC+ZbjeB7g1ZUisLGIFJ15J?=
 =?us-ascii?Q?fYtPV9S7FaOyq9RiXuufhUpwYaKWtwW9O8qFZzObMIbMi5nLEcZX7k6vvp65?=
 =?us-ascii?Q?figMfyAKpkhBB2635ZYArFK6o0UsivzdL4Y6Pvwdf/OhOLIFfQXX5/PbtKoB?=
 =?us-ascii?Q?SP2sZZHG9GazjXkKp3bESftQcfvsyGtVEupa+0xs7Fg/kwdknfs9NuXt4YYI?=
 =?us-ascii?Q?BtFLm6+H0CkW5UMKCeQACw5H7VlfXVjaGpF4JcaNG8tYIdnYzDhZOPOYf/8W?=
 =?us-ascii?Q?Ve5wOMhejhR7RtZFnT0FXgSSnH6ZSRQYQNsipD7kzl8NP2mRCHbvqbJMkiic?=
 =?us-ascii?Q?vV0Nc43xsPd+c2i3WAjtyZWm7eG92RAB58OGjysYTfZm4guXcPBlyNp147jz?=
 =?us-ascii?Q?Q6MBLhN4kR5CDeNgTvVQdWhauYqd29ZgF9q7rgOxdVsxlL8huMJDKW6Rj/xr?=
 =?us-ascii?Q?BT/QJOLz9d4JNLK15/i/Ocw3O1gS6LWSOMGGDRGhciPUllQTiRb8bmNQ8hFE?=
 =?us-ascii?Q?5NlNSykLdmHwrgN2TUy7C9R5HYDOrFV4uJ5DspnWC34+K79+j7EjldnkaF/W?=
 =?us-ascii?Q?EG47cLLMe5kDcMX2vSaYypDZ+9750X3vkVWaEKFXlgynVq96KE2d0U7zx+kz?=
 =?us-ascii?Q?puKlkbHLqCdZMzjISwaYRbnPNcY5+bBw+dXKqOQkHxIHEws+jLEvjpLxqYj7?=
 =?us-ascii?Q?YMe4Rl+5XmvCAgs4hiIV17pJPkOb071Ay2cdOXyI+slJz1HWXXGZcoEXzbRI?=
 =?us-ascii?Q?0krAZr+MNw5y5WYZ1MbbkO3hGb7F4akx0HH56JfxixbBiHIWcYZAIzXR7FhP?=
 =?us-ascii?Q?CHqGXbGZZoYPWovlEIWcvY8BFDm6mZE6uEmT9/J1e3zFLEdxa3Er9GyLC71U?=
 =?us-ascii?Q?4NIU4X55u9OKk92NuqpgbPaykBQZXa65NwKDQGnR89p6+FiKPFm3Yyr8Kqv0?=
 =?us-ascii?Q?22S8NodtKn/7kFv7EzFwO23kWnRz5WLVu2OX483Ftbwik+BtRuuwuM9QpuV6?=
 =?us-ascii?Q?XJeawmBFjgSUgaFTJWf0e5ZBBOlpcZJo8Xv+KQ/5mw9CxT58svGJya8pLGwR?=
 =?us-ascii?Q?SbBV58IRus//v64M9AKulSB5MQKgas6ZbiuR8wuetCDWrwqS5h1oSjGcwVQb?=
 =?us-ascii?Q?Dh18KMOBv1MplhTezlwAIpHm48yOf+yA6KL2L0c2oHH1UM+7ZjrzYJso9Sia?=
 =?us-ascii?Q?cT4TC2Y1QpA3JDaP839Y6SSwtlD42BTzb4ReyxNOLquM0RkhKZcLBBRJos0m?=
 =?us-ascii?Q?zP7hkAuMEaH3UX9CcLsk7YWwTdK/vngbUROeG4SCtk3PLY8KAamGHOVRd3jl?=
 =?us-ascii?Q?6xM2jhuORIm9yoqbCjRiXqNFqpdJFzt8vnZetAKLN+hSNbm/8gUC30VS2hDK?=
 =?us-ascii?Q?qPu3Ye/OkULOIdfnzucF81/e2gykCC4YIVmI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:46:55.9974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0771f628-ac6c-4566-d9e7-08dda8a2fe46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436

Implement shutdown function for Cadence I2C driver to suspend the bus
during system "reboot" or "shutdown".

Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>
---
 drivers/i2c/busses/i2c-cadence.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8df63aa..5f121af 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1636,6 +1636,20 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	reset_control_assert(id->reset);
 }
 
+/**
+ * cdns_i2c_shutdown - Shutdown the i2c device
+ * @pdev:	Handle to the platform device structure
+ *
+ * This function handles shutdown sequence
+ */
+static void cdns_i2c_shutdown(struct platform_device *pdev)
+{
+	struct cdns_i2c *id = platform_get_drvdata(pdev);
+
+	/* Initiate failure of client i2c transfers */
+	i2c_mark_adapter_suspended(&id->adap);
+}
+
 static struct platform_driver cdns_i2c_drv = {
 	.driver = {
 		.name  = DRIVER_NAME,
@@ -1644,6 +1658,7 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	},
 	.probe  = cdns_i2c_probe,
 	.remove = cdns_i2c_remove,
+	.shutdown = cdns_i2c_shutdown,
 };
 
 module_platform_driver(cdns_i2c_drv);
-- 
1.8.3.1


