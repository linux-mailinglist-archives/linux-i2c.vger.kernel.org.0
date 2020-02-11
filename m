Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C2A159BAE
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 22:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgBKVxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 16:53:37 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:13064 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgBKVxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 16:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581458014;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tz5FT9e8j/vOF6dHesX7jElKIt8MXbKvwaqQV2chsVc=;
        b=Hn42g1Ri6Kv+i6TcCfCCQFFFRRDWRUdkljDeRuGTJA/h0nS6YIDJQPxDwxUG9VSSxq
        0DsMir+XMZC1E4rdTebI8ZwG2BHR+0ucaOxV5aUFp3a8X6FCyQ25bwWE8K8wnby+NBn+
        nWQib1cp7iLe7TmoSsQ9YcAn6yIVWl5mBK0sDTvXtcWko7pfzOoAVWJn9naJVrYq4LOJ
        VBMajR0W9uisXCg6HEEBXCoJS+qpAMwh6/4zEjMIjjKWzct1fiOn4TgPfwW7GZWtTbir
        BJPUd5apki3iT3eTIaKCq2PR7fKHFfWwUPu8MnsntT7PUaFUQ+G/bkauc3TAf7onRxvi
        w6EQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1BLfe0EQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 11 Feb 2020 22:41:40 +0100 (CET)
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
Subject: [PATCH 10/14] MIPS: DTS: CI20: add DT node for IR sensor
Date:   Tue, 11 Feb 2020 22:41:27 +0100
Message-Id: <5ba2ba43f06955bbfcd8465271bb01cfc1101d13.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

The infrared sensor on the CI20 board is connected to a GPIO and can
be operated by using the gpio-ir-recv driver. Add a DT node for the
sensor to allow that driver to be used.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index e1364f941c7d..b4a820313992 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -62,6 +62,11 @@
 		enable-active-high;
 	};
 
+	ir: ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpe 3 GPIO_ACTIVE_LOW>;
+	};
+
 	wlan0_power: fixedregulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan0_power";
-- 
2.23.0

