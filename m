Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE0319B68F
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 21:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732554AbgDATqy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 15:46:54 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37617 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732586AbgDATqy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Apr 2020 15:46:54 -0400
Received: by mail-pl1-f195.google.com with SMTP id x1so389411plm.4
        for <linux-i2c@vger.kernel.org>; Wed, 01 Apr 2020 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/ce+l+iRZG0CueQLUqCcAm+FhjXwOeZQvrFD6a+Pdbk=;
        b=fCc9uE+XYXB06N48E9h3rQ4SJNQfhzwC50G+TMXvj8kfPBe4kbDLR7b1/oJ+uEuxKc
         /zyiOEwgGh1jAIInwlsgrzgiU0oI90VjnSLlLTNo58X3/wrlUbKCMZCG3LswFVAZjJin
         LvE7ziv7OG52tAD9ohxETUiLgLpf2qYRWHzUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/ce+l+iRZG0CueQLUqCcAm+FhjXwOeZQvrFD6a+Pdbk=;
        b=BFFBaDR2/y79Md+LYj5OzZ2EZAvCguD9ikYrnie83Qo2UEjZxcInXHamqV3Nw0xKev
         5nFfKhqpZQN6soT8EGtJUAb0b+zwNvCJq25Kq14eTiBlvsEQyb0FSHlNUgiJdw+uEcGb
         lnliRJ6ZK2n+NaOYPDw2RL+mE5FdngBH/Eu3qJG+60Xcbz7tU/sT6K4pHGyHRtlwC19C
         0nZiMiRyEiLEJungFkrUKpU7+dDrjg9RYME2Fji/Eb8lOHnhgUTUpkUMQ1LsjrXOFS99
         gVwIXHgsmhfz9NncrU9VDPm+6eoFwUjVM1jw7pekAUIxh30JYid71yJKpfep11+4dKCA
         Dkbw==
X-Gm-Message-State: ANhLgQ2731zxhS3726wRIqPvI3ChKM+U7Ny4kkfcAB0fXajsDAOdSpmh
        +TMgVahDnXENlCi0af5U8SuwXg==
X-Google-Smtp-Source: ADFU+vt/xdibwjNhNGnnuYkq1gCZsQ2pLfGD9zsm2il2lY1sfEB8MLcew8RkcukpAiHbnqsuWeHD3Q==
X-Received: by 2002:a17:902:9004:: with SMTP id a4mr21923981plp.275.1585770411176;
        Wed, 01 Apr 2020 12:46:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 132sm2160604pfc.183.2020.04.01.12.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 12:46:50 -0700 (PDT)
Date:   Wed, 1 Apr 2020 12:46:48 -0700
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
Subject: Re: [PATCH V3 3/8] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200401194648.GM199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
 <20200331182457.GH199755@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200331182457.GH199755@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 31, 2020 at 11:24:57AM -0700, Matthias Kaehlcke wrote:
> Hi Akash,
> 
> On Tue, Mar 31, 2020 at 04:39:31PM +0530, Akash Asthana wrote:
> > QUP core clock is shared among all the SE drivers present on particular
> > QUP wrapper, the system will reset(unclocked access) if earlycon used after
> > QUP core clock is put to 0 from other SE drivers before real console comes
> > up.
> > 
> > As earlycon can't vote for it's QUP core need, to fix this add ICC
> > support to common/QUP wrapper driver and put vote for QUP core from
> > probe on behalf of earlycon and remove vote during earlycon exit call.
> > 
> > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Change is V3:
> >  - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
> >    exit function to remove ICC vote for earlyconsole.
> >  - Remove suspend/resume hook for geni-se driver as we are no longer
> >    removing earlyconsole ICC vote from system suspend, we are removing
> >    from earlycon exit.
> > 
> >  drivers/soc/qcom/qcom-geni-se.c       | 51 +++++++++++++++++++++++++++++++++++
> >  drivers/tty/serial/qcom_geni_serial.c |  7 +++++
> >  include/linux/qcom-geni-se.h          |  2 ++
> >  3 files changed, 60 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > index 9344c14..d30c282 100644
> > --- a/drivers/soc/qcom/qcom-geni-se.c
> > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > @@ -90,8 +90,11 @@ struct geni_wrapper {
> >  	struct device *dev;
> >  	void __iomem *base;
> >  	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> > +	struct geni_icc_path to_core;
> >  };
> >  
> > +struct geni_wrapper *earlycon_wrapper;
> 
> should be static
> 
> > +
> >  #define QUP_HW_VER_REG			0x4
> >  
> >  /* Common SE registers */
> > @@ -818,6 +821,26 @@ int geni_icc_vote_off(struct geni_se *se)
> >  }
> >  EXPORT_SYMBOL(geni_icc_vote_off);
> >  
> > +void geni_remove_earlycon_icc_vote(void)
> > +{
> > +	struct geni_wrapper *wrapper = earlycon_wrapper;
> > +	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);
> > +	struct device_node *child;
> > +
> > +	for_each_child_of_node(parent, child) {
> > +		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
> > +			wrapper = platform_get_drvdata(of_find_device_by_node(
> > +					child));
> > +			icc_put(wrapper->to_core.path);
> > +			wrapper->to_core.path = NULL;
> > +		}
> > +	}
> > +	of_node_put(parent);
> > +
> > +	earlycon_wrapper = NULL;
> > +}
> > +EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);
> 
> I didn't know that consoles have an exit handler, this is way nicer than
> the miscellaneous triggers we discussed earlier :)

No wonder I 'missed' this when looking at the console code for possible
triggers, it is brand new and as of now only exists in -next:

commit ed31685c96e18f773ca11dd1a637974d62130673
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Mon Feb 3 15:31:30 2020 +0200

    console: Introduce ->exit() callback


sharp timing!
