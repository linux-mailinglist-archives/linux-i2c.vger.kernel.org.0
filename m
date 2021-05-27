Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1232439291A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 09:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbhE0H6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 03:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235250AbhE0H5x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 03:57:53 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A13C06134D
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 00:56:13 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso5015235pjx.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 00:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bs9RElxHAA2/T87AXUzFrLVnBm2Et2bauPM/4axG/FU=;
        b=Kp6DjbrtwxHVMbu9vC89wum0z6Wd6wBAY+P3h9yODiqxzV1CSqEqZkn8AcVfdQAsiP
         +AAJyhqt6gPzl1LJUhiZvmX2Wqymn2hmGghdAdVnjPGXWpZeXRmz8HpHm6wcB/jkOpab
         +AmkG3itwe4pjzT6FoiTYBhKq/U8VWjdgTYjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bs9RElxHAA2/T87AXUzFrLVnBm2Et2bauPM/4axG/FU=;
        b=sKD9BID0fPv5p3qp2SD/aGfmJcRhfESo9YIg+v3ig6nMuNXwS4+Geae8J9zQz/N6TO
         bqugfJGak8ea5b0DFdAzPMmRwzQ6S9kCaYzMkISYPflliSza0sZKLCXwF8SH3QJM9HMT
         1qRg1qpZK/HqZlNemlT5AecrRlY/EgibMa7NbsYz2JcUsLFj9yWet2PdXN5LhlKcDHQn
         9fPSo4dOKX0+jiOkemOgUPWyoxd8JiWU/D5z3n+FncsRU32oegB9HL7WbnB1BTWRbGd6
         mSXaLWf2RZGfdEmWsoK0g/FOVToiUm1oNHjST5nWF5S6pe+CSZCC1nn24RtaEOPtRQUR
         sSSg==
X-Gm-Message-State: AOAM531cf/T6QyEesTslzTO8kSzaNFenQfehSaJtr2UrJ68VfE36NuxE
        xFmzkfnH3Zo8O3rFP3aWK6nHOQ==
X-Google-Smtp-Source: ABdhPJzDc7fsuKMi25L9v4XVlntAVouxCshVJH65zuHU4vn8GVctO7aUJevs+2Tk6+o8akhdHfAIlA==
X-Received: by 2002:a17:90a:fa91:: with SMTP id cu17mr2501646pjb.214.1622102172870;
        Thu, 27 May 2021 00:56:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
        by smtp.gmail.com with ESMTPSA id 69sm1217790pfx.115.2021.05.27.00.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 00:56:12 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>,
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
Subject: [PATCH v21 RESEND 4/4] arm64: dts: mt8183: add supply name for eeprom
Date:   Thu, 27 May 2021 15:55:56 +0800
Message-Id: <20210527075556.1709140-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527075556.1709140-1-hsinyi@chromium.org>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
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
2.31.1.818.g46aad6cb9e-goog

