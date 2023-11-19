Return-Path: <linux-i2c+bounces-265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F03307F0536
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D761C208E9
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ACB6AB1;
	Sun, 19 Nov 2023 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm7Hoh/y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED062192;
	Sun, 19 Nov 2023 02:15:00 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso461719866b.0;
        Sun, 19 Nov 2023 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388899; x=1700993699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=Nm7Hoh/yf/lC6M5JGYYHUfsdTiTAHCHxZhicVBWBDd2WnQ8jm6HKgxgahVosErjXiQ
         A0SHaEjh1dfBinnnBHr8N0r4gqOc6N3JqE/mul7GaqdhgOSmcQow6C4ke1QY9mGlde72
         tE+tvwJ2z4yfuNouRPHW5ix8w0htv1AsiG0aeVUgBrFP7NTgbVV5IFKNxr1p7yGo/eZQ
         PPzZ6AvpHOhmYRLG377oqkEakMFK7LXbD7EjzFGUBMDIEbBpH8YnNxAvMI/aV2QYhDGl
         2g2JLvm8Mgg7Hy7DmLeU+hGRxvM1j3EwKUaCezD6/6hlGM9fPOcVP2CRn7zU4VpHHpDN
         vqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388899; x=1700993699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=iKLHouFLqmdGoshPiXbBCpxShdSYlbKsMuU+l5uWbrQTTs8WBCQSzQ4yYGsIv3oJj6
         l+LIJaX1o+whHi1Bvibk983YvfUXpLwHdPsPZAKEqh+B85s1zXoY6WiiIVGIkPAVo4Ae
         PRayiHRYmzWXou20pV5xBta7m1mrZ7xZ0NgziV76uVt96eYpMDG8Hu5vd3knCE2pDk0k
         injBU0fg+qwOoYlRzMi3wj9G9zFJeTknTZnSEPUjbTBa8hjPoSTKb/r/3PK4cWOLe/GJ
         1WfAxKJgX1Vb1RJNSr/P2OC1Q5KGSOfB22hB77fZOK600FMBmwM0tbi14GdB9vMJksXR
         zaqw==
X-Gm-Message-State: AOJu0YwwUL7+LEfwtGS3K/Kurg8ULbmkGerVjEENF78QwsXYVmEZjf/v
	kpSoSnC4PrWcKIYO1wYNpEY=
X-Google-Smtp-Source: AGHT+IGxVgtj8iBRN4Uc5cMOHBm70nnnpeBmu/gwXvx3Y3ra4Uxo51EceybqbcoqUopaknIFYYEiQA==
X-Received: by 2002:a17:907:c018:b0:9bd:bbc1:1c5f with SMTP id ss24-20020a170907c01800b009bdbbc11c5fmr3589383ejc.35.1700388899176;
        Sun, 19 Nov 2023 02:14:59 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:58 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:36 +0100
Message-ID: <20231119101445.4737-12-hkallweit1@gmail.com>
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;


