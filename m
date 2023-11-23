Return-Path: <linux-i2c+bounces-413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681A7F5B57
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67DD51C20D57
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E64224C4;
	Thu, 23 Nov 2023 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax06D3To"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF627D66;
	Thu, 23 Nov 2023 01:40:56 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-548d1f8b38bso987000a12.3;
        Thu, 23 Nov 2023 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732455; x=1701337255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=;
        b=ax06D3ToerZNkEYfVMdZ2GCQJOdfiLST55aBuVlXbhRqwp8znHX+SZzviHsbfdgE6O
         jtUrf3shJRwfCl2ThjcHBPiUrq+YYrBf3zXfTvHx7HwFXVONowhL6jSsi5plYu5ZJNsK
         Tm7LwvnBl8KbwJ0VU4YG8ekenYVgzCSfLXbitofqDLZdl9/9HPtA0UWBbYxvTWWKyGks
         xRELYQJO9jbEHR4dNcjmWS6vWq2pDqpiEYhALibqdgiBIUfR6tgLnkf48MADGNglatDI
         m5hPnG1b6rfbQjYczfp1q4Mp5+3hjejo5cYOjNe96RPq1+E1TNS2u1PFSwkCDqcU2fZL
         qPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732455; x=1701337255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=;
        b=BJ4qgODzNc+e7negr5hYssJse3ecZU2wPup02HuToGoH+2CGuyVv3y4SZf7ujrVwd5
         Sl6lufs/8MSDQOH+7F4xx80mfW93vPg0iAMBjjTeA3awFronId6FtpXSMma1IkgDvTwt
         pis84v5yVaMOmrO0akae3deq6FiG92pgEMui/jhlZ1eWQOW9N+Nc8aIfgvQMvgFh+vYA
         FTuYusZDSmp4TO9NqlKCJdEIx8UWk96SQjNcGVhp1UZiW6YQPQbRMRzsj3pD3YrlgpWO
         QaGvwkDKkpQl7s0O8veBio6KUYl7IFWYcn5l9c3MiydtQwTn4UkT4TrzCG2oLsaPHAl+
         WfWw==
X-Gm-Message-State: AOJu0YzzlgdzGChZDPZuzVH68QurnxOnFMb+AJ9AihioVQSv6znH7BjU
	L2vlC4YpfeZp2REbVP1Jk48=
X-Google-Smtp-Source: AGHT+IEhOkC6xnGbAR37vpV6MkHztMHFrS18pW2+Z/6tkJJXSA5ZZsQMtb3qt5G6Cp1hpv+vQnc4XQ==
X-Received: by 2002:a17:906:51d5:b0:9bf:7ae7:fd6c with SMTP id v21-20020a17090651d500b009bf7ae7fd6cmr3174848ejk.10.1700732455026;
        Thu, 23 Nov 2023 01:40:55 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:54 -0800 (PST)
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
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:32 +0100
Message-ID: <20231123094040.592-13-hkallweit1@gmail.com>
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


