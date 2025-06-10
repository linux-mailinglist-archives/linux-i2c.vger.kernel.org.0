Return-Path: <linux-i2c+bounces-11344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9CAD39E3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224971718C9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371812D322A;
	Tue, 10 Jun 2025 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enslh3X/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4E22D79B;
	Tue, 10 Jun 2025 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563184; cv=none; b=HmpAeIyfe9OPMJhm4zvkUceP7lrIc3Hw0hUr14luRpsaylm+S2AwMW8G+ARP5hnH28LY/mc2jApdASh8XA4tZRt1vPcfirQCJ3jIUt0N+r4iw2p6jHEk19MQ9W/TV8JKZQfOQGib5vmaOyyEhTyPwm3slvLLA1Wd0/RoRqLV+e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563184; c=relaxed/simple;
	bh=K2/pnHaMI2yTXkNfn6PYNYe6qBt38rxRGGJx2uQPPho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf2/QFM4MMntf7Xgenr5tWGYc5ma8BezTmwaAW/NZVUVL00Rr0fIKgQk+ryTAXblgY5rlWhtuKmvKvCCgW53LxkqjS6FubwGwu9xT+inOmzwUPYF1imybKyDeVIVbZyBRdaGJykabOERzTJ05A8WEHQXOEwcdz/Chu3pflhKZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enslh3X/; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d094d1fd7cso715892985a.3;
        Tue, 10 Jun 2025 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563181; x=1750167981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=enslh3X/CZN+y1tYKjFLCINqZmGLYv6r7+yCktqm1CEQhsuM88nHVKZpORMfei+w5O
         GPFPUHJeUwzQFiP8n9AGPd1IXWCnV2st1lAQXdZWmMJLqCcZ4CmExucVsCkQuN3L+Y0z
         aT8rc5jv5x/EGBQXEa7MzHdd/cAKSrHJua/J1T6agePClwmlbT6KJRDWoAHCJ1B5FJJ2
         f7/spvmTDbqwj9Ewm/bG71UANEfgTibjPB+c6/NkxxIxrC/KtrvJclCaSmp8lWw/Vx3z
         0KWCUpl/NKoG0VfdTg9sk5LcG7RqO8e9xExeAynSIkW13D9n3f8zZOt2QnP3CGlQK8u2
         9zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563181; x=1750167981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=GSc/hbr4d57U73NRPAznpjnzg2ZKX0qhItzqk6osEFdkSonPAdCGW9FMdu1Qch4yrb
         aqVYThvO71m80bb8bcywlkZfgrgiDLgts8ocwNz6U+W5J9OKpKwZ1q9yWoTOOuOaCCYF
         fbAp39N+xqfhfT/Iw5CTUSKkMSI8KoPreS/sDywjIrMRU1qnUHt3CbMGJo5Gm/9NI4xs
         S1vr7B3TFP76UIw/BVLqN1byGJ1ggKM8OVF2LaskV84FOHGZAo1cAVrrbwSwJBzhUGXh
         3iLn0ej0K/rojdCmg3T/jKl+yvIv5fWDraZcORdvirCUhGibX08+rJ4/SMA86OdfdlNi
         pA+w==
X-Forwarded-Encrypted: i=1; AJvYcCVeELmPC4S+ZSuW+xrLA0Lb/4847LSI5zxCbUwPbjwAPX8aMO/U7leCZC5O3Z6iK1c2yqbHok+TsFnU@vger.kernel.org, AJvYcCWNS/Ir5/tHkAXNALpEoQgjKCDinuikZPI85TdFdGxzUlZI4KKitkNoEeaDXRkGru8QTONqgXs0rwYu@vger.kernel.org, AJvYcCX8D4w4unxiQk4z9l4uGIDtkNlaDkjtlVN1/QEgZ9T/LhheSIBm3UX4ZZ69cTMCz5LX+BTQAVBh+eH6cxbt@vger.kernel.org
X-Gm-Message-State: AOJu0YxfGGx0VfoCI7iacxSSCwBHcrIwO4+XTWNiIInsSwmAmxqp7DrI
	9YC00rYnOYhvwUwY1enadAJcRynOnkvated/Fp/xfgRXWSPac5x/L40D2Tp7Ug==
X-Gm-Gg: ASbGncvrpd6pAxxmMTXjT+3Fx9eODrLhPnf+G6BAq9kiwmnqlHCyzfGtn7uUCE/5BWx
	Upwm4Rolz4leNyzgbGqRzdPpxLw6PgU6F1Xs5VMz/wR8AWcfKnVF1SY+G1oSgOOelwQk/ToQNbT
	CYoCPHs/mbCfqYad/xTO/tkm8yFkLnEmEsu875ksTKbwQZNzQzO3WSv9wT2w2qCwiiO+vOpMvmc
	gSk8GfRMAYH8C8DdEhVWDm9DxLsbtfLB4LhLqxaqfXJoUg2kqQ8C+6I1Y2jylc4cS3LBsDf7wfa
	Og0FIG+g5yPeJxjnTjrb9U7dv6fLl522GdtBOd47mL1KZrxorYukGmPBTsKQOnkH
X-Google-Smtp-Source: AGHT+IEErOXdJp9b1ehODUuVTcmCLwbggBz4Hhy6NCk3Mi2gxJ4D4hn5livuiXenvHI0hDtdlcUZ0w==
X-Received: by 2002:a17:90b:57ce:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-313472c05e1mr24265831a91.1.1749563170277;
        Tue, 10 Jun 2025 06:46:10 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:09 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:24 +0800
Subject: [PATCH v2 5/9] arm64: dts: apple: s800-0-3: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-5-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K2/pnHaMI2yTXkNfn6PYNYe6qBt38rxRGGJx2uQPPho=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcM9irOxkkAottjpevWGk8w0PrnT8fx+059I
 6sxARmdDx2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JJl8D/9urrrpfnMCfp+tl2m2kKQnPNRWCuzdFXYshv0u/LseKybJgkEhi5ql57t+VH7aKl/mSxN
 49cKt8hX7s7BORwKajqFa1N6bf6UAWoRA44WHLFWCDcyBvZwQYQ+nqDF43v7pbI5GGDQH4C/U3E
 3Ik736Z6kIkz4HupXdQtChqH7ps/gFDvxaEfD/eajKjumQRQFIAc2d4oMowHrgTDzZa0TaVpa7W
 dOy18Vq5e2XSL6sq5XCv8h9MvcbZMh0/95GsavBTfL8VLUtqXN4n0A1VgQeMX+/BavsAz1sfM7G
 3Zeoc+0Dn94Qp+4ZvJ4ksExWJt9VzACO94ng+OJgEO5B8K32XfV2jgfTIidr3rTUIfRu64F/WLp
 T4idufeqgDWThTJ3/n31bs5hq2+8iskYGVepB9BfSwmK+gZ8wGAWSmTYD0RR/S+kk08GF6WZ4T1
 xjZVWjTbPrAZ10rzEKx1VJl7r7sGF5AXaxfcbcJhQmBc8YNLw73Y5ruD6avF2o2JYWMZZUaY6Cf
 IEEHG2fXuIsc0FtPXfTMZmKhVB1/i/95qwNvHAatZ5VwKS2e8cGFZNK9o83uR/cehflARb5TUC7
 zeSnT+dNhWlaPXS9KEEVOZHcYNcf8DPAXXJDrMFGmp+MisJwPy5t2/lX3zGVW9crh9bi8k2tFZC
 RL32y+S1Z2yYaPQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A9 SoC.

There is actually an i2c3 on this SoC but the SCL and SDA lines
appears to be not connected and no peripherals are expected to be
connected to it, so there is no node for it.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bb38662b7d2e0b70e18b6870b706789b1cb242af 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -88,6 +88,48 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 206 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 207 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 208 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -131,6 +173,21 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(46, 1)>,
+					 <APPLE_PINMUX(45, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(23, 1)>,
+					 <APPLE_PINMUX(22, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


