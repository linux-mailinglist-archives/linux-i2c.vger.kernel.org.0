Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE7E26D306
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 07:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIQFXn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 01:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgIQFXD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 01:23:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19171C06174A;
        Wed, 16 Sep 2020 22:23:02 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l71so680247pge.4;
        Wed, 16 Sep 2020 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9VSuNM4l/40vayIg5SAmxrV3Ky0F4a/ev4/YbXR38I=;
        b=jfykg3GQwbbnkRd4mHs2T0pRUdzz6Qg04xQDWonYE+62vUyPxk2CSLjNyOuwQCK0wQ
         kUaQ8/9tGinqIg9HVGsDRNH6jabj28nmPIwstqFlvS6NsEZ/loOvs/JlEfSnQrlt0TUv
         riOpGWHsnRPnO1Dht3mtFK6Ge7oJALV93RpiDKnage3a9TapArQxpoR9EkToOJwoZGmg
         kkEAiBqlnuCdonIX3vCrWzrli6uuZdrpxpmBW/pxRXWNcnMB6YpNk/E5lVt/7rO+TqRm
         uLSMc4LtD9P2wavTLkjV+i3S0Nd3eQnJDFKgmPEc0HHyoCP+C1lS8QSTHxhlgomcEzNj
         oXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=H9VSuNM4l/40vayIg5SAmxrV3Ky0F4a/ev4/YbXR38I=;
        b=FXoiZMlyebz0KIAfDUWB3Qgcy/xKvQwMRYdSn+NEEuQUhPCJXr74M8XQsI3+9ElhpT
         NIhXECTpQuz+aJY/xRyPquq5/m5UJOEs1mGIEaJmGKdvwgjiGYCEKJIKoiqm8PAHRu7Q
         4Z86Tcqu1Y49EI4jV9kz51XXlG4Z+ItSF84Feut9fPvMJ6sHLBBnCQyO5FvrKm62/YgT
         b6c6xsUGtVGN4vQjEc1zCmiikHMsYQwVJZ/lqAa5bj+IAhKg11yUlJGLoOMJwZ7QtY+U
         m2z5l54//8O0Z2q1sxIZMojCcB/+LZZL2YyYZJHv0kaLJYDNZOO2TCbTj9Z0WFzrCLn8
         1Dgw==
X-Gm-Message-State: AOAM5323ifwaT3cRS6jfMKodiDbWoCv2/roSNP+pe27a8cZ4Uh98fKJQ
        clVzq516dvPCnBlWYRtsIlmsvKO5dDxTVQ==
X-Google-Smtp-Source: ABdhPJyQj2W93OVJdgG0z4BQfii7Jc+Bx08sqfPo7FS4qcFN/sVD4CD3GQSjhe2kx8kuKnZazAVFgg==
X-Received: by 2002:a62:fb1a:0:b029:142:2501:39f9 with SMTP id x26-20020a62fb1a0000b0290142250139f9mr9134883pfm.72.1600320181402;
        Wed, 16 Sep 2020 22:23:01 -0700 (PDT)
Received: from sultan-book.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id i62sm18705619pfe.140.2020.09.16.22.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 22:23:00 -0700 (PDT)
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
Subject: [PATCH v2 2/4] i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
Date:   Wed, 16 Sep 2020 22:22:54 -0700
Message-Id: <20200917052256.5770-3-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917052256.5770-1-sultan@kerneltoast.com>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

The point of adding a byte to len in i2c_dw_recv_len() is to make sure
that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
controller know that the i2c transaction can end. Otherwise, the i2c
controller will think that the transaction can never end for block
reads, which results in the stop-detection bit never being set and thus
the transaction timing out.

Adding a byte to len is not a reliable way to do this though; sometimes
it lets tx_buf_len become zero, which results in the scenario described
above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
the issue.

Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d78f48ca4886..22f28516bca7 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -395,8 +395,9 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	 * Adjust the buffer length and mask the flag
 	 * after receiving the first byte.
 	 */
-	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
-	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
+	if (flags & I2C_CLIENT_PEC)
+		len++;
+	dev->tx_buf_len = len - min_t(u8, len - 1, dev->rx_outstanding);
 	msgs[dev->msg_read_idx].len = len;
 	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 
-- 
2.28.0

