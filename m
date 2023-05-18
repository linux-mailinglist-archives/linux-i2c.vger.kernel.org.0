Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BA37085B3
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 18:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjERQMY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 12:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjERQMX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 12:12:23 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E63BFE;
        Thu, 18 May 2023 09:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQe4GPW92UWe/PhCY8ixfnHQQFc+Y9KM3YOn4VzTSMzwy8E8hRMTylqEt6eeaBORwHIhrM6wJoTN8hGITzU0NpuTLz8uCI0OrscXjQQGLUQWTytWyeUXiSdCfEYxL7YHbaYIsyqSO2NYuRLIYhe4QbXqr9QV5g0jOQYLeZEd2T2aUhdgJu3b3aNzO7w0R00doC/yYYkkMqrw8NXHvYTyJx5tJVobvPT45g91TV1k9GlkNX3Z5sd5unx8mc1kJFu62lNL5mnNB2zHrbkaP1kmATt0nbx10lUoB4qfG3lWQn0sxFnHrAi0YUKx58tKYqh6ZJXzfAwa67S7UpbVO/7x1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7ZcI+u5QOkEp2325OchhtpJ7Ri++tVH5Np9f5CmHK0=;
 b=LhzimnkdIjD0ppTcEv7mLzKvMuuPGFIiwLboGWJ7hBimzd0OI2767EQHNhaPaohmk+OjMigX7onMdBaIlgY7jRadIsQzpe4FeUW4Q7nAvrpve+kYfbi0QXdi83qWKbjfHDT4lBvPE15fqammYUT58rtZGUgPeRkXb1Zzv6H+peK/v8A2lyYfC9R2PIXH6L7PZ8fQaQEw42IXwjB5lOss6k5Nwv5GuxtW9aPNZrPrf+/xEpPeLs0Mt/fzXQPj2p5DdVZ6PZV4nvGdy/RMzd6kR9J/zY57EeNpFKFH8muK2I9wffpWo36OAskS7LuWkRNZVaGm6su9djS9GM8MyZsrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7ZcI+u5QOkEp2325OchhtpJ7Ri++tVH5Np9f5CmHK0=;
 b=5fMdWzSUp5g31ceTFPFFPlnZb3s2NqnoJCgHTeUQvS5EqAfrSK23m+mUds5MSYrHdU3z0SfV+x5i42AFH/GyP+dSBesbQoF8KYNU3sNNDLBwXGp2b/LTxkpmCZnwdvojwg5A7BkCwmfcaQ2z7CKJUbqwuEAStL71TQV6j+klIRs=
Received: from DM6PR13CA0058.namprd13.prod.outlook.com (2603:10b6:5:134::35)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 16:12:18 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::6b) by DM6PR13CA0058.outlook.office365.com
 (2603:10b6:5:134::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.15 via Frontend
 Transport; Thu, 18 May 2023 16:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.20 via Frontend Transport; Thu, 18 May 2023 16:12:18 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 11:12:16 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <Evan.Quan@amd.com>, <Lijo.Lazar@amd.com>,
        <Sanket.Goswami@amd.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>,
        Evan Quan <evan.quan@amd.com>
Subject: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
Date:   Thu, 18 May 2023 11:11:50 -0500
Message-ID: <20230518161150.92959-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 315b40a3-95a6-4aa6-64eb-08db57baa71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R60QjZvkUCf9HB9CMtx+W2Jsc5uGSaf8Ij9i2ZkdOdnlVYoTNKbRiiCTHI6HK+H0qNrJDnOUVgNzbQfkE6pzpVi2IBTW1e69bGm0oA4G8rWXuOkH4UuWSpXfqWsqss/16z0dt20R7LzlyeN9ZX8V6iXkRrq0P6TB/D+DcsymWmwajiamuycrTjtHVbyFMHOFa6DsKZo/KdqJPDys+atm5xufXcfoOKRQfD0cmelaLEf4u/yO5zDb66p0PYshTSGrIinw7os0OhDv/qseG/3Z3k8+sUZ1WCsuU4KchywvEmSM+L6IJxmQQBzQuHeWarju4AOdCQ6gHtHg+gGF6gbkjLUHiM9ITj8CItjFThCWI5eDBhnES2dHFb8D30FSVkz6rg6toEkYu0ONVuHrxd/fcmv7Qa1pcD0LNdDZfbYrbU6NcOFr22edxHbcsndGCr5g+QbzXB5JOyd7kDoAv4gi36mwQszjizb+Qi835vAcukAfXoCklJtzKlB7YBIM989NCdlljzYV/UPLFV5iYm8DQO9BcXNtSDRL/lbZ2dgDzomK6yX3CspvHaiVy39RUh0cHDxT/f7oklbwzy6XC0KXxRnhknm9h3Zp0sxtnW64Nem6yT2Ynu1cVmPlyX+a7VfBXJjhlR3KrE6k5mjkIjIPeFY+bIr5DcRraU4ptsLv84oqhkFHdybYzG+iVmXKkjXC76lEnPFrYRp3qozD2VWfHan2yoW4bLvHLA7fA5Q0No/lYFl9YWI3766u6tkglSXMxaNOdD9ZDL1/n+SlBZgtG0R0L5SKPy7hYoHWMGIihsY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(86362001)(36756003)(16526019)(54906003)(316002)(4326008)(478600001)(70206006)(110136005)(70586007)(966005)(6666004)(7696005)(8676002)(8936002)(40480700001)(82310400005)(41300700001)(40460700003)(5660300002)(2906002)(44832011)(2616005)(336012)(81166007)(82740400003)(426003)(83380400001)(1076003)(26005)(186003)(36860700001)(47076005)(356005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 16:12:18.1662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 315b40a3-95a6-4aa6-64eb-08db57baa71f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

power_supply_is_system_supplied() checks whether any power
supplies are present that aren't batteries to decide whether
the system is running on DC or AC.  Downstream drivers use
this to make performance decisions.

Navi dGPUs include an UCSI function that has been exported
since commit 17631e8ca2d3 ("i2c: designware: Add driver
support for AMD NAVI GPU").

This UCSI function registers a power supply since commit
992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
but this is not a system power supply.

As the power supply for a dGPU is only for powering devices connected
to dGPU, create a device property to indicate that the UCSI endpoint
is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.

Link: https://lore.kernel.org/lkml/20230516182541.5836-2-mario.limonciello@amd.com/
Reviewed-by: Evan Quan <evan.quan@amd.com>
Tested-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Drop patch 1, merged into a maintainers tree
 * Fix title
 * Add tags
 * Fix terminators
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 13 ++++++++++++-
 drivers/i2c/busses/i2c-nvidia-gpu.c        |  3 +++
 drivers/usb/typec/ucsi/psy.c               | 14 ++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 782fe1ef3ca1..61d7a27aa070 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
+#include <linux/power_supply.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -234,6 +235,16 @@ static const struct dev_pm_ops i2c_dw_pm_ops = {
 	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
 };
 
+static const struct property_entry dgpu_properties[] = {
+	/* USB-C doesn't power the system */
+	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
+	{}
+};
+
+static const struct software_node dgpu_node = {
+	.properties = dgpu_properties,
+};
+
 static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -325,7 +336,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	}
 
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
-		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, NULL);
+		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
 		if (IS_ERR(dev->slave))
 			return dev_err_probe(dev->dev, PTR_ERR(dev->slave),
 					     "register UCSI failed\n");
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index a8b99e7f6262..26622d24bb1b 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/power_supply.h>
 
 #include <asm/unaligned.h>
 
@@ -261,6 +262,8 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA GPU only */
 	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
+	/* USB-C doesn't power the system */
+	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
 	{ }
 };
 
diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 56bf56517f75..384b42267f1f 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -27,8 +27,20 @@ static enum power_supply_property ucsi_psy_props[] = {
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
 	POWER_SUPPLY_PROP_CURRENT_MAX,
 	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_SCOPE,
 };
 
+static int ucsi_psy_get_scope(struct ucsi_connector *con,
+			      union power_supply_propval *val)
+{
+	u8 scope = POWER_SUPPLY_SCOPE_UNKNOWN;
+	struct device *dev = con->ucsi->dev;
+
+	device_property_read_u8(dev, "scope", &scope);
+	val->intval = scope;
+	return 0;
+}
+
 static int ucsi_psy_get_online(struct ucsi_connector *con,
 			       union power_supply_propval *val)
 {
@@ -194,6 +206,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
 		return ucsi_psy_get_current_max(con, val);
 	case POWER_SUPPLY_PROP_CURRENT_NOW:
 		return ucsi_psy_get_current_now(con, val);
+	case POWER_SUPPLY_PROP_SCOPE:
+		return ucsi_psy_get_scope(con, val);
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1

