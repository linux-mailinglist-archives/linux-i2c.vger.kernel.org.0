Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E66B4597AD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 23:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbhKVW1u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 17:27:50 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:59130 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhKVW1u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 17:27:50 -0500
Received: from coburn.home.jannau.net (p579ad520.dip0.t-ipconnect.de [87.154.213.32])
        by soltyk.jannau.net (Postfix) with ESMTPSA id 75681261B41;
        Mon, 22 Nov 2021 23:24:41 +0100 (CET)
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
Subject: [PATCH v2 0/3] Apple Arm patform device tree and bindings fixes
Date:   Mon, 22 Nov 2021 23:24:37 +0100
Message-Id: <20211122222440.21177-1-j@jannau.net>
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

Changes since v1:
 - replaced single value enum in apple,i2c.yaml with const
 - added Sven Peter's Reviewed-by tags to Patch 2 and 3

thanks
Janne

The series is available as branch at
https://github.com/jannau/linux/tree/apple_m1/dt-fixes-for-5.16_v2

Janne Grunau (3):
  arm64: dts: apple: change ethernet0 device type to ethernet
  dt-bindings: i2c: apple,i2c: allow multiple compatibles
  arm64: dts: apple: add #interrupt-cells property to pinctrl nodes

 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 8 ++++----
 arch/arm64/boot/dts/apple/t8103-j274.dts             | 2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 4 ++++
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.34.0

