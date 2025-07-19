Return-Path: <linux-i2c+bounces-11972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B545B0B015
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 14:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1635C1AA2188
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B232882AC;
	Sat, 19 Jul 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irmb/a12"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9802877CD;
	Sat, 19 Jul 2025 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929797; cv=none; b=lp398t9agPWUI77jtWxISSNE7gCr0phPKDNJ+WNRK3BipFzMUSJ5GSfRLb2Esh6nebbLClBrifAekfyzN9/vOoHU9x9xc5HA3KNsfoI3LUE5jiGwOvVk0R/c1utPn0KZe4FzOCk/QEhssRjBiTxwc7318xx16G+IVvJW4BkA41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929797; c=relaxed/simple;
	bh=dkV+IUmKiqaEhbhd2NYNtijiIlnYC+Jc7DPZEhWfRW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXd7ShLwlM401oWP+bWYqonkvY7lJjMWrGcg3FP9011SxnxdiyjdekK6Hp27v/NdIWnV/LwN3w7Wdb0wJGrdX+pn1g4DzmWFe2vFcb7nSYuREib9Jd246afySmwukATri4r2UoGMR4BTUOWjj464Fv3RzTK8YCZ2ZDEseZHIKT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irmb/a12; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561607166aso22579085e9.2;
        Sat, 19 Jul 2025 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929794; x=1753534594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxF16l3zt8tY8sRNrzE5FLjqAdbnZlfk++/RmClHsQk=;
        b=irmb/a12Lvv7kqsCqiO5ym75O6Yb/b5JK1igWwSPbc9haEdxUKw7Hw0c4gEFih43tL
         26vpJ+CMzKePONJIv/XXNmfi2JaP1k2RsUmhtXpcFzKxcoT7xJxxAdI65SxFqOTCBi4i
         sh39jv62lbXo0mr7z2HQM8w6jwJF7PvLc6un2ydyq3giGk9sVLF3FnV4nCkpXlJezL6o
         Jx83hVt7yJKmvcTgBSIqbzO2AB/ixSu8nQqz7lyuwrHP1i9RxNZcHBUaDdiXteGi/N/x
         r75uCMuX3HxUD2SVDCqN+PzIPohqRJErFJjioZreSzeoGPNxpikpT+39vTkZ4loNfZZS
         Uy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929794; x=1753534594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxF16l3zt8tY8sRNrzE5FLjqAdbnZlfk++/RmClHsQk=;
        b=BodJe5oBroC7bjiz5iziu4WuiWMB7eUSs1i5HkVc+Bcg3i+CCOpiFzd2H5AmBsWdQC
         JXqm96dYS2EkfCJJW67qFylkuHJbW6ztbzwhFbsA0ETLYE2OhU1mUDelF50c9Dqe0Orp
         WavpfGTX08v/nN5K9f8lbTguM0mr/3zU7qI7SIItzDZk8JzEYqJVsmFB9zLlHgw3cowe
         0tDNfKeu6U8VbCX2mbDZj6T+TR6OMa8fuPdwk38XW8ofzwfu4OYTCwB6BE4DvOBbBsJo
         B919H5pGNskGreZeNLkqwFx5P+Q7qK15OYNJCLLdVnlrWRegXuAgopPyVAk12/PrLygY
         33FA==
X-Forwarded-Encrypted: i=1; AJvYcCUa3KwLpuVV0iSwZwNibKHWAl3krfO9uIA2AL+DbLGe/AKPb2f69S/7CZkQY1hy3mVWZYmp+xoWCy6w@vger.kernel.org, AJvYcCVStbYYZiDumhbHZ6uexAK+akBfNC68/YgS9yR9uux6dWFIYBGqlAsYLoR+f0npu8lbSUNp8B06Qb66OA/F@vger.kernel.org, AJvYcCWHD8ELeWXav3WfC/3T9ybZCGxd4wV0WZDWBSqj36ZlGvfJBRML3ZuX9p9wLADjrAAtVLcAT7aV0dGG@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxvR+UQpgxlVd+MSJLYOYQsOZrJGWwYsr9XT4MD08gcvD8g6v
	sa7WsLnyPgLx/NGukc1MGUcPPp5G5SeYTHu/P6ME7elk1dG8gAgS2gHk
X-Gm-Gg: ASbGncs4Xm77pVI4GQ109pe6kF6znPtnAtz+TvXppLPpqASx5UJ5wMYmEMgEZfnGXUs
	QsfMptGhls9tE719+fXx3mS0kXz8yTDOdeZTNX6wtBW6jIxZXGwuCbON1kOtBECANZoW5xkR67x
	yvnghuJ66kJS0qVuHdhptf/hsJA34+g7LhTonCK/TPqDaiwWzNtCrkS4f+XKSiGXUs36VcmbujI
	+A0yWPOp3//cJlSJM2HXkhRH2icInI0lBGxEWWEC6Mv/pieQdeu9g56dgD50fjjGv4SL/V16aXU
	fAEMBT42yk6Rp7tBu9Sj3ecumdhDEz0AgIB7WcEElgpFRHsoZ9ORqwSjRBX18adiytOerR1AwbO
	Juj3wswpTf8yoPNguzxlGNFtQpZ3rd4lXnLamyUt9ShfyJuR47wkif5Is70BGjWDUc4PbUJKxWU
	6V
X-Google-Smtp-Source: AGHT+IErHyd8wFBnJDF+WNgRh9G5CvxgmcOoZYRsh1TvapWmYxtxbpcLIUSOUNS+UJ/rCtM4NIuATw==
X-Received: by 2002:a05:600c:310d:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-4562e2a59a6mr156638375e9.31.1752929794405;
        Sat, 19 Jul 2025 05:56:34 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Sat, 19 Jul 2025 14:56:13 +0200
Message-ID: <20250719125617.8886-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..38118007b601 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - mediatek,mt7621-i2c
+      - airoha,an7581-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.50.0


