Return-Path: <linux-i2c+bounces-5685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A595B841
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10466B26F8D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062AD1CBE8F;
	Thu, 22 Aug 2024 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FArL2cJo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144981CB336
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336563; cv=fail; b=Fd0Niw5phLVdIUwG7E7ULdzxA9PPVxnZa+F1Zwc5ZWHHan3tXYi9Ispp8mjqWOnporUF7MzsyQwqqDHNzW1QGgZI1GI861Wmvqo4xRyaajS+lzYah37nKGIJlyqmNgH4iLQv+kXHDpJr/8FL/FDIqkhN26NDgS+fCXasjveS19k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336563; c=relaxed/simple;
	bh=uLv9i/aqJ6QS8wBELy89zT4OW859UkgSE/LQpMC6vxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2jTbgWxk1orhYJcWJAW7MRVYE9KHrLpYTxBb6QN2XdSpTW4OLh1+OBB9JB5BoCU9fT+FlsAAyBgBYSbuWWEvlXVKdn3j0YpokzyzPYlifkeKtufNVacEJXw6wRl97p06l51VnELG0RItWpFD8ZNFmsInsVwxHkua4Bcs8XLpxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FArL2cJo; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JszSQcH+QK84h8Iw2IPjnnBhZIJeljIeCgjYyZkfwxDA/iqrdTLaK1EYwT8jcVHcAvtRLWKN56bkO8ydmD0/JiKsDhy/Q2LGuazemOPRDaeMPIISOQye1xS0fc9D5ReRqWQQbTMuWYo2b+ygVHJ4mvxTYt3ZjM5ZUpwW5dud41/qu4P+i4HY3/G9/WvK7xiH2o3xIwiPCxTN2rvICErshdli7rL2DpmLViwI6JxVZ8rrehylEZDFWgmnCt4DZx6fPsRLXcw/pokOmhd8yctHA8RacQkPSAfOa7SXRA/ugiuQgyatEgWUx+8066xX73lhI2DTBPLgctCCM+zkKmJZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Dtr8v8y3YwVOl7LwpOMjkyNDBXg8iglxL6YODslKqA=;
 b=dlqeU+wqJ8Ydxh0yP6neM+49/PZf5IVLurkco2P1ff4RiSmrzF2J0qlVJCcyQBtyJ0yI5CVMvg0PUuRqNKr46w20tXFjot5AqkePLHcS7CNrFrcmVlgRARLwjqBf+2GSqHgRi/LRRdovbm+9bymKkvePegMRuYupyCuWg8RckFFQVnE20NuOvIhGkE5PSExhpyruosl/DPWVgDcpX0Xhz5H0xyGCh1iPe0LBbgRcWi/NVwvaJrAQPzDga9BSoMKSobTKhG1nNAhjAj70ecpFwp0GSlqnakeANpRbwOwiISNGcwTAY3bJMTWr24Ug252/eDmKMMH5EXiY4l3yXG3C0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dtr8v8y3YwVOl7LwpOMjkyNDBXg8iglxL6YODslKqA=;
 b=FArL2cJo7e/zmmjfwY6kdz3SWDpV5eaQ1iMX34ZS1U2wGHVTa1oKn6be2GD8gthEl4RvZ4eW/zc3Z6LrQ5ebT9UxITvT/G3PjgtgWco0jXtk4ImCG6WG5Xd5ORIGyymkrecPiYlhwS9UiMR1Q5ue8VWvU8lLJwiuiVLMM79DoOc=
Received: from CH2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:20::18)
 by PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 14:22:32 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::5f) by CH2PR07CA0005.outlook.office365.com
 (2603:10b6:610:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Thu, 22 Aug 2024 14:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 14:22:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 09:22:30 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] i2c: piix4: Allow more than two algo selection for SMBus
Date: Thu, 22 Aug 2024 19:51:56 +0530
Message-ID: <20240822142200.686842-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|PH8PR12MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 523a9df9-d9bf-4e87-c593-08dcc2b5dc8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kMDYjxhwKn6IVPSsTWHHECqXZ6FxbY9JQo58CyDUtSv4xIErooUjWB9EC4lU?=
 =?us-ascii?Q?NEyntZ/FeVD7j6AKCLiNjpNAFuppLJjZMB91bdiREoShlKF/N2kw4HibBJzH?=
 =?us-ascii?Q?s8Ay5yeSdzTCTZFpFnTi4VnujrgNoxrmGfYxq42uoN3t4r1D4pcmq8fyKGrJ?=
 =?us-ascii?Q?nxrYdw+BKSjWnBeUs2SnAoEPiytfY9ZKr2BQqI2VwOpZYrftyCZ1dIBrIqcV?=
 =?us-ascii?Q?BwLsudT1zgERux+BcgX+8lZNJDJHXuvJLL20V+kda9T1Z5/j48gXRshkaA0S?=
 =?us-ascii?Q?TnnzHGdsb2+uSglrLG6oJekVGeHYGKmKBXT5jE0AcT6CQbo4mcDV25UZBLCS?=
 =?us-ascii?Q?07w/ntU8u/xaxdW9u5VLgCdXXYhW3Fx2G4fc2Vl3q5P4HnpxAcVJw+eG6lln?=
 =?us-ascii?Q?2yB1lMfRh3Q3ZnyWTMdcz4v0f2HTdBD7LI+21Mycegp0TNn6391abaQXwGO+?=
 =?us-ascii?Q?6e6wcl2Cs2bwVQreaKU0/5WZRWf8xGe6LpJtsurgT1zo3r+WkgcpFEnm7p8d?=
 =?us-ascii?Q?I49/rGxSe0b2shYRBbr1DjUd5oKvtN8XWyr8lcnXaPiYrvb7SytYnoGrIKil?=
 =?us-ascii?Q?fujxZIkuQgUaVoRXXn0WQog8VGEUiN0dOb5D1SJ7xnnL/anvDOVg9w0jmb/J?=
 =?us-ascii?Q?ByuEVO89XAw07ZZ246BnVawPbSgLCUXm/9hZC8BIFePcvWDdiJIA+7hzSYrf?=
 =?us-ascii?Q?sMRce1WB3O8tFueJM0J14pMbyd+R265+ijiHPP4zVbRgk8jn7mxfgKPMHaWJ?=
 =?us-ascii?Q?TQLbpddMc5QuwVw7Kn7tIe7yYD/NB59rqNitcUulHfYiDgyA9tO7ubS8QwaF?=
 =?us-ascii?Q?vCu5T1g2b5pMSJPsTGNqhqV+nDRzGaixjZruilorFFvnVZMv3YQSvDE1xa96?=
 =?us-ascii?Q?sdacexqRpQ1VaYm6QWJ5Joij44zkPk/lMWfKAYiQCpoCuAy6Xd1vVSanKm/+?=
 =?us-ascii?Q?uAYkghmeKE3f9pfu3TC3ejo6Q/If4+FAouja73N2IlNa61Z5Ynv8ZZerHyJ/?=
 =?us-ascii?Q?7FRqKgRXYSa5YG4kVmlsXoUcyImvX8E9rNdKECbab3QwKMwTTXO9sEtxjVmN?=
 =?us-ascii?Q?UxKLgwpUco3xSndJ4sluJNKVTaXTPDhVzy+wOoQB1V6DyZvOVWpD8Vmy4ZIw?=
 =?us-ascii?Q?rGdZHYjOPTLKSfmjlHjoc7IENJZy30dCSVNu5MQQ514RQJ+J3mrTswunQi+M?=
 =?us-ascii?Q?vnY9i1sGmDnPTDJemyEj+qI/dURbOrtxwl7U7AD9EgvrYje+1tZUp/S7msDS?=
 =?us-ascii?Q?HR8gFxS4OKV/jk2S84uFwJNsKyZOXpf9iRzb6cm+bQHYNQ2Qn5wQl7UQkhBv?=
 =?us-ascii?Q?GdsPz5uSn4bgyh7PO9Hg+VXxzBjGHbFoUEl/M/bXo8HEU3a9vwrzboIrVWqM?=
 =?us-ascii?Q?mwQRoYr4IcfhzZXLVDAW/VA3k4/ImF62TvspGLs3GXybKUaw6wh0woFhaquU?=
 =?us-ascii?Q?g/6oKAeLd+jTneKvLvzVxjTqEa0JGUnn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:22:32.3847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 523a9df9-d9bf-4e87-c593-08dcc2b5dc8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6914

The current implementation of the piix4 driver has a limitation in that it
only supports two algorithms for the I2C adapter:

- SB800 Algorithm: This is used for newer AMD chipsets.
- Legacy PIIX4 Algorithm: This is used for older systems.

The selection between these two algorithms is controlled by a boolean
parameter in the piix4_add_adapter() function. This means that the driver
can only toggle between these two options, which limits its flexibility.

AMD's SMBus (System Management Bus) implementation supports additional
functionalities, such as ASF (Alert Standard Format). ASF is a protocol
used for system management and monitoring, which can be part of the SoC
(System on Chip). To support ASF or any other future algorithms, the
driver needs to be more flexible in its algorithm selection.

The proposed change involves modifying the piix4_add_adapter() function to
accommodate more than just two algorithm selections. Instead of using a
boolean parameter to select between two algorithms, the function signature
will be updated to allow for multiple algorithm options.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4e32d57ae0bf..2babe9a2291c 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -165,6 +165,11 @@ struct sb800_mmio_cfg {
 	bool use_mmio;
 };
 
+enum piix4_algo {
+	SMBUS_SB800,
+	SMBUS_LEGACY,
+};
+
 struct i2c_piix4_adapdata {
 	unsigned short smba;
 
@@ -173,6 +178,7 @@ struct i2c_piix4_adapdata {
 	bool notify_imc;
 	u8 port;		/* Port number, shifted */
 	struct sb800_mmio_cfg mmio_cfg;
+	u8 algo_select;
 };
 
 static int piix4_sb800_region_request(struct device *dev,
@@ -929,7 +935,7 @@ static struct i2c_adapter *piix4_aux_adapter;
 static int piix4_adapter_count;
 
 static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
-			     bool sb800_main, u8 port, bool notify_imc,
+			     u8 piix4_algo, u8 port, bool notify_imc,
 			     u8 hw_port_nr, const char *name,
 			     struct i2c_adapter **padap)
 {
@@ -945,8 +951,15 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
-	adap->algo = sb800_main ? &piix4_smbus_algorithm_sb800
-				: &smbus_algorithm;
+
+	switch (piix4_algo) {
+	case SMBUS_LEGACY:
+		adap->algo = &smbus_algorithm;
+		break;
+	case SMBUS_SB800:
+		adap->algo = &piix4_smbus_algorithm_sb800;
+		break;
+	}
 
 	adapdata = kzalloc(sizeof(*adapdata), GFP_KERNEL);
 	if (adapdata == NULL) {
@@ -957,7 +970,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 
 	adapdata->mmio_cfg.use_mmio = piix4_sb800_use_mmio(dev);
 	adapdata->smba = smba;
-	adapdata->sb800_main = sb800_main;
+	adapdata->algo_select = piix4_algo;
 	adapdata->port = port << piix4_port_shift_sb800;
 	adapdata->notify_imc = notify_imc;
 
@@ -1013,7 +1026,7 @@ static int piix4_add_adapters_sb800(struct pci_dev *dev, unsigned short smba,
 	for (port = 0; port < piix4_adapter_count; port++) {
 		u8 hw_port_nr = port == 0 ? 0 : port + 1;
 
-		retval = piix4_add_adapter(dev, smba, true, port, notify_imc,
+		retval = piix4_add_adapter(dev, smba, SMBUS_SB800, port, notify_imc,
 					   hw_port_nr,
 					   piix4_main_port_names_sb800[port],
 					   &piix4_main_adapters[port]);
@@ -1085,7 +1098,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			return retval;
 
 		/* Try to register main SMBus adapter, give up if we can't */
-		retval = piix4_add_adapter(dev, retval, false, 0, false, 0,
+		retval = piix4_add_adapter(dev, retval, SMBUS_LEGACY, 0, false, 0,
 					   "", &piix4_main_adapters[0]);
 		if (retval < 0)
 			return retval;
@@ -1114,7 +1127,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (retval > 0) {
 		/* Try to add the aux adapter if it exists,
 		 * piix4_add_adapter will clean up if this fails */
-		piix4_add_adapter(dev, retval, false, 0, false, 1,
+		piix4_add_adapter(dev, retval, SMBUS_LEGACY, 0, false, 1,
 				  is_sb800 ? piix4_aux_port_name_sb800 : "",
 				  &piix4_aux_adapter);
 	}
-- 
2.25.1


