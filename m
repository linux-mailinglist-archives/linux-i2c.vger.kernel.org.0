Return-Path: <linux-i2c+bounces-267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D117F053C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F172280A1E
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50464DF4C;
	Sun, 19 Nov 2023 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCSIWgU1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2001B194;
	Sun, 19 Nov 2023 02:15:04 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso474456366b.1;
        Sun, 19 Nov 2023 02:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388902; x=1700993702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
        b=ZCSIWgU1B3c6T2lWAMwFN9RVeQe9kixy/mtwyLyq6lL4GIAA/RG4N62SVw7IsKdbPL
         L98CLabqVIsaDYkXMSEYwkmA2qjWxWxpYKbPeHSytWCOpu5axEGeUiqAoi6Xze5GuOtQ
         vXMixL+Q8mCBCfLeXQNAQMjn5v4LyJva66so2p8EM5kN/px7Qw3fCoi4ciVzh42uVtGC
         ltRaCOlqxUX/UyhHlie9PqULWz7bSftN/7K864Du5DbddzacYTud0iD8aTUDEzmLTFdn
         W5XPhL24wJ5Gipyiax2uK1m5+Wxs1jbMuPtjmF6cdjZ8CAj3cQByoBvcLRHSRkV4npe/
         /zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388902; x=1700993702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
        b=OYNAxhJzmUWID7jGO6dXrCEBES8Yxnmkj2XaNR+FNROlC75f5TZ2O3cnevnuBjFi6e
         kIEjXizrDrFt+ABxBZjdoVIo8TGjMh6N5dIGJFjyDXcK3fMWa9jk+nLfjIs0b/v/IYf9
         9czmXtMcHclkfh9GSlKRGZxwlmBfBNGLe7AD705vUFafDeTqDraiccrtCAn4yvhyYpMe
         ry2Y0S/dRcQFFkHmu5EdT7YgKhuk1pXdUbzR9ff/p37KdXvK4Ecu0Qy7mbaFAcB5pmtc
         6GaVt+u+B4zY78Z1BLvswsgAw8CCKwv9HrW9uGwj9ZLGrBES889wvwebJLuopxgLslaL
         3xjg==
X-Gm-Message-State: AOJu0YwY6qIcofnDQncFEDL/sQORGeNRiO0c1i6YKvhLks0NEzfTLIkJ
	oGfDVgcqO5QBq03AWp5WTcs=
X-Google-Smtp-Source: AGHT+IFev9QS7E6H4FnlLJ9liXoF5szMOjAZoTWwnTK7QH9BaW1t5+tIQ2w2UPUQ8sPueN6bcCrDGA==
X-Received: by 2002:a17:906:1001:b0:9e5:1db7:31b1 with SMTP id 1-20020a170906100100b009e51db731b1mr2848642ejm.2.1700388902097;
        Sun, 19 Nov 2023 02:15:02 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:15:01 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:39 +0100
Message-ID: <20231119101445.4737-15-hkallweit1@gmail.com>
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
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004..7aa500d24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -249,7 +249,6 @@ struct i2c_adapter *msm_hdmi_i2c_init(struct hdmi *hdmi)
 
 
 	i2c->owner = THIS_MODULE;
-	i2c->class = I2C_CLASS_DDC;
 	snprintf(i2c->name, sizeof(i2c->name), "msm hdmi i2c");
 	i2c->dev.parent = &hdmi->pdev->dev;
 	i2c->algo = &msm_hdmi_i2c_algorithm;


