Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A542B9EDA
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Nov 2020 00:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgKSX4f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Nov 2020 18:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgKSX4e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Nov 2020 18:56:34 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B885C0613CF;
        Thu, 19 Nov 2020 15:56:34 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id o21so10413117ejb.3;
        Thu, 19 Nov 2020 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sj++PSDD1oLF90eK36g1/9vIzuW7FnNR6keIC7+p2sg=;
        b=A4msB7sz3aJrPlbu6qj3Wa2Dzb+cpVX97w5uTGOwtLiiwgPZrqPnTmJxo3pvaSMmyk
         9TSOBpWrFofq6IGEbc622cZlpzoumAjd9/s42kIeQBwtOIF8vEorcktaxRyiL6lxF8WB
         zZQnWBAkTrdoqPl7jIosD2G1tsns/BggirTiuu4gx5iOP4Kntu5qHXCaYUcIgWl+Aizq
         wrQyy+1KRAkLdahPK/MUlJcKQ9iMDqt33mZzeI941BOjNehazXqXGHcHCAUjEsdjLX9L
         J5Lqynrz/OBKYY9VyTKWp6QcnLkgstQef3uapcwIVrQwHVhIdfaj8f0Fo2m+HWUbJUO7
         umJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sj++PSDD1oLF90eK36g1/9vIzuW7FnNR6keIC7+p2sg=;
        b=HY3Ub3sApUuRdG/FawPxvozYJv9m8G/+Ea7IwbmS2XoWziRD9fFWT0RYwyPHtX2OkE
         8+zuxvDuuhvs03HDfQvpyozuMmARY/3nl1aptuOEv15sZrOt2O/F09VfQPZZl2d4tXmW
         M3WMkIOZ31PbVDf2gvzYP7zHw684N/BSH5aj1qcOD/uiQJ2GPL/vbU95eXSXmN6raVPB
         GIJgClmhINvCQcJTK9DnAd3huoTajcYP5K3SRaHs+Fne4liz61Lc5pQxHeXJfolt4fOH
         pG/os5QWUf1IdVMZoNMM9MQoSjZ6ginvd9VeQM88xDpjrN1PRUNDsryamjWKuqnx9hCT
         Tq6Q==
X-Gm-Message-State: AOAM533Y+Hz1sm3TVlB0IVf+PxxZ/3Z5jdK2/QiMZDaDKakprs2prX6n
        l2hOgLqQKlFtvPIyrKebAvA=
X-Google-Smtp-Source: ABdhPJxy9ZEQlfi8Qbn7YloqQ+3dJ3BLgOn4YUxh+9grdKTytp+YvAGFztACqK77oVPpmATs8zNjbg==
X-Received: by 2002:a17:907:10d9:: with SMTP id rv25mr31260806ejb.437.1605830193015;
        Thu, 19 Nov 2020 15:56:33 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i3sm452987ejh.80.2020.11.19.15.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:56:32 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 13/18] arm: dts: owl-s500: Add I2C support
Date:   Fri, 20 Nov 2020 01:56:07 +0200
Message-Id: <99e81f582b19d0e13abf506c1d7dda0f0a857fd5.1605823502.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add I2C controller nodes for Actions Semi S500 SoC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
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
2.29.2

