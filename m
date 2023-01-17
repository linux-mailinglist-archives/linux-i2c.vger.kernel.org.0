Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41A3B66D8A3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 09:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236201AbjAQIuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 03:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236252AbjAQIt7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 03:49:59 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC92C23677
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so7542518wmc.1
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnntDb2wSxyksznyUK9vORluc24yy6XtA4jjRHLcBuk=;
        b=LYUV60VqALvvzk6MilzChbMVqyD/B0GIA7z7QQD9RC9k/FTRraa9aq3o9DhdmmF3iq
         bEZxLJ/EPaEukjPDguwckMzwT4iZWzklaDDCcm8uvmRbfgEzQZ6BypnK+5qR13RDCnuo
         g/NoNBxqzf6YLnbLdMwkvsPYPgpfMg1IVWEfSQM4dsbIHLnsghP853ZEx8x80OXMesKO
         Gu6CisBcCKzX5DE471QmgAykmNMIdj+swGJPBP7wSz0pf8//+a8SQFDGZUzGW+MnbWQ+
         84Q0DSLD8KCf7zQKe08zeZA1GxLvcYKM7P0/3YWWTFKmdYhwcXPB8+J9/t/YfUwb6Dp9
         NQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnntDb2wSxyksznyUK9vORluc24yy6XtA4jjRHLcBuk=;
        b=IFpt4+1UkcEfv5UEwB+4vq1iya9id+ke7pR/qddyp0s5eZ/DcVjDAOh0sU6ruuhiSX
         XqVb2rTeApAC3/l5FKuGaF+5dsKQCx7H8DPsxhQU55Q/NsI8ySpI7flJNEXqTdLGGpEr
         qWcDO6FmQ1HmlhnFNpydVOhlJmBCO1DnfEM9Mx7BouB1RfFO3PWmkl+AI5JPo+40ksO9
         hTSs26sp4BdJWJA2cwPY5x7jsKoe8zBMC+ziu0VdBSab+njDq4FHcLAUJPptGK4yMRRK
         OaL2asYlYqyuOnVnW6jY5GM5LoYZijkVoLwCYaIapQBKBKp/BO1uFjC/BFuTGM+8gW1Z
         U0hw==
X-Gm-Message-State: AFqh2koFnCujIPPb2R/7P4Tar8oCS64z9ifvD5KR1Xryq4gK5UryAj8J
        3DIV0aCR3xeFhCPDS0ImouVCF0x8bkhvtetT
X-Google-Smtp-Source: AMrXdXvVghYU3f6f4pnX+urBDdE5Tc0O9C8WHHbtOL7Y9xI3DWYl8EiIm5gXNSp4H0aKqqrXqdqEMg==
X-Received: by 2002:a05:600c:920:b0:3da:22a6:7b6b with SMTP id m32-20020a05600c092000b003da22a67b6bmr2225151wmp.13.1673945396215;
        Tue, 17 Jan 2023 00:49:56 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:55 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 17 Jan 2023 09:49:42 +0100
Subject: [PATCH 4/4] i2c: i2c-mt65xx: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-4-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=TWV0BAft8RkOG5xbYhjbDPUS/3D2IDzrN9QH/A7cKxU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEuVzYMtofJIUJ5oFTa3W0oKUDkqaKLoTvfJXnh
 0IBK/E2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURcOQEA
 DBqTEdZxCLimcj4ODKJJMfctwwdA7ZiAVFTtdGMWA71M/U79w8cFUVxFHSXnTn47gSHeFVcpiyFjaI
 DM0uhFv5NDrZdV3SvNjHSaHSCDFeQE+N5c9Uzhc431ttuJryYIry72+ioFiUOTnA+U/JDGaD1M7a9m
 7tL5AJP/pd6FzUpK/mV+KL/oRcSU45dHzjB2WbXsafsVh0yoMAoH2ONYHbYsE9VACpkQs8w11L7I6f
 MgM+zhIRh9TzyVGZ4uL9mRIOgiVqSkRJgNyPnFKCVgpa89Dv+rxu0+Uc7ZJ9OaOXnAAw6+GIvFrF7B
 FMDPiQ89s5gm9KpDwc9Mq/QcKfGm6J9gpPGiMo8mMOx6Jjwl2Pe4PFrbj/CH7lGxINvxSdbUcOkZTL
 1kUybTF+GoV300oW3Vfqd36rJNPg5T4A2obypuNuBiZ3UTueo+NATNKkWnJc+MxMy92nY4enQJ4TP2
 JKVX1z0A1FPrgtwj1B9IsKKaaK30kPyFuVZSIgLNpXQ5FqeHn9VQAypE9CUnNJdzDZBnOCaLYMeRmu
 XVLDdGgM/IsiHN6asVJvJMCpLe2H9voep8GpiI6rPdNcDDd9IQkkdOMROkZRyRto73sWYT2RlbZTwD
 GFFhgWu5qafDgyJWt1h1f8uSQDUo7fjIA0XyiyGP/zssH+KUXbMKkrEWIf/A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add support for I2C on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index d80e59340d97..2c9dbb42861a 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -511,6 +511,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8365_compat = {
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.apdma_sync = 0,
+	.max_dma_support = 33,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
@@ -523,6 +536,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
 	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
+	{ .compatible = "mediatek,mt8365-i2c", .data = &mt8365_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);

-- 
b4 0.10.1
