Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64DF2E7432
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Dec 2020 22:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgL2VS5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Dec 2020 16:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgL2VS5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Dec 2020 16:18:57 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16059C06179E;
        Tue, 29 Dec 2020 13:17:46 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id g20so19749638ejb.1;
        Tue, 29 Dec 2020 13:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=npznpISn9+QRxit/cl16gnbLt9tRea1l8xZEzjgOYY0=;
        b=i7kvu+rHq0GvWxEm0YSJ/k1rgx/tfGxB+laE+QNsvEES87mYCiJlKVNYb84z0/WaIi
         yvtAYiKTcVB4TpatBxNalbOxE/c2/6sNaylWi83D1du714Tx5pS8n+MhRG0t9WFnul9V
         9shSQwBpZmSYfApBj7ysCUie7IFZgK0YMPhHMBKq0Il1mIrJ2bvXXWgiVDbr/JoAzius
         gh6I12vyG75zqTxsk9YO7e8BLVcgkdpkGqXLV4ao3vN0ZvO/eL8xnVmunJPfQYBZqYPh
         sTS3TeQSDY9KePUV4xMgWuhaViwIBMcNXzlfsTe9wXVIuwQABUSEM+B3xwp3wwMTdsDC
         awgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=npznpISn9+QRxit/cl16gnbLt9tRea1l8xZEzjgOYY0=;
        b=ILTWF6qBawn4P1Mu6Ludh5eu0KGa7OzufRtAEX8w5V1x29/AJQSgwvjw0OaOsTFKIW
         OG6bvE838W1wJuifoqKgiFyOn3xxbtlaQxeQapOlj+2ORj5fudU0tsbjOgRfTc2ffMiC
         B7/hEzBLoCQIaUuUJFbgF+QSsF3C+hApLyAwCMH7K4nI0EMpzcg8a0fAwuQrkvZQfhQG
         5rDhtE/FkTDrvR2s80vRzgETAw9QueyFpbgB9mlX0ITCkrAKNiLcdfTPQ+oaoaODs1S8
         +myJpZGiTxkNHpavv9TxZC0bWc+zPHkiDx307TCJjOb6g59WN4NHMSz15m2XjZzaC+HA
         dqIw==
X-Gm-Message-State: AOAM533Rv/Z3WvNVKY8ygsVAzyGOt8/fJCjYo9F0lEMF821ZsrVdGnMG
        epYv7dotaTuC76rBG7aZ3c8=
X-Google-Smtp-Source: ABdhPJy4IEu05p4U5lyWAfSl4O3ZG15+95wUxh5BbQzzTbw7HxCgqO2ILUewJuAMFZA3002+yBH/sA==
X-Received: by 2002:a17:906:168f:: with SMTP id s15mr46139482ejd.180.1609276664890;
        Tue, 29 Dec 2020 13:17:44 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id u9sm37354553edd.54.2020.12.29.13.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 13:17:44 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v3 09/13] arm: dts: owl-s500: Add I2C support
Date:   Tue, 29 Dec 2020 23:17:24 +0200
Message-Id: <2813c65915eda155da637bdc649872a75ce240bc.1609263738.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1609263738.git.cristian.ciocaltea@gmail.com>
References: <cover.1609263738.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add I2C controller nodes for Actions Semi S500 SoC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v3:
 - Added Reviewed-by from Mani

 arch/arm/boot/dts/owl-s500.dtsi | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/owl-s500.dtsi b/arch/arm/boot/dts/owl-s500.dtsi
index 7af7c9e1119d..55f8b8c2e149 100644
--- a/arch/arm/boot/dts/owl-s500.dtsi
+++ b/arch/arm/boot/dts/owl-s500.dtsi
@@ -193,6 +193,46 @@ cmu: clock-controller@b0160000 {
 			#reset-cells = <1>;
 		};
 
+		i2c0: i2c@b0170000 {
+			compatible = "actions,s500-i2c";
+			reg = <0xb0170000 0x4000>;
+			clocks = <&cmu CLK_I2C0>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@b0174000 {
+			compatible = "actions,s500-i2c";
+			reg = <0xb0174000 0x4000>;
+			clocks = <&cmu CLK_I2C1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@b0178000 {
+			compatible = "actions,s500-i2c";
+			reg = <0xb0178000 0x4000>;
+			clocks = <&cmu CLK_I2C2>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@b017c000 {
+			compatible = "actions,s500-i2c";
+			reg = <0xb017c000 0x4000>;
+			clocks = <&cmu CLK_I2C3>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer: timer@b0168000 {
 			compatible = "actions,s500-timer";
 			reg = <0xb0168000 0x8000>;
-- 
2.30.0

