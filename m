Return-Path: <linux-i2c+bounces-263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A27F0535
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1635B209B7
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9DFF51D;
	Sun, 19 Nov 2023 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcQ4r/p4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F2E115;
	Sun, 19 Nov 2023 02:14:59 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso4889369a12.1;
        Sun, 19 Nov 2023 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388897; x=1700993697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=bcQ4r/p4g5MsA2K0IEOyDXeULdNNaR0tSwjsMr9aJMeUlkLf8lGrPg/2q2GiUP2f3b
         39ixI6Vlps2Tc049zI/7RTMiZiip4uI8Gj6xt6fwDgqqaB09mw9IhPfXcJ/tGR+vkQiw
         b8H9nL4zCBZVwTvn9BISahT0kj/woVw/U5koP8+EHAa3hnh+Z0f37nNxSzy2RTPZbyBf
         GuxaU2Xp8LajvnMzPSmTV2DCmzGkOWA3OIAtY+NywCEm9Em/Zrj6QOLRw5zncoeUF4q0
         xDjwj+6o4SNiBcCSDB/2yECqOZ1WOvjPB5y0R/qB1l3QH5qOA8Uf8XtKCC6syt1vezjb
         pKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388897; x=1700993697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
        b=DROcdVrpHy5rAegiCd3MoiP/6GtD6q/HYtCubi3HA8pNtZXuFI6D3PaxKVcDPqwqXJ
         l9R3ZLzrVxNOghmiTuyWUdW4Z+rsEHmfeLXt3umSaByPWNYQQD9mjgjgX8Y94uV+0fCS
         809p80N5fkiJxgmBRo7DTBsnQqgZyA8M3XWlHynvqsRQcPGtEdTWzpH59ZBU3veT227e
         Na3fkTSS4+MfAV2srueZRmBASfPq6dMApITB5rLfjAqT1bBhqKTBkQbdKWL+ZXSnQjHS
         tXJrs2khHwhx2qUq0dmKiDpqhjzkesCHeeQgEHQubCXTb7o/TXP7yPstC5Vk+MIwNNWk
         HAGw==
X-Gm-Message-State: AOJu0YyKi4h07TJq+kqS6huOyxAfLreh7b8gxN0gN2fgGl70v4POlp0f
	W9Tn0nTaxlIQZPr8pb0aJ04=
X-Google-Smtp-Source: AGHT+IFOvnTj9XaGTXmf0kg4u9vN5bhBNAlFozIlZLALi3K4N5pNEJsRCsiqKinvY6T58jw2eiJA3Q==
X-Received: by 2002:a17:906:1051:b0:9ef:c408:a4fd with SMTP id j17-20020a170906105100b009efc408a4fdmr3609738ejj.14.1700388897489;
        Sun, 19 Nov 2023 02:14:57 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:56 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:34 +0100
Message-ID: <20231119101445.4737-10-hkallweit1@gmail.com>
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


