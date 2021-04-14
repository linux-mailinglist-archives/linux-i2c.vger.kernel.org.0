Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA1235EFF7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350236AbhDNIkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350241AbhDNIje (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:39:34 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50159C061350
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:28 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c17so13259203pfn.6
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SDiflsGvBCYCoVMBt0Fyo3zuZR1BmIQO6zXHXOu40Mw=;
        b=dHicorp99OgGYzZtDEhGPP14NXcmgNSFB7Mn9d/JE9VuRhG3WEeyTRH+9WHAtBXtIt
         2b8tEJzbaOIhB31U0t5l4R12SrNzFBqxeFqFhyKAqht1YEWLa2c1o8vLDyx0spo9LUvd
         Z4tI/rFuOgd5MX9mGBPO87LQS1vO3o5PcodAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SDiflsGvBCYCoVMBt0Fyo3zuZR1BmIQO6zXHXOu40Mw=;
        b=PN6DZ6Z6jwj9IJ3IKLjMrCqBRxMIr/cqAQL1EwfU2MEbv1rrWJZcBwWDs6W3dqFnbS
         OXxeiSkTZju7ndLIXzjoSgEeu2s9DO9fcOAhmxwQ3wUMPWVaPqFYQydJSE1dZ6C/nLT6
         CSgvILs6HWOVfUC+9eprxrqtkvGd1Mj092Wy9pz094p2l9OOttCkaEDmIqChBO5G8rXR
         oVKBs2PQZbUodsSg3c91wBYq5nLez3AgUVgDZlGVIQP2GFo99jyhOGg4vL6p9IWnbi9o
         ziyOEBACHf1SLHR8bO0y+FHq58z75AdFG5u9zK1XJVOtnCl4fikVDJqYDujN+kb1Iofc
         1+/Q==
X-Gm-Message-State: AOAM533u4j29Bfz50N9lKlMNcxo5Tom6MC6bQcJu6+8NTbx0fgEFlWOt
        tCJfNxsZjNjTMaJzEVrD4GpqEg==
X-Google-Smtp-Source: ABdhPJw8DhWVrzjIH8JTyLWzkCwTPDmhi+RWo2XG234hq40sGn8kYoUJy/Ov654V+I50pVRpW/d88A==
X-Received: by 2002:a63:5b26:: with SMTP id p38mr3620664pgb.141.1618389507824;
        Wed, 14 Apr 2021 01:38:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:38:27 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v18 5/5] arm64: dts: mt8183: add supply name for eeprom
Date:   Wed, 14 Apr 2021 16:38:09 +0800
Message-Id: <20210414083809.1932133-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add supplies for eeprom for mt8183 boards.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index b442e38a3156..28966a65391b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -88,11 +88,13 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcamio_reg>;
 
 	eeprom@58 {
 		compatible = "atmel,24c32";
 		reg = <0x58>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcama2_reg>;
 	};
 };
 
@@ -101,11 +103,13 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcn18_reg>;
 
 	eeprom@54 {
 		compatible = "atmel,24c32";
 		reg = <0x54>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcn18_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 2f5234a16ead..3aa79403c0c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -62,11 +62,13 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcamio_reg>;
 
 	eeprom@58 {
 		compatible = "atmel,24c64";
 		reg = <0x58>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcamio_reg>;
 	};
 };
 
@@ -75,11 +77,13 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcn18_reg>;
 
 	eeprom@54 {
 		compatible = "atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcn18_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index fbc471ccf805..30c183c96a54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -71,11 +71,13 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcamio_reg>;
 
 	eeprom@58 {
 		compatible = "atmel,24c32";
 		reg = <0x58>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcama2_reg>;
 	};
 };
 
@@ -84,11 +86,13 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcn18_reg>;
 
 	eeprom@54 {
 		compatible = "atmel,24c32";
 		reg = <0x54>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcn18_reg>;
 	};
 };
 
-- 
2.31.1.295.g9ea45b61b8-goog

