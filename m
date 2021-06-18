Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA873AC958
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 13:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhFRLG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 07:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhFRLG0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Jun 2021 07:06:26 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98E1C061760
        for <linux-i2c@vger.kernel.org>; Fri, 18 Jun 2021 04:04:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:104a:f93d:b771:fc40])
        by laurent.telenet-ops.be with bizsmtp
        id Jb4C2500J47PYg101b4CXF; Fri, 18 Jun 2021 13:04:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCIG-000yA4-8t; Fri, 18 Jun 2021 13:04:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCIF-007GWL-Lu; Fri, 18 Jun 2021 13:04:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] renesas,iic: Fixes and DT binding to json-schema conversion
Date:   Fri, 18 Jun 2021 13:04:06 +0200
Message-Id: <cover.1624013644.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

According to the Hardware User's Manual, automatic transmission for PMIC
control (DVFS) is not available on RZ/G1, R-Car E3, and RZ/G2E SoC.
Thanks to various experiments by Wolfram (thanks a lot!) and me, we
devised this really means that support for automatic DVFS is not
present, while the IIC automatic transmission feature itself is still
available, albeit not super useful.

Hence this patch series updates the renesas,iic DT bindings and DTS
files to always consider all variants and instances compatible with the
family-specific and generic versions, and converts the bindings to
json-schema.

Changes compared to v1[1][2]:
    - Consider all variants and instances compatible with the
      family-specific and generic versions.

I plan to queue patches 2-4 in renesas-devel for v5.15.

Thanks for your comments!

[1] "[PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to json-schema"
    https://lore.kernel.org/r/ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be
[2] "[PATCH 0/2] ARM: dts: r8a7745,r8a7794: Remove generic compatible
    strings from iic blocks"
    https://lore.kernel.org/r/cover.1620139307.git.geert+renesas@glider.be

Geert Uytterhoeven (5):
  dt-bindings: i2c: renesas,iic: Always declare generic compatibility
  ARM: dts: rzg1: Add generic compatible strings to IIC nodes
  arm64: dts: renesas: r8a774c0: Add generic compatible string to IIC
    node
  arm64: dts: renesas: r8a77990: Add generic compatible string to IIC
    node
  dt-bindings: i2c: renesas,iic: Convert to json-schema

 .../devicetree/bindings/i2c/renesas,iic.txt   |  72 ---------
 .../bindings/i2c/renesas,rmobile-iic.yaml     | 149 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/r8a7742.dtsi                |   4 +-
 arch/arm/boot/dts/r8a7743.dtsi                |   4 +-
 arch/arm/boot/dts/r8a7744.dtsi                |   4 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   6 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   6 +-
 8 files changed, 167 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml

-- 
2.25.1

