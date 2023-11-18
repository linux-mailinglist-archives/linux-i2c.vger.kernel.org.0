Return-Path: <linux-i2c+bounces-229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5667F017E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E6201C20948
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B4F1A5B9;
	Sat, 18 Nov 2023 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFDf0ECM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE6AD5C;
	Sat, 18 Nov 2023 09:42:36 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40839652b97so3845175e9.3;
        Sat, 18 Nov 2023 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329355; x=1700934155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=CFDf0ECMMfTm14EaVtSM3hhI9MdarvbVPU9OwjrfqOwvYTG0og1K2iEuUqmaWwKYbw
         nwy08OxnHzMJYSmRl/VWE+Mas643cgPCFG49TcgSMJU9V2SX/qMTus01XwodpC7lv+01
         0t/+k1007yYL4RfNvX6Xa1ys467+7RE4aDvIsN1Esv7MfboeG3x7Y2H8WjxxzGPoKIDo
         xA6/Nb0PgNH78v6sRh6faFrpM17blkK2j/ydwr7slud5Lqb1jldEtd9YrZhn20WDpanB
         eB/LPnFomIgo8THghiB8RJBkpEQJ2np3osYZ26RDF+Oft0k5qXeLnu21Lb5RltyP1x1D
         sOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329355; x=1700934155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=IJxoQxq7iEcqq2kP+mJ358lktkgd/rAhxW3Wdy4v/+ddSCEA8SXI+r3hvv4Dt2zBhZ
         bNWxPxgXJyPF+UZhovx34PVJ79JTs0iwDBeCGz6yLlzO77lGcuVpb6Ed1+PK5Pf90tRw
         eCvrEm3HFpKcaZ7ORqmUgzlgHN1aEB8C9B+3HJYHtojLLYXFIF4RUnJUKghShhjg8ZQD
         0pEGSa67nkc8jZGEAiwX7teKTcK17iXWuOTAVnIT4HLcjD8MdavZQTJBOyRS4lLlGFSq
         1/2H9pwSKmI5hYPM4UNiWTr/dowXtgv+dAGHXVNOC9fsXeTAL1xWWY4w2HACnA0eVCuV
         kGog==
X-Gm-Message-State: AOJu0YxMChFWGQGsDDO8h9KoK7Jn9LLAALhXxZn/7u9TibNLScQxcde6
	4cAJqyrCwQYjS0x5v26phyxyt5dQZMI=
X-Google-Smtp-Source: AGHT+IFq5BOx+Vn0YrjLip0ldY3nSGhqRKbTkmX9+Fy3Wz36IeGI2djpG63W1qV3nbXzFeP/oHp0mA==
X-Received: by 2002:a05:600c:154c:b0:405:75f0:fd31 with SMTP id f12-20020a05600c154c00b0040575f0fd31mr2291085wmg.31.1700329354751;
        Sat, 18 Nov 2023 09:42:34 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:34 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:09 +0100
Message-ID: <20231118174221.851-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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


