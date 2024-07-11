Return-Path: <linux-i2c+bounces-4925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E994D92E79E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 935821F21168
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B15E16B396;
	Thu, 11 Jul 2024 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OoxcBqpO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07B16A93F
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698761; cv=none; b=FPzj9eCuZJ6aFkuENbuBH6lVxUarCuZY7f9JH/d878yEjTuE5wz1KlRA49eNkkQqZ3bLTMXyWj52GbDKLWAXklYBOA6sY2xKgXmKGH7SoZNGa7RCCZ+BkBD53ebpSKo5N4q4mggT6FuiTzz52FIK0bHikVqBpvwoYTwzwB1prY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698761; c=relaxed/simple;
	bh=95locSstQZk+WQ96XV1jBWvUwnxbuUngt/qXjiWkMOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s5S6o/5XvIiwGTBm2I4mF3reaXHCXEG6atTJSVfxS9ybpk7WfBs/6TDfbFOC+S5wiT6pJBcOl4vvzfwcjNtW0JT3CZQRSMlxY44szJo9F0jqrMwYlg9Od+uCKzspFQ55s5jnPND7tgDfUrD2KHYQEKXx5PcDGXXi1yNz0jJjSP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OoxcBqpO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367ac08f80fso367644f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698759; x=1721303559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3pGGFACRfgSIVGH5tKVs4BFUSzbWenTGaIvHE0eHnI=;
        b=OoxcBqpO3XAG5tZvVnxya3uppNd7TVdxPkmIoKG6U4z6X9YZOxiEpecckzXtWp+wiC
         1H1mZuGGnOykWRMPDmKU1PbSbMB2u69CwL7wr/HXtIJO3zQ5ntHZCDYZLgbHVOksaqUC
         MgD3LUePkEh9V28OPDIERrCHRalXtPLDA3AWufs3EHxIoI4OLrJ7Cn/QshDSfObgv+9y
         wCf0HdGAGrEHtktxhb19l9qYi6ktRtrY4LfIpwt/3vg5nkFzGjwd73JmgEsT5GbcIn/l
         UShN46xI6/kLbdcEXXTR9axG+aPiQfsfJ3oR/hh3G0AM1UfqDkdf6zPYW4ldSaSbIRPq
         9eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698759; x=1721303559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3pGGFACRfgSIVGH5tKVs4BFUSzbWenTGaIvHE0eHnI=;
        b=bazdh4rRoT4wsdJjlSoeDJa5hT2XB9Y26sXggjxBxECuKswJ5dgq8+VXc73zTIHxRg
         Lmw6lcoHieKA7GUU+zecLb320hcGChthpmqlGt1FKxlMQaliixioF6Vf0e2yxIkJOOFe
         U2EKBF3E2FBG6XpNAXlxsrU9wEekxT7yV3JAEXkbDAdRcUgdfzZXdmdPFeLIOxhj1pwm
         u44LbG3P3fmvp1cnor104lhwGZfaw2ExmYU4M1ZIjm3vpbatnoQI5ipTTr6IoWEJ0+e9
         oAwwODPkmQVl/BgGglj5q/AFqSFJvqAZTQ6vmLhFE1wSHo18MpZ3tEXoaWYeS5CEisbq
         8EXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCvCIQRs6SL5ufShCeQzjOFXppbIZL+TvV0q244pbLr/j8HR+57dT04Lf6R+S+xxUDC+lXrkvVVDw16Ayu2KOtGPggKrlwxnai
X-Gm-Message-State: AOJu0YzBsS71WZ6an6EC3AARdrKSpThwLjIJhdh7O5AnH++n1A+4wgsq
	w0ZiFS+TC1PogH0A4JqGEUWt9JOoVa/4eIWEIcYJlI5eTn4Z08IHcx0VU479KB4=
X-Google-Smtp-Source: AGHT+IEPdVFkMH+rbfa2Od7mb4j3MtN3RJb5+lTw90ysggtVHZ6xUjmLWMzoFfuJ/73Bd+5oZEDmug==
X-Received: by 2002:a05:6000:1814:b0:364:d2b6:4520 with SMTP id ffacd0b85a97d-367ce5df304mr5840712f8f.0.1720698758857;
        Thu, 11 Jul 2024 04:52:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 10/11] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
Date: Thu, 11 Jul 2024 14:52:06 +0300
Message-Id: <20240711115207.2843133-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c0 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index deb2ad37bb2e..7945d44e6ee1 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
 		serial0 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -66,6 +67,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <1000000>;
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
-- 
2.39.2


