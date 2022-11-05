Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B2761DE5F
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiKEVNx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiKEVNa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:30 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357FD11819;
        Sat,  5 Nov 2022 14:13:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x2so12257127edd.2;
        Sat, 05 Nov 2022 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAkHqN6oZd2dovWsENCSlIqD0VO6aehIZ8ArRH69xz8=;
        b=Gei7ZmZQounWS45EMBl0U2TG+aaR3pZeEr3PVRDoLl4ydUUt1MatfvkhH0gb9Ue/54
         3AdR6o9UWbK7wj6WNV7BHSkQJgXlLOD+7i2DFxzGrdWnOO9xxuPl/5KG0UFA/XgGcrNA
         jh0KZE6E6r3ETIrYuEnNxZJ3Meiyq1Mpk5GClPYLnSuMb0P3igfEvrtiVh45hiJzcF3u
         6I7hM09k2PyGGUsqLSgz8YrsFTCyR3tg5BzweF6jCMQ7wmMO/oN5/Ok2WN5J8OWdI/HM
         uluPSm0q6o4RxQD9RrNCyJuOwBt/tKWU2yMz9F2r2itquLa0BcZ0RBnxfOS0US695M2p
         iZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAkHqN6oZd2dovWsENCSlIqD0VO6aehIZ8ArRH69xz8=;
        b=c4RDweOERWG+S9HgIMntcVHRn1lfuy30h/sNooiHT/274v129RYtS97+Vc5Fy1fjnE
         IMQbIzXuxnZrsfBjhphdbeF1u33a4Hl5edUP5xLJLRNQb07n/sMEvaNfmdEtpD36LduU
         NAdx0FUV+eJc531iSsWIVimTX+jClVReSFCIae7kYIQch+kbKMYdxsOd2rKcgKSKa3+b
         wUyS1TEV6ia3acSdU0nL9wpvaxJgyRiFGTqujbjVoOTHKO/7NTHEQRQgeYhvGTJ8KpOm
         IlFSzseDI3p+rBwRQMEqTU3a/Q3zamOUSzdfn7cwFMvuGnRtRzJWgjP8q4o3jAvPxLts
         ne+A==
X-Gm-Message-State: ACrzQf0KosjLJufScUYzHEfAfoBNlEMGa8B90gq5b+RvK9pgS9M8ZyQn
        1Tr42nzsewpCe7MGpVZjg7o=
X-Google-Smtp-Source: AMsMyM4+odZ/gnJSto9z8Z7b4jWvwgO6SBfEpRXYz9Lf5w2TPNgbScf49zBVc3U8fZAWL2khy3Y0GA==
X-Received: by 2002:a05:6402:5202:b0:461:b7e3:e6b7 with SMTP id s2-20020a056402520200b00461b7e3e6b7mr41915334edd.282.1667682805713;
        Sat, 05 Nov 2022 14:13:25 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:25 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 09/13] HID: ft260: missed NACK from big i2c read
Date:   Sat,  5 Nov 2022 23:11:47 +0200
Message-Id: <20221105211151.7094-10-michael.zaidman@gmail.com>
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

The FT260 controller does not return NACK when performing a big
read (of multiple hid reports size) from a non-existing device
or from the device responding with NACK when it is not ready
to serve the request. However, it responds correctly with NACK
to a read of up to a single hid report size.

To overcome this issue, we split the muli-report read request
into a read of a single HID report of 60 bytes size and a
multi-report read.

Big read of 256 bytes with first read of 60 bytes:

$ sudo ./i2cperf -d 2 -o 2 -s 256 -r 0-0xff 1 0x50 -S

[  +5.633280] ft260_i2c_write_read: off 0x0 rlen 255 wlen 2
[  +0.000006] ft260_i2c_write: rep 0xd0 addr 0x50 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.013205] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000007] ft260_i2c_read: rep 0xc2 addr 0x50 len 255 rlen 60 flag 0x3
[  +0.010932] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.004733] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000006] ft260_i2c_read: rep 0xc2 addr 0x50 len 195 rlen 128 flag 0x0
[  +0.012572] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.005789] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.003189] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.004092] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000010] ft260_i2c_read: rep 0xc2 addr 0x50 len 67 rlen 67 flag 0x4
[  +0.011688] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.004700] ft260_raw_event: i2c resp: rep 0xd1 len 7
[  +0.004858] ft260_xfer_status: bus_status 0x20, clock 100

Read from non-existing device at address 8. The first 60 read responded
with NACK.

$ sudo ./i2cperf -d 2 -o 2 -s 256 -r 0-0xff 1 0x8 -S
[Oct19 15:37] ft260_i2c_write_read: off 0x0 rlen 255 wlen 2
[  +0.000007] ft260_i2c_write: rep 0xd0 addr 0x8 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.022820] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000007] ft260_i2c_read: rep 0xc2 addr 0x8 len 255 rlen 60 flag 0x3
[  +0.010658] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.005965] ft260_xfer_status: bus_status 0x46, clock 100  <-- NACK
[  +0.000009] ft260 0003:0403:6030.0004: i2c bus error: 0x46
[  +0.007784] ft260_i2c_reset: done

Co-developed-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index d186aa5a8e73..40fae81386e3 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -464,6 +464,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
 	u16 rd_len;
+	u16 rd_data_max = 60;
 	int timeout, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
@@ -473,12 +474,13 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 	else
 		flag = FT260_FLAG_START;
 	do {
-		if (len <= FT260_RD_DATA_MAX) {
+		if (len <= rd_data_max) {
 			rd_len = len;
 			flag |= FT260_FLAG_STOP;
 		} else {
-			rd_len = FT260_RD_DATA_MAX;
+			rd_len = rd_data_max;
 		}
+		rd_data_max = FT260_RD_DATA_MAX;
 
 		rep.report = FT260_I2C_READ_REQ;
 		rep.length = cpu_to_le16(rd_len);
-- 
2.34.1

