Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0EBC573226
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 11:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbiGMJL7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 05:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234835AbiGMJL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 05:11:58 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::620])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D091DA598
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jul 2022 02:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lsfra2XG9UHVJqUcrKnEegytENUSsf5hpQasbBGD7QMtKHjpb+cXe5QWtdPrWR2s6W95gFfFmnP4WOZtzQVU8HRSbe2jhIQgp+gESJenzsRS1HgD1kEGCPaJcPCZktaLF+/cupkpXCH6Py9RVV1I5qArGcp37VIzSHyBOeZmKWGtBQA/4YdQuLpAAD++qpWSrT+jja/aAUzbJNZqgFhc7Cv4xjNpiNr6jXi5VHPYTy7Cn9NAaGRK1TC10MCt754KKgGS8Bz8HvWXw9iYXQOxfXOLXaTXNzJdWLhcnPQkqKithTiIEpKk/KXyOf1Ge5WxLNyFl3pXXXgAFPPLfJd/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWhkQ3f2kwT8FEj59/NnOc+UmY93vC4b8drB5zeJdlI=;
 b=dmMFT5CeevgILbJtkrTKsWdGrCxjW98KmWhcpZPWaz78tZT0FBGLbKovhaj4meFvUfCsCIfF5jdLI1o9e83+XHjuKeUckY0kSBer8M01XyVsEIDiuumRu7s2yQecmy7P5Mg6qGy+oAkGAooECwsIP6hRycPgvkzCpqlnxAOgG8UdJ+1yF1pniSIyDbtmIn5rwmOf0pBemwoH5mwLh68D5WYTLUjYaWqejfbOuolvG6fBe9giAVBe9SIPGG4wLu9Q7M1hK3cMGJLk2E8StQRUDppmrlfwF5MHbgAsfJkhRRY8w75gNWBZqBPK2PcWTEVLqzj8seiE3tAp4t9N61AtsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWhkQ3f2kwT8FEj59/NnOc+UmY93vC4b8drB5zeJdlI=;
 b=dQjc1zCk+uTCw4utFIVl1LMfZMheB5uE6LS0QDx7HydyBBi4bdP38gX12H64bThG6n+lOUh5EAyL63zjlzf6/iM56GZEvICZ9sP5wXNXg+H2Jcy8LfXeETxIAAVoQ2nBuPrILoIfaaO97ZqSwRiYDSDMtOCSCqBFrLZXC75k9J46k3sCnLxi/qTFH95ZkERvg787YeVSysEN07mu+Cj9or3bssdu3HwjBn7MO7e84ZaWspR7upX+XpV2QGXYj3mB931EOcElvVHVT7/KDsF+wC/RBwGXWvayg6hzFrTKEReNsYMSKVD9pyUFXAf4a+jiVqIE3e+UACw9is9MlS8ixg==
Received: from DM6PR17CA0025.namprd17.prod.outlook.com (2603:10b6:5:1b3::38)
 by DM5PR12MB1402.namprd12.prod.outlook.com (2603:10b6:3:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 09:11:55 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::7f) by DM6PR17CA0025.outlook.office365.com
 (2603:10b6:5:1b3::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13 via Frontend
 Transport; Wed, 13 Jul 2022 09:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5438.12 via Frontend Transport; Wed, 13 Jul 2022 09:11:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 13 Jul
 2022 09:11:55 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 13 Jul 2022 02:11:53 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 1/1] i2c: mlxcpld: Add callback to notify probing completion
Date:   Wed, 13 Jul 2022 12:11:36 +0300
Message-ID: <20220713091136.734-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adae08e3-9a31-4767-ab80-08da64afbb97
X-MS-TrafficTypeDiagnostic: DM5PR12MB1402:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVorYh/xrVgby63pNAzuDJSdXbtw8YU48ov4bAJMZvJzHE4ZmaF2gTFybyljGCq/MLzRf7HEsJJUsuNVa+qYod7wf7oLzVhYcWomEhZoUXZvV6aviZCgCAhBk2nqYAIvzqIMv1wKJiityM/t0KzMhkuq2W/br9CRAuiNH8MEJ3bM3RxR2gnvZD6mrItcx6Borfgo7JkfM6qubT/2kL7K0S12kONcSpf6Q+iBTTU53Fl5O17ljn7vHmEsKX04opi6vIovAopDsOpMXUwMUSsPvYXayRTk9y2SQkj8hSuNSynQGMrhzUWnnSWgxgxfnOyfp5w04Kh/YWWJOiprf/4k0v96RfL75IsbUbNAyFXynayvwMaErtjusIu89Sv8Uh1QZWqjOYoPzBdMhkypTfWEgjc0B6+BM8DT/Bhx0wlPnIUYLzXvOo36sbKQ9r+scvSIF2mHkijFRdPVyVgBop4Qm42Zch1j8uKPB4cnPHogWDJyHe6VHhZagwrmnvxaa+tYHh6gEqrhiZMS0yTDnM62+JhUfnNCTFKP9kM2rUjQc3CSa6Vpy5SxEmz9V3IgpnluF9+3zkWuyYTCCc2n8gI3abgTeD6v558UqTr0nQlTGmWGRRD8cGhgRsvX/hyu4xeqleLqyUsdcqIm9G/e58vqz7LpgiVLNPoxfTZIDGhBNxKzA4sfRAwITdYR9aH1ZnALUXbBzEq81UNzOY/UwXznvw43HL3OATC0B5tCE4uWqfGZbuWmYILhIM8Gt+RU+YGmJMWTykORNCYYwFo7BZrrrxkeS+QfCv+f2dnPdZdeUgliP2fOmEsB5XAZcT74rJ62+coRUE97U+MvgbAMXSKu6yhlqMylfWVYTAD9NA1rKpajxQmOjobQMuoZNcQbswKU
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(40470700004)(70586007)(40480700001)(86362001)(82740400003)(186003)(6666004)(356005)(47076005)(2906002)(16526019)(6916009)(426003)(336012)(4326008)(82310400005)(26005)(1076003)(54906003)(70206006)(107886003)(8676002)(2616005)(41300700001)(478600001)(36860700001)(36756003)(40460700003)(316002)(83380400001)(4744005)(81166007)(8936002)(5660300002)(133343001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:11:55.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adae08e3-9a31-4767-ab80-08da64afbb97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1402
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add notification to inform caller that driver probing has been
completed. It allows to user, invoked platform device registration for
"i2c-mlxcpld" driver, to be notified that bus adapter is available, and
thus some devices could be connected to this bus.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 56aa424fd71d..363ea9fd66c4 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -560,6 +560,10 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 	if (err)
 		goto mlxcpld_i2_probe_failed;
 
+	/* Notify caller when adapter is added. */
+	if (pdata && pdata->completion_notify)
+		pdata->completion_notify(pdata->handle, mlxcpld_i2c_adapter.nr);
+
 	return 0;
 
 mlxcpld_i2_probe_failed:
-- 
2.20.1

