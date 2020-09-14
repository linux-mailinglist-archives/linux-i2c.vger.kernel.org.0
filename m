Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8825B26821B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 02:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgINAPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 20:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgINAPo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Sep 2020 20:15:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4132C06174A;
        Sun, 13 Sep 2020 17:15:43 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id v14so3113186pjd.4;
        Sun, 13 Sep 2020 17:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWr9NKSEdcY2u7gqd/E6b74UvynPcFslVkt4rQ7Xars=;
        b=hDOHeSS4Cz3MCmYNC7KleUqw2t+ui/KcZgykzgopjOTy/2HfgYlvCQ/X0c8QSfGjAT
         s8kxuuwa67gAJ6siyUti8z9wJdkHrMAOi2xLyBRR1Qi2BzVGTLx/QtWnZMgQotgA1YlX
         eTn5E2Va5/HDS2ljxW0Hiy7UcekqtsS78L8ONEwQ+3u0eX8c+I0G2/1FTS/TPL2cuHDQ
         f5Goyp5xMEkC4r+gwv0V43wV/Ejjc+o6M0g37shH2OqWYCA2bJtIwaK9E/BX+guoKc8a
         ckmU9VM40hubpFlsEEvU4x52/9QFsswT7DZem4YDcu8Ywg3ZGQHRKy8turWKOlZHzDwK
         QL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RWr9NKSEdcY2u7gqd/E6b74UvynPcFslVkt4rQ7Xars=;
        b=E0bQ5aWpL5NgBZ/597aW/mh3HfM5kkIloVh3H+RooiFcQW+/rFBrDhVGlwpnsGpk5M
         QDXXQSSLWtbLGVvQfJX7NeVN7u4JMcR1Hm/a+I0St191/NfbepQzm/1Yf1SFt62tXv9C
         1UgSZrHTGVvdMoXfwfCxGFcjBVtjft4is1lPn3BNX/6hZjGLKvpboyW8c5fakjtk4y4X
         ZZMck5sRxa5/8bNM9JbudS19cQZI+5vLJoOUcrBLMtALIRW9+EQoJQv9uOEwW2I2pnwr
         kVllS/z/FC6dbc4hiszvsACBcJzvddg0TtU6oA9QDLzczCfkZwNJCQl9EbYpdSHP7jxC
         xDNA==
X-Gm-Message-State: AOAM531Rs5dDkisPgKvCJPUWXsJKCLc1EoW+XKhGGNTu/D3Y/8hHiGNB
        q5W1GTPY8GeBOV2ip+4Ehxo=
X-Google-Smtp-Source: ABdhPJxjUnnxV2H37svHRIcVFf1kghaizfA7oGNU9nSd/ECWa/O8IbzjHubwxqScv9rZ8Pad0k9ZbA==
X-Received: by 2002:a17:90a:3e4f:: with SMTP id t15mr11744827pjm.19.1600042543106;
        Sun, 13 Sep 2020 17:15:43 -0700 (PDT)
Received: from sultan-book.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id c5sm7159500pgj.0.2020.09.13.17.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:15:42 -0700 (PDT)
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
Subject: [PATCH v3] i2c: Squash of SMBus block read patchset to save power
Date:   Sun, 13 Sep 2020 17:15:23 -0700
Message-Id: <20200914001523.3878-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <b3b751fc-668d-91e2-220b-0d7edd231e01@linux.intel.com>
References: <b3b751fc-668d-91e2-220b-0d7edd231e01@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

This is a squash of the following:

i2c: designware: Fix transfer failures for invalid SMBus block reads

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

i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads

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

i2c: designware: Allow SMBus block reads up to 255 bytes in length

According to the SMBus 3.0 protocol specification, block transfer limits
were increased from 32 bytes to 255 bytes. Remove the obsolete 32-byte
limitation.

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>

HID: i2c-hid: Use block reads when possible to save power

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
Hi Jarkko,

Sorry for the delayed response. Life gets in the way of the things that really
matter, like kernel hacking ;)

I fixed the issue with the i2c block reads on 5.8. I've squashed all 4 of my i2c
commits into this email for simplicity; please apply this patch on either 5.8 or
5.9 (it applies cleanly to both) and let me know if it works with your i2c-hid
touchscreen. If all is well, I will resubmit these patches individually in one
patchset, in a new thread.

Thanks,
Sultan
 drivers/hid/i2c-hid/i2c-hid-core.c         |  5 ++++-
 drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index dbd04492825d..66950f472122 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -476,11 +476,14 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
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
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..5bd64bd17d94 100644
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
 
@@ -430,10 +431,12 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
-				len = i2c_dw_recv_len(dev, tmp);
+			if (flags & I2C_M_RECV_LEN) {
+				/* Ensure length byte is a valid value */
+				if (tmp > 0)
+					len = i2c_dw_recv_len(dev, tmp);
+				else
+					len = i2c_dw_recv_len(dev, len);
 			}
 			*buf++ = tmp;
 			dev->rx_outstanding--;
-- 
2.28.0

