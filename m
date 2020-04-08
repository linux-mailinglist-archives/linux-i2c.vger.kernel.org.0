Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91BD61A27BE
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 19:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730506AbgDHRJl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 13:09:41 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38579 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbgDHRJl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 13:09:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id p8so163673pgi.5
        for <linux-i2c@vger.kernel.org>; Wed, 08 Apr 2020 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AHziH+dvb20W54djSeStIqMRFUtsTKUD7rAxti8gSRo=;
        b=UfCqr7nW9oVwE/+3fDL2f/0drVAie/Gdd49JNzuAxmorHNRLKlrYPhlG11rr3bgejy
         xkUe3E27ZRhPnu1zmh6s8BOyTOxFWxFtBYB6VVdIzkwz1k1M39weBC9nYeM17DDXtam8
         cup6jFVztqp+DixZ5tXPe13GR4v5OaprUy27s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AHziH+dvb20W54djSeStIqMRFUtsTKUD7rAxti8gSRo=;
        b=q6FJPc2gzZAX1jtjv4hErgQ9JsqxC+W5gUCw4F+yHRlYiblUJiYani2/uAXEr0qPEe
         JHXuXEeQip9arjSb+CpiBf3pWPgQ868e5NRTEcofldkWjjEwMaTh2dvwK7VGNxeE2Fwi
         h0csK1rdwCMvbxlKrdj+qG7kxedhwNNHepwYVUPFl13Q4iZTTG2nE2I9q+jNsMG+5g59
         DukcC+aSYuc1AnLZ/lYwGPuYnKfpakrs1a4NYIhOX5rKoNv5TttrqRnzERjwGaa7DYot
         KEMQ2icOURnj5CXR4Iv7vMnC78aGQQ6SPQzKOCdq1mAKZq65W1Bngn7ieQTJ4yLQU0lW
         yCXg==
X-Gm-Message-State: AGi0PuaM4Y038DNxg3+z6HZNZOCeJUuHoCLYhMwj1bbXbZRkz7r0nkE3
        Fb+k/DZxwphWpVDpio0zLGJoRQ==
X-Google-Smtp-Source: APiQypKGNnlb36etT59dCY18zVMEKPnBzgK1wnTk5VhhNMgMuyWQeel0X5RkoYsKiR6opA9JBVYRoA==
X-Received: by 2002:a63:1f14:: with SMTP id f20mr7742513pgf.411.1586365778377;
        Wed, 08 Apr 2020 10:09:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s10sm2317753pfd.124.2020.04.08.10.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 10:09:37 -0700 (PDT)
Date:   Wed, 8 Apr 2020 10:09:36 -0700
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
Message-ID: <20200408170936.GR199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
 <20200331182457.GH199755@google.com>
 <7a4e13bf-a4b7-d75b-df42-bf5e4125258a@codeaurora.org>
 <20200407172604.GQ199755@google.com>
 <9e91aaa8-88f0-656f-b9f5-7e64014bad7a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e91aaa8-88f0-656f-b9f5-7e64014bad7a@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 08, 2020 at 05:08:01PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> On 4/7/2020 10:56 PM, Matthias Kaehlcke wrote:
> > Hi Akash,
> > 
> > On Tue, Apr 07, 2020 at 05:04:17PM +0530, Akash Asthana wrote:
> > > Hi Matthias,
> > > 
> > > 
> > > > >    static int geni_se_probe(struct platform_device *pdev)
> > > > >    {
> > > > >    	struct device *dev = &pdev->dev;
> > > > > @@ -845,6 +868,34 @@ static int geni_se_probe(struct platform_device *pdev)
> > > > >    		}
> > > > >    	}
> > > > > +#ifdef CONFIG_SERIAL_EARLYCON
> > > > > +	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
> > > > > +	if (IS_ERR(wrapper->to_core.path))
> > > > > +		return PTR_ERR(wrapper->to_core.path);
> > > > > +	/*
> > > > > +	 * Put minmal BW request on core clocks on behalf of early console.
> > > > > +	 * The vote will be removed earlycon exit function.
> > > > > +	 *
> > > > > +	 * Note: We are putting vote on each QUP wrapper instead only to which
> > > > > +	 * earlycon is connected because QUP core clock of different wrapper
> > > > > +	 * share same voltage domain. If core1 is put to 0, then core2 will
> > > > > +	 * also run at 0, if not voted. Default ICC vote will be removed ASA
> > > > > +	 * we touch any of the core clock.
> > > > > +	 * core1 = core2 = max(core1, core2)
> > > > > +	 */
> > > > I don't really understand this part. According to the comment if we vote
> > > > (let's say) for core2 but not for core1 then:
> > > > 
> > > > core1: 0
> > > > core2: GENI_DEFAULT_BW
> > > > 
> > > > core1 = core2 = max(core1, core2)
> > > >     or
> > > > core1 = core2 = max(0, GENI_DEFAULT_BW)
> > > > 
> > > > hence
> > > > 
> > > > core1 = core2 = GENI_DEFAULT_BW
> > > > 
> > > > What am I missing, why is it necessary to vote for both/all?
> > > say core1 is for earlycon usecase
> > > 
> > > There is common switch to control both the QUP core clock. I guess most
> > > appropriate description would be     switch = max(vote_on_core1,
> > > vote_on_core2) + default_vote.
> > > 
> > > During early bootup, vote_on_core1 = 0, vote_on_core2 = 0;
> > > 
> > > As earlycon was working even without voting it's core need because there was
> > > some default vote present on the core switch by ICC during bootup.
> > > 
> > > So if any child(say SPI) of other QUP wrapper resumed and suspended before
> > > earlycon wrapper comes up. This will make core clock to run at zero and will
> > > cause NOC issue because vote_on_core1 = 0, vote_on_core2 = 0; and it seems
> > > default votes from core switch is removed  ASA it's voted on any core.
> > Thanks for the explication!
> > 
> > You are probably totally right, but for some reason my brain still resists
> > to get it ...
> > 
> > With the above my current interpretation is (assuming earlycon only votes on
> > core1):
> > 
> >                        core1   core2  default  switch
> > early boot              0       0        1       1
> > SPI resume (core2)      0       1        0       1
> > SPI suspend (core2)     0       0        0       0
> > earlycon init 		1	0        0       1
> > 
> > 
> > What is wrong in the above table?
> > 
> > Thanks for bearing with me :)
> NP :)
> 
> I guess you meant QUP WRAPPER 1 probe by "earlycon init".
> 
>                       core1   core2  default  switch	Time
> early boot              0       0        1       1	0s
> SPI resume (core2)      0       1        0       1	3.2s
> SPI suspend (core2)     0       0        0       0	3.3s
> QUP WRAPPER 1(probe)	1	0        0       1	5s (say)
> 
> So switch is at 0 in time interval [3.3, 5] that will make core clock to run at 0.
> If we use earlycon during this time interval it will reset the board.
> 
> Did above answered the query?

now it finally made 'click', thanks :)
