Return-Path: <linux-i2c+bounces-118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7057E9B0B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2E7A1F20FF0
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D538D1D52F;
	Mon, 13 Nov 2023 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAtEzR3a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63761D52A;
	Mon, 13 Nov 2023 11:24:18 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798101700;
	Mon, 13 Nov 2023 03:24:16 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-407da05f05aso31960515e9.3;
        Mon, 13 Nov 2023 03:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874654; x=1700479454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
        b=LAtEzR3a+X8SkFHS28mkox51HJDUtCTWP0/LaxVWvf0FXv7+0ntsGlXHvwoo9TemS9
         gRH0D8zIyvVHpxF87A3asJOKak/zntc0csV4BArE2rZRQX3nQ7VPanm8sflIa0pbl7Bl
         vsjIPPiQf6rUsk30g7eh1Vp59dBfpTR02C/jswZi3sg8lEZFRDOTqmvqMxPTkWrgmD8O
         e+dLfgbqrrn/jg4ZFzl7YBappx+BKgfxvmFnzNbcpDTj/xGbt2vEbaR7UGhUgGNEKCEb
         UuE6XgD9dfo34tOsHAo/25BRZnAWxZTqJhN3MCwBjL0oLIHAP10dIRiOY3nqcdgtmYPT
         y67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874654; x=1700479454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
        b=L7Q0nkxd5gCR68pdzZaHe6nAlN/RpeAFeBjyz5rsYFi0VmQmI+vS26Wl3hyDfJmNoG
         jLlGK+Zb5Zj1xe9/2ReTJNFaqrowKhetixBHS5X56uJOWmdmFv1KS6s+KvgF+tFUZopB
         14U/ZNffhIvIyJxp3tkttg+icgD/wh8zqS2dJzserzz14Fo9baSdkWwFaahsLakjWx1S
         ZoAqDpzLQ5Ntm0F4QJXv0f69vQY3Yd2MPKZNV3ciu1zNPRamSDCt9MjMR5U+Nk7VM4Yf
         8/bjYRT/avRvTSl1z5WV3d+i0Ri0K/cpqJGN5oE3sb/E63vBxI4dn/1WP/sD0uqWvjrE
         lDvA==
X-Gm-Message-State: AOJu0YxUa2cZNIZ+j30OmMwnHtVWZDHTmOGGggif2gU29FooIycChTsS
	xOjHiSBr+pYeIUa9sSWhLbk=
X-Google-Smtp-Source: AGHT+IFbNwXT87/A3jEt8J3J2IIJaKfXP5VLFa7X0d4Q5ivIh7Rq49/jVdFtcRm7vBeOvUh6yIYXWQ==
X-Received: by 2002:a05:600c:4f54:b0:401:daf2:2735 with SMTP id m20-20020a05600c4f5400b00401daf22735mr5024747wmq.31.1699874653800;
        Mon, 13 Nov 2023 03:24:13 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:13 -0800 (PST)
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
Subject: [PATCH 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:38 +0100
Message-ID: <20231113112344.719-15-hkallweit1@gmail.com>
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


