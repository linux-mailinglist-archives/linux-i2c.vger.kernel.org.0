Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649A31ACE6E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 19:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387553AbgDPRKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 13:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731877AbgDPRKE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 13:10:04 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2DAC061A41
        for <linux-i2c@vger.kernel.org>; Thu, 16 Apr 2020 10:10:03 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n10so1944306pff.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Apr 2020 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EcaUjKr60NABrTutbb9VaO0pRJf9+Gj4l3bz6prw+yE=;
        b=IkpAFJhJdAWshYnm+xeetGdIIaIslGQ5tzURliBkEMMopJKW5GWMhOLteksRf1Z3tm
         dYOlW+5enQJMQNLJIAfI1YjYJeErgTn3OZivjXXSf7f5bwKv+kKwo6QBG62kv+4764RI
         2OTJc8tejHbGSLTt4LSOavpzPxlrEqucJWYAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EcaUjKr60NABrTutbb9VaO0pRJf9+Gj4l3bz6prw+yE=;
        b=gN8kVKZdNVMUQLThlLLwf5jKujX0TgIFsh4IvNk87XfP7eT2kRZKBZG6lYF/YApONp
         c2QWcdLYlNXF2wUUu+d9ytdgQ92fkIUoPkMfoprKtZrBB4phEZrZhFb7Wim9vvzp0h5e
         ka30QBY34nKJNDGsu/IGDfwOKDc9Pz2TzTFqsOWhFO+Ylzdkyxvey2nXxmuQntLpPnAh
         MpuycjVaMH7X8DcMgWIuCSYOIFXbdi7HcMx6S+hMAYmDwIl86scxaOo/j84yB+FBgrDc
         OVFsKSMFUsCvqgVLlLsb46kBkDe1PhTff9cC2K0O4OuHPHLYrYimfGhxHumYUrumLe+6
         Pr7g==
X-Gm-Message-State: AGi0PuYewW1XjHVcOK85gPbtk+CwUn/kT+01MomV3eMVCjf1dBIDPAxZ
        6ZWffO5ywsmF5t/OSV1qZlPozg==
X-Google-Smtp-Source: APiQypIT5kDHYuZg8YXZMEs+ue2sVRmKYbgBy+Kbwvsvc176USpnBUDGYgH/JpVw02EGzNimYbjGEQ==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr31268336pgb.74.1587057002469;
        Thu, 16 Apr 2020 10:10:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q2sm10446110pfl.174.2020.04.16.10.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 10:10:00 -0700 (PDT)
Date:   Thu, 16 Apr 2020 10:09:59 -0700
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
Subject: Re: [PATCH V4 5/9] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200416170959.GB199755@google.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586946198-13912-6-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Wed, Apr 15, 2020 at 03:53:14PM +0530, Akash Asthana wrote:
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
> Changes in V3:
>  - As per Matthias comment, use common library APIs defined in geni-se
>    driver for ICC functionality.
> 
> Changes in V4:
>  - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
>    to ICC core.
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 18d1e4f..7bf830a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -557,6 +557,22 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = dev->of_node;
>  	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> +	ret = geni_icc_get(&gi2c->se, "qup-memory");
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Set the bus quota for core and cpu to a reasonable value for
> +	 * register access.
> +	 * Set quota for DDR based on bus speed.
> +	 */
> +	gi2c->se.icc_paths[0].avg_bw = GENI_DEFAULT_BW;
> +	gi2c->se.icc_paths[1].avg_bw = GENI_DEFAULT_BW;
> +	gi2c->se.icc_paths[2].avg_bw = Bps_to_icc(gi2c->clk_freq_out);

As commented on patch "soc: qcom: geni: Support for ICC voting" the use
of literals to index the paths isn't very clear, please use enums.
