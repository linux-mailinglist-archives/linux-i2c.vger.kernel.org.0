Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBF612BF6B
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 23:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfL1WR1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 17:17:27 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40403 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfL1WRZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Dec 2019 17:17:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id u1so29973069ljk.7;
        Sat, 28 Dec 2019 14:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XooarHYfJfZshBGzPfhpSIkO10pFZYvOSKKStqb1xs4=;
        b=B10v1fX4z5rogdu7DoVXV/gHZXGGsG+KAMlbrXkU7rI5ZgM49eExWBK6Vnn7wO1D0C
         gXKesFyNjrCz7vnn38mMdD9VuIAchFkeAOIMso01fjaUmZOHQ5gZU5uxycDqV9EkadUx
         Yy+uscs1/O8ONF39yfqB7fC8BvRBzblnt0HJcc5IvJHqv2hgFTlvs8/jV9VBitqxOxl5
         ek5gAzgT+z6CRxQo5t7pAoeD4Ta7oRWStJ5eijnzCdAoc5fqthqbwxOvhG0c9S8BGY3v
         DLB65reMyoJJX0ZGEiV1s2b15uh7USwin8NWrNrRWKf2+Bg3X52J5JXEb+mgiYia4o2i
         YxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XooarHYfJfZshBGzPfhpSIkO10pFZYvOSKKStqb1xs4=;
        b=j6v1WS9OBRzPKkixp3GrZPppoP4NLS2ij6kowssiDCn1BAhtuQD92zqEBwwuL0iUUr
         feqVPyiv5BZtgsYVx8GXFhmtKsQ7PWptS2jEJH9RSqn+B35HH+XrAs5ixbfcr+LYxNlm
         s/mgCMnhYgnH8HGYahKJ8m9ac5cOlJxj0Y9jpw4yTsXiVZXdaSnxFQv6pTQkU156Kr7O
         xW1W3U2pH/vwbepC6Yx55AWlnhHkee13+F1Wu8Hqf0jJz046lH9u5xqc8bOwSTRJziCb
         URRc6gF4SI8Vtytk1okR/z3BTRKMC8cNc/NS0JS3PWtHojsv7dpE2KF5orYlOd47yURr
         VT4g==
X-Gm-Message-State: APjAAAUe2jdA+UdhIAulax8Gd8aymE9Kj0D9Xnu+i5ZVDwIg0LEJGixJ
        v0ryyCBErhvyMiBVp6foWSA=
X-Google-Smtp-Source: APXvYqwF4NyqCXTQdsAv5BiSUqI7k75II5fxqUAbKyKiq1ulVl9jTG5HYy1qq/W/06EYVvIucW8LAg==
X-Received: by 2002:a2e:854b:: with SMTP id u11mr16062701ljj.90.1577571443424;
        Sat, 28 Dec 2019 14:17:23 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y10sm15209584ljm.93.2019.12.28.14.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 14:17:23 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
Date:   Sun, 29 Dec 2019 01:16:53 +0300
Message-Id: <20191228221654.28842-6-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191228221654.28842-1-digetx@gmail.com>
References: <20191228221654.28842-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DMA is preferred for a larger transfers, while PIO is preferred for a
smaller transfers to avoid unnecessary DMA overhead. There is no strict
size limitations for the PIO-mode transfers, so let's rename the constant
for clarity.

Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a61aea5845d4..0e88c7aa7cd5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -131,11 +131,12 @@
 #define I2C_PACKET_HEADER_SIZE			12
 
 /*
- * Upto I2C_PIO_MODE_MAX_LEN bytes, controller will use PIO mode,
- * above this, controller will use DMA to fill FIFO.
- * MAX PIO len is 20 bytes excluding packet header.
+ * I2C Controller will use PIO mode for transfers up to 32 bytes in order to
+ * avoid DMA overhead, otherwise external APB DMA controller will be used.
+ * Note that the actual MAX PIO length is 20 bytes because 32 bytes include
+ * I2C_PACKET_HEADER_SIZE.
  */
-#define I2C_PIO_MODE_MAX_LEN			32
+#define I2C_PIO_MODE_PREFERRED_LEN		32
 
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
@@ -1098,7 +1099,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
+	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-- 
2.24.0

