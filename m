Return-Path: <linux-i2c+bounces-116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BDF7E9B02
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 604A11F20F64
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFC51D523;
	Mon, 13 Nov 2023 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqOSbKwz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDD81CAA9
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:15 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0423AD5F;
	Mon, 13 Nov 2023 03:24:12 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso37314025e9.2;
        Mon, 13 Nov 2023 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874651; x=1700479451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=QqOSbKwzWihyZtNLq/zgF00CdiQa2YMIxc3wwFAD7uryqc8iY2NGOGErTysrTYY8Ke
         qcuDh47CogmgrwuHQxbuK+1JgaeG2+pU3iE3VZmM4sDNu78PfDosqK9X0Y1NYAJt/MKY
         gm+FSowBEadchGMlYCXDOHd2/KXUC/m/XPV2J3wM9bNCx6X3rFzCwBF87da6HuR8xOuF
         bJh8jm7d4AqPzcvprKJ71vKflkUmTKXHi5sL0nyICnabuDcF98d5yHPEbLcHnQqiYA2A
         wVOuiMgY42w0Xug/kNcGu8VxKB4eMatPMrwIZ7hs+9PKGBCqNwJL7KdLa0EpV9W643SL
         5DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874651; x=1700479451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=VzUfd/vrML7q9sD1v4IBP6HWNC3+xd92CYKphGDHA9C7YwiQ4LlDkgV3ayY5bgDgUd
         TEklZfuLne64Ao/Od/SKyMY33YZyNQ7SMVJ0SESdLmDHZQdPgDW+xCJMIb1ipOEjjO+V
         qzXMXnu45wlCUSLqeyIStMMK920ZTkBtt/GtLf0tuIJH0ymSDcnZnnPJ1m5GQuMnWzQb
         GRcQbPQhr1tlu7aD4MAP8s5G2iUuAJCHLffWjlOZmlCLE0GSZK1Jh0DiRDxB9VlCal3G
         xx6uUcJIupE1vyc4Ej/EK7lnulpYrY7h8fPW1Fgx9VIQLKwiXxAB4a6vl/jIyp1eZX8l
         bfKQ==
X-Gm-Message-State: AOJu0YxbThJF2YeuAC7PnHsjexIV7FPtXaSehMmXEVIVrzyaigEFstwC
	GYtvfL5q9Q7p9QkKrYVVIQk=
X-Google-Smtp-Source: AGHT+IGFHS306bbRiz2f+lNTVzDFOlLgNqhmA6tscwfIyFuanprmk3KxQkw7tNj8GMTBgarDSCdngg==
X-Received: by 2002:a05:600c:21c2:b0:40a:463c:1d8c with SMTP id x2-20020a05600c21c200b0040a463c1d8cmr5105398wmj.21.1699874650883;
        Mon, 13 Nov 2023 03:24:10 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:10 -0800 (PST)
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
Subject: [PATCH 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:35 +0100
Message-ID: <20231113112344.719-12-hkallweit1@gmail.com>
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


