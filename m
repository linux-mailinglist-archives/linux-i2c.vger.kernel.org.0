Return-Path: <linux-i2c+bounces-8616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 900A59F70FC
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9495188F400
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960AB201032;
	Wed, 18 Dec 2024 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSo6p10t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B474C1FDE29;
	Wed, 18 Dec 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565054; cv=none; b=uBW6pbswzo1AALANqC5HaEpi6AnIskflevuCoEYWk5/YWtEAcJuYdMXdebgVLRY8Wapl8l5Ml2kMboH//VUMPHWu05SsCUQEO5ULBDhhjcYCGniMLm/ZPe8Zp/I+NksmqIvk8oD0p9s+KRHk1zpKW2N+B25LvWl48OcC4Xejdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565054; c=relaxed/simple;
	bh=t2TsMiP3ilVlrTWn1B/PYvmpFe1OKGm02kYl5hvd16o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vh7ennABYqjEp/B8pJJIPoMF35y5oovMQQVET3GN+g4huCqVdsHXaBW3p5eTLwPB/KfLj/YARt0iRMLFlXw9YzqFFA9bKeThA/d5uFRCYN8oUjsZVmiCp4PXwBlz7YCy59jWfKP6tvtfHdO1NNgKIPZu8L3YaztsNya8rdrqaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSo6p10t; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21670dce0a7so2627735ad.1;
        Wed, 18 Dec 2024 15:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565052; x=1735169852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwKgzZr86c7oRTHczyCJoBnZeP8Mi7cizIcfC7/y0QE=;
        b=XSo6p10t91g5ySCuLaj+Ufz6kt6gR8ovg6xb6d0qtYtRYptc8gRGuHLU4qA8CoLTxD
         fHa0i8BmzNm7gsPUV5MCTXaqNrsf7YebL8LvWaCP3oephDp5zJTg4IceTd02ieqGU7TD
         6Tj/f+o3Z9N2dL6p94sAXiVaP3CrhsejzfwkPD0ODMNWGZTx1+N1rZ0wMviEfErUQytZ
         oOnKeNeJykMM0Wq6MBsPx7NZShgRQD3nh3b163bho0rY29N5xwMdZ0RahXm+bsmsv38a
         xO0xicOfrjReUGsYqv4wmt0I32nJ+/Drafc1Eg1Mv+JPICqwQmzlMMGGRHE+5oo6qtwM
         Jl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565052; x=1735169852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwKgzZr86c7oRTHczyCJoBnZeP8Mi7cizIcfC7/y0QE=;
        b=nqlH/2mbsk2Yl0tC+zplMopHhCOENHXNVsIRVYsEi/TUEmZD9272j1F+95DC+WEjK2
         OQJCisUbzVWyohG5yv9BHmGK8gm9c83jvBn3yMeMHZ1ynIqRnYroQN5vaUyDxEr/8cCf
         uoDcPSszNOJuxziLUx8t5YCJfCX6ZUmQjbBh8mRvyvGBOzOh0wJVOGrWmHpOgAKYTiPj
         uWnk5BIDEfdsnMA1MYmRgPaVJMnLUgSbf4zJyVdI86whHj7yOkGyONIQmGpgS+xv8evY
         Z1cflYF2SRg6Nj+cEd3uK72tW2Uh/q9F/i8qEi69cTkT7uYKUGgpQbO9GcTiWoaOSk1h
         pD7w==
X-Forwarded-Encrypted: i=1; AJvYcCVx1hld+HvzBFVpIkZ4dqRBumOV5iWdkQWyk/JZbi8TVmOQmS9mytByc2XiipIovkfJgl6yx8HYpSjr@vger.kernel.org, AJvYcCW2iQglCqozzDAJGLANp9sqPX50USp0w+Na/LbwGLNQ5nkexSYcvKDt2H7kcV6UID811gk5bg3mTXYEwLnp@vger.kernel.org, AJvYcCWkAH3Qa4kt97Ue/iBixerkQntGr+FgEFIzQhlK4Mxv2z7VTz8EBDPjGm4dgQGRzNPD8jIliL63+rWxg9NxRuo=@vger.kernel.org, AJvYcCXjetXlse6oMYDK/huyceNX8dGAb/ezrLZywC4wqEzt73WFv16cVYYqFOXk4CQqKC1ytZzRU1lFHRzE6D55@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLrnvLqak+sS0GH0UBxMX3nX6pPnb2r1akbdYAvzarYCwITix
	CG2hZmphsodL7c3YDhmY6Nm6Jbsv4wrNR3QEGjb39YgXap2mBN1p
X-Gm-Gg: ASbGncsuoUnzuIcA9jAClC2y413tysJ+7mmOt1z8vo2QtRyaprXhKi2GUdvWWLjpA1P
	bhnmzGt6EAePUYD2cILUVvZDKBF+KL+jTEiyes7GpgjrEbb4A1U15BVhuTrEwWmoV0EnYQbP4fI
	aIS+lKtmllcKwZqp0d/p8081RXZjPR9sOaAUXVEWnwuW7l8K+38CM2gYnQ7/Fz7PsteyEEITKIt
	kLZX045Ha8sh/ZNv/kPkd8Mo1EtgvyxgFGGZnLmYl0pRoRr6aznHuSn
X-Google-Smtp-Source: AGHT+IEXFMesvXJhtouY2pEYJ1RzXyDqbP8BeiasyhxSyJNIN4LRKtgRxxtfBkdvFwD8b4B4U9eHUw==
X-Received: by 2002:a17:902:d2ca:b0:215:8695:ef91 with SMTP id d9443c01a7336-219d965c6c8mr18160005ad.6.1734565051971;
        Wed, 18 Dec 2024 15:37:31 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:31 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:37 -0800
Subject: [PATCH 7/9] dt-bindings: regulator: add binding for ncv6336
 regulator
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-7-b8d973747f7a@gmail.com>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
In-Reply-To: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Fabien Parent <parent.f@gmail.com>
Cc: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org, 
 Fabien Parent <fabien.parent@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=ggkzqiAnE/aO71fqKd9R2qFTZ9vozMA5CH3AStZDGIU=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtoQkhva1UrTDJTS1ZBakR6ckswbXYwCjZ0Nnh1QWhmeER3ZWZnTmdP
 WFYvRklrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeW9
 BQW9KRUlpYklNUVMvYXlrM05VUC9qaWhsTjBZOHlEeEZqaUozTHNMS3ZsMk94R3NCSkxYOHFORw
 o0SzhMaWJ1RTQyT1FZemY0aEowcS90MTZSK0dlU1ZJNXI3YTlFWkR4ZGF4Sk50cVNDakthWFJyS
 jNyL21nL0wxCkJNb1JDZ25IZDlzWDFuamMxZmZvbERXR21uaGdlRDg4bEcwNjNFUnRpMDBiSUlO
 aUxSL0YrZ0cwQTJ5ZDFWRmQKcEl0VDlMQXNDbGlGeGtyT0tXZWpKQzFUVklUK0Frd2hQZmMwUnR
 2ZCs5eWRENHMrZzE4c3JMdTNyYUZVTUs1QwpVcXBxMnNFc041a29yNXNvSkVKTkVzMDRZN2IzSk
 xxK1JPeWdrYUV2SzhGSlVOS3ByVXduZXA4UnA5VGRzNXJDCmRGZW5vdVpkRXM3cXBFaXQ4OHlYV
 W04czk0MmhnSlo5TTVHcFdSNjJodVo1S050MWUwYlE4T3NPUW0xT1NYc3AKb2NZem9tMkZUL05V
 eUYwVEtCdDYzbTFVa3NkdEZnT2taQ2ZpeUgrS0daQ3dZWVJYbDVqTlhZcmJsR3pVRU9nLwpBNFd
 3TU5pUGY3aXZ5MWs2VVc5d2MrQ0w4Tk9mSUdGVDVkQXFVRDFLdVhRNnJSSitwNFR6Q0lkMENqZF
 NDQSs5CnY5WFZNRGNkdzFWVHNNaTYyTk9GS0R1R0Ura0FJYThnVEdITmYveVVsYysrV09SalJCa
 UIvbHNnWW9TMWhQZ2oKRGxrMTBDOGxheTdoL2RrcUd1c2lpWFo5L3l0ODZwRkNnWm1tSlBaZlUv
 dnhnVjhmN0tWZzBmR2tLWjd3K3o2aAp5byt1eU1mbTA4TFM5Z3MxTVFzQ3RqMm9HWG9FU3drcnJ
 ZcFBaWmRmVTdOZCs2MUJ5M3QzdHVSVTRSK0N5NjJYClE1SXEvS2VvWExZc2JRPT0KPXdKdGUKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

Add binding documentation for the Onsemi NCV6336 regulator.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 .../bindings/regulator/onnn,ncv6336.yaml           | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml b/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c69d126cab33668febe18e77bb34bd4bef52c993
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/onnn,ncv6336.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Onsemi NCV6336 Buck converter
+
+maintainers:
+  - Fabien Parent <fabien.parent@linaro.org>
+
+description: |
+  The NCV6336 is an I2C programmable BUCK (step-down) converter.
+  It is designed for mobile power applications.
+
+properties:
+  $nodename:
+    pattern: "regulator@[0-9a-f]{2}"
+
+  compatible:
+    const: onnn,ncv6336
+
+  reg:
+    maxItems: 1
+
+  buck:
+    description: buck regulator description
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - buck
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@1c {
+            compatible = "onnn,ncv6336";
+            reg = <0x1c>;
+
+            buck {
+                regulator-name = "ncv6336,buck";
+            };
+       };
+     };
+...

-- 
2.45.2


