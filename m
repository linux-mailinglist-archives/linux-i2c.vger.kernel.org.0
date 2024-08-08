Return-Path: <linux-i2c+bounces-5215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01094BA5F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 12:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17F2B22D38
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 10:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BB618C337;
	Thu,  8 Aug 2024 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KDge5HAU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679118B498
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111207; cv=none; b=DaT6ChsXMCZy+3AltCgdFiJ0EXyBVlzm7hRu+gFSUObLlcg+hLgAwXhcwevuR6k/oSfsyOSevhg+BVgkDvB1OiF5OZQXR2LNAA0Jq5yRViD37UtNiksPbjKmokujalY874ddaFJd+slX2y728uUinbgpADbbvxPWHSJYH+hsK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111207; c=relaxed/simple;
	bh=y4je3VWsBqj5qjHQT037MyYHsD/meXwgpUrJ0PrYeP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GR4aL6ryy353aC2uvekKGHsrduwMpruVALfSZHVd9R62lwXBw8G2ssIiJYmor9fUsWqasbQEJlTMkOUE3581D1JUPECOxVcUxEDOlpLXT/NpalwqF2lU0BliVUs1whrtxZSxwI1dPvZGUkeVbtCvLxB62wBVmp10EMyLfU/PlUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KDge5HAU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fd66cddd07so6795565ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2024 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111205; x=1723716005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=;
        b=KDge5HAULCxwG1dAkD5PR47SQ3x9WxzP+e2kF3BHRZJRhI/frnnVoafDpZy0Iu/59w
         ngscPETIf0D/AFoOVUz3HBVDx0bnEIT6w+DRkucTiDiq6QCxMtoSQydkuRRyhWs7Z35B
         /y9SBvOvj33GyEREu3RDnitwWTo30tMqErr6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111205; x=1723716005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=;
        b=rVTu8a9TtKg1JzQkqIsjdbNB744tli3JHeBwqTeT95Ebs+AR2NKov+EjsqUKnz0T1K
         CyxUd/+x5oYRCVlZY1ZgrGgCupqwxQ/emois2C3cxijaCAjSoR/C5vSfwCfzq2GdEB6A
         XOjUBArdAzbMUnLMMO3+ZQjM23jwxPQNO8WDmbbP8de5pb3RVVr/uuBPeGCs7ntNcSav
         tbFAhofyDZvUeWBoOcwIWZ+EohoSaM3KFBpKMMCfS+G9lhVgfVMspEdkq+Dj2fid+frj
         TUzt3H0r0Tvmpz66vadwniLwsQ5+0kLxT+QrS0oNIBRC5ZHRwcQIbS8MKI5MAIquhIuD
         I30A==
X-Forwarded-Encrypted: i=1; AJvYcCV2YdZFgKLgxB/tx6RA6Yv4adWeo11Mg+nh+fPdoBFABA/NPw9c57ym333WNUradmdwW1oBM6CzKXCCG2eKHIf39FFxXIRO+FWm
X-Gm-Message-State: AOJu0YzWqv880vZ6EpVgcktd7K0F3oMG+ME1icMcvk7tJa2Jkl38Fsq5
	RMiQAGD1M62Oz9yZGNa5dKnMwmD62+1knIuSjTp/28sNmGs+DnjcBR9hzB57uQ==
X-Google-Smtp-Source: AGHT+IFHYCH6ZPttGWJyX5orsjVgIQjNRW8T6hIcAdANhk3iA3ouOxz6UxT/mqu55va9bKkOzlc4Ag==
X-Received: by 2002:a17:902:ce81:b0:1fd:7724:c783 with SMTP id d9443c01a7336-200952654a3mr16237775ad.36.1723111205352;
        Thu, 08 Aug 2024 03:00:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.03.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:00:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu,  8 Aug 2024 17:59:29 +0800
Message-ID: <20240808095931.2649657-7-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 8d1cbc92bce3..251e084bf7de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -14,6 +14,7 @@ touchscreen2: touchscreen@34 {
 		compatible = "melfas,mip4_ts";
 		reg = <0x34>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -26,6 +27,7 @@ touchscreen3: touchscreen@20 {
 		reg = <0x20>;
 		hid-descr-addr = <0x0020>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/* Lenovo Ideapad C330 uses G2Touch touchscreen as a 2nd source touchscreen */
@@ -47,9 +49,12 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -74,3 +79,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b4d85147b77b..eee64461421f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -358,12 +358,12 @@ touchscreen: touchscreen@10 {
 &i2c4 {
 	clock-frequency = <400000>;
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&trackpad_irq>;
 
 	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x15>;
 		vcc-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


