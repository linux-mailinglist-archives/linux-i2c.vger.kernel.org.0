Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A545B5B4B3F
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 03:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiIKBlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 21:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiIKBlP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 21:41:15 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F316732DAB
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:13 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id a20so1320407qtw.10
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MGwVR7KMW7JJIFZssHswgB9KTK6/O+Daft2L6+TvsYk=;
        b=d3ohxfJQAr1tfy845NI3BHY8FLz05JxvjbpC3ohzGzwkuYHNdEHGI0YQNlg34r1QY2
         ylHp0bR7qXr0AN7YxUES7sAgzCPv3cLbMwi9h0r0wOipb9pRG8uFsEQ0fki1F9zWv6ZG
         c6/YF4GKupfNTrqIIm5TGkPtW9++cahl32Dm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MGwVR7KMW7JJIFZssHswgB9KTK6/O+Daft2L6+TvsYk=;
        b=T/vpCAvhjOc++Fr7fJvjpe1WBiwaTNvIrhImva3KDpRb+5O25zh0JZzRdCSKKFSfe5
         8/v7B+L8+kjYSeiKcS+eT9/P+VmErqqWziinbK5DciVm6yWXmICCbq3kplj280AMURgP
         9m5co96VYCe2yGFk0TgBrUIiDN+NRec0BFYFhRe67iCxeZuxzKb7NW4XDFPOaZp/Netr
         EMCzeAhSVoksY523AwNxKmHagZWn9c4O8RQIYlAYPqfIMMp2OguFJBdpMVW2gCG6h0fm
         naaq4XxU8GJNlhwcND4+K6fNLzEE9pECH33UEeuR5iT8laOK9SFOw/Ba9aIuAsIpTUTd
         fiRQ==
X-Gm-Message-State: ACgBeo16TaDOpT9EwGfwVFvsc06x82aeAU/6J73Gef0ndVOegM3+Fei6
        yDIEbNwai4FqguSAU6/BfPXz2A==
X-Google-Smtp-Source: AA6agR783G+KnEwWosiImBznkx+mgxw99W0bEjHSjU9PJJVgBYUrgD5j3Ge8whEas0DmXM+6EYYcWw==
X-Received: by 2002:ac8:58c4:0:b0:343:731e:7e81 with SMTP id u4-20020ac858c4000000b00343731e7e81mr18140205qta.367.1662860472950;
        Sat, 10 Sep 2022 18:41:12 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:12 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 5/5] HID: mcp2221: add ADC/DAC support via iio subsystem
Date:   Sat, 10 Sep 2022 18:40:48 -0700
Message-Id: <20220911014048.64235-6-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911014048.64235-1-matt.ranostay@konsulko.com>
References: <20220911014048.64235-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for 3x 10-bit ADC and 1x DAC channels registered via the iio
subsystem.

To prevent breakage and unexpected dependencies this support only is
only built if CONFIG_IIO is enabled, and is only weakly referenced by
'imply IIO' within the respective Kconfig.

Additionally the iio device only gets registered if at least one channel
is enabled in the power-on configuration read from SRAM.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/Kconfig       |   1 +
 drivers/hid/hid-mcp2221.c | 187 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 188 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 863d1f96ea57..cdae312f4795 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1228,6 +1228,7 @@ config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
 	depends on GPIOLIB
+	imply IIO
 	help
 	Provides I2C and SMBUS host adapter functionality over USB-HID
 	through MCP2221 device.
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 29e69576c3d4..923b41eb76b3 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -16,6 +16,7 @@
 #include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
+#include <linux/iio/iio.h>
 #include "hid-ids.h"
 
 /* Commands codes in a raw output report */
@@ -30,6 +31,8 @@ enum {
 	MCP2221_I2C_CANCEL = 0x10,
 	MCP2221_GPIO_SET = 0x50,
 	MCP2221_GPIO_GET = 0x51,
+	MCP2221_SET_SRAM_SETTINGS = 0x60,
+	MCP2221_GET_SRAM_SETTINGS = 0x61,
 };
 
 /* Response codes in a raw input report */
@@ -89,6 +92,7 @@ struct mcp2221 {
 	struct i2c_adapter adapter;
 	struct mutex lock;
 	struct completion wait_in_report;
+	struct delayed_work init_work;
 	u8 *rxbuf;
 	u8 txbuf[64];
 	int rxbuf_idx;
@@ -97,6 +101,16 @@ struct mcp2221 {
 	struct gpio_chip *gc;
 	u8 gp_idx;
 	u8 gpio_dir;
+	u8 mode[4];
+#if IS_REACHABLE(CONFIG_IIO)
+	struct iio_chan_spec iio_channels[3];
+	u16 adc_values[3];
+	u8 dac_value;
+#endif
+};
+
+struct mcp2221_iio {
+	struct mcp2221 *mcp;
 };
 
 /*
@@ -745,6 +759,9 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				break;
 			}
 			mcp->status = mcp_get_i2c_eng_state(mcp, data, 8);
+#if IS_REACHABLE(CONFIG_IIO)
+			memcpy(&mcp->adc_values, &data[50], sizeof(mcp->adc_values));
+#endif
 			break;
 		default:
 			mcp->status = -EIO;
@@ -816,6 +833,32 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 		complete(&mcp->wait_in_report);
 		break;
 
+	case MCP2221_SET_SRAM_SETTINGS:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			mcp->status = 0;
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	case MCP2221_GET_SRAM_SETTINGS:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			memcpy(&mcp->mode, &data[22], 4);
+#if IS_REACHABLE(CONFIG_IIO)
+			mcp->dac_value = data[6] & GENMASK(4, 0);
+#endif
+			mcp->status = 0;
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
 	default:
 		mcp->status = -EIO;
 		complete(&mcp->wait_in_report);
@@ -824,6 +867,145 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
+#if IS_REACHABLE(CONFIG_IIO)
+static int mcp2221_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *channel, int *val,
+			    int *val2, long mask)
+{
+	struct mcp2221_iio *priv = iio_priv(indio_dev);
+	struct mcp2221 *mcp = priv->mcp;
+	int ret;
+
+	mutex_lock(&mcp->lock);
+
+	if (channel->output) {
+		*val = mcp->dac_value;
+		ret = IIO_VAL_INT;
+	} else {
+		/* Read ADC values */
+		ret = mcp_chk_last_cmd_status(mcp);
+
+		if (!ret) {
+			*val = le16_to_cpu(mcp->adc_values[channel->address]);
+			if (*val >= BIT(10))
+				ret =  -EINVAL;
+			else
+				ret = IIO_VAL_INT;
+		}
+	}
+
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+static int mcp2221_write_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int val, int val2, long mask)
+{
+	struct mcp2221_iio *priv = iio_priv(indio_dev);
+	struct mcp2221 *mcp = priv->mcp;
+	int ret;
+
+	if (val < 0 || val >= BIT(5))
+		return -EINVAL;
+
+	mutex_lock(&mcp->lock);
+
+	memset(mcp->txbuf, 0, 12);
+	mcp->txbuf[0] = MCP2221_SET_SRAM_SETTINGS;
+	mcp->txbuf[4] = BIT(7) | val;
+
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 12);
+
+	if (!ret)
+		mcp->dac_value = val;
+
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+static const struct iio_info mcp2221_info = {
+	.read_raw = &mcp2221_read_raw,
+	.write_raw = &mcp2221_write_raw,
+};
+
+static int mcp_iio_channels(struct mcp2221 *mcp)
+{
+	int idx, cnt = 0;
+	bool dac_created = false;
+
+	/* GP0 doesn't have ADC/DAC alternative function */
+	for (idx = 1; idx < MCP_NGPIO; idx++) {
+		struct iio_chan_spec *chan = &mcp->iio_channels[cnt];
+
+		switch (mcp->mode[idx]) {
+		case 2:
+			chan->address = idx - 1;
+			chan->channel = cnt++;
+			break;
+		case 3:
+			/* GP1 doesn't have DAC alternative function */
+			if (idx == 1 || dac_created)
+				continue;
+			/* DAC1 and DAC2 outputs are connected to the same DAC */
+			dac_created = true;
+			chan->output = 1;
+			cnt++;
+			break;
+		default:
+			continue;
+		};
+
+		chan->type = IIO_VOLTAGE;
+		chan->indexed = 1;
+		chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+		chan->scan_index = -1;
+	}
+
+	return cnt;
+}
+
+static void mcp_init_work(struct work_struct *work)
+{
+	struct iio_dev *indio_dev;
+	struct mcp2221 *mcp = container_of(work, struct mcp2221, init_work.work);
+	struct mcp2221_iio *data;
+	int ret, num_channels;
+
+	hid_hw_power(mcp->hdev, PM_HINT_FULLON);
+	mutex_lock(&mcp->lock);
+
+	mcp->txbuf[0] = MCP2221_GET_SRAM_SETTINGS;
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+	mutex_unlock(&mcp->lock);
+	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
+
+	if (ret)
+		return;
+
+	num_channels = mcp_iio_channels(mcp);
+	if (!num_channels)
+		return;
+
+	indio_dev = devm_iio_device_alloc(&mcp->hdev->dev, sizeof(*data));
+	if (!indio_dev)
+		return;
+
+	data = iio_priv(indio_dev);
+	data->mcp = mcp;
+
+	indio_dev->name = "mcp2221";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &mcp2221_info;
+	indio_dev->channels = mcp->iio_channels;
+	indio_dev->num_channels = num_channels;
+
+	devm_iio_device_register(&mcp->hdev->dev, indio_dev);
+}
+#endif
+
 static int mcp2221_probe(struct hid_device *hdev,
 					const struct hid_device_id *id)
 {
@@ -902,6 +1084,11 @@ static int mcp2221_probe(struct hid_device *hdev,
 	if (ret)
 		goto err_i2c;
 
+#if IS_REACHABLE(CONFIG_IIO)
+	INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
+	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(500));
+#endif
+
 	return 0;
 
 err_i2c:
-- 
2.37.2

