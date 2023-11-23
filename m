Return-Path: <linux-i2c+bounces-410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C327F5B50
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BEAF1F20F25
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4657021350;
	Thu, 23 Nov 2023 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVwoZwgl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF62D53;
	Thu, 23 Nov 2023 01:40:54 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a03a9009572so79629666b.3;
        Thu, 23 Nov 2023 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732452; x=1701337252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSszigu6T9QU12VdWtO4WfxwIpZgiTTUkpWgQw1TPZ8=;
        b=OVwoZwglOywb8LudcE8l9Taw5B91vDI/Xx3E86YoRfHBu5WwPbvMDHC0uuqJN6qNgf
         KbUr2NIaSRqqaPC3j6razei9CupS3d/Qr6jwLGBusdcbtkru6uu7BK7uncvYZiYBYiW0
         9+GmK0elaZ8SDLsBEhz9+4sJJYNbDJwTZnUNk1DGEBHYd3/OIw0yq+O4bYrIqv6+/6zF
         RII2JWLwNoyAy/jeRUjJz7H3m5eZmv2wlbA9zK1mgc8XAVPG+OZaH1uZ4WetsIYKMCe/
         /7U408NBQhoO0cwj+OYEuat+S1urdbqbPbJLSREAZUc4y7XQB3wZTgeLZ7j3MZDmTbPy
         QccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732452; x=1701337252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSszigu6T9QU12VdWtO4WfxwIpZgiTTUkpWgQw1TPZ8=;
        b=H0Aa2ixMRRp2uYVJ0UA/yGa2dNxKS90UT9ua1SjzcuTDPIk4xng2y3tmWN2PGx8qIg
         aEGBK7qPd9wbF30cndQDOWE4kKtWW00OMuSqFNmXbAjkuTWBy/K6CR4f0axVxsgaHDhm
         eBnyP4b6BSpFU6SyqgmfRDvicaWUo9GotFqCfH6ihf0nsuPdKbmOkZhBQ+Yab5Pp7ste
         NztcdxLSqSgJIft9/iQJB5OQ6h4AJGd/o+udLlgm+T8hp9DB9ZagTXoP7yi2Ncnq9rvg
         desaqUm0ocx2nLqcjWsBshlcggW7WHr5SbcXu0FhYSc6Is7B/DgI8FwSAQ3KdbNyY6MJ
         wZ9Q==
X-Gm-Message-State: AOJu0YwgEFfmNO8FiWOoBpmW45X7wd51zHBxfTuI2YOe2X2R8g4Aj/DE
	05XBDuZcWZE0xByfzJTLu8k=
X-Google-Smtp-Source: AGHT+IEFgOtT3lal4jlY4JZycrJ9xFNnfqhiTE1G5PpC/tUinLgJ+nSg0oiXXan59RSRf9SexqP77g==
X-Received: by 2002:a17:906:209:b0:a02:9c3d:6de7 with SMTP id 9-20020a170906020900b00a029c3d6de7mr3506760ejd.13.1700732452416;
        Thu, 23 Nov 2023 01:40:52 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:51 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:29 +0100
Message-ID: <20231123094040.592-10-hkallweit1@gmail.com>
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

Acked-by: Helge Deller <deller@gmx.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


