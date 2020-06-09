Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EF01F3C53
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 15:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbgFIN05 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 09:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgFIN04 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 09:26:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF85C05BD1E;
        Tue,  9 Jun 2020 06:26:56 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g12so8036980pll.10;
        Tue, 09 Jun 2020 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ILMp3Me4a0Jm6IXnxt02gFbANgGUJCet44DEGXP16Yk=;
        b=gspW10yeD3Ig3PPYkYAVOZpbqMtWXRLVN0T31UeUe73zINPZZIkp2J90gD4VRGZHRZ
         iei35GZ+L/HjWrOg5uE4kxF6UzLLPvgeKkmc/wuMMP6SbKRkjMN+lroR5GRS6HDFOC3M
         GILf2G94TsrTC6KaJtoRlQ5nCSgq8s+IOThlYfIaLcIG0Tle9BHjkS1aUtyWY0j2qUBI
         jjrZIyqlBdTXNeP4nOt59d+yhBLTVJEw5Q8fAf98w0bMEa0bNtU7uNHKQAHjJxOVYyFb
         4P8UBdyM6effNFMGY3mv0tzNh08zuFrIOV1LFj//LcHmqyXGRqK+MHsyybWBW7FSfcTP
         T+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ILMp3Me4a0Jm6IXnxt02gFbANgGUJCet44DEGXP16Yk=;
        b=KmYvrxdQ7yVIkVpVCTUOwQyTEvKmvuXVXaM0wm/r7Ot93WRFvRCWDNJ8t2xXpHOr8Y
         zOEFoP5jVRlpTA8ezQisw4KPtWMvc+usPklLgDhGs/5u/DUeYnoZDjZC/1ZHgIGQGt2c
         ui5h1ADFdF0/SeayzVxRcYd6TmK8ZmynP303puZ6ZYK+nkEA7Xj9MreFhoUuMpbE+/KK
         oOvQnNrWCHg5iyYfftHYtkemkBI2zLey4+mcr0z8N3sMwj5m++RaOfZWF8psLrVM9lIF
         V9c1W44beWcptV0d8B5Kjk8/avi1R80p2JEe5s4lYtM1Rtxh4rMDTH0aGFCXfesPhu99
         lw9Q==
X-Gm-Message-State: AOAM531wxfFT948NQSH/KuUthaNImJG+12VHNSTbl71fO0miSj4uBD1J
        f6nD/+VLsSqsZURpQZvTNlg=
X-Google-Smtp-Source: ABdhPJyhL/LlvJFTDaH4V0AA0HNsugFg+Z3y3YeifkPG4RFoaxYuVgLw6vdy/MZ9yTGT+92M7VrQQw==
X-Received: by 2002:a17:90a:c70d:: with SMTP id o13mr4775927pjt.73.1591709215755;
        Tue, 09 Jun 2020 06:26:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
        by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:26:55 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        pierre-yves.mordret@st.com, philippe.schenker@toradex.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 2/4] ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
Date:   Tue,  9 Jun 2020 21:26:41 +0800
Message-Id: <1591709203-12106-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patch adds the pin configuration for I2C3 controller on
stm32f4.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa143ce07..051f33627e15 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,18 @@
 				};
 			};
 
+			i2c3_pins: i2c3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 9, AF4)>,
+						/* I2C3_SDA */
+						 <STM32_PINMUX('A', 8, AF4)>;
+						/* I2C3_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <3>;
+				};
+			};
+
 			dcmi_pins: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
-- 
2.7.4

