Return-Path: <linux-i2c+bounces-6097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B0996AE45
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4444286A43
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5A354645;
	Wed,  4 Sep 2024 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdlPgh+3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F4B44374;
	Wed,  4 Sep 2024 02:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415500; cv=none; b=JuFb+uIxV4p77VsUSQO9VISrkTqBOB8uYxHLlVMMTpcmCVihqMd/n51g4dM6/IfaswUPQXMbeQVQdFW/CRtgTucl4geG5oujOF2qVXKfIyq0oE94g8D5ELWENcmTYcwywvESXHl1hOxEdyqGK3HUPZT+T7jFnJyAr9e3+NpdVdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415500; c=relaxed/simple;
	bh=80F2LjQUmJJWKZ21PkiJFWSKa9VSL6kZwTcqgz0h7QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKcm+TwclCAvjvXmbRaw3Rk70G3EjKbZ9RNAy1NsgVkJpRFETuxIJu44QsVzeH3Idq2bVGhwJJjUF9rCNhncf6lop0/r+eeS22v1PatAn4Ucs4mX3P2rboccJYLiSerpxJV6jQ+Ig1kUSmxtY0nRC2l73zEG/O1xBFcssiNAhq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdlPgh+3; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-498d7c77e91so2006559137.0;
        Tue, 03 Sep 2024 19:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415498; x=1726020298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbg9GpYaaGVz68lQk4MTu+zQF7Py/vg+LZiU0gYawY8=;
        b=BdlPgh+3fx7lmK+TbT72Pu+g7vv4ZUw8TG4aQz+wTiwsTBB6CKHwXOvrBKsAnqCjf/
         NC9T4PYUBM6ukOqxQwnGIllpSDQiqzBSianPbkHg26YRKb3i7WSJ/oXOcfRTmjNog018
         VaNMMxY/i7++2HKHGk0qvRvYxWov4yPYEIevrYpNo70UERE6a6mtXmDEcDApGsgBNBGz
         KCR+WsbcdY+umboa8wDk+r/bFep5+XzQB3HdpqsoXKe9l+BfIarqXnhR6mxYzrx//2wZ
         D3x+tYaJhelbF1WA4i6gHs7tMmcedbsZdVsWnHjF/f/w65++YkS5MgMrF6+JVGGNOF2J
         qGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415498; x=1726020298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbg9GpYaaGVz68lQk4MTu+zQF7Py/vg+LZiU0gYawY8=;
        b=dKTiWq3ifUsjMxQ8TX3iVpYsVCuVpNzUxaV64KolgqGY9Vq2fHlAL7L15xlJkXS8Mt
         Z6K/mvNfKTM+E3QyrI6cLNjfyt2nac5SqrufiZjH+NYQTY0rczeOrf/dGBqogRuRYBxG
         Ryd8GUOXtFKQswG0np7d5nkaT2oyQiff+lWaWMBco1kQ0HficLMRTovBUGfaz+WCBy57
         YQShLUKL86l+IsYok5UJesZed1zgFkgaKAJtBj491hrZ++X13jxZFdJC5b9615E8gTh1
         /RVYK4XT8ez9/cju9XvItzNNIghCAm1RYyLy7TWz6kvzRXxzVgKgRwyLDvUuMXcttHfi
         S0yw==
X-Forwarded-Encrypted: i=1; AJvYcCU03pzpyPBtHwplaPIlEFlPMkj89OUBLzwQAOfdrDuP6XRxep9bgoaMsKIuBmICDy3WKt92Ncc2uozaohFrhA==@vger.kernel.org, AJvYcCVh1GyPPrzVczhumwXjofUB7LjGK6G7t6AfzccdGOyei5+zbd/ZkZLn8ndzZFFeHVWik4To2Onq/LpFrzE=@vger.kernel.org, AJvYcCVlYt3gBnGcb+re8TX7iru+Rv9UY23Wa7+LfH9sJjVXU9palSzb/sbuUH58VTQSjBTO/uvISPoRL9IV@vger.kernel.org, AJvYcCVt+k5VwtXj1kKKTxgz/DzNzG/GumHa7NX2hWXZQuwoLoIlxhSFMdy33vyj1EMzokdCsjSfrI+D45s1@vger.kernel.org, AJvYcCXGwbbZAkC469lX7y0fet47UKkd91NEVNItyfQS0WhmHj9dyqPzbKhge59/XC/1JR0MEFqjD68LMIvC@vger.kernel.org
X-Gm-Message-State: AOJu0YwusOVP472vKms2hcBcqrc23AmtvdtzQWejXXfaP8smYD0m1J4c
	os6UGMQB3pLC72X/wMsgHROps0U6YdIMcV9rJpGY9mZ15kWc9mZI
X-Google-Smtp-Source: AGHT+IEv+N14ikL5WeAvbB/4lNDQ0RmekQgY8A2x3JQw+E7HX4AZfuIR+iBBt6XCV5kf/w5E4kO8iQ==
X-Received: by 2002:a05:6102:3ec3:b0:492:a11f:a878 with SMTP id ada2fe7eead31-49ba8a8b6a3mr6804808137.23.1725415498005;
        Tue, 03 Sep 2024 19:04:58 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d61c77sm582969985a.109.2024.09.03.19.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:04:57 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/7] dt-bindings: i2c: qcom-cci: Document SDM670 compatible
Date: Tue,  3 Sep 2024 22:04:51 -0400
Message-ID: <20240904020448.52035-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
References: <20240904020448.52035-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CCI on the Snapdragon 670 is the interface for controlling camera
hardware over I2C. Add the compatible so it can be added to the SDM670
device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index c33ae7b63b84..b4450cbba3b2 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
+              - qcom,sdm670-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -138,6 +139,24 @@ allOf:
             - const: cci
             - const: camss_ahb
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm670-cci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.46.0


