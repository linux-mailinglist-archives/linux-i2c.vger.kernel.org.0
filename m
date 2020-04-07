Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C398D1A12A6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 19:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDGR0K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 13:26:10 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39454 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGR0J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 13:26:09 -0400
Received: by mail-pg1-f195.google.com with SMTP id g32so2045011pgb.6
        for <linux-i2c@vger.kernel.org>; Tue, 07 Apr 2020 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZXWzUn5Z/Ds74lB18QonI724Tm16GHOO28VZok8MjvU=;
        b=L0mvs2wqtiIj9fRHO98kqQZpYud4P+3qbxrzYQtdipLQKqrQ8tX0zhG8JQ/93NC1zB
         8+DZnyc9w0B60yVQbrCqOaD9s7QV/lXlnDR2JS/3swm9GG60HB/XYmRR90pJw1BTxCqt
         qLwVBkqB/DhZTJ8HinymM6NsGEANczlzV7cOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZXWzUn5Z/Ds74lB18QonI724Tm16GHOO28VZok8MjvU=;
        b=ZO4IJ/PqMduzuptZ7UdgDkP+vtQbVSPtb7GaybVG+en/1bX6L2LJF4p95TYNYxflYr
         wXSPkw33W778HnIJdxkxRC/2Llg7dL8l8/93mEDZ0299CPozSWtB6yaiExwtBEtIsVxf
         na2HiN6ALG38UUkgK2iJvqgZv45WtMrrV5NKTUi6n/QVv798AkJuOERE2NOmTMI0H9lL
         R2VBeD6Q+wqoRaI28P9T3FXfQjfThFy8E8OqdNHqRlPpqqNZfAjJvBjYBTT+TnmIwBdW
         lMTfSn2g05DHZZOhnEv584LQ6xp7vKd+ExxHOdOMM08mmOcTv1Afx5OmpVW68E/WKp0I
         J/5Q==
X-Gm-Message-State: AGi0PuYdegIChduy+XwPRp4MNz31hi5oaync/bRQVVgNZVznoVpfNTHg
        bmm+JYUxUe3QfCuYRXnJWchWhg==
X-Google-Smtp-Source: APiQypKM+2EhYk7aA1CiT7a7eLCNYS1gqFrTlOeiiyvxSG5iNmeFxXjHl39MEtWVRKfEEPlMhQAkwQ==
X-Received: by 2002:a63:4d57:: with SMTP id n23mr3205051pgl.59.1586280369339;
        Tue, 07 Apr 2020 10:26:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id c10sm13572214pgh.48.2020.04.07.10.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 10:26:07 -0700 (PDT)
Date:   Tue, 7 Apr 2020 10:26:04 -0700
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
Message-ID: <20200407172604.GQ199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
 <20200331182457.GH199755@google.com>
 <7a4e13bf-a4b7-d75b-df42-bf5e4125258a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a4e13bf-a4b7-d75b-df42-bf5e4125258a@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Tue, Apr 07, 2020 at 05:04:17PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> 
> > >   static int geni_se_probe(struct platform_device *pdev)
> > >   {
> > >   	struct device *dev = &pdev->dev;
> > > @@ -845,6 +868,34 @@ static int geni_se_probe(struct platform_device *pdev)
> > >   		}
> > >   	}
> > > +#ifdef CONFIG_SERIAL_EARLYCON
> > > +	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
> > > +	if (IS_ERR(wrapper->to_core.path))
> > > +		return PTR_ERR(wrapper->to_core.path);
> > > +	/*
> > > +	 * Put minmal BW request on core clocks on behalf of early console.
> > > +	 * The vote will be removed earlycon exit function.
> > > +	 *
> > > +	 * Note: We are putting vote on each QUP wrapper instead only to which
> > > +	 * earlycon is connected because QUP core clock of different wrapper
> > > +	 * share same voltage domain. If core1 is put to 0, then core2 will
> > > +	 * also run at 0, if not voted. Default ICC vote will be removed ASA
> > > +	 * we touch any of the core clock.
> > > +	 * core1 = core2 = max(core1, core2)
> > > +	 */
> > I don't really understand this part. According to the comment if we vote
> > (let's say) for core2 but not for core1 then:
> > 
> > core1: 0
> > core2: GENI_DEFAULT_BW
> > 
> > core1 = core2 = max(core1, core2)
> >    or
> > core1 = core2 = max(0, GENI_DEFAULT_BW)
> > 
> > hence
> > 
> > core1 = core2 = GENI_DEFAULT_BW
> > 
> > What am I missing, why is it necessary to vote for both/all?
> say core1 is for earlycon usecase
> 
> There is common switch to control both the QUP core clock. I guess most
> appropriate description would be     switch = max(vote_on_core1,
> vote_on_core2) + default_vote.
> 
> During early bootup, vote_on_core1 = 0, vote_on_core2 = 0;
> 
> As earlycon was working even without voting it's core need because there was
> some default vote present on the core switch by ICC during bootup.
> 
> So if any child(say SPI) of other QUP wrapper resumed and suspended before
> earlycon wrapper comes up. This will make core clock to run at zero and will
> cause NOC issue because vote_on_core1 = 0, vote_on_core2 = 0; and it seems
> default votes from core switch is removed  ASA it's voted on any core.

Thanks for the explication!

You are probably totally right, but for some reason my brain still resists
to get it ...

With the above my current interpretation is (assuming earlycon only votes on
core1):

                      core1   core2  default  switch
early boot              0       0        1       1
SPI resume (core2)      0       1        0       1
SPI suspend (core2)     0       0        0       0
earlycon init 		1	0        0       1


What is wrong in the above table?

Thanks for bearing with me :)

Matthias
