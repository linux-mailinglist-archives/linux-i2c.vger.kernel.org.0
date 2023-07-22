Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C4375DC4C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjGVL7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGVL7x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:59:53 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FCB2D46;
        Sat, 22 Jul 2023 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZvEx+/bmIcBKo3sLB0qwnuNIHWgVCd4+TInDfv5ftPo=;
        b=qUKoHoDnUpbrNkx9bMwta1ALwle95h5zpiNJr+Vn9dD4RM8jXNsjuNgAxYos6Wax2kF4J0
        MJ6Qk/NmPSTDRJcQNpx0QTOctzBL1seHDEkZyySLBBY3BxhbtqCifyYRBQn2D+EdVBGJpo
        6JTFKp44RbAqBJ2ZOTlz9MnwoDtqeGE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Conghui Chen <conghui.chen@intel.com>,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v2 21/22] i2c: virtio: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:53:09 +0200
Message-Id: <20230722115310.27681-5-paul@crapouillou.net>
In-Reply-To: <20230722115046.27323-1-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

---
Cc: Conghui Chen <conghui.chen@intel.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/i2c/busses/i2c-virtio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 4b9536f50800..c60ae531ba57 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -243,7 +243,6 @@ static struct virtio_device_id id_table[] = {
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
 
-#ifdef CONFIG_PM_SLEEP
 static int virtio_i2c_freeze(struct virtio_device *vdev)
 {
 	virtio_i2c_del_vqs(vdev);
@@ -254,7 +253,6 @@ static int virtio_i2c_restore(struct virtio_device *vdev)
 {
 	return virtio_i2c_setup_vqs(vdev->priv);
 }
-#endif
 
 static const unsigned int features[] = {
 	VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
@@ -269,10 +267,8 @@ static struct virtio_driver virtio_i2c_driver = {
 	.driver			= {
 		.name	= "i2c_virtio",
 	},
-#ifdef CONFIG_PM_SLEEP
-	.freeze = virtio_i2c_freeze,
-	.restore = virtio_i2c_restore,
-#endif
+	.freeze			= pm_sleep_ptr(virtio_i2c_freeze),
+	.restore		= pm_sleep_ptr(virtio_i2c_restore),
 };
 module_virtio_driver(virtio_i2c_driver);
 
-- 
2.40.1

