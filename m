Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5687311E5B0
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 15:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfLMOgm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 09:36:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38207 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfLMOgm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 09:36:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so2133594lfm.5;
        Fri, 13 Dec 2019 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t08f/aqPCL7V2/U6W6Dbp6Q2nnxeKTYft/d24VI9/dg=;
        b=AEDb7NwRpGuwjmeJbDN/VDxEPIsy+dNr6sYQTGzH+t1C2neLKh/nCZdJNajHJZpIJE
         cQ+nLQrA7I3DMrUEDWDUTJYzQrtC3yoh4PWmaVL8orlDfSjOtvLmlPq/oWGIrIGhs0Fg
         J3Xl8FUnp5S/JiEwmm6QS/hYAGLB40ry8EJsqQS5yiqqBFU7ubwzx+jIXfyIV63AaTUO
         EqeKhZsiQPsf4yYabl+WKF2UyqEUkB82P6/WcuiuQBu0qE38u905JcPY5DABwbky/sR+
         ++oIrKaT/3cYY2gZoMyp2k3b9x+RNrLDo8lTAnNQc1GSo/Bvr8+aSgi4hGHvI50OSs+C
         k/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t08f/aqPCL7V2/U6W6Dbp6Q2nnxeKTYft/d24VI9/dg=;
        b=U1nWw53BCBmJdVLdx+ibg/epZGWF/FFRpPWg1CyyLB5EVnHszoBPRBsaTf2TP1Ao3l
         TacEfMSCzTw2OSWJCu3wHmyu3bhXR9dL5+tYQyOAmlvGfbEfHHN7KmgK4tWtZoazv+6S
         7fRz6QhIkjo3TDEZo5OBk3sdS2CuiYIS5IGOdpz4QTixMl/m6cYwFN06W7x3kt/IWiOY
         dhRg6/rDslLmOYhZS5cg6gjibbobQ90xVFpa13GHLhn3VWpz3RjRlUT42MZ5LnFqyePO
         4ECqAz/h1mwe0ARry1NfrssD9k8YOi54dDISN3tEuMkiF/VBppMI3jmqkGSlfRBdgr1B
         3QEA==
X-Gm-Message-State: APjAAAWGSNTL49Sc8jUENRi7VVe6SOEf+O8TFkkStzk3t4oHBuiCRw+n
        I+5i+sm7vu2yzKF4lZ8cpHY=
X-Google-Smtp-Source: APXvYqyFdapjNyDEREHFaiLnuH7HkAvpiyTDw6hYGqIegbzeGICDDa3IVY7/Sz1YaOr4X04COF3IvQ==
X-Received: by 2002:a05:6512:488:: with SMTP id v8mr9045607lfq.173.1576247799395;
        Fri, 13 Dec 2019 06:36:39 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id 145sm4898228ljj.69.2019.12.13.06.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 06:36:38 -0800 (PST)
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com>
Message-ID: <cdb6676e-ddca-804e-97ac-1e461df5cf60@gmail.com>
Date:   Fri, 13 Dec 2019 17:36:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191212233428.14648-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 02:34, Dmitry Osipenko пишет:
> System shutdown may happen with interrupts being disabled and in this case
> I2C core rejects transfers if atomic transfer isn't supported by driver.
> 
> There were several occurrences where I found my Nexus 7 completely
> discharged despite of being turned off and then one day I spotted this in
> the log:
> 
>  reboot: Power down
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
>  No atomic I2C transfer handler for 'i2c-1'
>  Modules linked in: tegra30_devfreq
>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
>  Exception stack(0xde907fa8 to 0xde907ff0)
>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>  ---[ end trace bdd18f87595b1a5e ]---
> 
> The atomic transferring is implemented by enforcing PIO mode for the
> transfer and by polling interrupt status until transfer is completed or
> failed.
> 
> Now system shuts down properly every time.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index a98bf31d0e5c..799c343571bc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/ktime.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -248,6 +249,7 @@ struct tegra_i2c_hw_feature {
>   * @dma_buf_size: DMA buffer size
>   * @is_curr_dma_xfer: indicates active DMA transfer
>   * @dma_complete: DMA completion notifier
> + * @is_curr_atomic_xfer: indicates active atomic transfer
>   */
>  struct tegra_i2c_dev {
>  	struct device *dev;
> @@ -279,6 +281,7 @@ struct tegra_i2c_dev {
>  	unsigned int dma_buf_size;
>  	bool is_curr_dma_xfer;
>  	struct completion dma_complete;
> +	bool is_curr_atomic_xfer;
>  };
>  
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> @@ -999,6 +1002,44 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
>  	i2c_writel(i2c_dev, val, reg);
>  }
>  
> +static unsigned long
> +tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
> +				  unsigned int timeout_ms)
> +{
> +	ktime_t ktime = ktime_get();
> +	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
> +
> +	do {
> +		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
> +
> +		if (status) {
> +			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
> +
> +			if (completion_done(&i2c_dev->msg_complete)) {
> +				s64 delta = ktime_ms_delta(ktimeout, ktime);
> +
> +				return msecs_to_jiffies(delta) ?: 1;
> +			}
> +		}
> +
> +		ktime = ktime_get();
> +
> +	} while (ktime_before(ktime, ktimeout));
> +
> +	return 0;
> +}
> +
> +static unsigned long
> +tegra_i2c_wait_msg_completion_timeout(struct tegra_i2c_dev *i2c_dev,
> +				      unsigned int timeout_ms)
> +{
> +	if (i2c_dev->is_curr_atomic_xfer)
> +		return tegra_i2c_poll_completion_timeout(i2c_dev, timeout_ms);
> +
> +	return wait_for_completion_timeout(&i2c_dev->msg_complete,
> +					   msecs_to_jiffies(timeout_ms));
> +}
> +
>  static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
> @@ -1020,8 +1061,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>  	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
>  	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>  
> -	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> -						msecs_to_jiffies(50));
> +	time_left = tegra_i2c_wait_msg_completion_timeout(i2c_dev, 50);

I realized that potentially there is a nasty problem here.. nothing
stops interrupt to occur after the timeout, thus I2C hardware could be
reset at the time of interrupt handling.

The solution will be to always keep interrupt disabled and only enable
it for the wait_for_completion_timeout(). I'll address it in the next
revision of this series.

[snip]
