Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159241F90C6
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgFOH6d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:58:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:49136 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728781AbgFOH6a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=fF3lSMGhBbMaEw
        4hJjPl3xbw8QAkMzTwyEaeb0Y2E18=; b=NWCRR5jFc5pHDpaf5EMWFAZjeY/Dpi
        UZe1XMHxf7OASSyG0rHjOPg+uOYoMByMCzbgucAutMXB4sld05x0Qz4EqkGZvjD3
        R4jTWe0JRh2NnVWFSB65hwiESmkKRLPvrF/nsta3Knp6z9SesgtOetvuyM3uAuIp
        qo4UY+k9BXefA=
Received: (qmail 989178 invoked from network); 15 Jun 2020 09:58:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2020 09:58:28 +0200
X-UD-Smtp-Session: l3s3148p1@X3PGyhqoCrYgAwDPXwRdAFnN6pRlEuNX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm: encoder_slave: use new I2C API
Date:   Mon, 15 Jun 2020 09:58:11 +0200
Message-Id: <20200615075816.2848-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_new_client() is deprecated, use the replacement
i2c_new_client_device(). Also, we have a helper to check if a driver is
bound. Use it to simplify the code. Note that this changes the errno for
a failed device creation from ENOMEM to ENODEV. No callers currently
interpret this errno, though, so we use this condensed error check.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---

I'd like to push it via I2C for 5.8-rc2.

 drivers/gpu/drm/drm_encoder_slave.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
index d50a7884e69e..e464429d32df 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/drm_encoder_slave.c
@@ -61,13 +61,8 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 
 	request_module("%s%s", I2C_MODULE_PREFIX, info->type);
 
-	client = i2c_new_device(adap, info);
-	if (!client) {
-		err = -ENOMEM;
-		goto fail;
-	}
-
-	if (!client->dev.driver) {
+	client = i2c_new_client_device(adap, info);
+	if (!i2c_client_has_driver(client)) {
 		err = -ENODEV;
 		goto fail_unregister;
 	}
@@ -96,7 +91,6 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 	module_put(module);
 fail_unregister:
 	i2c_unregister_device(client);
-fail:
 	return err;
 }
 EXPORT_SYMBOL(drm_i2c_encoder_init);
-- 
2.27.0

