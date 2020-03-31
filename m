Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EC4199F5F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 21:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgCaTpj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 15:45:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:47035 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgCaTpj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 15:45:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id k191so10820383pgc.13
        for <linux-i2c@vger.kernel.org>; Tue, 31 Mar 2020 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bayV+AbB5HX5Myb1k5cRFv/tdCWMylnZ8INvrTMXrfI=;
        b=aQpSuyXYeZZdIKU/ZRyQLR/yjBumhT4BPQzzO6caqQw3UB+dLbECiyGtQwk5YJhNTL
         gVDlLxPm2MnSKheIOpfJJmw48AMSwFqL5W39FV2CWRsY6Xx83k9GNOdEbReT+VNOecGj
         Mxx+HItnyCBIkBZFISaKN9Dk0e9/6GtX1M15w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bayV+AbB5HX5Myb1k5cRFv/tdCWMylnZ8INvrTMXrfI=;
        b=Gz/EZyWEE1At0xNvkjN5hNNJOioll1oS9WN96DQsSPo/FxV+8a557bebXoaRF8KcYP
         fgyRZWoM0CYi3VVkNuLx9zUv093TdZ7CQ/M4O+Hhr5AHhGHIP8njnYu8Qb/sbWdHti7/
         1YtCAAs9bn1hmHNpPHAvx+sSZDPMkRIHx0tGKuE05txoPg9cbE2BaX9DpGEHIqoErtfr
         tb37XyocwL++vVBw/BygNtkPQ3mttw7A9F5Vnejt4AdeGy6QKOBcZqGf9EtGr+Pdj86y
         nOztMPGaiOokQg8I44RuLMqFjyy2Z9VANmfVTf2FZnAF1j5a3XsmnCWK5NZd5favq9Gp
         eRCA==
X-Gm-Message-State: ANhLgQ0uETMpoYpueAVPXDMX/EjFCt7OywMoLSjKJZKkuZKxVoqlQ0BC
        ScF0wAzSYlY0SkEnpUZtSIDIRw==
X-Google-Smtp-Source: ADFU+vttCIKsEC/g/kbZExooJ94RSNvBXbyqZy3qhsPzPIjK9d3FJfijBLw7OLADd/fuE36KxHKduQ==
X-Received: by 2002:a62:52d7:: with SMTP id g206mr20533720pfb.286.1585683937813;
        Tue, 31 Mar 2020 12:45:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w4sm12144309pgg.2.2020.03.31.12.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 12:45:37 -0700 (PDT)
Date:   Tue, 31 Mar 2020 12:45:35 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200331194535.GL199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 31, 2020 at 04:39:35PM +0530, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - No Change.
> 
>  drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 3c4f83b..ad48f43 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>  
>  #include <linux/clk.h>
> +#include <linux/interconnect.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -139,7 +140,10 @@ struct qcom_qspi {
>  	struct device *dev;
>  	struct clk_bulk_data *clks;
>  	struct qspi_xfer xfer;
> -	/* Lock to protect xfer and IRQ accessed registers */
> +	struct icc_path *icc_path_cpu_to_qspi;
> +	unsigned int avg_bw_cpu;
> +	unsigned int peak_bw_cpu;
> +	/* Lock to protect data accessed by IRQs */
>  	spinlock_t lock;
>  };
>  
> @@ -241,6 +245,20 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Set BW quota for CPU as driver supports FIFO mode only.
> +	 * Assume peak bw as twice of avg bw.
> +	 */
> +	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
> +	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);
> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, ctrl->avg_bw_cpu,
> +		ctrl->peak_bw_cpu);
> +	if (ret) {
> +		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
> +
>  	spin_lock_irqsave(&ctrl->lock, flags);
>  
>  	/* We are half duplex, so either rx or tx will be set */
> @@ -458,6 +476,15 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto exit_probe_master_put;
>  
> +	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
> +	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
> +		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
> +		goto exit_probe_master_put;
> +	}
> +	/* Put BW vote on CPU path for register access */
> +	ctrl->avg_bw_cpu = Bps_to_icc(1000);
> +	ctrl->peak_bw_cpu = Bps_to_icc(1000);
> +
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
>  		goto exit_probe_master_put;
> @@ -511,9 +538,17 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
>  {
>  	struct spi_master *master = dev_get_drvdata(dev);
>  	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
> +	int ret;
>  
>  	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
>  
> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, 0, 0);
> +	if (ret) {
> +		dev_err_ratelimited(ctrl->dev, "%s: ICC BW remove failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -521,6 +556,15 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
>  {
>  	struct spi_master *master = dev_get_drvdata(dev);
>  	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
> +	int ret;
> +
> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, ctrl->avg_bw_cpu,
> +		ctrl->peak_bw_cpu);
> +	if (ret) {
> +		dev_err_ratelimited(ctrl->dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
>  
>  	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
>  }

Looks good to me besides Mark's concern about the bandwith calculation logic.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
