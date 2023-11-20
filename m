Return-Path: <linux-i2c+bounces-348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DA7F1F86
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9A31C21598
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF5C3984A;
	Mon, 20 Nov 2023 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSwFUpqT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C829122;
	Mon, 20 Nov 2023 13:46:40 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-331733acbacso2126128f8f.1;
        Mon, 20 Nov 2023 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516799; x=1701121599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=;
        b=aSwFUpqTdPXF+puqUtVU8EKLT6UmUItBDHRCbaCaemnbVUwrR8NMIrJiY9eD1tGgYw
         wYIZtfvSs8/1C3oOHMPPwWhOXp4t5mUy6e3rLusFPXtIvC4HiaDnBkbugNTFel7Fcd+L
         TEUxI+OVMIFInO/Za7uy/OLGhc3nUeXdA53j50Q+eTDOODv9XlzznRQPqu2mrGjlO52O
         yt/g4P+KZJripmVIybT6TuDr3xKPSlaFapv1kyK9jj11FVAjXu85mJzQilq55yIsiyxs
         X7cpwYRfU76LjuIN/5YwLsV8Mwjclv41GBl/XXfsbz/OVcd+BgvJEMVoyRl4/eGfqQbt
         h+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516799; x=1701121599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=;
        b=JZXSEpNgzl8usHHHR+Zc9qFYCgHF1Xd4/KvV7sFAxSdXYSXJ4mAjVrNYEcAtGeF0iN
         Ra87ezd/BIWWhJfS5GT/pf9Omz9w48p8SR/yJ6bGHB+jV9HMMU63w8PS5Y2vg46sCEVT
         eqVCfMHLtKYkqWxAOr0QuQoX7zIDCwo/73dL48gTJG7mOtZvFMheoXrbPPf7OmZ6TLhF
         1LSt4HNCLDv2uO2Y3CRDQxAMEvXHb3FXmxlilza9r1HYg0RDQSsgIOgf8RI39SLuDaAz
         BBL9A4dLcRTYvBQP4xi2cq+9ulkJJyI16PB+d38/lFmKN7YXOB2qOfqwSxP/ErxhYchs
         gHcw==
X-Gm-Message-State: AOJu0YyOtM98WULzHYB2HGo73HuMF7kRLxm49ZCgwxI8KeUoHamIDx86
	IyI+BnwrDT6EKU/Q5x9G4Pk=
X-Google-Smtp-Source: AGHT+IEPEt13Bi9UDLuM7ucKuA1EJUrPpC7p/7AqpQmlWfFXaZtyMu7XxxZkwo1OTgJaGb+DXzLqfg==
X-Received: by 2002:a5d:4531:0:b0:331:6df2:3603 with SMTP id j17-20020a5d4531000000b003316df23603mr4725750wra.61.1700516798842;
        Mon, 20 Nov 2023 13:46:38 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:38 -0800 (PST)
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
Subject: [PATCH v4 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:15 +0100
Message-ID: <20231120214624.9378-13-hkallweit1@gmail.com>
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


