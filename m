Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24566164D5A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2020 19:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgBSSJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Feb 2020 13:09:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33430 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSSJw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Feb 2020 13:09:52 -0500
Received: by mail-pf1-f194.google.com with SMTP id n7so471815pfn.0
        for <linux-i2c@vger.kernel.org>; Wed, 19 Feb 2020 10:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DT9b2JqUNcas1GieQOO1UADd6ZveitNnuHA65yQ4esE=;
        b=gNqxcpByNWRFu0kl0YvLf68XNvjty9vaYNkQyj4UDT0CK1Ig4GRS+PwQznc7FIMoK6
         TgXzwabcsTBPFnXM77EN8+5Zku0ln7/W1A8zwCJHQiwcJA/d9ndPnODOU14PDRDcC6ai
         7moER/4RsiWjejAX48uDiH3/nQWS4BpmwI9qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DT9b2JqUNcas1GieQOO1UADd6ZveitNnuHA65yQ4esE=;
        b=ujr3rFWD9j+78f6SHFgmRLo0pPvxqQ8b5vgb05qJlHM6jRhE6SA56HqLEWAtGdLhwb
         /Mb2sJA6uTB9IT8hAztCHDaizdGW1A5AsIB0nJYLnVI/P+3wjo+gZM+oJyH2njVzI8ii
         3tHWqbztE7w5fOW4cbRKHFQ1HvLOpgRX3a9WsTyyM8QjxGXJWGsdxn2LZNmKNp5e1TsH
         RfyznQj6CVQvpBYAootIAJl/DJInth9GyXAdJPgYiTFvRK7e1kb9AzwnTAMcoeKsRITe
         7ZyqUyVnhB+oCm1sknC63dZEZ3OrQGvnnjfAVx97jbRA42xFgb7Ku8r0dXvkQzO0VZjf
         lgcQ==
X-Gm-Message-State: APjAAAWj0raUsiPc3dLPnADrHRIjfgqoKjdpzLv/KOurMvWA6Baggzuf
        LgSphr/RhPAfjXBRtSeD0WHdGQ==
X-Google-Smtp-Source: APXvYqyBuOdfaFMKcgQz2InWVMXt9wu5jkvAcdKhlsUWQ2aZek1+MLFnc2VNa4KJ8eoMdzeMh4L0gg==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr27963352pfk.206.1582135791976;
        Wed, 19 Feb 2020 10:09:51 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q21sm281382pff.105.2020.02.19.10.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 10:09:51 -0800 (PST)
Date:   Wed, 19 Feb 2020 10:09:50 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH 4/6] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200219180950.GA24720@google.com>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581946205-27189-5-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 17, 2020 at 07:00:03PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 65 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c397242..a066ef26 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -608,16 +653,25 @@ static int spi_geni_remove(struct platform_device *pdev)
>  	spi_unregister_master(spi);
>  
>  	free_irq(mas->irq, spi);
> +	geni_spi_icc_put(&mas->se);
>  	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  }
>  
>  static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
>  {
> +	int ret;
>  	struct spi_master *spi = dev_get_drvdata(dev);
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
>  
> -	return geni_se_resources_off(&mas->se);
> +	ret = geni_se_resources_off(&mas->se);
> +	if (ret)
> +		return ret;
> +
> +	icc_set_bw(mas->se.icc_path[GENI_TO_CORE], 0, 0);

This causes my SC7180 system to reset at boot time:

[    3.509652] qcom-qmp-phy 88e9000.phy-wrapper: Registered Qcom-QMP phy
[    3.516956] qcom-qusb2-phy 88e3000.phy: Registered Qcom-QUSB2 phy
[    3.524450] geni_se_qup 8c0000.geniqup: Adding to iommu group 4
[    3.533896] spi_master spi0: will run message pump with realtime priority
<reset>

The system does not reset when passing 'Bps_to_icc(1000)' (=> 1) instead of 0.
