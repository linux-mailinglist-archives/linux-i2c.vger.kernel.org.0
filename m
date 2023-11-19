Return-Path: <linux-i2c+bounces-286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B57F05BF
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52B51C208C4
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC2F101DD;
	Sun, 19 Nov 2023 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KODpKWh9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FF1D5C;
	Sun, 19 Nov 2023 03:28:40 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo4884616a12.3;
        Sun, 19 Nov 2023 03:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393319; x=1700998119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=KODpKWh9IwFZL6jV1FkUv0prwqI5uIO94zxFgHtu35xD2/LK8aqx9xQu1t4+OKX1FU
         EWNBgzayIbQvzsqsqs4jx0OV223e2LjC6TDjm0UqqH2zYySoXL4cOLSCaLJCyXGm7TjZ
         C/FZmljZDX5dYyoCFY9TMZs36V4lpVyE7vfIB+IGj8+v25mzwHEe3dkbIzCIJ4AmT94A
         yXnK7UDxGxPw+wEy/WWRqvrzJfqIVLm1IYQnJwlGogQxU3drhw6F0B9+IUVcZFaGqg/o
         5Nm+5xnckVLFJhbFrbbmQTgFhB37JuAA+yeb9ye8nw2cOHTqlWsLEq6f7K5I94FlJWGF
         7ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393319; x=1700998119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=LMz1R9geGFhefxIKnvK+t7Hfz2SWiGsSCr8587DG1V5rvtI2U1e3UBQ49YVirvC9OK
         jZVzFVRfpVqXM6P2ZO5xAQovN8XNKv+lrHxPGO3iMDgmqopSEfsgF1nJK1Afr8zkCn8P
         rVaYmujce+U54eNq5Vf4USNlq4nUpHEs/l76NY58YXXghUtHb47iSDZC5Z2PnKbRoZZu
         Ig4vcpoTQ2MA54BIQ6fryzI1sheK/HuoOieaHdhVFuBhD8qlCA/LmKe3/aJlvHeZKp0Z
         dvMRox7rB4sibX+uUWwq8VWau1xc78lGKuo+i949IPdyW2xsI++7rTDVKMsvLAMaRS3y
         sQbg==
X-Gm-Message-State: AOJu0YxVSvf05o7O3IC9xsfLY5CB1zpXL5jjTRFDQYF1o6hwk/o1fizv
	OWuhuOG2uQJPreCyIpFXBrw=
X-Google-Smtp-Source: AGHT+IGW8bdZ2RS0eD/PKhlU2KiBuoc9GKfQcR1+tjuS9TfpWDLNx8Ift2fVRfhA8+J2YatXx72CBA==
X-Received: by 2002:a17:907:3f8a:b0:9b8:b683:5837 with SMTP id hr10-20020a1709073f8a00b009b8b6835837mr3412002ejc.46.1700393319210;
        Sun, 19 Nov 2023 03:28:39 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:38 -0800 (PST)
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
Date: Sun, 19 Nov 2023 12:28:16 +0100
Message-ID: <20231119112826.5115-12-hkallweit1@gmail.com>
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


