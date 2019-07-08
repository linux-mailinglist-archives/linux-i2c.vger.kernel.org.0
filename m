Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4B061DA5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 13:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfGHLIp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 07:08:45 -0400
Received: from ns.iliad.fr ([212.27.33.1]:41250 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730246AbfGHLIo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Jul 2019 07:08:44 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 052B12090E;
        Mon,  8 Jul 2019 13:08:40 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D1DC22090C;
        Mon,  8 Jul 2019 13:08:39 +0200 (CEST)
To:     I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
Message-ID: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
Date:   Mon, 8 Jul 2019 13:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul  8 13:08:40 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello everyone,

My first message(*) might have been too vague. Let me try explaining
the goal in a different way, using code this time. (Provided at the
end of this message.)

(*) https://www.spinics.net/lists/arm-kernel/msg739657.html

Background: I'm working with a SoC that provides a TSIF HW block,
and I'm trying to write a driver for it.

The purpose of this "Transport Stream Interface" is to merge incoming
bits together into a 188-byte TS packet, add a timestamp, then raise
an interrupt to notify the system that a new packet is ready.
(Driver for this HW block is tsif.c)

Pretty basic stuff so far...

While the TSIF block is embedded in the SoC, the block that feeds the
TSIF (a demodulator) is not, therefore the demod is provided on the
board. (On the board I have, demod=si2168, tuner=2141). Different boards
may have different demods/tuners.

So, I have a DT node for the TSIF in the SoC DTSI, and a DT node for
the si2168 in the board DTSI; and the TSIF node has a phandle to the
demod node. The system communicates with si2168 over an I2C bus.
The si2168 is connected to the TSIF using 3 GPIO pins.


PROBLEM #1

The media framework requires that the TSIF and demod be "tied" together,
by calling dvb_register_frontend(). If I do that in tsif.c, then I need to
get the frontend pointer from the demod at some point. There is no such
callback presently. Since si2168 lives on an I2C bus, I can get a
struct i2c_client pointer, through the DT phandle. But some kind of
abstraction is missing to query the i2c_client object to make sure it
is a demodulator and request its frontend pointer.

For the time being, I have added a very generic pointer to struct i2c_client
but I feel this is not quite right... (though it gets the job done)


PROBLEM #2

The tuner (si2157) is not on the i2c5 bus, instead it is on a private
i2c bus *behind* si2168, which routes requests to the proper client.
For the time being, I don't know how to model this relationship in DT.
(TODO: check i2c_slave_cb_t slave_cb in struct i2c_client)
I have initialized si2157 in the si2168 driver, but this doesn't feel
right. (Though it seems all(?) users pair 2168 with 2157.)


It would really help if I could get some guidance from media and i2c
people for these two issues. (I'd like to upstream the driver in time
for 5.3)

Regards.



diff --git a/arch/arm64/boot/dts/qcom/apq8098-batfish.dts b/arch/arm64/boot/dts/qcom/apq8098-batfish.dts
index 29d59ecad138..9353e62375a7 100644
--- a/arch/arm64/boot/dts/qcom/apq8098-batfish.dts
+++ b/arch/arm64/boot/dts/qcom/apq8098-batfish.dts
@@ -30,6 +30,28 @@
 	status = "ok";
 };
 
+&blsp1_i2c5 {
+	status = "ok";
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_default>;
+
+	dvb_demod: si2168@64 {
+		compatible = "silabs,si2168";
+		reg = <0x64>;
+		reset-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&tsif {
+	demod = <&dvb_demod>;
+};
+
+&i2c5_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qusb2phy {
 	status = "ok";
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
index 6db70acd38ee..22ef4dfddb15 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
@@ -2,6 +2,18 @@
 /* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
 
 &tlmm {
+	i2c5_default: i2c5-default {
+		pins = "gpio87", "gpio88";
+		function = "blsp_i2c5";
+	};
+
+	tsif0_default: tsif0-default {
+		pins = "gpio89", "gpio90", "gpio91";
+		function = "tsif0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_clk_on: sdc2_clk_on {
 		config {
 			pins = "sdc2_clk";
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f8671a46392d..72b5d3e094c0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1206,6 +1206,21 @@
 			status = "disabled";
 		};
 
+		tsif: tsif@c1e7000 {
+			compatible = "qcom,msm8998-tsif";
+			reg = <0x0c1e7000 0x200>;
+			reg-names = "MSM_TSIF0_PHYS";
+
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "TSIF0_IRQ";
+
+			clocks = <&gcc GCC_TSIF_AHB_CLK>;
+			clock-names = "iface_clk";
+
+			pinctrl-0 = <&tsif0_default>;
+			pinctrl-names = "default";
+		};
+
 		timer@17920000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 48e8a376766e..726bb6759315 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 
+#include "si2157.h"
 #include "si2168_priv.h"
 
 static const struct dvb_frontend_ops si2168_ops;
@@ -660,9 +662,20 @@ static const struct dvb_frontend_ops si2168_ops = {
 	.read_status = si2168_read_status,
 };
 
+struct si2168_config si2168_config;
+struct si2157_config si2157_config;
+struct i2c_client *tuner;
+
+static void *get_fe(struct i2c_client *client)
+{
+	struct si2168_dev *dev = i2c_get_clientdata(client);
+	return &dev->fe;
+}
+
 static int si2168_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
+	struct device *cdev = &client->dev;
 	struct si2168_config *config = client->dev.platform_data;
 	struct si2168_dev *dev;
 	int ret;
@@ -670,12 +683,24 @@ static int si2168_probe(struct i2c_client *client,
 
 	dev_dbg(&client->dev, "\n");
 
+	if (!config) {
+		config = &si2168_config;
+		config->ts_mode = SI2168_TS_SERIAL;
+	}
+
+	if (cdev->of_node) {
+		struct gpio_desc *desc;
+		desc = devm_gpiod_get_optional(cdev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(desc)) return PTR_ERR(desc);
+	}
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
+	client->get_something = get_fe;
 	i2c_set_clientdata(client, dev);
 	mutex_init(&dev->i2c_mutex);
 
@@ -739,8 +764,10 @@ static int si2168_probe(struct i2c_client *client,
 	/* create dvb_frontend */
 	memcpy(&dev->fe.ops, &si2168_ops, sizeof(struct dvb_frontend_ops));
 	dev->fe.demodulator_priv = client;
-	*config->i2c_adapter = dev->muxc->adapter[0];
-	*config->fe = &dev->fe;
+	if (config->i2c_adapter)
+		*config->i2c_adapter = dev->muxc->adapter[0];
+	if (config->fe)
+		*config->fe = &dev->fe;
 	dev->ts_mode = config->ts_mode;
 	dev->ts_clock_inv = config->ts_clock_inv;
 	dev->ts_clock_gapped = config->ts_clock_gapped;
@@ -753,6 +780,12 @@ static int si2168_probe(struct i2c_client *client,
 		 dev->version >> 24 & 0xff, dev->version >> 16 & 0xff,
 		 dev->version >> 8 & 0xff, dev->version >> 0 & 0xff);
 
+	if (cdev->of_node) {
+		struct i2c_adapter *si2168_bus = dev->muxc->adapter[0];
+		si2157_config.fe = &dev->fe;
+		tuner = dvb_module_probe("si2157", "si2141", si2168_bus, 0x60, &si2157_config);
+	}
+
 	return 0;
 err_kfree:
 	kfree(dev);
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd925124c..b24fc530e875 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -101,3 +101,8 @@ obj-y					+= meson/
 obj-y					+= cros-ec-cec/
 
 obj-$(CONFIG_VIDEO_SUN6I_CSI)		+= sunxi/sun6i-csi/
+
+obj-y += tsif.o
+ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)/drivers/media/tuners
+ccflags-y += -I$(srctree)/drivers/media/common
diff --git a/drivers/media/platform/tsif.c b/drivers/media/platform/tsif.c
new file mode 100644
index 000000000000..a0118c2ee870
--- /dev/null
+++ b/drivers/media/platform/tsif.c
@@ -0,0 +1,294 @@
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kthread.h>
+#include <linux/vmalloc.h>
+
+#include <media/dvb_demux.h>
+#include <media/dmxdev.h>
+
+#include "si2168.h"
+#include "si2157.h"
+
+#include <linux/module.h>        /* Just for modules */
+#include <linux/kernel.h>        /* Only for KERN_INFO */
+#include <linux/err.h>           /* Error macros */
+#include <linux/cdev.h>
+#include <linux/init.h>          /* Needed for the macros */
+#include <linux/io.h>            /* IO macros */
+#include <linux/device.h>        /* Device drivers need this */
+#include <linux/sched.h>         /* Externally defined globals */
+#include <linux/fs.h>
+#include <linux/uaccess.h>       /* copy_to_user */
+#include <linux/slab.h>          /* kfree, kzalloc */
+#include <linux/ioport.h>        /* XXX_ mem_region */
+#include <linux/dma-mapping.h>   /* dma_XXX */
+#include <linux/delay.h>         /* msleep */
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/poll.h>          /* poll() file op */
+#include <linux/wait.h>          /* wait() macros, sleeping */
+#include <linux/bitops.h>        /* BIT() macro */
+#include <linux/regulator/consumer.h>
+#include <linux/timer.h>         /* Timer services */
+#include <linux/jiffies.h>       /* Jiffies counter */
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/string.h>
+#include <linux/interrupt.h>	/* tasklet */
+
+/* Max number of section filters */
+#define TSPP_MAX_SECTION_FILTER_NUM	128
+
+/*
+ * General defines
+ */
+#define TSPP_TSIF_INSTANCES            1
+
+/*
+ * TSIF register offsets
+ */
+#define TSIF_STS_CTL	0x0
+#define TSIF_DATA_PORT	0x100
+
+/* bits for TSIF_STS_CTL register */
+#define TSIF_STS_CTL_EN_IRQ       BIT(28)
+#define TSIF_STS_CTL_PACK_AVAIL   BIT(27)
+#define TSIF_STS_CTL_1ST_PACKET   BIT(26)
+#define TSIF_STS_CTL_OVERFLOW     BIT(25)
+#define TSIF_STS_CTL_LOST_SYNC    BIT(24)
+#define TSIF_STS_CTL_TIMEOUT      BIT(23)
+#define TSIF_STS_CTL_INV_SYNC     BIT(21)
+#define TSIF_STS_CTL_INV_NULL     BIT(20)
+#define TSIF_STS_CTL_INV_ERROR    BIT(19)
+#define TSIF_STS_CTL_INV_ENABLE   BIT(18)
+#define TSIF_STS_CTL_INV_DATA     BIT(17)
+#define TSIF_STS_CTL_INV_CLOCK    BIT(16)
+#define TSIF_STS_CTL_SPARE        BIT(15)
+#define TSIF_STS_CTL_EN_NULL      BIT(11)
+#define TSIF_STS_CTL_EN_ERROR     BIT(10)
+#define TSIF_STS_CTL_LAST_BIT     BIT(9)
+#define TSIF_STS_CTL_EN_TIME_LIM  BIT(8)
+#define TSIF_STS_CTL_EN_TCR       BIT(7)
+#define TSIF_STS_CTL_TEST_MODE    BIT(6)
+#define TSIF_STS_CTL_MODE_2       BIT(5)
+#define TSIF_STS_CTL_EN_DM        BIT(4)
+#define TSIF_STS_CTL_STOP         BIT(3)
+#define TSIF_STS_CTL_START        BIT(0)
+
+/* this represents the actual hardware device */
+struct tspp_device {
+	struct platform_device *pdev;
+	struct clk *tsif_pclk;
+};
+
+static struct batfish_dvb_adapter {
+	struct device *dev;
+} batfish_dvb_adapter;
+
+struct tsif_device {
+	void __iomem *base;
+	u32 ref_count;
+};
+
+/*** GLOBALS ***/
+/*** TODO: move them all to a properly kalloc'ed struct ***/
+static struct dvb_frontend *my_dvb_frontend;
+static struct dmx_frontend my_dmx_frontend;
+static struct dvb_adapter my_dvb_adapter;
+static struct dvb_demux my_dvb_demux;
+static struct dmxdev my_dmxdev;
+static struct tsif_device my_tsif_device;
+
+static int start_tsif(struct dvb_demux_feed *feed)
+{
+	printk("%s: feed PID=%u\n", __func__, feed->pid);
+
+	if (my_tsif_device.ref_count++ == 0) {
+		u32 val = TSIF_STS_CTL_EN_IRQ + TSIF_STS_CTL_START;
+		writel_relaxed(val, my_tsif_device.base + TSIF_STS_CTL);
+	}
+
+	return 0;
+}
+
+static int stop_tsif(struct dvb_demux_feed *feed)
+{
+	printk("%s: feed PID=%u\n", __func__, feed->pid);
+
+	if (my_tsif_device.ref_count == 0) panic(__func__);
+
+	if (--my_tsif_device.ref_count == 0)
+		writel_relaxed(TSIF_STS_CTL_STOP, my_tsif_device.base + TSIF_STS_CTL);
+
+	return 0;
+}
+
+static void batfish_init(struct batfish_dvb_adapter *adapter)
+{
+	int ret;
+	short int ids[] = { -1 };
+
+	ret = dvb_register_adapter(&my_dvb_adapter, "MSM TSPP", THIS_MODULE, adapter->dev, ids);
+	if (ret < 0) panic("dvb_register_adapter");
+
+	my_dvb_demux.dmx.capabilities = DMX_TS_FILTERING | DMX_SECTION_FILTERING;
+
+	my_dvb_demux.priv = (void *)0xdeadbeef;
+	my_dvb_demux.filternum = TSPP_MAX_SECTION_FILTER_NUM;
+	my_dvb_demux.feednum = 128;
+	my_dvb_demux.start_feed = start_tsif;
+	my_dvb_demux.stop_feed = stop_tsif;
+
+	ret = dvb_dmx_init(&my_dvb_demux);
+	if (ret < 0) panic("dvb_dmx_init");
+
+	my_dmxdev.filternum = 128;
+	my_dmxdev.demux = &my_dvb_demux.dmx;
+	my_dmxdev.capabilities = 0;
+
+	ret = dvb_dmxdev_init(&my_dmxdev, &my_dvb_adapter);
+	if (ret < 0) panic("dvb_dmxdev_init");
+
+	my_dmx_frontend.source = DMX_FRONTEND_0;
+
+	ret = my_dvb_demux.dmx.add_frontend(&my_dvb_demux.dmx, &my_dmx_frontend);
+	if (ret < 0) panic("add_frontend");
+
+	ret = my_dvb_demux.dmx.connect_frontend(&my_dvb_demux.dmx, &my_dmx_frontend);
+	if (ret < 0) panic("connect_frontend");
+
+	ret = dvb_register_frontend(&my_dvb_adapter, my_dvb_frontend);
+	if (ret < 0) panic("dvb_register_frontend");
+}
+
+static void batfish_deinit(struct batfish_dvb_adapter *adapter)
+{
+	dvb_unregister_frontend(my_dvb_frontend);
+	my_dvb_demux.dmx.remove_frontend(&my_dvb_demux.dmx, &my_dmx_frontend);
+	dvb_dmxdev_release(&my_dmxdev);
+	dvb_dmx_release(&my_dvb_demux);
+	dvb_unregister_adapter(&my_dvb_adapter);
+}
+
+static void tspp_plugin_init(struct device *dev)
+{
+	batfish_dvb_adapter.dev = dev;
+	batfish_init(&batfish_dvb_adapter);
+}
+
+static void tspp_plugin_exit(void)
+{
+	batfish_deinit(&batfish_dvb_adapter);
+}
+
+void dvb_dmx_swfilter_packets(struct dvb_demux *demux, const u8 *buf, size_t count);
+
+static irqreturn_t tsif_isr(int irq, void *dev)
+{
+	int i;
+	void __iomem *tsif = my_tsif_device.base;
+	unsigned int status = readl_relaxed(tsif + TSIF_STS_CTL);
+	u32 buf[48];
+
+	status = readl_relaxed(tsif + 0);
+	writel_relaxed(status, tsif + 0);
+
+	for (i = 0; i < 48; ++i)
+		buf[i] = readl_relaxed(tsif + TSIF_DATA_PORT);
+
+	dvb_dmx_swfilter_packets(&my_dvb_demux, (void *)buf, 1);
+
+	return IRQ_HANDLED;
+}
+
+static int msm_tspp_probe(struct platform_device *pdev)
+{
+	int rc = -ENODEV;
+	struct tspp_device *device;
+	struct resource *mem_tsif0;
+	int tsif_irq;
+
+	/*** TODO: Use devm versions everywhere ***/
+
+	/* OK, we will use this device */
+	device = kzalloc(sizeof(struct tspp_device), GFP_KERNEL);
+	if (!device) panic("kzalloc");
+
+	/* set up references */
+	device->pdev = pdev;
+	platform_set_drvdata(pdev, device);
+
+	/* map clocks */
+	device->tsif_pclk = clk_get(&pdev->dev, "iface_clk");
+	if (IS_ERR(device->tsif_pclk)) panic("clk_get iface_clk");
+
+	/* map I/O memory */
+	mem_tsif0 = platform_get_resource_byname(pdev, IORESOURCE_MEM, "MSM_TSIF0_PHYS");
+	if (!mem_tsif0) panic("get mem_tsif0");
+	my_tsif_device.base = ioremap(mem_tsif0->start, resource_size(mem_tsif0));
+	if (!my_tsif_device.base) panic("ioremap mem_tsif0");
+
+	tsif_irq = platform_get_irq_byname(pdev, "TSIF0_IRQ");
+	if (tsif_irq <= 0) panic("platform_get_irq_byname");
+	rc = devm_request_irq(&pdev->dev, tsif_irq, tsif_isr, IRQF_SHARED, "toto", device);
+	if (rc) panic("devm_request_irq");
+
+	{
+		struct device_node *tsif_node, *demod_node;
+		struct i2c_client *demod;
+
+		tsif_node = pdev->dev.of_node;
+		demod_node = of_parse_phandle(tsif_node, "demod", 0);
+
+		demod = of_find_i2c_device_by_node(demod_node);
+		if (!demod) panic("of_find_i2c_device_by_node");
+
+		/*** TODO: Improve callback naming & handling ***/
+		if (!demod->get_something)
+			panic("Wrong i2c_client");
+		my_dvb_frontend = demod->get_something(demod);
+		of_node_put(demod_node);
+	}
+
+	clk_prepare_enable(device->tsif_pclk);
+
+	tspp_plugin_init(&pdev->dev);
+
+	return 0;
+}
+
+static int msm_tspp_remove(struct platform_device *pdev)
+{
+	struct tspp_device *device = platform_get_drvdata(pdev);
+
+	tspp_plugin_exit();
+
+	iounmap(my_tsif_device.base);
+
+	if (device->tsif_pclk)
+		clk_put(device->tsif_pclk);
+
+	kfree(device);
+
+	return 0;
+}
+
+static const struct of_device_id msm_match_table[] = {
+	{ .compatible = "qcom,msm8998-tsif" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver msm_tspp_driver = {
+	.probe          = msm_tspp_probe,
+	.remove         = msm_tspp_remove,
+	.driver         = {
+		.name   = "msm_tspp",
+		.of_match_table = msm_match_table,
+	},
+};
+
+module_platform_driver(msm_tspp_driver);
+
+MODULE_DESCRIPTION("MSM TSPP DVB Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e982b8913b73..5fca596e0dd0 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -295,6 +295,8 @@ struct i2c_driver {
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
+typedef void *generic_func(struct i2c_client *this);
+
 /**
  * struct i2c_client - represent an I2C slave device
  * @flags: I2C_CLIENT_TEN indicates the device uses a ten bit chip address;
@@ -328,6 +330,7 @@ struct i2c_client {
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
+	generic_func *get_something;
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
