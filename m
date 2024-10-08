Return-Path: <linux-i2c+bounces-7258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 085119940F7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B83A1C22763
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83DA1E2827;
	Tue,  8 Oct 2024 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z9Z4xhQW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0301E1C00
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372924; cv=none; b=C//9mjinVzdboT7oS0F6YfMht/TqwfOYi0FuovRjfjHO1SKQtPUFzO+2q52G74XnG2R02/YhgvCz2EHrTOVqNasA6OBAw6iKL3zpv5zyGo6sOjNIBiYJcb3+MWtlkDbi6uTEX6pwWIobmjBwUI0sXVAAhaofm5WM0/KqTSXuHLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372924; c=relaxed/simple;
	bh=cVmOyMXGnPPzjgU3iinMYCiYxlFYYA33qLECMWfqZmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPrQsYlFF0zAVvYllWkmzmTPZto7WHDOjDZagBFml91Py7487Q25BJ9jEyC0Uh7PVWiiQGpqJ/0qNFzFKeMxCauVWjk8x5cTjlpg0WnevvHUeV0xFOV7se7pLhhQEsI2EnugYIPEHMWpvRxkOAOnbAWlP7BVppgKZZ0IBQ9GAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z9Z4xhQW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c58e5e800so2037925ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2024 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372922; x=1728977722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRqF7tYub+2EkqSuZ1uTkrLo9OIWymzvByM/M/beQ30=;
        b=Z9Z4xhQWdAMeut/N+UJUIA2mTuJluM5U2lkZeFVXX+YXlA6Khh483PceEJimrCK7r2
         tlndF/lZH6YhP1n/mVXKAa6wbRY5tzacQxvHP3EgfZtJmgkxY4jy9zBpoPFTBxNegVbD
         aBmhaQHr4g4A2z86OBSYi5Q69yAQ+zqJACBSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372922; x=1728977722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRqF7tYub+2EkqSuZ1uTkrLo9OIWymzvByM/M/beQ30=;
        b=Bdbunz4SJNSkDBy7hsxJ6DRLZ595K6TFt2zqTjapg2+zTsfaNls9Qg94bRFMzvxUU1
         1D8weFf+HagBeOT69DXM06tExSWj2ZyRw80YVyJjbYkoLstIOEfWf99813hDx+0HpYFi
         MjHCmzWurV4eNEmYI48DupHiC64p/0O4LL2e8L6a7+EAHdetY7nB5dk1ZrzvHMHkZTZ+
         QClZ9J3J382KWUqHFrvD4i8qierp/wt586qz0j8eLAu0cIlkdLOTVWpbSOUsy9d5tDOk
         XWhOLqO2wx4tH/Te7ATxeBzqz+eYNSG2CVx4sieMyS80mIXvfKIv324tmcL4ENTyl2Lj
         6Luw==
X-Forwarded-Encrypted: i=1; AJvYcCX6y/59Z1a6gf3DppXFDSxSMjUnhgvEKPenRHmf/DUFhbv8hR85fHF/9tf1bY4PVu5O8dO+QYffKQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvzoQv3nnoZhkiwwHiWJJg6s5a0X3YfOxUBfCphyrsHczS2DE
	WG5WYVt38o5ApErFav1Y55SLp8O2CW+/pGP9HMHJAzg3EUmxTA7pYUOLEyXPhg==
X-Google-Smtp-Source: AGHT+IHVIYoz0MFK/EPGojfbt2w6EOCEpm1zuic+gaAdvtoC926/wd5CQChYfjNS8A7rV1WBkdyXug==
X-Received: by 2002:a17:902:e805:b0:20b:59ae:fe1d with SMTP id d9443c01a7336-20c4e361752mr38076715ad.25.1728372922579;
        Tue, 08 Oct 2024 00:35:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:35:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
Subject: [PATCH v8 8/8] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Tue,  8 Oct 2024 15:34:27 +0800
Message-ID: <20241008073430.3992087-9-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008073430.3992087-1-wenst@chromium.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
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
Changes since v7:
- Mark touchscreen@40 as "fail-needs-probe" as well

Changes since v6:
none

Changes since v5:
none

Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index e03474702cad..d9abd68da369 100644
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
@@ -35,6 +37,7 @@ touchscreen@40 {
 		hid-descr-addr = <0x0001>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -47,6 +50,8 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		/*
@@ -56,6 +61,7 @@ trackpad2: trackpad@2c {
 		/* post-power-on-delay-ms = <100>; */
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -80,3 +86,11 @@ pins_wp {
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
2.47.0.rc0.187.ge670bccf7e-goog


