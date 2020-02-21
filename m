Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A8A16870E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 19:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbgBUSzE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 13:55:04 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:32901 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729397AbgBUSzD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 13:55:03 -0500
Received: by mail-pj1-f68.google.com with SMTP id m7so2460815pjs.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2020 10:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3+q3lISbQqmoylcBRX0ljpGoH0evC7W0clNtAhnO7FQ=;
        b=Xi5iYhOPTrQ6EU9L943ymywszhoCRb8ARJiJLMdagjqcqJTyajoSGSJRg5QxNFBIwy
         3NDfb/GUW55SOwFqspg5Umn0kSorcmpey7vBTP4INB2fRATLO6GmkH1CymdJbBE4s6tg
         stDsf1azXbWaeyqf53yxNu2CMLudRWlmFST+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3+q3lISbQqmoylcBRX0ljpGoH0evC7W0clNtAhnO7FQ=;
        b=cOdIpYzxge70OHnJyIlXP6jlIMquMBy+KrnefOsFU/RY7md2RKBe/oN/wRC8p6kAcA
         P3jPrrRq6ryJzfHMZW5gxfW58a+6WF/6fM+u5SMst6IFi9JcUnu4KYf7utQgi00OmZ3A
         GNpEKWqKjjxfeTU7H0/abA2hvs3X2VqIFFX0fO8bN05s3xXCah7imQETDQWrhnvj+7eL
         Ep8wLWYqV9hDs0TuukVZ97LXwjGmnYEK9sYK9vicl+hoDl0B9ULPjXuTBdUztNgRxQQF
         vy0LKT7ybEiU30E7oShrfPNivVzfa7+XnrhJrGAqwiIBGhdPDUDxUsn9cZHQ4wslAgAU
         xtxQ==
X-Gm-Message-State: APjAAAW2zhXboI0S4lySZwZ6swTwDS0xEtInUA9F5Mduq/TaE1q4tPI/
        08P8niyhY+7qEskOfHAS5gzjlQ==
X-Google-Smtp-Source: APXvYqyv82hKSXxUsomJM1cmTiw8XflthqfyydrvvXesPzmnC85d6kZ2ovwi5gzQL5Xq2CwIatIObw==
X-Received: by 2002:a17:902:401:: with SMTP id 1mr36917442ple.177.1582311302745;
        Fri, 21 Feb 2020 10:55:02 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h13sm3367390pjc.9.2020.02.21.10.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 10:55:01 -0800 (PST)
Date:   Fri, 21 Feb 2020 10:55:00 -0800
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
Message-ID: <20200221185500.GE24720@google.com>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-5-git-send-email-akashast@codeaurora.org>
 <20200219180950.GA24720@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200219180950.GA24720@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 19, 2020 at 10:09:50AM -0800, Matthias Kaehlcke wrote:
> On Mon, Feb 17, 2020 at 07:00:03PM +0530, Akash Asthana wrote:
> > Get the interconnect paths for SPI based Serial Engine device
> > and vote according to the current bus speed of the driver.
> > 
> > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > ---
> >  drivers/spi/spi-geni-qcom.c | 65 ++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 62 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index c397242..a066ef26 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -608,16 +653,25 @@ static int spi_geni_remove(struct platform_device *pdev)
> >  	spi_unregister_master(spi);
> >  
> >  	free_irq(mas->irq, spi);
> > +	geni_spi_icc_put(&mas->se);
> >  	pm_runtime_disable(&pdev->dev);
> >  	return 0;
> >  }
> >  
> >  static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
> >  {
> > +	int ret;
> >  	struct spi_master *spi = dev_get_drvdata(dev);
> >  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> >  
> > -	return geni_se_resources_off(&mas->se);
> > +	ret = geni_se_resources_off(&mas->se);
> > +	if (ret)
> > +		return ret;
> > +
> > +	icc_set_bw(mas->se.icc_path[GENI_TO_CORE], 0, 0);
> 
> This causes my SC7180 system to reset at boot time:
> 
> [    3.509652] qcom-qmp-phy 88e9000.phy-wrapper: Registered Qcom-QMP phy
> [    3.516956] qcom-qusb2-phy 88e3000.phy: Registered Qcom-QUSB2 phy
> [    3.524450] geni_se_qup 8c0000.geniqup: Adding to iommu group 4
> [    3.533896] spi_master spi0: will run message pump with realtime priority
> <reset>
> 
> The system does not reset when passing 'Bps_to_icc(1000)' (=> 1) instead of 0.

I found this is related with the use of 'earlycon'.

There is a short window where the early console and the 'real' console coexist:

[    3.858122] printk: console [ttyMSM0] enabled
[    3.875692] printk: bootconsole [qcom_geni0] disabled

The reset probably occurs when the early console tries to write, but the ICC is
effectively disabled because ttyMSM0 and the other geni ports are runtime
suspended.

In any case that's not an issue of the SPI driver, but needs to be addressed
somewhere in the console/UART code.
