Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD01D612CB3
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiJ3Uei (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJ3Ueg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:36 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C61BC12;
        Sun, 30 Oct 2022 13:34:34 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so774722wmg.2;
        Sun, 30 Oct 2022 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALhJBetIf5X/SyaoXHlGdZsad0OG/1yQx1wQzt9ePhk=;
        b=qbY0Tl3+bXS2sSGNqVjdke0NooRIxBZtZNoVqbGH1GP2unMRmKhx2di7rzJYcmvPkY
         z44SzbkorqFS6odepQhc73eeJRrm3ROUhc1687dp/BhFpIc6FfoVwfEguoK4tZ92t+KY
         wwPLlIyL1yX+NeGnAtGHVLQfgVudnRBTAIO9wtBD+QjT6dGdLeSFA817bjJDQ/vw/769
         klrweYpwFKLNdiPrKwGD8gctHJHpY488RLVyuSENvD7z8XyYlpunqH1eYkWLagF/+dMH
         ixADUhxjTrXWE9Fqy1CZB771psduc9byncqppJAMCfuaNInRAQbel458vieHlwdE23zf
         XNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALhJBetIf5X/SyaoXHlGdZsad0OG/1yQx1wQzt9ePhk=;
        b=s2K7CllR5HP+hfq/NHKc5I1cdrtAYiklgLJrs1I1KMuays1GB7k6ozeuUixoXEdSd+
         bmCrFwPtk7LIPllKzSsJO09r/AGJN+CqdXhLwT1M5Y9ZUOUpoK8T78s9N47hvoR05eT4
         rkXazOHG3k2Yhg4lD9CYMLYAWvXsm/3o0XwWWqMThGo3tWp2/i7q1qpKMoFR0gx2BuW1
         gP40a7ts5EACUxdfBr5YWf/QQvlfLDwh0Rtrs6XllYJqib7wSruta/pA4StDSgRUXdX3
         Xbooel97eB63mr4h9NmpQtiKmtG1Fu1ROZUfL4BL75JyOaScOlZo5cU1/QPvjtcx03OF
         z4Bw==
X-Gm-Message-State: ACrzQf1PveQRU92ey0uow2iyHb1dJYsCx/wrRmUQvxWgiUHkywkGE2yB
        hx6bTK914cvuAn6OzkqhdPM=
X-Google-Smtp-Source: AMsMyM4fJtooSmhksopxZCiWlxu6V5XShAi1peWVehD790HUqpBFGCIYDONDci5MZhoGheuby0jjlA==
X-Received: by 2002:a1c:27c6:0:b0:3c2:e6df:c79b with SMTP id n189-20020a1c27c6000000b003c2e6dfc79bmr15539151wmn.14.1667162072572;
        Sun, 30 Oct 2022 13:34:32 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:32 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>,
        Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH v3 04/12] HID: ft260: support i2c reads greater than HID report size
Date:   Sun, 30 Oct 2022 22:33:55 +0200
Message-Id: <20221030203403.4637-5-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030203403.4637-1-michael.zaidman@gmail.com>
References: <20221030203403.4637-1-michael.zaidman@gmail.com>
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
- This approach suffers from extra overhead caused by writing offset
  requests.
- Necessity to handle offset per HID report in big-endian representation
  as EEPROM devices expect. The current implementation does not do it and
  correctly handles the reads up to 60 bytes only.

This patch addresses both issues by implementing more efficient approach.
It issues a single i2c read request of up to the EEPROM page size and then
waits for the data to arrive in multiple HID reports. For example, to read
the 256 bytes from a 24LC512 chip, which has 128 bytes page size, the old
method performs six ft260_i2c_write_read transactions while the new - two
only.

Before:

$ sudo ./i2cperf -d 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S

  Read block via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  40803           85             256           2           128

Kernel log of a single 128 bytes read request:

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

After:

$ sudo ./i2cperf -d 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S

  Read block via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  43990           85             256           2           128

Kernel log of a single 128 bytes read request:

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

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Tested-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 drivers/hid/hid-ft260.c | 127 +++++++++++++++++++++-------------------
 1 file changed, 66 insertions(+), 61 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index cec83f69ebdc..a354089bb747 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -456,49 +456,62 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
+	u16 rd_len;
+	int timeout, ret;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
-	int timeout;
-	int ret;
 
-	if (len > FT260_RD_DATA_MAX) {
-		hid_err(hdev, "%s: unsupported rd len: %d\n", __func__, len);
-		return -EINVAL;
-	}
+	if ((flag & FT260_FLAG_START_REPEATED) == FT260_FLAG_START_REPEATED)
+		flag = FT260_FLAG_START_REPEATED;
+	else
+		flag = FT260_FLAG_START;
+	do {
+		if (len <= FT260_RD_DATA_MAX) {
+			rd_len = len;
+			flag |= FT260_FLAG_STOP;
+		} else {
+			rd_len = FT260_RD_DATA_MAX;
+		}
 
-	dev->read_idx = 0;
-	dev->read_buf = data;
-	dev->read_len = len;
+		dev->read_idx = 0;
+		dev->read_buf = data;
+		dev->read_len = rd_len;
 
-	rep.report = FT260_I2C_READ_REQ;
-	rep.length = cpu_to_le16(len);
-	rep.address = addr;
-	rep.flag = flag;
+		rep.report = FT260_I2C_READ_REQ;
+		rep.length = cpu_to_le16(rd_len);
+		rep.address = addr;
+		rep.flag = flag;
 
-	ft260_dbg("rep %#02x addr %#02x len %d\n", rep.report, rep.address,
-		  rep.length);
+		ft260_dbg("rep %#02x addr %#02x len %d rlen %d flag %#x\n",
+			  rep.report, rep.address, len, rd_len, flag);
 
-	reinit_completion(&dev->wait);
+		reinit_completion(&dev->wait);
 
-	ret = ft260_hid_output_report(hdev, (u8 *)&rep, sizeof(rep));
-	if (ret < 0) {
-		hid_err(hdev, "%s: failed to start transaction, ret %d\n",
-			__func__, ret);
-		return ret;
-	}
+		ret = ft260_hid_output_report(hdev, (u8 *)&rep, sizeof(rep));
+		if (ret < 0) {
+			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
+			return ret;
+		}
 
-	timeout = msecs_to_jiffies(5000);
-	if (!wait_for_completion_timeout(&dev->wait, timeout)) {
-		ft260_i2c_reset(hdev);
-		return -ETIMEDOUT;
-	}
+		timeout = msecs_to_jiffies(5000);
+		if (!wait_for_completion_timeout(&dev->wait, timeout)) {
+			ft260_i2c_reset(hdev);
+			return -ETIMEDOUT;
+		}
 
-	ret = ft260_xfer_status(dev);
-	if (ret == 0)
-		return 0;
+		ret = ft260_xfer_status(dev);
+		if (ret < 0) {
+			ft260_i2c_reset(hdev);
+			return -EIO;
+		}
 
-	ft260_i2c_reset(hdev);
-	return -EIO;
+		len -= rd_len;
+		data += rd_len;
+		flag = 0;
+
+	} while (len > 0);
+
+	return 0;
 }
 
 /*
@@ -509,45 +522,37 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
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
+			read_off = *msgs[0].buf;
 
-		ft260_dbg("read_off %#x left_len %d len %d\n", read_off,
-			  left_len, len);
-
-		ret = ft260_i2c_write(dev, addr, (u8 *)&read_off, msgs[0].len,
-				      FT260_FLAG_START);
-		if (ret < 0)
-			return ret;
-
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
2.34.1

