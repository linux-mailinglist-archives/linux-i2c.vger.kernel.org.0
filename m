Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C473188D2D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 19:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCQS3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 14:29:17 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39129 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgCQS3Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 14:29:16 -0400
Received: by mail-pj1-f67.google.com with SMTP id ck23so114818pjb.4
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 11:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nXkNFVj/QtLkq2RGYlobQmnnCoULTCQVmEQQAtgXyn8=;
        b=f7baYWSluR11kisKxXiqjVJnTzsLjynE2xiER1acr7JCS4A4m3rIU4SXFMAGkHAWpW
         gDKoAeNTu4WagdwEn4rEEYEW3t8V8aMFU3nb/0aoNxTIT/v+HGgNIa0dKuvLTvOzYoWA
         uJCuXQZWG1dbdOtaFL5i+CbfQLPoQ/YX1qiJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nXkNFVj/QtLkq2RGYlobQmnnCoULTCQVmEQQAtgXyn8=;
        b=Ei3VxTPCQ+se5YYM+uY7lZ7vbvdP/r6qPyvFZ3wkjcEwMXtDUNpSyeGfvql2xEn8dH
         hYuPcMEZuKCpMU9wvptjgeU+n/tZJFvT/CXehIulW0iJ18eabQSKkZQzvW7F13qwXlvB
         IKxgL555dWMK7agj29bq6SsEA98Yb3oT3kavrOQmhMHW8dvTqZ9lmddvFAe08QurgIPO
         9uhddaVkcYOE9A8JKBmPUQkZUfv1AGJcy4jshNjkxVn92PuCi33QrFM2YZHvUX4wiJI3
         bqtkjB9Sl4HZl1thKoafEDr8bGs0o7xKRWiafUvWMrLxWYxImPazWbOgf8jYlqXyxufv
         7bcg==
X-Gm-Message-State: ANhLgQ14/2NglOTy99Uz10fxEij8LH1QUOdCKTfhfqEU0pkz9dZsDqiB
        /U1iQ8Jg1+pp1ZaA5P6tSzmnKQ==
X-Google-Smtp-Source: ADFU+vuzhPFjs7qV7qsPEX6L2HfAR5J0aPnTGp/vQq9cHhw+/zUume367rPFTrABrHEyKdsg0W5lpg==
X-Received: by 2002:a17:90a:252b:: with SMTP id j40mr512503pje.189.1584469753341;
        Tue, 17 Mar 2020 11:29:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id p2sm3917353pfb.41.2020.03.17.11.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 11:29:12 -0700 (PDT)
Date:   Tue, 17 Mar 2020 11:29:10 -0700
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
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200317182910.GR144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com>
 <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Tue, Mar 17, 2020 at 04:27:47PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> > Hi Akash,
> > 
> > On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
> > > V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
> > > to reset at boot time.
> > The v1 patch isn't relevant in the commit message, please just describe the
> > problem. Also the crash only occurs when earlycon is used.
> ok
> > 
> > > As QUP core clock is shared among all the SE drivers present on particular
> > > QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
> > > is put to 0 from other SE drivers before real console comes up.
> > > 
> > > As earlycon can't vote for it's QUP core need, to fix this add ICC
> > > support to common/QUP wrapper driver and put vote for QUP core from
> > > probe on behalf of earlycon and remove vote during sys suspend.
> > Only removing the vote on suspend isn't ideal, the system might never get
> > suspended. That said I don't have a really good alternative suggestion.
> > 
> > One thing you could possibly do is to launch a delayed work, check
> > console_device() every second or so and remove the vote when it returns
> > non-NULL. Not claiming this would be a great solution ...
> > 
> > The cleanest solution might be a notifier when the early console is
> > unregistered, it seems somewhat over-engineered though ... Then again
> > other (future) uart drivers with interconnect support might run into
> > the same problem.
> 
> We are hitting this problem because QUP core clocks are shared among all the
> SE driver present in particular QUP wrapper, if other HW controllers has
> similar architecture we will hit this issue.
> 
> How about if we expose an API from common driver(geni-se) for putting QUP
> core BW vote to 0.
> 
> We call this from console probe just after uart_add_one_port call (console
> resources are enabled as part of this call) to put core quota to 0 on behalf
> of earlyconsole?

From my notes from earlier debugging I have doubts this would work:

  There is a short window where the early console and the 'real' console coexist:

  [    3.858122] printk: console [ttyMSM0] enabled
  [    3.875692] printk: bootconsole [qcom_geni0] disabled

  The reset probably occurs when the early console tries to write, but the ICC
  is effectively disabled because ttyMSM0 and the other geni ports are runtime
  suspended.

> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > >   drivers/soc/qcom/qcom-geni-se.c | 41 +++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 41 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > > index 7d622ea..d244dfc 100644
> > > --- a/drivers/soc/qcom/qcom-geni-se.c
> > > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > > @@ -90,6 +90,7 @@ struct geni_wrapper {
> > >   	struct device *dev;
> > >   	void __iomem *base;
> > >   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> > > +	struct icc_path *icc_path_geni_to_core;
> > >   };
> > >   #define QUP_HW_VER_REG			0x4
> > > @@ -747,11 +748,50 @@ static int geni_se_probe(struct platform_device *pdev)
> > >   		}
> > >   	}
> > > +#ifdef CONFIG_SERIAL_EARLYCON
> > > +	wrapper->icc_path_geni_to_core = devm_of_icc_get(dev, "qup-core");
> > > +	if (IS_ERR(wrapper->icc_path_geni_to_core))
> > > +		return PTR_ERR(wrapper->icc_path_geni_to_core);
> > > +	/*
> > > +	 * Put minmal BW request on core clocks on behalf of early console.
> > > +	 * The vote will be removed in suspend call.
> > > +	 */
> > > +	ret = icc_set_bw(wrapper->icc_path_geni_to_core, Bps_to_icc(1000),
> > > +			Bps_to_icc(1000));
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
> > > +			__func__);
> > > +		return ret;
> > > +	}
> > What is ugly about this is that it's done for every QUP, not only the one
> > with the early console. Again, I don't have a good solution for it, maybe
> > it's a limitation we have to live with :(
> 
> There is one more limitation from QUP core side. Core clocks for both the
> QUP wrapper runs at same speed.
> 
> core2x_1 = core2x_2 = max(core2x_1, core2x_2);
> 
> So with above limitation and if we are removing early con vote from Core
> when real console comes up. It doesn't matter whether it's done for every
> QUP or the only with early console.

it's still sorta ugly at an abstraction level, but it seem we have to be
pragmatic here.

> > > +#endif
> > > +
> > >   	dev_set_drvdata(dev, wrapper);
> > >   	dev_dbg(dev, "GENI SE Driver probed\n");
> > >   	return devm_of_platform_populate(dev);
> > >   }
> > > +static int __maybe_unused geni_se_sys_suspend(struct device *dev)
> > > +{
> > > +	struct geni_wrapper *wrapper = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +#ifdef CONFIG_SERIAL_EARLYCON
> > > +	ret = icc_set_bw(wrapper->icc_path_geni_to_core, 0, 0);
> > I think you only want to do this on the first suspend.
> Ok, I can add that logic using global variable.
> > 
> > Do we need to handle the case where no 'real' console is configured?
> > In this case the early console would be active forever and setting
> > the bandwidths to 0 might cause a similar crash than the one you are
> > trying to fix. Not sure if that's a real world use case, but wanted to
> > mention it. Maybe this is an argument of the notifier approach?
> We can't support earlycon without real console.
> 
> As earlyconsole doesn't do any kind of resource enablement(SE clocks,
> pinctrl, etc) it assumes that resources are already enabled from previous
> stages.
> 
> So if real console doesn't come up no one will vote for that SE clock, and
> it will be disabled from clk late_init call which will result into
> un-clocked access.

Ok, IIUC what you are saying is that earlycon can't work on its own after geni
initialization. Because it clearly can work before (otherwise what would be
its purpose?), supposedly because the bootloader configures the necessary
bits.

In any case the bottom line is that earlycon requires a real console to be
configured and there is no need to handle the corner case I brought up.
