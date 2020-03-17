Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36425188DB3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 20:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgCQTIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 15:08:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36207 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgCQTIz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 15:08:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id s1so18190229lfd.3
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N0pVG6jg37JbXDGZqNXU8YUjbzipX2Fsv4mJnUH+Gqc=;
        b=EVZ6onocp1AKXkig4MYRrWS48pQUz/GXUgU3trR6RLyy2aDNysZ5AWmmlx14k36Rz9
         F4G8ckytSImzjbTgfCanyhg8I1gSTsiKcgGs9cUHyu3+dHoATjA5Mk1b5riuDxhAEumh
         DbK7l1Ux8rLZxqeEarOSx3QYk0LWS6Utc4c30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N0pVG6jg37JbXDGZqNXU8YUjbzipX2Fsv4mJnUH+Gqc=;
        b=gIDDsEfe63f0jFTqREtLJsYDFl9DGaEBvYsnfzdJpVXfRkstuV1XLwHowdxHrpQgZ0
         /3P0BKLNpqfRKCJTsmAyadlPJ0UKw2RknBGO1ep3kLt5TLbck44QAdQboBw2LafxDiIw
         X9kPZoZ6tS1UUKJdmHejC1yO7w/FOaTios35yHf7JBvArJDKBIgGS13bspkCpqjpuAWQ
         WVOevXfx+BuqrcQnTFnN0q9W4LmD9fUibb/ClZutoAYKVPX3B7sO+tdJ9rO8N9Q+cgTV
         3ocNv2GgD/XV4q2z6pGDKttVPYZcRo4FzvumYokNmiF1r/1PVqK3a9fxzg4tZ7ZdHy7V
         U4UQ==
X-Gm-Message-State: ANhLgQ0tLw7Ua2OILIMezcIsSaQjCZWIGT/GQ0kZqQ6m8du7SJdBaCQB
        7TSPWqA+knm+5ppfUn6jPzNdwH7tvxE=
X-Google-Smtp-Source: ADFU+vu8Nqq+j1He69M6Qv5hUMFcb5JGcCUGYftGY0Udbw20OC8d2P+uCE4MGqm14LP8luHgMr7ADw==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr513209lfi.71.1584472131726;
        Tue, 17 Mar 2020 12:08:51 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id o13sm3512437lfg.90.2020.03.17.12.08.50
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:08:51 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id r7so24222565ljp.10
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:08:50 -0700 (PDT)
X-Received: by 2002:a2e:a318:: with SMTP id l24mr134231lje.41.1584472129958;
 Tue, 17 Mar 2020 12:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com> <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
In-Reply-To: <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 17 Mar 2020 12:08:13 -0700
X-Gmail-Original-Message-ID: <CAE=gft5GcOeQ5kh1bGen_P0J98g2XaAJ7NrDsxkirDoLtL4GWg@mail.gmail.com>
Message-ID: <CAE=gft5GcOeQ5kh1bGen_P0J98g2XaAJ7NrDsxkirDoLtL4GWg@mail.gmail.com>
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 3:58 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Matthias,
>
> On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> > Hi Akash,
> >
> > On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
> >> V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
> >> to reset at boot time.
> > The v1 patch isn't relevant in the commit message, please just describe the
> > problem. Also the crash only occurs when earlycon is used.
> ok
> >
> >> As QUP core clock is shared among all the SE drivers present on particular
> >> QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
> >> is put to 0 from other SE drivers before real console comes up.
> >>
> >> As earlycon can't vote for it's QUP core need, to fix this add ICC
> >> support to common/QUP wrapper driver and put vote for QUP core from
> >> probe on behalf of earlycon and remove vote during sys suspend.
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
> We are hitting this problem because QUP core clocks are shared among all
> the SE driver present in particular QUP wrapper, if other HW controllers
> has similar architecture we will hit this issue.
>
> How about if we expose an API from common driver(geni-se) for putting
> QUP core BW vote to 0.
>
> We call this from console probe just after uart_add_one_port call
> (console resources are enabled as part of this call) to put core quota
> to 0 on behalf of earlyconsole?

+Georgi

Hm, these boot proxy votes are annoying, since the whole house of
cards comes down if you replace these votes in the wrong order.

I believe consensus in the other patches was to consolidate most of
the interconnect support into the common SE code, right? Would that
help you with these boot proxy votes? What I'm thinking is something
along the lines of:
 * SPI, I2C, UART all call into the new common geni_se_icc_on/off()
(or whatever it's called)
 * If geni_se_icc_off() sees that console UART hasn't voted yet, save
the votes but don't actually call icc_set(0) now.
 * Once uart votes for the first time, call icc_set() on all of SPI,
I2C, UART to get things back in sync.

That's a sort of roll-your-own solution for GENI, but we do have this
problem elsewhere as well. A more general solution would be to have
the interconnect providers prop things up (ie ignore votes to lower
bandwidth) until some "go" moment where we feel we've enumerated all
devices. I was originally thinking to model this off of something like
clk_disable_unused(), but after chatting with Stephen it's clear
late_initcall's aren't really indicative of all devices having
actually come up. So I'm not sure where the appropriate "go" moment
is.

-Evan


>
> >
> >> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> >> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> >> ---
> >>   drivers/soc/qcom/qcom-geni-se.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 41 insertions(+)
> >>
> >> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> >> index 7d622ea..d244dfc 100644
> >> --- a/drivers/soc/qcom/qcom-geni-se.c
> >> +++ b/drivers/soc/qcom/qcom-geni-se.c
> >> @@ -90,6 +90,7 @@ struct geni_wrapper {
> >>      struct device *dev;
> >>      void __iomem *base;
> >>      struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> >> +    struct icc_path *icc_path_geni_to_core;
> >>   };
> >>
> >>   #define QUP_HW_VER_REG                     0x4
> >> @@ -747,11 +748,50 @@ static int geni_se_probe(struct platform_device *pdev)
> >>              }
> >>      }
> >>
> >> +#ifdef CONFIG_SERIAL_EARLYCON
> >> +    wrapper->icc_path_geni_to_core = devm_of_icc_get(dev, "qup-core");
> >> +    if (IS_ERR(wrapper->icc_path_geni_to_core))
> >> +            return PTR_ERR(wrapper->icc_path_geni_to_core);
> >> +    /*
> >> +     * Put minmal BW request on core clocks on behalf of early console.
> >> +     * The vote will be removed in suspend call.
> >> +     */
> >> +    ret = icc_set_bw(wrapper->icc_path_geni_to_core, Bps_to_icc(1000),
> >> +                    Bps_to_icc(1000));
> >> +    if (ret) {
> >> +            dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
> >> +                    __func__);
> >> +            return ret;
> >> +    }
> > What is ugly about this is that it's done for every QUP, not only the one
> > with the early console. Again, I don't have a good solution for it, maybe
> > it's a limitation we have to live with :(
>
> There is one more limitation from QUP core side. Core clocks for both
> the QUP wrapper runs at same speed.
>
> core2x_1 = core2x_2 = max(core2x_1, core2x_2);
>
> So with above limitation and if we are removing early con vote from Core
> when real console comes up. It doesn't matter whether it's done for
> every QUP or the only with early console.
>
> >
> >> +#endif
> >> +
> >>      dev_set_drvdata(dev, wrapper);
> >>      dev_dbg(dev, "GENI SE Driver probed\n");
> >>      return devm_of_platform_populate(dev);
> >>   }
> >>
> >> +static int __maybe_unused geni_se_sys_suspend(struct device *dev)
> >> +{
> >> +    struct geni_wrapper *wrapper = dev_get_drvdata(dev);
> >> +    int ret;
> >> +
> >> +#ifdef CONFIG_SERIAL_EARLYCON
> >> +    ret = icc_set_bw(wrapper->icc_path_geni_to_core, 0, 0);
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
> pinctrl, etc) it assumes that resources are already enabled from
> previous stages.
>
> So if real console doesn't come up no one will vote for that SE clock,
> and it will be disabled from clk late_init call which will result into
> un-clocked access.
>
>
> >
> >> +    if (ret) {
> >> +            dev_err(dev, "%s: ICC BW remove failed for core\n",
> >> +                    __func__);
> >> +            return ret;
> > Aborting suspend seems too harsh since the QUP should still be fully
> > functional unless there is a general problem with the interconnects.
> >
> > I would suggest to change the log to dev_warn() and return 0.
>
> Ok
>
> Thanks for reviewing the patch.
>
> regards,
>
> Akash
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
