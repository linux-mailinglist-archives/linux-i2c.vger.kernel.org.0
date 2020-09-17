Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F38726D2FB
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 07:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIQFXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 01:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgIQFXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 01:23:04 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5817FC061756;
        Wed, 16 Sep 2020 22:23:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z19so475171pfn.8;
        Wed, 16 Sep 2020 22:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WDZd8tsRsFWv5ihYfraNwY2+UbRPuk2ibJ4Vl5wi/pY=;
        b=teYJl6x5RIDP4Alc+XCeMh7yCiyF2cARRceeq+i17641JSN7U0OU5n93u8IZZtVpJi
         V2T8CjpZl28JlqCE/md0a60Fc4F1MUqdbbOd8RyT9Fjb3iInQaQ+nP2PGD3DFov4eQgm
         szNGCpEZP9y2rz/kQYi4+zO8MtYmsa46IejNRPhHEonc5QafOS7lMBNXddTMN4XuG3TG
         DicSWOAGXyj26lPRmeeWAdwUK7ju/GZIBSVnl4pqIK2Uy/Q8mJnjo+EFWeMSCgEVVoVt
         M8O44yIcPN4YWe+Ag1eNNQOepmbttBhMPdFOm0SKY4syLzTEisqvHcHqWo+Komajk2cP
         dEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WDZd8tsRsFWv5ihYfraNwY2+UbRPuk2ibJ4Vl5wi/pY=;
        b=gCxElnuDQ2Ua8QBQQ0xMi7w+vBMFuvWAbdZN/0+oHLNyCzUwIWBiNnmOPuIp7IbbGg
         kI2aM3kU+5TVCAtQzC05Wi92e5fZ86nOLVxgGn7ckyaSn9+oQ7ePcd6mG/BrkzizfFdc
         kc9rbNEZLtY4X4FyJNRNKZGPQAD69jAmdBUSGIiwmSbesPGKu0wXSJFzyaf/KYkrwG1z
         pBPGdG5qd4dKGSZCBgOBxIuRmuqgAFFTFmHkWMeRfs/qJeQItWUkfizF05WiWooXUDt8
         GR0AxXyipknN4tH1053bDFzlh7ge1fcegV7m8n6ZAyT+71yjEW8XFAMXfc39ozyOA5gw
         tFzw==
X-Gm-Message-State: AOAM530fJiuwp/EZx9CrfweUPSUTSXq3pUSquXyW2D1gwWVa7wiZIXZp
        s4tw5TECTAI6N7gjVjvJ8v03tSwtxT6xsg==
X-Google-Smtp-Source: ABdhPJy2yKyMB98G1d9fOVe9cyIU4MU6rtz+y+tWiJJCWV9cCeeHDV1+2ZamQ2v/ihfI1xB0w2VS9A==
X-Received: by 2002:a63:516:: with SMTP id 22mr21793976pgf.316.1600320182593;
        Wed, 16 Sep 2020 22:23:02 -0700 (PDT)
Received: from sultan-book.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id i62sm18705619pfe.140.2020.09.16.22.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 22:23:02 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     linux-i2c@vger.kernel.org
Cc:     jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org, Sultan Alsawaf <sultan@kerneltoast.com>
Subject: [PATCH v2 3/4] i2c: designware: Allow SMBus block reads up to 255 bytes in length
Date:   Wed, 16 Sep 2020 22:22:55 -0700
Message-Id: <20200917052256.5770-4-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917052256.5770-1-sultan@kerneltoast.com>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

According to the SMBus 3.0 protocol specification, block transfer limits
were increased from 32 bytes to 255 bytes. Remove the obsolete 32-byte
limitation.

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 22f28516bca7..5bd64bd17d94 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -433,7 +433,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			if (flags & I2C_M_RECV_LEN) {
 				/* Ensure length byte is a valid value */
-				if (tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0)
+				if (tmp > 0)
 					len = i2c_dw_recv_len(dev, tmp);
 				else
 					len = i2c_dw_recv_len(dev, len);
-- 
2.28.0

