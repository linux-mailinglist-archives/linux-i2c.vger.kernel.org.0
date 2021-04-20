Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318A2365A21
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 15:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbhDTNb2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Apr 2021 09:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbhDTNb1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Apr 2021 09:31:27 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4EEC06138A
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 06:30:56 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n10so8532683plc.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHz5AHGIJOCN6El7KH5rcuP6uHYumsVN1J8d0zR8Sl4=;
        b=WJMXVyyRgaaGiq4QghNgTJZ2i5N+7y17unDN66yMk/VjRNpAEmw4xvS3SdRu/WGflA
         vMb/OAII46HQ43OVVLOTTtrq9Kuzhf2D1Id6D86bWrDrQ9WUfYJUyIolFd58iiSwakwI
         0kM0uWj43GLOZcBZTl2atXqMoMGi+3chm+gHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHz5AHGIJOCN6El7KH5rcuP6uHYumsVN1J8d0zR8Sl4=;
        b=PMrWcKsixu/9V5vw5KMeDXq+p4DcohPtUBiO6o2qs2UfpGMeIPvREwTIBqauPwITkM
         fmWtPQtSvma7b5eNZfCt92zWv/TKRlD9KVQifXlu55aPYn0Zb6ebJxeSAq0mk1RnLN5A
         2W2I6niTowy0oz/J2TkHyNvAnY6UrIbdSdKRJZlKz6BBuv3q7xtUQMGhFCsLRpT2Nic5
         n0UU0YZY1/betf+8N270SAZT/JIGMCxlj26cajtKc3OKravcpdukAAoE1nvhmf8t/K02
         A8f/ZmV+I8GCGn3ET6a7e0vWrjUOT3KsmhaYeBkeCsz/z/f43Z82jkJX8Y62LV8KHjfJ
         AbqQ==
X-Gm-Message-State: AOAM532As6Dn0LDquwlEeoDXh7yVCfhOS5QZWLiF9FjtDZDV/Pq5CT9U
        VYZIaRxPLCKjzc/dH+5eZdaRyg==
X-Google-Smtp-Source: ABdhPJwOQbxWB6lznWwRRMkY+UhBC5RN2VH25PSDhcpX4tzH8sX7E+3E+719WIBZxEYYHLE2DjwiAA==
X-Received: by 2002:a17:902:6b43:b029:e6:3d73:e9fb with SMTP id g3-20020a1709026b43b02900e63d73e9fbmr29174032plt.37.1618925456060;
        Tue, 20 Apr 2021 06:30:56 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dd8a:99b8:c84f:86a2])
        by smtp.gmail.com with ESMTPSA id 25sm16852484pgx.72.2021.04.20.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 06:30:55 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] misc: eeprom: at24: check suspend status before disable regulator
Date:   Tue, 20 Apr 2021 21:30:50 +0800
Message-Id: <20210420133050.377209-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
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
This patch is originally in
https://patchwork.kernel.org/project/linux-mediatek/patch/20210414172916.2689361-5-hsinyi@chromium.org/
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
2.31.1.368.gbe11c130af-goog

