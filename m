Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B806B6257D6
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbiKKKQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233737AbiKKKQm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:42 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2347683B94;
        Fri, 11 Nov 2022 02:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niQ8xp4nylo0tYR3YusqOV5aXQX6z9ryWqmDFIpWWmNlepZI8szoLpslDzBOL9z1sgvTPgRrA1g+0xpXmAwImEWzyLzGlK41eLeZjv2WpzKC7x9krnZC+gYn2HAcHtlq+3v6A7ZAS+yWKj090dTdOwTkM01W7AYaznuLhZYjrZ0/d3T/hNkqKWXwbhDdhewXGPKIYOwi7An8Y7ECpcc0Scboe1kHMn/V+AVSirxxMr0bSMfCFAWzM2kTr84eXgBXGjsu5bB7K/0z530Bb6gq2Jwatk3ugA4NyFoIw8PVuii8t6rfJuPd5TxBSki/bvKMa2DJwnZY3H2k1tmpkO5M/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoOtlFxOTztopXclAbiCCC5OWKvXUyqImo9xMJ1Tn0I=;
 b=RbnjIU+KOJWEshbIpyL9124aQxBx4e0Y2nrBtj6EnTHZ2hNLXEeXwAfVF/Uegb++8XgANXyqIQZK3tPRQVlwHa6dKFR0mDDkT+FSGhd7BniZ+312tIBjE/EfPneX5EBiwrdKWCn5OOjhlhkacRvwUIlOzUYg7GOAXkguOC1Fqo1Wa4FAPgMEZ2CmvgUqx4rUWLwL0UIjHg2PFKSF0FsLOfrHmwefeEcvEyTDIcTgfSj9SFRkLBJ89eLkiEqmkSyS+lWj/9ikz5ePk162xrjt9f5fEmUMDywUjugvRG7R3X4vnosaGeqfH34nbZ9hMBqbgy7m1+CdCZ1v7TtZLk7OFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoOtlFxOTztopXclAbiCCC5OWKvXUyqImo9xMJ1Tn0I=;
 b=QMaXrSmZLc++lOZaBR2EPz1Au29Qyldb828JDbFpd4kQO8p4NKlBeYihx8WSls8lNza8o05+bE6/PugylsCkpFzKez5Xw/j1aYFU8BoCpxyKA3gFS6HDpIy6xFQSdRj72z6O8CLwQbWfm61t7YdP4YUR007cx3OcvoPl6X2AJJOKfEBB1BWHVcOgBRe56ydweUw0VdJTg3dnnxixV7G7AjlCm4zRvYv+jTx5F7CxQMxE8jfUEFLakcc7u5pv0bc8N5g82pcgHa5Yk83V0u1HxnWZs6FnAuq3B+30t9PXa6dgyu7oJHKA2siJnobT4+k4K5jhMSPzSz5ZXFsEBh3PUA==
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:16:23 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::a2) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:23 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:11 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:11 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:16:07 -0800
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
Subject: [PATCH v2 07/13] i2c: nvidia-gpu: Add cypress,firmware-build as a well-known regex
Date:   Fri, 11 Nov 2022 18:15:03 +0800
Message-ID: <20221111101509.999589-8-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d6c6a5-dc93-46aa-cf65-08dac3cdc92a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4BgHZW5cNk4WgdOCBalwlaLnZTyevvwTzKG5HbQttWq3aKPqeJUmnj0gYr6JoFtl0lL1RzqdSNZuOqlJHGgj41yAGwbM9untTM40N8suHS5rOY5VLWhPSsbOTNCBRw47jLbMNVaarxsluDgcwE4w3fG3w7hJLwmcLeiLyIT4J4mbNttv61RcgdJsfcOzssHM9y/2ayNirTYHCvwB8/v1k1YjbG/eQt10kk/WR8zWB3SUBriQ0veicLpm3ou9ldFKRxNax2oIt6jjoiLOa/urUUHcEwcVKuaPe7bxAfa8vy/2sRSennsA5/rWya0kBNd3hOJR5j0Q7Rea4yEHuU3hmipJ9MYFMn6fZ6rgdXgt/r4ttHxlH8Awudt4vnm/Ea586+sYhuOxiYV96K1EyhcZqIwgcsljhmr4KIO91FLmMTZa8mxMIFbtzCnKI8ZMNErPMB26ftDqeJy22/DX7AviTDT9vlJhuZHaWyBf8hqu+XVSBmfGeEWE/d/teu9ArXg/j8yshFXnQvTpVM7yr6+nDdIk0IcEFgsqPuDR9rfm30J9CFz0T5E7KM1hlJ+pge/Lzh1JtPHRkclAwdyzqkkclaizoRc6sKU/efwZ2QQTfajfL26yah7Gb1lxHj2eU32Jd/3gcA0/v/PBBHhlA9S1RUEvHUSpHUQc2ENSNTL+EPLFDcXG0+xM2EJMtIzlE3jJ4+2hAvO8TgKGL5dhtDCdlwk7hGCwoyPL/qMfgneiuE1ElX5pP5efsgOjQIAroDKP/u0PUjRkawdHY/AXTxd25Xtrg7Y2sZ6b5cY8XLBtYw=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(54906003)(6636002)(110136005)(7696005)(356005)(316002)(7636003)(36860700001)(4744005)(426003)(40480700001)(2906002)(47076005)(5660300002)(186003)(4326008)(2616005)(8936002)(70206006)(336012)(1076003)(40460700003)(7416002)(70586007)(8676002)(26005)(921005)(36756003)(41300700001)(478600001)(82310400005)(82740400003)(86362001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:23.5678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d6c6a5-dc93-46aa-cf65-08dac3cdc92a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
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
V1 -> V2:New change for adding cypress,firmware-build
 drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 12e330cd7635..9b2e13bd44db 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA (nv) only */
 	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	PROPERTY_ENTRY_STRING("cypress,firmware-build", "nvidia,gpu"),
 	{ }
 };
 
-- 
2.25.1

