Return-Path: <linux-i2c+bounces-7106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0517298B22D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D1C71C21B2E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F201A433A2;
	Tue,  1 Oct 2024 02:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee3+ta8k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA90FC08;
	Tue,  1 Oct 2024 02:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750198; cv=none; b=DXSdNjHU6bx25yqcQXdhPYkN5fSdennJ/9cXb52Ex3TQlhSq5AF/uc43F7bJ4q3JuB6T6GUhkooJ+Py0pRw62azbpg7D/jIs3Gw9pyN2/UDY61jMKaIAQNwrrCJIMfs6sTvt8y3FFw99y/oq5qWJiiwrvHzaDtOco6Orvuj3k7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750198; c=relaxed/simple;
	bh=+CIqr2vmq+vhHZ5J3uMUTMBMqrntjaJo3tmt7NWdS0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZU66DTqr8VPx4i5IFtpfWyGtb0StukAJaszCpKGG7FygcdCbj4BqIFHZmArziLeLjf+V8kKREY7u0/U4Gm6icvORZkPsX8ncUxGZ0+ANp5b2FU/zf3TJkyLpQUF0wZ7KJRILRm3ciabEHJ5gbXGhnzwtAUhMjr7b+CvrOgJzFYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee3+ta8k; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb4c013b78so23798476d6.1;
        Mon, 30 Sep 2024 19:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727750196; x=1728354996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2UpVwrN3sRja2wTpiKEM43bkPE7UuzBqHUB1gNgWc0=;
        b=Ee3+ta8kgAKzUwyurfgLr/dqhE89mYoEDDBwrk6tC6LzhY6FtTFSX4lkfpHO5BDxFu
         HxvonSdt6+p6R2K/YC6TYINfwPI9bdn0hOPtq6WV828HxGO4F0ugEBtgyxvezZtHS88l
         kI/tGtsL5PJYknBEOIaz3+1H+R1vcJ7JltfqSkK8RpmKMTsjI1rfGBOeDaWv33aZkwZ9
         woaQF2dSSOzWj4imJc5LGDQYKR8+KoKp/SGZsi4RYsPg1oHa0OorQaFXdvppoHLjmB9j
         HNth3ZjKj0cBuhyZJRIzlQDKv/4tkuc1EDBooY5rkM3XJzvbCUZaXgqj0S4pCADrUDw9
         HTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727750196; x=1728354996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2UpVwrN3sRja2wTpiKEM43bkPE7UuzBqHUB1gNgWc0=;
        b=uccSpiOjLkOhDlfT+VaecwhUC5D0ux4Yzc7EPFs/KHM1UgbRTEUAV6jnolhWQan03Y
         oZfbEi8u3/I1Ei5lmYk5n0HYzR3LXZxWPglCuqgQywncM76yCmJo8PG4G/LpCkqxmduZ
         ZkOKrAgFfUnsjH0ufz6wnPoTzp9YgN1CfRSrfs+7YEdSH9DnG8tVl/eefTghktaGTsHb
         YbT5MuzJPFkBS6C1z5ufseW/3oeGCUPhv9QzT73eyoWqoaGBc3E/BNn+e2aVVC3hTNYm
         7T9vHOwgvtljwkmdoqYlqke61ECysPWb7l6UTJU6xJIGe/IW9wa2IReYmVfqLtbOxiB1
         5CDw==
X-Forwarded-Encrypted: i=1; AJvYcCUa2gBZ6TMHdAU2bwu2poPc8QyVeLdV8Er8zHLvOudv4A+3i76C7jRRS9SoSeCucUsHryuyjxhcs+5Y734=@vger.kernel.org, AJvYcCVXXS/WGgsfErUpdkrMp5UJsk5ufewHwvOT/IiOzYe+KucZx9kPrCDSpSgd0l2ZWqnW9kyYNlTu/0go+2PySQ==@vger.kernel.org, AJvYcCVq2EMCPRRPY62jSYiJdDinXZ2yM7gQJejvHuC3PW0vVCrr0DxgBFg5fdAbNZzLECUlXCKNMjNTgqMe@vger.kernel.org, AJvYcCVxQf2UtpxMDJuXFJuiPfr1d7P3Rd5aryibxFvBMRMyGZ4Z4wyoEvtmVqGieE13CtTWcLREjD6TLb19@vger.kernel.org, AJvYcCXajVon+xf+KdYdalGw3O79sWuEf2iiB5k/gD7AxoQ+pG6da+j0WQi0utaQhjqMYZZJipu7qv5/ZAH8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7B9b8X/dgTfcPwyZ27fk2nnk2mnWm3QQRFN4Ji30SZ7gUl7iJ
	nMf/6f5rkjxj/bfuxoeFjHVOKSQQQYgWcUPhrAbUGHKgd3HC+n3R
X-Google-Smtp-Source: AGHT+IERwIv4cQoGCmCDVTSs5ZYN2ejJuwHDQxocxF9qVEshoCTDDZDGhom2aRAN9o/+NOeYaz0PTA==
X-Received: by 2002:a05:6214:460f:b0:6c3:5ebb:9526 with SMTP id 6a1803df08f44-6cb3b5f2d1bmr233254696d6.29.1727750196102;
        Mon, 30 Sep 2024 19:36:36 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b68ec2dsm44692596d6.136.2024.09.30.19.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:36:34 -0700 (PDT)
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
Subject: [PATCH v5 2/7] dt-bindings: i2c: qcom-cci: Document SDM670 compatible
Date: Mon, 30 Sep 2024 22:35:23 -0400
Message-ID: <20241001023520.547271-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001023520.547271-9-mailingradian@gmail.com>
References: <20241001023520.547271-9-mailingradian@gmail.com>
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
index 7dab3852c7f8..ef26ba6eda28 100644
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
@@ -139,6 +140,24 @@ allOf:
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
2.46.2


