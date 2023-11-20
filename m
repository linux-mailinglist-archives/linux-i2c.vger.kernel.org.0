Return-Path: <linux-i2c+bounces-350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A77F1F93
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E403B21B96
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924F839852;
	Mon, 20 Nov 2023 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1NgYdSJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF74188;
	Mon, 20 Nov 2023 13:46:42 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-332cb136335so707202f8f.0;
        Mon, 20 Nov 2023 13:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516801; x=1701121601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ/FEK2mYsIsrLAMj1ftUkEFHG7z/MaBn+ksqWZD4+o=;
        b=L1NgYdSJ5vHAYv8WXWbb3tRRgaBIt8tv75t1HggQer8whwgI8I8U1XOn3L7+0z+bI9
         XnZZsrOWaFWbVv6uNNBAwWnmrlbq+JJAqa6ODU2AZUbveSokB+eqxY7MMfFZ4Hpk1aKp
         inKviwfftIsb6sYq/mLtaIahtvJ4AexEgKR/9Xn89GmubcxjBO/V0Ur3t0YtBKNYEwWT
         8g/7VW5SAgfSNH7Qejm6yjmzInsZl3G/AWdDuBXZpZIGshwhxmNPakNmVqSX0/2gnflt
         oGuGZ3dx9XrKOwTSwJ1kKjkQZrH83XqlK28oZsHvPq9l0j7JomS8JI9KAk5fRe+SGy8j
         LUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516801; x=1701121601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ/FEK2mYsIsrLAMj1ftUkEFHG7z/MaBn+ksqWZD4+o=;
        b=NKcQCmKJIkzsO5X3Y2P9GsO/CLXD5BOeqtrqfX5sgbOCLQg0tVBdWERD1EX4UmYrJA
         7smrDsmuc9QvXUDJBD+26Yu45dJt4QWq7MCxiouB6qD4Kv1nXJX1k2EDsM2ppQg4KmbJ
         RVp0drt0x8DwxupqyVg6MiF1VIe00KygmttRp74RKunkgDVkn4geYpylbN/pIHoprJqP
         Poea0vrET+ufxy8J+o0eViYrCe6x7EEN/LJ4m3WEUN2XwUkQbcU4iCgv3kUuMNHHHKwF
         BMa5FgKbSTFeucQu6jx85p6wHm2Z+oB98U5w9BkA+2y5KTUQyZc3bmYfEr1EeVV5PBsy
         kKTQ==
X-Gm-Message-State: AOJu0YwyfA/2EpiQEdAKPAuaX40LXgI9gRvSEvlL7HMp1pWSi+684W4J
	5FyX1PYbnDqDoumLkZf9Ts0=
X-Google-Smtp-Source: AGHT+IEJmFFE3EHKXQ4RGWFBYumObm40aSlus52AgE+TXXlh+CCacbrX+eglWn0cbPoyet+nNAcCRg==
X-Received: by 2002:a05:6000:4010:b0:332:c1da:4cca with SMTP id cp16-20020a056000401000b00332c1da4ccamr4845981wrb.14.1700516800595;
        Mon, 20 Nov 2023 13:46:40 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:40 -0800 (PST)
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
Subject: [PATCH v4 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:17 +0100
Message-ID: <20231120214624.9378-15-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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


