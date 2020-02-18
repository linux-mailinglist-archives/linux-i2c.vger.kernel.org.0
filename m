Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CDD16365D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2020 23:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgBRWrL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Feb 2020 17:47:11 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39435 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgBRWrL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Feb 2020 17:47:11 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so8689528plp.6
        for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2020 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=focsb7O7M7LZXv1BjQxj6gFRUP9YP36BqaMZFS6X++s=;
        b=F54FGwb9xvr3THcPcYljDLalOKVE0LMxiJ8ZkI9zFOpfZxJn0u9PfFddllc5OXOTDT
         sNc8UtfvLCT/boM7yzmGeTKmJ95XSPri/VPN4SK6O80CNp4OvwsO7qrr2YdqyEpIxbPH
         vi9BrwpSI0UKidHfCxCiuQTuYYw1wsM1ImhK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=focsb7O7M7LZXv1BjQxj6gFRUP9YP36BqaMZFS6X++s=;
        b=gKxb7JQ3w2VrXxxE9D+8Qq+hVfEDX0QOQ+ZhfS/jh5BUJ0hrvqJkHis6rQu+T7B4pB
         D82aZ12EL+sAeQsJWTDTn92Khi0gVHdqVVEQoZMdkInyPJbb3yiwIXVb4tBBtAezK5ck
         MdNJT14WEQaqF0TkZ873fL+I7a23x/h9IVeXPcyLZwe3opTUTO4ZEbwtr/016TmxOH9c
         2sVRsYV9UrMtr4llWrZokdAS87j3x4UN/CoAOArjHiGd3VAiITtqtFIEI+WqgULi4HE8
         oMmm+sWH7kjROUyjZS8w+Hkw9DETXEQOoH6H8WDlP6fevMyRtgkEDEEvt1jHNunLrO7l
         eTbA==
X-Gm-Message-State: APjAAAVhCP8lxzNT/LY4t0wV/xaaBIMUL7D+QNe1QmOG/4y94D0KkikJ
        CtnQR2Hl1tHjObhQYt8wLnbEBw==
X-Google-Smtp-Source: APXvYqzqLkaYLCnozHjZ+EA1d3mHYozNsxvPd2mLKnFoZLI4SdFV/xWMMXE1mzXjLDf+X/H8vWNXnQ==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id b92mr5150415pjc.26.1582066030963;
        Tue, 18 Feb 2020 14:47:10 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id t65sm24994pfd.178.2020.02.18.14.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 14:47:10 -0800 (PST)
Date:   Tue, 18 Feb 2020 14:47:09 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH 3/6] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200218224709.GF15781@google.com>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581946205-27189-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 17, 2020 at 07:00:02PM +0530, Akash Asthana wrote:
> Get the interconnect paths for I2C based Serial Engine device
> and vote according to the bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 84 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 17abf60c..5de10a1 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -163,6 +163,44 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>  	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
>  }
>  
> +static int geni_i2c_icc_get(struct geni_se *se)
> +{
> +	if (!se)
> +		return -EINVAL;

check is not needed

> +
> +	se->icc_path[GENI_TO_CORE] = of_icc_get(se->dev, "qup-core");
> +	if (IS_ERR(se->icc_path[GENI_TO_CORE]))
> +		return PTR_ERR(se->icc_path[GENI_TO_CORE]);
> +
> +	se->icc_path[CPU_TO_GENI] = of_icc_get(se->dev, "qup-config");
> +	if (IS_ERR(se->icc_path[CPU_TO_GENI])) {
> +		icc_put(se->icc_path[GENI_TO_CORE]);
> +		se->icc_path[GENI_TO_CORE] = NULL;

echoing Bjorn's comments on 'tty: serial: qcom_geni_serial: Add
interconnect support', resetting is not needed since _probe() will
fail.

> +		return PTR_ERR(se->icc_path[CPU_TO_GENI]);
> +	}
> +
> +	se->icc_path[GENI_TO_DDR] = of_icc_get(se->dev, "qup-memory");
> +	if (IS_ERR(se->icc_path[GENI_TO_DDR])) {
> +		icc_put(se->icc_path[GENI_TO_CORE]);
> +		se->icc_path[GENI_TO_CORE] = NULL;

ditto

> +		icc_put(se->icc_path[CPU_TO_GENI]);
> +		se->icc_path[CPU_TO_GENI] = NULL;

ditto

> +		return PTR_ERR(se->icc_path[GENI_TO_DDR]);
> +	}
> +
> +	return 0;
> +}
> +
> +void geni_i2c_icc_put(struct geni_se *se)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_path); i++) {
> +		icc_put(se->icc_path[i]);
> +		se->icc_path[i] = NULL;

not needed

> +	}
> +}
> +
>  static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
>  {
>  	u32 m_cmd = readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
> @@ -563,17 +601,34 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = pdev->dev.of_node;
>  	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> +	ret = geni_i2c_icc_get(&gi2c->se);
> +	if (ret)
> +		return ret;
> +	/* Set the bus quota to a reasonable value */
> +	gi2c->se.avg_bw_core = Bps_to_icc(1000);
> +	gi2c->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
> +	gi2c->se.avg_bw_cpu = Bps_to_icc(1000);
> +	gi2c->se.peak_bw_cpu = Bps_to_icc(1000);
> +	gi2c->se.avg_bw_ddr = Bps_to_icc(gi2c->clk_freq_out);
> +	gi2c->se.peak_bw_ddr = Bps_to_icc(2 * gi2c->clk_freq_out);
> +
> +	/* Vote for core clocks and CPU for register access */
> +	icc_set_bw(gi2c->se.icc_path[GENI_TO_CORE], gi2c->se.avg_bw_core,
> +				gi2c->se.peak_bw_core);
> +	icc_set_bw(gi2c->se.icc_path[CPU_TO_GENI], gi2c->se.avg_bw_cpu,
> +				gi2c->se.peak_bw_cpu);

error handling needed?
