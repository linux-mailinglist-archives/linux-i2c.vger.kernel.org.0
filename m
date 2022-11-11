Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA386257B8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbiKKKPt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiKKKPt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:15:49 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0B24C274;
        Fri, 11 Nov 2022 02:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4z64xdaraZ+PSldr1ScLF2sS5pNpAO2R7A3DsavloY4G06ZVmQ79S00Xtkqe6KqhdXGzylv00XHpOzQ4wlDl7fgTggTJthjVQ8N7a2TA8v+3nZwL7HtvzSemViSGvhCe2d7vNPMgXXRlD8jTyTa/NDrhY+cYgwL2oVv47yU4bQsNMoAgUexYkc2kZotO/ohkZrmi8/0sYx6FsVFfRYiyKQ6boexYWkLlDkkuDPfY3BT6oWnlKC9NWrbD8W3AdcYXEk1CuRUoPuev+gqyGdT0VYbF7Ygky7INBpps1XblE+G3ZJg+Q/IVqhadB2zvyAoWe7hjXrvRyx+AZxmBAuQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO6Ix59rU7zmm34O+zZPkGharVAgEnO8/u0MCk+L0WQ=;
 b=KHTXACrUMygA+i6bfeZNHxIEQub7fprCXWwrUE2I3G2WQns1wilFR807Pnwz+hFPE1w8JsWROkvwWEC9yb+HLXzX/dLRqxfo5QRuFiwHv87kJClEJ10HuAqWts4nbFVhzoMY2H9ArbnwqTK7traoveeUwXh/lwBZHw2KeO9egAUGKQbI05kkK/yiYBE1oXff3elCvm3oOf0Y0RjinCQWcbM1bdQ2Ycui6Y8qVOQJ53MULEdi9dMygPmBgGoNPeXrcrQ7tPxzwMsnqnzertbvr5zt7e6E9M6MEYZPn245fQH5AEDnxRNMgxGrwDsHt+Ny5SIRiXbCzxE7rkq3rvliWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO6Ix59rU7zmm34O+zZPkGharVAgEnO8/u0MCk+L0WQ=;
 b=BKpLfAa0hv3eqvB7bCH09/mtbcFmL63XoyQTOcqfxTOJChYyQyHgEibbXOqaF23sJr4pdnpXDtuTt7pCwBWn3osFbYrlBTBzwqrC+HYqa6QQgopmpHL6awi9P355Fw3W9R4J5OWjmFJ4NRHAA6N5kXLh0BzNNYD2OQnDsWuN9yZp8uVug7cU8vHN5tpgcWlDPpsCT91GHUfcXR6BsgroA0M57dqMGE3Auz0zrkCvYqEZ485c3Ng6KVLB6n2jdk4OWnPzMss2kzgKRshEVSmeEyAUYzSaz0FGCqJ1GQ3ginaM/gtUFJmOWL0Pmd4r76x4t7Wz/cEyZ4LBZouR8UVYEA==
Received: from BN8PR03CA0003.namprd03.prod.outlook.com (2603:10b6:408:94::16)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 10:15:44 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:408:94:cafe::66) by BN8PR03CA0003.outlook.office365.com
 (2603:10b6:408:94::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Fri, 11 Nov 2022 10:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:15:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:15:23 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:15:23 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:15:19 -0800
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
Subject: [PATCH v2 00/13] Enable USB host and device functions on Jetson
Date:   Fri, 11 Nov 2022 18:14:56 +0800
Message-ID: <20221111101509.999589-1-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8e137b-b9fe-4130-f3c1-08dac3cdb193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJrSVb6XSvNkMLLXlAdIexVpsf/zAAPhwthc33R+A/5UoSyphcaFUpeNtu0gFmmeeyh+JiluCROC0/hLyEcSLvMU3QwNi++yqGE9uOQ8r0PumJhdeunAXE/GEwDk6dS2WMO628e4QgC7PxzpKiOQwq86A/CTMh1OVC/uMFQ0YndriPeZpqtvZ/7cewkHakggcQWS8aEL+Lrl8ZkfidIfOETiTfHuYhx0KDmUUTb68rKEDrT18B/9w9nvfEFLr81yTrI5M8S663EHHN7pAOXF3T1I4zHl+yrFnY8c+oqJkmR5EvDFAkoQSN2fLFxshhoGGy0t9gXdl2LIT1M7EEye1AtoCxedrthn2L3+JBbF/soOQGp0BjO5hTtUN+YoQHjFPzHZT1YRprCKDcoUhwC+JDL3YN3ViXjqDxF8c8Z0dsWU4hcZm29qKTfavHIidJSMRrUEEULfCO+bGaXAHDgY4ERdd1UxItumpPJP+LQ9bqsmrSBgCF5PB+0KxvB7CPtpxrc8vuLzdLZGtXThVlhlrl9YnoTP0BbU/t1ZkRq7Xuaqnawp6aJh9H6dERV+ZWhdwzgWAlgr5pMCNnpBogUGnQk9UD5eefyrb83uR63GUZP1a8385HS6w7ww2QxW4of+7y+zsWP7VBSWyz399KsPn00l6aNCY2rrDl/rOw0OYjgSi8NX4hVzIR61w8XtgxmNlvBGTBxsLPWssjldUN0hTxo/6dZ+Av/+z3h3WyJBJzFAX1P5H8v1U2sftYGU2ONgq98PlGLvJO16oEvs75d2XXznPlRqGkEtkcDijCja74+w5fLavk1uZtVtsXPZ2avwJn2lrtzvC6MEbqtGpZPzYf5xJcEAL0PcwhBEVkqz8ADB0j1l3Zd906X8B6tHIL2N
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(478600001)(47076005)(41300700001)(4326008)(921005)(26005)(70206006)(8676002)(70586007)(426003)(40460700003)(7416002)(2616005)(36756003)(40480700001)(82310400005)(54906003)(1076003)(7636003)(82740400003)(86362001)(83380400001)(8936002)(316002)(356005)(36860700001)(336012)(6666004)(7696005)(966005)(6636002)(110136005)(5660300002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:15:43.9291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8e137b-b9fe-4130-f3c1-08dac3cdb193
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch series enable the USB host and devie functions on Jetson AGX Orin
and depend on the following change
https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/

Sing-Han Chen (3):
  phy: tegra: xusb: Add Tegra234 support
  usb: host: xhci-tegra: Add Tegra234 XHCI support
  usb: gadget: tegra-xudc: Add Tegra234 support

Wayne Chang (10):
  dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB controller support
  dt-bindings: usb: Add NVIDIA Tegra234 XUSB host controller binding
  dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
  arm64: tegra: Enable XUSB host and device on Jetson AGX Orin
  usb: typec: ucsi_ccg: Add OF support
  usb: typec: ucsi_ccg: Add cypress,firmware-build as a well-known regex
  i2c: nvidia-gpu: Add cypress,firmware-build as a well-known regex
  usb: typec: ucsi_ccg: Remove ccgx,firmware-build property
  i2c: nvidia-gpu: Remove ccgx,firmware-build property
  phy: tegra: xusb: Disable trk clk when not in use

 .../bindings/usb/cypress,cypd4226.yaml        |  86 ++++++
 .../bindings/usb/nvidia,tegra-xudc.yaml       |  24 +-
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 +++++++++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 ++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 175 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 170 +++++++++++
 drivers/i2c/busses/i2c-nvidia-gpu.c           |   4 +-
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             |  64 ++++-
 drivers/phy/tegra/xusb.c                      |   6 +
 drivers/phy/tegra/xusb.h                      |  22 ++
 drivers/usb/gadget/udc/tegra-xudc.c           |  17 ++
 drivers/usb/host/xhci-tegra.c                 | 270 +++++++++++++++---
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  22 +-
 14 files changed, 1014 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml


base-commit: f67dd6ce0723ad013395f20a3f79d8a437d3f455
-- 
2.25.1

