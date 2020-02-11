Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FBE159BC4
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 22:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbgBKVxm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 16:53:42 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:15652 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbgBKVxm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 16:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581458017;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=87P0OD8XaKZo4miCqHORxCklVwyh7VqETa9wtLbJ/YE=;
        b=LT8GCK7Cz/Ifxqxkfr0yNsh946cW/mVreS05dXwVbSfeQBCL6YAflFPWd5hVIT+qLq
        1F8+0XOU+qRZLKN67hUTnaRtiTcev4USluV5X45vImX19dd5AEoddOfDFPRjyo9zDe1M
        yicHGEJHc2LVJL0sjAmbL7f/LzLRqQTFyvGEhcL7yIKFr7V/SXbWebMYw4GDOHn2h4gZ
        D/fmR6SCqj6zcl3ItI4+TlMdHgDHfhXPtXzoZPHUjWKGLkMB9t1EXeKhIwUy+6jp78BE
        prGuGrpHgwPfRtbItgAL7j978uyuZFgqwm45MpJ5ugcDVo9nzt6+3BeuffoJNd41qv9P
        HNvg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1BLfg0EU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 11 Feb 2020 22:41:42 +0100 (CET)
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
Subject: [PATCH 13/14] MIPS: CI20: defconfig: configure for CONFIG_KEYBOARD_GPIO=m
Date:   Tue, 11 Feb 2020 22:41:30 +0100
Message-Id: <c84ff62818ef13f96acbbbe33276465b90ff9017.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The SW1 button is hooked up to send input events.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 0458ea4d54e8..0db0088bbc1c 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -89,6 +89,7 @@ CONFIG_I2C_JZ4780=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
+CONFIG_KEYBOARD_GPIO=m
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
-- 
2.23.0

