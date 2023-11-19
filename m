Return-Path: <linux-i2c+bounces-287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B07F05C3
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9921F22384
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9EE101E8;
	Sun, 19 Nov 2023 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hptP+jIN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02261D61;
	Sun, 19 Nov 2023 03:28:41 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-545ed16b137so4712227a12.1;
        Sun, 19 Nov 2023 03:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393320; x=1700998120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=hptP+jINdt6iLG3JZ5XTCKrrR85ub3oeba6+pQqzIHRe3GuB1A5PasGMgtxPbytOx7
         mvhHT+njmKxo+YY7eQxtAY//fOHBWwBGeYIoqbreVIp/eWOQV5XshaKJ88Bw6s9DgY4j
         u77EJOxIUQ27N7MocJjP7phC4ZtCIAjkyGmqVnQKWrEnLdeQuLOcKHOFdEKzcYrWvhJD
         bQLe830JxrazWpYqIOmDhax278abiOiOFWKUU+xOARVARIbpunsTKTTwg4ffKi32JB1l
         QDy9TPNAG0uhZw6+lBQsQWQ3mcUPaIVFEhtq62cvvylms6kWX9ydM6TOiMMizakOjInR
         bF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393320; x=1700998120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=R4Tr20nJBxPdl/2n4slYUPdzUIhkzQNRL26DKUTre8UrFgvIEC115dmvRd2Por0qEM
         Qq99Ude9sriiwikFCwnLP6St9Y2wQOP26D3+sgmWNZqNgMo4Tu3gnz2esXadCdXUEOqN
         MaC/Oea6MZ/nq4BgPzF7KjITJjHXR4GEGG1lhKW5xLeg7rWlpCC+aGSUAOg7BFyOL093
         sXnYiQrvb7AJYcXHFLtHIbqTnYm4g8MGAswvan4j02u39Hd5UGMkBduZmqHwauWqWSCw
         AdqEqXVgLlI0tVyO4sZ/UoS2S84/1zTV8P1Ww7kJgPjRI81chdrdwNkxiWRu+yIXI77Q
         2pUQ==
X-Gm-Message-State: AOJu0YxAQ9p/5R2/WG6/acsilRAWUUI5M26J7HEbGQ0+1vG5vSrDiYze
	6KSNHW6updnB/eB5AyEFy8Q=
X-Google-Smtp-Source: AGHT+IE+w9pgQvDl2Y3wxx8qGfyopeIAjzUYE/Lxfmit0zeTDVBO1PBeuPJks8PhZkZ7FJV0jaU+YQ==
X-Received: by 2002:a17:906:7396:b0:9fd:8da1:5c9f with SMTP id f22-20020a170906739600b009fd8da15c9fmr571228ejl.15.1700393320105;
        Sun, 19 Nov 2023 03:28:40 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:39 -0800 (PST)
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
Subject: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:17 +0100
Message-ID: <20231119112826.5115-13-hkallweit1@gmail.com>
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


