Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB885331C0
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 21:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240908AbiEXT10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 15:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240862AbiEXT1Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 15:27:25 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732056CF61;
        Tue, 24 May 2022 12:27:24 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id c1so15786104qkf.13;
        Tue, 24 May 2022 12:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PlbzmGY3IUE+JzgN/OnRwYZ1LTcH+0H8v20IvUaXIb8=;
        b=muSVj6gWsDNJeJsHQZm5Kfk8rAqTHAxoahSpwdRRJKLo+RuYyvm6xl7nDt2G0VGYK6
         +Y393pPLN1PweghnQH9KZl6Em2mChejg3N4MXPXlAHFUqSlCxthfrtcGKt21Zy5B6DXD
         P+GzcSds6ux/PObm21V7/Y5Wcd5snfmKmaBmWjkf7t9Pa4t4HQG7xMZN6iCFP1EEfj3k
         At5qYddt4bqOdRUHltiPgMmSEApcNMq6j8funk5seESBcni/RcOaUsJEj8zZaaXPqtGZ
         929YB0lvLXFf/71sU8Hxsb5qKzXCZYAJpAcGEwFzh4+8UFGUAM7mFa/j1iVInHhyG6Pc
         vvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PlbzmGY3IUE+JzgN/OnRwYZ1LTcH+0H8v20IvUaXIb8=;
        b=BB+dJebV4zpIey+Rpk9GjQ4Gv+0Tyw8EL9uqF0hMiTmIgQZPjZG4uNtHbAtKgarBHa
         Li9/azGBaEzWRKTzQT4VmzsghkuoKLQfNAr2MfRv2b7sxSefsnYW2/uj/Y7Qngrtex+R
         hKTtZQZr8lE8hKx/Elm2c2JaoFj5PqQR1ApDgvg+e5WwuLDfQDpbYF7tirfR2s+hvFhv
         kvZFSyHvXwTUPZVVKS8u2dBTiNjWIjS037Af4MuFZc2KhiMV37AbzmMZLtSrGAlcSytj
         iC8GXO7nmomaCDrnWFB1JuyMU9KJnoLtxH3onYD6Yz8x4mxc0MTrxBZTXdRLLRjww7gJ
         /Eqw==
X-Gm-Message-State: AOAM532w5zD1zojZSLxZa9Dk9vG7pU9W8ku5EvXWlD319Ab9B4OCTY1u
        9T+WlIF0EZLfNU0ZddY4Co4=
X-Google-Smtp-Source: ABdhPJw5hZzFTUuL5gQkWifCxGNS0Gh6Rs1RttrDiEN93LoJ67dI00kuqjg5at1WDlJLbGxevypPPw==
X-Received: by 2002:a37:6902:0:b0:606:853:fe50 with SMTP id e2-20020a376902000000b006060853fe50mr18321652qkc.751.1653420443556;
        Tue, 24 May 2022 12:27:23 -0700 (PDT)
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id c186-20020ae9edc3000000b006a37eb728cfsm67195qkg.1.2022.05.24.12.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 12:27:23 -0700 (PDT)
From:   Guillaume Champagne <champagne.guillaume.c@gmail.com>
To:     champagne.guillaume.c@gmail.com, michael.zaidman@gmail.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Subject: [PATCH] HID: ft260: fix multi packet i2c transactions
Date:   Tue, 24 May 2022 15:24:22 -0400
Message-Id: <20220524192422.13967-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Only trigger START and STOP conditions for the first and last HID
packets when i2c writes are split in multiple packets. Otherwise, slave
i2c devices receive each packet as standalone i2c transactions. Since
i2c slave devices clear their internal state on STOP, this breaks auto
increment of the register address written to.

Concretely, SCL is now held low between processing of HID packets so i2c
slave devices know to keep increment the same register address when the
next bytes arrive.

Co-developed-by: Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Signed-off-by: Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 drivers/hid/hid-ft260.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 79505c64dbfe..9c5912a21ccb 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -390,6 +390,8 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
+	bool multi_packet = data_len > FT260_WR_DATA_MAX;
+	u8 packet_flag = multi_packet ? flag & FT260_FLAG_START_REPEATED : flag;
 
 	do {
 		if (data_len <= FT260_WR_DATA_MAX)
@@ -400,7 +402,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		rep->report = FT260_I2C_DATA_REPORT_ID(len);
 		rep->address = addr;
 		rep->length = len;
-		rep->flag = flag;
+		rep->flag = packet_flag;
 
 		memcpy(rep->data, &data[idx], len);
 
@@ -418,6 +420,12 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		data_len -= len;
 		idx += len;
 
+		if (multi_packet) {
+			if (data_len <= FT260_WR_DATA_MAX)
+				packet_flag = flag & FT260_FLAG_STOP;
+			else
+				packet_flag = FT260_FLAG_NONE;
+		}
 	} while (data_len > 0);
 
 	return 0;
-- 
2.20.1

