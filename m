Return-Path: <linux-i2c+bounces-403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B85C7F5B3B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB8728181F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0D021341;
	Thu, 23 Nov 2023 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6jsYGK+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C10D44;
	Thu, 23 Nov 2023 01:40:48 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-548f74348f7so935828a12.2;
        Thu, 23 Nov 2023 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732447; x=1701337247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
        b=P6jsYGK+PkGCtqcrsOkv/NvaKGPptDbS0hmIdsWyEigfD4B0YQu1ulFB67U0jTIg3E
         +wCorITWSXEIlvEjli0drGFFc3i2JRndKy+1xufl+KV1XmCmDVXo72HwbC5S7EYgEaNS
         dTXV7lsTdDI8pi+G8DnEHtwpN1Lp9kNf7IIo3RPpLlUfz3zbQzlwTURSdXHrCYb9Qn0v
         8HGTAf4kHdxSKmx/BXP7XD9x0BVXMuZuAbkBhuQG1mQT9RE3cpQBxvRkKciwy0nt3/wJ
         Ef/oDRXm0OFSln5dholtwdIOG6HwMc3TGEnZbangYYurg89UgeaZy4a4hnywRPGXXRkR
         I1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732447; x=1701337247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
        b=Ow+2n3H8KANk94UmPTvDl+0zXB1G+cUSoNOQ9OkN7Lk5lRrQpiKI3PIZ5/Bk3OBDcT
         BFClPNxxdH9CM86aXqNMwvzUuNCM14Ih5/jlpxCE3svshx9tSGgXVddDWOe3PUIuR7he
         j8gJVIo2dddsl6nmSda+3Q85jXZ4Tw8uy3yuuMZ+0CJ6WKh5Kg6LUXHKNLbFcVQ2Wqlk
         VdQLRg/fiWfUNKZc9p6DBlzTYAvmB+YOppTqJeG25B/O5Iaf5TiokiqbkEaqV5kEE25r
         YtHq5WX4HVd+VVUkmnCpWbDSBrDDXmAp4qZF6OQcEtVVkQB/P5aNkreYjh56Mhmoqrds
         1n+w==
X-Gm-Message-State: AOJu0Yy8gP5vSnCP7GjBY4ZUb+aI1f/Yw86LTSvqa2kUitrNYcSSp9MG
	xevqe2beYKViCuq0FW/uvFQ=
X-Google-Smtp-Source: AGHT+IEn690wfubKb/UyQpCV8u5r9s/J7YoDjXMPpmRF+BSrF8lwfJHZHGsK4X3ZCynniFHKeVNcKA==
X-Received: by 2002:a17:906:14d:b0:9e0:5d5c:aa6d with SMTP id 13-20020a170906014d00b009e05d5caa6dmr3302730ejh.20.1700732446363;
        Thu, 23 Nov 2023 01:40:46 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:46 -0800 (PST)
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
Subject: [PATCH v5 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:22 +0100
Message-ID: <20231123094040.592-3-hkallweit1@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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


