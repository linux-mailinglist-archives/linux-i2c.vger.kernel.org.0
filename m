Return-Path: <linux-i2c+bounces-10305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93891A87463
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7AB87A72D4
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464F21F4C9B;
	Sun, 13 Apr 2025 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuO6Wi0S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C35E1F462A;
	Sun, 13 Apr 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583773; cv=none; b=h/BqvJIkDqkirXwX+iEwWsQoJt27jPim3L+pKEMc/Ez8CaGqnVjgKorSgGeISCmL0y7pCyTKDjuXZ10975wzjXwQALN3njCDImGenpun5B34b+frh+XqyisOfmxw45yvnYKCuLkI/QjUzMQpN5pru3ZR//yLx6poki2n7MZTh8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583773; c=relaxed/simple;
	bh=Cmf+gOT/kYw+GXuXaWBlLZn/6sHqvZs+gjPpz5AiIIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMWo44dKTUENd3RQr8bwU1SnduFDicMRjO7W6afyvFfc5O4a5ryvC/e7tOtZS+rNZcVvM6kC4VkUL4ucVpm21SU2mJq7aeQE0Wy00BOi9iPb7ZIheijZPo84s8xUlQEiY/govAKY5N2fecN3lW/dJ+p6dbbDW8bPlbaVi2/nJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuO6Wi0S; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so50675736d6.1;
        Sun, 13 Apr 2025 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583770; x=1745188570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytUlfm8qXlr28wKDzJ5vAM4ffHx7bGxIhY9dR92BS0k=;
        b=GuO6Wi0S7TFMnoR0FbiCZjYDCjEs6K5wNLPKB8pEF0kpngNaY1lyYm/8rH+pjoT6oH
         3LTnlrjZgPFvhvMXlSJTJysiw/ufWU+ztol8sY24kHnsPTEDxkN32l3BwBq+FR26ck2w
         BJA+mzXVXADPA2qjSlqkSNRy1DMvIxfUamtKcUq7FNGmoUHa6lzxTorzidP0A5ubIgfw
         q5HWS9TbCC29p/pL4bLwx1x6huuR5+IaHNr5U6vv7bfu7sLu0806W2QX0U5E5aQsLdnp
         PO1vdwo5yskQpKCACfL4+0+THLOfWpiJ84amoaU09LEMje8SxCSCBvpvn19aGaLgl+97
         /DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583770; x=1745188570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytUlfm8qXlr28wKDzJ5vAM4ffHx7bGxIhY9dR92BS0k=;
        b=Vmok/MkdbyyE39PW1+QAx7n7SuW+MFx5X383xnRaeu4lF8PMV9RmCFhCStN7U/8rMK
         SPF4EE5Yy9+XIS0nrYcHX3HvuS+za3pCTxTmSxIY1W9RMrZYpFSevADj/5zCI3F/TDDs
         uoMptY6ElPcZGw76rc0SKkOYXhNI8mUfAC9zBktbCIpmvruNSI6LKtpXWEwVHGJCQDJI
         7TE13+HDJIBittVeq5VqtqM7BjognDurFNIP4qX1vAjaqWhkYtwkpmZcpsia6BtFP3En
         AMj92y+fmcE/OeIj89D9uOpu/NBKZjm3fe26eQyKW+jMBeH7vSEvCzCqzn7NBRsP8o66
         8m1w==
X-Forwarded-Encrypted: i=1; AJvYcCVMehnq0pYnNZDshlukupF/zjSA0CClGyxy/nEvDY8HTNbUeHLPjgqBUAfqeiSLsCDNQyD0J7PfgVP8@vger.kernel.org, AJvYcCWo6A5amIRzZ7Vd0OmQOwuRALKPcneo8YJ0jPdB6T1TbSfQXdAfcCxvNmL/BnHqzPtxhSpsaOmlnzu9@vger.kernel.org, AJvYcCWusQ30u4ut+3RVZ5tDA4PYR1cnXbbG74XLfwmvpJbRXcmvrHnREdtL8519zZurSfOLL7Bnx9/I3Cdb0lkQ@vger.kernel.org, AJvYcCXqP7vlWhDoG0Rsxpfgex+B8w5rQI1EGXOhUJECVgbJokGq+G4oSGbZ2l1KJj6hxMf+7MDFrh1/GPkV@vger.kernel.org
X-Gm-Message-State: AOJu0YzByq78LgYdAQ2Q+eFvvT9IufSqkAhXIxfchvURkmBpVy3OG/FD
	rV/WpZXbkOG/HVZgFgR+c8+KKAJPPGr8ln6HsCXevzxpTh8bdQ+m
X-Gm-Gg: ASbGncsY3z1YUmqc23Qjex+BHB7OB3aAw4UQk5zmGqsACAXLi87vErLZvDE4yUJwur4
	J/eGTQK4XSjdNZoUO6NMGqfcYjuhIuj+qNzgSBYpIsw70tYANn89FMftFUek5XWSSFH+cQz3GdD
	BTabuDy+ssoMekIEatP8/MrkTr7wsWRUzlh/l6y4r3zyAQv+LoaHMIkDQ7vCc8kazuSxj8dvUGg
	MNlkGgYGBWNLboMzY2mg0UkBgFFjfyVu73ZDCQZ357KBsTxtmxb6iMQAcUASMRTUUwtLpxIIn08
	/zq83K1NgU3XVTQC
X-Google-Smtp-Source: AGHT+IEcPAAd/YdhD+Atm2W3Vnu34/pb8kOdXsK5MR1PkYT0dx5fqZg9D+xlK38+CA7lSZP33riAiw==
X-Received: by 2002:a05:6214:da5:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6f21413e725mr180382056d6.1.1744583770550;
        Sun, 13 Apr 2025 15:36:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea104f4sm71033126d6.110.2025.04.13.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:10 -0700 (PDT)
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
Subject: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support
Date: Mon, 14 Apr 2025 06:35:00 +0800
Message-ID: <20250413223507.46480-7-inochiama@gmail.com>
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

The MCU device on SG2044 exposes the same interface as SG2042, which is
already supported by the kernel.

Add compatible string for monitor device of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


