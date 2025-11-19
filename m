Return-Path: <linux-i2c+bounces-14160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52AC6E56F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 12:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 1CFDE2E393
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31693357A2A;
	Wed, 19 Nov 2025 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC/V+j8y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259DF3559F0
	for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553211; cv=none; b=IlRw9wc1p/sHKJ4jROUhIzrD5zvPly+bJ62tks1x/U9H4KAlHa1Ajw9PF8IFln0BwMmU/bicOfnk3CZuggifWeA9YHnJFOImEHwCr3LujVqtDWZnY63uBKC+38KFFw7991eanJx592XSbUbF6inB1N8YaNHMsZeBE7B6KlZcl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553211; c=relaxed/simple;
	bh=wTE8n3djZOFBW0Hn/pyVrrtw+swJ6pskokEvgXPqj2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJ3I5RKbBG8w6p7nQ3xQ+TFpIesNJi2BXkAoERQmLQuTgFGSIYOZBy0N3ldJQoSi0gSzxF33x3yaiwMFphxahF1RdPOP9zDEdoFmjOz/VgcmmvoJmG0DOd34FwBeqMDxmOUXjCOcNQ2XE21aDDWfiqpP9T1zKuj7HWRoOwTiwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MC/V+j8y; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297dc3e299bso64614075ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553209; x=1764158009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkVhmhWJH2xsEzSbcMaRRrW6ia9B2Vv7NsUx82PuIzs=;
        b=MC/V+j8yZkSZtYDt0YjxEsfgLRa0DgK7gA2IeIk6EFz4AimsVLW3vzADz/vHdRt6Yq
         7qPUzkmYPCJURsdp8YZiEdIMWDVMTOr7M7FcK0jTQS903asVqBB71A2qjpEtv8xg4FIP
         CQjXcsMBXXABT3a5Tvyef23BR8OJg6i9E/TqrWaloYJhSON+pKviL5mrw8Xwyk8qWUDJ
         wZiYP1HO9cknnpq/i+U7OOJSnQlnuGxo9+VYAIg9jLgdUbLQpN8KxZbVULIQ6A7fc9p2
         kvNbzdylhbDfvBxBuzGi3kjf+gRfyUAy2lD+TI51pr1/tK2NUypkkfVCug33XwToCpxi
         bBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553209; x=1764158009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkVhmhWJH2xsEzSbcMaRRrW6ia9B2Vv7NsUx82PuIzs=;
        b=NNZ/T2ahNJsTCvUt7fMLvmwK7Y1JB76J+5Y6xcho9LXkpisJZ1Ihs/K0mti/cs8EDe
         6CVzTF9BXG94FuhULJIHmRz1uFaiwuLttkLEc7vVTc+09QfXVoswGfpUIx89Cgoqv5VJ
         ih99qAtIvGpxJY9nd+CWnvh7e6Isn77kYKHY7XxXxc1kFCs25T5P0mO4p6NKkZdYD+1k
         k1odY3t+qfLnj3UKxhYJ6kyP+FvyNqR1pd+HmrTElbIMDucJUywTWKkyx/CXxp8b/+Mg
         E5O0noCWPLq/KzMHhfNgXWqgsSWD6Mf58vS+uwc+7oskIQjVMw/x/u4i5FZwMM2ZH2RW
         ERGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb4wWxdT5ZqJwguryKQf3+tUmkYvdikRWTKSbMnBzM5H+u8mZQp39ZrIAnkMSKx0uf1aFXb9g+WOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyByAQGQF1pE6Dz9h7mAjOlvklocoYKXILdzdtLgR6GCwC0tFD
	LASo9n6y39rEiqIe5030Tb+Gn499jg4fvTKivgs/45k5tTuQ+kaEIPkgFa+UGxurpmg=
X-Gm-Gg: ASbGncsNZ/A3eCr2cbTiwQW6g4onMse/ZLtbjmCa5nBnnO3n6ewrwJciGm1fZJ2BlCm
	wTm4pkDNOATE7oqi4Jw9F+cXnq+hB/2OMsurjPFI/zBcINkymWZCj0EIz/byX5I4dVwUw+h9CZ7
	HNtVJQ2ToDmD52aCWwTRM97btRErGxDxEnJBQZPn+kqcTO7G84qbghzgqwNjyXZ0oQ1L7tCDrns
	4uM9k5z0f1YOd7kZ8uYVjgO9pkapDdkR+CDwEibagmLJCrpanZmuWkSk9rK6mwAQiWjrYB5yOxU
	/CoEfye0j+8kKSDpVqhb/6VVSBDEJfo8dO4/s3H4pD1hz3EwRO8iIeF3CDPdwYMgJgoaQQ+0Oyj
	IgTsjFITnUTCgYuDGkAbenpDq+eD9CH8YzF1EH8MJhcuEi9qiUyDPa3D2DWMPBy9Hk3LcWCZRgO
	srRcxdcqg=
X-Google-Smtp-Source: AGHT+IGL6W4IRdUG3Pykh/ul7KcrmSUrOtfZbl9NcCQYrIiiCus1KZ/lienOW5Q0rnK8Jh29js+QlQ==
X-Received: by 2002:a17:902:e788:b0:295:ac70:10c4 with SMTP id d9443c01a7336-2986a74b0ecmr232959175ad.47.1763553209081;
        Wed, 19 Nov 2025 03:53:29 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm206818055ad.91.2025.11.19.03.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:28 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:44 +0800
Subject: [PATCH 2/3] i2c: k1: add reset support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=1326;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=wTE8n3djZOFBW0Hn/pyVrrtw+swJ6pskokEvgXPqj2g=;
 b=5RS6cTQPwPDN1vYMenh1/T6oCu1CCVSmO2dMgtFDaHcqcKQ5jm6tl9fU0b/ialCby2DQo8WcY
 UhTQmN0qij1BbrInMIivwpwRgL5t5RjCVIFFOS2v5J35vm0U4BBgqtw
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset control handling to the K1 I2C driver.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612..64d817d8315d 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
 	void __iomem *base;
 	int irq;
 	u32 clock_freq;
+	struct reset_control *resets;
 
 	struct i2c_msg *msgs;
 	u32 msg_num;
@@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	i2c->resets = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(i2c->resets))
+		return dev_err_probe(dev, PTR_ERR(i2c->resets),
+				    "failed to get reset\n");
+
+	reset_control_assert(i2c->resets);
+	udelay(2);
+	reset_control_deassert(i2c->resets);
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.25.1


