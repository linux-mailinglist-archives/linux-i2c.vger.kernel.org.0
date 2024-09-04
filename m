Return-Path: <linux-i2c+bounces-6142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308296B982
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A751C219E1
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140CC1D016C;
	Wed,  4 Sep 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mGPksO7Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609661CEEB1
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447502; cv=fail; b=qtz3Ju/sDUArYmBdQPb6X6WATfCRmsn1lPDRbqNR5a6vsa6mRu80UmTBkDT20dCPOY4DySt2Y/iRrPdNeb1nfuk1r0afMJVjmAXVmNV1mgaUzHwoeMAQdBsjxousiWpeA1nAJr8H59+cOorG66ZQLvYR+OpHGfUxf9EwZx6Ovjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447502; c=relaxed/simple;
	bh=8uwZxj/pywjnq5pdG2wPfwzGJk0cW8wGlYHH235EszY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DEz0PXmP9qxB/11Dmj4SU4eZrgi9Ko/RD8M8oagFhUsAJ8Sf7emzmDJBFiplNxxAGcLxciVqpmlRjqjTKSEqhQrl9TEaPCgquut+fPody9Kw8JUdery4qTZlBQSR3UIr7f9CVg5Lm5dipV3SiEGfLmpCPxyOkf2MYVZrw3SZzzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mGPksO7Z; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu5rRHaQTGlNmGkDLqJ0HYLjJfTYwB3YWniU1tikFUKaOiuC8r7ZfzYWKu6+oaQouc2zPNA5Hh9UmCodaUfa4EWOvWGAKQqsQoW8a+dyrz8rCmlJPo8BhPUQX3IlKC4xQjGP4ZYSDCsRcI19bG2I31/wesX+NMokM1pWJ9ArLE1RZL5N0xbxrttOdSXgvJ2j6/woAKr3Q1yY87HBdS8sJPR5GL/psOnELnVNzcJkEQe3hbe69O3UMblULpe4xm5K0+7tWfEyZeosdeYae4qX/MF5p0LNytsSkOyy09MWz0mnFLkdWqa7AwVwH2J53ZqzozzQE1HknASVqxdwLrWphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoKDrPA3j6uFfBH3H2iPplFBOqd/1/JRmhWRxI6t44M=;
 b=m8INDnEyMJoagRl/4Qm8QOkrBGy8C2o+GRkk5GMhfv6J6pVcLdaFGGZryiEyt/ZhU1aieee0DxM0h4E4BGcmQozGmXDIAz3182SgrhlaWnzsROm/rO4+ZDdr+Tr6O/PulAQ+je++M80iEfAZO7UyzFysq7gd3R6krUp8YzuJh+PLh9rzT6G+0n8VRvcnqy/CtEF7DzLZL8rePgNVfvTgNktBy7tqM1dwpV4iwAYetC5bDGxNCnP12wtdR4kLP+GItadbhtqCHlQ4hv7cmAqeEPSmErwLmfXfSxtXgleUY0bi5rDcwStd/vVkU+1FRpeEUeVwAS8823abwylUvlJZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoKDrPA3j6uFfBH3H2iPplFBOqd/1/JRmhWRxI6t44M=;
 b=mGPksO7Z2YcSRtDBwXecC3PUGzN/VlJPnslDQlHeE5gUpxIEymDKIscyNEbM+YMEKJ7fx7llmTr/l6+dIjWcoWnS3/mNtD+RyerVItbpPS4TyP5AJe4vi+zlsF6uPm1xG1tPIc+4sqgX6vYGqv8YBp5quBD3GuYt0lha32qeCrw=
Received: from BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30)
 by PH8PR12MB6865.namprd12.prod.outlook.com (2603:10b6:510:1c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 10:58:18 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::98) by BLAPR03CA0085.outlook.office365.com
 (2603:10b6:208:329::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Wed, 4 Sep 2024 10:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 10:58:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 05:58:15 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/5] i2c: piix4: Clear remote IRR bit to get successive interrupt
Date: Wed, 4 Sep 2024 16:27:31 +0530
Message-ID: <20240904105731.2246235-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|PH8PR12MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 9312f6e8-41b0-4ded-d541-08dcccd07ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fO0gQ1Y4WOeAYONwr2t2Oco771Qp2VH8Zr/7PZZQEaPud7Hmxu9R3znTKrro?=
 =?us-ascii?Q?atTNEKSt3GJ8CKCCUklzrAgrp1jrVCEp1G041nSJybVbmCQ4C98QfvsYrzck?=
 =?us-ascii?Q?H+jKfUbZfo+g+DazYmyzX2M5049yiNRWr7irazThNOXWn4lvyA32VsAoAYiH?=
 =?us-ascii?Q?NQuhffKl3z2UoiSClJE0yIAWEHwgzzQUYIBAQSYSkScDj2haMhTIMjN4QGId?=
 =?us-ascii?Q?lRszpnE+q58VZ8IDo0YzROFr0yHh4eaeG23ZLuqbE7Xl0FLkl+BGBZGgQraX?=
 =?us-ascii?Q?QBTupf7LSqSsHYZGL34sJHkSXvYpuu6FLTBrZKdEDo1SMjtqQuNBC0Fd9aNA?=
 =?us-ascii?Q?bvIxsJxBRtUg8/Plfk2zE5YZcsWNpRRujjmOSPxTJMidMdQa99++vOWNVk2Q?=
 =?us-ascii?Q?M+erWlJChb2QQBYHFzASsbwieiXHUaMFXCUdRQVWs1HDqsxYkapSnF8GmnWD?=
 =?us-ascii?Q?Nr1hgQvxwg7PbnXwbLiuvchc5kQR3l7maUrjOGuvv98ZV09IwdWc12r0Igt9?=
 =?us-ascii?Q?FM4y9/fqyw80LNl8G+4Uuxm/7Hzw4fqZsHzFpikACD2I1G30KFZth5AIQlWS?=
 =?us-ascii?Q?cFQ9Ezndg/PLx+q8pzPQd+iYV26N1JBm0UlyDKpjdPHJqqgDAUv8F8Pj0MpJ?=
 =?us-ascii?Q?g1AfA6SjmSnzLva2leAitxlyQHZoOEU2GyORhGu+iWn3SBu6BpDECs3wm6rG?=
 =?us-ascii?Q?2y4O4D+WVphaNucmKu0zsd6tVCdcjtXv+iHlIT/dC/BOrh5BKI6zktR4JMHx?=
 =?us-ascii?Q?A4cbuEEM0QKw0QdLuaGGfCx19+sc3a0NoHBcKclUyFggvYHVzJm0jH9vk+iZ?=
 =?us-ascii?Q?dfJq+sPAw4YfrZddUkHMO9meJIIjeFIz/7+r6XJW6sQ5ZYbPGPQuB35oA9nd?=
 =?us-ascii?Q?CV/QanddSzfbbbMLB8u7h9B0qWC7IvHmtpVJwgeqaDVnkG4HyNXU9+be8FKv?=
 =?us-ascii?Q?1gP88RZs1LDDSTY/jfb6gOlrtOZ5NQQJOsjvTvUkkcRJk0B5HKKYoZiwW6H9?=
 =?us-ascii?Q?W1nbr+avLhP9Xupm0+v9g5CH3KbB6h9UsmaSUigNFSn8fdkcv4ZJ0kSCzgdi?=
 =?us-ascii?Q?NBPnFcSPgJbfGjFELzDBU24OZGjoRTCk75JAXG27vEBx1UW0aL9eZpBxe2i/?=
 =?us-ascii?Q?c/o1KH4YDGPrY5jKF6qYJu+UAWRefomO+pNic+ta0wO9vKH8gDp+sYwc+qJw?=
 =?us-ascii?Q?a+4hOOOWw8Rc0xFPELO5hFEFAjnaLwKP9A2wYFp3WiWRm+oH3wgebAR9m/WM?=
 =?us-ascii?Q?c1TDuXuIxjKHMVaQUSE6r82zXB1yeJb24zuV+OWw3qqXmvMFYW5wXcL2K2Gz?=
 =?us-ascii?Q?5k1FF8j0P/OjlOLC1kuj3FIUndfmBpt91bYo9l8bVpxBZjFwcNLDoldyeDBL?=
 =?us-ascii?Q?7kY1fpb7Ps3DkiCXh+pF9VRGGjv5QiIvGmDq+zc+l5mp33VfqYuSEKv0vfB4?=
 =?us-ascii?Q?CNPoGlaS8phgjeVw6gWVlhb5No92CZu4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:58:17.8937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9312f6e8-41b0-4ded-d541-08dcccd07ba6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6865

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 789dbe832012..9337e9899330 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -188,6 +188,8 @@ struct sb800_mmio_cfg {
 };
 
 struct sb800_asf_data {
+	resource_size_t eoi_addr;
+	resource_size_t eoi_sz;
 	unsigned short addr;
 	int irq;
 };
@@ -199,6 +201,7 @@ enum piix4_algo {
 };
 
 struct i2c_piix4_adapdata {
+	void __iomem *eoi_base;
 	unsigned short smba;
 
 	/* SB800 */
@@ -1284,6 +1287,7 @@ static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
 		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, adapdata->eoi_base);
 	return IRQ_HANDLED;
 }
 
@@ -1298,6 +1302,10 @@ static int sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *cont
 	case ACPI_RESOURCE_TYPE_IO:
 		data->addr = resource->data.io.minimum;
 		break;
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		data->eoi_addr = resource->data.fixed_memory32.address;
+		data->eoi_sz = resource->data.fixed_memory32.address_length;
+		break;
 	}
 
 	return 0;
@@ -1345,6 +1353,9 @@ static int sb800_asf_add_adap(struct pci_dev *dev)
 	}
 
 	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
+	adapdata->eoi_base = devm_ioremap(&dev->dev, data.eoi_addr, data.eoi_sz);
+	if (!adapdata->eoi_base)
+		return -ENOMEM;
 	adapdata->is_asf = true;
 	/* Increment the adapter count by 1 as ASF is added to the list */
 	piix4_adapter_count += 1;
-- 
2.25.1


