Return-Path: <linux-i2c+bounces-2360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45A87CB6D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677D91F22956
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FF319BA3;
	Fri, 15 Mar 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hejcy697"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F127B18E29;
	Fri, 15 Mar 2024 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498694; cv=none; b=dNQ7J0/j9eD+qJ2nesWbEd0UYItvQXV2LD1UFnV5apt1hPBxCGfU3BfZzHf2dZWvCycvMGB5F2GSNU1W7WZt5+m3h4Za+Wf50yGqHv4RcqKrn82IdJxoy8QxTBWPGxklv50zwaMxlXsZJKMz7wuD5RJQL5qciGWLR7E1yRk2j+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498694; c=relaxed/simple;
	bh=SE45kCzlVbgFgbJfsJGiklk8gwxB5yr4fkJazUtvOuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7XS5nUToRTa6C4Pj3Rx2piWpbfCUCvPQcvqTIddhO5LQPCi/Xd7gvvU9XE8SuY9DWCof50GVkjA3sPbOXPUH8vMOQEKny+MFIjyKmctzsIOZQ8Qj+fYFQz22P2/nt8EAVhSnLSdIJuaZ3oSl5/vXevdiuiRi5Vh6Cfei/8K71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hejcy697; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41400332525so4406975e9.0;
        Fri, 15 Mar 2024 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710498691; x=1711103491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVKfKDU2lNUfwo4DLPyPwWk8pm2av3RhG8cnv+hn5O0=;
        b=hejcy697VhNkF2LCrzSUjzawPdeXTA2SAr7ekVHIO6Pig4Nqr6ZuMpyKT4M7GMbB2V
         9iZq555qWAOIHnqg0gdN+oEHT89w98RHNzU6BCjlAJssNueFDf7YkLNZx67ugj6bXXEu
         dCxJUUadxqXZJbqvVVkrgMuHfm2EHF27+UP1lVLSRC6Fs1+5coZHkwTcIkfp3ebTfot8
         1ZZcs+Fso24lhD22dhKMIT1T7oNyeZp97mFB+uGhO5Rw7J9LHRzf4EhCgm6G/sgBBhtV
         v3mS3pU203BTMH5fYJvbimop2TzGtJctrDtwW3DWezyai7yDkrPXnRIQg2mr6MQ0MjGW
         WeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498691; x=1711103491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVKfKDU2lNUfwo4DLPyPwWk8pm2av3RhG8cnv+hn5O0=;
        b=bYHIIPB552RZhiJYuEPC8YWlpfQWM0k97kP0+96BKCGqSoc8e3Ta8x9ZxuhJg8x/GO
         TI7fMXodBauaYI1hsO5RI6iu6XdoPbIDEqX70XfPyDScvJT0j4Fm5S//oANNI6L9WNss
         6zZMHrcQ61boQFvkMPxTEltdSy9KRV/Iun9L0MlhMa5e6UXWRBgLVr8JOz0r9HakyZp3
         2wnhHV7oa6Uglat9HCztj2CBaPzIRtw32Yn6bxRYDnwd3BIZn539LSKYi2oCdYXSZxbG
         29zZPm4UFq6OW7X8UC/EsHqhon/PWLA0qv42t3Fv3apQ8mOEYadSf3m2sgOy8nXLRIE+
         Slig==
X-Forwarded-Encrypted: i=1; AJvYcCWbnnRJTKxJ5oNMS1NAnWj70rwywmTu6ZJU7wSyAfCj79s8X8buODtDSfENXHQOcKawmsqG+2G6dUN/awJTBKJYSEyaK32n600BYpaPnAQU0pKUL3HYQTkFa2A9ZIF5AttHPoBi2Ecv0r7byryD4nRi+SrYNp9p3kWl/8DP8iunY5i8mQ==
X-Gm-Message-State: AOJu0Ywqud6q/wO8D46zk6cNygqu65fK1Bir8U0a/EebA+BAXxIaeD6Y
	msGyA1NOzs5tyQGZZiIzBw4bmHw0qOmXf7k54YM66NaPyj6nG2Bg
X-Google-Smtp-Source: AGHT+IH5thlB/KqkhMFZEtOkS5tP1abakNep+y6JmIhXw52Gx1sgBN36fINQ3j2zydBdEGQM8NEAzQ==
X-Received: by 2002:a05:600c:3b1d:b0:412:b0cc:1c62 with SMTP id m29-20020a05600c3b1d00b00412b0cc1c62mr1766054wms.32.1710498691351;
        Fri, 15 Mar 2024 03:31:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ae92:6adf:5cb6:274c])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b004130378fb77sm8676549wmq.6.2024.03.15.03.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:31:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
Date: Fri, 15 Mar 2024 10:30:30 +0000
Message-Id: <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) available in the
Renesas RZ/V2H(P) (R9A09G057) SoC.

The RIIC interface in the Renesas RZ/V2H(P) differs from RZ/A in a
couple of ways:
- Register offsets for the RZ/V2H(P) SoC differ from those of the
  RZ/A SoC.
- RZ/V2H register access is limited to 8-bit, whereas RZ/A supports
  8/16/32-bit.
- RZ/V2H has bit differences in the slave address register.

To accommodate these differences in the existing driver, a new compatible
string "renesas,riic-r9a09g057" is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Used a const for V2H SoC instead of enum in items list
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 2291a7cd619b..91ecf17b7a81 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -15,14 +15,17 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,riic-r7s72100   # RZ/A1H
-          - renesas,riic-r7s9210    # RZ/A2M
-          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
-          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
-          - renesas,riic-r9a07g054  # RZ/V2L
-      - const: renesas,riic-rz      # RZ/A or RZ/G2L
+    oneOf:
+      - items:
+          - enum:
+              - renesas,riic-r7s72100   # RZ/A1H
+              - renesas,riic-r7s9210    # RZ/A2M
+              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
+              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
+              - renesas,riic-r9a07g054  # RZ/V2L
+          - const: renesas,riic-rz      # RZ/A or RZ/G2L
+
+      - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
     maxItems: 1
-- 
2.34.1


