Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442496257DE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbiKKKRF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbiKKKQn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:43 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835C98546F;
        Fri, 11 Nov 2022 02:16:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1o5fHCNsE3iS4ODctrN+7ulFtRfWbR+HZyRSk6VmXuiuxNkPuSZFIBm544FTS8L7RIxCqrJcEuACiaCVj4kzwC1KhSa1gTcrA3fIcT0hrzdys22fclgnfSh6NvLb+LaIpaVPl2irNiUs+KbCrr0tXPARO/jRrgzG7FszloYiDNXrE/xjuFacvfBPpKAIXG5xjMfJ1oKWsAyQ4epdlbs9W3M+Tz8N5CIqfqyYfou6+tVo/49abE11IJOGEj6kWNEEVZEMQBQpJetxWV44Gslv2PUyBhPgf8FCryx4loB0no/fXvShicjfP9/4F3z88ndSgyNX2z6/yWxE1NjqmR9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f65T2XoEhiUfwf8HgFImqiGxkWSY66pNhbk64UYq/og=;
 b=jZhZ/9cL6rKlKn1vIKQAYgJamqFErPrvq60gHK2zXx5nQBHyMoC5NIb03i8abm6yx0G579qPof4gvPKV6BPzUwPVyv5duqvoPbQ4D4bU2CznIpMjbJsFh+T3iun8DddI4Jjj0xCKEkvdp0eYtxjU2yihuqvDgnZmpGFqhQ+ayQuU4lAHysPNGhZMzmV3Vnwhv41snXd3Qkn0e2N0iAZfKsL5gbgswVP2iKaghyjA8odZE1V/nVrYlRTztzuD7G5OFt0oeoAlzy2GT3+8EmZyHO+QqtXRNZOQ7vwExL1Y+dnZQbKVvDEzxcgKaXsGTQjGtgyZ/ly8zJXSjVpkXLJoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f65T2XoEhiUfwf8HgFImqiGxkWSY66pNhbk64UYq/og=;
 b=Z7JJhMqVFtWBSieWqorjCrSOfIYks1JlOWlWDu1yuO5+tGapn7QxIdweLMEFTMAzKzJTgWsEPwA98SY1/1DujG0KgEn035dzUs5I7ta5pC20JYlRQjzdo0rGkiLKjEHNsd7oU5pXnD1HLQENMZ4UlimcgmniGbbLTcpqXlq9JFhrBuazOeZck9xoR9HQJpV7vRvDd3XSC7DEfbn0yrM1VKsGc8U89itTNWmeonxNSmFrPdh3S/eRlGSzZZOceXHB88cIgDeHImhBiSsMUnEfIlexZWOyDNIkkWbpU0R+mjx6iS9vquY6yk2QdCdkfgyzaUWbZ9KtcBH2RwGDOvS40w==
Received: from BN8PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:94::22)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Fri, 11 Nov
 2022 10:16:27 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:408:94:cafe::15) by BN8PR03CA0009.outlook.office365.com
 (2603:10b6:408:94::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:07 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:07 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:16:03 -0800
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
Subject: [PATCH v2 06/13] usb: typec: ucsi_ccg: Add cypress,firmware-build as a well-known regex
Date:   Fri, 11 Nov 2022 18:15:02 +0800
Message-ID: <20221111101509.999589-7-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d4e769-e181-45e0-1789-08dac3cdcb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcmATPPuOP97y6bp+9I6FMmlt0CyewazvOdRogrJwvXS3bmVyKW7apoFB7c/1x3GMy+vWVu8LgQctTgOl1WWuhFRqaAgoUSQPOWbmD6Zf3qcFAniXsnfHxymp8Y73LkyJTXns1G1DOjlRYvdPu23ihZUCIvRB/xqysokt60E0RyrhHBi4WMtgZ9XEmVzQZN1Wu9Pjae0X7oGzgKT4XZqHdK4lAjZDHl9t+Ai6zBSrPAjcYqQvGkRWaT0mxBXUiZyvGnKpOpxsgizH0Noe8R9p8Wc88ZOdW7LpyyMC4PEIEA3Tg7H2noqd7HVI6vBPYeDfrwcQQOYFl44oz7FNZUStMhRXkH6xVFhFhEdKBriI9m1Y+BgtuX+GAWn46FiI8l4OtgnW2zs1PRve4zqFf3+a180MyA4vIdUpTMzmpQICxX0OvzF19U/GvdOFQzFwjAW9biikqt48J7RwRX6EyvNioyT2LmkAQc7osWz23WikPJS/Eh5rbHSR2mbyP4SIwYDiJNiBOR/QjEp61aAHoqp2jxYevGhPhXZTqTlti5v2ja6ouM4ablUPPGBoLe94kmLvZcH8LJK1aHGwE7J5gJElLLv289WfnSYNzabD88aD0Bo87wlpxsjyvOSxs5AoWY2Px+ReJ+lv4oYFHONpet8vCuj7E0EejYRwmdyZMd93/oKAzFCjaQGFK038Jh+1gDPJsIrrkKRjLxyG6LFXQL79bw3YCDdBXloInFpQYDiwAWi4YMRGNMggUNIwHG4fA/adnJW2MDi86z3O0kmbrolsNS+MnIKBKKIfA9WAvhoDcQ=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(478600001)(7636003)(356005)(36756003)(7696005)(336012)(54906003)(70206006)(316002)(6636002)(110136005)(426003)(47076005)(86362001)(186003)(4326008)(40460700003)(8676002)(70586007)(1076003)(82310400005)(921005)(40480700001)(41300700001)(2616005)(8936002)(5660300002)(36860700001)(26005)(82740400003)(7416002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:26.7733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d4e769-e181-45e0-1789-08dac3cdcb1b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902
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
V1 -> V2:New change added for adding cypress,firmware-build
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

