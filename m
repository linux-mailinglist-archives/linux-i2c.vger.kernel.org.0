Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943D226D2F9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 07:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgIQFXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 01:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIQFXB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 01:23:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40D4C06174A;
        Wed, 16 Sep 2020 22:23:00 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d9so491131pfd.3;
        Wed, 16 Sep 2020 22:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S8OVV1mZhFttZGVKsQ9JByMqrc+T8zXoOJFR2iwsG4g=;
        b=csZiyQVYfnEgwlEZ9kS/DEtPg3WS1RIfpF0DBEL8GWXMXfDDMCPigCDbhzVUmQy9Z3
         +Xyf+LdqcXV8ZYAPetqHUqpn4AIZB9eLImehPcHNvpWRa4jbnkBZESrua7BZ6DiO0HnR
         NwIUXrYkCNtyR0lf+t4pCmxMdY5piTPrlIavN9hbVxnf1YGtCqhVgUBRR5fIT9iqAg2Y
         Wv/9zGTUNHSTUhjGtnsGdRUFXd4nVwPZdEbqEvxkGlhU7UTV2S2uTafqBI3M698XVbJd
         cBfwkRqUQq2Bzzqc7DJtO0tdBoorLPLRuWKTH0JH4KuUfNc5hKqIBEn73Adr7yxKtCBe
         hqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=S8OVV1mZhFttZGVKsQ9JByMqrc+T8zXoOJFR2iwsG4g=;
        b=gRXWwJkghLrglLr6Wrxar1CjbtBzJoMSotfyLgWc2fpP/MmAarldo+AQkMUHvfO/yM
         SWcw5zIw7zvvbaJrYbIARSq/Guh4TOJK1jkSlq1z+6hdisCwNnb8MTXPt5fxCkZGIc0N
         ERLyAR8H/Z8CsGhrCr2/Vnsg8spWMcKJV1Z/3xO3CcDlVwVFXy7xU/gwPRVb7VB7HccO
         f5fU8GTeTxCmwaSyTI0nb/4JPs+D4mX9QColFPyWPAnALyOIxFMwQkWiukdL9vHwuXok
         KyHjbqDfyQexhsNfm8rVdczWZFoWvdyksBOcSMpD8IqcprjoaqjYY69QJ0+H9zMdfc4B
         TV+A==
X-Gm-Message-State: AOAM530VduBSYJ8ZMxLNttxPxwJriWES14G2IMjhNATPi1QcG0VUqVz5
        uwDayBIFw/1I2602qCkUO1fTH17QFGEvyQ==
X-Google-Smtp-Source: ABdhPJwRiiZC9FoLVuFtA6sythUYEh5Tocm0uFHYXvuvsa86NUhl1m2QIEbHD1xVx6udreMMVpi04Q==
X-Received: by 2002:a62:52d3:0:b029:142:2501:3a00 with SMTP id g202-20020a6252d30000b029014225013a00mr9360192pfb.79.1600320180046;
        Wed, 16 Sep 2020 22:23:00 -0700 (PDT)
Received: from sultan-book.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id i62sm18705619pfe.140.2020.09.16.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 22:22:59 -0700 (PDT)
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
Subject: [PATCH v2 1/4] i2c: designware: Fix transfer failures for invalid SMBus block reads
Date:   Wed, 16 Sep 2020 22:22:53 -0700
Message-Id: <20200917052256.5770-2-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917052256.5770-1-sultan@kerneltoast.com>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

SMBus block reads can be broken because the read function will just skip
over bytes it doesn't like until reaching a byte that conforms to the
length restrictions for block reads. This is problematic when it isn't
known if the incoming payload is indeed a conforming block read.

According to the SMBus specification, block reads will only send the
payload length in the first byte, so we can fix this by only considering
the first byte in a sequence for block read length purposes.

In addition, when the length byte is invalid, the original transfer
length still needs to be adjusted to avoid a controller timeout.

Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..d78f48ca4886 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -430,10 +430,12 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
-				len = i2c_dw_recv_len(dev, tmp);
+			if (flags & I2C_M_RECV_LEN) {
+				/* Ensure length byte is a valid value */
+				if (tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0)
+					len = i2c_dw_recv_len(dev, tmp);
+				else
+					len = i2c_dw_recv_len(dev, len);
 			}
 			*buf++ = tmp;
 			dev->rx_outstanding--;
-- 
2.28.0

