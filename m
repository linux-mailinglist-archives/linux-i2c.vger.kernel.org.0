Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33329199E63
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 20:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCaStn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 14:49:43 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50649 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgCaStn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 14:49:43 -0400
Received: by mail-pj1-f68.google.com with SMTP id v13so1466665pjb.0
        for <linux-i2c@vger.kernel.org>; Tue, 31 Mar 2020 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FR8ai6OEFNnFMOGot7XfHged9ha79/NcwHyPaC6Zbwc=;
        b=eMrdhT/qP31mz6ElSVLxdGt16tmdCiwcHVSd6xDtLHUptLILvWkMm++hmvVqM/JPi/
         8nFoewrfF+mxkk0rkCHK1UmGXpJvN3IDAi+KfvxAYv8yJqjdLmapL1HdSqCMIvVNt9IW
         aYh1LdkINaKXdhA9dGSkxjL36bTYU1T61+ggc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FR8ai6OEFNnFMOGot7XfHged9ha79/NcwHyPaC6Zbwc=;
        b=NcQy+GsY0JrRH+58TN8T49acUxEAhNTWDoVzNBAerfaBjgSIBq9U7SqY1O9uFgZBjQ
         0geyXju6fG4Jm3t6Y5JLXcrf4d+/tl4dh0Dl/q30gBfq3mbEj5q4aCKERZUwrO0zw0Us
         OXgQgJd9PdIN9wFzdkvvbtnQ14XYTe445/cf5Ow6LWGTrpVNs2JKM+M7LU2W76Fc7+4v
         X+66s8uLANs0doDACei0cd0SioXJGfE+pZyPj673RT3Tls9i6zwMIV5crTtVYkqz5VQJ
         p/QQo4wBgbWfsHmBe2zs1KpFXBC4u3IW5YVjDv26kWhMRNtnm9KyhzKXVGcWGNHLFzQH
         q4Aw==
X-Gm-Message-State: AGi0PubobwNn+eqGUF5uITXI3uaaURp4xp7eG4AQkorhqHJi6nftwUJ2
        bzaN1hM0jdZ8hB/kIOxgegRzFuhlLhQ=
X-Google-Smtp-Source: APiQypJRxT61RTFX4IkaJ3JmMkwZxMMGvWWRvLCrRvi42md6UNMe9jGvgAheR5m4rs1P0C+DQhpFAQ==
X-Received: by 2002:a17:90a:c001:: with SMTP id p1mr350441pjt.86.1585680581150;
        Tue, 31 Mar 2020 11:49:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x71sm12937792pfd.129.2020.03.31.11.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 11:49:40 -0700 (PDT)
Date:   Tue, 31 Mar 2020 11:49:39 -0700
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
Subject: Re: [PATCH V3 4/8] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200331184939.GI199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1585652976-17481-5-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Tue, Mar 31, 2020 at 04:39:32PM +0530, Akash Asthana wrote:
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
>  drivers/i2c/busses/i2c-qcom-geni.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 18d1e4f..373c2ca 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -557,6 +557,26 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = dev->of_node;
>  	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> +	ret = geni_icc_get(&gi2c->se, "qup-core", "qup-config", "qup-memory");
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Set the bus quota for core and cpu to a reasonable value for
> +	 * register access.
> +	 * Set quota for DDR based on bus speed, assume peak requirement
> +	 * as twice of avg bw.
> +	 */
> +	gi2c->se.to_core.avg_bw = GENI_DEFAULT_BW;
> +	gi2c->se.to_core.peak_bw = Bps_to_icc(CORE_2X_100_MHZ);
> +	gi2c->se.from_cpu.avg_bw = GENI_DEFAULT_BW;
> +	gi2c->se.from_cpu.peak_bw = GENI_DEFAULT_BW;
> +	gi2c->se.to_ddr.avg_bw = Bps_to_icc(gi2c->clk_freq_out);
> +	gi2c->se.to_ddr.peak_bw = Bps_to_icc(2 * gi2c->clk_freq_out);
> +
> +	ret = geni_icc_vote_on(&gi2c->se);
> +	if (ret)
> +		return ret;
> +
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret) {
>  		dev_err(dev, "Error turning on resources %d\n", ret);

I think you need to call geni_icc_vote_off() here and in other error paths.
