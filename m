Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACA235EFF2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350211AbhDNIkp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350209AbhDNIjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:39:11 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CD3C061344
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so12105906pji.5
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
        b=Y3NqiCd5rr7+LyVYEGOOOX4NYDJW2EOYrkF/TrtNRNqln3ctoJGKO0I0T0L0ApmQ3K
         N06EZWoCDwWvTUJ2L4ngADfH2WBuwxd73m6NYcBOtrsQQI3F9MRZMHIb1Y80f3kIAKNC
         j1j23aHDf+PkiUmZYXCsRhdPo49p+brePolV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
        b=j2CgcwUm+vtH3GHgfH1ysE4V24GrMEizA6mdhBV4ti1i+ZLuDgJRrEsG6a6XyLFpMM
         TkHU9dIXTOWzxtqauSYIo7rvdywPl8rOLXuP9iget/hAf9SWXgddZuXxTmdPYS+yTXUY
         JJOb0glKE1OFSfh1gBHwz9YCGlNvqcztB+Tia63WlJqNTh53H4P/zrOnyGefk5QXHad/
         53AgCjhe6skz/LTVVRVgM0u1Yi9tnDm3sk05yN42jx7fp8c/ewDPTnImE3MccZVM9VF8
         2pO6Wj4hWuxS7LrTUU4BbtRn77Vn5PmdMV0Hq0Rb3cNg7Leb8cRzu06RKghTIf7ewY/l
         CMLw==
X-Gm-Message-State: AOAM532jcV3avte/RziSLmPD58q8WHwKJpC+6E6lKrRP3qCEaqLrzvNI
        RVq4mZtG7Vo072+WWj8e93DPrA==
X-Google-Smtp-Source: ABdhPJzlShITTMJUXTCs2zEaR/hzAirHlP9c/EZQo05/1A8Fi0UiYdumG++22lWtt4vLwGQbGoVQew==
X-Received: by 2002:a17:90b:8d3:: with SMTP id ds19mr1590139pjb.197.1618389502547;
        Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
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
Subject: [PATCH v18 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
Date:   Wed, 14 Apr 2021 16:38:07 +0800
Message-Id: <20210414083809.1932133-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
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
index 2ffd2f354d0a..82f2b6716005 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1215,6 +1215,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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
2.31.1.295.g9ea45b61b8-goog

