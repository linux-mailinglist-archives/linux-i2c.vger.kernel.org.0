Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7AE219ED11
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Apr 2020 19:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgDERnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Apr 2020 13:43:03 -0400
Received: from sauhun.de ([88.99.104.3]:38154 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgDERnD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Apr 2020 13:43:03 -0400
Received: from localhost (p5486CC0D.dip0.t-ipconnect.de [84.134.204.13])
        by pokefinder.org (Postfix) with ESMTPSA id 7E3F12C0190;
        Sun,  5 Apr 2020 19:42:54 +0200 (CEST)
Date:   Sun, 5 Apr 2020 19:42:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH v6 1/3] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20200405174254.GB6313@kunai>
References: <1583830021-30141-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <1583830021-30141-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Loic,

here are my first comments. Probably not all of them yet, but there are
some high level questions I wanted to discuss before diving in too deep.
One more general thing, I think the driver has too much dev_err in it.
Please keep only the important ones, and turn supplementary ones into
dev_dbg. Interested users can then enable them.

Thank you for your patience and now for my comments:

On Tue, Mar 10, 2020 at 09:46:59AM +0100, Loic Poulain wrote:
> This commit adds I2C bus support for the Camera Control Interface
> (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> controller supports two masters and they are registered to the core.
>=20
> CCI versions supported in the driver are msm8916, msm8996 and sdm845.
>=20
> This is a rework of the patch posted by Vinod:
> https://patchwork.kernel.org/patch/10569961/
>=20
> With additional fixes + most of the comments addressed.
>=20
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Tested-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  v2: Remove clock rates config from driver (done via assigned clock)
>      Added CCI timeout recovery from Ricardo's patch:
>         https://www.spinics.net/lists/linux-i2c/msg36973.html
>  v3: add sdm845 support
>      rework cci_init function
>  v4: fix checkpatch issue (double semi-colo
>  v5: address Bjorn's comment
>         Kconfig/Makefile order
>         probe/interrupt rework
>  v6: Fix exit path (disable_clocks)
>=20
>  drivers/i2c/busses/Kconfig        |  10 +
>  drivers/i2c/busses/Makefile       |   1 +
>  drivers/i2c/busses/i2c-qcom-cci.c | 792 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 803 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6a0aa76..d962671 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -881,6 +881,16 @@ config I2C_PXA_SLAVE
>  	  is necessary for systems where the PXA may be a target on the
>  	  I2C bus.
> =20
> +config I2C_QCOM_CCI
> +	tristate "Qualcomm Camera Control Interface"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  built-in camera control interface on the Qualcomm SoCs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-qcom-cci.
> +
>  config I2C_QCOM_GENI
>  	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3ab8aeb..d8b0788 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_I2C_PNX)		+=3D i2c-pnx.o
>  obj-$(CONFIG_I2C_PUV3)		+=3D i2c-puv3.o
>  obj-$(CONFIG_I2C_PXA)		+=3D i2c-pxa.o
>  obj-$(CONFIG_I2C_PXA_PCI)	+=3D i2c-pxa-pci.o
> +obj-$(CONFIG_I2C_QCOM_CCI)	+=3D i2c-qcom-cci.o
>  obj-$(CONFIG_I2C_QCOM_GENI)	+=3D i2c-qcom-geni.o
>  obj-$(CONFIG_I2C_QUP)		+=3D i2c-qup.o
>  obj-$(CONFIG_I2C_RIIC)		+=3D i2c-riic.o
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> new file mode 100644
> index 0000000..9378486
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -0,0 +1,792 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2017-19 Linaro Limited.
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#define CCI_HW_VERSION				0x0
> +#define CCI_RESET_CMD				0x004
> +#define CCI_RESET_CMD_MASK			0x0f73f3f7
> +#define CCI_RESET_CMD_M0_MASK			0x000003f1
> +#define CCI_RESET_CMD_M1_MASK			0x0003f001
> +#define CCI_QUEUE_START				0x008
> +#define CCI_HALT_REQ				0x034
> +#define CCI_HALT_REQ_I2C_M0_Q0Q1		BIT(0)
> +#define CCI_HALT_REQ_I2C_M1_Q0Q1		BIT(1)
> +
> +#define CCI_I2C_Mm_SCL_CTL(m)			(0x100 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_0(m)			(0x104 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_1(m)			(0x108 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_2(m)			(0x10c + 0x100 * (m))
> +#define CCI_I2C_Mm_MISC_CTL(m)			(0x110 + 0x100 * (m))
> +
> +#define CCI_I2C_Mm_READ_DATA(m)			(0x118 + 0x100 * (m))
> +#define CCI_I2C_Mm_READ_BUF_LEVEL(m)		(0x11c + 0x100 * (m))
> +#define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)	(0x300 + 0x200 * (m) + 0x100 *=
 (n))
> +#define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)	(0x304 + 0x200 * (m) + 0x100 * =
(n))
> +#define CCI_I2C_Mm_Qn_CUR_CMD(m, n)		(0x308 + 0x200 * (m) + 0x100 * (n))
> +#define CCI_I2C_Mm_Qn_REPORT_STATUS(m, n)	(0x30c + 0x200 * (m) + 0x100 *=
 (n))
> +#define CCI_I2C_Mm_Qn_LOAD_DATA(m, n)		(0x310 + 0x200 * (m) + 0x100 * (n=
))
> +
> +#define CCI_IRQ_GLOBAL_CLEAR_CMD		0xc00
> +#define CCI_IRQ_MASK_0				0xc04
> +#define CCI_IRQ_MASK_0_I2C_M0_RD_DONE		BIT(0)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT		BIT(4)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT		BIT(8)
> +#define CCI_IRQ_MASK_0_I2C_M1_RD_DONE		BIT(12)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT		BIT(16)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT		BIT(20)
> +#define CCI_IRQ_MASK_0_RST_DONE_ACK		BIT(24)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
> +#define CCI_IRQ_MASK_0_I2C_M0_ERROR		0x18000ee6
> +#define CCI_IRQ_MASK_0_I2C_M1_ERROR		0x60ee6000
> +#define CCI_IRQ_CLEAR_0				0xc08
> +#define CCI_IRQ_STATUS_0			0xc0c
> +#define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT	BIT(8)
> +#define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT	BIT(20)
> +#define CCI_IRQ_STATUS_0_RST_DONE_ACK		BIT(24)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
> +#define CCI_IRQ_STATUS_0_I2C_M0_ERROR		0x18000ee6
> +#define CCI_IRQ_STATUS_0_I2C_M1_ERROR		0x60ee6000
> +
> +#define CCI_TIMEOUT	(msecs_to_jiffies(100))
> +#define NUM_MASTERS	2
> +#define NUM_QUEUES	2
> +
> +/* Max number of resources + 1 for a NULL terminator */
> +#define CCI_RES_MAX	6
> +
> +#define CCI_I2C_SET_PARAM	1
> +#define CCI_I2C_REPORT		8
> +#define CCI_I2C_WRITE		9
> +#define CCI_I2C_READ		10
> +
> +#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
> +
> +enum {
> +	I2C_MODE_STANDARD,
> +	I2C_MODE_FAST,
> +	I2C_MODE_FAST_PLUS,
> +};
> +
> +enum cci_i2c_queue_t {
> +	QUEUE_0,
> +	QUEUE_1
> +};
> +
> +struct hw_params {
> +	u16 thigh; /* HIGH period of the SCL clock in clock ticks */
> +	u16 tlow; /* LOW period of the SCL clock */
> +	u16 tsu_sto; /* set-up time for STOP condition */
> +	u16 tsu_sta; /* set-up time for a repeated START condition */
> +	u16 thd_dat; /* data hold time */
> +	u16 thd_sta; /* hold time (repeated) START condition */
> +	u16 tbuf; /* bus free time between a STOP and START condition */
> +	u8 scl_stretch_en;
> +	u16 trdhld;
> +	u16 tsp; /* pulse width of spikes suppressed by the input filter */
> +};
> +
> +struct cci;
> +
> +struct cci_master {
> +	struct i2c_adapter adap;
> +	u16 master;
> +	u8 mode;
> +	int status;
> +	struct completion irq_complete;
> +	struct cci *cci;
> +};
> +
> +struct cci_data {
> +	unsigned int num_masters;
> +	struct i2c_adapter_quirks quirks;
> +	u16 queue_size[NUM_QUEUES];
> +	unsigned long cci_clk_rate;
> +	struct hw_params params[3];
> +};
> +
> +struct cci {
> +	struct device *dev;
> +	void __iomem *base;
> +	unsigned int irq;
> +	const struct cci_data *data;
> +	struct clk_bulk_data *clocks;
> +	int nclocks;
> +	struct cci_master master[NUM_MASTERS];
> +};
> +
> +static irqreturn_t cci_isr(int irq, void *dev)
> +{
> +	struct cci *cci =3D dev;
> +	u32 val, reset =3D 0;
> +	int ret =3D IRQ_NONE;
> +
> +	val =3D readl(cci->base + CCI_IRQ_STATUS_0);
> +	writel(val, cci->base + CCI_IRQ_CLEAR_0);
> +	writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
> +
> +	if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
> +		complete(&cci->master[0].irq_complete);
> +		if (cci->master[1].master)
> +			complete(&cci->master[1].irq_complete);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_DONE ||
> +			val & CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT ||
> +			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT) {
> +		cci->master[0].status =3D 0;
> +		complete(&cci->master[0].irq_complete);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_DONE ||
> +			val & CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT ||
> +			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT) {
> +		cci->master[1].status =3D 0;
> +		complete(&cci->master[1].irq_complete);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
> +		reset =3D CCI_RESET_CMD_M0_MASK;
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
> +		reset =3D CCI_RESET_CMD_M1_MASK;
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (unlikely(reset))
> +		writel(reset, cci->base + CCI_RESET_CMD);
> +
> +	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
> +		dev_err_ratelimited(cci->dev, "Master 0 error 0x%08x\n", val);

Hmm, using dev_* in an irq handler...

> +		cci->master[0].status =3D -EIO;

=2E.. isn't it possible to decipher the error bits further and set
'status' according to Documentation/i2c/fault-codes.rst?

> +		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
> +		dev_err_ratelimited(cci->dev, "Master 1 error 0x%08x\n", val);
> +		cci->master[1].status =3D -EIO;
> +		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	return ret;
> +}
> +
> +static int cci_halt(struct cci *cci, u8 master_num)
> +{
> +	struct cci_master *master;
> +	u32 val;
> +
> +	if (master_num > 1) {

Is this hardcoded '1' correct? The loop calling this function iterates
up to 'cci->data->num_masters'.

> +		dev_err(cci->dev, "Unsupported master idx (%u)\n", master_num);
> +		return -EINVAL;
> +	}
> +
> +	val =3D BIT(master_num);
> +	master =3D &cci->master[master_num];
> +
> +	reinit_completion(&master->irq_complete);
> +	writel(val, cci->base + CCI_HALT_REQ);
> +
> +	if (!wait_for_completion_timeout(&master->irq_complete, CCI_TIMEOUT)) {
> +		dev_err(cci->dev, "CCI halt timeout\n");

Timeouts can happen on the bus. Please don't print if this is a bus
timeout error.

> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cci_reset(struct cci *cci)
> +{
> +	/*
> +	 * we reset the whole controller, here and for implicity use
> +	 * master[0].xxx for waiting on it.
> +	 */
> +	reinit_completion(&cci->master[0].irq_complete);
> +	writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> +
> +	if (!wait_for_completion_timeout(&cci->master[0].irq_complete,
> +					 CCI_TIMEOUT)) {
> +		dev_err(cci->dev, "CCI reset timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cci_init(struct cci *cci)
> +{
> +	u32 val =3D CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
> +			CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
> +			CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT |
> +			CCI_IRQ_MASK_0_I2C_M1_RD_DONE |
> +			CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT |
> +			CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT |
> +			CCI_IRQ_MASK_0_RST_DONE_ACK |
> +			CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK |
> +			CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK |
> +			CCI_IRQ_MASK_0_I2C_M0_ERROR |
> +			CCI_IRQ_MASK_0_I2C_M1_ERROR;
> +	int i;
> +
> +	writel(val, cci->base + CCI_IRQ_MASK_0);
> +
> +	for (i =3D 0; i < cci->data->num_masters; i++) {
> +		int mode =3D cci->master[i].mode;
> +		const struct hw_params *hw;
> +
> +		if (!cci->master[i].cci)
> +			continue;
> +
> +		hw =3D &cci->data->params[mode];
> +
> +		val =3D hw->thigh << 16 | hw->tlow;
> +		writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));
> +
> +		val =3D hw->tsu_sto << 16 | hw->tsu_sta;
> +		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_0(i));
> +
> +		val =3D hw->thd_dat << 16 | hw->thd_sta;
> +		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_1(i));
> +
> +		val =3D hw->tbuf;
> +		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
> +
> +		val =3D hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
> +		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
> +	}
> +
> +	return 0;
> +}
> +
> +static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +	u32 val;
> +	int ret;
> +
> +	val =3D readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
> +
> +	reinit_completion(&cci->master[master].irq_complete);
> +	val =3D BIT(master * 2 + queue);
> +	writel(val, cci->base + CCI_QUEUE_START);
> +
> +	if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
> +					 CCI_TIMEOUT)) {
> +		dev_err(cci->dev, "master %d queue %d timeout\n",
> +			master, queue);
> +		cci_reset(cci);
> +		cci_init(cci);
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret =3D cci->master[master].status;
> +	if (ret < 0)
> +		dev_err(cci->dev, "master %d queue %d error %d\n",
> +			master, queue, ret);
> +
> +	return ret;
> +}
> +
> +static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +	u32 val;
> +
> +	val =3D readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +	if (val =3D=3D cci->data->queue_size[queue])
> +		return -EINVAL;
> +
> +	if (!val)
> +		return 0;
> +
> +	val =3D CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	return cci_run_queue(cci, master, queue);
> +}
> +
> +static int cci_i2c_read(struct cci *cci, u16 master,
> +			u16 addr, u8 *buf, u16 len)
> +{
> +	u32 val, words_read, words_exp;
> +	u8 queue =3D QUEUE_1;
> +	int i, index =3D 0, ret;
> +	bool first =3D true;
> +
> +	/*
> +	 * Call validate queue to make sure queue is empty before starting.
> +	 * This is to avoid overflow / underflow of queue.
> +	 */
> +	ret =3D cci_validate_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	val =3D CCI_I2C_READ | len << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	ret =3D cci_run_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	words_read =3D readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> +	words_exp =3D len / 4 + 1;
> +	if (words_read !=3D words_exp) {
> +		dev_err(cci->dev, "words read =3D %d, words expected =3D %d\n",
> +			words_read, words_exp);
> +		return -EIO;
> +	}
> +
> +	do {
> +		val =3D readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> +
> +		for (i =3D 0; i < 4 && index < len; i++) {
> +			if (first) {
> +				/* The LS byte of this register represents the
> +				 * first byte read from the slave during a read
> +				 * access.
> +				 */
> +				first =3D false;
> +				continue;
> +			}
> +			buf[index++] =3D (val >> (i * 8)) & 0xff;
> +		}
> +	} while (--words_read);
> +
> +	return 0;
> +}
> +
> +static int cci_i2c_write(struct cci *cci, u16 master,
> +			 u16 addr, u8 *buf, u16 len)
> +{
> +	u8 queue =3D QUEUE_0;
> +	u8 load[12] =3D { 0 };
> +	int i =3D 0, j, ret;
> +	u32 val;
> +
> +	/*
> +	 * Call validate queue to make sure queue is empty before starting.
> +	 * This is to avoid overflow / underflow of queue.
> +	 */
> +	ret =3D cci_validate_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	load[i++] =3D CCI_I2C_WRITE | len << 4;
> +
> +	for (j =3D 0; j < len; j++)
> +		load[i++] =3D buf[j];
> +
> +	for (j =3D 0; j < i; j +=3D 4) {
> +		val =3D load[j];
> +		val |=3D load[j + 1] << 8;
> +		val |=3D load[j + 2] << 16;
> +		val |=3D load[j + 3] << 24;
> +		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +	}
> +
> +	val =3D CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	return cci_run_queue(cci, master, queue);
> +}
> +
> +static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int=
 num)
> +{
> +	struct cci_master *cci_master =3D i2c_get_adapdata(adap);
> +	struct cci *cci =3D cci_master->cci;
> +	int i, ret;
> +
> +	ret =3D pm_runtime_get_sync(cci->dev);
> +	if (ret < 0)
> +		goto err;
> +
> +	for (i =3D 0; i < num; i++) {
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret =3D cci_i2c_read(cci, cci_master->master,
> +					   msgs[i].addr, msgs[i].buf,
> +					   msgs[i].len);
> +		else
> +			ret =3D cci_i2c_write(cci, cci_master->master,
> +					    msgs[i].addr, msgs[i].buf,
> +					    msgs[i].len);
> +
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	if (!ret)
> +		ret =3D num;
> +
> +err:
> +	pm_runtime_mark_last_busy(cci->dev);
> +	pm_runtime_put_autosuspend(cci->dev);
> +
> +	return ret;
> +}
> +
> +static u32 cci_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C;
> +}

Even with the quirks, I think this HW is able to support
I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
I2C_FUNC_SMBUS_WORD_DATA via the I2C core SMBus emulation code.

> +
> +static const struct i2c_algorithm cci_algo =3D {
> +	.master_xfer	=3D cci_xfer,
> +	.functionality	=3D cci_func,
> +};
> +
> +static int cci_enable_clocks(struct cci *cci)
> +{
> +	return clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
> +}
> +
> +static void cci_disable_clocks(struct cci *cci)
> +{
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> +}
> +
> +static int __maybe_unused cci_suspend_runtime(struct device *dev)
> +{
> +	struct cci *cci =3D dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "Supend invoked\n");

This and the next dev_dbg should go, the PM cores should have printouts
for that.

> +	cci_disable_clocks(cci);
> +	return 0;
> +}
> +
> +static int __maybe_unused cci_resume_runtime(struct device *dev)
> +{
> +	struct cci *cci =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(dev, "Resume invoked\n");
> +	ret =3D cci_enable_clocks(cci);
> +	if (ret)
> +		return ret;
> +
> +	cci_init(cci);
> +	return 0;
> +}
> +
> +static int __maybe_unused cci_suspend(struct device *dev)
> +{
> +	if (!pm_runtime_suspended(dev))
> +		return cci_suspend_runtime(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cci_resume(struct device *dev)
> +{
> +	cci_resume_runtime(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_request_autosuspend(dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops qcom_cci_pm =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(cci_suspend, cci_resume)
> +	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
> +};
> +
> +static int cci_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	unsigned long cci_clk_rate =3D 0;
> +	struct device_node *child;
> +	struct resource *r;
> +	struct cci *cci;
> +	int ret, i;
> +	u32 val;
> +
> +	cci =3D devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
> +	if (!cci)
> +		return -ENOMEM;
> +
> +	cci->dev =3D dev;
> +	platform_set_drvdata(pdev, cci);
> +	cci->data =3D device_get_match_data(dev);
> +	if (!cci->data) {
> +		dev_err(dev, "Driver data is null, abort\n");
> +		return -EIO;

Minor nit: I think this happens only during development, so I'd think
returning something like -ENOENT is distinguishable enough to drop the
error message.

> +	}
> +
> +	for_each_available_child_of_node(dev->of_node, child) {
> +		u32 idx;
> +
> +		ret =3D of_property_read_u32(child, "reg", &idx);
> +		if (ret) {
> +			dev_err(dev, "%pOF invalid 'reg' property", child);
> +			continue;
> +		}
> +
> +		if (idx >=3D cci->data->num_masters) {
> +			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
> +				child, idx, cci->data->num_masters - 1);
> +			continue;
> +		}
> +
> +		cci->master[idx].adap.quirks =3D &cci->data->quirks;
> +		cci->master[idx].adap.algo =3D &cci_algo;
> +		cci->master[idx].adap.dev.parent =3D dev;
> +		cci->master[idx].adap.dev.of_node =3D child;
> +		cci->master[idx].master =3D idx;
> +		cci->master[idx].cci =3D cci;
> +
> +		i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> +		snprintf(cci->master[idx].adap.name,
> +			 sizeof(cci->master[idx].adap.name),
> +			 "Qualcomm Camera Control Interface: %d", idx);

With I2C_NAME_SIZE being 20, I don't think this will work. Did you
verify?

> +
> +		cci->master[idx].mode =3D I2C_MODE_STANDARD;
> +		ret =3D of_property_read_u32(child, "clock-frequency", &val);
> +		if (!ret) {
> +			if (val =3D=3D 400000)
> +				cci->master[idx].mode =3D I2C_MODE_FAST;
> +			else if (val =3D=3D 1000000)
> +				cci->master[idx].mode =3D I2C_MODE_FAST_PLUS;
> +		}
> +
> +		init_completion(&cci->master[idx].irq_complete);
> +	}
> +
> +	/* Memory */
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	cci->base =3D devm_ioremap_resource(dev, r);
> +	if (IS_ERR(cci->base))
> +		return PTR_ERR(cci->base);
> +
> +	/* Clocks */
> +
> +	ret =3D devm_clk_bulk_get_all(dev, &cci->clocks);
> +	if (ret < 1) {
> +		dev_err(dev, "failed to get clocks %d\n", ret);
> +		return ret;
> +	}
> +	cci->nclocks =3D ret;
> +
> +	/* Retrieve CCI clock rate */
> +	for (i =3D 0; i < cci->nclocks; i++) {
> +		if (!strcmp(cci->clocks[i].id, "cci")) {
> +			cci_clk_rate =3D clk_get_rate(cci->clocks[i].clk);
> +			break;
> +		}
> +	}
> +
> +	if (cci_clk_rate !=3D cci->data->cci_clk_rate) {
> +		/* cci clock set by the bootloader or via assigned clock rate
> +		 * in DT.
> +		 */
> +		dev_warn(dev, "Found %lu cci clk rate while %lu was expected\n",
> +			 cci_clk_rate, cci->data->cci_clk_rate);
> +	}
> +
> +	ret =3D cci_enable_clocks(cci);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Interrupt */
> +
> +	ret =3D platform_get_irq(pdev, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "missing IRQ: %d\n", ret);
> +		goto disable_clocks;
> +	}
> +	cci->irq =3D ret;
> +
> +	ret =3D devm_request_irq(dev, cci->irq, cci_isr, 0, dev_name(dev), cci);
> +	if (ret < 0) {
> +		dev_err(dev, "request_irq failed, ret: %d\n", ret);
> +		goto disable_clocks;
> +	}
> +
> +	val =3D readl(cci->base + CCI_HW_VERSION);
> +	dev_dbg(dev, "CCI HW version =3D 0x%08x", val);
> +
> +	ret =3D cci_reset(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	ret =3D cci_init(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	for (i =3D 0; i < cci->data->num_masters; i++) {
> +		if (!cci->master[i].cci)
> +			continue;
> +
> +		ret =3D i2c_add_adapter(&cci->master[i].adap);
> +		if (ret < 0)
> +			goto error_i2c;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +error_i2c:
> +	for (; i >=3D 0; i--) {
> +		if (cci->master[i].cci)
> +			i2c_del_adapter(&cci->master[i].adap);
> +	}
> +error:
> +	disable_irq(cci->irq);
> +disable_clocks:
> +	cci_disable_clocks(cci);
> +
> +	return ret;
> +}
> +
> +static int cci_remove(struct platform_device *pdev)
> +{
> +	struct cci *cci =3D platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i =3D 0; i < cci->data->num_masters; i++) {
> +		if (cci->master[i].cci)
> +			i2c_del_adapter(&cci->master[i].adap);
> +		cci_halt(cci, i);
> +	}
> +
> +	disable_irq(cci->irq);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct cci_data cci_v1_data =3D {
> +	.num_masters =3D 1,
> +	.queue_size =3D { 64, 16 },
> +	.quirks =3D {
> +		.max_write_len =3D 10,
> +		.max_read_len =3D 12,
> +	},
> +	.cci_clk_rate =3D  19200000,
> +	.params[I2C_MODE_STANDARD] =3D {
> +		.thigh =3D 78,
> +		.tlow =3D 114,
> +		.tsu_sto =3D 28,
> +		.tsu_sta =3D 28,
> +		.thd_dat =3D 10,
> +		.thd_sta =3D 77,
> +		.tbuf =3D 118,
> +		.scl_stretch_en =3D 0,
> +		.trdhld =3D 6,
> +		.tsp =3D 1
> +	},
> +	.params[I2C_MODE_FAST] =3D {
> +		.thigh =3D 20,
> +		.tlow =3D 28,
> +		.tsu_sto =3D 21,
> +		.tsu_sta =3D 21,
> +		.thd_dat =3D 13,
> +		.thd_sta =3D 18,
> +		.tbuf =3D 32,
> +		.scl_stretch_en =3D 0,
> +		.trdhld =3D 6,
> +		.tsp =3D 3
> +	},
> +};
> +
> +static const struct cci_data cci_v2_data =3D {
> +	.num_masters =3D 2,
> +	.queue_size =3D { 64, 16 },
> +	.quirks =3D {
> +		.max_write_len =3D 11,
> +		.max_read_len =3D 12,
> +	},
> +	.cci_clk_rate =3D  37500000,
> +	.params[I2C_MODE_STANDARD] =3D {
> +		.thigh =3D 201,
> +		.tlow =3D 174,
> +		.tsu_sto =3D 204,
> +		.tsu_sta =3D 231,
> +		.thd_dat =3D 22,
> +		.thd_sta =3D 162,
> +		.tbuf =3D 227,
> +		.scl_stretch_en =3D 0,
> +		.trdhld =3D 6,
> +		.tsp =3D 3
> +	},
> +	.params[I2C_MODE_FAST] =3D {
> +		.thigh =3D 38,
> +		.tlow =3D 56,
> +		.tsu_sto =3D 40,
> +		.tsu_sta =3D 40,
> +		.thd_dat =3D 22,
> +		.thd_sta =3D 35,
> +		.tbuf =3D 62,
> +		.scl_stretch_en =3D 0,
> +		.trdhld =3D 6,
> +		.tsp =3D 3
> +	},
> +	.params[I2C_MODE_FAST_PLUS] =3D {
> +		.thigh =3D 16,
> +		.tlow =3D 22,
> +		.tsu_sto =3D 17,
> +		.tsu_sta =3D 18,
> +		.thd_dat =3D 16,
> +		.thd_sta =3D 15,
> +		.tbuf =3D 24,
> +		.scl_stretch_en =3D 0,
> +		.trdhld =3D 3,
> +		.tsp =3D 3
> +	},
> +};

These params, can't they be calculated to allow for other frequencies
than 100kHz, 400kHz,...?

> +
> +static const struct of_device_id cci_dt_match[] =3D {
> +	{ .compatible =3D "qcom,msm8916-cci", .data =3D &cci_v1_data},
> +	{ .compatible =3D "qcom,msm8996-cci", .data =3D &cci_v2_data},
> +	{ .compatible =3D "qcom,sdm845-cci", .data =3D &cci_v2_data},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cci_dt_match);
> +
> +static struct platform_driver qcom_cci_driver =3D {
> +	.probe  =3D cci_probe,
> +	.remove =3D cci_remove,
> +	.driver =3D {
> +		.name =3D "i2c-qcom-cci",
> +		.of_match_table =3D cci_dt_match,
> +		.pm =3D &qcom_cci_pm,
> +	},
> +};
> +
> +module_platform_driver(qcom_cci_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Camera Control Interface driver");
> +MODULE_AUTHOR("Todor Tomov <todor.tomov@linaro.org>");
> +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.7.4
>=20

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6KGJkACgkQFA3kzBSg
KbZ32hAAoebZipg6i7bEhSPwf4sF1LMpi9c/OipT5qGfie8VdaM4/wMV8/RBNXD1
ZIlI+FA2mNuVLkPLz5yz9gye+oaH7d7ynAI9BFYWYoEXZVOqtNsMcqK+Nvru/GTR
sr7qe91OYEiXjs1EYaNq4IRrllhZxx7NjwZo4GMwm+DmmSC1Ai1/6vXlOASB0inD
kZTaw2g4FhBK4oighTd8eHAiaUPeWU8u/j4A69jOZVtu8P1Q8ldSsKjCS3MLUcyv
8abJ+/4I7MqZVcnoSPwhEK+RVTgp0khkhvb/VS/ohWuw+0FRpgihMvNyzRcizsJ5
eWgFnIEl9Uf8hl4rGayZmX9iDoZRNtFlz3zBUqCyNDxJ7OcrkbKO4QR7fHv98z14
j8N1Z3RuXZkLouWen1lbAImZjZg73oZNnMdEzq4+v6Nx5Yd+qQPAnv6mchtSgwLl
rbWMfhuBndAcZdJznxUKQdVSr8abc6l+MClASYyAqbmhLgAbY9riABqr7tbUaHFj
/XJKuBoSyfueEBFcTioUPCT/29L9GM4q2nsTkvmyltnD8KdrMJoCmKw36ZOEAczn
qGwxiRr35IL9jxv47pnmjMBweSSDCK1Yv7J5cX/GSk8/8/84zmxVN2ZQEA7vC5jD
05zRo+OT8TwNsRFvs08NOX19tOflDVohsjNSJkorC6RYfNHQG1U=
=GDem
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
