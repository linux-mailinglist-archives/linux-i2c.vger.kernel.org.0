Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2D6391E51
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 19:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234647AbhEZRoj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 13:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:55982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234719AbhEZRoi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 13:44:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EF87613CA;
        Wed, 26 May 2021 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622050986;
        bh=L6ZERcFQRXFY5Eq7IrI3ZVK644fnEzuNtIKVNiqxfeA=;
        h=From:To:Cc:Subject:Date:From;
        b=Gh0eIEbd6lct5+00t17BNo12UZUD1H4HQEJ+rnY7PS9PGAarxK/W2fTwzVr+vMy54
         paLxKy/5uR3kJwNxlgDCc+aXO5UUA+1ksq0/8qX0HBn0CyKuULqlDbn038wv3D/a3d
         iErpZGk4ZdxsSlHmD/ikNzN/ePLSXFz6Yiav5WKwONd7BgiRPboUfdZra8/Cxivbpv
         UwLXyg35FHEwu2SpL98FQi1CwLgsV/70FIumROHu87asORXrCUogiDlFkltmI5jdpU
         RmfNiiBU7Nyks239wTiaqcwdqxNS3kAN4y1lSY5MImZl4rqM3UanQR2jS0xAosmAq2
         PTSl+hbMfiniw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tom Rix <trix@redhat.com>, Sean Nyekjaer <sean@geanix.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: core: Add stub for i2c_verify_client() if !CONFIG_I2C
Date:   Wed, 26 May 2021 18:44:36 +0100
Message-Id: <20210526174436.2208277-1-jic23@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

If I2C is not compiled, there is no way we should see a call to
i2c_verify_client() on a device that is an i2c client. As such,
provide a stub to return NULL to resolve an associated build failure.

The build is failing with this link error
ld: fxls8962af-core.o: in function `fxls8962af_fifo_transfer':
fxls8962af-core.c: undefined reference to `i2c_verify_client'

Reported-by: Tom Rix <trix@redhat.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C burst reads")
Cc: Sean Nyekjaer <sean@geanix.com>
Cc: Wolfram Sang <wsa@kernel.org>
---

Note the broken patch is only in the IIO/togreg branch at the moment.

 include/linux/i2c.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e8f2ac8c9c3d..aa52738b9c46 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -343,7 +343,14 @@ struct i2c_client {
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
+#if IS_ENABLED(CONFIG_I2C)
 struct i2c_client *i2c_verify_client(struct device *dev);
+#else
+static inline struct i2c_client *i2c_verify_client(struct device *dev)
+{
+	return NULL;
+}
+#endif
 struct i2c_adapter *i2c_verify_adapter(struct device *dev);
 const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 					 const struct i2c_client *client);
-- 
2.31.1

