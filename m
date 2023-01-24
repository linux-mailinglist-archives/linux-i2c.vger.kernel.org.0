Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE07679652
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 12:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233788AbjAXLNA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 06:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjAXLM6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 06:12:58 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D59EEF8F
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 03:12:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELoCNJtrRQ1fXpUxxXHLTgwvjSt76BRSbpKT9Bvi1M/Yv2C2C4EQJFV5QlMNHvFYNevu/Mu3Y65OmFOOijVLjMjt76vpYXsVqmP6DNTaGbhO6XiteNkY3r+GJU32/We08bmAl7BnchqC2aOPAHX3W1N/ndaAk2NFb2fdw7eWCDd1E1bmqNeOtbJs0JyLG3hNuLMtWQ3OUyOal3VgniuAQppDYGewnRzfsO7uiYaNlZ1rnFMuul6Qqi+DrXsk6R+eGyZ/pDX2ffMPgAMZlSXBMfIYdrWjkN7Av/aPZZkxrSv/F11UaC2Ifd1acG8AiCg8tbJ8Ok5y4gBZFO/TAHjmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54SpzYmG6jexS+QIJBeKhB8JK+lzELJEejUMTMOVqMI=;
 b=i0XgiekOWnYQXB5xdweDXgLU6UDBraqi0cLYjB3QC8zfqEZTdVmeGgcWTtgld9GvfDzUCZNZHFzPFGv2G9lLwsfubec6WGHzJF4VJcRati5RCIiyRaVZdkTWgHv/uW6FScNDtnxX0hv7XjadglUvcWVjdIYgdTc7MQ/SvcxUTJXVZzQM//fvaot/IAyNV8z/MhdZYjVcHz+QqYX03FidOJEPNR7LZxe8gkoonm6tgr9ztPT43fBomz6DHSiUhb3lvDNJMwt3obbMs4VgRWrW7GilYd/Htpd120IZ6CZzgKbfdL0LwbxOFF0ZS7XlYQw9EM84liZTC21lD6gfvXofpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54SpzYmG6jexS+QIJBeKhB8JK+lzELJEejUMTMOVqMI=;
 b=VDeBu69tLfYF/VbbMzT8sFf2gcfy+ahqX8vTUmgjsOOcKgFuYa6ulGJXfnid9eRsvXjTv5NO/Eh0x4g1bl3wp1BCc7atYkbc4fjp87fYrf7FC8utA8+fNxAkeQvcfqrI9izAHzt3FMRS3KUB6O0WuXcBocRpXCloQ90ueyCDp/4=
Received: from DS7PR05CA0049.namprd05.prod.outlook.com (2603:10b6:8:2f::27) by
 CH0PR12MB5251.namprd12.prod.outlook.com (2603:10b6:610:d2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 11:12:55 +0000
Received: from CY4PEPF0000C96E.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::34) by DS7PR05CA0049.outlook.office365.com
 (2603:10b6:8:2f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Tue, 24 Jan 2023 11:12:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96E.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Tue, 24 Jan 2023 11:12:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 05:12:52 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4] i2c: designware: add a new bit check for IC_CON control
Date:   Tue, 24 Jan 2023 16:41:27 +0530
Message-ID: <20230124111127.1348054-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96E:EE_|CH0PR12MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: 257b84d6-6db3-4915-a1d7-08dafdfbf131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezD3mx7bUzglWxrAFWhieiet0/wN9fs4c3vi6jlfrfH/o7v+2Mrar87oKfi5/bsX457UfjOZiRVgeP3vGKuBbnmPAg58zPRd+w1V/I83iaOYVgYI4qw1raat3D/5e58Azi7f9dY0Oi6Y7Q2XQb1SbBTj/ntNqtbj8f9SSXCsMUpcbPa4sNRRSzqZqb69l0OvCfo0hVXhnL8qMLk3NuKg9U8AXTCYcfHKXoS55q5ftag117SIXjurySIXnajMa+T3GcQpBkb85QG4eCw0TaPMcCp+AZE/sv37UKiTnQvgVTLMw0ass5GApPOTZ6fjhy4XRGFH9rz6NPSPCVEw3An0OCEEusOtXdV+PFf4y/Z2MJQ6lgKKI/YtEAUPjpUd/hOew3fyVFQF/IGYRINaeP2PEiub1iUcIh5Sclp9/xeSxhS5wDikbaMgZP4jmN9lB9e07NVOGZ63ECdTre4RbnEvvnupRSWd/x8ZNamfNm6wkNojqWkKR4Tdpyd92jUIGiz53YHXHMcA9afBjBbfqRyK0FMlzk8EI+Hf56WRIKx1FIW7pzPzUfkFGnUG8Ob379aVPJGPbtrJuiEsT8bIi4oi+KLbjPUJvlPsQLMtEtOLg7/EyskduqnUW+YkyjpIw8wFtn3jJ343zhWjDOXHlAoeDbnq/Emkh6njFfE+XWzSzVcataDe/vrMHCMRSdM7Ehk4Sj7kbxeDFtsKZ6k0LE5vlRpcwvjDLKB/OK+P2xXS1YE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(81166007)(82740400003)(36860700001)(86362001)(8676002)(356005)(5660300002)(70206006)(2906002)(4326008)(70586007)(40480700001)(6666004)(41300700001)(82310400005)(83380400001)(16526019)(2616005)(186003)(336012)(26005)(1076003)(426003)(110136005)(316002)(40460700003)(47076005)(478600001)(54906003)(7696005)(8936002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:12:55.0433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257b84d6-6db3-4915-a1d7-08dafdfbf131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5251
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On some AMD platforms, based on the new designware datasheet,
BIOS sets the BIT(11) within the IC_CON register to advertise
the "bus clear feature capability".

AMD/Designware datasheet says:

Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
Description: In Master mode:
- 1'b1: Bus Clear Feature is enabled.
- 1'b0: Bus Clear Feature is Disabled.
In Slave mode, this register bit is not applicable.

On AMD platform designs:
1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
of SCL/SDA stuck low.
2. Whenever the stuck low is detected, the SMU FW shall do the bus
recovery procedure.

Currently, the way in which the "master_cfg" is built in the driver, it
overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
cannot initiate the bus recovery if the stuck low is detected.

Hence add a check in i2c_dw_probe_master() that if the BIOS
advertises the bus clear feature, let driver not ignore it and
adapt accordingly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3->v4:
- cosmetic changes.
- add Reviewed-by tag.

v2->v3:
- Use regmap_read() instead of ioread32()
- Move the proposed changes to i2c_dw_probe_master() and protect the
  regmap read calls with acquire/release lock calls.

v1->v2:
- Update the commit message

 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 95ebc5eaa5d1..a7ec8d5d0e72 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -37,6 +37,7 @@
 #define DW_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
 #define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
 #define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
+#define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
 
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
 
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 45f569155bfe..3be7581ee3fb 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -865,6 +865,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
 	unsigned long irq_flags;
+	unsigned int ic_con;
 	int ret;
 
 	init_completion(&dev->cmd_complete);
@@ -884,6 +885,25 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
+	/* Lock the bus for accessing DW_IC_CON */
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * On AMD platforms BIOS advertises the bus clear feature
+	 * and enables the SCL/SDA stuck low. SMU FW does the
+	 * bus recovery process. Driver should not ignore this BIOS
+	 * advertisement of bus clear feature.
+	 */
+	ret = regmap_read(dev->map, DW_IC_CON, &ic_con);
+	i2c_dw_release_lock(dev);
+	if (ret)
+		return ret;
+
+	if (ic_con & DW_IC_CON_BUS_CLEAR_CTRL)
+		dev->master_cfg |= DW_IC_CON_BUS_CLEAR_CTRL;
+
 	ret = dev->init(dev);
 	if (ret)
 		return ret;
-- 
2.25.1

