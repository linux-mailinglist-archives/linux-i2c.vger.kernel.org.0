Return-Path: <linux-i2c+bounces-501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8BC7FB4A4
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 09:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326D6281DA8
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 08:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61829199B0;
	Tue, 28 Nov 2023 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SwGzLlVx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1430719A8
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 00:45:22 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cfafe3d46bso28840295ad.0
        for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161121; x=1701765921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=SwGzLlVxYnuU6rAgNgj3DZrhO26TdPHjJsVmCM/NrZV6DUC8GIS7AFsMT86M2+orCe
         sOha5G6nntDkOommdQkSqmgGX9tdr8zhz/5p/xn+mFv+Cr1pHv7mBI/1ddtNYsH9T/fA
         U3piRgAPk5ZbvU3l9vvmiLjvgpH1fM/NSV884=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161121; x=1701765921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=jSSyk5zXDfRAXCIZsS2GTULhMEZUH50X6cNhIKQ8cYKo0Rq506yKEL4Uqm0WPsTXdu
         DlekhMVgZikjPHPDf1J8tXPkhHxgxR3prV6U+nMaM/2/NHkGbEsmXaC9vQuVGXHRDqAi
         G6uI4FT0qgT3rHuPPe76sqMGQaMCuNdwh2hR0SDCNkBFd9yXbYKWvYoLjnQjQ0efrW5a
         57ZOmFLtt2qxBAbjRUJj2Fdwq8JVt3BYp6Y8naA0PzvKt61hlWBiZfkwlDLgAAeJCym/
         SanJNwB6+B9SEUjcn+3TrilzVA4Jdm6NmBHgIAO800R2/gWHVicR0LK2A4hy7OWh77pY
         0heA==
X-Gm-Message-State: AOJu0YxsXEzlLtjD1VNvwhTNOHFjlzUQlwEKfqMu8OmtlEOSgkiGi/+A
	GkILXjSQ98o46gMqI29Ns6Omrw==
X-Google-Smtp-Source: AGHT+IH69IcUw69JVhOmNdkKKnr/r6NBV02lgRCYBJhyyb9MW19+XXMSc7tXlITs3/tx986s7x1SPg==
X-Received: by 2002:a17:902:f54d:b0:1cf:b3d2:5f18 with SMTP id h13-20020a170902f54d00b001cfb3d25f18mr13659883plf.56.1701161121540;
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Tue, 28 Nov 2023 16:42:33 +0800
Message-ID: <20231128084236.157152-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..1d68bc6834e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -15,6 +15,7 @@ touchscreen2: touchscreen@34 {
 		reg = <0x34>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -28,6 +29,7 @@ touchscreen3: touchscreen@20 {
 		hid-descr-addr = <0x0020>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -68,3 +71,11 @@ pins_wp {
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
-- 
2.43.0.rc1.413.gea7ed67945-goog


