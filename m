Return-Path: <linux-i2c+bounces-274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8777F054D
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2B91C20873
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1CC101DD;
	Sun, 19 Nov 2023 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6jln9fU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFAA1709;
	Sun, 19 Nov 2023 02:15:11 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so135161266b.1;
        Sun, 19 Nov 2023 02:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388908; x=1700993708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=M6jln9fUkgewdmvnczmulUTV6oqykq0OMoxT/5mcQlCWMGdCV1bhOhS85/pQt+hi7i
         xqWY+C00R2ZWnz60tmd02dT0Jy5TlAyBjv5JDFjsNBx224Xt+e09anSjNLBLl+1T9tq3
         zUcfOlVWlUP5YakOVUGW8JKVwY4YHpGVcXttNL3Ep3PVGBpBU26wVSjVtCKMyW7fQ3rq
         ZCWpQXTV6Ji1re4k7LoHe6hPHI10bVKSwWxYJ5gH/sn8/gDNL/Dg9myx749POv7C6AjB
         Gyg8SSCgOVvuzHz6rOjgFIANz1inOAG1ArWGm5cRD8JRhPt6EFipuaMNO7W8z9/8U5+X
         FdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388908; x=1700993708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=E3XYEJq/tbl2RG2gGxKTZI2sCoAYYIg6uuayEurtKvDaqg04kO0uugctjyz3htMVfW
         7JRoOXySj40UPlm1H9nS0yobS+02RX6Ta0tDP9QSTpwUY6/gOBFOtOI3jgRARQSLO9Or
         ufenN8ZYjxx/l8ed0OJmpgDBS28P0ZVjC3ixMdwVQBfDZrT/AmfARrHKv0Gn5Ah24B2c
         FchwlHzzbkveN90ao5KVnScedqMJKSD71QohwdgkbTkkBbXEwtthgSAaPhSyDMiiB9yr
         S+ng0xUSNzKMOG5sgmu7CbcCMWEtThJoUca7gomzs4/gQ9G3Q5bSB1wXaDWKbCm8tHXv
         zojw==
X-Gm-Message-State: AOJu0YyCVIDuyojNsiatJZnlw3LT+PBNPk+3Z5ps1/rnVpc1pE5aVxSj
	0Pnf1BpcHG1EDb/AuzoTkgY=
X-Google-Smtp-Source: AGHT+IHBBU4A879yc8p98SGEGVBECKnaRsYvgCBDmx1W96yX6LP1hBiiqPZUfI7tnc+O2wj6VKgHPg==
X-Received: by 2002:a17:906:9c93:b0:9e3:85c9:11dc with SMTP id fj19-20020a1709069c9300b009e385c911dcmr3533958ejc.32.1700388907938;
        Sun, 19 Nov 2023 02:15:07 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:15:07 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/20] include/linux/i2c.h: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:45 +0100
Message-ID: <20231119101445.4737-21-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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


