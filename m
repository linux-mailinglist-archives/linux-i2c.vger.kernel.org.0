Return-Path: <linux-i2c+bounces-10107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972AA7D178
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344BE188D915
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF6518C345;
	Mon,  7 Apr 2025 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhdwc+uO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1F515A85A;
	Mon,  7 Apr 2025 01:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988027; cv=none; b=bFarCVWYwIC9L0soBbZkKyMLA3ickRJO+CFcIJYyOy6Y14oKF7IBoJJXc8943I2g8959BnwJJm98FcEHi7e/+vfbmNI4Z+781LkBEfY+z07AQcwQX5ZHAM7vDekbUmixV8i4hAN1l5dXfOjs0Keintx9LtP0W52VbCu0zIA7wfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988027; c=relaxed/simple;
	bh=MSKaRW5gafhyLiU4k0T0vTbLtjm6e2qcb4N9zV6dVtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj+3VRjRTLdJh5reJXjbkU90Jk+HeJPgq06b5+hoG2+jKYgv5EjNx6HchVxjfLyzIr0LTQ7vo685/Plan8HiSEtZQ/fVf4Dy/Ys0sGboXP61TOAKL4iDjeT/iimm/JI+x8m2aBrRtECi4lQnhcPZSoSTUaVAFF5qBBD7zel2wrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhdwc+uO; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769aef457bso39709291cf.2;
        Sun, 06 Apr 2025 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988025; x=1744592825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vsCaRl6PH5MXOUa90IYL4ZnfxU9+wZVMbRb1hNiJ9U=;
        b=dhdwc+uO1Ewee/aegm8d+bTv2fs9kzZyXuyGkeGZ6Eh2iJYElx7gKQVTdi9skRKTWZ
         hM7oU+5qjOBa8WdlNDskhk2XVbvZJGBwoZnccLQr4+r+8CJfxhignaIfQNEp4NB/Hne8
         vinzph2piDMF9QUUbfYvsFMwJjC4iaARFpeI8RgZ2I8R7/hTgeZJHlXjP1MHG7CWJtt/
         MnYRnXfDwpgf/l1NPexA5FalCyruAfJ0oT9iVPdrlO6PO1oRagJ5om7wCszEHaK57MT5
         35UiMprht6fRUW1x3HCMqkEeI3WOvtXRhvQoVgDjvkKB/V4j3FtYBEREFcgof32Y3oHZ
         eNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988025; x=1744592825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vsCaRl6PH5MXOUa90IYL4ZnfxU9+wZVMbRb1hNiJ9U=;
        b=C3CcwK+RsEFouBw/VbUBm6GhBnLdoHDcSONUg6f81nzIx/s4H9DluPVE9MX2fRCcgO
         IQQds+RWqIBfdb4j0RJmgDHTj8HIcUDF8z0cTscL6gGIBNZz7PShjBsnnKGeUFHVZOGb
         RZHFdhVWpE1w7a89gxRsFsgMYqN4Fm1I1FjYBU6A5IuMtjal4PEmW51u35TF3bnVWO7N
         Gfc5fhPpRGfHL7Y/TzKhI+jhFD1jkrsFhhBbU3Fy0hCGU/0PGWr5YSwqhDwXLoxJSj9Z
         jGRHYPvUqv5kZK1Ii3pf6MhkOO+czHzBJVKbtHTSXaCLFxQxaxRO3jAa+JQj713bPSra
         qV3w==
X-Forwarded-Encrypted: i=1; AJvYcCVTrEXNXnrjthnVoKRNTSf4O2fW9+zXZANqqmBEHmODokOZXTGZFgLrGKjCbFa23iSHNMeMdLeA/JzU@vger.kernel.org, AJvYcCWD6p/LXN5g6XXc+hEyfuwCkHPNvC5Tbe4T4tc3VR3y0gtD+VaFfDqBHazzjGVY47ViuITdoudHQFfxFRhA@vger.kernel.org, AJvYcCWDX5RvLXa+vDmh/YUNyi6owKjVeq+KmkBrTG00Bsh0W26Hjw+jHT3XEDN100MeUddkXUFVV6MRlBip@vger.kernel.org, AJvYcCWthzN0chlLZgddvZYLw5INA/2Mu7y45bdeZbH5T1OOYsj7S+vleEH8l000GgeskzfF/PEBUe33Iaaq@vger.kernel.org
X-Gm-Message-State: AOJu0YxhBaX0c3JMNEYXcDijEAEWmGEY8y+4V7K2nWwMqK/nmTZ9wN4q
	7H/DDZ8RT5SAm++CZPyUfNFsSHyxivUJMTm4bHwBc8gaK9t/j1k8
X-Gm-Gg: ASbGncukAkTXhH3T/yf4oCnRf7985VDzsu9QMQSZyk08y4TBjaokldlgw2Xrpx78p51
	NaqlPU7BtkJluPvWm/2xkqgjsjCZeWNJl5zyEzCxqGyKdKU/FKck6Ol4WCPIkhPBCJuTSsGp3m9
	qjSC4+boJ3qKXhqFOvPg/z2M6gd6dV9G37HdJ2in/zP8r1hmMWdI2gLquZP3YxZzpMDTCd6+bs/
	VRh9TtAPA0FQV7zcYqGU2aiYqH2+C/Hicc3t8idlVwKX1fbtqpw7Y6QTCmok+tYwMwXqanntWgx
	bNO1kslqmyKIkbm8hsce
X-Google-Smtp-Source: AGHT+IFkuuxhR+U1DbKH3U1yTcluZAPfs3Z52K5B+BYtDKVGXg8KxpwvB9wBRVPiAyCI06NtDvnreQ==
X-Received: by 2002:a05:622a:1189:b0:477:ea0:1b27 with SMTP id d75a77b69052e-4792598f38emr165080631cf.26.1743988024739;
        Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b059870sm53342001cf.14.2025.04.06.18.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
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
Subject: [PATCH 3/9] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
Date: Mon,  7 Apr 2025 09:06:08 +0800
Message-ID: <20250407010616.749833-4-inochiama@gmail.com>
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

The SG2044 implement a standard T-HEAD C900 PLIC, which is
already supported by the kernel.

Add compatible string for Sophgo SG2044 plic.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 3dfe425909d1..ffc4768bad06 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -70,6 +70,7 @@ properties:
               - sophgo,cv1812h-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
+              - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.49.0


