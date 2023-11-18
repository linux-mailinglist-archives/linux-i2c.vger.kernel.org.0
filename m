Return-Path: <linux-i2c+bounces-249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 690767F01E1
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 211882809DA
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD01182DA;
	Sat, 18 Nov 2023 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRZmBh7I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9371CD6A;
	Sat, 18 Nov 2023 10:05:19 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9f27af23443so421494466b.0;
        Sat, 18 Nov 2023 10:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330718; x=1700935518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmI/uIQ6Rz6MtRkEfeCIhTUeSTfDQWhDOaE2Jo1gHkw=;
        b=HRZmBh7IUYYMa530NGuK8Ff3IHau/Ccrv6Qg+Ttx2kewmlpr4RxilAeum7zeDdsmfL
         G3xuiCOcqRwiuMYSEYjeqpr6ZPYti1fv2rKdJiuAFevnQwqn4V2z9jah5bcL52rWIY1w
         r2mB18Zy/Tf9Meqhywbit8Bg+HKZRDxNoDw0bfwKlcn0/Ov6Qc4VmgAHKOW4/fI9QH1i
         Ak5WJOnxa9rJDa+v7WNCAfY0nPqTWpoFK2niPnDcDXWrHtjr4f65ueZVCIhOom9ikT4K
         OspZ9PR3v0/ALedf6tPh5cedxXHloW00MVymoleqJxLdsfmko2o1JjP5aRfAK9/CnV/v
         xWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330718; x=1700935518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmI/uIQ6Rz6MtRkEfeCIhTUeSTfDQWhDOaE2Jo1gHkw=;
        b=vkth/Me8vgUthKtt5v2j5BedrF5diESXETKT5zfMKa7lpqmnRWZyrCLp02xBO2ppOW
         83Q7JpAk30UbB5dh//aZGGq/Iu5skGhdfhaEFdwfkncmkJHlRPmc9hhM3sYlP5pNT/Z3
         JScvUyvmkehVGbMjqSCsYHT9ac3XVK5A8Nx+rKgkd6uv/kN9/6gsBg040l8IUghvManp
         kjMs/ulV4N15k0rPR6GYM+c+MTUNB6gMEROrT5ewJOepvt8z9XTlAwC8J9Sugc2hZvXj
         +gB89WlS3I4hP8Bxx0Vk5kHP+mOZr14fYahVL/oXjnOr5xiSno4Ugr0Mh04FVwb0Ij++
         xTlQ==
X-Gm-Message-State: AOJu0Yx7P33G5J+uXFpbWopPz6zn/aE/OULms3AQDBf5KuNteUzIILEY
	aBlFs3VFIZHg2Rhg7y7Y0FzGeAA3euuCVA==
X-Google-Smtp-Source: AGHT+IHWPoffzAv/aTUexjLqOB8A0X1efasZC9F5Eke4ED6ToM0RGcj7WBEYnJ8x4ceZNrC/IkyHTA==
X-Received: by 2002:a17:906:11:b0:9cc:450c:b0d5 with SMTP id 17-20020a170906001100b009cc450cb0d5mr2292468eja.4.1700330717822;
        Sat, 18 Nov 2023 10:05:17 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:17 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jim Cromie <jim.cromie@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] drivers/i2c/busses/scx200_acb.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:05:03 +0100
Message-ID: <20231118180504.1785-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/i2c/busses/scx200_acb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index 83c1db610..3648382b8 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -427,7 +427,7 @@ static struct scx200_acb_iface *scx200_create_iface(const char *text,
 	snprintf(adapter->name, sizeof(adapter->name), "%s ACB%d", text, index);
 	adapter->owner = THIS_MODULE;
 	adapter->algo = &scx200_acb_algorithm;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->dev.parent = dev;
 
 	mutex_init(&iface->mutex);


