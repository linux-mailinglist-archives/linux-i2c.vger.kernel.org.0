Return-Path: <linux-i2c+bounces-6300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63C96EBB5
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D091C21105
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA1C145B11;
	Fri,  6 Sep 2024 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kjbrGsJT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A514AD24
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606787; cv=fail; b=S0sHHSD6Xvu4Uhagln0OmTfnilnaYI9r5u1ldThNj2uiYHvoBefLqNMFhAZC4UIKnaVuXxOdGCOdr09RnGUX4LFLBngxxXHcu9QK3lGkesE5yy6DT9IOLV4yCmH4zUxVwPMv9hFn9hyRVw+DBbPZNE0gVT2gMQvygJYumzuJvxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606787; c=relaxed/simple;
	bh=rg1lcDXJ8gCAIAR7Y0W2HgJDHt/b7m8jn0l+ll1fUTU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=em7hh8mTJf+1ATaLIwPuoDRcie4E6DWMlbyx/4TariLwqo312TNW9CS1rWP9oOuiLMgYWQcp5vfOGOBq1p3/D5MEYSksFrsoRLMXT8PoR8Wu31tA3lAZGenTqvTAOiepnbgFNjle6oYZhUrRWnnvio+pu1DHpVC6o3vhYVPItl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kjbrGsJT; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBvCCn+aRl3pPpd3x2S5+wMq0ac1m57Vd6GdrZrScTZjg7Y76yi18a/4Eh9kJ1Nre04Xi/8ZAaUSWjiVYpVZMNRbMEKAjx1xN924sFcNHupJqdiu9uC9wbtrmEQt5AtuNbr+7AqcvSF/6QcfeMiBcktUaGSf3B8higEJlcaPh/yI4Qa4FVvuBabsB295H2auu9qdpiNyl3S5NhCaX8A2nxtUw8Vub0rtA6D+9vfuR7WvNVyB1k8IFQCgW1pvzVn3Oi6pc687fV00PBR52Tboj9uJ+G8pV+gg1zMG3tBM18t6EfI5jYHkwcLibZMjOpyWxB17FNgPVZu9RTCd0oCe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtkGnaivglQN8mgA5itO0X+KlrOt/o9MqIsaJToHItk=;
 b=o/MOJvXWvh3/HEbB2ZGiNktjs7tI0k9I8WEFmvoBVSTZSplRwa1PCkUmgTEyxmbZHRyHmvFPnI7y/r18BIwHbwsOATb6YNyeZREFA4TLDKFt99wwzVWu7uyXzMRbN06Aq33kQnoUQBOiaDgoXjwPaJBAuY0QHC7t4wbIn/HMEjowm0RbQxtPrAhLuYQe2uv7D2oOC3m2YXrdNfzXGNQeKa9oHSzcbGIvP/hl6XYnNBsjxeCx89dra3f2rnHVhqag1v6HK9rY9Cs8WGkaIYN5B+FZT639bn9O9HWnJ4w6YcbyXjWSOfA459aQd8kk9C6w4k22Mjn5EWJRFRekIZPA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtkGnaivglQN8mgA5itO0X+KlrOt/o9MqIsaJToHItk=;
 b=kjbrGsJTi2i+1BpCQvh1xFSMrh53Hm1F75mRgS9iDrLJBX8rDihkCYGI4dVnaE1dgGd7c5M+1l69Vm/NPvL6gHY8ymdTWgNNPefIMLA80MdZiJUZ5YtrahvvO5TVssV6BCU+3KzfE/O+U3u45Z72XKjGBXiosFo6kBdEngsx4pY=
Received: from DM6PR07CA0094.namprd07.prod.outlook.com (2603:10b6:5:337::27)
 by MN2PR12MB4046.namprd12.prod.outlook.com (2603:10b6:208:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 6 Sep
 2024 07:13:02 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::92) by DM6PR07CA0094.outlook.office365.com
 (2603:10b6:5:337::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Fri, 6 Sep 2024 07:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 07:13:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 02:12:59 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/5] i2c: piix4: Allow more than two algo selection for SMBus
Date: Fri, 6 Sep 2024 12:41:57 +0530
Message-ID: <20240906071201.2254354-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|MN2PR12MB4046:EE_
X-MS-Office365-Filtering-Correlation-Id: 467c9a72-794b-484d-d5ba-08dcce435830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vp+klbgHXTjIN+2blMU3xKcfgsfcdl0wv+UglUC97Ku5ySHSo/QU6x0wj0Dw?=
 =?us-ascii?Q?KxkWRLAELBcLXy9cmitZEmXbi8CSD1Uh7IoX4vrn2HZaM54oxSyhXL7XnFhY?=
 =?us-ascii?Q?e2+V+jeDCYOeqAxeIVLAHCawcXG9XHpMEMJ+o6d65eFCY7Y8wmEkXSaO6vjP?=
 =?us-ascii?Q?ocFa/rM9OIISMhu+jDht/6OG8RHeZM5gB9kE7aHlY9YNO8O2YGjWrlOiPs7K?=
 =?us-ascii?Q?q8nOUkTdZB3d3kyDFTG/Tku6HEIrDXNDLjExWXJwpBIFTEyLg7Xtzu8sVkWh?=
 =?us-ascii?Q?GKS2CYykhmppD5lcPtici6GQSBme07Twt0+3mekqqgntxWhkEmH0Yy+OOv6d?=
 =?us-ascii?Q?QJFFJqsx/y4//JaN+zvHi7ofrvV5dciFw6GwQssRUVb60soqK7x1QB50RpyJ?=
 =?us-ascii?Q?XZQaXkgmz7J4q9ltu9qTDMK2ybptWE410MikWLcNfwlraYyRg2Xg4heIZlUc?=
 =?us-ascii?Q?YvXQbl2+B64YcirB4625/vQV4+GS8g/+MZAE8H+IGkrVf5gPdYcKEmk6RmcN?=
 =?us-ascii?Q?VwC1tSC5GPrRPgcA+QMpplzRgGMKuJ9rrW6qgDuyb5zkJTLjRLIZuRgeQiNL?=
 =?us-ascii?Q?cj1N2OW6O8uelqeWRVomBxroYVnYncMcDwPSdETq5qee72STRECrPU6OEiIf?=
 =?us-ascii?Q?3/q2EsTGHkZ+1nrxEB7/8fHsW4R7bzFnJbtsptVA4WSTLKQcH7El1nDYjTJQ?=
 =?us-ascii?Q?aOKaM+fjqHEbKDwvbrL9unINS0R0Kj2O1nplURXjVLfd7lr+BAAse+2fFqxR?=
 =?us-ascii?Q?uIe7NXEz8eJV2BokLy6iTMs8FiBTGL/0a+nDb+CNTkjYukksRL4ByvP6HyiT?=
 =?us-ascii?Q?3Dv3suJFE2elk/j7tBpzQQYouWTWDzMoelfNjsQoyOG1DJkN5nOEnqTPIGxQ?=
 =?us-ascii?Q?XOhpSVBJf+8/Uag8pvrWmsG+FO26r/tnZyefbegXjUCNn/9RnN2w9HAvk5P1?=
 =?us-ascii?Q?sdkspVc5PfUX327/5ctzkM+Nz6+rqeG55Q/iLlOTl3X2vqUlKkXFdzWS8Hre?=
 =?us-ascii?Q?JRk0Mnp30HX/UCuF6gwi5qrBWBM2/2J64aRNdbIrOS3n4e19nsTPs67lPaqh?=
 =?us-ascii?Q?ampr90wdaV7em4kluVyrZLn0cERV/+nQG6hrOZK/GmtqpiUVJIhMkowdlrKC?=
 =?us-ascii?Q?WBnDublcOjcaoAvX21/Ui5rlS23335raXzpqmHBoutbqMIUlsYrNLSA0O6tE?=
 =?us-ascii?Q?lTqitGxN1IzuwfpScU3YBlbmPPd5JVNCG6cbEZuZeoxbUtJ3nZhB1p2Yd++6?=
 =?us-ascii?Q?edJFfUuV3dlG5qtazUyu/jwV1YCVlgrgRxxyCzmuMIovf4hJkbq7xkqkZyOp?=
 =?us-ascii?Q?PK5Ige9+IusX3h4pRj31uA3veYQoo5AeKUH1JrvEbTh8YzPaNDxtghutyEch?=
 =?us-ascii?Q?LYkCAWmQI0sXxJTI0aJY4W0VZSitLo3iyoFwBV1P5Xs9w/AHmBnDpcC1wVSN?=
 =?us-ascii?Q?LzV5noWcjnyNqHvNoAq31Vn3jMiOOM4q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:13:01.5775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 467c9a72-794b-484d-d5ba-08dcce435830
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4046

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


