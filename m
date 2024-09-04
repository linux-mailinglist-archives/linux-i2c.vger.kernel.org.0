Return-Path: <linux-i2c+bounces-6138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1C96B97D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7734C285799
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AC01CF7A9;
	Wed,  4 Sep 2024 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pTtG/W9M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955211D0159
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447495; cv=fail; b=McueiX/BMRk8yR3Q5oHjzqrR//EC4bDT3KLHR7gSPSzCtASwaNpocR4NqLm+YX4WUYjCUTC4HZk9qJvfKKeeBpxb4fKqqiflHwY1qI2nmOBTY2SkzmlQOEBptWGA+Oyuyfgbvkyt7edBMrPGBUraahn3R8xfcRmClA/fvIGtu/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447495; c=relaxed/simple;
	bh=rg1lcDXJ8gCAIAR7Y0W2HgJDHt/b7m8jn0l+ll1fUTU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jVa3o01yfz3zHpB9g6fVFQFAfyzMRxAhRMDitx/5PZmz2TGJ7qxMD5D13WuWoqvfwVbc9SCUM48aVZr3QdGfJeC7wKDWkGyu3/aKl+ad7DkO3C8a1jZFL2MAI53pUBswkfk0SOPWzBfusYmRAXu3zTC0TVLa9sHk7wK9E96SQeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pTtG/W9M; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laTAmLS76ZoS0nk00vFYQPKR7zim/jee1IMdJ/TsjzRJCQGkKXkuRRaGM8U4GgMgj7bUpzT2D4BFs3svBdmBLEiaMftMelkS1t0K4yydaMOn7D8YJmCnZOXawOeSK0LZVoVyABeVJ06bfq7h2nkovUWUPMOBBKU3H/0E0e/yTlDhL6Z8igU6+KfpMK+DHEjWYC5u8ezGGdB9ux1tklFo43sWngtP3s93/d9a6DoCm/SJCqJ9IR/G4xT2Oe3ITcyfI2sK12qdqkY8jjEKSVRpv5c36/2PFtouQHc+6iPSYEXJPf8FqhLQiFSI/BAjj6zu9bDUqPHkgrqy/Bv7GPH7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtkGnaivglQN8mgA5itO0X+KlrOt/o9MqIsaJToHItk=;
 b=c8AIIdXXckH9krJpGpiPwRKksWZ9UEC3kzjMfqrL7Tgn1GuaWzO6w3wlCWln+j5iiG2edhsHqQsXGsHc4x2yApPuLigmupsjYD/8MNy9qfVdsGq2hVdCclQwayX5T4zIOviKp5tHQEw5hbI0DNS3Bh8EACIIV5K7ExP5WFUCpmuD74NfpFgFGZYFn0dS89F3peqkQ0JZB0GnN5oBXwsuNDWVHL6jnroFz5GW0drjdI2J0j2gsVrKmgBAJ9x1cgAgJ7Enuir1YlthLnO0awWL3/jvU7TMYTSpyBBbD4gS2WI2qf2FpRVddTts3bLTmOcuU601hiUxwQXHCqoYcIltpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtkGnaivglQN8mgA5itO0X+KlrOt/o9MqIsaJToHItk=;
 b=pTtG/W9MAiHQciGEeKFahWbnybyzfBOfjKxhZouYktgNHY7s+7afVay5n2ERJP5zV8vMPzedOYwyPW01ncgDATZv90RUQidXZmPWAX+hfAGLOlLHK0dMFreQQEczXQxDGOcfF0JaWFtALlX3BFBlaKuwnHSrG3Gr8FGhKod5CiE=
Received: from BN9PR03CA0222.namprd03.prod.outlook.com (2603:10b6:408:f8::17)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 10:58:09 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::6a) by BN9PR03CA0222.outlook.office365.com
 (2603:10b6:408:f8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 4 Sep 2024 10:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 10:58:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 05:58:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/5] i2c: piix4: Allow more than two algo selection for SMBus
Date: Wed, 4 Sep 2024 16:27:27 +0530
Message-ID: <20240904105731.2246235-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
References: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 3efa135a-00be-498e-bf04-08dcccd076ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?19ItOPWiyrsMilfDPjXPZ4kzx9iz84ID74Vi390oBeorBWzMxBowoWNjnKw2?=
 =?us-ascii?Q?9gwTE38G5OmmvI8ZCFtcexNmuPOujPISr/Xu0EBm00plHfgURTkMFDsFayWr?=
 =?us-ascii?Q?lHyX0HQxlAqz7OE/sK77o6HQJ/HuRgJXITW0h7Su6brCTDNUai59J0T2zYSp?=
 =?us-ascii?Q?wTmTXAI31XMT/u4Suu9wrrAG2LLEvHupUjdA8S0xm1DK7ILF3CJhMxzbunnx?=
 =?us-ascii?Q?zweBQWzD2ZyT/4IQBm3DuRpgA56NvMlmFBBVd3LCr8ihCBNpns6/9Ab223Ca?=
 =?us-ascii?Q?uZLU5Z4Nt9GUTxrcFykNy3ohMFqyMu4Ic50MOjSlc46Y8VHyu/4SClUAYNJP?=
 =?us-ascii?Q?9Gf+c2O0p+BZZh2NaDczLQE00tzZzu6vxKiwvp7OpZ2N43AESWLkksS7bMot?=
 =?us-ascii?Q?BqrIhHpqI18nSfUkETfd3X4L3zK+DJ7epgjhabMiGnHeLZZs4vBmknjIracn?=
 =?us-ascii?Q?TmVl0FmXQLPAfeSI+y1ubRFrpNPXCgQQyBCgDC+26jZthD3qdXR0PqZ5/5wc?=
 =?us-ascii?Q?WVgQGsSEdcNhHXkDJpO4SDTFvqDvS2BwP4CcUzZ2FrMHBd3FZgylaXtG8Myw?=
 =?us-ascii?Q?ZtIw6Mf0R1Gyf3Q0O/eloJcgFr9GG27D/BMy9Gmqyl1WAP8CvD8NWJA0m0ix?=
 =?us-ascii?Q?mej6XWsU9PIAfl19uSoYvt2Wkht8xam8gyBQoehs/Q72HYjpi1bYkNNENJEe?=
 =?us-ascii?Q?cfjFDa6hpA3BIDv+zRs4awVawWn25ksl7zH9DsAMr9MEUkGzAifetVvurG4U?=
 =?us-ascii?Q?t85PT+95tmnkL4V3GInOLMmkxjY64Ozs2NvhvIpP+OlfDLkreLZ0pFoN+a8e?=
 =?us-ascii?Q?okfrBhfn6o0A7W2CeBr971XxLyUkvqUk3JpUXkdWWj1Bd/h2Y/hAi9Fcux5A?=
 =?us-ascii?Q?WcJjY00kEOfTzHnLZwAYTGDXS5CghDXPEMJhAh5GeWrezwG7mV2Lsfg2Ejz9?=
 =?us-ascii?Q?ewvr3/kpsh5gGOHCD7PE4zWdN7RWvonDz453gi8qcz+FAYyHzJHXITb5SQdm?=
 =?us-ascii?Q?yoNZATPfzxvkXxhKaeDxAuvJ9E7XB8RJdYdj3eQAiE0fEVSMaK2XwCMFD5VS?=
 =?us-ascii?Q?u4VJJz9Fne5M5qaS/mWr9PvUkwmaV35cn4IqvYzN5jrQUXd3NPTuEmpHvQqG?=
 =?us-ascii?Q?S/vKzK3w5x0/+JBNBYp0SwcR90HI402K8UwlBEivEJGGi/hmNS5XEAbJPOGl?=
 =?us-ascii?Q?mLcxbFXa4FoITTVIlSmLW4NN8cUBq8Y6foA2MJbDJ8orxFUTOehDCTRiGFCQ?=
 =?us-ascii?Q?+sSCz092aurooK96QkpTnVf37137tpHL0TfoBFvrNum3qv+XlDsmI6vimHEl?=
 =?us-ascii?Q?md1Z3CAvozTY3oViBJm7OAcS3ez9Py16eIotzRGkmFQAfX4tjkaTmbXIUIHb?=
 =?us-ascii?Q?CGPglVwCxQ8I3AqH15gfAbYM2+ISKMWwWpuo60jT2zsz8VCo7skiuFSa1vJC?=
 =?us-ascii?Q?/HTymTZq2LavxUjaUIKQKBel6hXgclS6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:58:09.5217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efa135a-00be-498e-bf04-08dcccd076ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657

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
 drivers/i2c/busses/i2c-piix4.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4e32d57ae0bf..d56083e58a2d 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -165,6 +165,11 @@ struct sb800_mmio_cfg {
 	bool use_mmio;
 };
 
+enum piix4_algo {
+	PIIX4_SB800,
+	PIIX4_SMBUS,
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
+			     enum piix4_algo algo, u8 port, bool notify_imc,
 			     u8 hw_port_nr, const char *name,
 			     struct i2c_adapter **padap)
 {
@@ -945,8 +951,18 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
-	adap->algo = sb800_main ? &piix4_smbus_algorithm_sb800
-				: &smbus_algorithm;
+
+	switch (algo) {
+	case PIIX4_SMBUS:
+		adap->algo = &smbus_algorithm;
+		break;
+	case PIIX4_SB800:
+		adap->algo = &piix4_smbus_algorithm_sb800;
+		break;
+	default:
+		dev_err(&dev->dev, "Unsupported SMBus algorithm\n");
+		return -EINVAL;
+	}
 
 	adapdata = kzalloc(sizeof(*adapdata), GFP_KERNEL);
 	if (adapdata == NULL) {
@@ -957,7 +973,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 
 	adapdata->mmio_cfg.use_mmio = piix4_sb800_use_mmio(dev);
 	adapdata->smba = smba;
-	adapdata->sb800_main = sb800_main;
+	adapdata->algo_select = algo;
 	adapdata->port = port << piix4_port_shift_sb800;
 	adapdata->notify_imc = notify_imc;
 
@@ -1013,7 +1029,7 @@ static int piix4_add_adapters_sb800(struct pci_dev *dev, unsigned short smba,
 	for (port = 0; port < piix4_adapter_count; port++) {
 		u8 hw_port_nr = port == 0 ? 0 : port + 1;
 
-		retval = piix4_add_adapter(dev, smba, true, port, notify_imc,
+		retval = piix4_add_adapter(dev, smba, PIIX4_SB800, port, notify_imc,
 					   hw_port_nr,
 					   piix4_main_port_names_sb800[port],
 					   &piix4_main_adapters[port]);
@@ -1085,7 +1101,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			return retval;
 
 		/* Try to register main SMBus adapter, give up if we can't */
-		retval = piix4_add_adapter(dev, retval, false, 0, false, 0,
+		retval = piix4_add_adapter(dev, retval, PIIX4_SMBUS, 0, false, 0,
 					   "", &piix4_main_adapters[0]);
 		if (retval < 0)
 			return retval;
@@ -1114,7 +1130,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (retval > 0) {
 		/* Try to add the aux adapter if it exists,
 		 * piix4_add_adapter will clean up if this fails */
-		piix4_add_adapter(dev, retval, false, 0, false, 1,
+		piix4_add_adapter(dev, retval, PIIX4_SMBUS, 0, false, 1,
 				  is_sb800 ? piix4_aux_port_name_sb800 : "",
 				  &piix4_aux_adapter);
 	}
-- 
2.25.1


