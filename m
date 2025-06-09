Return-Path: <linux-i2c+bounces-11300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD568AD2203
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB14516C276
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 15:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBB6217648;
	Mon,  9 Jun 2025 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8ZmAiB7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA316215F53;
	Mon,  9 Jun 2025 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481131; cv=none; b=bseVEc9mtc00BdFgZmBxB/+/0TxPUf5ZWq3KQ7i+u+7A7faXEdQ2CWaly8AafnJiXYwaGHg9Bl0YgOclCSfRZKBfvQFpfxm7HVeVHXjidKUO5K1h5vJdMqzlaRkW1DQOEvYxB8V5+HXEILCyFGgM/rxuagEl67ngR8W4CIbRAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481131; c=relaxed/simple;
	bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+oNDsrIOlB6hZ73buWCggs9OrDFr5oAAUzlrGf1HKIvfixxQrnHzc09xQrqyjZ4Fq9LWQJuF1eexIzxWlU0JqZqGFU6OxqBmyoAtLw6vwqMPil9Pw7aZz++KUWmQPQ2PE8qJgT/8ENsSTanlcV+AMN66NzVDLXJscJ2lejPPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8ZmAiB7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7426c44e014so3705924b3a.3;
        Mon, 09 Jun 2025 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481129; x=1750085929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=S8ZmAiB7HhihkaSWLlE0RQfAJVQVFHro1SlKPAuJIRV72AZ6/y8CFg543GIPY5CGcp
         7KYOVpUiMdtzB0EebpDFvoNflInkrbzR4fHxbqsTwB5UuPhjnMhsz59h+KOs6xwCMT18
         /JHGTPrWAnVNvERS9d3jkPOO+0nQKrEKaEK8MynuJOJ9bjR3yshIra39eIq4jycVSPqE
         rqBtoZhXIg+5ce/kalHyS+sXbQex/bKd0dW7PQdE9DWw2wI9aau82tUcQeU3U9ffMYT5
         bsX5mgG9dThNvCbh/SHVoGThjNBehAdgAfL889Ou7/cplqOHzFq62eABmveQuZfrYjjY
         AWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481129; x=1750085929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=PIho97y80HWSN5aE+D0YBjncskUScmsAUAy9wqf0h3F7sNbqZbQU3TQNMNn6gWfsCr
         lPgS4ozdxDr17CIszpbSP4xuk/ATOiXL3REnt/dyQuhvmnS+YoTEhzTF4JZ1+PB54P0w
         rmJ0nkab3nQk0H+uc4Jpq5kB+wO6MkttcfLGlR5YW9H+4OZ1nzbzOxv3itKwl0Myxppb
         osUUqd9oM7ltWoKB6A/mZ4SIbNE5Bc99BvENTkP7RYubmdm/2xEa83uy4eX5pN5bLR+7
         VpevftnrjEaaZEoNEeQzVhTSlEywsZJZechHPWM87qrPi7h32SrIdN7vyQWgX5FUnUky
         kHpg==
X-Forwarded-Encrypted: i=1; AJvYcCV949go9YfgeU5yYxkDJF2Y6+AbilRuevekYsmsF2Jif4eXkom0ILgYARX3o0ri6ej0dF/M9Hd1OB58@vger.kernel.org, AJvYcCW3/blDs1JPLzMqREG5tjb/mzUov+Dl2waZszvh4o67VWdhOL93mGR1zzKUCF7ZQ5/8L6wJxhS2RqO3@vger.kernel.org, AJvYcCXTOKUsYddeNSuCfajlEgmLA+hYKF3t2hia8h/c81AcYMFC+rJwe9ROU9cb1P/PEp4sgioy0ji1w7qGARxv@vger.kernel.org
X-Gm-Message-State: AOJu0Yydxt7zpf9wTsmVZJXU4mrjCW75zwDEQpk2UBHllyAJ5ScbEv6Z
	8QBreMz12R0NSTnThR7HSRpng1TdrgbNswg1qtFTmGjCCK20MCOAEsoz
X-Gm-Gg: ASbGnctPrT0eWGdN45Kx8YIyin/wAZplPeQ0jE1k/AjLFODCkJAxgwyQj5X3Mv1+mhq
	NBVbc9/Qest6Y8cvyX1Y5kQG0JRYtWAoTxmYxKv0NIc3jTbLO3ozS65hyW3kujkhl2Tz6UlTgJz
	PujMljYH0Cvj5SJqQxQiQ+IHTKiJbynz3V5Cymnf2UxzULvZ38Uztx85KcAsutVtulVftwBsDs6
	4TNeKXriEWUlaKllmVZOQx5MVYJ8bByvVcrwTFtURoG7PQtFhA4fWP7HTULZ2yP+wsEAowWP3CU
	8hSyxwMq9BaI7EThvpIZemR/FweCFPkgIEdkTZUnXdgTuv+JZMOhJTTuOh+UPN4l
X-Google-Smtp-Source: AGHT+IEwCZJue9fwcjQonzqN1xhP8vKvIQlVQWXej/FdfQzVhn5ZWjVS9YMp6WNHGbn4p1YNlDhZfA==
X-Received: by 2002:a05:6a20:a108:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-21ee25ed279mr16540950637.23.1749481129278;
        Mon, 09 Jun 2025 07:58:49 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:25 +0800
Subject: [PATCH 8/8] arm64: dts: apple: t8015: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-8-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaO8SGlIc2XSE9/A37sHSQIj212EpJz4zTMi
 VwBw/QSObSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jgAKCRABygi3psUI
 JHD6D/9dYZa9dMbZdgIf9ev4sHn254ePe0v0emWfbCY+2jG4gIQOekixwqsIptjddnqFB8nsOwb
 8i2Bk5DS+DV1n32sdO1+XyCbMTVj4JrLxuyl/kvIE+vE5C7mtREuojjDEIZnkF+TGuxXn3dOpxr
 0Pt8RozEg8JwhkE/p9ZOH9zkqf6U1LmXEUPclnHMBr4F0cGXcWp7DTEk2Mx+Ne8P7QHMZyMraun
 ch+itHCrFsKNIifBY563o+z+Bi300HbeeEp32plusfU1ITJYIqzTvQWHn1gpG3AJ/u0F3ZUUZPp
 6DwMjUDrE+DfN8H4Dih6VD6sPuUYj2XEbLvtjQdhIKz93+mFDl8V1yziDlSgY/z39kYyTq3NhQ9
 LfJQ/99OH0s8dHzNGURS9yLjiYx4u/6VKjCIs9ZNhkywekDRi53f6EOD5pBQ4eWyyN+tempF+Lk
 hrev0lB9UICGBbA6sDiLLEDiQe3Qp/X1r4wRk1VrXVAnZkn+6k1pmox4aoSvHR8M/yhdIIUViAt
 L1u2ZQf8D7x9DbXjM0uideOf5mpvS29ES2nrYHJZQ2FiDgbWHfGnkUzVqs789stBdhUZUhjhkUW
 KQMh5BTyf1SD3L5DCvuAu3T8eudi3GARzVKqfdk9xJtaDTpSgKwl7jWdwEXh9D/I9WtMEMyJPsp
 yZ3mXkRSBcRlxmQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..e002ecee339013194537910db2168c143ab3d00a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -265,6 +265,62 @@ cpufreq_p: performance-controller@208ea0000 {
 			#performance-domain-cells = <0>;
 		};
 
+		i2c0: i2c@22e200000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e200000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@22e204000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e204000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@22e208000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e208000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@22e20c000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e20c000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
@@ -321,6 +377,26 @@ pinctrl_ap: pinctrl@233100000 {
 				     <AIC_IRQ 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 55 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 56 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(73, 1)>,
+					 <APPLE_PINMUX(72, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(182, 1)>,
+					 <APPLE_PINMUX(181, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(4, 1)>,
+					 <APPLE_PINMUX(3, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(184, 1)>,
+					 <APPLE_PINMUX(183, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2340f0000 {

-- 
2.49.0


