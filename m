Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC109704FD8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 15:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjEPNvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 09:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbjEPNvp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 09:51:45 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475C64691;
        Tue, 16 May 2023 06:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkKiRcJ7uiZPimt/Sz+uhsQsvB1KXjiOxahShyh2HAw6u4frxMA6CK9ekYKMAyKFLeJCtSUfthQMEHlEINGwynXIO8fGPsgJ0OZm5matuSg7oMdwpH0n6LltzXgX8WkA4jcKoWDCUgGKtquzy0GqQieORJQBz3kDYcdRouGv2se/aBEeEYytvQXXzxkifomLayJtFLOATWuZXbhNLzADrhiEVZ/prHBVcXT/rMhNEgDX5zxWOnMVDpc++8fPcJnOCFZa8FYvkUlPBOOsw4tL21sI5jrF05MA88eO/xso1VCRVpOvNIgf8FP4pkwgd2j21oMGiXjB3OSNPWP2+s9UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2ZgRpCc/7+ww9IN5ckUA3E+YG3MxBndy5MLIRl9WYw=;
 b=YalqqcfeIx5wceDCYOdmlu4Fr0aAKRsOuDX3FKMVy3SxtPHbdO+aXZ6Kq2ntCtF3hZ0pqxvXtY0lMqtCRPelJyb53gFw0J7fNzT00yIQ0pGDCpcax9eSusQgTbEgmWAbjIcNy0TojbIxwFWXBlZwbmFhWZcL68wuAdkQqDOqrAzqCQTLHjvH27/FWfalsT5L3lEFsBZ9dr96IqXWB1sPrrLZGtigJxR/JNMylmI0PcYOXXu8xnweXG6SNr9AQbSmltT8cdBzDbB7tlIQ96ZVclDTKj1O+Ib6Gp1nWbWEMK4iUP0FvuWY+KY6QVWviYIOk0GnrfSmTeSZaz5J6MIzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2ZgRpCc/7+ww9IN5ckUA3E+YG3MxBndy5MLIRl9WYw=;
 b=RxTXlBGwIn4+NJwTYx3gvXWeisYprpMBCgCXYDU1ox77EuMh7kDy9phfm4hHdMXd+4G92oAzWACfeElvh3c3EtYQgmHU5k0pspA05F5OaYQOsOlTwxQGRn8yHWgHkTeG4j0QnIbzX5KuFPq5WCxaoHtnm0lZt3Ns7cPse/8yA28=
Received: from DM6PR02CA0042.namprd02.prod.outlook.com (2603:10b6:5:177::19)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 13:51:37 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::86) by DM6PR02CA0042.outlook.office365.com
 (2603:10b6:5:177::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.31 via Frontend
 Transport; Tue, 16 May 2023 13:51:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 13:51:37 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 08:51:35 -0500
From:   Michal Simek <michal.simek@amd.com>
To:     <piyush.mehta@amd.com>, <nava.kishore.manne@amd.com>,
        <sai.krishna.potthuri@amd.com>, <shubhrajyoti.datta@amd.com>,
        <vishal.sagar@amd.com>, <kalyani.akula@amd.com>,
        <bharat.kumar.gogada@amd.com>, <linux-kernel@vger.kernel.org>,
        <monstr@monstr.eu>, <michal.simek@xilinx.com>, <git@xilinx.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Manish Narani" <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-fpga@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-ide@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
Subject: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
Date:   Tue, 16 May 2023 15:51:08 +0200
Message-ID: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20389; i=michal.simek@amd.com; h=from:subject:message-id; bh=UJh2IbZcbImCfax+wplr5YvbR5aWcrJrXIpjLjnMnSs=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhpTkLk+OHWYbE3oiF9ay/d2mueFPf5/0P6sGc7nIqE1zT j1Yrx/ZEcvCIMjEICumyCJtc+XM3soZU4QvHpaDmcPKBDKEgYtTACYy/zvDPJta2ci3Xy+8/Lu8 N1UhN3blTv6MpQzzXQ4Gnal0DlhhWi333uJTBJdIyNoTAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT033:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: eea31f22-da87-40fd-0b8c-08db5614ab4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxBbdi+PqJuPQd3NwHFgquM7450SbmDYv5U/7QfqGNNZIWYg8lyePWtjewTDEJbJ/W4AX9l1RfZsAdy5PK93YG6jVC897ku4VSqPDA4XM3f/1ZUx4OjL+z4Zcxy0aJZKdtqi53yttgve6fJJSVqC9JlAv1PCDuYnf++BZRmKvV6pQD4dV4lHkCFVhIW3NTYjec+w3J/UZDjwGHj3x7FRDWKvQwfOXzbQUfFmNTo1NoHZmEOU99sH8UCu9nTeYRYCA2FYPRaG5pWG3iK/bULaeiB5QA1Lesp5P1igVtubXsBlUqlPeUpu6PE6al7CuBxEBt6steuhO6cdirQOWU9cTYOXk5d00BA4TE1OplPH0zK+kopUP5MUCFcGhGOzzL23uEDcdlEKI+xnDzqkqLunOhrPyU2E4TT48KOetVqKziTAYFmgbrdNDUlv6x9ByvEmRuQ1ZIj2pI/qvgn9T2famQkyU6pMRSLA2kTI8BE6dtyJ40/LLBHz3xF+G8+sZDtM7uXqg30+ZUUiROkoAsniGPWdX6X4r9LWNCwMXvqELWISaw/aoMaBeKDjqDS8513+9vOnD22lJP6RDFAsbohraMllgHaoPP9bummSfU0kE/hpvAp0Q3eoK1BhuahJau3fDCaoB1zHOM1oygZJ8Qfya89rh28ljOJWMjfF8KwD3yWGu769+FuaqZOfeGKh8XyIqFscH4jl5SAGzCeH96/DftpZ6QQ0mZso4oKiQYUPAh01L7tkpNQa60jLUlk5GAv2KJL38YPzZWSBW8O76dkgQPGqtaeaDtkUyqLUuy9epT3OSusM9lp3plq0cx7y4LTB
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(36756003)(70586007)(54906003)(110136005)(316002)(478600001)(70206006)(966005)(4326008)(86362001)(81166007)(82740400003)(82310400005)(921005)(40480700001)(2616005)(5660300002)(8676002)(7366002)(7416002)(8936002)(6666004)(30864003)(7406005)(2906002)(44832011)(16526019)(356005)(41300700001)(26005)(186003)(336012)(36860700001)(47076005)(426003)(83380400001)(40460700003)(2101003)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:51:37.5029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea31f22-da87-40fd-0b8c-08db5614ab4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

@xilinx.com is still working but better to switch to new amd.com after
AMD/Xilinx acquisition.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/arm/xilinx.yaml             | 2 +-
 Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml     | 2 +-
 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml  | 2 +-
 Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml | 4 ++--
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml        | 2 +-
 .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml        | 2 +-
 Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml  | 2 +-
 .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml       | 2 +-
 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml         | 2 +-
 Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml  | 2 +-
 .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 2 +-
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 2 +-
 .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 2 +-
 .../devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml       | 2 +-
 .../bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml      | 2 +-
 .../bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml       | 2 +-
 Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml        | 2 +-
 .../devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml    | 2 +-
 Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml    | 2 +-
 Documentation/devicetree/bindings/serial/cdns,uart.yaml       | 2 +-
 Documentation/devicetree/bindings/spi/spi-cadence.yaml        | 2 +-
 Documentation/devicetree/bindings/spi/spi-xilinx.yaml         | 2 +-
 Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml    | 2 +-
 Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml     | 2 +-
 Documentation/devicetree/bindings/timer/cdns,ttc.yaml         | 2 +-
 .../devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml   | 4 ++--
 29 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Documentation/devicetree/bindings/arm/xilinx.yaml
index b3071d10ea65..f57ed0347894 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.yaml
+++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq Platforms
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 description: |
   Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
diff --git a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
index 71364c6081ff..b29ce598f9aa 100644
--- a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
+++ b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Ceva AHCI SATA Controller
 
 maintainers:
-  - Piyush Mehta <piyush.mehta@xilinx.com>
+  - Piyush Mehta <piyush.mehta@amd.com>
 
 description: |
   The Ceva SATA controller mostly conforms to the AHCI interface with some
diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index c1f04830a832..02bd556bd91a 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx clocking wizard
 
 maintainers:
-  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 
 description:
   The clocking wizard is a soft ip clocking block of Xilinx versal. It
diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 229af98b1d30..93ae349cf9e9 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Versal clock controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
   - Jolly Shah <jolly.shah@xilinx.com>
   - Rajan Vaja <rajan.vaja@xilinx.com>
 
diff --git a/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml b/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
index 9e8fbd02b150..8aead97a585b 100644
--- a/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx ZynqMP AES-GCM Hardware Accelerator
 
 maintainers:
-  - Kalyani Akula <kalyani.akula@xilinx.com>
-  - Michal Simek <michal.simek@xilinx.com>
+  - Kalyani Akula <kalyani.akula@amd.com>
+  - Michal Simek <michal.simek@amd.com>
 
 description: |
   The ZynqMP AES-GCM hardened cryptographic accelerator is used to
diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index f14f7b454f07..910bebe6cfa8 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx firmware driver
 
 maintainers:
-  - Nava kishore Manne <nava.manne@xilinx.com>
+  - Nava kishore Manne <nava.kishore.manne@amd.com>
 
 description: The zynqmp-firmware node describes the interface to platform
   firmware. ZynqMP has an interface to communicate with secure firmware.
diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
index f47b6140a742..04dcadc2c20e 100644
--- a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
+++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq FPGA Manager
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml b/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
index ac6a207278d5..26f18834caa3 100644
--- a/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
+++ b/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Versal FPGA driver.
 
 maintainers:
-  - Nava kishore Manne <nava.manne@xilinx.com>
+  - Nava kishore Manne <nava.kishore.manne@amd.com>
 
 description: |
   Device Tree Versal FPGA bindings for the Versal SoC, controlled
diff --git a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml
index 00a8d92ff736..1390ae103b0b 100644
--- a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml
+++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq Ultrascale MPSoC FPGA Manager
 
 maintainers:
-  - Nava kishore Manne <navam@xilinx.com>
+  - Nava kishore Manne <nava.kishore.manne@amd.com>
 
 description: |
   Device Tree Bindings for Zynq Ultrascale MPSoC FPGA Manager.
diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 572e1718f501..5e2496379a3c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq GPIO controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
index f333ee2288e7..c1060e5fcef3 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx AXI GPIO controller
 
 maintainers:
-  - Neeli Srinivas <srinivas.neeli@xilinx.com>
+  - Neeli Srinivas <srinivas.neeli@amd.com>
 
 description:
   The AXI GPIO design provides a general purpose input/output interface
diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
index 31c0fc345903..18e61aff2185 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
@@ -12,7 +12,7 @@ description:
   PS_MODE). Every pin can be configured as input/output.
 
 maintainers:
-  - Piyush Mehta <piyush.mehta@xilinx.com>
+  - Piyush Mehta <piyush.mehta@amd.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index cb24d7b3221c..ff57c5416ebc 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Cadence I2C controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
index 374ffe64016f..aeaddbf574b0 100644
--- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
@@ -33,7 +33,7 @@ description: |
               +------------------------------------------+
 
 maintainers:
-  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
index 7d77823dbb7a..43daf837fc9f 100644
--- a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx MIPI CSI-2 Receiver Subsystem
 
 maintainers:
-  - Vishal Sagar <vishal.sagar@xilinx.com>
+  - Vishal Sagar <vishal.sagar@amd.com>
 
 description: |
   The Xilinx MIPI CSI-2 Receiver Subsystem is used to capture MIPI CSI-2
diff --git a/Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml b/Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml
index e68c4306025a..6b62d5d83476 100644
--- a/Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml
@@ -9,7 +9,7 @@ title: Synopsys DesignWare Universal Multi-Protocol Memory Controller
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Manish Narani <manish.narani@xilinx.com>
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 description: |
   Synopsys DesignWare Enhanced uMCTL2 DDR Memory Controller is capable of
diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml
index 8f72e2f8588a..7864a1c994eb 100644
--- a/Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml
@@ -9,7 +9,7 @@ title: Zynq A05 DDR Memory Controller
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Manish Narani <manish.narani@xilinx.com>
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 description:
   The Zynq DDR ECC controller has an optional ECC support in half-bus width
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index 24ddc2855b94..4734be456bde 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: CPM Host Controller device tree for Xilinx Versal SoCs
 
 maintainers:
-  - Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
+  - Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>
 
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
index 598a042850b8..b85f9e36ce4b 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq Pinctrl
 
 maintainers:
-  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
+  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 
 description: |
   Please refer to pinctrl-bindings.txt in this directory for details of the
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index 2722dc7bb03d..cdebfa991e06 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx ZynqMP Pinctrl
 
 maintainers:
-  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
+  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
   - Rajan Vaja <rajan.vaja@xilinx.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
index 11f1f98c1cdc..45792e216981 100644
--- a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
+++ b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq MPSoC Power Management
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 description: |
   The zynqmp-power node describes the power management configurations.
diff --git a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
index 7ed0230f6c67..d1f5eb996dba 100644
--- a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
@@ -11,7 +11,7 @@ description:
   The RTC controller has separate IRQ lines for seconds and alarm.
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: rtc.yaml#
diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index a8b323d7bf94..e35ad1109efc 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Cadence UART Controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
index b0f83b5c2cdd..b7552739b554 100644
--- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Cadence SPI controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: spi-controller.yaml#
diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
index 6bd83836eded..4beb3af0416d 100644
--- a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx SPI controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: spi-controller.yaml#
diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
index 226d8b493b57..e5199b109dad 100644
--- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq UltraScale+ MPSoC GQSPI controller
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: spi-controller.yaml#
diff --git a/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml b/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
index 83e8fb4a548d..7ea8fb42ce2c 100644
--- a/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
@@ -14,7 +14,7 @@ allOf:
   - $ref: spi-controller.yaml#
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 # Everything else is described in the common file
 properties:
diff --git a/Documentation/devicetree/bindings/timer/cdns,ttc.yaml b/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
index bc5e6f226295..dbba780c9b02 100644
--- a/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
+++ b/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Cadence TTC - Triple Timer Counter
 
 maintainers:
-  - Michal Simek <michal.simek@xilinx.com>
+  - Michal Simek <michal.simek@amd.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml b/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
index 8444c56dd602..dc1ff39d05a0 100644
--- a/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx AXI/PLB softcore and window Watchdog Timer
 
 maintainers:
-  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
-  - Srinivas Neeli <srinivas.neeli@xilinx.com>
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+  - Srinivas Neeli <srinivas.neeli@amd.com>
 
 description:
   The Timebase watchdog timer(WDT) is a free-running 32 bit counter.
-- 
2.36.1

