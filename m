Return-Path: <linux-i2c+bounces-421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B72667F5B70
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 470EFB20E6C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF05224D4;
	Thu, 23 Nov 2023 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njKKRA1x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC84D50;
	Thu, 23 Nov 2023 01:41:03 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-548b54ed16eso899757a12.0;
        Thu, 23 Nov 2023 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732462; x=1701337262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=njKKRA1xeZ0YPPMTB9xB3fUKJ9aCj4TrC51CWaENnDqPGU8di8X3WBiAslbmRbFFt9
         goHIsDNXzchKvUQ/zdOX0a1IA3XvdcCfjeC/KN46y1ysbGzywzKq3PuJECAZHhxtGiLo
         G2QQ0+U0DHnmgVrgNjg3Y1Uo/8PR3WQNwIUWzzQpV8Qjw4fy3xLimerLI52kAPzu+wev
         eK3D7qI1VXjYwThjgaR6n2rEJNDnPGcwUe7MOqsI9ZnFixYN/jEaTQHfgIwmXTRl0ANW
         AJwvZL4TRezK7rAnGpELy7t96SY2lxffEfIn597LbV8M2XgkL0HPF/gQSV9nRK7SMwHr
         bdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732462; x=1701337262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=HLKbzzfbEZ2J5KV5llYxY2LIuhoyQPldLL5xYCuLnUH76d1EjFn5JRQlZvFFtLp73o
         t3PKfso+mcqaT41ytAhx9ibgitfbVumnfCXhmkIUTfuVUQ6Tki+HNiUbMVKTWrb00D/G
         qHZu+N7cqCkNLI4eXE+3Qmv3VKZh/waofz6rEBZ4H+4CWlwnKsT7thwqvig7BxJ8q2i4
         M+rAJX2tHdUAiSSXf5j5IeMOoPZGQiWPhF4bhwSsC11KCSVKedUfVgCUplg0lQC2ltsF
         9njM35ce9zL5KNPCfjD4HCavvD1o7h3zUnAye3nIecKEY0IvMl0pSmgDEkjIB6vdVu3U
         2Uyw==
X-Gm-Message-State: AOJu0YwXTp4TnYU3NLWAUZfk5azdP6hTnD6C+jfHjqriyVy7yus7deqq
	g67pb6hTHAkFB/oTwyijXogNkZERp/E=
X-Google-Smtp-Source: AGHT+IF2ce8O4Dy0JVMTvh8ywPgv8CHjTNcsicVHS4uyWnf5FWv5HXbuEkjOnpvoMHQySO7ke4A8Qg==
X-Received: by 2002:a17:906:8a:b0:a03:d8ea:a264 with SMTP id 10-20020a170906008a00b00a03d8eaa264mr3680644ejc.2.1700732462058;
        Thu, 23 Nov 2023 01:41:02 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:41:01 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 20/20] include/linux/i2c.h: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:40 +0100
Message-ID: <20231123094040.592-21-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 include/linux/i2c.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27..d029aade3 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -850,7 +850,6 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 
 /* i2c adapter classes (bitmask) */
 #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
-#define I2C_CLASS_DDC		(1<<3)	/* DDC bus on graphics adapters */
 #define I2C_CLASS_SPD		(1<<7)	/* Memory modules */
 /* Warn users that the adapter doesn't support classes anymore */
 #define I2C_CLASS_DEPRECATED	(1<<8)


