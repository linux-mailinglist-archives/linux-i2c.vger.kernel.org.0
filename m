Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CB035EFF5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350341AbhDNIkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350235AbhDNIja (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:39:30 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A341C06134C
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:25 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id w8so9787107pfn.9
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
        b=M2Qed2dqPK3r2F98RhSaRL4bhJ+/mwydP58V5jXiwgHzzCjhvHuA6DumjP2cVJF/PE
         LpXbYiNhZZrcgzcxjfHV9MolbdoNxqDa+iBVipjy7/zVGTBS4fe7vwq1/dg8wzSWUt5+
         lwVsSMsZUN5IC3SmEKK+a6EIiwtDNx4SUXIDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
        b=cpoyP0qmsR0dLujFOEsM7tU6KWIKHOKdyEN7bWVpWXlDVIjg+VKYqet4V+1xIlx97i
         o9dTgLtjso9uMnwRSIaFyz53/0b/tbemONQ8GlIUnhcg97SYNug12DBz7VHeP78/ca7b
         mCtHTxthqSlmuCJVmaYZkDYthgZScuK6gRjzxxjFbFOEnkuk6Cm+SAA21PKfyPLtotVL
         eo7d4DEv+kTrfsJ+BC/0wi4HAoOD5RBhHwotoFhIFgSHVsfqsoijVXwMx/u6u2aUJ7Y6
         zsvfeZlLY9K8bQqNO7Lfqr1oYzJxkZEU9GZ0MmrtIuVHDtlN3pzt6tAr6sFZxeEf3kHU
         nz4g==
X-Gm-Message-State: AOAM533ds+18krq3EHOPc78ZeMEkOm67sAujsCU92cpgzvkqsYJL19CF
        idfuvCXUdLsYwAS6gJzY+uvfPg==
X-Google-Smtp-Source: ABdhPJwD4LQbePm4sDMFJpfH5dE5UMs7w65+Ap4I1G0x9cqB/s9fdo197WaPyYM+2axsd1BSLYd4ug==
X-Received: by 2002:a63:4413:: with SMTP id r19mr35948254pga.75.1618389505195;
        Wed, 14 Apr 2021 01:38:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:38:24 -0700 (PDT)
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
Subject: [PATCH v18 4/5] misc: eeprom: at24: check suspend status before disable regulator
Date:   Wed, 14 Apr 2021 16:38:08 +0800
Message-Id: <20210414083809.1932133-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
regulator in runtime suspend. If runtime suspend is called before
regulator disable, it will results in regulator unbalanced disabling.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
2.31.1.295.g9ea45b61b8-goog

