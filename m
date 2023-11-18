Return-Path: <linux-i2c+bounces-231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE787F0187
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65A2FB209D9
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443CE1A73B;
	Sat, 18 Nov 2023 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6X3mAMq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DA910D4;
	Sat, 18 Nov 2023 09:42:41 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083f61322fso4646715e9.1;
        Sat, 18 Nov 2023 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329360; x=1700934160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
        b=U6X3mAMqSzGUlR+br0BU2wV8ma1LrV1Ki0OToS28YHzf+a0ru8f+9JrtmIWnG/cHzF
         ejD5kkoR+nHksy2AoQ7c6GaZIgYz7d0wwgH2zv9nlCE5HcfUINUXzgOY+zY1yhzGUfqd
         KnWqZs6Db+VakbAS2N8hEEkHhYjLGVf0HZpET1ApRzZI1HE0rBFA4FsI8UTI76NCQiiH
         jaJMwsd7q87xq2iCJ2p22pNiiMU0cQIS5OYoRROOSI1bVd2vFZFIRSJydGhGCAD76Etr
         iID1Eoz8r0/eVPfk995gE5C0u7BV8b5xqsPRFPQ6YOisHSGhqXFOrlCB3cTjc4JTYDBS
         V1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329360; x=1700934160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
        b=rFtn4KPGsoxnncq0waTfEHPr3pdVkkFW5OcMqwlp3z62eFipWYi8fVP/IXfHRXATNh
         rtEdNuIkegK9yaH5kXFKJeWU9j3QGMR91Rse8BE+HX0k4fSHyUhQ9xhXVq1Z9CgdXJR+
         88SHMASpEaghU3QVPsQ7ZTqaZ7eRHf+W+Cs88/dBmTD9qshMIVaLoRn8MUZ4bT4zqD59
         m/MSrCE94w55loSPjwPRP/jwJgIUPUh7vaY4f6op1n6OrbFFgWc6VvT/NxK68AH5dV3p
         LYyMYfVFfhdWED+U80EAyYikxQDAlGcdLCqNbk7Sr6qy5f6urhu6ocBI1qa7Lkpsl3+D
         x29A==
X-Gm-Message-State: AOJu0Yw3RQgb5kW3uJtPwTJD1tdA5uwP3O7EsLrs0q+pUWQQWcAcORYG
	0IhFv9CVrcGJu5ex3oiAyGI=
X-Google-Smtp-Source: AGHT+IEDEAp2JxX1TrsPD+58kjm/UMuphpwbs1HtNIKAuhJlTjYYuA4bjSnwRduobt/RGzGOZOWLeQ==
X-Received: by 2002:a05:600c:4f01:b0:40a:5b3c:403 with SMTP id l1-20020a05600c4f0100b0040a5b3c0403mr2242232wmq.14.1700329359934;
        Sat, 18 Nov 2023 09:42:39 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:39 -0800 (PST)
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
Subject: [PATCH v2 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:14 +0100
Message-ID: <20231118174221.851-15-hkallweit1@gmail.com>
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


