Return-Path: <linux-i2c+bounces-6931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7B97E72C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0CB1C21167
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6773C485;
	Mon, 23 Sep 2024 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wK0+9z/8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEFA49630
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078744; cv=fail; b=Ug4F26bTT70H8M4h4mnWYRJNeveKxkCnWBqeTsYthqVT4HmlyCgsQ7uTx4M97OFS2vKZtDcmZllQEzV+yiyb0yWlqt4rqfDXbmsxFGInP3kg0SRgkbTZa1NaTlLTmlSACazl433sF1DvhC6IBOw//ucwOC2TgcI+oTPpQ8LMq7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078744; c=relaxed/simple;
	bh=1TMxyjgBPESkBcUhIXg+cgdS2ERIxIkft0BsMuOXi9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tUSo4p+Ea14htbutu0+FPJwFEBPs3izkjpIcV6z/RpOihTeauNtLBtRrf8MMOkuOLAWQzNtoRvLpd2IqMeavB8NjLrb+KPr4JUTE/WUkxIUa8yt1jFTujoxzMe6YNFWTG8YisaiKQpWraZH/e1E+SoPg7vMV9fQwOW/P18Asoc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wK0+9z/8; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxub39ni2YPLKQqw8hXw0vDs8lAd8rj1HGHgA/iOvd8S5ac3xPozmMTb8O8UPZCdRwQDEbYs6qNhS9N73Sp7ukhUILtG/E/yYGRQ4mL6EXhsJsHF6mKuSpsk+ffZCita59XnomgGvTDDaAOj6zINJlvD4rP/SBrIieoSZUkUsASpNGfQglrlcnRo/sbp1O8VqIvODN2MSzCyAbZXeTSH0GkuqvqKMT6JNJO8w7Y3UVcvNNL2SCsEuGQEfpBfDh2TWVul3EY1ftiQYqwEsl63KmmGYqLuVPQsbaUSTKcCestkMPM/83OcHH0P89fjZ0pbx74OwN2yvlaV8ivBlrln/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJEhbhcqQubcqRymaQD/K6U1U2lww2KWETV3Clml4LI=;
 b=DdoDdrgpLAOqExdnIZlmwKVLzb+idpJNrditLwOl6iBCHp+VTiztBWU9owAVpdKz8clkq4PBPQhKRNC9mH3GOvIZJmvPGT+VmPGgi4+Eh21sOQZbH5m9c0A7qDv7V4oa4mryJsYekG2bcX8++2rqCIwPYKqIwQu5BDP/ocAcOJPopSHXw7NlnC/FeXluqGv0i1APCQMZf8g7yxnuumzZ4xuwGOgpZmFlls+ImmUlSvxoFfMtTvvNVe/gDrMwNwvTgmnrXe6um2rGLAoh6UsNlWLJgMWiJLVGdleqcj2xqjMoKKD4/QO5SoM68HU3Bnt8w3/OhN1qre00bFAXRwaSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJEhbhcqQubcqRymaQD/K6U1U2lww2KWETV3Clml4LI=;
 b=wK0+9z/8ObpLlIu8wjxGvzh52g+RGQi5sulisglfmKGTkp5aVM8kZVM3ZIxST9g6mH7O0jQ2Bf0R9TFyUZlJ+igWNrhxQDFYbrBauVNu9Kbigk12wrI+aK9dsu2XSBXa3iK8XZkBW+vukMjMNBtuHRQncyFjIaRGys4gvmg2grw=
Received: from SJ0PR03CA0379.namprd03.prod.outlook.com (2603:10b6:a03:3a1::24)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:38 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::f0) by SJ0PR03CA0379.outlook.office365.com
 (2603:10b6:a03:3a1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.29 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:35 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 7/8] i2c: amd-asf: Clear remote IRR bit to get successive interrupt
Date: Mon, 23 Sep 2024 13:34:00 +0530
Message-ID: <20240923080401.2167310-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|IA1PR12MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e3c604-715b-4290-e607-08dcdba68275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lt7TuMRH15R8AeeqUCHf/saFjKQtONddpZbd9bFPYrDSLTHSF6MSa5/FflOt?=
 =?us-ascii?Q?wagjtKJsjNrd3RABhmnaMscT4cR+bBXFJP8U2TlRZcukYl0hTj9ICOxIPxXZ?=
 =?us-ascii?Q?JeRs0vAQDdYkcNRyUYm2M/B38fPp+xePi/ct5N6lHDhT+xwq81u8yFfsLDxg?=
 =?us-ascii?Q?RhaYUYFzlt+ENR/VtDONt/pzeQgUf+D8GtH4HuiZcMWkvkoWQ+UWdNZtQ/Xf?=
 =?us-ascii?Q?OP6iM2yEWiq1mIsq3iuCZ3lI99rdt/F3/zgFnzaS1LfRMSS7XBh3vMmgQchW?=
 =?us-ascii?Q?5lEYAtoK5r5uSY/Dl97VHKC+uM8CmVpKxQY0J9OuOvYspInIHqoum9CEXzuy?=
 =?us-ascii?Q?2xbqSYWM4g82yZ+yNPExJhdUxNNjlXEF8sxN0Y7NFGgcnK3peMqVkViHxTOZ?=
 =?us-ascii?Q?XGYZIC/pVhQAR/wQS53BeM0Tx+U31tWWcI6ZTVZp5BjTX24ZjquP+psO7DF4?=
 =?us-ascii?Q?+Dp06xzQMa1CwWAb2Uhf5bo+1jlI9tMPzs9AHJSFSEDiqqmF0XHFq5MwhI5e?=
 =?us-ascii?Q?qRBBGD0wZHw+AA2bRSdzqbwxUym5uxZpgWVkDJT2qbvQGCEmrvWs0mF1RS/h?=
 =?us-ascii?Q?/uDNNw7YPv5A0uuCij0+ub1k05kyR6Af0d9h968FvOYKh6FpnN3oFwCSwSt0?=
 =?us-ascii?Q?m0XUQ48DqLVaC96YWbbes+VNQi1H4wtrWkSqYHliRXJZoAFnFI3jmfA9RMWq?=
 =?us-ascii?Q?aaeqwlIdIFGdEYnWnJJZsI23S/F+4Ej+wS6/FUkJ0w43MrB1P/5R6vyzapHC?=
 =?us-ascii?Q?6DhVhM6tE16E5/x9l3s/3oyq79tBbDVcBjY/1SsCjUoIsY4a4qWx5tm4/57i?=
 =?us-ascii?Q?OtenHYCpT4Sw/b2KAU7sx8ue6dD7PGXtKQoGING/oPVG4b85LI9r6LfjMDDe?=
 =?us-ascii?Q?K3BQxcjznOC9JSdYxecQduWfSaKxIAoOY5XcvripusYiL3VlZwsKPvpGYATo?=
 =?us-ascii?Q?oGuH0V1zHi4LVpWeofSszyE8mAyAfYk3XH8PbhTnf9yQMJZD1Rbtqpx1V3rL?=
 =?us-ascii?Q?EcUxFNaULWns2yM1tFZVxf3YFJTozq5kQjBKK41juQ4qDirs8jW3lKHLPejp?=
 =?us-ascii?Q?m2VHl8tk3OLMTprvYyF0iVJ+RXjyQ8gcFrfft5gRIamTw0KAr02hE9yV0UI8?=
 =?us-ascii?Q?1uanqLx3yIiWXjMH5Hq+E9JiWvoTPnK7kDfl7rEgcMiasDYcoPYQtxnT04AN?=
 =?us-ascii?Q?XIsAPB3/Pz7SD8FzvHVeYpw3JEZZQK5dpnDRBlFoFOy5HTaMnaA4GbvRLEoH?=
 =?us-ascii?Q?Pi2p78zP8/Wx6B0avgvtuUlRUAEEF7sQjAIJbAGJPrRNHD3nkjM8mZLk+Ezy?=
 =?us-ascii?Q?honFLhJN/WFxdX0TZlqdqLluDnHi1nu1qt3CnaHkQ2Co7i9/Rc3K/KuodTZx?=
 =?us-ascii?Q?ZAmWs3yIDhZK+RFluT4ybxapVcoJoANuYMmYovvIRpVt4f6rsKUxF8BGF/07?=
 =?us-ascii?Q?+kCCaHxs4MxOsxH45aTsjzA+9WRFmgJ2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:37.8024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e3c604-715b-4290-e607-08dcdba68275
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index fa6db99a8fe5..3d15b1be8686 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -48,6 +48,7 @@
 
 struct amd_asf_dev {
 	struct i2c_adapter adap;
+	void __iomem *eoi_base;
 	struct i2c_client *target;
 	struct delayed_work work_buf;
 	struct sb800_mmio_cfg mmio_cfg;
@@ -299,6 +300,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct amd_asf_dev *asf_dev;
+	struct resource *eoi_addr;
 	int ret, irq;
 
 	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
@@ -310,6 +312,21 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (!asf_dev->port_addr)
 		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
 
+	/*
+	 * The resource obtained via ACPI might not belong to the ASF device address space. Instead,
+	 * it could be within other IP blocks of the ASIC, which are crucial for generating
+	 * subsequent interrupts. Therefore, we avoid using devm_platform_ioremap_resource() and
+	 * use platform_get_resource() and devm_ioremap() separately to prevent any address space
+	 * conflicts.
+	 */
+	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!eoi_addr)
+		return dev_err_probe(dev, -EINVAL, "missing MEM resources\n");
+
+	asf_dev->eoi_base = devm_ioremap(dev, eoi_addr->start, resource_size(eoi_addr));
+	if (!asf_dev->eoi_base)
+		return dev_err_probe(dev, -EBUSY, "failed mapping IO region\n");
+
 	ret = devm_delayed_work_autocancel(dev, &asf_dev->work_buf, amd_asf_process_target);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create work queue\n");
-- 
2.25.1


