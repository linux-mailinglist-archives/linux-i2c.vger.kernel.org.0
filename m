Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F066C26D302
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 07:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgIQFXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 01:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIQFXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 01:23:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F895C06174A;
        Wed, 16 Sep 2020 22:23:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l71so680294pge.4;
        Wed, 16 Sep 2020 22:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m1D0o1H2R+Sauu9vaW7hv3HhUwelHNtIl/gUcqmOKIE=;
        b=DOZ3yizRJb0zGyGIthPbPkYOMjI9b5lcmvm/pATc/12B+ttb/W764so3l1jQN5DGrZ
         1gyikWe/cuL52lEpzHerQ6maxn0TE2PO1y4AqwQD/3rydpYkMWzKEU0lApTIK40nCs1q
         r8fsBTXK9vtLLV/jv9QDO2g5juxwOb3QJcAgNnIL6HMnZHmxg4Snoz6BYhwcHRUAdoE0
         xREILatfI0mUW0mZISLsHTmwHibgBaEbnlC21zUsReDh/jhQUSsTm6p5WPZGJrjDEOqG
         9QaZ3GmGtBVRNUSBp0gbfxqkx5vQkwY2qS8FbG+lJDPPFXQIu4bxwSJimVusE05PSoJS
         nF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=m1D0o1H2R+Sauu9vaW7hv3HhUwelHNtIl/gUcqmOKIE=;
        b=cTCLQx3vAIUSSfsgomWJqTG64MkuNqGwAdhaPHwZQTmLjy1p0o2DOOCy9ow3RLP4qN
         l/SBG7Xei5JJakewv77YH874ex4528OFgAITPVyKDpWus5e8Pk+T3UyiyoMZs5bIkjOk
         zGSfDFV0QSxtQJrPFE8eNgVuK6qID+LXgJ/8EFhdCofRFsAxytYJAJUcTNaNrd8st1zm
         WqDC5ql6BCRNqB7W7lyTx06TmS8zG+fz5vbb2L9pVMls8TBStQhrRusgp8F0iox2b1yA
         rQugE84dCGL6gVdyZj5Qskh+yxfo7/D64w8bjUSG8kcXxyFBG9PdzBIZaFpOQOxy3jkV
         wIyA==
X-Gm-Message-State: AOAM532dTZWeVmseA8V8Et2yXmkaztbtvkQ1NvzHehvmLQxu4OIYXrM5
        r6IuMs4eObTTVJLp54QgxsFRHTj3pw394w==
X-Google-Smtp-Source: ABdhPJx+jY1AqwMdKGjuu5DjZw2rWg53c7FLzz03VBoukncRje4/3N6NDoIEHMaM8Fwcy9SjZLvP6g==
X-Received: by 2002:a62:828b:0:b029:142:2501:35d6 with SMTP id w133-20020a62828b0000b0290142250135d6mr9861750pfd.54.1600320183895;
        Wed, 16 Sep 2020 22:23:03 -0700 (PDT)
Received: from sultan-book.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id i62sm18705619pfe.140.2020.09.16.22.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 22:23:03 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     linux-i2c@vger.kernel.org
Cc:     jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org, Sultan Alsawaf <sultan@kerneltoast.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH v2 4/4] HID: i2c-hid: Use block reads when possible to save power
Date:   Wed, 16 Sep 2020 22:22:56 -0700
Message-Id: <20200917052256.5770-5-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917052256.5770-1-sultan@kerneltoast.com>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Acked-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
2.28.0

