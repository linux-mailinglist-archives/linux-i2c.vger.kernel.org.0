Return-Path: <linux-i2c+bounces-291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9A7F05D5
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30550B2084F
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2273C101C9;
	Sun, 19 Nov 2023 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMXLYofp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB8C10D7;
	Sun, 19 Nov 2023 03:28:47 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-548a2c20f50so463705a12.1;
        Sun, 19 Nov 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393324; x=1700998124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=XMXLYofpTs4gBA9PYGUJgVYlpzmC0xTSI96qAH11s3ojGb+0KvPaCrn7GqYl0Fvyea
         hUpChstgVq9XdIotHdC1QuWSQ1wQDl2cxBSgI/rwYB/eGtBWqxRgxA7xS3jQVj+azKzi
         5N3eHjn7L3JGHBdbRDJEyldMKXZV5ssiSr7HJwp6iOscJJtXdPIuxgXrj1w5gjQnO5OC
         alkpxe71bBdtl6zFLItXlffyXQzkbb+pv2mlaP+VAVEgKA5zF0AziqX0xtKCjsBMOR8j
         xffSJTedU+hKWH62cqirPt8htlcv278XNRgbi2dZNZK47vebro6dRAogG3yNOaTJlsJK
         HarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393324; x=1700998124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=sA29QvRSVrAix6epP16/elx7ltvWcP+Z0aZq2XPQa9IEwyrvz5dYB5StpkmL93QjHC
         wXg9wqhZOpnz5hUn3gGuI3nTlYMeM4suIu3iv/Dd/Amgq+6TbWHOuHu0Y0Q4/0APA7Xu
         n4SxyqIUTCLSiA+cxafDPgMxtIFeRBl1tf2pPfvUu6+9vvotIHXNoBiqcojipl66moZK
         3Ur/xSb+DkiHDu9OLS+bPETK77IqDkeidXYaRAU4XkWrmMmUtTIqeL/WyTTcJrOGURML
         /Eor0EG9FqLrBipQTK0XPeLXvNj+dhEhnJ32nAqbVfL8jEdutsyQL6HmMrWqFDcSZbPO
         N11A==
X-Gm-Message-State: AOJu0YwqxWwXomdBEdKe99Kg0bXdoh/i5ZM7TvMRIIJK8IbYGszXYVc5
	0ib6/rqXrTnh3FH9JqkHgPWO38M9h+GEow==
X-Google-Smtp-Source: AGHT+IEvkXiyvHrlLOpdjdZVnWlbUgrD89NC8HGpVTBiL34yZJObBE5/8pr84pk4cSZoZHrmT9MXOw==
X-Received: by 2002:a17:907:1ca4:b0:9c7:5200:e4f4 with SMTP id nb36-20020a1709071ca400b009c75200e4f4mr5046586ejc.41.1700393323809;
        Sun, 19 Nov 2023 03:28:43 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:43 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:21 +0100
Message-ID: <20231119112826.5115-17-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 410bd019b..e6e48651c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -81,7 +81,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev,
 		     struct hibmc_connector *connector)
 {
 	connector->adapter.owner = THIS_MODULE;
-	connector->adapter.class = I2C_CLASS_DDC;
 	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
 	connector->adapter.dev.parent = drm_dev->dev;
 	i2c_set_adapdata(&connector->adapter, connector);


