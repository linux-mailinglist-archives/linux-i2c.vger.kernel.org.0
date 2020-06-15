Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782F11F90DD
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgFOH66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:58:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:49240 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728866AbgFOH6f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=rWVLXBN8H0735K
        mANx0Xi7PjlmfkXYgp3cj8uiqX6e0=; b=Q484isnRFsf1QvsOnLntY0nHvF/Dn6
        NNf1MRLnIQEm05cv87oO/tm43cwdU6j8sLWBMvS62RmTT9hMzdLB2RZWK0btlmyj
        NX+Y+vKw9HQlV8sTKN1kVV8UxkXLsOBYlphj5UzYqwk/QvkVJZ9DahgR3EbDmw8R
        HKf83NDWD8C7U=
Received: (qmail 989280 invoked from network); 15 Jun 2020 09:58:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2020 09:58:30 +0200
X-UD-Smtp-Session: l3s3148p1@i23jyhqoELYgAwDPXwRdAFnN6pRlEuNX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] Documentation: media: convert to use i2c_new_client_device()
Date:   Mon, 15 Jun 2020 09:58:14 +0200
Message-Id: <20200615075816.2848-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and advertise the new one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---

I'd like to push it via I2C for 5.8-rc2.

 Documentation/driver-api/media/v4l2-subdev.rst    | 2 +-
 Documentation/userspace-api/media/conf_nitpick.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 6e71f67455bb..bc7e1fc40a9d 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -451,7 +451,7 @@ The bridge driver also has some helper functions it can use:
 					"module_foo", "chipid", 0x36, NULL);
 
 This loads the given module (can be ``NULL`` if no module needs to be loaded)
-and calls :c:func:`i2c_new_device` with the given ``i2c_adapter`` and
+and calls :c:func:`i2c_new_client_device` with the given ``i2c_adapter`` and
 chip/address arguments. If all goes well, then it registers the subdev with
 the v4l2_device.
 
diff --git a/Documentation/userspace-api/media/conf_nitpick.py b/Documentation/userspace-api/media/conf_nitpick.py
index d0c50d75f518..0a8e236d07ab 100644
--- a/Documentation/userspace-api/media/conf_nitpick.py
+++ b/Documentation/userspace-api/media/conf_nitpick.py
@@ -27,7 +27,7 @@ nitpick_ignore = [
     ("c:func", "copy_to_user"),
     ("c:func", "determine_valid_ioctls"),
     ("c:func", "ERR_PTR"),
-    ("c:func", "i2c_new_device"),
+    ("c:func", "i2c_new_client_device"),
     ("c:func", "ioctl"),
     ("c:func", "IS_ERR"),
     ("c:func", "KERNEL_VERSION"),
-- 
2.27.0

