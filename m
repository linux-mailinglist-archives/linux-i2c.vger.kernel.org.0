Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B221C36BEF3
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Apr 2021 07:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhD0FhY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Apr 2021 01:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhD0FhR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Apr 2021 01:37:17 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D93C061756
        for <linux-i2c@vger.kernel.org>; Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id j7so32167434pgi.3
        for <linux-i2c@vger.kernel.org>; Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DmgNhZA8y9OcAqQz4ZmmKKT0ZJqTstchwxs60f43ujM=;
        b=WcmtSLpGOQppOkaIFOJglGs6qgpdhC0GBDegcigac4xtnNSkBc9/CcqiQgJ3WbKILE
         Gs2oyMEkt+e4hyjxptvTbycReZ/0RwvAPQoZlwAZ8sZ8XbK2+xHnKRKUYQC2mDqLEl+w
         5J/SbXVbV6dmGGuYilQX3FBKckI+jX+WUcTww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DmgNhZA8y9OcAqQz4ZmmKKT0ZJqTstchwxs60f43ujM=;
        b=guWD+dM9SHVMmKUAd6hSUxLbkPND475i7ua8lOPgaTi08Swmp0bwz+U/pMGDJErZH9
         W1+u2YWrdi5m9kwOehEzWC9UXPMQlbEkbz+9n48MK4SYdNkLwvjeWlkyNmifnpr86H8m
         hAalnFYBEnBO/RZdSqD6G24nIIrl/rltxXcNzXJupRfJM+E7xba8ci0gYlQm0UZKVemq
         rFesqO4VxL27LKteNpa7+t6kUbW3/nq5LVam6C1JSAFHgacy3k1wGPTh9XHtwjqMwxro
         yXgD+WMvPILx1ucHVoPv0xDxUnxyOpLUGBbytAd1i9bMuqHQgRhUoJtyeu+N3ZYqncKB
         QlFg==
X-Gm-Message-State: AOAM533BvEmnKXL1kcyd854kOhJ1vDbubvkipqziKYLSnlawny/FKauc
        W09Oc6W4srcyf8x4BXHAN2eSlQ==
X-Google-Smtp-Source: ABdhPJyK6HPDL2dVl6Wi0k4rLfJc5+VoFT3tTwCq+4rkqx1pDkHVS+yVt1cvCRJAGH6jG1yUhZdMcQ==
X-Received: by 2002:a65:6414:: with SMTP id a20mr19805719pgv.96.1619501793489;
        Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
        by smtp.gmail.com with ESMTPSA id gc15sm993529pjb.2.2021.04.26.22.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
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
Subject: [PATCH v20 4/5] misc: eeprom: at24: check suspend status before disable regulator
Date:   Tue, 27 Apr 2021 13:36:16 +0800
Message-Id: <20210427053617.27972-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427053617.27972-1-hsinyi@chromium.org>
References: <20210427053617.27972-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
regulator in runtime suspend. If runtime suspend is called before
regulator disable, it will results in regulator unbalanced disabling.

Fixes: cd5676db0574 ("misc: eeprom: at24: support pm_runtime control")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 926408b41270..7a6f01ace78a 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(at24->nvmem)) {
 		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
 		return PTR_ERR(at24->nvmem);
 	}
 
@@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
 	err = at24_read(at24, 0, &test_byte, 1);
 	if (err) {
 		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
 		return -ENODEV;
 	}
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

