Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3187117CA9E
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Mar 2020 03:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgCGCFU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 21:05:20 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43348 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgCGCFU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 21:05:20 -0500
Received: by mail-pl1-f193.google.com with SMTP id f8so1589665plt.10
        for <linux-i2c@vger.kernel.org>; Fri, 06 Mar 2020 18:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DtK1YkJDc49nInAybBNBo4CDmLc1poF/FuYxGjrIqb0=;
        b=ZEu/9Wqno9o5PrFYrCDBvItJ57SUMBoDhOzfADRdIyH4p3LYDWibw60Hdh121kAS1p
         Zf+SKjyre1pBM0AtGVF8sgzeq1tFTqi37YeoF9kizaHuO+uJBe47eLXJ0AgEuASmFDXn
         Y5jUs9iOM8gP1Xgr9+bGrqIO8vWvk29zxhsw6vTM3qvo9bkg9bp6WMcFDT7nHAC8Itcn
         WQ8Svxv1oFwQhXyLoZY2KdisaBYaRNQj1fapuMOZe+Xc2TduACDui9RIMvM0I/yPzVZg
         tyPd8KN6HFyC/PDv+LCNAYTKAeO0Jvqqva/cytBef0DMvGXHVhVBRBrCBEamEmRwSnO9
         vopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DtK1YkJDc49nInAybBNBo4CDmLc1poF/FuYxGjrIqb0=;
        b=Ud8XmEonVQL494YoIg9i4kVurDQTJuJ+M0/4f6SooAP0qDcPqDLlfOuOfggVmj/sdf
         tSnTp6VNM9Zx2dcqlvBG2WOX2HT4K2qBpLtI+59w6EW/0VmoaeR7spcx4zGJK1VHDRrg
         tMEQ6QKcwuus/hLvWLNVZVTJ0o44KXQTS1hF7/HVlWxiSDMb8DLsfhjpYx+Qy/WO32VA
         zAJxC2fXxkLJllMj1fHurAIRVq0Dmy+oK6TwFFCR5I3UUlRJw4nCu1Femg+syqLiFjmP
         PXmBNf2+Q2ISx/uSC2Ltu/RGGy2vvVa2nDLiISeAA6mN9JOKsFdbQo+lgrsdBddvFvE+
         YCPQ==
X-Gm-Message-State: ANhLgQ1tNb7FnDJB9EmZuXMpKH1lF8+wWeDC7IWJKep3YRkTFwUem4QN
        rbjWQhQG6ANpcvN3oDPSZ+oytQ==
X-Google-Smtp-Source: ADFU+vuvLARZp6qOkph/ok2zqALRG/9jlxGEerDkPamSdlIQi8/U3YmZ6NeiYSilnSmhZCjKhLpOHg==
X-Received: by 2002:a17:902:7b87:: with SMTP id w7mr5952640pll.214.1583546716433;
        Fri, 06 Mar 2020 18:05:16 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b3sm10601244pjo.30.2020.03.06.18.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 18:05:15 -0800 (PST)
Date:   Fri, 6 Mar 2020 18:05:13 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org, robert.foss@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH v4 1/3] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20200307020513.GA1094083@builder>
References: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 06 Mar 09:19 PST 2020, Loic Poulain wrote:

> This commit adds I2C bus support for the Camera Control Interface
> (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> controller supports two masters and they are registered to the core.
> 
> CCI versions supported in the driver are MSM8916 and MSM8996.

+SDM845

> 
> This is a rework of the patch posted by Vinod:
> https://patchwork.kernel.org/patch/10569961/
> 
> With additional fixes + most of the comments addressed.
> 
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Tested-by: Robert Foss <robert.foss@linaro.org>
> ---
>   v2: Remove clock rates config from driver (done via assigned clock)
>      Added CCI timeout recovery from Ricardo's patch:
>         https://www.spinics.net/lists/linux-i2c/msg36973.html
>  v3: add sdm845 support
>      rework cci_init function
>  v4: fix checkpatch issue (double semi-colon)
> 
>  drivers/i2c/busses/Kconfig        |  10 +
>  drivers/i2c/busses/Makefile       |   1 +
>  drivers/i2c/busses/i2c-qcom-cci.c | 787 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 798 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6a0aa76..807a052 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -894,6 +894,16 @@ config I2C_QCOM_GENI
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-qcom-geni.
>  
> +config I2C_QCOM_CCI

Please move this above GENI, to keep sort order.

> +	tristate "Qualcomm Camera Control Interface"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  built-in camera control interface on the Qualcomm SoCs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-qcom-cci.
> +
>  config I2C_QUP
>  	tristate "Qualcomm QUP based I2C controller"
>  	depends on ARCH_QCOM
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3ab8aeb..9028b77 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_I2C_PUV3)		+= i2c-puv3.o
>  obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
>  obj-$(CONFIG_I2C_PXA_PCI)	+= i2c-pxa-pci.o
>  obj-$(CONFIG_I2C_QCOM_GENI)	+= i2c-qcom-geni.o
> +obj-$(CONFIG_I2C_QCOM_CCI)	+= i2c-qcom-cci.o

Sort order.

>  obj-$(CONFIG_I2C_QUP)		+= i2c-qup.o
>  obj-$(CONFIG_I2C_RIIC)		+= i2c-riic.o
>  obj-$(CONFIG_I2C_RK3X)		+= i2c-rk3x.o
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
[..]
> +/* Max number of resources + 1 for a NULL terminator */
> +#define CCI_RES_MAX	6
> +
> +

Extra newline?

> +#define CCI_I2C_SET_PARAM	1
> +#define CCI_I2C_REPORT		8
> +#define CCI_I2C_WRITE		9
> +#define CCI_I2C_READ		10
[..]
> +static int cci_i2c_read(struct cci *cci, u16 master,
> +			u16 addr, u8 *buf, u16 len)
> +{
> +	u32 val, words_read, words_exp;
> +	u8 queue = QUEUE_1;
> +	int i, index = 0, ret;
> +	bool first = true;
> +
> +	/*
> +	 * Call validate queue to make sure queue is empty before starting.
> +	 * This is to avoid overflow / underflow of queue.
> +	 */
> +	ret = cci_validate_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	val = CCI_I2C_READ | len << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	ret = cci_run_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> +	words_exp = len / 4 + 1;
> +	if (words_read != words_exp) {
> +		dev_err(cci->dev, "words read = %d, words expected = %d\n",
> +			words_read, words_exp);
> +		return -EIO;
> +	}
> +
> +	do {
> +		val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> +
> +		for (i = 0; i < 4 && index < len; i++) {
> +			if (first) {

So lower 8 bits of the first word read should always be discarded? Do we
know why? Can we have a comment describing this behavior?

> +				first = false;
> +				continue;
> +			}
> +			buf[index++] = (val >> (i * 8)) & 0xff;
> +		}
> +	} while (--words_read);
> +
> +	return 0;
> +}
[..]
> +static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> +{
> +	struct cci_master *cci_master = i2c_get_adapdata(adap);
> +	struct cci *cci = cci_master->cci;
> +	int i, ret;
> +
> +	ret = pm_runtime_get_sync(cci->dev);
> +	if (ret < 0)
> +		goto err;
> +
> +	for (i = 0; i < num; i++) {
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret = cci_i2c_read(cci, cci_master->master,
> +					   msgs[i].addr, msgs[i].buf,
> +					   msgs[i].len);
> +		else
> +			ret = cci_i2c_write(cci, cci_master->master,
> +					    msgs[i].addr, msgs[i].buf,
> +					    msgs[i].len);
> +
> +		if (ret < 0) {

Most cases this can happen has already printed a more specific error
message, so perhaps better to ensure that all paths has specific error
messages (if that's not already the case) and simply break here if ret <
0?

> +			dev_err(cci->dev, "cci i2c xfer error %d", ret);
> +			break;
> +		}
> +	}
> +
> +	if (!ret)
> +		ret = num;
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
> +
> +static const struct i2c_algorithm cci_algo = {
> +	.master_xfer	= cci_xfer,
> +	.functionality	= cci_func,
> +};
> +
> +static int cci_enable_clocks(struct cci *cci)
> +{
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
> +	if (ret < 0)
> +		dev_err(cci->dev, "Bulk clock prepare failed: %d\n", ret);

If clk_bulk_prepare_enable() return an error it already printed an
error, which includes the name of the clock that failed to enable. So
you can do:

	return clk_bulk_prepare_enable(...);

instead.

> +
> +	return ret;
> +}
> +
> +static void cci_disable_clocks(struct cci *cci)
> +{
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> +}
> +
> +#ifdef CONFIG_PM

Instead of the #ifdef, use __maybe_unused on these functions.

> +static int cci_suspend_runtime(struct device *dev)

I.e:

static int __maybe_unused cci_suspend_runtime(...)

> +{
> +	struct cci *cci = dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "Supend invoked\n");
> +	cci_disable_clocks(cci);
> +	return 0;
> +}
> +
> +static int cci_resume_runtime(struct device *dev)
> +{
> +	struct cci *cci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(dev, "Resume invoked\n");
> +	ret = cci_enable_clocks(cci);
> +	if (ret)
> +		return ret;
> +
> +	cci_init(cci);
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP

As above.

> +static int cci_suspend(struct device *dev)
> +{
> +	if (!pm_runtime_suspended(dev))
> +		return cci_suspend_runtime(dev);
> +
> +	return 0;
> +}
> +
> +static int cci_resume(struct device *dev)
> +{
> +	cci_resume_runtime(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_request_autosuspend(dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops qcom_cci_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(cci_suspend, cci_resume)
> +	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
> +};
> +
> +static int cci_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *of_node = NULL;

No need to initialize of_node.

> +	unsigned long cci_clk_rate = 0;
> +	struct resource *r;
> +	struct cci *cci;
> +	int ret = 0, i;

No need to zero-initialize ret.

> +	u32 val;
> +
> +	cci = devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
> +	if (!cci)
> +		return -ENOMEM;
> +
> +	cci->dev = dev;
> +	platform_set_drvdata(pdev, cci);
> +	cci->data = device_get_match_data(&pdev->dev);

s/&pdev->dev/dev/ for consistency.

> +	if (!cci->data) {
> +		dev_err(&pdev->dev, "Driver data is null, abort\n");
> +		return -EIO;
> +	}
> +
> +	for (i = 0; i < cci->data->num_masters; i++) {
> +		cci->master[i].adap.quirks = &cci->data->quirks;
> +		cci->master[i].adap.algo = &cci_algo;
> +		cci->master[i].adap.dev.parent = cci->dev;

s/cci->dev/dev/ for consistency.

> +		cci->master[i].master = i;
> +		cci->master[i].cci = cci;
> +
> +		i2c_set_adapdata(&cci->master[i].adap, &cci->master[i]);
> +		snprintf(cci->master[i].adap.name,
> +			 sizeof(cci->master[i].adap.name),
> +			 "Qualcomm Camera Control Interface: %d", i);
> +
> +		/* find the child node for i2c-bus as we are on cci node */
> +		of_node = of_get_next_available_child(dev->of_node, of_node);
> +		if (!of_node) {
> +			dev_err(dev, "Missing i2c-bus@%d child node\n", i);
> +			return -EINVAL;
> +		}
> +		cci->master[i].adap.dev.of_node = of_node;

Won't this break if the two masters are provided in reverse order in the
DT?

> +
> +		cci->master[i].mode = I2C_MODE_STANDARD;
> +		ret = of_property_read_u32(of_node, "clock-frequency", &val);
> +		if (!ret) {
> +			if (val == 400000)
> +				cci->master[i].mode = I2C_MODE_FAST;
> +			else if (val == 1000000)
> +				cci->master[i].mode = I2C_MODE_FAST_PLUS;
> +		}
> +
> +		init_completion(&cci->master[i].irq_complete);
> +	}
> +
> +	/* Memory */
> +
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	cci->base = devm_ioremap_resource(dev, r);
> +	if (IS_ERR(cci->base))
> +		return PTR_ERR(cci->base);
> +
> +	/* Interrupt */
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "missing IRQ: %d\n", ret);
> +		return ret;
> +	}
> +	cci->irq = ret;
> +
> +	ret = devm_request_irq(dev, cci->irq, cci_isr,
> +			       IRQF_TRIGGER_RISING, dev_name(dev), cci);

Wouldn't it be better to request the irq after the clocks are enabled?
Presumably it won't fire here, but if it does then the isr might access
unclocked registers?

At least you shouldn't have to temporarily disable the irqs until later
in the probe?


Also, please rely on irq flags from DT and leave the flags as 0.

> +	if (ret < 0) {
> +		dev_err(dev, "request_irq failed, ret: %d\n", ret);
> +		return ret;
> +	}
> +
> +	disable_irq(cci->irq);
> +
> +	/* Clocks */
> +
> +	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> +	if (ret < 1) {
> +		dev_err(dev, "failed to get clocks %d\n", ret);
> +		return ret;
> +	}
> +	cci->nclocks = ret;
> +
> +	/* Retrieve CCI clock rate */
> +	for (i = 0; i < cci->nclocks; i++) {
> +		if (!strncmp(cci->clocks[i].id, "cci", 4)) {

Isn't this just a strcmp()?

> +			cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
> +			break;
> +		}
> +	}
> +
> +	if (cci_clk_rate != cci->data->cci_clk_rate) {
> +		/* cci clock set by the bootloader or via assigned clock rate
> +		 * in DT.
> +		 */
> +		dev_warn(dev, "Found %lu cci clk rate while %lu was expected\n",
> +			 cci_clk_rate, cci->data->cci_clk_rate);
> +	}
> +
> +	ret = cci_enable_clocks(cci);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = readl_relaxed(cci->base + CCI_HW_VERSION);

Skip the "_relaxed" part.

> +	dev_info(dev, "%s: CCI HW version = 0x%08x", __func__, val);

I think the __func__ here is unnecessary, and perhaps make this a
dev_dbg() instead?

Regards,
Bjorn
> +
> +	enable_irq(cci->irq);
> +
> +	ret = cci_reset(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	ret = cci_init(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	for (i = 0; i < cci->data->num_masters; i++) {
> +		ret = i2c_add_adapter(&cci->master[i].adap);
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
> +	for (; i >= 0; i--)
> +		i2c_del_adapter(&cci->master[i].adap);
> +error:
> +	disable_irq(cci->irq);
> +	cci_disable_clocks(cci);
> +
> +	return ret;
> +}
> +
