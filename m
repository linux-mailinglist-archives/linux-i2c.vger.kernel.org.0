Return-Path: <linux-i2c+bounces-106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEF7E9AE7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427291C208A3
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7301CABE;
	Mon, 13 Nov 2023 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h44Kv/Yn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F31CAB0
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:05 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B212D58;
	Mon, 13 Nov 2023 03:24:04 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so54938671fa.1;
        Mon, 13 Nov 2023 03:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874642; x=1700479442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
        b=h44Kv/Ynnjoz9XjExNnt7Vd/PZvdqYAiSaI6GL8hgef11CLdrRV1+mTtJtbzP/nQFs
         +nGA4/S/mBMhT5dWZgjZYYvhLa8udJTKw5J5iGhZ/nYFrtuMAwBbh0AsJsU/gemfPnWN
         yMhnRs7ooYuwhnVgynFaQHBXty25CExlXpsfX9/UDnXPBqF1tps5VvnzoMkW5K7pMriv
         hQ92oyvaqWWMN5bSQPf5wwLMCI32lsLkcU6wuE8VLvQLMFBI22+ure0IAhoiIf+3uEDk
         0XYVWJzqTFrDMKqU3vlFJJUTorQTq2Pxx05b7DQL2d+/fAvAdtUhJfH/U9Bg945JYSO1
         pxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874642; x=1700479442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
        b=PcNOXykIMyNm8bKFlLflLoZY9oDIKl1gf0ZcGS7mBua0HOBEyoC0N3Zlercv/406Bz
         LxTNKFivGYOJjotnMNAK8pYYTEIoUpZx6Os7S6AmX5OoYAdXXPjbxzV6NCbNOXHd/FpT
         wuh0nylGkqbmpyHuLYuG+96uYEmVzxFrDqT+fK8jXpnIHj6GiBqUZTjGK1gZDTRcr5sI
         RqmfVlhehSjzgig6qoVfcHbCOfKFgXQUMUgwGqZ2UpLiCdF5Pg/JONZCeB5AnXhKlGAx
         oBPeo1Sb+l7o7olnu/PdxVOF3He6ikmBDnLttAdCLVIYRLgQ9wP+nvsRjKp6Mc4UuZ8r
         5zrw==
X-Gm-Message-State: AOJu0YydmeFW1V+E8YO/1kVCa4iu5aV5+Hv3rxo100ZLHFjh73owEJai
	se2RQxHTuhf5mT6jbb4+7Ds=
X-Google-Smtp-Source: AGHT+IE36bB2OzfEe98E4kghGaMPiIC5IuFFaTAdSXGE7DLScBaoAyzyOno2sf4r1XZ7tYHmWv/iyg==
X-Received: by 2002:a2e:9d95:0:b0:2c6:ee98:de85 with SMTP id c21-20020a2e9d95000000b002c6ee98de85mr4239843ljj.23.1699874642417;
        Mon, 13 Nov 2023 03:24:02 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:01 -0800 (PST)
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
Subject: [PATCH 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:26 +0100
Message-ID: <20231113112344.719-3-hkallweit1@gmail.com>
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


