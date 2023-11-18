Return-Path: <linux-i2c+bounces-218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D068C7F0163
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BDD61F22DDA
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC752199BE;
	Sat, 18 Nov 2023 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg+G0G+S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D8F131;
	Sat, 18 Nov 2023 09:42:29 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083740f92dso4666445e9.3;
        Sat, 18 Nov 2023 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329348; x=1700934148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
        b=Fg+G0G+SGdCcEQ5DHHKxhun1akPolQ6Qu9lmdrNWUnIvXC8a1Y5OAC1TVYWhun4kPY
         AGlkSms0XVm46x6AFvDzLenHPjorUJib17DG4uZPhJE6ZXPfmkRMa0dEvfecmJttnsav
         To8ZWhM1eA07exKcO5pK0Bv0uLgkMUY/MZs/An+5NWbFMOHP3N1X5N/9/G8In7isc/hb
         DudZkF3qMSXz+f/EPm59wZKdApSkaTZbtjbuvZsQgi4f0+V1kW8FlzZEUlZXQmRZ6r3q
         EdnZofQWXhKm75bvse6zqKXZ9K/BZ5Df36Q0d7LgMfU9ctqrocczhDGI2Fo0Kjl1taDV
         ZyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329348; x=1700934148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
        b=I9EprR8HHPSLOxLe63m6uaNdWlpGNg2bQ7Li3zFKvruk/HDyjix4B9rc2MZzsGXomK
         vi3HY7mP8jKwIuPMd7mVPdvv/2wt2TnjDrhYXQ3h0iwOoUBS4Z/4i3uU0I78D0acrpAi
         fKXqIqlV6xSXtJOCJBc+Hgwnc9mAY9KJ2vB0EjMEjutwNM6AzfuLVGxsq8bDprSA7Lj2
         UAqXkCraK59HQMIXLFWgRGWAsmbhrQIG0cNyPRO575iVkuGUNCJmILGfd0jVLQfRUEgu
         SJipVG4/VZD5+Q0LA8jTxgv31EBv0uSAQ6Nvj7wRCzywLeMyjtiw8bdp0jSW2txzKQKU
         NVsg==
X-Gm-Message-State: AOJu0YxDJ3vFjuRrmpSmRSCscbx/kbAoWoNWESvG/d6ZlFh3kQOmwZB3
	Sl2RybbyaHNAv344VjWruVQ=
X-Google-Smtp-Source: AGHT+IE+/T5akrgcd8jfoxC+27DJiLMD9yywl/rsoQi2NbXCmSA/211Cuyy0UCxwYrsOXe7kSYSepw==
X-Received: by 2002:a05:600c:4f14:b0:406:f833:d853 with SMTP id l20-20020a05600c4f1400b00406f833d853mr1767049wmq.15.1700329347662;
        Sat, 18 Nov 2023 09:42:27 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:27 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:02 +0100
Message-ID: <20231118174221.851-3-hkallweit1@gmail.com>
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
 drivers/gpu/drm/mgag200/mgag200_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 0c48bdf3e..423eb302b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -106,7 +106,6 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 	i2c->data = BIT(info->i2c.data_bit);
 	i2c->clock = BIT(info->i2c.clock_bit);
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);


