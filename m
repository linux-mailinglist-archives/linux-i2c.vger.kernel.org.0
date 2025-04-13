Return-Path: <linux-i2c+bounces-10304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396BA87465
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E39D1892346
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4B21F4619;
	Sun, 13 Apr 2025 22:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rzfu3Yen"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE41198A1A;
	Sun, 13 Apr 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583770; cv=none; b=BGeDBdzey5n6DIQA+nl/QgxOk1M2KvrMrz0uK5TEuFoQElym0tgc3gbT6XyUsEhEpbH4gd3eLOB/oaLt86aPo3PSIwA1Q6zzPTZsaxVZlW79jNyfv9EM2EYWmjYweAyLJSyagjp9YEE886XPY9Ny//iUvXFCul5F+e5/2/I4BNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583770; c=relaxed/simple;
	bh=TMuFZE3uwWqlbhcZRFkFsW1I9li+cAvVgT1w+J65Ev8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrzovF+GoCWLOa2LmIGlf5Fl81bf4gt+bEneH2WsbynVRLUIuymy+aP7majpq/Bu2A6vr11dkQxE1jbRovGHsCWb3ZEuwbHv6kYqYrMTDhCvTvXpxlPi+2O6VtUHaz+3AsJa5sEpcYx2wUZSF1ksHsWBjaIQMTZZ8bgTNBKAT8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rzfu3Yen; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476964b2c1dso65712151cf.3;
        Sun, 13 Apr 2025 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583767; x=1745188567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd5Yp7mYzKhdmL1h2lCqbEU8oe0XDXYRUx64ZvpbCPQ=;
        b=Rzfu3YenH9ZNda40tU0rVSoXKXl3CHxH9tbTuL7OWD9qgbR7OcMhi25zzgtAT/ERpG
         9oTswcwOU10gWWv6YC5HlygIkWKSo+coHMaHMdokllBIqXTjPX5mXvbzkV63sUInHNrO
         JjunFIOY/wCqZlgyM/IG+jsCcGhr0TQYsberGapAWHKdBCVkMov2eBmTR7zvqWTtZFb9
         7VkPAm/zQfVuAimFJyL6rqSibsKtwJOq+2AoDIRZ7UnWxBnZlnHvtSNuC2mWL8nCc4uD
         rsNP4z0a7LDwlsLnvL+XfvhFUOicnS2MiYnhH2R2K+kVbCpYqXsAbd3GHKv5tGR3e0+p
         IuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583767; x=1745188567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd5Yp7mYzKhdmL1h2lCqbEU8oe0XDXYRUx64ZvpbCPQ=;
        b=njIS/mFoDtutB70eAC/SbBL/V27wBCF7DmBMoFyeRXxxdtt6EJVhVoWDmstnjUFOBQ
         c46yLX+IDlrnddPbrv9Lk9k+8Ji8dmWkQDSBs1aPEwdyKTaG95X6FeEypg//1W2Io6LM
         LCi1GXt/dL+lKTKNu2UQKy8qk9QkhCnYsTi7LJDHShk8CYurnJtyhBdZ4tBqO/tNl9uj
         o1pfRLPdqC2YcJ1go6KAvT2inVp3E+jePUGkfuVNZTUWW5tIKjRIZQKcEUpqrpV9ophD
         h9kASdlrwxe2XAA4QcSsE7bRF+h/goFGwGjUcWwIArUu56f+RC524SvAVFuVVNO4g7vW
         tB5A==
X-Forwarded-Encrypted: i=1; AJvYcCUBOoNerS1tjnNPVmAjOzqoG26Yo5cSzjUnR5ohA7/13KRmBYKkUVnyGvwKv8FIpjBOybozZBFptF2H@vger.kernel.org, AJvYcCUUquFPNhS7gdYq3UqpgeJOATbsMM2/e1/hcryBB2FE1dLLrMmQoSaJxmo6ME9oX38//wNCp7XcedAp@vger.kernel.org, AJvYcCV/R9YWbSpAQ0mGzHEzaB2Wl0D1NPMea7BRBY9Wi1OpD0eWQsz/PEpPZFq1XCbdcqC7rQfSMeeMzvwtztvH@vger.kernel.org, AJvYcCXtnXZDYPHaiWrbAjdTILxmsdkiaWY+4MefvdlAFFmvoE5K2WGC2k8XmyfHou/kdkLm1KRSDByB7oSZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hPZ16bmNrwwHUKmLeXQ1WnJaHjysu0tM2X2DaC+TkFbY0pui
	YkgXP9vUnA08yN9qKJKOH8xoaVZcgMfuC0D8JRN2sLVxSKwKNCCU
X-Gm-Gg: ASbGnctKJQ5wdUS3Le5Vljw5q+J5A68N4sHYo12vPd0Bp6rO2TiYVSLSEiBHLu/Gp8u
	WWAIihcApnkkV2cNt3kevF1e/5E6K4amk0HLWVDOM7f4bXhrK3tGV1U5/oNuiSd+y4GAY9FdORR
	2CjKJAAikaMhidQp752qSE9K4w8fu/3iJLNiZIGSaf0G+rLnN/kaqSg9D8/JydcYMEoUNFvj9lf
	97GLrm93Nrv3zpCRsutvWBrwLC7BtimiBB/d2qxCvtMegUNmtBVt/U788PQKPyrfss83hr+MD6s
	mJBtf5bx2qDszGxQNB7FQUmqkQ4=
X-Google-Smtp-Source: AGHT+IHxIX17/RksehIAE9qWmRUC2wRTWJEDXIPk2oaDG1loYguyGUkNQnE+W3CfecxHYIg+ukOYeA==
X-Received: by 2002:ac8:5f09:0:b0:476:8f90:b5b5 with SMTP id d75a77b69052e-4797755ded3mr175591431cf.27.1744583767292;
        Sun, 13 Apr 2025 15:36:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb16693sm62351371cf.25.2025.04.13.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 05/10] dt-bindings: reset: sophgo: Add SG2044 bindings.
Date: Mon, 14 Apr 2025 06:34:59 +0800
Message-ID: <20250413223507.46480-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2044 shares the same reset controller as SG2042, so it
is just enough to use the compatible string of SG2042 as a
basis.

Add compatible string for the reset controller of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..1d1b84575960 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-reset
+          - const: sophgo,sg2042-reset
+      - const: sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


