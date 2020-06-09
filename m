Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCC91F3C5E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 15:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbgFIN1T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 09:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729559AbgFIN1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 09:27:00 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB79C05BD1E;
        Tue,  9 Jun 2020 06:26:59 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 10so4203007pfx.8;
        Tue, 09 Jun 2020 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aYMF8YUhot7LiLw3oFS3/mzi/UrWf4Gg+68yZs/PTjs=;
        b=sgGbqRUkyDWUtzzQdzNZIOrKXN8s30ddQ1jDBSWTsBSz8ST1UW2xY9er013Keh0tkb
         bbVb0EAZmz2FcjOg0tY1AtsIZtW6tCFJhZMb40jRIq7cTqJyhRgeg1/rIt13DaBrDOKd
         0PEEey68luuZLlZB/zCUTuNcmeAm0R/8loPKH+3lOODVmw2CAmdfA/uM2yNnfhQwAe5o
         anOSKZzUJ5moWHDDQ7UxW5LdFo9iz2Q3Ksg90oBDa0q565HCN57RA1oo+Jc6SlZNAnv6
         HMi59cFDI7fajeJCX6zy9/VDju2JIaa5Fzyx+FrW+BGjsRTkk7o8yov5/DHzX+SF2h7m
         ZZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aYMF8YUhot7LiLw3oFS3/mzi/UrWf4Gg+68yZs/PTjs=;
        b=IPKzOmgiPFrcFeKaPSOr27A370mPVCjZN3BM1ogLI6mAqCggC/Ij59xtIJo25sshoG
         +a/NEilmYL3P72y9LnDDZ6RHxtUauV1xdG+Glcn29VI+L6HZsL+ameBenw2MHOsSVvZD
         gEXm8bAh4sTJQy5qmmFMrpMGyy7qXTN+NPun0+UKsgbB7u4pjnavpYI9LINE/aFc0/CS
         LlalN1Qfq69PUgAxzu8AcHi+pKuxeu4XccBRznXmR3J06CLtUGjZsb/SZnTxw4MNGdAa
         geY0s2PQfvX7KPbpzE9dEc5ZWIx7A5vLo3KLuB99wQya3B/7LEB9pt6aI30mZcFrqw8j
         VynA==
X-Gm-Message-State: AOAM533iS03Abjx4vANUQQJw7rP3XqDPu+DA4vseTrWZDd6mbfZ6yI5o
        ACAh/s9b/5RvHYTPdc1faJEMRQh2eaw=
X-Google-Smtp-Source: ABdhPJw7afLAjpJsItQsnX3qt0rEIAvvOvZk+nKKPPFz9OcVyn+axZGQ/zVVsYCjoQRpV5oByTFdOg==
X-Received: by 2002:a65:46cc:: with SMTP id n12mr24887487pgr.80.1591709219129;
        Tue, 09 Jun 2020 06:26:59 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
        by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:26:58 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        pierre-yves.mordret@st.com, philippe.schenker@toradex.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 3/4] ARM: dts: stm32: enable stmpe811 on stm32429-disco board
Date:   Tue,  9 Jun 2020 21:26:42 +0800
Message-Id: <1591709203-12106-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Enable the stmpe811 touch screen on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f6717871..fad1ec10efb6 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -49,6 +49,8 @@
 #include "stm32f429.dtsi"
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -127,3 +129,48 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	stmpe811@41 {
+		compatible = "st,stmpe811";
+		reg = <0x41>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpioa>;
+		/* 3.25 MHz ADC clock speed */
+		st,adc-freq = <1>;
+		/* 12-bit ADC */
+		st,mod-12b = <1>;
+		/* internal ADC reference */
+		st,ref-sel = <0>;
+		/* ADC converstion time: 80 clocks */
+		st,sample-time = <4>;
+
+		stmpe_touchscreen {
+			compatible = "st,stmpe-ts";
+			/* 8 sample average control */
+			st,ave-ctrl = <3>;
+			/* 7 length fractional part in z */
+			st,fraction-z = <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive = <1>;
+			/* 1 ms panel driver settling time */
+			st,settling = <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay = <5>;
+		};
+
+		stmpe_adc {
+			compatible = "st,stmpe-adc";
+			/* forbid to use ADC channels 3-0 (touch) */
+			st,norequest-mask = <0x0F>;
+		};
+	};
+};
-- 
2.7.4

