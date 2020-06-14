Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208A71F8ACA
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 23:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgFNVDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 17:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgFNVDD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 17:03:03 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4738BC03E97C;
        Sun, 14 Jun 2020 14:03:03 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id j1so6921148pfe.4;
        Sun, 14 Jun 2020 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2q2lkPFOE1HHvSqY9cZoSA6nGM3ktOf/xAtJkt4U/Uw=;
        b=dRCJLEYOknC4Q65AQGXfeoeQt/C0O0Ubagurth12zIP89W8Ycx2CkZeL5O03eoQipT
         8Vpk3C4QWR24/wtDHw8vc3WQBUd/LWygYtviJuzjg9mFUn8ODSrpnrr1D80pKPYB1qzg
         cBTGYnR1ro24q9Gju96PgmjzySd9tR3rARoFGHlcQAOG+0WjIYWmkXSxYzb6iev+Y9ze
         r1FpePsj96BJFvMkmODM0u2lrK0X91I/qt+TvpbVhQhC/YaxTfrpBVZNldeegg5Uauu1
         XL4vflIlTJXobIA/EbNdPOgoyvliRejufvGdcsDXYv3q4FPtR36QVDsN48Sio7JpaybA
         s8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=2q2lkPFOE1HHvSqY9cZoSA6nGM3ktOf/xAtJkt4U/Uw=;
        b=fMEYXCMX+KYGA7LOHurXMHr4o+MzpPPJ9S94d656uX8YRcB92aOpNzOC59JLUilPsN
         I/DWP01kgnwpMpE3HVi7BSl4TqNlPxgYQotNZR+c+bpv2lNKU1Wu9Qv5mmajHKWLXO4q
         JBMFfX18egwHKWK6YOANz1871PHXOW0etfB357d6CJizNfUOohM2nsDf36gh3zD35N1K
         JO5nSa9mOM78NDiBexg++qvwWh++xulmWZXWz4NNdW1+7hUL/c6tsJNp+m+nZ4Fp+R5X
         36zm0MeT1G48nUmq1WFkU2cVD4YzcK3jU1mWk+J5b67RCWZ7v8Rlm+qY4yWNyg3WHszK
         zdpw==
X-Gm-Message-State: AOAM530qw/wxmYycNTajBH7MsoD5adRCmlU/EVRxUi8fypfuPoRTHxdi
        42cnz1pIgaxs61G4ej3TV14=
X-Google-Smtp-Source: ABdhPJzw9epsD325xpNNSKo3Fuu16DuLxdXw28bisO0FNwLCA2uutIGU8+3mhVda0Si6mHCnSm1j0Q==
X-Received: by 2002:a62:8608:: with SMTP id x8mr8124633pfd.96.1592168582669;
        Sun, 14 Jun 2020 14:03:02 -0700 (PDT)
Received: from sultan-box.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id d184sm1827746pfd.85.2020.06.14.14.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:03:02 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     Aaron Ma <aaron.ma@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
Cc:     Sultan Alsawaf <sultan@kerneltoast.com>
Subject: [PATCH 1/2] i2c: designware: Only check the first byte for SMBus block read length
Date:   Sun, 14 Jun 2020 14:02:54 -0700
Message-Id: <20200614210255.4641-2-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614210255.4641-1-sultan@kerneltoast.com>
References: <20200614210255.4641-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
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

Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..16d38b8fc19a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -398,7 +398,6 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
 	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
 	msgs[dev->msg_read_idx].len = len;
-	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 
 	return len;
 }
@@ -430,10 +429,11 @@ i2c_dw_read(struct dw_i2c_dev *dev)
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
+				msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 			}
 			*buf++ = tmp;
 			dev->rx_outstanding--;
-- 
2.27.0

