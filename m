Return-Path: <linux-i2c+bounces-256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4EE7F051E
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC711F21D0F
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5569DDDCC;
	Sun, 19 Nov 2023 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfEksXFj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE03D126;
	Sun, 19 Nov 2023 02:14:52 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-543923af573so4899159a12.0;
        Sun, 19 Nov 2023 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388891; x=1700993691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
        b=GfEksXFjFyFrIFN0Bw1OV7zfQInb8fFtYBVzhoWtcmRt8KTaNRazno4qbzLdug54yU
         3ayUf4jXGV5qWJ2BKzmuf+KxPN/ckUMc5TJUTZG7WvZsxbg46AHQuGuLfPHES9tXxVqJ
         8167keLpv1XvaEYCGtB1Y4dZBNKPc08aTLMVXCimQuiCTTakNd8x6JV/o0KnA2sUgYoT
         j6+TvhWID+nLssTJlZb2r2X4+8FDhwh2MpqpQOdBmnJ8txjlgqPwdhm3r1GdfA1LkyPL
         TVdKXw3pV52t6p5bIRyt6HgvBACYB9Afk38wfj1F06lkfftCSoy4t7PY4XXYTrdbEUYr
         0LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388891; x=1700993691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
        b=rF65MuM3UVhpspYhsnGd1SrAibPSmzX33g6Q4rA5HOworacY5JKCgpXgcnckU/ray7
         XlQBG0YA7IGhA5VYt1C2PcnOJbl1JdUwqbsF2CszfZ7K+9LXVnxKPWwxkJsR25zSzZHT
         G31zGZBatJ2ciahTsLopccRgNs0jhsAr6CTVm0/SOHBEjmJycgSMkxQbM/yGcwGOGN8J
         sGrlLIgpyiO516XoUNUSoB657L4a/Mpi5SUZuMNMrDwRG5vB7LVcq6yzhhtLFtBd4CXM
         badJesu/ngWBGE+9ZLao1VnCRE+eaL/Utb4ORB9ytqdSl2QtAgwuLnyMG2SlI/jgLe1j
         YeCg==
X-Gm-Message-State: AOJu0YwE7C+lp949x3UffR0d5JURXkwD2SCh/laKsMmIUa/gvv2PK702
	YdbiUbVvnHp+ybGWbfutbMs=
X-Google-Smtp-Source: AGHT+IHk2xu3Z7VHdNC0cDI4LceA/80hAyskiv/hXJYF6ETvfNGrJOqk/TU7oB4w9TiA7tO07j1rfQ==
X-Received: by 2002:a17:907:9483:b0:9ba:1d08:ad43 with SMTP id dm3-20020a170907948300b009ba1d08ad43mr4137673ejc.70.1700388891276;
        Sun, 19 Nov 2023 02:14:51 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:50 -0800 (PST)
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
Subject: [PATCH v3 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:27 +0100
Message-ID: <20231119101445.4737-3-hkallweit1@gmail.com>
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


