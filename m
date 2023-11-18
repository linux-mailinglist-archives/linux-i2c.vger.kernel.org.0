Return-Path: <linux-i2c+bounces-233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D517F0188
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC831C208AF
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0F61A72F;
	Sat, 18 Nov 2023 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bre9X7ds"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89DBD56;
	Sat, 18 Nov 2023 09:42:44 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso5431685e9.2;
        Sat, 18 Nov 2023 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329362; x=1700934162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=Bre9X7dsgjthlFFj+Ve4LCcUUarXshJHNTg3IcKAmpT5T3GbwlikEVDqYTalhFlXtH
         MdUvt/inE6MCvhlGJND+GlDc2Tc//bnHb4Z3m9EODIUC+Wan97+uXalA+mg2+oU+Xy8y
         PaRRgb8FjugPmpeCSG7BgK0hcRiMLDZdhUCeu0piA/ax+ahbOe5nK2RNJ9W+wb35FDdo
         nWXuvKfRvNAuRIdlRfKb4Cd0/sgr20OvBKYq60E0HllYCKIgumPFh5EEPZRGb5xPQxkc
         4r6HDwrEBTC0T+0I9qTyq+xSwKv8qDbHewoiPax8yWa3JVwYwnkJvB0dIfg0yljkQ3lW
         KEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329362; x=1700934162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=Sg/K0UCsf7ubNDPemSrOlaZz4m760vywWb+5ApGaCaJ5esVvgLZ42h5wdeTv79MlOW
         HdpDHjV/MJxvLMg1iM8GdMM6GkzqPYLtKVl9zUaunUCNR58i/yJVo5+spM4jUy/oPvZB
         tCvxi73Dh6fRe0ryb9xhoLYUVfJlM0CGikQ9JxKOf6PHyBZf82AtOGzx7H/n13uJ6Z5e
         ikon8F6W60JQPCsdilAznfoaeEe7vb69V2X4zpi46+DEi4TROm7HV1xmLKH0s8XlrwVJ
         i1Cq8JXcnr3DDdx6zJrD2UlctLw8rAsHZw/tzXskcXg4Jqm/aEQSbpUaLezM0lix5JP0
         /6wg==
X-Gm-Message-State: AOJu0YxrUs4p5uOyfFUWf1ottChM+hSDYDVS9+AcLOL2PVzX1VP/KZli
	jqHWdxfVzqrX13ypjosYKdQ=
X-Google-Smtp-Source: AGHT+IGt7l6o5PwKsvFViCwmf1r0WoQMwWrQxBmVxuyxOMjlfRS4f3YKQ2XLunb2gXYw1covaoaGKg==
X-Received: by 2002:a05:600c:468f:b0:40a:4429:a994 with SMTP id p15-20020a05600c468f00b0040a4429a994mr2234920wmo.28.1700329361729;
        Sat, 18 Nov 2023 09:42:41 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:41 -0800 (PST)
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
Subject: [PATCH v2 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:16 +0100
Message-ID: <20231118174221.851-17-hkallweit1@gmail.com>
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


