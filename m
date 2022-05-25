Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7485337BB
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 09:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241023AbiEYHs4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 03:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242725AbiEYHsy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 03:48:54 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857A67A46F;
        Wed, 25 May 2022 00:48:52 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id er5so25906442edb.12;
        Wed, 25 May 2022 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UFA+8BKRVbfrDrsjCDrHDVMk7nmK2V+RVMwExRQ6vLE=;
        b=p3t8PdZNPUp/mdzFsn62zbhQKauYWRATaQrHYG8dJJwKrRtMJ9Q589Kfl7fDmHp8xZ
         JON6N64dZM1wtqQrlGMmoqXnLnTnoFjtLSI5l51Ao/S0WL8dwek1eYWdtVFkZMD2vKui
         IrJDF+PYKq/dUhWOKQixjvLl0nF1oM4wpcyyuPLNwK6TzOpbqigxACCMVGdxz004bBGS
         HkMthE9400niGhs1ZvW8pceZxFd7PMUBGCDdKcLO4XfAgWccGD7/qxEUTRiPK07jtCrJ
         uXafqG7Lci6nXquQoh+CPFr5MmZOTUK/KCV5xDrpdsQc+wPYzTgyBslAEMDS53LUzcKg
         Z60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UFA+8BKRVbfrDrsjCDrHDVMk7nmK2V+RVMwExRQ6vLE=;
        b=rilJSj7ipdlYO8HSaxSi29kjxfx1U88DvnlDE4xELulzR3AkPUtiQUiiSizuu1yF6Y
         bPsJ6+qW+8g4J5I0tAtPClMVPfHyJ48vkCilC9Oj+gf/+fZ28DYqXMK03GcSqZdQ2kSV
         czuu6UYlGhhlJ9w99IZG79W1B6KS0NPIet4GheL+k5lzDntusF16CPWa6gJyBXeQwTvY
         ptFo41nOyILOx+lgW2hZioaTEAAgoD8S86GmIucR5/hqxQhSkKAAA8RC/qf/nF0RbIFU
         910gMyeoiyu71CPRceUW1WTGo4Rcu5joL+XUdZYKb8VR7zNPUZ8/Ex5uDs4a7rF+TrjE
         Uvlw==
X-Gm-Message-State: AOAM530Z0SCAlQJgDJgzCal/dvXRo7+3vSezE9QrnfFVAPjpNnlBr2Jv
        FddYtKm9/NjWWDK2RXSFbpc=
X-Google-Smtp-Source: ABdhPJyD1VzVVSXxXt3sMYsEoa3Jzvr3hv3O6xWjeH4/ziFTQSqDVWQeeLMMEbGFUYex252UsR4x8A==
X-Received: by 2002:a05:6402:e99:b0:41d:11f2:85e0 with SMTP id h25-20020a0564020e9900b0041d11f285e0mr32495644eda.339.1653464932029;
        Wed, 25 May 2022 00:48:52 -0700 (PDT)
Received: from localhost.localdomain (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.googlemail.com with ESMTPSA id v1-20020aa7d641000000b0042acd78014esm10230533edr.11.2022.05.25.00.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 00:48:51 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, champagne.guillaume.c@gmail.com,
        mathieu.gallichand@sonatest.com,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1 4/5] HID: ft260: support i2c reads greater than HID report size
Date:   Wed, 25 May 2022 10:47:56 +0300
Message-Id: <20220525074757.7519-5-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525074757.7519-1-michael.zaidman@gmail.com>
References: <20220525074757.7519-1-michael.zaidman@gmail.com>
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

A random i2c read operation in EEPROM devices is implemented as a dummy
write operation, followed by a current address read operation. The dummy
write operation is used to load the target byte or word address (a.k.a
offset) into the offset counter, from which the subsequent read operation
then reads.

To support longer than one HID report size random read, the ft260 driver
issues multiple pairs of i2c write offset + read data transactions of HID
report size so that the EEPROM device sees many i2c random read requests
from different offsets.

Two issues with the current implementation:
- This approach suffers from extra overhead caused by writing offset requests.
- Necessity to handle offset per HID report in big-endian representation as
  EEPROM devices expect. The current implementation does not do it and
  correctly handles the reads up to 60 bytes only.

This patch addresses both issues by implementing a more efficient approach.
It issues a single i2c read request of up to the EEPROM page size and then
waits for the data to arrive in multiple HID reports. For example, to read
the 256 bytes from a 24LC512 chip, which has 128 bytes page size, the old
method performs six ft260_i2c_write_read transactions while the new - two
only.

Before:

$ sudo ./i2cperf -d 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S
0x0000: 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f
        0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f
        0x20 0x21 0x22 0x23 0x24 0x25 0x26 0x27 0x28 0x29 0x2a 0x2b 0x2c 0x2d 0x2e 0x2f
        0x30 0x31 0x32 0x33 0x34 0x35 0x36 0x37 0x38 0x39 0x3a 0x3b 0x36 0x30 0x00 0x00
        0x13 0x04 0xd5 0x00 0x1e 0x00 0x00 0x00 0xcd 0xa1 0x2f 0x00 0x6e 0x00 0x00 0x00
        0xe1 0x5c 0xa4 0x5d 0x09 0x5d 0xdc 0x00 0xa6 0x01 0x0d 0x02 0x1c 0x00 0x0e 0x0c
        0x04 0x01 0x00 0x27 0x36 0x30 0x00 0x00 0x9c 0x04 0xd5 0x00 0x1e 0x00 0x00 0x00
        0xdf 0xa1 0x2f 0x00 0x6e 0x00 0x00 0x00 0x36 0x30 0x00 0x00 0xc2 0xe7 0xd5 0x00
0x0080: 0x80 0x81 0x82 0x83 0x84 0x85 0x86 0x87 0x88 0x89 0x8a 0x8b 0x8c 0x8d 0x8e 0x8f
        0x90 0x91 0x92 0x93 0x94 0x95 0x96 0x97 0x98 0x99 0x9a 0x9b 0x9c 0x9d 0x9e 0x9f
        0xa0 0xa1 0xa2 0xa3 0xa4 0xa5 0xa6 0xa7 0xa8 0xa9 0xaa 0xab 0xac 0xad 0xae 0xaf
        0xb0 0xb1 0xb2 0xb3 0xb4 0xb5 0xb6 0xb7 0xb8 0xb9 0xba 0xbb 0x1e 0x00 0x00 0x00
        0x06 0xa2 0x2f 0x00 0x6e 0x00 0x00 0x00 0x33 0x5d 0x29 0x5e 0xa0 0x5d 0xe1 0x00
        0x9e 0x01 0x03 0x02 0x1c 0x00 0x0e 0x0c 0x04 0x02 0x1e 0x01 0x36 0x30 0x00 0x00
        0x33 0x06 0xd5 0x00 0x1e 0x00 0x00 0x00 0x19 0xa2 0x2f 0x00 0x6e 0x00 0x00 0x00
        0xa5 0x5d 0xfb 0x5d 0xe0 0x5d 0xdd 0x00 0x1e 0x00 0x00 0x00 0x69 0xc2 0x2f 0x00

  Read block via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  40803           85             256           2           128

[  +2.376308] ft260_i2c_write_read: read_off 0x0 left_len 128 len 60
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.000707] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000173] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 60
[  +0.008660] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000156] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000001] ft260_i2c_write_read: read_off 0x3c left_len 68 len 60
[  +0.000001] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x3c
[  +0.001034] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000191] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 60
[  +0.008614] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000203] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000001] ft260_i2c_write_read: read_off 0x78 left_len 8 len 8
[  +0.000001] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x78
[  +0.000987] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000192] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 8
[  +0.002614] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000200] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.012511] ft260_i2c_write_read: read_off 0x8000 left_len 128 len 60
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.001456] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000207] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 60
[  +0.008625] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000203] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000002] ft260_i2c_write_read: read_off 0x803c left_len 68 len 60
[  +0.000001] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x3c
[  +0.000991] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000196] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 60
[  +0.008621] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000202] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000001] ft260_i2c_write_read: read_off 0x8078 left_len 8 len 8
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x78
[  +0.000979] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000151] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 8
[  +0.002644] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000141] ft260_xfer_status: bus_status 0x20, clock 100

After:

$ sudo ./i2cperf -d 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S
0x0000: 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f
        0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f
        0x20 0x21 0x22 0x23 0x24 0x25 0x26 0x27 0x28 0x29 0x2a 0x2b 0x2c 0x2d 0x2e 0x2f
        0x30 0x31 0x32 0x33 0x34 0x35 0x36 0x37 0x38 0x39 0x3a 0x3b 0x3c 0x3d 0x3e 0x3f
        0x40 0x41 0x42 0x43 0x44 0x45 0x46 0x47 0x48 0x49 0x4a 0x4b 0x4c 0x4d 0x4e 0x4f
        0x50 0x51 0x52 0x53 0x54 0x55 0x56 0x57 0x58 0x59 0x5a 0x5b 0x5c 0x5d 0x5e 0x5f
        0x60 0x61 0x62 0x63 0x64 0x65 0x66 0x67 0x68 0x69 0x6a 0x6b 0x6c 0x6d 0x6e 0x6f
        0x70 0x71 0x72 0x73 0x74 0x75 0x76 0x77 0x78 0x79 0x7a 0x7b 0x7c 0x7d 0x7e 0x7f
0x0080: 0x80 0x81 0x82 0x83 0x84 0x85 0x86 0x87 0x88 0x89 0x8a 0x8b 0x8c 0x8d 0x8e 0x8f
        0x90 0x91 0x92 0x93 0x94 0x95 0x96 0x97 0x98 0x99 0x9a 0x9b 0x9c 0x9d 0x9e 0x9f
        0xa0 0xa1 0xa2 0xa3 0xa4 0xa5 0xa6 0xa7 0xa8 0xa9 0xaa 0xab 0xac 0xad 0xae 0xaf
        0xb0 0xb1 0xb2 0xb3 0xb4 0xb5 0xb6 0xb7 0xb8 0xb9 0xba 0xbb 0xbc 0xbd 0xbe 0xbf
        0xc0 0xc1 0xc2 0xc3 0xc4 0xc5 0xc6 0xc7 0xc8 0xc9 0xca 0xcb 0xcc 0xcd 0xce 0xcf
        0xd0 0xd1 0xd2 0xd3 0xd4 0xd5 0xd6 0xd7 0xd8 0xd9 0xda 0xdb 0xdc 0xdd 0xde 0xdf
        0xe0 0xe1 0xe2 0xe3 0xe4 0xe5 0xe6 0xe7 0xe8 0xe9 0xea 0xeb 0xec 0xed 0xee 0xef
        0xf0 0xf1 0xf2 0xf3 0xf4 0xf5 0xf6 0xf7 0xf8 0xf9 0xfa 0xfb 0xfc 0xfd 0xfe 0xff

  Read block via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  43990           85             256           2           128

[  +1.464346] ft260_i2c_write_read: off 0x0 rlen 128 wlen 2
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.001653] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000188] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 128 rlen 60 flag 0x3
[  +0.008609] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000157] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 68 rlen 60 flag 0x0
[  +0.008840] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000203] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 8 rlen 8 flag 0x4
[  +0.002794] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000201] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.015171] ft260_i2c_write_read: off 0x80 rlen 128 wlen 2
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.000764] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000231] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000148] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 128 rlen 60 flag 0x3
[  +0.008488] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000205] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 68 rlen 60 flag 0x0
[  +0.008795] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000176] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 8 rlen 8 flag 0x4
[  +0.002819] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000167] ft260_xfer_status: bus_status 0x20, clock 100

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 133 ++++++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 61 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index bfda5b191a3a..cb8f1782d1f0 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -460,49 +460,68 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
+	u16 rd_len;
+	int timeout, ret;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
-	int timeout;
-	int ret;
+	bool first = true;
 
-	if (len > FT260_RD_DATA_MAX) {
-		hid_err(hdev, "%s: unsupported rd len: %d\n", __func__, len);
-		return -EINVAL;
-	}
+	do {
+		if (first) {
+			if (flag & FT260_FLAG_START_REPEATED)
+				flag = FT260_FLAG_START_REPEATED;
+			else
+				flag = FT260_FLAG_START;
+			first = false;
+		} else {
+			flag = 0;
+		}
 
-	dev->read_idx = 0;
-	dev->read_buf = data;
-	dev->read_len = len;
+		if (len <= FT260_RD_DATA_MAX) {
+			rd_len = len;
+			flag |= FT260_FLAG_STOP;
+		} else {
+			rd_len = FT260_RD_DATA_MAX;
+		}
 
-	rep.report = FT260_I2C_READ_REQ;
-	rep.length = cpu_to_le16(len);
-	rep.address = addr;
-	rep.flag = flag;
+		dev->read_idx = 0;
+		dev->read_buf = data;
+		dev->read_len = rd_len;
 
-	ft260_dbg("rep %#02x addr %#02x len %d\n", rep.report, rep.address,
-		  rep.length);
+		rep.report = FT260_I2C_READ_REQ;
+		rep.length = cpu_to_le16(rd_len);
+		rep.address = addr;
+		rep.flag = flag;
 
-	reinit_completion(&dev->wait);
+		ft260_dbg("rep %#02x addr %#02x len %d rlen %d flag %#x\n",
+			  rep.report, rep.address, len, rd_len, flag);
 
-	ret = ft260_hid_output_report(hdev, (u8 *)&rep, sizeof(rep));
-	if (ret < 0) {
-		hid_err(hdev, "%s: failed to start transaction, ret %d\n",
-			__func__, ret);
-		return ret;
-	}
+		reinit_completion(&dev->wait);
 
-	timeout = msecs_to_jiffies(5000);
-	if (!wait_for_completion_timeout(&dev->wait, timeout)) {
-		ft260_i2c_reset(hdev);
-		return -ETIMEDOUT;
-	}
+		ret = ft260_hid_output_report(hdev, (u8 *)&rep, sizeof(rep));
+		if (ret < 0) {
+			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
+			return ret;
+		}
 
-	ret = ft260_xfer_status(dev);
-	if (ret == 0)
-		return 0;
+		timeout = msecs_to_jiffies(5000);
+		if (!wait_for_completion_timeout(&dev->wait, timeout)) {
+			ft260_i2c_reset(hdev);
+			return -ETIMEDOUT;
+		}
 
-	ft260_i2c_reset(hdev);
-	return -EIO;
+		ret = ft260_xfer_status(dev);
+		if (ret < 0) {
+			ft260_i2c_reset(hdev);
+			return -EIO;
+		}
+
+		len -= rd_len;
+		data += rd_len;
+
+	} while (len > 0);
+
+	return 0;
 }
 
 /*
@@ -513,45 +532,37 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
  */
 static int ft260_i2c_write_read(struct ft260_device *dev, struct i2c_msg *msgs)
 {
-	int len, ret;
-	u16 left_len = msgs[1].len;
-	u8 *read_buf = msgs[1].buf;
+	int ret;
+	int wr_len = msgs[0].len;
+	int rd_len = msgs[1].len;
+	struct hid_device *hdev = dev->hdev;
 	u8 addr = msgs[0].addr;
 	u16 read_off = 0;
-	struct hid_device *hdev = dev->hdev;
 
-	if (msgs[0].len > 2) {
-		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__,
-			msgs[0].len);
+	if (wr_len > 2) {
+		hid_err(hdev, "%s: invalid wr_len: %d\n", __func__, wr_len);
 		return -EOPNOTSUPP;
 	}
 
-	memcpy(&read_off, msgs[0].buf, msgs[0].len);
-
-	do {
-		if (left_len <= FT260_RD_DATA_MAX)
-			len = left_len;
+	if (ft260_debug) {
+		if (wr_len == 2)
+			read_off = be16_to_cpu(*(u16 *)msgs[0].buf);
 		else
-			len = FT260_RD_DATA_MAX;
-
-		ft260_dbg("read_off %#x left_len %d len %d\n", read_off,
-			  left_len, len);
-
-		ret = ft260_i2c_write(dev, addr, (u8 *)&read_off, msgs[0].len,
-				      FT260_FLAG_START);
-		if (ret < 0)
-			return ret;
+			read_off = *msgs[0].buf;
 
-		ret = ft260_i2c_read(dev, addr, read_buf, len,
-				     FT260_FLAG_START_STOP);
-		if (ret < 0)
-			return ret;
+		pr_info("%s: off %#x rlen %d wlen %d\n", __func__,
+			read_off, rd_len, wr_len);
+	}
 
-		left_len -= len;
-		read_buf += len;
-		read_off += len;
+	ret = ft260_i2c_write(dev, addr, msgs[0].buf, wr_len,
+			      FT260_FLAG_START);
+	if (ret < 0)
+		return ret;
 
-	} while (left_len > 0);
+	ret = ft260_i2c_read(dev, addr, msgs[1].buf, rd_len,
+			     FT260_FLAG_START_STOP_REPEATED);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
-- 
2.25.1

