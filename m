Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063DC185339
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Mar 2020 01:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCNARc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 20:17:32 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40926 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbgCNARc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 20:17:32 -0400
Received: by mail-pj1-f65.google.com with SMTP id bo3so3807289pjb.5
        for <linux-i2c@vger.kernel.org>; Fri, 13 Mar 2020 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=syZHaQRjtDBx5EuX/9qwnmYFq4VBMCD/W9VXsBIFEfQ=;
        b=GbWquVM1fgvzZW6KXKCJn76JhhhAPn7We/k13bBYCOP9VA+5DeEXacA2BsU2pnxzP8
         osO+0A+Euk4JYSC6OOKogdwlNAxqOjQeeFDiMNMq8PL0zwlrNsPPIwPht0Tk7LaDCCRw
         6l9iBeZ6ZO5Z/hVAw0znm2cUklSsYutQNY8/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=syZHaQRjtDBx5EuX/9qwnmYFq4VBMCD/W9VXsBIFEfQ=;
        b=WJ57xIiBBVRfCgRM9N/9gvVU0kcct6Hsmf5Nn4pmoy4xy2/5Iifp6tLW7nBnNhWztS
         wE6ftYMSfMASQBLPeFyQACjF8bPAIjsns7VlDPFJbTKu/NG+3VvAVqQod021Q7fmmTG5
         HFqnwb/JzkU3dUaRswQoU41pKpNTOyagxV9gCoyABMdJryAypleRyodb5IswnwvGrmaW
         3SPHKmeMlOyV8uge+tNyQOf8TExLzaLJ/lxNXrnAUsYwF/e33/s5rNezARO4xxWMjALI
         NsHI2vJVhLhoj6hA9cuHIPT1GGES324I2hPIqaYbwmPtgz0LTxZyYuVfI2CY+b4nZvAA
         UYBA==
X-Gm-Message-State: ANhLgQ2BUWDCgGlrZflLNl+swWcf/nejZBkwr4twgn+H8Av60lLvcCcM
        4+TEopWS3duZco2nLR0VveYPXQ==
X-Google-Smtp-Source: ADFU+vvkaXJ+Qg40tKhEadMIEpNkLAKs3mqM3ed3Qrw7VOQlB3tPXdACyoqw9mBEbHu8QaMT4C2wTw==
X-Received: by 2002:a17:902:bd43:: with SMTP id b3mr1577741plx.209.1584145050969;
        Fri, 13 Mar 2020 17:17:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y18sm57499273pfe.19.2020.03.13.17.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 17:17:30 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:17:28 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 5/8] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200314001728.GL144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-6-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Mar 13, 2020 at 06:42:11PM +0530, Akash Asthana wrote:
> Get the interconnect paths for I2C based Serial Engine device
> and vote according to the bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_i2c_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 110 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 17abf60c..33ab685 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -163,6 +163,23 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>  	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
>  }
>  
> +static int geni_i2c_icc_get(struct geni_se *se)
> +{
> +	se->icc_path_geni_to_core = devm_of_icc_get(se->dev, "qup-core");
> +	if (IS_ERR(se->icc_path_geni_to_core))
> +		return PTR_ERR(se->icc_path_geni_to_core);
> +
> +	se->icc_path_cpu_to_geni = devm_of_icc_get(se->dev, "qup-config");
> +	if (IS_ERR(se->icc_path_cpu_to_geni))
> +		return PTR_ERR(se->icc_path_cpu_to_geni);
> +
> +	se->icc_path_geni_to_ddr = devm_of_icc_get(se->dev, "qup-memory");
> +	if (IS_ERR(se->icc_path_geni_to_ddr))
> +		return PTR_ERR(se->icc_path_geni_to_ddr);
> +
> +	return 0;
> +}
> +
>  static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
>  {
>  	u32 m_cmd = readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
> @@ -563,6 +580,39 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = pdev->dev.of_node;
>  	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> +	ret = geni_i2c_icc_get(&gi2c->se);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Set the bus quota for core and cpu to a reasonable value for
> +	 * register access.
> +	 * Set quota for DDR based on bus speed, assume peak requirement
> +	 * as twice of avg bw.
> +	 */
> +	gi2c->se.avg_bw_core = Bps_to_icc(1000);

as commented on the UART patch, you might want to consider adding a constant
for this recurring default value.

> +	gi2c->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
> +	gi2c->se.avg_bw_cpu = Bps_to_icc(1000);
> +	gi2c->se.peak_bw_cpu = Bps_to_icc(1000);
> +	gi2c->se.avg_bw_ddr = Bps_to_icc(gi2c->clk_freq_out);
> +	gi2c->se.peak_bw_ddr = Bps_to_icc(2 * gi2c->clk_freq_out);
> +
> +	/* Vote for core clocks and CPU for register access */
> +	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, gi2c->se.avg_bw_core,
> +				gi2c->se.peak_bw_core);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, gi2c->se.avg_bw_cpu,
> +				gi2c->se.peak_bw_cpu);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
> +
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
> @@ -584,6 +634,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Error turning off resources %d\n", ret);
>  		return ret;
>  	}
> +	/* Remove vote from core clocks and CPU */
> +	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, 0, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ICC BW remove failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, 0, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ICC BW remove failed for cpu\n",
> +			__func__);

Should this return an error as for the core clocks?

> +	}
>  
>  	dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>  
> @@ -629,6 +692,28 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  		gi2c->suspended = 1;
>  	}
>  
> +	/* Remove BW votes */
> +	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, 0, 0);
> +	if (ret) {
> +		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, 0, 0);
> +	if (ret) {
> +		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(gi2c->se.icc_path_geni_to_ddr, 0, 0);
> +	if (ret) {
> +		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for ddr\n",
> +			__func__);
> +		return ret;
> +	}

you could consider putting this and the ICC voting in _runtime_resume() in
separate functions and call them from here and _probe(). The only difference
in _probe() is that it doesn't vote for the DDR bandwidth, but that slight
one-time overhead might be worth for consolidating the code.

Actually all this looks very similar for UART, I2C, SPI and QSPI. It seems it
should be possible to consolidate this further by having functions like these
in the geni SE driver:

int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
	const char *icc_ddr)
{
	if (icc_core) {
		se->icc_path_geni_to_core = devm_of_icc_get(se->dev, icc_core);
		if (IS_ERR(se->icc_path_geni_to_core))
			return PTR_ERR(se->icc_path_geni_to_core);
	}

	if (icc_cpu) {

	...
}

int geni_icc_vote_on(struct geni_se *se)
{
	if (gi2c->se.icc_path_geni_to_core) {
		ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, gi2c->se.avg_bw_core,
			gi2c->se.peak_bw_core);
		if (ret) {
			dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for core\n",
				__func__);
			return ret;
		}
	}

	/* or to reduce nesting:
	if (!gi2c->se.icc_path_geni_to_core)
		goto vote_cpu;

	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, gi2c->se.avg_bw_core,
			gi2c->se.peak_bw_core);
	if (ret) {
	...

vote_cpu:
	*/

	if (gi2c->se.icc_path_cpu_to_geni) {

	...
}

int geni_icc_vote_off(struct geni_se *se)
{
	if (gi2c->se.icc_path_geni_to_core) {
		ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, 0, 0);
		if (ret) {
			dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for core\n",
				__func__);
			return ret;
		}
	}

	if (gi2c->se.icc_path_cpu_to_geni) {

	...
}

optionally you could even reduce the code further by having an array of
'struct geni_icc_path' (as suggested on https://patchwork.kernel.org/patch/11436889/#23221925)
and iterate over the array instead of spelling everything out for the 3
ICC paths.

> +
>  	return 0;
>  }
>  
> @@ -637,6 +722,31 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> +	/* Vote on Core, CPU and DDR path respectively */
> +	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, gi2c->se.avg_bw_core,
> +		gi2c->se.peak_bw_core);
> +	if (ret) {
> +		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, gi2c->se.avg_bw_cpu,
> +		gi2c->se.peak_bw_cpu);
> +	if (ret) {
> +		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(gi2c->se.icc_path_geni_to_ddr, gi2c->se.avg_bw_ddr,
> +		gi2c->se.peak_bw_ddr);
> +	if (ret) {
> +		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for ddr\n",
> +			__func__);
> +		return ret;
> +	}
> +

as per above this would be just:

	ret = geni_icc_vote_on(&gi2c->se);
	if (ret)
		return ret;

with the same benefit for the other 3 drivers.
