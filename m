Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F5465B66
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2019 18:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfGKQVW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jul 2019 12:21:22 -0400
Received: from ns.iliad.fr ([212.27.33.1]:60986 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbfGKQVV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jul 2019 12:21:21 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id D81E020315;
        Thu, 11 Jul 2019 18:21:18 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id A5A6B202E0;
        Thu, 11 Jul 2019 18:21:16 +0200 (CEST)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [RFC v2] DT-based tuner/demod init
To:     linux-media <linux-media@vger.kernel.org>,
        I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
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
        Peter Rosin <peda@axentia.se>, DT <devicetree@vger.kernel.org>
Message-ID: <6d38f9b1-a8cd-803d-b330-f92f7bcf08ca@free.fr>
Date:   Thu, 11 Jul 2019 18:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul 11 18:21:18 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello everyone,

This is a follow-up RFC to my first request for comments:
"[RFC] SW connection between DVB Transport Stream demuxer and I2C-based frontend"
https://www.spinics.net/lists/arm-kernel/msg739972.html

Background: my SoC provides a "Transport Stream Interface" on-chip
(for which I wrote a small driver, tsif.c) as well as a tuner/demod combo
(si2141/si2168) on the board.

My original goal was: being able to link the tuner/demod from the device tree,
instead of hard-coding them in the TSIF driver.

(Please see the resulting code at the end of this message)

Aside from the tsif driver itself (I would appreciate if someone could answer
some questions and TODOs in that part as well), there were two hurdles that
had to be solved for this to work:

PROBLEM #1

The dvb_adapter and the tuner need to "see" the dvb_frontend struct filled
by the demod driver. In order to do this (in a generic, OO-like way), Brad
suggested that I could make 'struct dvb_frontend' the first field of a
demod's clientdata. That way, dvb_get_demod_fe() callers don't need to
know which demod they are tied to.

I'd like to hear comments on dvb_get_demod_fe() because
A. It is an essential part of the patch series, and
B. I have no better way to do this.


PROBLEM #2

Peter Rosin suggested a great way to get the demod instantiate the tuner
via DT (by using an i2c-gate node. I think we can all agree that this
solution is good to go?


So basically, I need an amen on solution for Problem #1, and ideally a few
comments on the driver itself. Then I can spin an actual patch series.

Regards.



diff --git a/arch/arm64/boot/dts/qcom/apq8098-batfish.dts b/arch/arm64/boot/dts/qcom/apq8098-batfish.dts
index 29d59ecad138..06cd2663e089 100644
--- a/arch/arm64/boot/dts/qcom/apq8098-batfish.dts
+++ b/arch/arm64/boot/dts/qcom/apq8098-batfish.dts
@@ -30,6 +30,48 @@
 	status = "ok";
 };
 
+&blsp1_i2c5 {
+	status = "ok";
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_default>;
+
+	demod: demod@64 {
+		compatible = "silabs,si2168";
+		reg = <0x64>;
+		reset-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
+		i2c-gate {
+			tuner@60 {
+				compatible = "silabs,si2141";
+				reg = <0x60>;
+				demod = <&demod>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	i2c5_default: i2c5-default {
+		pins = "gpio87", "gpio88";
+		function = "blsp_i2c5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tsif0_default: tsif0-default {
+		pins = "gpio89", "gpio90", "gpio91";
+		function = "tsif0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&tsif {
+	demod = <&demod>;
+	pinctrl-0 = <&tsif0_default>;
+	pinctrl-names = "default";
+};
+
 &qusb2phy {
 	status = "ok";
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f8671a46392d..62518dcbe2a3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1206,6 +1206,16 @@
 			status = "disabled";
 		};
 
+		tsif: tsif@c1e7000 {
+			compatible = "qcom,msm8998-tsif";
+			reg = <0x0c1e7000 0x104>;
+			reg-names = "tsif0";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tsif0";
+			clocks = <&gcc GCC_TSIF_AHB_CLK>;
+			clock-names = "iface";
+		};
+
 		timer@17920000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 6351a97f3d18..5a55c6bd0bd2 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -3030,3 +3030,17 @@ void dvb_frontend_detach(struct dvb_frontend *fe)
 	dvb_frontend_put(fe);
 }
 EXPORT_SYMBOL(dvb_frontend_detach);
+
+/*
+ * DT-enabled demodulator drivers are required to have 'struct dvb_frontend'
+ * as the first field of their state struct (stored as clientdata) in order
+ * to allow this function to return 'struct dvb_frontend' generically.
+ */
+struct dvb_frontend *dvb_get_demod_fe(struct device_node *np)
+{
+	struct device_node *demod_node = of_parse_phandle(np, "demod", 0);
+	struct i2c_client *demod = of_find_i2c_device_by_node(demod_node);
+	of_node_put(demod_node);
+	return demod ? i2c_get_clientdata(demod) : NULL;
+}
+EXPORT_SYMBOL(dvb_get_demod_fe);
diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 48e8a376766e..09e1382ed128 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 
 #include "si2168_priv.h"
 
@@ -663,6 +664,8 @@ static const struct dvb_frontend_ops si2168_ops = {
 static int si2168_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
+	struct device *cdev = &client->dev;
+	struct si2168_config defconfig = { .ts_mode = SI2168_TS_SERIAL };
 	struct si2168_config *config = client->dev.platform_data;
 	struct si2168_dev *dev;
 	int ret;
@@ -670,6 +673,13 @@ static int si2168_probe(struct i2c_client *client,
 
 	dev_dbg(&client->dev, "\n");
 
+	if (cdev->of_node) {
+		struct gpio_desc *desc;
+		desc = devm_gpiod_get_optional(cdev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(desc)) return PTR_ERR(desc);
+		config = &defconfig;
+	}
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
@@ -723,9 +733,21 @@ static int si2168_probe(struct i2c_client *client,
 	dev->version = (cmd.args[1]) << 24 | (cmd.args[3] - '0') << 16 |
 		       (cmd.args[4] - '0') << 8 | (cmd.args[5]) << 0;
 
+	/* create dvb_frontend */
+	memcpy(&dev->fe.ops, &si2168_ops, sizeof(si2168_ops));
+	dev->fe.demodulator_priv = client;
+	if (config->i2c_adapter)
+		*config->i2c_adapter = dev->muxc->adapter[0];
+	if (config->fe)
+		*config->fe = &dev->fe;
+	dev->ts_mode = config->ts_mode;
+	dev->ts_clock_inv = config->ts_clock_inv;
+	dev->ts_clock_gapped = config->ts_clock_gapped;
+	dev->spectral_inversion = config->spectral_inversion;
+
 	/* create mux i2c adapter for tuner */
 	dev->muxc = i2c_mux_alloc(client->adapter, &client->dev,
-				  1, 0, I2C_MUX_LOCKED,
+				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
 				  si2168_select, si2168_deselect);
 	if (!dev->muxc) {
 		ret = -ENOMEM;
@@ -736,16 +758,6 @@ static int si2168_probe(struct i2c_client *client,
 	if (ret)
 		goto err_kfree;
 
-	/* create dvb_frontend */
-	memcpy(&dev->fe.ops, &si2168_ops, sizeof(struct dvb_frontend_ops));
-	dev->fe.demodulator_priv = client;
-	*config->i2c_adapter = dev->muxc->adapter[0];
-	*config->fe = &dev->fe;
-	dev->ts_mode = config->ts_mode;
-	dev->ts_clock_inv = config->ts_clock_inv;
-	dev->ts_clock_gapped = config->ts_clock_gapped;
-	dev->spectral_inversion = config->spectral_inversion;
-
 	dev_info(&client->dev, "Silicon Labs Si2168-%c%d%d successfully identified\n",
 		 dev->version >> 24 & 0xff, dev->version >> 16 & 0xff,
 		 dev->version >> 8 & 0xff);
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 804d5b30c697..1e3cac3b8381 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -22,9 +22,9 @@
 
 /* state struct */
 struct si2168_dev {
+	struct dvb_frontend fe; /* see dvb_get_demod_fe() */
 	struct mutex i2c_mutex;
 	struct i2c_mux_core *muxc;
-	struct dvb_frontend fe;
 	enum fe_delivery_system delivery_system;
 	enum fe_status fe_status;
 	#define SI2168_CHIP_ID_A20 ('A' << 24 | 68 << 16 | '2' << 8 | '0' << 0)
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd925124c..6a522e647a9d 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -101,3 +101,5 @@ obj-y					+= meson/
 obj-y					+= cros-ec-cec/
 
 obj-$(CONFIG_VIDEO_SUN6I_CSI)		+= sunxi/sun6i-csi/
+
+obj-y += tsif.o
diff --git a/drivers/media/platform/tsif.c b/drivers/media/platform/tsif.c
new file mode 100644
index 000000000000..b136f334e9c6
--- /dev/null
+++ b/drivers/media/platform/tsif.c
@@ -0,0 +1,185 @@
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <media/dvb_frontend.h>
+#include <media/dvb_demux.h>
+#include <media/dmxdev.h>
+
+/* TSIF register offsets */
+#define TSIF_STS_CTL	0x0	/* status and control */
+#define TSIF_DATA_PORT	0x100
+
+/* TSIF_STS_CTL bits */
+#define ENABLE_IRQ	BIT(28)
+#define TSIF_STOP	BIT(3)
+#define TSIF_START	BIT(0)
+
+struct tsif {
+	void __iomem *base;
+	struct clk *clk;
+	int ref_count; /*** TODO: use atomic_t ??? or refcount_t ??? or kref ??? ***/
+	u32 buf[48];
+	struct dvb_frontend *fe;
+	/*** DO I NEED ALL 4 ***/
+	//struct dmx_frontend dmx_frontend;
+	struct dvb_adapter dvb_adapter;
+	struct dvb_demux dvb_demux;
+	struct dmxdev dmxdev;
+};
+
+static int start_tsif(struct dvb_demux_feed *feed)
+{
+	struct tsif *tsif = feed->demux->priv;
+	printk("%s: feed PID=%u\n", __func__, feed->pid);
+
+	if (tsif->ref_count++ == 0) {
+		u32 val = TSIF_START | ENABLE_IRQ | BIT(29);
+		writel_relaxed(val, tsif->base + TSIF_STS_CTL);
+	}
+
+	return 0;
+}
+
+static int stop_tsif(struct dvb_demux_feed *feed)
+{
+	struct tsif *tsif = feed->demux->priv;
+	printk("%s: feed PID=%u\n", __func__, feed->pid);
+
+	if (--tsif->ref_count == 0) {
+		writel_relaxed(TSIF_STOP, tsif->base + TSIF_STS_CTL);
+	}
+
+	return 0;
+}
+
+static irqreturn_t tsif_isr(int irq, void *arg)
+{
+	int i;
+	u32 status;
+	struct tsif *tsif = arg;
+
+	status = readl_relaxed(tsif->base + TSIF_STS_CTL);
+	writel_relaxed(status, tsif->base + TSIF_STS_CTL);
+
+	for (i = 0; i < 48; ++i)
+		tsif->buf[i] = readl_relaxed(tsif->base + TSIF_DATA_PORT);
+
+	dvb_dmx_swfilter_packets(&tsif->dvb_demux, (void *)tsif->buf, 1);
+
+	return IRQ_HANDLED;
+}
+
+static int tsif_probe(struct platform_device *pdev)
+{
+	int err, virq;
+	struct tsif *tsif;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+
+	tsif = devm_kzalloc(dev, sizeof(*tsif), GFP_KERNEL);
+	if (!tsif)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsif0");
+	tsif->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(tsif->base))
+		return PTR_ERR(tsif->base);
+
+	virq = platform_get_irq_byname(pdev, "tsif0");
+	err = devm_request_irq(dev, virq, tsif_isr, IRQF_SHARED, "tsif", tsif);
+	if (err)
+		return err;
+
+	tsif->clk = devm_clk_get(dev, "iface");
+	if (IS_ERR(tsif->clk))
+		return PTR_ERR(tsif->clk);
+
+	tsif->fe = dvb_get_demod_fe(dev->of_node);
+	if (!tsif->fe)
+		return -ENXIO;
+
+	/*** TODO: use devm version ***/
+	clk_prepare_enable(tsif->clk);
+
+	{
+	int ret;
+	short any = DVB_UNSET;
+
+	ret = dvb_register_adapter(&tsif->dvb_adapter, "tsif", THIS_MODULE, dev, &any);
+	if (ret < 0) panic("dvb_register_adapter");
+
+	tsif->dvb_demux.priv = tsif;
+	/* Not sure the diff between filter and feed? */
+	tsif->dvb_demux.filternum = 16; /*** Dunno what to put here ***/
+	tsif->dvb_demux.feednum = 16;	/*** Dunno what to put here ***/
+	tsif->dvb_demux.start_feed = start_tsif;
+	tsif->dvb_demux.stop_feed = stop_tsif;
+
+	ret = dvb_dmx_init(&tsif->dvb_demux);
+	if (ret < 0) panic("dvb_dmx_init");
+
+	/* What relation to dvb_demux.filternum??? */
+	/* Do I need this object?? */
+	tsif->dmxdev.filternum = 16;
+	tsif->dmxdev.demux = &tsif->dvb_demux.dmx;
+
+	ret = dvb_dmxdev_init(&tsif->dmxdev, &tsif->dvb_adapter);
+	if (ret < 0) panic("dvb_dmxdev_init");
+
+#if 0
+	/*** These calls don't seem required??? ***/
+	/*** Who reads this? Do I need to set it? ***/
+	tsif->dmx_frontend.source = DMX_FRONTEND_0;
+
+	/* Required or done elsewhere? */
+	ret = tsif->dvb_demux.dmx.add_frontend(&tsif->dvb_demux.dmx, &tsif->dmx_frontend);
+	if (ret < 0) panic("add_frontend");
+
+	/* Required or done elsewhere? */
+	ret = tsif->dvb_demux.dmx.connect_frontend(&tsif->dvb_demux.dmx, &tsif->dmx_frontend);
+	if (ret < 0) panic("connect_frontend");
+#endif
+
+	ret = dvb_register_frontend(&tsif->dvb_adapter, tsif->fe);
+	if (ret < 0) panic("dvb_register_frontend");
+	}
+
+	platform_set_drvdata(pdev, tsif);
+	return 0;
+}
+
+/*** TODO: Double check .remove callback ***/
+static int tsif_remove(struct platform_device *pdev)
+{
+	struct tsif *tsif = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(tsif->clk);
+
+	dvb_unregister_frontend(tsif->fe);
+	//tsif->dvb_demux.dmx.remove_frontend(&tsif->dvb_demux.dmx, &tsif->dmx_frontend);
+	dvb_dmxdev_release(&tsif->dmxdev);
+	dvb_dmx_release(&tsif->dvb_demux);
+	dvb_unregister_adapter(&tsif->dvb_adapter);
+
+	return 0;
+}
+
+static const struct of_device_id tsif_of_ids[] = {
+	{ .compatible = "qcom,msm8998-tsif" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tsif_of_ids);
+
+static struct platform_driver qcom_tsif_driver = {
+	.probe  = tsif_probe,
+	.remove = tsif_remove,
+	.driver = {
+		.name = "qcom-tsif",
+		.of_match_table = tsif_of_ids,
+	},
+};
+
+module_platform_driver(qcom_tsif_driver);
+
+MODULE_DESCRIPTION("Qualcomm TSIF driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 7be893def190..9d2ca775ada9 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -420,12 +420,18 @@ static void si2157_stat_work(struct work_struct *work)
 static int si2157_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
+	struct device *cdev = &client->dev;
+	struct si2157_config defconfig = { 0 };
 	struct si2157_config *cfg = client->dev.platform_data;
-	struct dvb_frontend *fe = cfg->fe;
 	struct si2157_dev *dev;
 	struct si2157_cmd cmd;
 	int ret;
 
+	if (cdev->of_node) {
+		cfg = &defconfig;
+		cfg->fe = dvb_get_demod_fe(cdev->of_node);
+	}
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
@@ -449,8 +455,8 @@ static int si2157_probe(struct i2c_client *client,
 	if (ret)
 		goto err_kfree;
 
-	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
-	fe->tuner_priv = client;
+	memcpy(&dev->fe->ops.tuner_ops, &si2157_ops, sizeof(si2157_ops));
+	dev->fe->tuner_priv = client;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	if (cfg->mdev) {
diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..f8ea4839095f 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -821,4 +821,6 @@ void dvb_frontend_reinitialise(struct dvb_frontend *fe);
  */
 void dvb_frontend_sleep_until(ktime_t *waketime, u32 add_usec);
 
+struct dvb_frontend *dvb_get_demod_fe(struct device_node *np);
+
 #endif

