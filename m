Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A351FB96F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 18:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgFPQDt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 12:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730401AbgFPPt5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 11:49:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0821C061573;
        Tue, 16 Jun 2020 08:49:57 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l24so826410pgb.5;
        Tue, 16 Jun 2020 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pFrRHq1XVs88zCS7gViaAQplZ6MV/Otf8rLxL7f/kd8=;
        b=c3wGbVWHycQTd3FhMQJMCIvSPCX0sIf914T+Ow7XL1zuxIkMnMSYQJRKeAI6P7O4bz
         QhBd87rsmaMDXZAWD6iuH/j46lXMJZLUwHr7HHt1DlBZUJDOCqSK0eAGDB3b/OR5S7lI
         Ph+hmGbbzUknIG2WIxhcxpeNNegn3zXHX7CvAd3aA2HfUXFScKDKoDgQGJ7Pd0ZqgEx+
         ZDa4mWnWcmAA2LbL2DPXmPC3kwJto6HdzQ9hWclskR+XsLmz7mqcOUfQvs6N+qVZ4vu7
         jyvbTjqlMx4N5lmyP6I6DZLOjWxmOionysqtJeqkdIRjhDxFM9Rvz9NSbp4tZvdXmod+
         2agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pFrRHq1XVs88zCS7gViaAQplZ6MV/Otf8rLxL7f/kd8=;
        b=dw7aYj7Lz1YNIXaydYr0cZHP1f1+sfHwUxOevahONR+UHP2CpAqOAfedV7COiR4REt
         xmPgaf8S8Pj6TFle3GvgrUlFmLRwscJfT2JYCtknqkljfilRmfCYHOr7gz6mlfBKvmmK
         S2fAIhktOLevPVykCUBP+xZyaDnY3ht3nZrpC3tLqv7fZ/g7rxrOBZIbs7AhrQOAJ1U5
         q3HGCdgDgRlgTBKAZkzT8dAwNsCpyZDnNly1zo01YQ9qhoDEPu1O6umwsPmdXFVoVZz2
         De0JjgcKkZFUE+CJGPZsMXS0VFCXfGblbJ/NPDhXImYEkZasGxZeAo1WtJqhGuyfuFIq
         PxEw==
X-Gm-Message-State: AOAM533MQLusfWIysWm/AOreoCXgKaxbSGogb5ujIebSTrbENY3ROxrD
        48RGrD1cRkCOf3I/WJGs8vI=
X-Google-Smtp-Source: ABdhPJzjW4M5H25XWj36B4KIDoaMuIoILtjuNNkLOrkVPia6lZUsEEbyXpd9lc/UEJ4gSid9U6elJA==
X-Received: by 2002:a62:ddc4:: with SMTP id w187mr2616321pff.63.1592322597492;
        Tue, 16 Jun 2020 08:49:57 -0700 (PDT)
Received: from sultan-box.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id l195sm7668873pfd.18.2020.06.16.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 08:49:56 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     jarkko.nikula@linux.intel.com
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, sultan@kerneltoast.com,
        vicamo.yang@canonical.com, wsa@kernel.org
Subject: [PATCH v2] HID: i2c-hid: Use block reads when possible to save power
Date:   Tue, 16 Jun 2020 08:49:51 -0700
Message-Id: <20200616154951.3050-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

We have no way of knowing how large an incoming payload is going to be,
so the only strategy available up until now has been to always retrieve
the maximum possible report length over i2c, which can be quite
inefficient. For devices that send reports in block read format, the i2c
controller driver can read the payload length on the fly and terminate
the i2c transaction early, resulting in considerable power savings.

On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
touchpad causes psys power readings to go up by about 4W and hover there
until I remove my finger. With this patch, my psys readings go from 4.7W
down to 3.1W, yielding about 1.6W in savings. This is because my
touchpad's max report length is 60 bytes, but all of the regular reports
it sends for touch events are only 32 bytes, so the i2c transfer is
roughly halved for the common case.

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
Jarkko, could you try this?
 drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 294c84e136d7..739dccfc57e1 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -472,11 +472,14 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
 	int ret;
 	u32 ret_size;
 	int size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
+	u16 flags;
 
 	if (size > ihid->bufsize)
 		size = ihid->bufsize;
 
-	ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
+	/* Try to do a block read if the size fits in one byte */
+	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;
+	ret = i2c_transfer_buffer_flags(ihid->client, ihid->inbuf, size, flags);
 	if (ret != size) {
 		if (ret < 0)
 			return;
-- 
2.27.0

