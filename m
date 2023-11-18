Return-Path: <linux-i2c+bounces-228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E477F017C
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE4C1F230AF
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325671A592;
	Sat, 18 Nov 2023 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c26pkZYg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9A8D7A;
	Sat, 18 Nov 2023 09:42:39 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso4619025e9.2;
        Sat, 18 Nov 2023 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329358; x=1700934158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=c26pkZYg7wZk7k7hOdcwer2PiMQ+aEx9vmDbskTFccJmiaGulOx0kHQQDnNvFRkE2j
         0RqbJfTrXqzRu9zq13dUtlzOjQWUqfm1kvsehZkpQ5TEbtfDt7Xqw1p52TNti7/Ls7Yi
         ByvEeVobYdCf331IFVMoffAPxXaKG/ZWNNt+8Z5zvQslI+Luvs03oXKrZKM+2h8Efw4e
         dRGemaHjI8lBupeszViRNjIAdGxoLyzDxRJOpNsYDM8X8NMYWrsGowERXtdAapXrYGvz
         MOifr3hcWgW53du7kb0eubh2hP8DZE9gHJd2d6iB0th0dXRBw694Du+H58SIpA+3cuDB
         rbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329358; x=1700934158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=u5wKLurX3nxpI8vZhZZKOmSluaxd8jQCQueJDKIzfyIBg5/RPm2TkCi0Ms3PLXxcLJ
         3EhOVGdRZ5hgGlUjDiVU7S+90SFElc+jzPjVlRSNyeW1tXrKWWC4Zb8tA8pTvFMtW3VX
         aMVT+5WRsqklbrnIDpIJshdLOLV4CBiPZWP/W6NSvsgHEjWmm6kkgkF/fqA0h32x3Vsc
         1ECIF3o3gy281AXn5UTBHHB53Agvn6CJT3RISTsWK7V+lAcPz/pfqnOZSsOLEm0gQx0J
         UPCxlitEVQ/7oHmFl2CJYmgoBELFfn2SbeaWS4Bm5u5id5dYCbYjWVlaAl6ZfGE/KVWA
         6Tcw==
X-Gm-Message-State: AOJu0Yyq8qp0xOvsTd5ecxrumQAC3UC7mXTjWpjv7rvmT2t0GhkZ3B1E
	y1/A8e+o678iB82mNd61H+E=
X-Google-Smtp-Source: AGHT+IE8c5V85RdvcwMzWAbBlQPGXZHeMjHZ0eSrzhGIJjdv16HbHYiNDOuMRSlBwb03Yc7GkrviVQ==
X-Received: by 2002:a05:600c:22da:b0:409:136:469f with SMTP id 26-20020a05600c22da00b004090136469fmr2103392wmg.38.1700329357997;
        Sat, 18 Nov 2023 09:42:37 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:12 +0100
Message-ID: <20231118174221.851-13-hkallweit1@gmail.com>
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
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;


