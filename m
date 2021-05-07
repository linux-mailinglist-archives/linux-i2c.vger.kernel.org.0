Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69663765DD
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 15:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbhEGNP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 09:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237149AbhEGNPW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 09:15:22 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6696EC06138E
        for <linux-i2c@vger.kernel.org>; Fri,  7 May 2021 06:14:20 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id b3so5103509plg.11
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kikr9ZhoRbpRt9r742gt6H3+Tb3lJblPdN6YyE6SQsY=;
        b=EAvHCPHyHbXHiIiNsXn2M8do7dMCJUcobH25Fpf1g+s7gllEtWszn+qb/57yyeQQmp
         CBhSV5miPj08lzUv2duZT8QDmc5As69tht5584Xf6Nh8y2dwtdK8QJ2ot5p1Qz9zsFgs
         U8IzCzmwdrhPxHFILcqqaB0XfofyPavr0uwkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kikr9ZhoRbpRt9r742gt6H3+Tb3lJblPdN6YyE6SQsY=;
        b=VrNrvJvoF71wO15Ih6OEliu9HbBUW08ldCchDbeKHLbN7FKib3VL4gu/7dUXLwou1O
         VrtHN/B9gAsXpvzoeBYXoIyVO+MsgxN5GN4qZxgGPumCeLF/k2ttpMS2/TxyInpVBgbq
         AvCHsEQ+iPTmxZmDkQFq/2FbLWQ+Uesourz5TcAMn0y2t2wRVFrUdYr6zaB8Lcfy1q3z
         jbmRwMuUXyTRHOOVjDjXx0oiWCyj17n7vUYt/rN7S8XcsFwBJaNzgfI1YDYtn8KFZyl+
         o3M62tuU6VIZI6nq3b8hTXuwexCz3VVSWGc0psDKJYDNl7FO20trQK+9RD8rCZPiuy0K
         tc/g==
X-Gm-Message-State: AOAM5331LFuYObQEidnq7BI7K3wCAdtLCUxB6eow619rO3G9mCuYoRP/
        Hzo0xVNinjCyXRyU3sWcsTi6AA==
X-Google-Smtp-Source: ABdhPJwXqN//d5LHFxyd15ybs67ak235z16Nesh7tNZdIpgwmAaqvd1c9pGhWHrfZAv/rGknYi/i1Q==
X-Received: by 2002:a17:902:8682:b029:ef:d2:4311 with SMTP id g2-20020a1709028682b02900ef00d24311mr6293896plo.4.1620393259946;
        Fri, 07 May 2021 06:14:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:711f:8553:a124:a19])
        by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 06:14:19 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
Date:   Fri,  7 May 2021 21:14:04 +0800
Message-Id: <20210507131406.2224177-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e56ee2..22d1d14b5de5 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1220,6 +1220,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.31.1.607.g51e8a6a459-goog

