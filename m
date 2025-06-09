Return-Path: <linux-i2c+bounces-11296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D3AD2190
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866A4188D6BC
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A210D1A23A5;
	Mon,  9 Jun 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwRvVCvp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CBC1FF5E3;
	Mon,  9 Jun 2025 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481120; cv=none; b=sKxJF+ben4GveJspvxPH967Zuf78EKjejklf6OF0kA1hZP5s2Dn2khEOeU2cvrSYKm0UDoCZT4cpi7/b+a3WaxSgCrLYQmwQUp5HsLQcWZEQOdE3eB/8knTsfNp2yIfzm5t0CNZYXuI7EOBovu09LW6cinVWQgjbaWQ4otVoBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481120; c=relaxed/simple;
	bh=K2/pnHaMI2yTXkNfn6PYNYe6qBt38rxRGGJx2uQPPho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwZRFLhGR6N+KNSUbcu1dMgJaaE6J3xh388SRHf3kEpcrsmhhPTHr0Wze0NVspzJ3Wg6CW3u8QIYIlYsl0Yr39NEISUkUXWDQjCxl8Yng3qnOtqnGucGPIBhnZ05Gdsrg82KooUAb2Z8Xa1j84MUrc+fNLneGmOOi+429UeXbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwRvVCvp; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c27df0daso3860451b3a.1;
        Mon, 09 Jun 2025 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481117; x=1750085917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=hwRvVCvpkl+vRipMXRW+J81vKHywV6uP3owpNlBcmAgab6ufXK1caXZIZhjSzI/i9l
         yY0jK1hn01dAreUofjFZLGwoM9sQfyy+r9CJtwcMoRciFRm/fbxrgrfhMPRTEqfslZJl
         VY3cdkcVp73IGu9drAUHBevFhPjbhc0rU3R5N06mvMbOnSI+7YOG3FZf7SDaFGwTTfXj
         mw79sf8Q+Tw7vq6UXZOWupN+p9LSzLwy4efRIWDX+6HOxId9f0/x1lrSLWtkKRVqcG+W
         VkuL56GqxycfeER25NIRZBJA1O3iw9wkPl+tpX3p/qZcoZueEGkluiOPELuyWLsJnAZ8
         Lh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481117; x=1750085917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=NRmLdxhCdpf1eo9bhuo7KDp82TlXSu6ze51TJ0MLof5L8mNeRFDdhB8fBPrnhcgTyE
         hxmwHASVYn3pXRKzU+Sa7oamwH6VXymT39kjhjpMFJ3lwAMR6SAGaldUZkJVB6miSF3F
         ZJZPI9GsvAWNdxwAYhVH/bEiWcnrrGvQSj3Uy851lf0g52E8nTHbvB72rrtAqUGHnNUQ
         KlFAkFIA6PTf6GBn+jA9+KGeul1tU2CNgP5F1fwuTa0V1RFhWDhwwn74WW57DvUsoALy
         aDMsio7/yfZGHLhlBlhlCkjck31yKTR4QUuTV5F0mNYMiAxOjhRLhDmah1DHOcHFN5uT
         IfrA==
X-Forwarded-Encrypted: i=1; AJvYcCUHEwiMTpaDGIHO7e6nDDrJUvtkua1cujV8LKIOMo7+l143DYNXM9s/qqAF1d5nX3WUQuZM7BX5EjYGBEPc@vger.kernel.org, AJvYcCW3cOm9qob68zTqxK50iio+7ZJzMvHdim5c01AjDjSY8QtVotSAq/QUoX2t1N+w64NgANrfJ8knO/l0@vger.kernel.org, AJvYcCXrYzRLrRGEH1nGILDZ11vyWpZ6/vyg3c8FiUrv7iVZDaSBQlk/0hychTOEPWAcK29gksWpFHBtOpQa@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMlMS8mtafOrMR13GB4Q+8FMyVAJK2Vs9y2PJ1UPYaXAobJ2p
	ZwaHzy9tWsqxnM4nCBN3U5e3LzCIz9zlXlZMhRfvBBkgGabSQ4AVVQho
X-Gm-Gg: ASbGnctvYULjSOm3aZ6PXj92WQEZnC7WJl8LdhYqIn690kPmN3MvqFQxl3DGton5/Af
	ggwgv8ck7j9M4Zb8/6PeuDI1UgYCkPAgdeul8rNRiKL1VYIYZ1fxp+qRqQIp/9k5L+4/XqRJ8gi
	goevTBuxWOMQJVty2+Tqj2nFdlcC9pWZkos8pV92VKztG3JRs/FwXut+ClS0aEip22kwe+8zVMc
	eOieezS8ebjXxOhaQ1UedgFDb1hKMxVhNKSAEUfCu8doH5AzPY9dLY7Qj2BUeaIBm4VST4g29rO
	gKykQy9oUKUTpbezY3YumNhuQIxZn5gdLEe8pBbh3idm4DZIxHTNeKWeypRFBjkqRAE67wRx9MY
	=
X-Google-Smtp-Source: AGHT+IEMNRSQHs1yQKt7YZ59zczYW9rOSQyhZpYpFQ4pBA7eBs6caacxie1e7KiXI8EoIfyMrKJjAA==
X-Received: by 2002:a05:6a21:112:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-21ee26214a3mr17045591637.42.1749481117099;
        Mon, 09 Jun 2025 07:58:37 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:21 +0800
Subject: [PATCH 4/8] arm64: dts: apple: s800-0-3: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-4-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K2/pnHaMI2yTXkNfn6PYNYe6qBt38rxRGGJx2uQPPho=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNFqV+Pzmjq+28SeLjdcgzc7RH7/v0Tzgco
 jfgYVFTAZ+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JFl1D/9yvw9GGd9JOXXUg4ExLhIvdTFDhzGXs1oOsYWqVuciWsgQXn4zqjRbbSB8EnU659Kuawt
 RSu5ikag+qyHC4yavVyyUxkPcpQmxM92db8TikyusnC9jXULnkFNSqo13vzyRbTHfCcx7s9jQJL
 Z72+IShhjfv6j+EGDeZm31qIm9MDkYXvijunX0Nc50rvLgyBZHYcjMp9FT/bxYKTqUOVPBZCEBy
 tsw2e7vqww8UR/lAAqwAbvUgSWAXuI7XdLLbQDMC+XX6Wswvd/ilVB1DA2rgN+Ojhjdjgtds0gj
 flVFsMYXl5pPN0j79+/XUpSfXusXPuuB9R0Ah51owgpFREgRPS5nd3CKg+D4YN16FrncWejn1MI
 aGUjOeS0J4TWXwpkWVjOrt+GeU8vNeTS8eh9TFA+F0QhnOcs5QFXMlpTCJ3I9DS7g2OsTwGh5tM
 Em+mbzW/1IqFoHM4rn4A73VV3jkHjzygLjLU71LYb7ZzQ+3cKjJ8vM7N5jG+E6mHmdWYbeBdDv0
 kW9Q+0usZQYObw/ehlBSn30EPi8PttRPWnGBa8GLbwq+eSe6LjOD8c7NV+QIbTJ4RO7hdQiNUEg
 9JDd97/ba8Kjfj1unQoPDRxvpEy5lHKr6EVQuA9IOu5h4u9lWsKja8Kjb/P1F7ei7Q8vs/uaAsZ
 TTs3Mv+lwAmMtCw==
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


