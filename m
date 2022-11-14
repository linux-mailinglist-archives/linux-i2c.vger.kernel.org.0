Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610BF627E18
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237301AbiKNMmK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbiKNMmA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:42:00 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B124974;
        Mon, 14 Nov 2022 04:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzL8DT03RmQq7SxXm3I50or0bYPEGRNs9NCFpXpgIEvG0uMkC5rf5JOzsnnNsV1Ud3TxvE3NZtC8QM4mGkOSj5f3VVhe26uEXY6X6o8oo9FxcubYSN7wN6DKmESsw3PgCWm8LtrX9nkQxF16gID/EdLP4mry670NvtGdTlOZm6qKRrIuP6lqy1wGBjJE1sq79tWrGe2mZRJF6H6cv25TZbLFrA9aEhI1jvzQc0omwGWhJh7lUZT0c3dC3qZBuyLk6m3Rm/yceX5PL99IBvQ9cOS/Et3bZ755O2G8xFYfKugDicfhX2ZcKHYTbpV4UdEqalD0dv+EVuRV3nfUm+uOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac1hb7hGb+UtR5QAdzlK1+7+gx/JKPQdn3ZjopLB0Cs=;
 b=N9LWCHkbadt01Gb0qxBX3qGKV9CvrE/yes0Ky5gu51hUmYP4gX1bjpfuv1VJuHTfNIS3VpO43yhK/3gpVUrGa03SVZINzkCf2BqpLp6a3VFJYMD+TnFT/isrJ9xkC3yZ4kgK6Ie3RlcphPa15PRntCt955BJwm6h67NgYVp6LpfRe0OwmgakMBZTeI410x9zv4JgnI2a0vkHVxIzTD9rzilMiNSl+WAQaHWjmqp/fH+m/fFK8JinVfiZ5ni8hZ4Md+mpj0PqINQyRu9+teGNy4vVFGFgdHTslvKGM96vJaLeI8YTSf5nKc5178XEVSLWsThbDjq7zx002GnASGoFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac1hb7hGb+UtR5QAdzlK1+7+gx/JKPQdn3ZjopLB0Cs=;
 b=hzvg4RyyZ5lSy1ufAnG6im1eNwdncOiojfYRHZ5gKXSnSDugSUaOXlY2LiIDMiiYeO7pOx+tXLiI54H6VooTyO9n/pS5aEHDdZB1MFqjXsC7JEc7rEJBCceTWc8d9Gje435C+cAlSGSHXSHShf3XzfhfWfg+otvHUTG6AN+ye86+I/aXJAoMH/rq9bdx1+fZ8Na8rkb7d0aB+FxISZ0xptlUBut1pZVNG3RlNX/Ftt79eystWmpoj+8WMKSwrGo+LFp9lcA21c4Aly8njn1GwvwaJKboHzBBzOBPjuPT5APgCqcjQLqyQEQKJ2L1xdGuApavMyV/begeVoF1hIP9uw==
Received: from BN9P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::14)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:41 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::81) by BN9P222CA0009.outlook.office365.com
 (2603:10b6:408:10c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:24 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:23 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:19 -0800
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <vkoul@kernel.org>, <p.zabel@pengutronix.de>, <balbi@kernel.org>,
        <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v3 06/13] usb: typec: ucsi_ccg: Add cypress,firmware-build as a well-known regex
Date:   Mon, 14 Nov 2022 20:40:46 +0800
Message-ID: <20221114124053.1873316-7-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: d1011cee-8303-4bbd-2b0c-08dac63d949d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqNcFH87D9wXyUd1Vg6ck9k9N4wRjJ2T5Ld40AThEHNIIDjE6oBv5PL8phdE6A2/KKt5yL0pV2XYQhhupX/UUM9A7x3r86nnBklyyJ99931yYoraSs0Vd3JOCaBeTKyoU4kouoqqHfdO0W6VPv8d8EN6zK41WGexwlArOsHzkqZuvbpKYclVUKiQn8vQCePzMYIjl4dz+azNaGjGpeeV47tSgplidyUV5MDpuQ5dwES6pVNypNp5a4s9Qgp1IWyNAxEv1MJDhUx4KVVDk970Zo4neENg0L+YVJVI3BdytXYfWx9nFyTDer4Vi3Wtc+duUB3b+BH6yHaM1E74DSRNdRzxMJk0K91ww8GirmKiVjzB0ETgX+XQZR8GmySLmJIcQYvOOMOm5hlnxhXMsdzBIKRz/zlbO3JoUOlzU8bPt6fw6oeXAUH23xinyzgARjiTDrhTkls/rpaauHix7Ragar98DtOhQLFavzJu5Pcqd/Ud1lVG8FU7dNzu0+QZxNquFkjNSwvKtrD3e8YwO3/7o2CPtj2SKHTbhGIPdK5NdfIfZuYzXn7wbRwK0/npkOTxQNIbZshZLWpxnZOgvBO6VcDXSTNVB/sf6TTFKUol4awoTQnF0qai4OGwUgV92zfzrUS6CGTxQNZk8fl/6ejtCiaq0NXiv0MZc6M8fxc33WNAxWCD9PAly6bvMQD8gLcPtlFeiQVP183eqCNfXSexNIS5Np69E/J7HtP3D4R+JW6h8yi4YjseW7QeFopD0vs4qjKi8zNRRX96ygQWuMXzOiashRmnB7CW3mhRz2FqBbE=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(7636003)(36756003)(356005)(82740400003)(921005)(478600001)(40480700001)(86362001)(82310400005)(426003)(36860700001)(40460700003)(47076005)(2616005)(7696005)(26005)(2906002)(6666004)(5660300002)(8936002)(7416002)(8676002)(6636002)(316002)(336012)(110136005)(1076003)(186003)(41300700001)(54906003)(70206006)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:41.3104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1011cee-8303-4bbd-2b0c-08dac63d949d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ccgx is refer to the cypress cypd4226 typec controller.
add cypress,firmware-build as a well-known regex.

16-bit value is not sufficient for descriptiva names.
Using string instead of u16 to make it more descriptive.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3:nothing has changed
V1 -> V2:new change added for adding cypress,firmware-build
 drivers/usb/typec/ucsi/ucsi_ccg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 139707a2f3d6..e412a457bbfc 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1343,6 +1343,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ucsi_ccg *uc;
+	const char *of_fw_build;
 	int status;
 
 	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
@@ -1363,6 +1364,17 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	if (status)
 		dev_err(uc->dev, "failed to get FW build information\n");
 
+	status = device_property_read_string(dev, "cypress,firmware-build",
+					  &of_fw_build);
+	if (!status) {
+		if (!strcmp(of_fw_build, "nvidia,jetson-agx-xavier"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
+		else if (!strcmp(of_fw_build, "nvidia,gpu"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA;
+	} else {
+		dev_err(uc->dev, "failed to get FW build information\n");
+	}
+
 	/* reset ccg device and initialize ucsi */
 	status = ucsi_ccg_init(uc);
 	if (status < 0) {
-- 
2.25.1

