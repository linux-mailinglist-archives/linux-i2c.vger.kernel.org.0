Return-Path: <linux-i2c+bounces-415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B37F5B5C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8074E281802
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA60F22069;
	Thu, 23 Nov 2023 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt2Q063x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42199D72;
	Thu, 23 Nov 2023 01:40:58 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so88638866b.1;
        Thu, 23 Nov 2023 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732457; x=1701337257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clBWu+ZkOHv5aLxF4Jumr7Rdkfthd/rp2JM9TiGQIuQ=;
        b=Nt2Q063xHLxk0zpMYkopuHqXGTDi+RnvKZdZDL8qQbHhN4xgIJLY4pmAZGfFS8sPz8
         nT0JsohlKhtFcV7nA55I6NLegVWTg3A1hoGrUl/idRQ77BbPL6vuf+mJ61QZkGDz5q3r
         MBQOPBcOkrslZQuznKrGXlE9KFZXQPunQlpftL/+LFULRo4Ngi8AdT6GnOvo7GfwlAgl
         Fo4Lkp93TBWETEsPXbJdaJF3qBqBB63RVuLOv1Q39rIXifXsm1UR6H+NvLV/NxMHCvaZ
         IKUVMzYaMbuWlA10E5Ctlz5HPWb7J0q6izcHy4qLY46RsLAMoYMTD/WKU9AUH+W4y6gu
         ZP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732457; x=1701337257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clBWu+ZkOHv5aLxF4Jumr7Rdkfthd/rp2JM9TiGQIuQ=;
        b=bFpwORXjaBkul4+E+ZjwuIWiJ+iKVF4oWFtvZkzbfv035uI3j1BH5WnMNcN6azb8DD
         4hN3YBznR42MLOkrvST5e3DZztym/B3pPjRA0jkY8ccXGWDbVPc/8X5/QgM87GPKtt79
         wuPfGypvx4KE2Iy90fdk8lLCWCw8S5tSyFyWGWRgBAhGSZtOGn6uw4Q9a6HYhUuO4Z+w
         OQTjsfAxUNRLmrtGr99JIaKWf9vC9f+H/p3O3pbOPRONagE/qyiYmNgSQI8nfpvazHQu
         HQJojP8JqB6jt3XX2ZwTjCEgFhqJk7OBdDdIf3blEWwYea/u3da8uY4WpGmJLcH8um+t
         yhsw==
X-Gm-Message-State: AOJu0Ywlw+NBRdnm8AW46GAsd+IlsOFSWeJHvxPyVkJPMw88BQ6KmEFV
	qEqYkj9QmRsyeHMVWuYzmBg=
X-Google-Smtp-Source: AGHT+IHq8vY/hRvfYfdj8oyzjE1msXHk0E43hTKOhiKHBd9IaWBYhWspiL+jJRvOCphRN+F9o76e6Q==
X-Received: by 2002:a17:907:9207:b0:9fa:ca0c:ac42 with SMTP id ka7-20020a170907920700b009faca0cac42mr3054539ejb.64.1700732456620;
        Thu, 23 Nov 2023 01:40:56 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:34 +0100
Message-ID: <20231123094040.592-15-hkallweit1@gmail.com>
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


