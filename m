Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E94159B8F
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 22:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgBKVrh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 16:47:37 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:8477 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgBKVrh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 16:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581457655;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=EBfn4aNTLC4vcAvpYGu7o+g5GHVcJfaycvr27j3NIl8=;
        b=AqUtzdIgT59TofA08IG5WnXUoFaYAX7Zy1RM2oIrtj3MtNHPZLd01+6Gl3JKBCIjXT
        oZr8MaHM5bJMzF+j3HACYogO48lYK7HBwukZrOhuYuO76dcKbMhNJuttN5FJJ+RTgcS3
        zcpJHoZIzheYJF3MVgkn6C8owV3i1XVn6ghjcx6LtBO15iH6XPv3UGeVCg9b/Cs9nH6r
        C1t2ibb5sGilu0bul6q7t6fcVrG74z/NvYRix3vzDtyRlI/7wpZp5p6xq/9JJtvgM8xY
        yf4gmzWNn8V3kKF/gvVN5NfBMbf48uev9zdTNg+6mxTHvrXaUVM4KYqkistg8XANBUJ/
        Y70A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1BLfW0EG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 11 Feb 2020 22:41:32 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        Alex Smith <alex.smith@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH 00/14] MIPS: Fixes and improvements for CI20 board (JZ4780)
Date:   Tue, 11 Feb 2020 22:41:17 +0100
Message-Id: <cover.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch set provides several improvements for the CI20 board:

* suppress warnings from i2c if device is not responding
* make ingenic-drm found through DT
* allow davicom dm9000 ethernet controller to use MAC address provided by U-Boot
* fix #include in jz4780.dtsi
* configure for loadable kernel modules
* add DTS for IR sensor and SW1 button
* configure so that LEDs, IR sensor, SW1 button have drivers
* fix DTS for ACT8600 PMU and configure driver
* fix interrupt of nxp,pcf8563

There is another patch set in our queue to add HDMI support on top of this work.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>


Alex Smith (1):
  MIPS: DTS: CI20: add DT node for IR sensor

H. Nikolaus Schaller (13):
  i2c: jz4780: suppress txabrt reports for i2cdetect
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  net: davicom: dm9000: allow to pass MAC address through mac_addr
    module parameter
  MIPS: DTS: jz4780: fix #includes for irq.h and gpio.h
  MIPS: CI20: defconfig: configure for supporting modules
  MIPS: CI20: defconfig: compile leds-gpio driver into the kernel and
    configure for LED triggers
  MIPS: DTS: CI20: fix PMU definitions for ACT8600
  MIPS: CI20: defconfig: configure CONFIG_REGULATOR_ACT8865 for PMU
  MIPS: DTS: CI20: give eth0_power a defined voltage.
  MIPS: CI20: defconfig: compile gpio-ir driver
  MIPS: DTS: CI20: add DT node for SW1 as Enter button
  MIPS: CI20: defconfig: configure for CONFIG_KEYBOARD_GPIO=m
  MIPS: DTS: CI20: fix interrupt for pcf8563 RTC

 arch/mips/boot/dts/ingenic/ci20.dts    | 71 ++++++++++++++++++++------
 arch/mips/boot/dts/ingenic/jz4780.dtsi |  2 +
 arch/mips/configs/ci20_defconfig       | 21 ++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c  |  2 +
 drivers/i2c/busses/i2c-jz4780.c        |  3 ++
 drivers/net/ethernet/davicom/dm9000.c  | 42 +++++++++++++++
 6 files changed, 125 insertions(+), 16 deletions(-)

-- 
2.23.0

