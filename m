Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88ED34A327F
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 00:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353411AbiA2XAy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 18:00:54 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33569 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353395AbiA2XAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 18:00:52 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 6687B32008FA;
        Sat, 29 Jan 2022 18:00:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 29 Jan 2022 18:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=qeuP9p8C7DpDSoMeAMOELLPEM/JnmC
        oRFLMB/Sunq8Q=; b=Cp5rrTgQbf5pyeDLEC8v3K6uqzb4DkBJOEoIUqwjN9gCIi
        B8aNPDAGCiCHHdTK0aJaLUYbRabk9Ce/uE+HBW/ICyAajebKPTS6MNffxMAsi2kV
        zagc6V1OhDKoVdyVXaOvzvE0wAz6Sbjn1tgxG+ye+ktP0Xrl1TQZ7FSlj8B9L2ld
        ryWheru5uvRHjLAF5H8LoF9LB+7px9wuTBhKIO7yMZgWcPl+TW3mv2R7ywb/zHca
        2IpA+hXhYvyrd63iKRvQNiKKx1F4LrDs6aBYwRV8ouj/G9/TmG9B/zfBK8iWnfGf
        OPvcivwKcd8djblbDGHgRsdqirTLTVyMJC4/0jtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qeuP9p
        8C7DpDSoMeAMOELLPEM/JnmCoRFLMB/Sunq8Q=; b=Zho7irXdRYZA7T3DPrr/Xb
        TSMZFjyBPRCX9kalT/XV36nz+HPBU45/eCBiHA3DQj1y/FZduY99Y+IIHkfT+X5Z
        w7ALWeSoItKtwIDNANWAyoxxsuJP3nmwuEyQPOs0R5K4mIA59zQE6YEbyjseWQUh
        mhoc4mBlz1AxrojED2Z4/mj5VftGplUh7JzBkKGR3SS3LUi2lws/jn2dIbGrxFMG
        uYhHELmIDDxQsKzcSpwXIN0ast2oR7DE4oH+EvHGBnC12W8+yzIMsiFP/mC2pdKi
        kTbBlB7cXKPfDqydSKWsmkN8vGnKlQfHCBQbIAut6WDyCRj9P7S+T3hTZjPug3Eg
        ==
X-ME-Sender: <xms:Isf1Yas9K-j6Cg4EBeuImBn7Z-1D4b65U0fri_WDwxEr5TI1j9aNcQ>
    <xme:Isf1Yff_ah-DzESksoggyqaY0Ymfod4WRTO0t-Zg3LParVKe6KNOHBM4DdOiBoq7V
    XUNPA6C6N3IJay6zQ>
X-ME-Received: <xmr:Isf1YVw-m6NFMzNVUfBTnUlERg3KUZAd5naxPPOf7khlnQw9q3Rcr-D8fIOw5BO3dI3jLtDwuLM_XH7Zx8SExeN-7UsXno9wHPRtJLvGR0y81ypCVUcMtz4WJjowNQ31DZ7vEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgdduieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeeffedtveduheefueejgeeuledtkeektdffjeefkedvieeuteefhfet
    hedtfeelvdenucffohhmrghinhepmhgvghhouhhsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:Isf1YVOh06wT3VmCFnNqA4Wf-h8LMKjgZ6XEyZLBXxxdOcJBZiKgWQ>
    <xmx:Isf1Ya8G1Kex51_fMgnoggXnq4H7yLCNd7xOvtzqFP9fLBZhqPfexg>
    <xmx:Isf1YdWugl-gW2rpUrgM8x_DW5PIJ3-c5mSHfctWLWFHuqenDKd1Pw>
    <xmx:Isf1YfN1gF7asnddKsdExaYJYOrLEkxZy7yW3C1OCw8_5-bCzJQ9Tg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 18:00:50 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/5] Input: pinephone-keyboard - Add PinePhone keyboard driver
Date:   Sat, 29 Jan 2022 17:00:39 -0600
Message-Id: <20220129230043.12422-3-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220129230043.12422-1-samuel@sholland.org>
References: <20220129230043.12422-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The official Pine64 PinePhone keyboard case contains a matrix keypad and
a MCU which runs a libre firmware. Add support for its I2C interface.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 MAINTAINERS                                 |   6 +
 drivers/input/keyboard/Kconfig              |  10 +
 drivers/input/keyboard/Makefile             |   1 +
 drivers/input/keyboard/pinephone-keyboard.c | 258 ++++++++++++++++++++
 4 files changed, 275 insertions(+)
 create mode 100644 drivers/input/keyboard/pinephone-keyboard.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f41088418aae..85428a707e67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15320,6 +15320,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
 F:	drivers/iio/chemical/pms7003.c
 
+PINE64 PINEPHONE KEYBOARD DRIVER
+M:	Samuel Holland <samuel@sholland.org>
+S:	Supported
+F:	Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
+F:	drivers/input/keyboard/pinephone-keyboard.c
+
 PLDMFW LIBRARY
 M:	Jacob Keller <jacob.e.keller@intel.com>
 S:	Maintained
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 0c607da9ee10..f9978da1c916 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -523,6 +523,16 @@ config KEYBOARD_OPENCORES
 	  To compile this driver as a module, choose M here; the
 	  module will be called opencores-kbd.
 
+config KEYBOARD_PINEPHONE
+	tristate "Pine64 PinePhone Keyboard"
+	depends on I2C
+	select CRC8
+	select INPUT_MATRIXKMAP
+	help
+	  Say Y here to enable support for the keyboard in the Pine64 PinePhone
+	  keyboard case. This driver supports the FLOSS firmware available at
+	  https://megous.com/git/pinephone-keyboard/
+
 config KEYBOARD_PXA27x
 	tristate "PXA27x/PXA3xx keypad support"
 	depends on PXA27x || PXA3xx || ARCH_MMP
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index e3c8648f834e..84da37e3a2f5 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_KEYBOARD_NSPIRE)		+= nspire-keypad.o
 obj-$(CONFIG_KEYBOARD_OMAP)		+= omap-keypad.o
 obj-$(CONFIG_KEYBOARD_OMAP4)		+= omap4-keypad.o
 obj-$(CONFIG_KEYBOARD_OPENCORES)	+= opencores-kbd.o
+obj-$(CONFIG_KEYBOARD_PINEPHONE)	+= pinephone-keyboard.o
 obj-$(CONFIG_KEYBOARD_PMIC8XXX)		+= pmic8xxx-keypad.o
 obj-$(CONFIG_KEYBOARD_PXA27x)		+= pxa27x_keypad.o
 obj-$(CONFIG_KEYBOARD_PXA930_ROTARY)	+= pxa930_rotary.o
diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
new file mode 100644
index 000000000000..9a071753fd91
--- /dev/null
+++ b/drivers/input/keyboard/pinephone-keyboard.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
+
+#include <linux/crc8.h>
+#include <linux/i2c.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+
+#define DRV_NAME			"pinephone-keyboard"
+
+#define PPKB_CRC8_POLYNOMIAL		0x07
+
+#define PPKB_DEVICE_ID_HI		0x00
+#define PPKB_DEVICE_ID_HI_VALUE			0x4b
+#define PPKB_DEVICE_ID_LO		0x01
+#define PPKB_DEVICE_ID_LO_VALUE			0x42
+#define PPKB_FW_REVISION		0x02
+#define PPKB_FW_FEATURES		0x03
+#define PPKB_MATRIX_SIZE		0x06
+#define PPKB_SCAN_CRC			0x07
+#define PPKB_SCAN_DATA			0x08
+#define PPKB_SYS_CONFIG			0x20
+#define PPKB_SYS_CONFIG_DISABLE_SCAN		BIT(0)
+
+struct pinephone_keyboard {
+	struct input_dev *input;
+	unsigned short *fn_keymap;
+	u8 crc_table[CRC8_TABLE_SIZE];
+	u8 row_shift;
+	u8 rows;
+	u8 cols;
+	u8 fn_state;
+	u8 buf_swap;
+	u8 buf[];
+};
+
+static int ppkb_set_scan(struct i2c_client *client, bool enable)
+{
+	struct device *dev = &client->dev;
+	int ret, val;
+
+	ret = i2c_smbus_read_byte_data(client, PPKB_SYS_CONFIG);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read config: %d\n", ret);
+		return ret;
+	}
+
+	if (enable)
+		val = ret & ~PPKB_SYS_CONFIG_DISABLE_SCAN;
+	else
+		val = ret | PPKB_SYS_CONFIG_DISABLE_SCAN;
+	ret = i2c_smbus_write_byte_data(client, PPKB_SYS_CONFIG, val);
+	if (ret) {
+		dev_err(dev, "Failed to write config: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ppkb_update(struct i2c_client *client)
+{
+	struct pinephone_keyboard *ppkb = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+	size_t buf_len = ppkb->cols + 1;
+	u8 *old_buf = ppkb->buf;
+	u8 *new_buf = ppkb->buf;
+	unsigned short *keymap;
+	int col, crc, ret, row;
+
+	if (ppkb->buf_swap)
+		old_buf += buf_len;
+	else
+		new_buf += buf_len;
+
+	ret = i2c_smbus_read_i2c_block_data(client, PPKB_SCAN_CRC,
+					    buf_len, new_buf);
+	if (ret != buf_len) {
+		dev_err(dev, "Failed to read scan data: %d\n", ret);
+		return;
+	}
+
+	crc = crc8(ppkb->crc_table, new_buf + 1, ppkb->cols, CRC8_INIT_VALUE);
+	if (crc != new_buf[0]) {
+		dev_err(dev, "Bad scan data (%02x != %02x)\n", crc, new_buf[0]);
+		return;
+	}
+
+	ppkb->buf_swap = !ppkb->buf_swap;
+
+	keymap = ppkb->fn_state ? ppkb->fn_keymap : ppkb->input->keycode;
+	for (col = 0; col < ppkb->cols; ++col) {
+		u8 old = *(++old_buf);
+		u8 new = *(++new_buf);
+		u8 changed = old ^ new;
+
+		for (row = 0; row < ppkb->rows; ++row) {
+			int code = MATRIX_SCAN_CODE(row, col, ppkb->row_shift);
+			int value = new & BIT(row);
+
+			if (!(changed & BIT(row)))
+				continue;
+
+			dev_dbg(dev, "row %u col %u %sed\n",
+				row, col, value ? "press" : "releas");
+			if (keymap[code] == KEY_FN) {
+				dev_dbg(dev, "FN is now %sed\n",
+					value ? "press" : "releas");
+				keymap = value ? ppkb->fn_keymap
+					       : ppkb->input->keycode;
+				ppkb->fn_state = value;
+			}
+			input_event(ppkb->input, EV_MSC, MSC_SCAN, code);
+			input_report_key(ppkb->input, keymap[code], value);
+		}
+	}
+	input_sync(ppkb->input);
+}
+
+static int ppkb_open(struct input_dev *input)
+{
+	struct i2c_client *client = input_get_drvdata(input);
+	int ret;
+
+	ret = ppkb_set_scan(client, true);
+	if (ret)
+		return ret;
+
+	ppkb_update(client);
+
+	return 0;
+}
+
+static void ppkb_close(struct input_dev *input)
+{
+	struct i2c_client *client = input_get_drvdata(input);
+
+	ppkb_set_scan(client, false);
+}
+
+static irqreturn_t ppkb_irq_thread(int irq, void *data)
+{
+	struct i2c_client *client = data;
+
+	ppkb_update(client);
+
+	return IRQ_HANDLED;
+}
+
+static int ppkb_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	unsigned int phys_rows, phys_cols;
+	unsigned int map_rows, map_cols;
+	struct pinephone_keyboard *ppkb;
+	u8 info[PPKB_MATRIX_SIZE + 1];
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(client, 0, sizeof(info), info);
+	if (ret != sizeof(info))
+		return dev_err_probe(dev, ret, "Failed to read device ID\n");
+
+	if (info[PPKB_DEVICE_ID_HI] != PPKB_DEVICE_ID_HI_VALUE ||
+	    info[PPKB_DEVICE_ID_LO] != PPKB_DEVICE_ID_LO_VALUE)
+		return dev_err_probe(dev, -ENODEV, "Unexpected device ID\n");
+
+	dev_info(dev, "Found keyboard firmware version %d.%d features %#x\n",
+		 info[PPKB_FW_REVISION] >> 4,
+		 info[PPKB_FW_REVISION] & 0xf,
+		 info[PPKB_FW_FEATURES]);
+
+	/* Disable scan by default to save power. */
+	ret = ppkb_set_scan(client, false);
+	if (ret)
+		return ret;
+
+	ret = matrix_keypad_parse_properties(dev, &map_rows, &map_cols);
+	if (ret)
+		return ret;
+
+	phys_rows = info[PPKB_MATRIX_SIZE] & 0xf;
+	phys_cols = info[PPKB_MATRIX_SIZE] >> 4;
+	if (map_rows != phys_rows || map_cols != phys_cols)
+		return dev_err_probe(dev, -EINVAL,
+				     "Keyboard size is %ux%u, but keymap is %ux%u\n",
+				     phys_rows, phys_cols, map_rows, map_cols);
+
+	/* Allocate two buffers, and include space for reading the CRC. */
+	ppkb = devm_kzalloc(dev, struct_size(ppkb, buf, 2 * (phys_cols + 1)), GFP_KERNEL);
+	if (!ppkb)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, ppkb);
+
+	crc8_populate_msb(ppkb->crc_table, PPKB_CRC8_POLYNOMIAL);
+	ppkb->row_shift = get_count_order(map_cols);
+	ppkb->rows = map_rows;
+	ppkb->cols = map_cols;
+
+	ppkb->input = devm_input_allocate_device(dev);
+	if (!ppkb->input)
+		return -ENOMEM;
+
+	input_set_drvdata(ppkb->input, client);
+
+	ppkb->input->name = "PinePhone Keyboard";
+	ppkb->input->phys = DRV_NAME "/input0";
+	ppkb->input->id.bustype = BUS_I2C;
+	ppkb->input->open = ppkb_open;
+	ppkb->input->close = ppkb_close;
+
+	__set_bit(EV_MSC, ppkb->input->evbit);
+	__set_bit(EV_REP, ppkb->input->evbit);
+
+	ret = matrix_keypad_build_keymap(NULL, "linux,fn-keymap",
+					 map_rows, map_cols, NULL, ppkb->input);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to build FN keymap\n");
+
+	ppkb->fn_keymap = ppkb->input->keycode;
+
+	ret = matrix_keypad_build_keymap(NULL, "linux,keymap",
+					 map_rows, map_cols, NULL, ppkb->input);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to build keymap\n");
+
+	ret = input_register_device(ppkb->input);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register input\n");
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, ppkb_irq_thread,
+					IRQF_ONESHOT, client->name, client);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	return 0;
+}
+
+static const struct of_device_id ppkb_of_match[] = {
+	{ .compatible = "pine64,pinephone-keyboard" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ppkb_of_match);
+
+static struct i2c_driver ppkb_driver = {
+	.probe_new	= ppkb_probe,
+	.driver		= {
+		.name		= DRV_NAME,
+		.of_match_table = ppkb_of_match,
+	},
+};
+module_i2c_driver(ppkb_driver);
+
+MODULE_AUTHOR("Samuel Holland <samuel@sholland.org>");
+MODULE_DESCRIPTION("Pine64 PinePhone keyboard driver");
+MODULE_LICENSE("GPL");
-- 
2.33.1

