Return-Path: <linux-i2c+bounces-113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A77E9AFA
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92D4C1F20FBA
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF141CFB2;
	Mon, 13 Nov 2023 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipzaTwod"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6941A1CAA9;
	Mon, 13 Nov 2023 11:24:12 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0564ED66;
	Mon, 13 Nov 2023 03:24:11 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso33255075e9.2;
        Mon, 13 Nov 2023 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874649; x=1700479449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=ipzaTwod3GdrFmrSA/AU29Avlo5JKerlODNEjy3PN9D8oGpmr0nLbslPo/AUr/okcO
         SQ+KIYPxH6wKoZspnJGlDpOQdDI/HnmrsMqarOM/K/5Sy06PFp9z+Zr9HeqR5zLWUEN/
         3GPZVig61tHHGFUg8otoHuMTM6+mYBWTCf+NMCgA0NTysMYoO55Y7tWHgZvJxmuv4a29
         wWQGuMI/vzexspXgjE2D6RGktU66ZZLSaL8d4h+qGlQ+RB+4KMcPzoxP0PSgDObPEDEl
         HwLLaOTiaQhLRYxRvxZxckqHBQsBGRpFVcoMG4s9ykUSoJvKEFgtj7R+FqxcvSQa4OpX
         wi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874649; x=1700479449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=OGLza3mqn7fZ8QbK0z7ImQqXkt6q2qCeCfA992DgQ9K8w7aQhH7pkUaXTogEmE+utQ
         F+XN7HzHT0ccApkLThmUlgf0sTQ363MgpdKeneWnTIVqNm6TH8kuMMmFJfckkh+etjTm
         Fi6lGcngi8Qcf+u9acg/kYuQCwGA3SNfDXxkVCqLmX52V4vMdi6TQlkrO0uzmiwFo4ki
         sB2YC4HIP9lN9M6wVzMI7W0cbNEvB9EliX+8euMWAWbF8wyON7Q4HBOxEAxRdGaBW1K5
         Ln1XiUzcZN/C4Inq5jXZKBO87yv3jtJHMO2fH5333Nw0GCL+qLY6E7I7HfqSkneIXjfX
         OYlQ==
X-Gm-Message-State: AOJu0YwDhPmmH5o4PNP6VcwJwQXcFdC+zQeXfapjMZuTurTGGpjk9gbE
	QuxH6bp8wib+OteuMwXYq1c=
X-Google-Smtp-Source: AGHT+IFWxagdYbQ04Cy1zXQ8J3RXxuSkeTrcraaBkbbYjfhgHWD8ZbRjLDfDALyWkgIWGKQzSnNbyA==
X-Received: by 2002:a05:600c:4f0e:b0:406:5359:769f with SMTP id l14-20020a05600c4f0e00b004065359769fmr5703626wmq.0.1699874649154;
        Mon, 13 Nov 2023 03:24:09 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:33 +0100
Message-ID: <20231113112344.719-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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
 drivers/video/fbdev/via/via_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c35e530e0..582502810 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -201,7 +201,6 @@ static int create_i2c_bus(struct i2c_adapter *adapter,
 	sprintf(adapter->name, "viafb i2c io_port idx 0x%02x",
 		adap_cfg->ioport_index);
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->algo_data = algo;
 	if (pdev)
 		adapter->dev.parent = &pdev->dev;


