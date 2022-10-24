Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A00609B90
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiJXHme (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiJXHmT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:19 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0741E61120;
        Mon, 24 Oct 2022 00:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1WF0XshzKCeiQvrpat2zcO3mLCaO3kfy6dlM1Rt+lMykx1JFk7GrZQzTFuiGw0rD0lZeo7QMiDTRXHZxJJRVhQbAKHb/Eph+3r5o/5n53//ovfJxZoNdjU1fVhceDEzqg2DR4X8DLOElu0uwT9cgCjDE20vdFZlz1n9VC+VuzHRbb+UsyjouWPXzdMHn2ZZ/uGL2UUDEac3Z2DXXwvuZ2ft4BZOH/OyGLsWM5c1AaRKhQ9uE1Cm3iIg3wJUZITJQNWAllwd4NGeifgAQvSt/+MMz78phmcgZjd1gA2M62go3fMRmFNipX4Vb4UpuhjMr8tRX3u7tmIlHWCRkBXVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZADKEKyb7ZRoK05ik5EAXlgC6ZETnTBJHfJ2wKnbNQ=;
 b=kkMSNuXCpn1ywCGMz9DPU7JrQaDMjt4ngduekozx7ZeM8Us2+tOyP1/pnq3ybrPQjLgaLKDtcplv0xZmywWlLyZBa3lKFzocN8B/As5jdU6scSlcJdU8c+jGrVb6nJzyegLPCCFABdunnuiQYFthNc0xgX7JzvqQhJbVU/5vomYWknA38Sfrzs3b6d6xcgGDmSofd9sRzcc7dg3ZlSD02QKolBzgwot1xJA8KXCbxpKflFTfA94BXpnwHipn0wr8Lf/VLZLlEImbRiXlJ5TfAxr60PMnBCTV19bcZABQGaBNAHb+6rfQTMa1TMg4LrQjHKEgF35NtZjXqTBtREnfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZADKEKyb7ZRoK05ik5EAXlgC6ZETnTBJHfJ2wKnbNQ=;
 b=WkWHXd91mVVWcCHyW+AlBAw0BrBTvpKA25Zuh5aBKzWxfBvejfRl7SN5Y084jngSrlPSFivc4aKqavtvA/lvdZqG4yy+vgRVGrURVwqZgQIW+46SQwjlrfSVC5kYY2PL5YqmhfF2cFacW7LAY96yyF4lWs4EIaXzhlR3exr2yuA/Wc8RA/KnAga5pJ0Vm/M8XlxKyl2PqXbZ9Yzfs44YbgN9sJehI45M/j2nmzq6svlLOGLKUE9atgBV63RiUF0MukkixqdN4N2D2uFiS7c+rE2+Zmmej2DXc84Ve3xc1wsAvTaSgtUKR5q4joON/iHH3VSDZu9rqfabPrUv2+Wzqg==
Received: from DS7PR05CA0001.namprd05.prod.outlook.com (2603:10b6:5:3b9::6) by
 LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Mon, 24 Oct 2022 07:42:06 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::37) by DS7PR05CA0001.outlook.office365.com
 (2603:10b6:5:3b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.8 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:41:56 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:41:55 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:41:52 -0700
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <kishon@ti.com>, <vkoul@kernel.org>, <p.zabel@pengutronix.de>,
        <balbi@kernel.org>, <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 05/11] usb: typec: ucsi_ccg: Add OF support
Date:   Mon, 24 Oct 2022 15:41:22 +0800
Message-ID: <20221024074128.1113554-6-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT041:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: df9f90be-f8b8-40bc-7594-08dab5933fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/KFS+WBNTkE4Ut33q5VMEVgR81wuoLN7FqrBYG3Ot5J3iXI2tiV6nYkz0GLmyNy60rrqfGwsZYwN/N2fOdDSYU5p8eoKDjsdVk78uC+BqzSd6nP5NtXqVxSQQhiu/r8hTmQyhjWZHFFj464/QK9Ez6vXJSneWDaSf3G0dJuNDYMRXkbTgFWFOI/Fa+MeuFbZfF6DRaYX/XwR96PepzSdt8FJhSLuBa6Gvo0Y61bi7bBmf1iuVm7ek0M2wQwKEK47Rd9J8j73Xzm6zBSr+oUjJ86Zcp3dDPXHFtyZZJhnaCgHtPz7QUnggFv4ET4cWP+Obyvj2pJqpFx10XQAU2xfVJ8WsKPloi2GZYOnUqmiUZ8L4NotP/VCGjXw2w6IhUMA6PIWWHCvQ8/bz2GByAdcyaE+Duswua+o+n7hCJU0IDHfqvwpvJtGcZFeg9zkZtyF3i62/YBn4LPkGMqY4vn5Ow+3jVrPsgYTobzuAijv7npAc8lGLwNnegBucejWOqH1Q7qo0Ney0Mrql455iHXdDSilA4nArWFojwwrF3J2l3pijiB7KMq41JlW+NRBfZsFzho2cXPf7yyhdFNte8MFhhx8MML7bWrEc3ZTyX2qs7q08eCut+J8AxpDcqpxAuMAw0/GuWE/Bbkp2H/Y7rRujSfApDmYtCEGWcIxi9oxVDfVjVFEw/mx36cbs5aO59oB9cn9yatf2hivjrfjGLhkQlSQf3Vsj4DWcsr0iS0ltKdhbpJcZw9L5aRua6Bmr3Kwh2ctBIq12BCNEuYlaYbsUt+qf6x4CC1ps6LGcC93mo=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(8936002)(2616005)(54906003)(40460700003)(186003)(7696005)(36860700001)(426003)(47076005)(26005)(6666004)(40480700001)(7416002)(1076003)(6636002)(5660300002)(82310400005)(316002)(70586007)(110136005)(70206006)(41300700001)(478600001)(8676002)(4326008)(83380400001)(336012)(2906002)(921005)(36756003)(82740400003)(86362001)(7636003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:06.1213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9f90be-f8b8-40bc-7594-08dab5933fdf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The change enables the device tree infrastructure support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 835f1c4372ba..139707a2f3d6 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
 {
 	unsigned long flags = IRQF_ONESHOT;
 
-	if (!has_acpi_companion(uc->dev))
+	if (!dev_fwnode(uc->dev))
 		flags |= IRQF_TRIGGER_HIGH;
 
 	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
@@ -1427,6 +1427,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 	free_irq(uc->irq, uc);
 }
 
+static const struct of_device_id ucsi_ccg_of_match_table[] = {
+		{ .compatible = "cypress,cypd4226", },
+		{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
+
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
 	{"ccgx-ucsi", 0},
 	{}
@@ -1481,6 +1487,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

