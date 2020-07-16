Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1522228D9
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 19:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgGPRSo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 13:18:44 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52329 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728182AbgGPRSn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 13:18:43 -0400
X-IronPort-AV: E=Sophos;i="5.75,360,1589209200"; 
   d="scan'208";a="52107158"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2020 02:18:41 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 75C8B40B5142;
        Fri, 17 Jul 2020 02:18:36 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Cc:     linux-ide@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/20] Add support for SATA/PCIe/USB2[3]/VIN/CSI on R8A774E1
Date:   Thu, 16 Jul 2020 18:18:15 +0100
Message-Id: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

This patch series adds support for the following peripherals on RZ/G2H SoC
 * PCIe
 * SATA
 * USB2
 * USB3
 * Audio
 * VIN
 * CSI

Cheers,
Prabhakar

Lad Prabhakar (20):
  dt-bindings: pci: rcar-pci: Add device tree support for r8a774e1
  arm64: dts: renesas: r8a774e1: Add PCIe device nodes
  dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Add SATA controller node
  dt-bindings: phy: renesas,usb2-phy: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Add USB2.0 phy and host (EHCI/OHCI)
    device nodes
  dt-bindings: usb: renesas,usb3-peri: Document r8a774e1 support
  dt-bindings: usb: usb-xhci: Document r8a774e1 support
  dt-bindings: phy: renesas,usb3-phy: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Add USB3.0 device nodes
  dt-bindings: usb: renesas,usbhs: Add r8a774e1 support
  dt-bindings: dma: renesas,usb-dmac: Add binding for r8a774e1
  arm64: dts: renesas: r8a774e1: Add USB-DMAC and HSUSB device nodes
  dt-bindings: sound: renesas,rsnd: Document r8a774e1 bindings
  arm64: dts: renesas: r8a774e1: Add audio support
  dt-bindings: media: renesas,csi2: Add R8A774E1 support
  dt-bindings: media: renesas,vin: Add R8A774E1 support
  media: rcar-csi2: Enable support for R8A774E1
  media: rcar-vin: Enable support for R8A774E1
  arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes

 .../bindings/ata/renesas,rcar-sata.yaml       |   1 +
 .../bindings/dma/renesas,usb-dmac.yaml        |   1 +
 .../bindings/media/renesas,csi2.yaml          |   1 +
 .../bindings/media/renesas,vin.yaml           |   1 +
 .../devicetree/bindings/pci/rcar-pci.txt      |   1 +
 .../bindings/phy/renesas,usb2-phy.yaml        |   1 +
 .../bindings/phy/renesas,usb3-phy.yaml        |   1 +
 .../bindings/sound/renesas,rsnd.txt           |   1 +
 .../bindings/usb/renesas,usb3-peri.yaml       |   1 +
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 .../devicetree/bindings/usb/usb-xhci.txt      |   1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 989 +++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-core.c   |  40 +
 drivers/media/platform/rcar-vin/rcar-csi2.c   |   4 +
 14 files changed, 1022 insertions(+), 22 deletions(-)

-- 
2.17.1

