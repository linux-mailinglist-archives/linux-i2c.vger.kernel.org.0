Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9966302D5
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKRXTV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234215AbiKRXTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:19:04 -0500
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [162.55.41.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EF597ED1;
        Fri, 18 Nov 2022 15:04:23 -0800 (PST)
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
        id 5F70968F731; Fri, 18 Nov 2022 23:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
        s=2022; t=1668811575;
        bh=LlspP/CA3mDLhx5AvEkQCfgDBdtUPqlu+K6RNIoku6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KuKVH8ytJVbCJPPfClkVqVK/dVOGGWU+fk6eowX6oJJfczzpxGgC3Wv9NCrA79VCu
         PjpMMMixcBbeLppwKyYjjSWahr2tlIrPk+O2AT6OqPZ6TpiTUPMOqLDLfefieggdd1
         jAGbGJ7dbzYJCEVPoG2a7l3wPR9Q8EYXB6P40m6Kvaxks407PlFze8XWz44WGIWyPO
         b1bOrpwmJnFrEE+9HbCOutdTPdzp/pn0W1G7EJzclTU40X9JYohKFu5OZkL4mYHym5
         C9Mr4ocS6IZeufXFM/Xn8n6EdRDpHUPP33C8kzFRUbv9Z9l1ezF5YnG2fGfbEDNUbg
         mla6R1S0pjflQ==
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:36:12 +0100
Message-Id: <20221118224540.619276-39-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 578b738859b9..e0476a5bf84c 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -386,7 +386,7 @@ static const struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
 
 /* I2C driver functions */
 
-static int ch7006_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int ch7006_probe(struct i2c_client *client)
 {
 	uint8_t addr = CH7006_VERSION_ID;
 	uint8_t val;
@@ -495,7 +495,7 @@ static const struct dev_pm_ops ch7006_pm_ops = {
 
 static struct drm_i2c_encoder_driver ch7006_driver = {
 	.i2c_driver = {
-		.probe = ch7006_probe,
+		.probe_new = ch7006_probe,
 		.remove = ch7006_remove,
 
 		.driver = {
-- 
2.38.1

