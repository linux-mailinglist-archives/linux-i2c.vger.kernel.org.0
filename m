Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53FF52E970
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 11:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242715AbiETJyf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 05:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348007AbiETJyd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 05:54:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06B514B660
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=vDEMEWp+BmgerKos80VGiEwf+Ck
        34UFR37s7ST+K7Aw=; b=ebQxQfaHl7KGNeQCDQY13MyBwdNHxZIg9/BbNg3HD3a
        pQ1Hbmeu9T3wHCaRhLSd1J07Gdx7KyjLw9kBZl/2rc5EdGmozlMCM4wR8mZZS1wJ
        fOLv+xoEt6x7oZxTdA7GcmMY3K2Qq8nw03uJeJJ8cPiAnfAEbs6MJ9sZPIqovpyM
        =
Received: (qmail 3722136 invoked from network); 20 May 2022 11:54:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 11:54:27 +0200
X-UD-Smtp-Session: l3s3148p1@3E3WeW7fzXVZD+8D
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i2c: rcar: fix PM ref counts in probe error paths
Date:   Fri, 20 May 2022 11:54:21 +0200
Message-Id: <20220520095421.51742-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

We have to take care of ID_P_PM_BLOCKED when bailing out during probe.

Fixes: 7ee24eb508d6 ("i2c: rcar: disable PM in multi-master mode")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* fixed some exit points to 'out_pm_put' so the fix actually gets applied
* added special handling for errors on clock calculation
* reworded commit message and subject

 drivers/i2c/busses/i2c-rcar.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index ca61dbe218bf..3e49e652d83c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1086,8 +1086,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 	ret = rcar_i2c_clock_calculate(priv);
-	if (ret < 0)
-		goto out_pm_put;
+	if (ret < 0) {
+		pm_runtime_put(dev);
+		goto out_pm_disable;
+	}
 
 	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
@@ -1116,19 +1118,19 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto out_pm_disable;
+		goto out_pm_put;
 	priv->irq = ret;
 	ret = devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
 	if (ret < 0) {
 		dev_err(dev, "cannot get irq %d\n", priv->irq);
-		goto out_pm_disable;
+		goto out_pm_put;
 	}
 
 	platform_set_drvdata(pdev, priv);
 
 	ret = i2c_add_numbered_adapter(adap);
 	if (ret < 0)
-		goto out_pm_disable;
+		goto out_pm_put;
 
 	if (priv->flags & ID_P_HOST_NOTIFY) {
 		priv->host_notify_client = i2c_new_slave_host_notify_device(adap);
@@ -1145,7 +1147,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
  out_del_device:
 	i2c_del_adapter(&priv->adap);
  out_pm_put:
-	pm_runtime_put(dev);
+	if (priv->flags & ID_P_PM_BLOCKED)
+		pm_runtime_put(dev);
  out_pm_disable:
 	pm_runtime_disable(dev);
 	return ret;
-- 
2.35.1

