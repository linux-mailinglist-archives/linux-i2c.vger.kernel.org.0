Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EBE61DE7A
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbiKEVOS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiKEVNs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:48 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D1B1408C;
        Sat,  5 Nov 2022 14:13:43 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id b2so21347788eja.6;
        Sat, 05 Nov 2022 14:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiMUaNhBUJOR9OA8ZtBEVhMz3WyIU1kHl60F6lstO3A=;
        b=H8kCc5kNdiDaLwfV1szOsGC3FQvFMahJRrhpAgTYfawIDxtKT+Xp8X8ToVoz3iouul
         q8Ojdb5ihW44WlIpYghJ8qKS2JT56hkBcBrKUHRUj/+jdqxzPp19jj9uJ0IGMjCVYRdV
         syjVZD2dH4UlAHF0SwuBJ4mzggx8/W5ab5Ht+PXqyy6SRiT1kpEWRe9nTwSanzOTgxhK
         5tGmUSApfw2l8WIm0VoJoxib7NY7/R+mIzIka3YXX7xF/eUCsLywnyego0qC5OEftt1l
         vfLVfjjFrJlITzfVIMitnJm5/SJeiorgI2Ih0OuunsYZAlgV5+Ed0XauXRQeK3l+tm6r
         RErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiMUaNhBUJOR9OA8ZtBEVhMz3WyIU1kHl60F6lstO3A=;
        b=8C4igtjOtQXqWz1A+l3YWyXphrai7GYTwzq1MhiquFFRsEnxuTS7gS2eEpvwNa+8xV
         Rpt9QYmCXGMkFLHSjAHeHkYTYYTBtveYIq7/01PvX7PmvG58vh1i+eH9fNjwqPXRe6Po
         fye05EXJYz2RakHd78aq3/5Enx3nGUWSrtUqUQszp6IfuC8HhZQi4darPoYbFSxMS/qp
         8M7xGf+XFlmSjMPLbhNfkUZAoQckEOHBFh9tvaDUQmyMOA3oCVPKYTWmOxGW8OSNV7SY
         pRTFQpT6jrPfJB4CT1xhGoKcHYiIh0cfbypeCFFWTCXLRMDE8bw2gIoePjNqHCCesiHL
         TWGw==
X-Gm-Message-State: ACrzQf2Xgn3mygNQir76pyWgXnrXAZyqTm1Uy4ZcYhxA/E1hwfhuOmH+
        iw743D3KMIAsXOwVY/4TKoM=
X-Google-Smtp-Source: AMsMyM69yMUlPdhKEZ6i72kZbwHaYLHE1s+ekv6urYeBcIDN6iBabY25Cammr8rJFVnO69ZY4zbZ4w==
X-Received: by 2002:a17:906:8a6c:b0:7a8:2f09:d88d with SMTP id hy12-20020a1709068a6c00b007a82f09d88dmr40191568ejc.49.1667682821568;
        Sat, 05 Nov 2022 14:13:41 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:41 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 11/13] HID: ft260: fix a NULL pointer dereference in ft260_i2c_write
Date:   Sat,  5 Nov 2022 23:11:49 +0200
Message-Id: <20221105211151.7094-12-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105211151.7094-1-michael.zaidman@gmail.com>
References: <20221105211151.7094-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The zero-length passed into the ft260_i2c_write() triggered the
NULL pointer dereference in the debug message on data[0] access.
Since the controller does not support a write of zero length,
let's not allow it.

Before:

$ sudo i2ctransfer -y 13 w0@0x51
Killed

After:

$ sudo i2ctransfer -y 13 w0@0x51
Error: Sending messages failed: Invalid argument

Reported-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index ac133980dfe9..b4f180c8750a 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -409,6 +409,9 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
 
+	if (len < 1)
+		return -EINVAL;
+
 	rep->flag = FT260_FLAG_START;
 
 	do {
-- 
2.34.1

