Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E9CDCFDF
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 22:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443379AbfJRUSG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 16:18:06 -0400
Received: from gmmr3.centrum.cz ([46.255.225.251]:58546 "EHLO gmmr3.centrum.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2443381AbfJRUSF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Oct 2019 16:18:05 -0400
Received: from gm-as1.cent (unknown [10.255.254.39])
        by gmmr3.centrum.cz (Postfix) with ESMTP id A33BE1800FB81
        for <linux-i2c@vger.kernel.org>; Fri, 18 Oct 2019 22:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=volny.cz; s=mail;
        t=1571429426; bh=gKQH6Ytw6OyogOyIOfm/sERqti2SF7M+FXZNYo7/F0o=;
        h=From:Subject:To:Date:From;
        b=jq2MpSvCxd7BD64SE2Db1dVMKeq9w4ls3lsT9Uzz3Psxuo+R+MnGOp1yEsxtmgreL
         FniyeBo2Vrn/2U6Ae5qRjsv5WUfqt6bdLolFvyGhc4df3BjHoibvTrwzcZw1ONtL0i
         9LbUeY5fTvxWTcXoP7PYlfIIO6Bup2qf6uzCpViM=
Received: by gm-as1.cent (Postfix, from userid 65534)
        id A11234800083; Fri, 18 Oct 2019 22:10:26 +0200 (CEST)
X-Original-From: ladmanj@volny.cz
X-Original-IP: 176.114.248.152
Received: from [192.168.1.121] (unknown [176.114.248.152])
        by gm-smtp5.centrum.cz (Postfix) with ESMTPX id 4901A84000F2;
        Fri, 18 Oct 2019 22:10:20 +0200 (CEST)
From:   Jakub Ladman <ladmanj@volny.cz>
Subject: [PATCH][RESEND] New driver for TLV493D-A1B6 I2C chip, input and hwmon
 class device.
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Message-ID: <966f09b8-0936-6d90-2ec8-bcb1b94c81aa@volny.cz>
Date:   Fri, 18 Oct 2019 22:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear maintainers.

As a linux-patch newbie i made some mistakes in my first attempt to send 
this patch.
This patch contains a new driver for i2c connected chip, Infineon 
TLV493D-A1B6.
The chip is 3D hall-effect sensor with thermometer.

This particular driver senses magnetic field rotation in X/Y plane with 
1 degree resolution and +/- 1 degree error.

Input device is created for the angle sensing part.
Hwmon device is created for the thermometer part.

Input device axis must be configured by device-tree. There are also 
optional parameters regarding absolute/relative mode switching, minimum 
step in relative mode, filtering and thermometer calibration.

We are using that device as high reliability rotary encoder.

Signed-off-by: Jakub Ladman <ladmanj@volny.cz>
---
.../bindings/input/tlv493d-a1b6_rotenc.txt | 70 ++
drivers/input/misc/Kconfig | 9 +
drivers/input/misc/Makefile | 2 +-
drivers/input/misc/tlv493d-a1b6_rotenc.c | 675 ++++++++++++++++++
4 files changed, 755 insertions(+), 1 deletion(-)
create mode 100644 
Documentation/devicetree/bindings/input/tlv493d-a1b6_rotenc.txt
create mode 100644 drivers/input/misc/tlv493d-a1b6_rotenc.c

diff --git 
a/Documentation/devicetree/bindings/input/tlv493d-a1b6_rotenc.txt 
b/Documentation/devicetree/bindings/input/tlv493d-a1b6_rotenc.txt
new file mode 100644
index 000000000000..0f7dac615dc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/tlv493d-a1b6_rotenc.txt
@@ -0,0 +1,70 @@
+This is driver of Infineon TLV493D-1AB6 chip, acting like rotary encoder.
+TLV493-A1B6 is I2C slave.
+
+Example of usage (for raspberry-pi):
+
+/dts-v1/;
+/plugin/;
+
+/ {
+ compatible = "brcm,bcm2708";
+
+ fragment@0 {
+ target = <&i2c0>;
+ __overlay__ {
+ status = "okay";
+
+ #address-cells = <1>;
+ #size-cells = <0>;
+
+ tlv493da1b6@1f {
+ compatible = "infineon,tlv493da1b6";
+ reg = <0x1f>;
+ relative_step = <12>;
+ filter = <1>;
+ temp_filter = <6>;
+ temp_base = <340>;
+ refresh_rate_ms = <15>;
+ linux,axis = <8>; /* REL_WHEEL */
+ };
+
+ };
+ };
+};
+
+reg is the only mandatory parameter, for the others defaults will be 
used if not specified.
+
+reg = <0x1f> - set to alternate address
+Can be switched to <0x5f>, the primary address, but this is unavailable 
at for some +i2c controllers.
+For example 0x1f must be used for NXP IMx6 SOC.
+This may change in future with its i2c-controller driver updates.
+
+0x5f is the device's default address, but we need to preserve the 
address after device
+periodical reset and it's impossible to reset it to primary address on 
some i2c controllers.
+Raspberry Pi 3B+ is proven to work with both addresses.
+
+See driver source code for more details.
+
+relative_step can be:
+ zero -> absolute output 0-359 deg
+ non-zero -> relative tick if change > step
+
+
+filter:
+ coefficient of first order IIR filter
+ - set to balance speed and noise of magnetic vector components
+
+temp_filter:
+ coefficient of first order IIR filter
+ - set to transform temperature sensor noise to additional resolution
+
+temp_base:
+ raw binary value for 25 deg C, typical value is 340, but it differs 
device to device. See datasheet.
+
+refresh_rate:
+ hardware starts new measurement 12 ms after last readout
+ set the refresh rate to T > 12 ms
+ +linux,axis:
+ set to appropriate input event
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7d9ae394e597..91a36a632f62 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -894,4 +894,13 @@ config INPUT_STPMIC1_ONKEY
To compile this driver as a module, choose M here: the
module will be called stpmic1_onkey.
+config INPUT_TLV493D_A1B6_ROTENC
+ tristate "Infineon TLV493D-A1B6 Rotary Encoder"
+ depends on I2C
+ help
+ Say Y to enable support of TLV493D-A1B6 as rotary encoder.
+
+ To compile this driver as a module, choose M here. The
+ module will be called tlv493d-a1b6_rotenc.
+
endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bd..071fb506475f 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -85,4 +85,4 @@ obj-$(CONFIG_INPUT_WM831X_ON) += wm831x-on.o
obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND) += xen-kbdfront.o
obj-$(CONFIG_INPUT_YEALINK) += yealink.o
obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR) += ideapad_slidebar.o
-
+obj-$(CONFIG_INPUT_TLV493D_A1B6_ROTENC) += tlv493d-a1b6_rotenc.o
diff --git a/drivers/input/misc/tlv493d-a1b6_rotenc.c 
b/drivers/input/misc/tlv493d-a1b6_rotenc.c
new file mode 100644
index 000000000000..33e53fd30fb0
--- /dev/null
+++ b/drivers/input/misc/tlv493d-a1b6_rotenc.c
@@ -0,0 +1,675 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TLV493D-A1B6 three axis magnetic sensor acting as rotary encoder.
+ * Rotation in X/Y plane is reported, Z-axis is ignored.
+ * Temperature is reported.
+ *
+ * Copyright (C) 2019 Jakub Ladman <ladmanj@volny.cz>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+
+#include <linux/input.h>
+#include <linux/i2c.h>
+#include <linux/delay.h>
+
+#include <linux/of.h>
+#include <linux/types.h>
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+
+#define TLV493DA1B6_ROTENC_NAME "tlv493da1b6_rotenc"
+
+#define TLV_BITS_PAR (1<<7)
+#define TLV_BITS_ADR (1<<5)
+#define TLV_BITS_INT (1<<2)
+#define TLV_BITS_FST (1<<1)
+#define TLV_BITS_LOW (1<<0)
+#define TLV_BITS_TEM (1<<7)
+#define TLV_BITS_LPP (1<<6)
+#define TLV_BITS_PTE (1<<5)
+
+#define TLV_BITS_FRM(a) (((a) >> 2) & 0b11) /* frame counter */
+#define TLV_BITS_CHA(a) (((a) >> 0) & 0b11) /* ongoing conversion */
+
+struct tlv493da1b6_rotenc_data {
+ struct i2c_client *client;
+ struct input_dev *input_dev;
+ struct timer_list i2c_timer;
+ struct work_struct offload;
+
+ struct device *hwmon_dev;
+ struct attribute_group attr_group;
+ const struct attribute_group *groups[2];
+ struct attribute **attrs;
+ struct sensor_device_attribute *attr;
+
+ u32 refresh_rate_ms;
+ u32 filter_bits;
+ u32 temp_filter_bits;
+ u32 temp_base;
+ u32 axis;
+ u32 relative_step;
+
+/* private */
+ s32 x_filter;
+ s32 y_filter;
+ s32 t_filter;
+ u32 frame_cnt;
+ int lastabs;
+ int temperature;
+};
+
+static uint8_t parity(uint32_t x)
+{
+ x ^= x >> 16;
+ x ^= x >> 8;
+ x ^= x >> 4;
+ x ^= x >> 2;
+ x ^= x >> 1;
+ return (~x << 7); /* returns parity at seventh bit possition! */
+}
+
+/**********************************************************************
+ * input values filter (https://electronics.stackexchange.com/a/34426)
+ **********************************************************************/
+
+/*
+ * @details Implement a first order IIR filter to approximate a K sample
+ * moving average. This function implements the equation:
+ *
+ * y[n] = alpha * x[n] + (1 - alpha) * y[n-1]
+ *
+ * @param *filter - a Signed 15.16 fixed-point value.
+ * @param sample - the 16-bit value of the current sample.
+ * @param bits - this is roughly = log2( 1 / alpha ).
+ */
+
+int16_t IIR_Filter(int32_t *filter, int32_t sample, uint32_t bits)
+{
+ int32_t local_sample = (int32_t) sample << 16;
+ *filter += (local_sample - *filter) >> bits;
+ return (int16_t) ((*filter + 0x8000) >> 16);
+}
+
+/**********************************************************************
+ * angle computation
+ **********************************************************************/
+
+/*
+ * Original copyright notice:
+ * This algorithm and code examples on this page are open-source,
+ * use them as you like but please mention www.RomanBlack.com.
+ *
+ * Fast XY vector to integer degree algorithm - Jan 2011 www.RomanBlack.com
+ * Converts any XY values including 0 to a degree value that should be
+ * within +/- 1 degree of the accurate value without needing
+ * large slow trig functions like ArcTan() or ArcCos().
+ * NOTE! at least one of the X or Y values must be non-zero!
+ * This is the full version, for all 4 quadrants and will generate
+ * the angle in integer degrees from 0-359.
+ * Any values of X and Y are usable including negative values provided
+ * they are between -95443717 and 95443717
+ * so the 32bit multiply does not overflow.
+ *
+ * modified to 32bit and corrected to 0-359 degrees output by Jakub Ladman
+ */
+
+int angle(int32_t y, int32_t x)
+{
+
+ uint32_t negflag;
+ uint32_t comp;
+ int32_t degree; /* this will hold the result */
+ int32_t ux;
+ int32_t uy;
+
+ /* preventing div by zero, in hardware fault condition */
+ if (!(x && y))
+ return -1;
+
+ /* Save the sign flags then remove signs and get XY as unsigned ints */
+ negflag = 0;
+ if (x < 0) {
+ negflag |= 0x01; /* x flag bit */
+ x = (0 - x); /* is now + */
+ }
+ ux = x; /* copy to unsigned var before multiply */
+ if (y < 0) {
+ negflag |= 0x02; /* y flag bit */
+ y = (0 - y); /* is now + */
+ }
+ uy = y; /* copy to unsigned var before multiply */
+
+ /* 1. Calc the scaled "degrees" */
+ if (ux > uy) {
+ degree = (uy * 45) / ux; /* degree result will be 0-45 range */
+ negflag |= 0x10; /* octant flag bit */
+ } else {
+ degree = (ux * 45) / uy; /* degree result will be 0-45 range */
+ }
+
+ /* 2. Compensate for the 4 degree error curve */
+ comp = 0;
+ if (degree > 22) { /* if top half of range */
+ if (degree <= 44)
+ comp++;
+ if (degree <= 41)
+ comp++;
+ if (degree <= 37)
+ comp++;
+ if (degree <= 32)
+ comp++; /* max is 4 degrees compensated */
+ } else { /* else is lower half of range */
+ if (degree >= 2)
+ comp++;
+ if (degree >= 6)
+ comp++;
+ if (degree >= 10)
+ comp++;
+ if (degree >= 15)
+ comp++; /* max is 4 degrees compensated */
+ }
+ degree += comp; /* degree is now accurate to +/- 1 degree! */
+
+ /* Invert degree if it was X>Y octant, makes 0-45 into 90-45 */
+ if (negflag & 0x10)
+ degree = (90 - degree);
+
+ /* 3. Degree is now 0-90 range for this quadrant,
+ * need to invert it for whichever quadrant it was in
+ */
+ if (negflag & 0x02) { /* if -Y */
+ if (negflag & 0x01) /* if -Y -X */
+ degree = (180 + degree);
+ else /* else is -Y +X */
+ degree = (180 - degree);
+ } else { /* else is +Y */
+ if (negflag & 0x01) { /* if +Y -X */
+ degree = (359 - degree);
+ if (negflag & 0x10)
+ degree += 1;
+ }
+ }
+ return degree;
+}
+
+/*
+ * TLV493D-A1B6 device reset
+ * Reset is needed to set up secondary address and to unlock the device
+ * if the measurement stalls.
+ * From time to time the device freezes, returning the same old data again
+ * and again.
+ * This behavior is documented in official documentation from the
+ * manufacturer.
+ * The stalled state is detectable observing the frame counter,
+ * if it stops incrementing and overflowing the device must be reset.
+ * See the detection part in work handler function.
+ *
+ * The device is reset if i2c address 0x00 is called in write mode.
+ * The new device address is set by the state (voltage) of the SDA line
+ * from 4 us to 14 us after address ACK is sent.
+ * This is done in this driver by sending 0x00 or 0xff byte according
+ * to requested address. This behavior was tested on bare metal MCU,
+ * before implemented here.
+ *
+ * Unfortunately at least in case of IMx6 SOC, there is impossible
+ * to send the 0xff byte in that time limit.
+ * This leads to practical limitation of single TLV493D-A1B6 chip at 0x1f
+ * on single i2c bus.
+ *
+ * On Raspberry PI 3B+ is possible to use both addresses.
+ *
+ * Another limitation is that if there were two (or more) these chips on
+ * the same bus, both will respond to reset command in the same way and
+ * thus it will lead to address confilct.
+ *
+ * This has to be solved by additional hardware and driver modification.
+ * I.e. disconnect clock and/or data signal from the unrelated chip
+ * during reset.
+ *
+ * In the datasheet and user manual is also described a possibility
+ * to select up to 8 different addresses and then share a single bus
+ * by these 8 devices.
+ * Without help of additional hardware and driver modification,
+ * unable to maintain these further addresses which are to be set
+ * by power sequencing. This driver doesn't support power sequencing.
+ *
+ * After the reset, the configuration is sent to the device.
+ */
+
+static int i2c_device_reset(struct i2c_client *client)
+{
+ struct i2c_msg tlv493_reset_msg[1];
+ int result = 0;
+ u8 buf[10];
+
+ buf[0] = 0x00; /* Reset the device to the alternate address 0x1f. */
+
+ tlv493_reset_msg[0].addr = 0;
+ tlv493_reset_msg[0].flags = 0;
+ tlv493_reset_msg[0].len = 1;
+ tlv493_reset_msg[0].buf = buf;
+
+ /* If MSB of the address is high, default address 0x5e is used. */
+ /* It does not work if the controller is pulling SDA line low */
+ /* after ACK. Only the alternate address is then usable. */
+ if (client->addr & 0x40)
+ buf[0] = 0xff;
+
+
+ result = i2c_transfer(client->adapter, tlv493_reset_msg, 1);
+
+ udelay(10);
+
+ /*
+ * The initialization part:
+ * There is a strange request in the datasheet to not change some bits.
+ * Original values has to be read from registers 6..9, then modified
+ * and written back to registers 0..3.
+ *
+ * There is also need to set the parity so the parity of
+ * all the 32 bits of configuration will be odd.
+ *
+ * The parity checking can be disabled, but the first configuration
+ * has to be "secured" anyway.
+ *
+ * This driver exploits master controlled low power mode, in which
+ * the measurement is started 12 ms after the last readout.
+ * If faster refresh rate needed, the low power bit must be
+ * switched off. Then the refresh rate can be as low as 300 us.
+ *
+ * This version of the driver doesn't support these refresh rates,
+ * because it is assumed to be unpractical on the non-realtime os.
+ */
+
+ /* Read all registers to get the default values for write registers */
+ result = i2c_master_recv(client, buf, 10);
+ if (result < 0) {
+ dev_info(&client->dev, "FAIL: i2c can't read data: %d", result);
+ return result;
+ }
+
+ udelay(20);
+
+ /* Prepare config data, use the read values in buffer[6..9] */
+ buf[6] = 0x00;
+
+ buf[7] |= TLV_BITS_FST | TLV_BITS_LOW;
+ /* Other bits must correspond to bits from read register 7. */
+
+ /* All bits must correspond to bits 7:0 from read register 8. */
+
+ buf[9] |= TLV_BITS_LPP | TLV_BITS_PTE;
+ /* Other bits must correspond to bits from read register 9. */
+
+ /* Update parity bit according to actual content of buf[6..9] */
+ buf[7] ^= parity(*((uint32_t *) (buf + 6)));
+
+ /* Send configuration data */
+ result = i2c_master_send(client, buf + 6, 4);
+ if (result < 0)
+ dev_info(&client->dev,
+ "FAIL: i2c can't write data: %d", result);
+
+ return result;
+}
+
+static void i2c_work_handler(struct work_struct *work)
+{
+ struct tlv493da1b6_rotenc_data *rotenc =
+ container_of(work, struct tlv493da1b6_rotenc_data, offload);
+ struct input_dev *input_dev = rotenc->input_dev;
+ struct {
+ signed int val:12;
+ } tmp;
+
+ u8 buf[10];
+ s16 x, y;
+ u8 attempt = 1;
+ int curabs;
+
+ do {
+ if (attempt < 10) { /* try it ten times */
+ i2c_master_recv(rotenc->client, buf, 7);
+ attempt++;
+ } else { /* give up */
+ dev_info(&rotenc->client->dev,
+ "FAIL: tlv493 read failed, attempt %d\n",
+ attempt);
+ return;
+ }
+
+ /* zero if all three axes consistent */
+ if (TLV_BITS_CHA(buf[3])) {
+ dev_info(&rotenc->client->dev,
+ "tlv493 read inconsistent, attempt %d\n",
+ attempt);
+ continue; /* read again if not */
+ }
+
+ /* if the frame was already received */
+ if (rotenc->frame_cnt == TLV_BITS_FRM(buf[3])) {
+ dev_info(&rotenc->client->dev,
+ "FAIL: tlv493 stalled %d, resetting\n",
+ TLV_BITS_FRM(buf[3]));
+ if (i2c_device_reset(rotenc->client) < 0) {
+ dev_err(&rotenc->client->dev,
+ "FAIL: i2c device doesn't respond to reset.");
+ /* Device permanent error, the hw dissappeared from bus or so. */
+ /* I would like to stop and exit module here, but don't know how to. */
+ }
+ /* reinit with unseen frame number again */
+ rotenc->frame_cnt = 0xff;
+ /* discard data and wait for next timer event */
+ return;
+ }
+ rotenc->frame_cnt = TLV_BITS_FRM(buf[3]);
+
+ } while (TLV_BITS_CHA(buf[3]));
+
+ /* Magnetic axis X data */
+ tmp.val = buf[0] << 4;
+ tmp.val |= buf[4] >> 4;
+
+ x = IIR_Filter(&rotenc->x_filter, tmp.val, rotenc->filter_bits);
+
+ /* Magnetic axis Y data */
+ tmp.val = buf[1] << 4;
+ tmp.val |= buf[4] & 0xf;
+
+ y = IIR_Filter(&rotenc->y_filter, tmp.val, rotenc->filter_bits);
+
+ /* Temperature data */
+ tmp.val = buf[6];
+ tmp.val |= (buf[3] << 4) & 0xf00;
+
+ /*
+ * subtracting typical offset of 340 LSB's
+ * converting to degC by 1.1C/LSB
+ * adding reference temperature of 25C
+ */
+
+ rotenc->temperature = 25000
+ + IIR_Filter(&rotenc->t_filter,
+ 1100 * (tmp.val - rotenc->temp_base),
+ rotenc->temp_filter_bits); /* TEMP: 0.001C/bit */
+
+ /* compute current angle */
+ curabs = angle(y, x);
+
+ if (curabs < 0)
+ return; /* invalid values aren't reported */
+
+ /* non-zero -> relative, zero -> absolute */
+ if (rotenc->relative_step) {
+
+ int diff = (curabs - rotenc->lastabs);
+
+ if (diff > 180)
+ diff -= 360;
+ else if (diff < -180)
+ diff += 360;
+
+ if (abs(diff) > rotenc->relative_step) {
+ diff /= abs(diff);
+ input_report_rel(input_dev, rotenc->axis, diff);
+ rotenc->lastabs = curabs;
+ }
+ } else {
+ input_report_abs(input_dev, rotenc->axis, curabs);
+ }
+
+ input_sync(input_dev);
+}
+
+static ssize_t show_temperature(struct device *dev,
+ struct device_attribute *attr, char *buf)
+{
+ struct tlv493da1b6_rotenc_data *rotenc = dev_get_drvdata(dev);
+
+ return sprintf(buf, "%d\n", rotenc->temperature);
+}
+
+static void i2c_timer_callback(struct timer_list *t)
+{
+
+ struct tlv493da1b6_rotenc_data *rotenc =
+ from_timer(rotenc, t, i2c_timer);
+ schedule_work(&rotenc->offload);
+
+ mod_timer(&rotenc->i2c_timer,
+ jiffies + msecs_to_jiffies(rotenc->refresh_rate_ms));
+}
+
+static void tlv493da1b6_rotenc_power(struct tlv493da1b6_rotenc_data 
*rotenc,
+ bool poweron)
+{
+}
+
+static int tlv493da1b6_rotenc_probe(struct i2c_client *client,
+ const struct i2c_device_id *id)
+{
+ struct tlv493da1b6_rotenc_data *rotenc;
+ struct device_node *np = client->dev.of_node;
+ struct input_dev *input_dev;
+ int error;
+ char *sname;
+
+ if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+ dev_err(&client->dev, "need I2C_FUNC_I2C\n");
+ return -EIO;
+ }
+
+ rotenc = devm_kzalloc(&client->dev, sizeof(*rotenc), GFP_KERNEL);
+ if (!rotenc)
+ return -ENOMEM;
+
+ input_dev = devm_input_allocate_device(&client->dev);
+ if (!input_dev)
+ return -ENOMEM;
+
+ rotenc->client = client;
+ rotenc->input_dev = input_dev;
+
+ tlv493da1b6_rotenc_power(rotenc, true);
+
+ input_dev->name = TLV493DA1B6_ROTENC_NAME;
+ input_dev->id.bustype = BUS_I2C;
+ input_dev->dev.parent = &client->dev;
+
+ i2c_set_clientdata(client, rotenc);
+ device_init_wakeup(&client->dev, 1);
+
+ error = i2c_device_reset(rotenc->client);
+ if (error < 0) {
+ dev_err(&client->dev, "Unable to reset %s\n", input_dev->name);
+ return error;
+ }
+
+ if (of_property_read_u32(np, "relative_step", &rotenc->relative_step))
+ rotenc->relative_step = 0;
+
+ dev_info(&client->dev, "relative_step %d\n", rotenc->relative_step);
+
+ /* if zero, absolute value reported */
+ if (of_property_read_u32(np, "linux,axis", &rotenc->axis)) {
+ if (rotenc->relative_step)
+ rotenc->axis = REL_WHEEL;
+ else
+ rotenc->axis = ABS_WHEEL;
+ }
+ dev_info(&client->dev, "axis %d\n", rotenc->axis);
+
+ if (rotenc->relative_step) {
+ __set_bit(EV_REL, input_dev->evbit);
+ input_set_capability(input_dev, EV_REL, rotenc->axis);
+ } else {
+ __set_bit(EV_ABS, input_dev->evbit);
+ input_set_abs_params(input_dev, rotenc->axis, 0, 359, 0, 0);
+ }
+
+ error = input_register_device(rotenc->input_dev);
+ if (error) {
+ dev_err(&client->dev, "Unable to register %s input device\n",
+ input_dev->name);
+ return error;
+ }
+
+ rotenc->attrs =
+ devm_kzalloc(&client->dev, sizeof(*rotenc->attrs) * 2, GFP_KERNEL);
+ if (rotenc->attrs == NULL) {
+ error = -ENOMEM;
+ goto err2;
+ }
+
+ rotenc->attr =
+ devm_kzalloc(&client->dev, sizeof(*rotenc->attr), GFP_KERNEL);
+ if (rotenc->attr == NULL) {
+ error = -ENOMEM;
+ goto err2;
+ }
+
+ sysfs_attr_init(&rotenc->attr->dev_attr.attr);
+
+ rotenc->attr->dev_attr.attr.name =
+ devm_kasprintf(&client->dev, GFP_KERNEL, "temp1_input");
+ if (rotenc->attr->dev_attr.attr.name == NULL) {
+ error = -ENOMEM;
+ goto err2;
+ }
+
+ rotenc->attr->dev_attr.show = show_temperature;
+ rotenc->attr->dev_attr.attr.mode = 0444;
+ rotenc->attr->index = 0;
+
+ rotenc->attrs[0] = &rotenc->attr->dev_attr.attr;
+
+ rotenc->attr_group.attrs = rotenc->attrs;
+ rotenc->groups[0] = &rotenc->attr_group;
+
+ sname = devm_kstrdup(&client->dev, input_dev->name, GFP_KERNEL);
+ if (!sname) {
+ error = -ENOMEM;
+ goto err2;
+ }
+
+ strreplace(sname, '-', '_');
+ rotenc->hwmon_dev =
+ hwmon_device_register_with_groups(&client->dev, sname, rotenc,
+ rotenc->groups);
+ if (IS_ERR(rotenc->hwmon_dev)) {
+ error = PTR_ERR(rotenc->hwmon_dev);
+ goto err2;
+ }
+
+ rotenc->x_filter = 0;
+ rotenc->y_filter = 0;
+ rotenc->t_filter = 0;
+ rotenc->frame_cnt = 0xff; /* received frame nr. will differ for sure */
+
+ if (of_property_read_u32(np, "filter", &rotenc->filter_bits))
+ rotenc->filter_bits = 3;
+
+ dev_info(&client->dev, "filter %d\n", rotenc->filter_bits);
+
+ if (of_property_read_u32(np, "temp_filter", &rotenc->temp_filter_bits))
+ rotenc->temp_filter_bits = 8;
+
+ dev_info(&client->dev, "temp_filter %d\n", rotenc->temp_filter_bits);
+
+ if (of_property_read_u32(np, "temp_base", &rotenc->temp_base))
+ rotenc->temp_base = 340;
+
+ dev_info(&client->dev, "temp_base %d\n", rotenc->temp_base);
+
+ if (of_property_read_u32
+ (np, "refresh_rate_ms", &rotenc->refresh_rate_ms)) {
+ rotenc->refresh_rate_ms = 20;
+ }
+/* measurement is started by hw 12ms after last readout */
+ if (rotenc->refresh_rate_ms < 12)
+ rotenc->refresh_rate_ms = 20;
+ dev_info(&client->dev, "refresh_rate_ms %d\n", rotenc->refresh_rate_ms);
+
+ INIT_WORK(&rotenc->offload, i2c_work_handler);
+ timer_setup(&rotenc->i2c_timer, i2c_timer_callback, 0);
+ error =
+ mod_timer(&rotenc->i2c_timer,
+ jiffies + msecs_to_jiffies(rotenc->refresh_rate_ms));
+
+ if (error) {
+ dev_err(&client->dev, "Unable to register %s timer\n",
+ input_dev->name);
+ goto err1;
+ }
+
+ return 0;
+
+err1: del_timer(&rotenc->i2c_timer);
+ hwmon_device_unregister(rotenc->hwmon_dev);
+err2: input_unregister_device(rotenc->input_dev);
+
+ return error;
+}
+
+static int tlv493da1b6_rotenc_remove(struct i2c_client *client)
+{
+ struct tlv493da1b6_rotenc_data *rotenc = i2c_get_clientdata(client);
+
+ del_timer(&rotenc->i2c_timer);
+ hwmon_device_unregister(rotenc->hwmon_dev);
+ input_unregister_device(rotenc->input_dev);
+ tlv493da1b6_rotenc_power(rotenc, false);
+
+ return 0;
+}
+
+
+static const struct i2c_device_id tlv493da1b6_rotenc_id[] = {
+ { TLV493DA1B6_ROTENC_NAME, 0 },
+ { }
+};
+
+MODULE_DEVICE_TABLE(i2c, tlv493da1b6_rotenc_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id tlv493da1b6_rotenc_dt_ids[] = {
+ {.compatible = "infineon,tlv493da1b6", },
+ { }
+};
+
+MODULE_DEVICE_TABLE(of, tlv493da1b6_rotenc_dt_ids);
+#endif
+
+static struct i2c_driver tlv493da1b6_rotenc_driver = {
+ .probe = tlv493da1b6_rotenc_probe,
+ .remove = tlv493da1b6_rotenc_remove,
+ .id_table = tlv493da1b6_rotenc_id,
+ .driver = {
+ .name = TLV493DA1B6_ROTENC_NAME,
+ .of_match_table = of_match_ptr(tlv493da1b6_rotenc_dt_ids),
+ },
+};
+
+module_i2c_driver(tlv493da1b6_rotenc_driver);
+
+MODULE_ALIAS(TLV493DA1B6_ROTENC_NAME);
+MODULE_DESCRIPTION("Infineon TLV493D-A1B6 magnetic sensor as rotary 
encoder");
+MODULE_AUTHOR("Jakub Ladman <ladmanj@volny.cz>");
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION("0.0.3");
-- 

