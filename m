Return-Path: <linux-i2c+bounces-8788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0F29FDBDD
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 19:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006953A13FD
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 18:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964E7192D79;
	Sat, 28 Dec 2024 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSVARfaM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7E15990C;
	Sat, 28 Dec 2024 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735411413; cv=none; b=IfY0ZvqHFObeb7j+Ut+jtIX6k3tVJtsWzFHhZC2XHg3yrNhTnDqErXBo/zHnF2PPlGP02l9pZWnvHMEpMkr0WabUHaRalCdHpLCvGdccTNJrxGu+jIXiVhNlApVINrV7QXrIzi9WB3lJTkZfiaTzCu6HsjCYiM2DzorhI19DYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735411413; c=relaxed/simple;
	bh=b4YAHP/NqGIdpBMyg571wN6VkaTKSOFvmBWPQXzDzdY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=JhgJFsvEZOsypzSBmAAE8WYVzWRo57Uc6vM9XfxdfwAFUBCSDBysgN3S4caSn99QMw9eS3ygqW7nhyNsVnpts/pb42mnYOyjnfYE6jXgAKZ4l6dnmMsmLigWPyHEEy39oAqpAp6/TMRM+jVoFktjIFKjv1HEHs6h86m4JB9fNgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSVARfaM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so85423005e9.3;
        Sat, 28 Dec 2024 10:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411410; x=1736016210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/iR0gFEYs7f2gNk+zQwj+MOFDfQzmKI+7kUoHj4NKA=;
        b=nSVARfaMp8KwRVslWY9HcMNp91ULjsbbHsTqebfIFlDSu5wqZlUjfqU93iD8xdRTSa
         0qCO4Z0l0Ifx+Gb20gpnEh7rRX141vC9hsby95bYNeIjAVNuZeCSPbOymxt4b7fcnY25
         H97F96eMgC2higp7MEAAlaivn5rt0Fc2a6jowGwTibQ/jk4Ya1oho2/at5hTbfyF7AQT
         Z+UNQqB4SDHnfqbg/cVD2GxmgiLdjNCHRV6q7VMFGlVR8Rqo9HpTVgkMo2vBS82g59YY
         HatcugiyspiWfcT7sCPy5NNlYWbRfvmJCuyDwDDFI0pvJ6Ynw5p5NNrkpcQ0zFOqrXM6
         f/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411410; x=1736016210;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/iR0gFEYs7f2gNk+zQwj+MOFDfQzmKI+7kUoHj4NKA=;
        b=WQA0Gl8PovDFbXAiMmf3TSX69X3NXnTYskXLFwFl3cC6U/60pq8Pj+yLCFP7DFYpMf
         wqr4Uwl9IbguyXDqoKjKj/kqCHjaSPlT6fxj+PBXhdt6O572ujHtd6UN0QN6Etocoj+v
         VOyMnom3ZgSppXk/C93BVKGyFQ3pKqlzb5skfVrZEmJ9G1WElTVy8SZmrQT56PROR1Af
         c6vw6xpCGNzBaXxZ/3liHzp7DMAWn87PXn7jhPImfl/r84MMFmlXgXx/yz5u3ExEl2O5
         SizZu0n3xq2VspLiSHk5npW4e/1LhFarDhzWRrh3RaP6KF5HBL6ZB5S4CyHI9pyyygk9
         /Khw==
X-Forwarded-Encrypted: i=1; AJvYcCUMutUm6XpezcaFI0yiw28mqc5TTdwcMQKITpHVgBlqZIj9nJvlYFzOB485u8VfiYEGBTxCHASfwew=@vger.kernel.org, AJvYcCUcdCaHXi5mqv6zG2YZb9TkXjnSkNP8ceuAAfPt8BQ0ACt6ubanHysboZ11rC/t1ZXOMeJ3SgZQtITNsGoL@vger.kernel.org
X-Gm-Message-State: AOJu0YxrO0UlIvWrAvDWbWAZfyHUW72CsT1K4tQ/10UaRW+P7oR7NvLV
	/wDHhBDC5414LzZXhm8i0w4S/gEnjaKGEtvx7uvl88LEfZHaHjP2
X-Gm-Gg: ASbGncszDk8siJru+3bqiePtb8f9MIoybFmkEB7tEJE1xprVMrPWwL+qMHHjM50EpG6
	xqmnemwbruF50CCfrgoiFAZUYdQq75wEZ6lE0YLYopwl4VLFAHRdquc7cv4RU91qg9UGbeR4n1W
	niCOSI+lmXTxRnIZs+n44x8R8x06EUAfMQ3iuv0nxNJwhgc2N+4bSAzSfJ0poaYZ8evzrmoo5jS
	5ShcDtsCH077teRTsD9sdj+kU8QLu19LQh3JhQYYnxrJP24425i0fjYmFAJ/bDcBf7V1x7y6h15
	CHTB123LF+fi3eyxR+fCIEM=
X-Google-Smtp-Source: AGHT+IHdY/66BM6Eif1fpm76U1/JH008dakmpoPtAE78HZwCyWXaGk+2yibGNY9Pk8AJs8eH8JljgA==
X-Received: by 2002:a05:6000:1fae:b0:385:df43:2179 with SMTP id ffacd0b85a97d-38a221eaf62mr26059512f8f.17.1735411409670;
        Sat, 28 Dec 2024 10:43:29 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm337727275e9.3.2024.12.28.10.43.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2024 10:43:29 -0800 (PST)
Date: Sat, 28 Dec 2024 18:43:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
 masahiroy@kernel.org, u.kleine-koenig@baylibre.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Subject: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <20241228184328.5ced280b@dsl-u17-10>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Commit ceb8bf2ceaa77 ("module: Convert default symbol namespace to string
literal") changed DEFAULT_SYMBOL_NAMESPACE to be a string literal.
However the conditional definition of _EXPORT_SYMBOL() was left in.

Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
extra _EXPORT_SYMBOL() wrapper.

This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is included.

Fixes fd57a3325a779 ("i2c: designware: Move exports to I2C_DW namespaces")

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 drivers/i2c/busses/i2c-designware-common.c |  1 +
 drivers/i2c/busses/i2c-designware-master.c |  1 +
 drivers/i2c/busses/i2c-designware-slave.c  |  1 +
 include/linux/export.h                     | 10 ++++------
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 183a35038eef..be5850330c75 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -29,6 +29,7 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#undef DEFAULT_SYMBOL_NAMESPACE
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
 
 #include "i2c-designware-core.h"
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c8cbe5b1aeb1..083c5961d189 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -22,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#undef DEFAULT_SYMBOL_NAMESPACE
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
 
 #include "i2c-designware-core.h"
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index dc2b788eac5b..72b973afb0ec 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#undef DEFAULT_SYMBOL_NAMESPACE
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
 
 #include "i2c-designware-core.h"
diff --git a/include/linux/export.h b/include/linux/export.h
index 2633df4d31e6..6cea1c3982cd 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -59,14 +59,12 @@
 
 #endif
 
-#ifdef DEFAULT_SYMBOL_NAMESPACE
-#define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, DEFAULT_SYMBOL_NAMESPACE)
-#else
-#define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, "")
+#ifndef DEFAULT_SYMBOL_NAMESPACE
+#define DEFAULT_SYMBOL_NAMESPACE ""
 #endif
 
-#define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
-#define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "GPL")
+#define EXPORT_SYMBOL(sym)		__EXPORT_SYMBOL(sym, "", DEFAULT_SYMBOL_NAMESPACE)
+#define EXPORT_SYMBOL_GPL(sym)		__EXPORT_SYMBOL(sym, "GPL", DEFAULT_SYMBOL_NAMESPACE)
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
-- 
2.17.1


