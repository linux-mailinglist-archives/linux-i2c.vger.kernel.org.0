Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D52C65B5A2
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jan 2023 18:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236202AbjABRKg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Jan 2023 12:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbjABRK1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Jan 2023 12:10:27 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76A764DB
        for <linux-i2c@vger.kernel.org>; Mon,  2 Jan 2023 09:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPWIL9nDRa0OeblOpdOkQQVoYr9NXTBUwvMAb2XaOmT2e5zIvep3VBdhChlWpEbaVBXG7k0I7kPAgVAJT/8pQqnBpDJQWlCulWQByQTJXMgKb/H8zt43qgvWhpCUkxzstF5mAg8LiQdq7+BwkELI0EjBxsKhSS7fnyftuJcSijlS5IBFmqwLL8Aly9kVr04lHnfrd2yHL6c0tcBJJ2ufPR2Q5UF8Is+qxU+0+BaR921xwf6V8EepTkHPxAvBQQwTkh6aWwMFSGmkqgfoizT016ZpeTPQnPaw46CHNQfAXz3oNLHMZublwOEiuwl+qT9gooEJhu9/QWhmgiu/GaNPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrRgHCVYt0SJoX5Y8GNNIU3w3vo9FUSdD4gpxp51ji4=;
 b=KJXCCu8M00M1Egq8SNguD45dQsBK7Rc2Nc2MjTXSK4GXXZS1q4oebv29HsDtUSTtUbOUI437RhkfqyjSTzfsHiRg3wJSYpjq/aCWn1pdVuazvhLJRZiPsmANHgvyEWG9mOcArRjSqEucn+UkYy7DhAsA1NIkdDQ3p0by+XlnxZ6POvFGUj9AWzUm7hc2j4I1IBwWOihJ/Yv1ttohq02+9YMXsE7rZ9WQBqwRyY9uUb69ZnqRjIPd2K9ok6bgnUcJe0DLm4aHRMl1t80er2DlZ15WlRcQpj3a0QaiO7fjcAVyNc6O7f+RJR91opQkQ7k3SNCENCQW7hYCNQ+BmzLDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrRgHCVYt0SJoX5Y8GNNIU3w3vo9FUSdD4gpxp51ji4=;
 b=QVkKnBcz3fCGeofo9BpRGE005BhPVE/0JNaMJ5j/P5NLVUdJi96Kf3ESw7VrzAfbgF97F+akyuQy5kiEATHp14QzqnRqKPN2Vvi0U8HOLnF/GrM6VrYv6jAOkvFXNJdgO8sYRSwCySJIzjZLr6kdESdpeEFTCslv8eKhIqjITRs=
Received: from BN9PR03CA0760.namprd03.prod.outlook.com (2603:10b6:408:13a::15)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 17:10:23 +0000
Received: from BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::9b) by BN9PR03CA0760.outlook.office365.com
 (2603:10b6:408:13a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Mon, 2 Jan 2023 17:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT071.mail.protection.outlook.com (10.13.177.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Mon, 2 Jan 2023 17:10:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 11:10:19 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linux-i2c@vger.kernel.org>
CC:     <Rajesh1.Kumar@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Sanath S <Sanath.S@amd.com>
Subject: [PATCH] i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
Date:   Mon, 2 Jan 2023 22:39:55 +0530
Message-ID: <20230102170955.1750734-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT071:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: f34b40b8-5b92-4ae7-a10f-08daece43bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjitCd7rP8JRseTQaNFdBBvVKjAU+Ld07+cuB42xxHdiHcVfFw02jS1EGZCmTd1aHWwC9stnNeb4vRrUs01AwVYEC63kBQmyykzNbax+k9izlDXac+bdiA/C3GhjIw0GAQ/PQR4xkxOexhaFBkwf0v/pQV7a2ktoGnB/VB4FTA4JqkEjyj5cFf4Eu2arci6A3/HFpdEiDSDETU39W7PU5E6S0OfyNo5mES1Z3Segs7DKTBv8GMb+8bW1preXinGwjiXQyXzUXS5+g/5K3bc8UbRCwLdIS7oMPIaE/BB+0wU6WPCiYHkh6GYmT1iO+WijFMzZf/ntmp329XBEt6AWiB/lw5xuGsdoloMV3h6q6Hf7uBVgr+E3K4FfMETvU9TdhW8u59wvU9+i54MNQetx/XF+bor7XEZKUfDLh985sTqXDR167Ek53l1HsmKbehA+e5qfyQqMyj2HVuaFvRZw3P051E7h4EimAbv2R3ewE97U1C1+YSse6jeQ3nDeAq0DCCRHKCKHS+lva8jk5f4SqLvaCx6XaW7NxXvSHylgbZfE3fAekO6BNrUxD/4rPTF0cHED9WGBCKEdwPNWAO16t+DtKDI5MdAzG2WYmZ0FHUA2mMnlOFXaHewP2fkenmrvDQLDKZ8Lc//dwx6MiR7HxQwdSuN/h5yTllkB6MMBvIkYbPUyEOr8ziKI4x+ZFBfJayooqjudfZhMANY5wQCNa+BS4StpZ0QGmyXA2+QaSlkBlNMMNplnNy0rZOoIe8G1zozEPoe3rXeK88D8X3lu2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(426003)(82310400005)(336012)(16526019)(1076003)(186003)(26005)(2616005)(7696005)(6666004)(40480700001)(86362001)(40460700003)(36860700001)(36756003)(356005)(81166007)(82740400003)(4326008)(41300700001)(8676002)(2906002)(5660300002)(8936002)(4744005)(478600001)(70206006)(316002)(70586007)(54906003)(110136005)(22166006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 17:10:22.6235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f34b40b8-5b92-4ae7-a10f-08daece43bd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add additional supported PCI IDs for latest AMD NAVI GPU card which
has an integrated Type-C controller and designware I2C with PCI
interface.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Tested-by: Sanath S <Sanath.S@amd.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index e499f96506c5..782fe1ef3ca1 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -396,6 +396,8 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
 	{ PCI_VDEVICE(ATI,  0x73a4), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x73e4), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
+	{ PCI_VDEVICE(ATI,  0x7444), navi_amd },
+	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
-- 
2.25.1

