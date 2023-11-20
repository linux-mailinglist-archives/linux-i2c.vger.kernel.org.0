Return-Path: <linux-i2c+bounces-342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C52747F1F79
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE7128229A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB3339846;
	Mon, 20 Nov 2023 21:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr76iPPJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CFBD2;
	Mon, 20 Nov 2023 13:46:35 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40853c639abso20505525e9.0;
        Mon, 20 Nov 2023 13:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516794; x=1701121594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Upu++zhA/RZdGnIiB8rFAnP6PssgAuOHlFea851Ots=;
        b=Wr76iPPJvPkqYjXWWz+EdxnnYzrl+7P+deOzHmv84Bm6378KjxTzxfEQA58+Uin/CF
         wbXR/mz0ypgb228ITgiFW8GNhXEh0JkTbGiah4knv3xoJM2qN4ElnvZ7tiFMobtOHHbT
         b6CblcTnNIQxgc87cnmIjHPmjGUpmCuWVh385rPC4bI2Ub4zJ1BCBuVVM6eTXJlkpEFr
         KblsTg54TgbkEupDqivRZdxLVYngs3QNvWk6OtZknh9blXNAQhReEsct38GwPqhgedwK
         sd/T6T2o4u2p+bM0QShmUedoAbe1SEHlwsNQ9seyR6S5vxB7u8Ad9QKPzKkO4SdNfR5L
         waBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516794; x=1701121594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Upu++zhA/RZdGnIiB8rFAnP6PssgAuOHlFea851Ots=;
        b=pMvafx18lrRcb7fK01TVzhW2d3hdhkTaQEkvSu/eOXYHVdwFbSHoFmCmB3tPDSEhO4
         KUaP1f39j6HjaT6Uz+KyQVeSIgKWJsl0kOq50QWBqk7IIXITh+stACkivBIIV3+kjLB7
         NVZdmYkJgV5/L4XajZaU0T4cWCudH4PTSXLHQLdbgNR++pgEteNu4fLV6XQLbYy/CKN0
         YfT8RP/ZuOxi5Uou9/RM5iwewFFFNvhCyGwH5MFGzuC9XrdW7ggt3zlEFbom2qYxHFwG
         U6DFnqcEMTljA33DBK+LrJu6GKN3v7CYCQcuaDwLBjnN/3d5WMkjdraGkc1yIiqg9nKq
         BFGg==
X-Gm-Message-State: AOJu0Ywz896XReg+7AQiLc0UuCSahqT2QnOMWkEDWrG78Ciqo/njRLUy
	1s01locehrqilv2EEtOd7bU=
X-Google-Smtp-Source: AGHT+IGShYbCS8GN/5rAfdvOMeC0Rmm3E5GPr3cI5QbDT98zWYVN+PfkHaKPIKb7avI0dpivwWZpug==
X-Received: by 2002:a05:600c:4f81:b0:405:39c1:a98b with SMTP id n1-20020a05600c4f8100b0040539c1a98bmr7120058wmq.20.1700516793380;
        Mon, 20 Nov 2023 13:46:33 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:32 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/20] drivers/video/fbdev/core/fb_ddc.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:09 +0100
Message-ID: <20231120214624.9378-7-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/core/fb_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_ddc.c b/drivers/video/fbdev/core/fb_ddc.c
index 8bf5f2f54..e25143219 100644
--- a/drivers/video/fbdev/core/fb_ddc.c
+++ b/drivers/video/fbdev/core/fb_ddc.c
@@ -116,7 +116,6 @@ unsigned char *fb_ddc_read(struct i2c_adapter *adapter)
 	algo_data->setsda(algo_data->data, 1);
 	algo_data->setscl(algo_data->data, 1);
 
-	adapter->class |= I2C_CLASS_DDC;
 	return edid;
 }
 


