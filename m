Return-Path: <linux-i2c+bounces-4387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621091A20F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2E21F22381
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 09:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F201A13A400;
	Thu, 27 Jun 2024 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHyXR2mh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7211386BF;
	Thu, 27 Jun 2024 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478884; cv=none; b=RV70OUdbYM5oFpE/4OJUowDTiVBvX+AObZrw6/9z6JLCB/M42J9CsKR5nebRfIlje4HvAsHJjLZVcQp23xS5X6Hx8q7HwPHPdrnQgKLi4duAWMmKImYm8yWZdBPJXfU9xcaFY7lNASrkY8kWz9iGFeHD5nIo5tBDY+0eWVZAwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478884; c=relaxed/simple;
	bh=5A/LPrJoCxitojeJt7eBlNk3snz2b7ebrhihpRcHwVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1BoQU78/zNMLyN20wpKfwfU5BvXQQS/QCbb/q7GjBH5azWH8Q/62Fs/i8sB5jYiknktn8XFxjrMyEt2FcgVYpa9xGIzpbgM1Jbndrm98HrpVJRrIpJHO3X8/Ot8ga3n2FTfL0UkM0umJdIXsUmJXhrT3QA1YnvEtTpYBRj9ch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHyXR2mh; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bbf73f334so6288909e87.2;
        Thu, 27 Jun 2024 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719478881; x=1720083681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SI7tOorPKK3iwm2YfS1Q/1Qsuj151Q4jTdztaPUQtFQ=;
        b=SHyXR2mhwXw3kShCe8x1BksZ7GbPG+xNbX4idpEWLSKhqQXodPOIpJMOESJcNkhDRU
         YqWzwT7yNVuoUN1NAxDQhUn2BdteBO15HOY6oW2y5nG8LJse1nJ6NvlyuLROpfnL9LMa
         H93MXWzIucNKjMM7OWDNf0LQp5ofRP4armJOuhilvj/dmiTO5OZllXeWsLdVE6g0ujsO
         QDTJcj3HrXL84Ipg6EgCwkMfXXJG7Hts7VMZ/u8MU60pdZE/XfjF6XGcDH53FFL4AjHh
         GorrCfdlzjTBfM+WRCcJRYI0wWDF4NLtDnsNXKRpjtvW2ofRPgY0wbujskh6nUacuOJp
         ZuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719478881; x=1720083681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI7tOorPKK3iwm2YfS1Q/1Qsuj151Q4jTdztaPUQtFQ=;
        b=OO7nNn+7NqEIAb/KyLQpqjC1E3+Fh+Xdm5qQ0cY2RzF69Gzpm4xeq79i5CN8zfKBFy
         fXdqAwsYg1nFGbNj/fDm3nYYdxjefehXVMJHrge2K6J/eb6G+3nc7pl0N4jHTjU0TRlR
         FAiplbMP0AnG/bW89rf9SWVlUKm1zo2vVQ+wFHSvLglrjTgvcveHYb7XC7X+1u+qL/8x
         jaPLDoIKlyaiVWjL3gbskwYC9ZBPIez39AVxd6DJheWsSUfMmZdpGxhFX304Rp35xos3
         x+Rv6fiO+U1DRm64lsusWnsO+BX6s9EgD+7MExfDgDi3Y7JMDDxM1becII/vhUKpj4cw
         geiA==
X-Forwarded-Encrypted: i=1; AJvYcCU5nyYgZmRspNhf59hQe2eUquYL6SkKezeyHjv34q36X3Z0vetrsxJSbYhpINxpxKmxwOxCE8nTtIa0TjU9kZodaKPCq7TnoVASMvwIvOjDMoOJGGXqn09Xq5Ps5D6d2NJRn4n10KYbjz9WWsFt7EXi3zo0oetaMA8KHgdn3iS3EZ3nUoBtjU9MPJuuaqp2hF+v2sVhUT9FzCi/fGBPrQ4=
X-Gm-Message-State: AOJu0YwzudYgjucH5+45cWRUhAjWM3KOtBGU7JMUVKjA2VL2K6m6M00U
	0lyQTXzJfDJCeDhjrt5iGVXB9M2wpBS5p5HvKHv2ESIqD10aHwXa
X-Google-Smtp-Source: AGHT+IFlNM+z2xuj0uppOgqowRH3mZHYrCPBPmdf+/ZuOKMUKMZfHOKtoGpGzGI0QrQYdNFISNDP/w==
X-Received: by 2002:a05:6512:2399:b0:52c:e36f:369b with SMTP id 2adb3069b0e04-52ce36f3750mr10128112e87.17.1719478881063;
        Thu, 27 Jun 2024 02:01:21 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e712a75cbsm128557e87.38.2024.06.27.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 02:01:20 -0700 (PDT)
From: Alex Vdovydchenko <keromvp@gmail.com>
X-Google-Original-From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add MPS mp5920
Date: Thu, 27 Jun 2024 12:01:07 +0300
Message-ID: <20240627090113.391730-2-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627090113.391730-1-xzeol@yahoo.com>
References: <20240627090113.391730-1-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MPS mp5920 controller

Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index ff70f0926..cb2fc26d9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -296,6 +296,8 @@ properties:
           - mps,mp2975
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
+          - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. digital step-down converter mp9941
-- 
2.43.0


