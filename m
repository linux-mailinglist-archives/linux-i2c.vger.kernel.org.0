Return-Path: <linux-i2c+bounces-11299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D346AD2195
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BBD316DD3D
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED382139B0;
	Mon,  9 Jun 2025 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpULXfpk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068ED2116F2;
	Mon,  9 Jun 2025 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481128; cv=none; b=NOvQg5RKeSyxiEhrjRdVYW0AkWiSR/M5/ozt0T/62x0k/PLlfIrkMaefH+L0xtvvds7ygAHYy20z17fWvmUJMVmIAN4ckIC7otGTWmTqZOwgguH1bgLTDWiflaU+nzhM9/qPdQnGJlO4BPgTQNcxXKs6o4F524i8bdnsqCn0I+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481128; c=relaxed/simple;
	bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uq377qBXrLGGTdZ0GUaYgas8ypynsi93J4JYdhWUO3rhU+es5RJTihNcXmRFHV/iu5e1obFyUzAaJcDJ5T81Svez+4TiWUpwcb41kUBobLFumhyY7FnJP6+6N/MU07m85+xexBbNBqU/WAIi3OVQIGq6sQHsRcgG2IOiOdkyF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpULXfpk; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b1fde81de05so2250148a12.1;
        Mon, 09 Jun 2025 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481126; x=1750085926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=NpULXfpkG0FhldBgJekD5jc+eVZjHSBbNuwGMDy74znVtLCtRRD5EFYUr5kEN8GDjm
         h78n80znL+H/Y+hPrC21OWkZwKdjYTktCJHVVyaLt0DqVCo+ekitN44m8ls95dkBgvjg
         vAi7FQW5SB/dAjZLeuKoAS8KVNtp5WQvg0xOhZHIDMiw+lYVbsz7t3DDLsB2A8lmnCDd
         VvLg4pwEIY+BZlDLRCDNIagZnflwaYW6xi+NTnt/Rqdx3jXo4+ADB6JDRx90JXkN6TYg
         YdDaNrYbVWeunRkeBiR4v/Foj8Hilmx+JXcXWG8YCcaV6aQWTkTeI8xjajEBkg0JNdcf
         dSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481126; x=1750085926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=Iif9lM/mlFMwesYcAm44Gsr8utgp26Zrjd7K2msXh94iXUnCw4LDhPwzGvdaYao3gV
         UoGG5D/zJqHkFVe5hPwWWqhTyewFFnvQetkPDkDawGUJNbAQR+/xNSp0ckIMM5y0apn5
         UIFkOba5w0uk1B873PSgXhPSaI4Ptup7VSlv6cG56p/wve3l+r1FMwOTev6SGy7RpDlD
         8i14PybBVRZCUb1EdPuaV2YCZ8lj5tJSjqgb0qhhXd0S8Ch7TJkKnLNuGc+Id/PfX5Cv
         BJ7CZeoq5yRA8XJFKlZiRKawcmPzV8317Kv815xLWZyYsMMq4U6hnPV3ev1xKG4fxMmd
         aFCw==
X-Forwarded-Encrypted: i=1; AJvYcCV77gZix839QhiyYhUB3Or0vmKnGb0e2XHoFdiVpUX6tQ0cwjK3uU336Ncd5HaF7DM6rT8DJl2R4DXl@vger.kernel.org, AJvYcCXe0pw3HghIA3NUxtYitShQTseIGR09URSK9MudCfXJgpH43/3jU/0kHQj83jmejjWekjHhlX8j+zeR3heM@vger.kernel.org, AJvYcCXmnXEnD0gNWRGnFxxLeBc+h+DwssRdMLZp1H9J6aM4bDteQyuWAJbltBlbABOHv43cCevtn3seZNdo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HjZwChRzoGZgRrc6pC4wQWBNyu8+zprT7yfGQlF4gwQaZvSr
	jgxEKv5W+TdHLXAFJbm7M+ShikQcCDV8jnWiv8x2UVe/3LNQJFt0bHFWGyiVGw==
X-Gm-Gg: ASbGnctBEtTSquUkJ4eOFCMKo6iIKZPm5cC00YhwqMxE4WgyH9fp24v5d+8P9ca+qHK
	cvi5s4NMvo9l9g4Kpl2T+4aIfKL34/lTQkUQMTq1ejPgmhVbVtbWaJoeLFwMZ/qhU2HuHOIPYC8
	+sX3V4gm3dCTWtp9SUTaYiKnzMqXlxusa4Lsss9ynDTu7eFE3Eax/mMjQ+7IQUbBYuBQK4r3A0O
	lam38b5Uccn47PexRGviYGu4R22C3GSAf6XgHp62T7R5GjsPqlUHvsmgqwQZ9rwZ87TBXb8xKxn
	PKFyXn+xySl0KbzjiXq2H+mVcchpZ8JTrxsdHftj2FnAVONICcPFZA==
X-Google-Smtp-Source: AGHT+IGBZzq1ANHKFw3JS3Ua5Fpq+25+H6RoUvZn8edzoteQNG34BeH1Bc5nGHzvWdQwdG05P8wYyA==
X-Received: by 2002:a05:6a20:430c:b0:216:5fa9:55ad with SMTP id adf61e73a8af0-21ee68a46e0mr17972971637.39.1749481126387;
        Mon, 09 Jun 2025 07:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:24 +0800
Subject: [PATCH 7/8] arm64: dts: apple: t8011: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-7-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNnSFY/hJQsThDJa8Jmnv1srxL12FNpeWqx
 si5CL1YaxmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JPjED/9Ka+qnK4cK9jYUA+rQbtCh02n7I3z0wriS28SZn962M2wJ1QE1N5EVeHJxmae2hQHvYXO
 EAjnBJtgSUbYOG52OfOl0VA1hWKga/D3+FetxW2Hbio8oamzt3x2S/fy8oSbqR4C23yyAoRR/wK
 /vQAIfXD82M3w/6FR6r3uRsvD4Q3LlsWNPOI9d5s7nQnb7J6eUIEeZ5F0nj17pXuW5Rxf0zM5Xj
 ZacebmCSHC6DWTamr/qgy2XsxKRsVYqZxAiLtLcAZaGqrZHKRCDzOxNWVpJD+/eihAU2xgZsMh7
 Uuq6oxwA9BRgNfi+xiC4BJG5TOhr31BSy4KmH5Ur/wbRTimWgx1KMn2+BKoTbykU8QyCZ4LnOBC
 hx+Phbu0vvOJeSYiiK62y+mFlYTrblwl+ixnwAweiU0JNsml2LGujlqp4s9VB3SSSOvytEkL9xo
 oaeWBKfFHRS4D74gMpkNHI0F+Ui6BkPmSdtr9Vwxgb+jWfbNhzAzMl2aBU8Q0gBqAptUqaUGfua
 9poqIUvIC3p13+UFoDpI2+oN2obLuxNDMQj8WRfr6mTu1fKbOe1ePUN9WploUVettQV5oICoMrF
 gBKDZaI0flfy7b73N+sKOFbOfFOwYbjcTUeXVF7V7LGYXFuDLruBtb13XF513aYSqXIsn7WYhvY
 V3aaG9IzYXbGUOQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..039aa4d1e887625e7b6ad789bfd9aa032dc58d01 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -168,6 +168,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 230 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 231 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -204,6 +260,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(211, 1)>,
+					 <APPLE_PINMUX(210, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(156, 1)>,
+					 <APPLE_PINMUX(155, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(58, 1)>,
+					 <APPLE_PINMUX(57, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(158, 1)>,
+					 <APPLE_PINMUX(157, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


