Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BCF45856D
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 18:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238534AbhKUR2P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 12:28:15 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:53416 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238282AbhKUR2L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 21 Nov 2021 12:28:11 -0500
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Nov 2021 12:28:11 EST
Received: from coburn.home.jannau.net (p579ad520.dip0.t-ipconnect.de [87.154.213.32])
        by soltyk.jannau.net (Postfix) with ESMTPSA id 1F562261B2B;
        Sun, 21 Nov 2021 18:15:46 +0100 (CET)
From:   Janne Grunau <j@jannau.net>
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Olof Johansson <olof@lixom.net>, Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Apple Arm patform device tree and bindings fixes
Date:   Sun, 21 Nov 2021 18:15:42 +0100
Message-Id: <20211121171545.27402-1-j@jannau.net>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hej All,

this series fixes small issues in the device tree bindings and files
for the Apple Arm platform in v5.16-rc1. The fixes are non-critical
but make things easier moving forward.

Patch 1/3 was previously sent, annotated with a "Fixes" tag and Mark's
"Reviewed-by".

Thanks
Janne

Janne Grunau (3):
  arm64: dts: apple: change ethernet0 device type to ethernet
  dt-bindings: i2c: apple,i2c: allow multiple compatibles
  arm64: dts: apple: add #interrupt-cells property to pinctrl nodes

 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 9 +++++----
 arch/arm64/boot/dts/apple/t8103-j274.dts             | 2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 4 ++++
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.33.1

