Return-Path: <linux-i2c+bounces-1231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31272828672
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 13:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF57AB242BA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 12:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BB939879;
	Tue,  9 Jan 2024 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ed11MbSF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8A38DF7
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cc7d2c1ff0so33310631fa.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 04:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805111; x=1705409911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJvNrIkzSmp0wSI8ZarvYz2vynXeUv1YkW5GIqzXLLc=;
        b=Ed11MbSF3WMztEJgHyPUFYkgRHeODh+ll1y5FYzGGUzC+cTSdmhvtAl6VeNMQ9rQXn
         ofDRa5unO1xREdDZXapbStQrRnlKuJVVg1tf+sgbcj7JMd+S6/uqscEmQvqIvuchNPjN
         BrM7iJS+IkkPuApMIDyrGgwZGjNruQSJ4Sq2W+6kzQs7ggicrCtAgJktygmWhvU+nKYB
         gYyiINo/Ih4q+W9pOY5UsBgfdZ46t2smw0Y4p3y0Ql+ItLZkWYMczKnL7xLbC+poJEsM
         ora2r+EMTwlur/KvfdU3Zkpmc5X4Dl7VS/vo+JMS+acIVUvJGb+2VYTrI16qaqtRxfZ5
         q7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805111; x=1705409911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJvNrIkzSmp0wSI8ZarvYz2vynXeUv1YkW5GIqzXLLc=;
        b=NuoHJHkNtGvjm1zO5BpSoj0GFWTxhsy+MtsRYIYplWuIX9N+9ahVis5O3WnjGNiSTA
         DMr4R+XxGRVStL8GCRHQwOzAN8J72WNrIepWedt/Trlj3nEkvutfFfm3wh8fhQW/bJt9
         gSoZTqVw3Fc6EWLZQu1ow9pafXlv0lFHrlWMlZxxzGpcGeBilxa6+LBt3jCGGe8QAEGg
         5B/95oHR9fuMGsiS2h0dzmcMehPn3YsMJD8rKPTPWbiJSxrzL16Wy8bZEg+3PsZqK8f6
         0DPPQdppFE7Oe0JiItfZjVLJsMbU3tWsyJsqrg+FY6FaS3SKSpkKF93VTHmhHGrXs/5G
         Ijsw==
X-Gm-Message-State: AOJu0YwZCGgizAYdTA4vQFAQZ5eLeo8ZHeZd4ddTLFAYvLOSz+Xsop5E
	hsLDdJKTD5sWGxwSMJZevNJxgUZW8K/SzQ==
X-Google-Smtp-Source: AGHT+IHpZdpyS5p/OVW4NE+HyUz0fLuOKrk8rseoz5EL/oehGEl820Eauo9LyQx303aHZ+hImXnwgg==
X-Received: by 2002:a2e:7018:0:b0:2cd:3141:5d66 with SMTP id l24-20020a2e7018000000b002cd31415d66mr2243382ljc.66.1704805111612;
        Tue, 09 Jan 2024 04:58:31 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:30 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 02/12] dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
Date: Tue,  9 Jan 2024 12:58:04 +0000
Message-ID: <20240109125814.3691033-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add google,gs101-hsi2c dedicated compatible for representing
I2C of Google GS101 SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: collect Peter's tag
v2: collect tags

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index df9c57bca2a8..cc8bba5537b9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -33,6 +33,7 @@ properties:
           - const: samsung,exynos7-hsi2c
       - items:
           - enum:
+              - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
-- 
2.43.0.472.g3155946c3a-goog


