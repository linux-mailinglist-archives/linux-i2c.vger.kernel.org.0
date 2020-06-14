Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED0A1F8ACD
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 23:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgFNVDI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 17:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgFNVDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 17:03:06 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D72CC03E97C;
        Sun, 14 Jun 2020 14:03:05 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w20so6710717pga.6;
        Sun, 14 Jun 2020 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LuKrGdsyJt363mkqnjfvHbulwnJ9TO1k3D/bFALSM6Q=;
        b=M1v4894OoBgKF8izTIkH6jmFVP524510jNiBjJGnDTw/E0a1oBDAeC1R0j+05TPxad
         CEGL557RLDnJuq/ExdD6BS1EOQZclyk74RTiDlDP77AlYuvQlbt3PZXgV8fhtXmu2hOL
         JPbBP9sDP55x5+07FGVJHPV1l/c4QYOhEFYi4dy+oQWyYO0J9oL8qe6GT5EjK+upQ+sy
         sAIMoSBxU5hoPudZ4wTMhTiD7w40r05FB2pfqqPXRMnEdKA0L50iUFetPr6ZM2qgWDjF
         HnhtV2NqK3z6H8viGcZWTOYmFOBN0CxAgB7nSq61BbvBwgtVkPcCf4iOBp1PJh64XWxb
         Gs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LuKrGdsyJt363mkqnjfvHbulwnJ9TO1k3D/bFALSM6Q=;
        b=fefG5bB6TXXd5NQRpykQPRUNxZyzJXB+RiczElFE1hsu29q7v8Qo2ktVmFlPdSfxSI
         iHmNP3Y+Rc8DwNahwpvQlk0l8nCYyu8uSvodEmU3gsGh8wk86oAO0aUFS/U6T9pgA8zd
         WGqfXnjalTrHq1p76fpRQCnayjgIHLAaJd9lqZ6TDhoh+2FuBNHry3nH4BuU6GxUr0hs
         Y/gJf5MZjj0rww3MCm5u51R0UXAOiUwf1l6ZZlOkeGwty5Qdmp4jyrvWOh5Mxnpy/gHJ
         wSap1b7b7nCKz43g8WDil/lIhcAl8c/aC4iAapAv38O0vkOBWClm6R/uhVhw861lDtMC
         EejQ==
X-Gm-Message-State: AOAM531qyLpicWTCLpk+h5VMCPlqpIJxwgMbQCHWVOgle//+FtP6W71K
        lk1JJGvi6GZhtXaiiZSAQho=
X-Google-Smtp-Source: ABdhPJwXDOBq8wOZFlPoba1fs6Y0oquuokAQpP5cQY0aeDvPQ3lMxVJGG2HLpazYAGspfRPXVGz15Q==
X-Received: by 2002:a63:6bc5:: with SMTP id g188mr14069494pgc.395.1592168585045;
        Sun, 14 Jun 2020 14:03:05 -0700 (PDT)
Received: from sultan-box.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id d184sm1827746pfd.85.2020.06.14.14.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:03:04 -0700 (PDT)
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
Subject: [PATCH 2/2] HID: i2c-hid: Use block reads when possible to save power
Date:   Sun, 14 Jun 2020 14:02:55 -0700
Message-Id: <20200614210255.4641-3-sultan@kerneltoast.com>
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
 drivers/hid/i2c-hid/i2c-hid-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 294c84e136d7..4b507de48d70 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -476,7 +476,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
 	if (size > ihid->bufsize)
 		size = ihid->bufsize;
 
-	ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
+	ret = i2c_transfer_buffer_flags(ihid->client, ihid->inbuf, size,
+					I2C_M_RD | I2C_M_RECV_LEN);
 	if (ret != size) {
 		if (ret < 0)
 			return;
-- 
2.27.0

