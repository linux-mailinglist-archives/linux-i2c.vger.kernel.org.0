Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF58B705656
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 20:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjEPStS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 14:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjEPStR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 14:49:17 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::613])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC5A1B5;
        Tue, 16 May 2023 11:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZvAeNLEF6nM49wHje3DU86VnP+9NYi2NRp/5ibq0KdI0B9S2mN2PK2YiP26nRN8YAN2bdESmm4Y+EhvCXSPmScYSrGsL+vD0Olhi6nNTT35tyuyfN+SBouLYuguHofM8bzVHoKD4vsQnp6pw0TrOQNPNs2SiMSnNL4rfyNGb51a128Ya5FlTru8DLOuUUldyJVpMcv5yK8Xa8sswuNCIrH53zlF0Sg0jPB4gXKOIOej2UgiRyZRZ8+Mhgp2csTaFfMNEiaMFW0xV52SuVQ2eStLsqPnrtLpbJ6UUXWyamK7e/T1ed79tg3VU0ZmO2BV6z7MHgc2lgjVsnEYb95zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyZ0vKskS0w0xjrQkfSquRYSVlpcV6NQ6UOTpLyDYt4=;
 b=OTM6R+6ZvzmVoG7uLkwUaMNOKJhEoh+H2uAstvgo+1aDqiGjEf1GqI3h+0lil0a3osqXu+oWSeWWGtKipI6GK5AzPuqEXkPva+Dv6hCPDrrLeiQGTLAZ2GT/uzxCztDhP1AdC5yCXU3RCkvSEaa62aFpUppO8nHqt/4Ch+dwvIZAFyEodub/kv4oOTLP0YSCAqb8CxWfQ05ZEB/PlJ4lO8o4WpKwEJKClySEgkoZcz1IhWTGvld57IVvPCQBBxEOSW9TEwKov81+/Y3eiycBH20NHaatHPe5JMvK+IHGF0Ew8tWwhKr9m5rt3Jmg/DxSVXsnmaccSjdlym11m7adsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyZ0vKskS0w0xjrQkfSquRYSVlpcV6NQ6UOTpLyDYt4=;
 b=W9M4hkw1KIRQ5dYJvLIyxT0E844UAz06cXXRX3nNlgvuJVtQWBuu1SlZjfzatQklRcigivWVbGufLrk4JVHEgygXJ0Ks0AVmQWmjn8nqHSDuDs4ve1KQbZ9p6pQrQkX/GdwSDHTCLGQhFdm2GFbom04FJ2+Et1nJW434FqgmDe4=
Received: from BN0PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:e4::7)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 18:49:12 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::42) by BN0PR02CA0002.outlook.office365.com
 (2603:10b6:408:e4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 18:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.17 via Frontend Transport; Tue, 16 May 2023 18:49:12 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 13:49:09 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <rafael@kernel.org>,
        <ajayg@nvidia.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <Evan.Quan@amd.com>, <Lijo.Lazar@amd.com>,
        <Sanket.Goswami@amd.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies for dGPUs
Date:   Tue, 16 May 2023 13:25:41 -0500
Message-ID: <20230516182541.5836-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516182541.5836-1-mario.limonciello@amd.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|SJ1PR12MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb0e588-2be3-407c-29c0-08db563e3db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ih6MXuhQ7yg3joa5O82kFO5bGTLEMOa8rxAr9LmgYivMY9fM+xh/38RG5OMu4EzbmQUuDHKmPJ46T6K5Yqnebv7xT5bLCFHnpbd53KuBaZ0xtm96K9P4rp+UZeJF0foUpEXR7uhEgIxcw8rYClqn0spO4YHlV8UKoSUof5rI6jWAOxmpkAP2r5UDMpcmbKEXiq+PIEFU+zFxK8bt82r4jdVPyQk09RLB+ZUdoE5ixY0ApF1fjIxLjAHUwy3TBkbe6Krxk5ITjAmSxrGJH+QmWU4lZcF/z+SWHPRQjtUcFBZGIkah6nsrFpXAvcAvJmtJR/MVxqnfCQa+7giDc01Zf67ki+Z76DBIEIDtprp9BK22JR5K3TNtpULzLC9iSxZlvdpAQkxOOJwh2kanZRBFt0scZ2/TYcW4eU6mdWc0CEjb9SaWOPg8JHanvG2JjDUTdXytPo2OMwNT/vHLliydnmUBAnsBuNIWV9McyRckz2JvX1JM4ZqJDRKDIQZGpIBHj0huLhW9mjK4TYAQD8Gbs6FEqDX1B6SPAh2Z9Jwf42zonAZzluOadOMlQu5F8mwOiG96VdraZX31C+rgRIxgsoQedCg7pTMjTlgu5vyg59fTQ5/FPPoTqWhhm/+YyYEgyv+U1Cuc4DEWYeoooSx+FyLYmhZwpGaUVfhQzgy29dvxLwoURNdnE2k0vO8o4cKeErxQr1zUQSgNUj/S5RZ6YRFdqy+2OW3e955Cw9MIfiSswKmmUksUzrS/Qwieh+FoySKghiGcS8wZkbkYSfGVtT5xUPlARcH+jOM9GlCwNWY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(110136005)(70206006)(54906003)(70586007)(478600001)(36756003)(186003)(16526019)(336012)(40480700001)(426003)(2616005)(86362001)(40460700003)(81166007)(47076005)(36860700001)(83380400001)(82310400005)(41300700001)(26005)(1076003)(7696005)(82740400003)(6666004)(4326008)(2906002)(5660300002)(356005)(316002)(8676002)(8936002)(44832011)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 18:49:12.5988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb0e588-2be3-407c-29c0-08db563e3db5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
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

Cc: Evan Quan <Evan.Quan@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 13 ++++++++++++-
 drivers/i2c/busses/i2c-nvidia-gpu.c        |  3 +++
 drivers/usb/typec/ucsi/psy.c               | 14 ++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 782fe1ef3ca1..048ffa18def0 100644
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
+	{},
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

