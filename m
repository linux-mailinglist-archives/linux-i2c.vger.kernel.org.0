Return-Path: <linux-i2c+bounces-10109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F2A7D183
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E0E7188DCE0
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24931A8F71;
	Mon,  7 Apr 2025 01:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aztW01/3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C41A5BA6;
	Mon,  7 Apr 2025 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988034; cv=none; b=jcl7UYCsGEhzAETF5Z7kLKlbf8KXCtCZmP4hPTa+xeHHQlVOJPTTeRagtI43GITq1Oa19AzAYQvC0aveiWfzBNigdfzIkdL1rGvZT0wH5jz9wOxcJ/dJEIXVo4Bq/A8Eds4Lbm3g9dLLVSlY8ZCJ1u2P6dY8eixmdPx7wzwxO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988034; c=relaxed/simple;
	bh=jm3vxmg+xrH3NcRaQ2m4D+XCcm4xlRDfcDS68lc++s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXHjxsZUpr7wDI0LnewZxIAt4h+dirCJN8IbmWh4ZQ4/Rld6CxhIYU1f88jTH46LTKtSRQjvofagiT8VUPFq94/Orq+4sIsRgZuLQLA9hk1bemVpI9bPGCUe9sY6ruXI/0z8czo7ZTmolGenYKvHIbjdOKBAwNlo4Rb7qrj25IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aztW01/3; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774ce422easo39874621cf.1;
        Sun, 06 Apr 2025 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988032; x=1744592832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxGj95L/w2Qzs2Ze4BgVcXHP5P/GdsW8Q50TIa9jmhs=;
        b=aztW01/323yKiXcMS6IBcTltSjU1yGsVOJBkt6psnFrbtDYp1Hd/O4MsqAjJLoY21S
         +wcsfq6VPq/ORLW2bpGSIjcPjyioXaIT7ct94cMuFnikGdImMauKUSyChUS32V8DVSJT
         /vU4vbmiYvP6w2KT0Yy0Z4M046mrY7jZdz2lz7Wv3J0UG8+dhkSu/v+sk2E4wGfM5gG9
         KilNZaW6VakkzVwwJyHuEfBwm9cq5Qh/FbZtrD59Dar88+urfdiw5kM+z0f7v6G1B00E
         +Q47Q1NRQ8Fb/8RPj5tYGtIoZw2FeaTe1a1RrGOuShY/ejzob1Wf6YSQhsgJAh7Y305Y
         gnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988032; x=1744592832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxGj95L/w2Qzs2Ze4BgVcXHP5P/GdsW8Q50TIa9jmhs=;
        b=poEnLVHhAXqaBDlZqij3wLDKqsIBOQtXEJXN2CY9+v0BpYnWB6+v9wIpjPlb1pmoH5
         2D97K+taChiyFxSkr4xrpTrNrdl8ASIkDfdu2ku63ZVhU+OCglHjzsaVhjuNK8yeOK0c
         Ostq+OzojkdvUbgiBradJuN2ub4bhSDW6LWtmYXBRucs7Fn9kNyD69H7g9Nf8q+6E1HM
         OD93Nsm0P9FUf9RudHz7K247kk8y3QkWWHE9T5sDuQ/rbJFWvTqSD/nHoo2kd6bTPdcj
         eWjxPaJoCiU/PoR9bLeUEOnJ4WaFauka1GxVYCbogeNJKuIQi0/oqsbEMNAi9Lj7WJ0n
         yHPA==
X-Forwarded-Encrypted: i=1; AJvYcCVFF5OLxOI+JCSgi0dGMFM+b2uEEkIA2TOkiKxCL7+MgYVO0JWJc2XBn+ko3VAnC98EJ3c92LgR+4ii@vger.kernel.org, AJvYcCWOLCN6JfjDCeDj1W+dnyVh6lj0g0yFgaHUsuOEBnQWR2XP4WKwv900rINdesssv/c6b2QBqNNCRSLlJNi0@vger.kernel.org, AJvYcCXSg+wwRYR7rHbu0edRlggYMEYNCtgEIn2LJd+8zDJSG1lGKhhdcxIOUg0C3d/CeGM91XeG1UXWgndL@vger.kernel.org, AJvYcCXT2sjcAyGpYJ4lwU9s9OIxMhDDpCO5ffqxZSfd8onOQEpqad+f0I1gOkZXMJL2FcAYTfEttydI2zcU@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXqkQZ5b8jAXZX/SrfYKfJxchRdruhyxpxjqFjzirvKn9iK5X
	S8uUaasGVY4q6ywVWbR37P6Gq/TfEE6jlTp6U2T4J9lto+thjQgf7E9mnQ==
X-Gm-Gg: ASbGnctPzvsa6bGJ+pnHU8XmJVrXMqfokzpoJ4DE6TCt1Wm8CtA10fMWKDEFt3GTFyC
	mbIbop6C7AnG+qYKuEYBMxBUIryjgj/YGmIx9/pkDxDW5+CdkuH+kGQQ3YrrK/8E5Sl2wmCoy8x
	8n/+wnjULYhK5Vw6VpHZzIVfOmQAfGOQ25R4zK8XOEQifAVHidjAZgK4QgyLeqUWPubzn3HcPPN
	hvy6/jqGepgG+nlsGwY1lsnUpkg3DWUzqyZe8PMd6EPMFM1D9V8qsC0UPtOD4/m/gBtOay85c9q
	CIugB5U7OK6W7AW9gHce
X-Google-Smtp-Source: AGHT+IHCyM7ZtX7jFmV5IRhKbjQ2Jxv7Idw4a15oEj0OBoQ/eDrGzMbPNQ9/4L42Cket5FjlilXjmg==
X-Received: by 2002:ac8:5aca:0:b0:476:6625:eed4 with SMTP id d75a77b69052e-479249abda4mr164123331cf.38.1743988031833;
        Sun, 06 Apr 2025 18:07:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-479364eaa28sm25496661cf.28.2025.04.06.18.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:11 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support
Date: Mon,  7 Apr 2025 09:06:10 +0800
Message-ID: <20250407010616.749833-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MCU device on SG2044 exposes the same interface as SG2042, which is
already supported by the kernel.

Add compatible string for monitor device of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
index f0667ac41d75..b76805d39427 100644
--- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
+++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-hwmon-mcu
+    oneOf:
+      - items:
+          - const: sophgo,sg2044-hwmon-mcu
+          - const: sophgo,sg2042-hwmon-mcu
+      - const: sophgo,sg2042-hwmon-mcu
 
   reg:
     maxItems: 1
-- 
2.49.0


