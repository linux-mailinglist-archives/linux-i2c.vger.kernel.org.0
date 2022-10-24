Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44BE8609B7D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiJXHlo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiJXHln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:41:43 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820124D805;
        Mon, 24 Oct 2022 00:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC53nUnRHobLLVundS/YvwvxLqRn3uQCHXVeDP30Ym4aibK8c13huSx3qW0jwsChfyzc94S3qtMKmjpZJMUwNq4D/EQYwoJaG4c5ntm3P2tmyMxrQNCM+64OIbYAXQRk6O8c4PFg7PwFMvzmdlpCO600cVzwk2CMlzpMssK85i+xxMmG3GJ14uH48sDLTapv4Q9Gi0iXQ9NTXie69v65yHSPfLY0dSCdyz8xGa5ZwlXQs9w6xIn3ClXp9aBYFWdVGJ1VxIZNSO99pX5QrS62HZW+izEg/GKTZlkT28pPC5xW3ZaagpAQzAq/Q9VpKzP34RZjfqhrWl9Xo0AxmkvUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUNP0AcMyTeq39esiGqV/aVu9mwMMJYQu5ctT9eXXug=;
 b=Vwqyixrou8cMUov48XXNXBz4pgdMcU+raAjz9FHfMF9Udu0Uhs6ZWU+aBTrn1qsP3RKuqXht40pASMsCUrZwCP44Y8fNu0r9FWD/gflVcrsOtYsAbi0GvLCs+Tbgia+0X2cPHSR3qfc/3LrNqKYAUk9JXPrBUwuYvDc432mDcHkvpfpfwZjE87ZPFyeAy0dElWcFCTsnHpQkDXuT14WLJ7KEeaUwB5tTkHirVwnZ8i4+s+1FckzpoPGL35XFYTSvj7UNjaa5G0Upe2h7aox7BhZNqRk4mRplyO1YmN3hXKVc6rvI6RvhddP9p783cju+pY0zs6Wq0YOb4vzL+4lgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUNP0AcMyTeq39esiGqV/aVu9mwMMJYQu5ctT9eXXug=;
 b=hShdwbOpNwL/m+sVowp2/xKpsJm4lWlSgDdukBVZtbB4IH0uqkf5KhLe/vYqyXTk8FLq2F6GhalIF+vTwptCcK40r9NZO+74vruf/Qq4cMFgTTURoa7o5IO2oA3MvXQQL3Wa0mwGitPpZFfTpqdoAZDyRvFfJYbukM2q+TImwvHoTqLgibnORco7LeFYk/LLN6KqFggYUxo2bWXSwz63LcJp76QaFhzyuIzkn32yBr9l+Vv2tHrX6MEUOo6IhnyKbansfbMuxKu66ySIge08SBPG5MWMh3AbjR6oML4F5u9FB3REqNJ681atYe4F+kNUZr4o35gH17iNtU4cDPRypg==
Received: from BN8PR04CA0031.namprd04.prod.outlook.com (2603:10b6:408:70::44)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 07:41:39 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::b6) by BN8PR04CA0031.outlook.office365.com
 (2603:10b6:408:70::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 07:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:41:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:41:38 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:41:37 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:41:34 -0700
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
Subject: [PATCH 00/11] Enable USB host and device functions on Jetson
Date:   Mon, 24 Oct 2022 15:41:17 +0800
Message-ID: <20221024074128.1113554-1-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|SN7PR12MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e5ebdd-2ad1-475a-59df-08dab5932fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQWXOz7ouDF7O0gl5XcVQufBoF8kvX3meLAnHCfJolIXzsJkZYaPS62IStSnGhcCGaUUwMzlKodcWNxE3TDa5otTtBT6mS4pO9QiOrWu9UjfHeVO0l1CL7YTbBP+GR3gjR86Y2+/XdPGJy1yCUWyTgG7XNL1ruG9PlPSgnXUsYjaRTdNKFcRa2Efe/2e2Mqq+4hqYZpbwW7u+XT8vNclPuMuWNawkOC3jwc1A895LXOxJ/u2q7xkNu4aH89stzUHOOMoJpIjLVMsP7lW9v5HPLsoxvIyCI4mPQ/r5fngw1dCcBXCkEsQnOGMSH03MlmxZZ5W/Iv3j+QO6KRP2L8ZyOW+OGADDugDd4TqCVGU9ZSs7wyknQIvXrwfHJ1gJsmK0MJNM9mKEaxVEJTFgytQegJigTZBm/soU+vBs674jLAS07aeX8hsKhWl2NBmFGmDIc50aWaI1k5ysRUeIGHdrgtrazyCWKjd6mxVhNXWe6NSm8j+M/iQlReIJwfgFpKZOxtDUGxhM8+Qkt+NHdp2e805qjLoxQfdsDOm65XU/4zoXWXMUGiHJi8DQWv9EOqp2I2X0nK0rK5ivivHrXYp4S3o0YsVs6I+nkFL9yyacHHYHgRR9rHavdRdx2rByg5RpLRpkIa7ey3JXd6pLrPBpOqm/dMhaDCwZgCwO/kqs5dK5+Kq0j/L4K2i7wUmjrYdDWicl4p3kjG6/UjOpSao61tmhErzY3BRjhFK07OQmHaCuLP6LW8bjRdutE1GWLDCgz4zWSbxorqAkBgLanHTPmqv0N9VwEdoKuxdQ8gGDaIaxHs/0q+njJJF0lwN7lEYVO3nM+dXptkiOYJzuGRxCnJojUJIIvq25qrPyaVNUoaoIuNcCsx48B32pP5SugGO
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(54906003)(41300700001)(6636002)(4326008)(110136005)(8676002)(8936002)(70206006)(70586007)(5660300002)(7416002)(6666004)(40480700001)(86362001)(2906002)(26005)(966005)(478600001)(7696005)(36756003)(356005)(83380400001)(40460700003)(921005)(186003)(1076003)(7636003)(316002)(426003)(47076005)(82310400005)(336012)(2616005)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:41:39.3179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e5ebdd-2ad1-475a-59df-08dab5932fea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Wayne Chang (8):
  dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB controller support
  dt-bindings: usb: Add NVIDIA Tegra XUSB host controller binding
  dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
  arm64: tegra: Enable XUSB host and device on Jetson AGX Orin
  usb: typec: ucsi_ccg: Add OF support
  usb: typec: ucsi_ccg: Replace ccgx to well-known regex
  i2c: nvidia-gpu: Replace ccgx to well-known regex
  phy: tegra: xusb: Disable trk clk when not using

 .../bindings/usb/cypress,cypd4226.yaml        |  86 ++++++
 .../bindings/usb/nvidia,tegra-xhci.yaml       | 213 ++++++++++++++
 .../bindings/usb/nvidia,tegra-xudc.yaml       |  24 +-
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 +++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 184 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 170 +++++++++++
 drivers/i2c/busses/i2c-nvidia-gpu.c           |   2 +-
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             |  65 +++-
 drivers/phy/tegra/xusb.c                      |   6 +
 drivers/phy/tegra/xusb.h                      |  23 ++
 drivers/usb/gadget/udc/tegra-xudc.c           |  17 ++
 drivers/usb/host/xhci-tegra.c                 | 277 +++++++++++++++---
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  11 +-
 14 files changed, 1074 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml


base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
-- 
2.25.1

