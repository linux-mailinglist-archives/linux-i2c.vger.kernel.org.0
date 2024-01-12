Return-Path: <linux-i2c+bounces-1277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D2182C3AC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 17:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C1B282F78
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 16:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3DD77F1E;
	Fri, 12 Jan 2024 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s05yJW4L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9A77655
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e5f746ac4so23758795e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 08:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077386; x=1705682186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT3J/E5ihwUzRJFy9hQ6iVDhNFb12f1LhdaU7OTuQXY=;
        b=s05yJW4LVxTTdr1T+ybkziivMzscUXlfoSb/PSt/1uy+0UC2WWnuXaWSZZWMQ8YaKy
         Pgc45rcT5YcwB6w/uTouIyP9BD/ZqsEi1+77/rjT7hiS/9Um3k513ygGI4oKOZ0ro5jN
         Mn+8vuaUK9RSLsdXG8dPyHLD3pIkp2p4GlIZTd4yjTW7Kzydvt6Q2CdVKYSViHupnNV3
         hhe3ri2xRiEXIY7JEQ6/Dck74lP7nZ93HwYhgnyDPkMVXw0lNGb9mQMWnnTuqT6pAKDc
         gqgoRDEuIu+rcvr9nKQCEKhpWhRXDOUgh8wYpcHOl4W4mYXsb38ElX5GZWO06tMFsJ+u
         uyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077386; x=1705682186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT3J/E5ihwUzRJFy9hQ6iVDhNFb12f1LhdaU7OTuQXY=;
        b=pxulW0SorMCSxsnnNXv4EoFS/AtCP8YElUGvqhO+bieouSyUqmEUBtrLv1GzfKI7Tg
         gvmX9H9nein5CktnHXIFl7UCabWRUkaJ2BwZC1PCoKINnUQp2LJoMT/Z+uaeAp+g9bJA
         d8JseclxwDC5GPF4r5twoON7F53d7er+TsQrXPOGk79HxdpA0lolPEShB8pDpEUeul+o
         hi4Jto4QX0bg20sBiOuQ3Ypia6YnuCkPUnp54BsZpp8TF96ff0wAVkyP9LO5gAj5DMeI
         mHyR6UcnsFAogusmc1/qVLdKnkCALZXwWZr8GfO2ye3CCQXTkidBKpA9TFy7Sz4WB6TS
         JHvQ==
X-Gm-Message-State: AOJu0Yz7dD2c1AxfAZaUG91CJ+07F9qKBeCYlGjz45bjX8wH8aXXqMTK
	5lB4WJBOoAp56je9nCqkw7OGVl4K2Y6ZwA==
X-Google-Smtp-Source: AGHT+IFlMaVngyy4fcefe3Rw09Fi3QjRs3VS/a1z2djmGMgnedmibuNznMaNjRrf8VGdpC8UT7hL8w==
X-Received: by 2002:a05:600c:4505:b0:40e:5534:f6fb with SMTP id t5-20020a05600c450500b0040e5534f6fbmr1019053wmo.165.1705077386295;
        Fri, 12 Jan 2024 08:36:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 3/5] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Fri, 12 Jan 2024 17:36:06 +0100
Message-Id: <20240112163608.528453-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


