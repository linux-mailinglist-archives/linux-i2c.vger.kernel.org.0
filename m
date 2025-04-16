Return-Path: <linux-i2c+bounces-10408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79527A8B3A1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C933B1EA4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC97023817D;
	Wed, 16 Apr 2025 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGD+UWWJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24023816D;
	Wed, 16 Apr 2025 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791749; cv=none; b=TpAP/xmWSAfbe6jwPeVVlDlpmzB3CCneDNcd++ljDcpeKYJwc1wzIvdJYC9SBYhCtdp4U7MK92XrR24NiQIIAUWvRCn+vpDXkogIGd+kTzDnlwIscFjU0lcOqBMBKWp9FYW9e9Cgxa3l8FLsEIZgIXa8NKumPYTpZcUHz7daLuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791749; c=relaxed/simple;
	bh=T9i9uDAOpIqzeQm8w0R/XGIMMG/IUH9cDEWFYQ3QvqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLcZ0qCbg9O3XbCMZQgSyFkn6dYJBblFUKNQs/8PFk4hKT0CRpPRo37yNnK4DfWSlz56luGVE+ebjcsgI7BdvXzAspezR4lAuqGPQK1XwXhkzuSk1VTSxumqM2ZvOCdA8medZZWfRx6IP7EpqBZ2128UUcgQ/7bb+vIxoYhIFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGD+UWWJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so54405641fa.2;
        Wed, 16 Apr 2025 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791746; x=1745396546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y5y3ZmHmiZpETZLXQ8JayHf4F0abUzXVddI3VfW9eY=;
        b=FGD+UWWJhgoKbFJ7+p+NvKbGDcd8LgN78n6cpmpTZ0ujY2qZtgY6axQoEl+m5eLJFC
         KKnLP98+UyzAx3BYgc/qKe+QkfZFG3mZWX/Qo0SFXC9W+LAnG/TWyLZlgd5wnEBn7RHI
         g8/LCd/lITIPrXocE32HDFqp1q/a6fW8H36QiUqt1Dlsx6m+kR+58J+/ptYGgtBSYskK
         nB/QktDiixyLyzFj5ckeqrWP2J6aPWIYLeGtLCdJWcF+sgPGsBSSLqGZk//ucB62Je79
         OlPjBIsf+7CXy95Psm67PJpgsi7Yj7Ej2KVD0+e2ASXK22/1Nbc3Ef81QDa5m/+dV1Bm
         gZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791746; x=1745396546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y5y3ZmHmiZpETZLXQ8JayHf4F0abUzXVddI3VfW9eY=;
        b=mhfHTu0gfdj//MsnPe9dN7ViDHeJAByVhSjlAETBgQLi3zFvBPh98s/6/mw1NpSTdI
         tUx/1dVLg5npZKYgIqo8bh7LbyiwIiNyflML9ItXcW7l3ViC9+FDNhGBuRv8wfeDSeWb
         t1VyFqB1h9ADsY4DWQ8qzHTskYt5OaLcozG54XGmAUO29TwZkvHXhqU9zCRwOI8rE3NJ
         6fSIeL+MePBHvlzTKcwgfr1bIqBvgZpu/o2qPVNxf88Q+Zg+evyjTNydItHEa9jKa+Sq
         KPKD+H3X7y6Cy8J8bg6fCwhcoDbyCfKeiMoUK8kr/AG3U8eQs8vyE49g9OhUxqIi46dQ
         SHdg==
X-Forwarded-Encrypted: i=1; AJvYcCUPVyDFd/UMqUCgf6lrBBY9gNwvRfgKbXVtuXpfbyI7tVtERUzJ5Va4ZHfOv9BS+LRHc4IkhMwD9f6O@vger.kernel.org, AJvYcCUQ68SGvzgLFKrdi4UUadTY0SI50Jwwzlf2fJLdsMyaOYBzgF3bd5nk0MUuVUocGOxmiaUm72WNwfEk@vger.kernel.org, AJvYcCVCJseTMtf3Cr0W+6JV32kWQ+kaPKpH+PYzh/IAGNnL5KJfR/IffRvlk6MJgb+BMwPuMrFEswYY0nJQ@vger.kernel.org, AJvYcCWRjBMUrU9ISLmrTaiMrz65ik5Cutl5GrE6oe0g1VizmakMEl1VQrmBsCz+gEqK+p27/hPeFr0AvOqQ@vger.kernel.org, AJvYcCWj//UQYaDh3nXSxzmzZzYMhLWNQ2qXcmrraYcwfoMnnsyoyPvYo5o1+F4pCdR5GhIZdkJrmBu0@vger.kernel.org, AJvYcCXbPlGFt1bDzDNj244OmMBSKaNsegfSs423wLlmYge1K/ytV6XBN6Zft8/Ig6Fhp3mLA+UPDB7vbWnOw2FY@vger.kernel.org
X-Gm-Message-State: AOJu0YzMM7RvJn8vyc28W3rWtAzQLTQ2yeZfxZbTigwxFoT4J4NfkYOL
	7E5HsuLWshY2gmTFNGKEMZw22Is/bP4PBLuUd3gWDIuZGisHvmiw
X-Gm-Gg: ASbGnctLkoI8MB20QVkYbVCKT9v4JrNOJyXUyskZANndI5MlOxffpBna2k32OvWOoYU
	gCI6jtPWwuPeUXTzP0OUEP2Y02l7CuDBIgzPcCThHOWTCVg6TPYG/e/Tgve9H4yaPHQT06eU7KT
	ONZnYiAw6cUZKOvFbe5PrCxbmq/4f1RcnsgPAwoNDJpzt1w2iJ79mPImbope6ksxCXBGBASwRCr
	twtkybdJDJyaiFibjMQP3E3PworOYOttygH9tQZHj4yJCX4JXU9P/QppMQC/5LwxGa6m6slOolI
	C+vP8cMKJns5jKk/HnMfvowOEZMGG9ATsKuwY2lp6AeEBXYPSJbw
X-Google-Smtp-Source: AGHT+IGHmiw+jcDxFMmYyuWqHF6qUq+/5hAFy3k4yBNyU6kCzD5t65tfejPFzTQNDbufhza2BBNUIQ==
X-Received: by 2002:a05:651c:1506:b0:30c:dbf:51a5 with SMTP id 38308e7fff4ca-3107f73b63dmr2648981fa.35.1744791745426;
        Wed, 16 Apr 2025 01:22:25 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:25 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:33 +0400
Subject: [PATCH 08/13] ARM: dts: vt8500: Add node address and reg in CPU
 nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-8-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2587;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=T9i9uDAOpIqzeQm8w0R/XGIMMG/IUH9cDEWFYQ3QvqI=;
 b=vmBR7nWOqaQvS/UBFzJR8eJ1zXTYzDytcNF2vW+Q+dE3Uz8KEYGI3HsPw55mTEIS4kAJGYzdl
 jhYbpMHCb8lA62v8QnEjoEr3XxaiChrFy57u4hgWPOEqT1aaS/AAcsw
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Adjust CPU nodes according to current guidelines, including address
and reg. Set #address-cells accordingly.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 09f5ed3e6821b72fc440f9de3df0ad484d2c4e17..1138940ce16cb8603d196b6e935d54df53b9a229 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "via,vt8500";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index c81810b967bb349419a5ac7db4e788faec3695fb..fa76df2830c79a695753c85397d4e916592f6a51 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8505";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 555008120a3e315591d2ca49a39d354925d570fd..5b6affda3b6b8d8be9f3100b36cb303d015f19b5 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8650";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 309f6e5129fb817d343cd58a8d90340afd8d6eb9..14e1d4f7c093a8ae9cce5acfeba3755f6df93a24 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8750";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm1176jzf";
+			reg = <0x0>;
 		};
 	};
 

-- 
2.49.0


