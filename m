Return-Path: <linux-i2c+bounces-6880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A8097CD67
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B36C6B22E7A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ACE1C683;
	Thu, 19 Sep 2024 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AuJIfbnl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9941BC40
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768811; cv=fail; b=YXDwtAXk/v74DOZtnw6dF1OfPygjKsAAXmcZwjJmjLoRjlT7S9e4+upKSXy4oHgdqdv7eIOCQaZi8vgOp7BsCBExnwtS/z+DN6wlhL5C5hFcvZ7ScED7S+CEATJALOGGQvWJdE4haUO5nzKBrUmK2qHjMFNYfZ4UZ0qPNXCjHSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768811; c=relaxed/simple;
	bh=8QFkZRRYwedcqzMbRHFna0G2JbqLopdJcr2uHZ+dk3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkWjaGaPWqOoaqIQGyZ+mcjSw2Vsswa9sOXh2GizM7hxSw2eqXCjpSbWkU3BFcB7Ru8tEgkvOxU1Ew8kOxz7bvqaZ/0oZXJ/PJFkS5QnWbjX2jNA2WAtuDIbrxTF5gQOfdCfo/P7p6AMqOX8QpAt1EfZzowr2DBOUhxVjUKKN44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AuJIfbnl; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zcv2R7sW6l+DvEzferU7Iuhr0A+DJqJIqnjdxlNBbr7CWXUXDM98WaBHzquhoPYrcwydINTbHfATWm6NgarVzC5u++FzoxTP3n0HbLwZ8Fl9kNSiq6nrQJ91Z4zQp+UvjvlhM2szahaCxBZi9Xjl9is/TtaudZqTayXPOXANj5Fhc35CmOL9FQNDW5bdIqhflvAMa0ZagMKQUYIPodaN3RsD4Lc4rRdEeEQQgZWcnjOJCl0FFYhQ825Vc8QGz6Jb2oXPRT7xnqcJ+3D5QYNUiRpHycGqhPlJXAVJu0GDHX5Kj4UbEP49b57P9A9EP7X9xQiEt9qe5YAOntq5f+6+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpGFCz/1zgqjpzeh8vACeYjWdLrYl5HWtnVY6W27iw8=;
 b=P44PKksHN/gkbgbfJR4filgvEr4Sr+ecWVKT6qxhk+Zr36E8dGVsK7DClr8LqsESuh5FGB1/pTZd9aLg4lDvDssjAjzKoS6KdFYwFv9q9l1hFD+B+hjPRn4Td7Nn3/ginoV+Y52Svn2gOtcbc28OlsYNTVRryfTjDhyy1oRJzsgXPclDodVGrlbxNWx5BF9+Wr7/VRL18OQ7z+Fe09qqJ9ZpuLLn+luu/W3yovQETorwFZbWqBC43c0KTLb2yNPif6kCsFXNge2tgbsYkszkW2KWiFXKw/zC+YYVmFbflh6DAiulH8EaIrEcDRkARMtGF3LuROoklPHnXpEZKhkKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpGFCz/1zgqjpzeh8vACeYjWdLrYl5HWtnVY6W27iw8=;
 b=AuJIfbnlJBDqehrZfrvbPY48yq4gjj1cJMGr18xF2ZvW1AK65Nhytvhv+18xODT/jq7SEAqLnsCu7idoxzfxqVw66Z+zmDwgiU2h8NsFvyOdAiPbTyzFhegfHSXfKp3P+kJNMwQ5bpmCufobfADlBj7Gd5f+l3kj3042kHgiydE=
Received: from SJ0PR03CA0284.namprd03.prod.outlook.com (2603:10b6:a03:39e::19)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 18:00:05 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::37) by SJ0PR03CA0284.outlook.office365.com
 (2603:10b6:a03:39e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26 via Frontend
 Transport; Thu, 19 Sep 2024 18:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 18:00:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 13:00:01 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 7/8] i2c: amd-asf: Clear remote IRR bit to get successive interrupt
Date: Thu, 19 Sep 2024 23:29:12 +0530
Message-ID: <20240919175913.1895670-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: c0432823-426e-4b70-8534-08dcd8d4e3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CDktP2wI+g9K6SdWlfeHFMhx8bTpgdMAfu6mKt6tdCHw0PXMCm2Z/EMusSTN?=
 =?us-ascii?Q?onGeY051VOIWg7RUDXKwI7CbS+CfTAg9OirAq2XkUIBwO+FheE9YB1rnfGGN?=
 =?us-ascii?Q?iRMrIVerRSNWoFb/f6xHn4xufdA8tXh4qo+ggBqiXZN6tu/ML7M790KwuOXI?=
 =?us-ascii?Q?PbrurNMmvr4f3nqfkJ0EtZt+13nLUaoEW2IU/p7GJZkiC/uwizub5WmeugDR?=
 =?us-ascii?Q?vNrLXqijm6mw9fd6xyRHyWf6OD+W0mWED/+RaYJCHBom9/NSCRUryruzpvo3?=
 =?us-ascii?Q?4QltwB1qrElXRTWM5/4ztBg3CxNESCyZOcyjVQOH2ckQZucXPiWhG43h+dzG?=
 =?us-ascii?Q?OFQd4niXAUYdAoOnXKLNwTvh14fR9pbWUOn8VyQfl+/oLONdqaz0WdMSuG5X?=
 =?us-ascii?Q?02SqYPA3SIUaocRlofH+U4TcgrqKXkBwZlGCjnjKAdYt6bFHDQomveZUJPqS?=
 =?us-ascii?Q?jHhRkz5xw11mWWM4HULUW4v12p23flxhMpJuHOcG986mwcQgVTaxs/s2s6B2?=
 =?us-ascii?Q?zkACwyROlLyGBRbOP9LkMtzDJw2l3u+NgM4Y2srFyFbgFzWWWv8l8akSXPcq?=
 =?us-ascii?Q?Nxy7qnfhDTqiDwC8IDwZl9/KYg6nlVMLG07NWNXns+u6ezs93r81MwxSnf0n?=
 =?us-ascii?Q?4r4gRX27o8hkrqcBu+gFcT8gGOXejo1o3JynXWncgIM3vjQlgdeLgFfW8/sK?=
 =?us-ascii?Q?OoJhuUzZVO7FDYWApxekqfpx4e/96Zbgk4HY0wGXZU9ebbnRR6837lH9NGM1?=
 =?us-ascii?Q?eNaWQnj5YDQTpbmPlIUoYJf3efLVqH5YyxJwejcE5+6aguvLl7Q6yl0XMEtV?=
 =?us-ascii?Q?eM078HA6MK0zqWH6rFTMw9JNE4QcgAtqLGaTBLscl5eiz71zLI7PgMiT5+cy?=
 =?us-ascii?Q?Ly3DHfWsbhK2UxF60nqt/+q9sp9c2NRGRKNhOccHsLHAtznx5MVxHWzeK0rU?=
 =?us-ascii?Q?liScUPt2dnCan8xdPWhbktKrownpIEvaRKxBdLhWgmf4oe3q0OVL16CVXumc?=
 =?us-ascii?Q?Pbge72MLbluCwMeKyPgrFXgrbJPJK76JcUJw2mIQTfLP4Cd7rqnRa51ZB8Sg?=
 =?us-ascii?Q?EQ9JW811HhOx8z1RxVMjQRIYcWeRC7B+F4ceOCWT73tfEQ+sDfXX4f4rDrTe?=
 =?us-ascii?Q?tsRPlbjI8Xyu6dqiWoCUj6e2rD1yK67ErPaK8U72SaiDTqPHkg3KPeYgBY6t?=
 =?us-ascii?Q?sfQb7tBoy2wiR34g0tnVwUC5N8v6RZ7ypGAN0rYp9B601r98g3JatH6BDbnI?=
 =?us-ascii?Q?OTCvnKlgeNVeyBxfUWtdkfiisFZ+JSMfS3tgJrU89aN1M/P7lQw3ql93RUeV?=
 =?us-ascii?Q?LWouwWU2FBbQzVVoBU1TBCO15+TX62W/0k4oJ3NlAY8Du4XprFdMuJu7J3hh?=
 =?us-ascii?Q?S+1/8bZ3YVaMSkmmagZdc47cNyAODoj/bffsTqypTptPS4mGFpb5YE4y54qA?=
 =?us-ascii?Q?bOzlF5QWl1mEsOfnyKQ30fRPYC1VNc8Y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:00:04.7077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0432823-426e-4b70-8534-08dcd8d4e3f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index fe6cffa2fba4..35a1ad0012ec 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -48,6 +48,7 @@
 
 struct amd_asf_dev {
 	struct i2c_adapter adap;
+	void __iomem *eoi_base;
 	struct i2c_client *target;
 	struct delayed_work work_buf;
 	struct sb800_mmio_cfg mmio_cfg;
@@ -292,12 +293,14 @@ static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
 		amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, dev->eoi_base);
 	return IRQ_HANDLED;
 }
 
 static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct amd_asf_dev *asf_dev;
+	struct resource *eoi_addr;
 	int ret, irq;
 
 	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
@@ -309,6 +312,21 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (!asf_dev->port_addr)
 		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
 
+	/*
+	 * The resource obtained via ACPI might not belong to the ASF device address space. Instead,
+	 * it could be within other IP blocks of the ASIC, which are crucial for generating
+	 * subsequent interrupts. Therefore, we avoid using devm_platform_ioremap_resource() and
+	 * instead use platform_get_resource() and devm_ioremap() separately to prevent any address
+	 * space conflicts.
+	 */
+	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!eoi_addr)
+		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
+
+	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
+	if (!asf_dev->eoi_base)
+		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");
+
 	ret = devm_delayed_work_autocancel(&pdev->dev, &asf_dev->work_buf, amd_asf_process_target);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed to create work queue\n");
-- 
2.25.1


