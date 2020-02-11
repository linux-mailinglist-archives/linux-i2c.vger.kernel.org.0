Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 693FB159BC7
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 22:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgBKVxm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 16:53:42 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.176]:32392 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbgBKVxl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 16:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581458017;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3bosFD/maVT7s0PxPwS4PL1iP9bgaYLTqR2vJvqzmIk=;
        b=Z5XK0/7LLbJegyHtTRM1Ba6h6GlO9i7wP+AUgGN/AJh6Asf4Tq7+PSD/L8PKA1kpmv
        MrnjmtQHwDV//WgtBItDVtdbLssef6fiu/AzQx2EELIU/+19yGOKgEjz8T7h4JI/JcBy
        Bng5SaCptKWGkLbC9XqdE7pink2p5ouxDCRsD6VCm9Uhtb/KCmW0pYR5XrD5ATAG+fjB
        tq/zPkzhwzt2OvnenCTREeDTnhdQoXqQpqB6rBTJOqodKeg9/42SWtUqvEH2n4DOIBtt
        +RZ4wPCXc28TVVk+a+40++4vEOIJGHL/ehZ9G4251V47Qqp8EqK6tidZgbzpCK9Nn9vi
        wqtw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1BLff0ES
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 11 Feb 2020 22:41:41 +0100 (CET)
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
Subject: [PATCH 11/14] MIPS: CI20: defconfig: compile gpio-ir driver
Date:   Tue, 11 Feb 2020 22:41:28 +0100
Message-Id: <4cda1587b8e380db7b2b921dfcd21e73c001505b.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CI20 board has a gpio based IR receiver.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 74e5775b8a05..0458ea4d54e8 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -181,3 +181,8 @@ CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=m
+CONFIG_LIRC=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_RC_DEVICES=y
+CONFIG_IR_GPIO_CIR=m
+CONFIG_IR_GPIO_TX=m
-- 
2.23.0

