Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D2018C0A6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 20:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgCSTng (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 15:43:36 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36422 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbgCSTng (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 15:43:36 -0400
Received: by mail-pj1-f65.google.com with SMTP id nu11so1448158pjb.1
        for <linux-i2c@vger.kernel.org>; Thu, 19 Mar 2020 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AUrpvm7nUie7dQ0qT11wsqJbElri6+aRNCl7JJRNBOA=;
        b=My59+S7CI/GWdSKMy3K1BSkHqMaKH1SYAEBgY7D+oXZhLV3OuxRxwvtEk4EqOUQMHA
         h8pn+KPzD+jnwDzdghZ6bxbO5SkEFbP+Eb2E34MFXJdXzrML9McGCbRCRE7jBBURPwRZ
         3ODmgNveoAhbGTVSR2/N2Hcmd+r2KjUGphIU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AUrpvm7nUie7dQ0qT11wsqJbElri6+aRNCl7JJRNBOA=;
        b=myDOV+YZyqYBYpQqVyTM7LBcQCv8k1uK47eXBZnF03qAAUHzLaio1TZsgl0/5aspIC
         hEcx7ERFstbRxXJOwbzibG6enwHXnZQkUpHb1hb6XYBmhhcmBe/E3JtW+k1Zu82g/jXK
         xs3maLw+RvxaV8CV7aA4Pm3hIyVf8GL7uz8b4j+g76mPiEuhmx19I+9XA9AKTqjoqP7b
         DRQQciVqe2wHk5G2SQIb3ph3ezlV2XwiWZH9NGQCBINTTQF6cG/f4BGijqtsxNTNsbHy
         sjBp9aaghG8PX0+Om35mwIoyZ8un7CHrdQWCTKupLuZ2B2kIllDmJH4353vFWVuDEAKo
         naQw==
X-Gm-Message-State: ANhLgQ2PnXV0aLcgKJrKBKXbB1eDuXNdhsaVKFedkKPTvJdAsrWWIMov
        F+k8IKm5OaYFxNyK6xOHgTuRgQ==
X-Google-Smtp-Source: ADFU+vtsdT3busfKz6fGAHHD3V1l9Ghnb9/WDphQ22G1N//OaqyPJ8sNLSJMAiYmie0cCo6/Rbt3xQ==
X-Received: by 2002:a17:90a:9501:: with SMTP id t1mr5661674pjo.108.1584647014709;
        Thu, 19 Mar 2020 12:43:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d17sm3145653pfo.148.2020.03.19.12.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 12:43:33 -0700 (PDT)
Date:   Thu, 19 Mar 2020 12:43:32 -0700
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
Message-ID: <20200319194332.GA60149@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com>
 <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
 <20200317182910.GR144492@google.com>
 <3831b33c-93ee-e5e0-fcfb-530b4738f930@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3831b33c-93ee-e5e0-fcfb-530b4738f930@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 18, 2020 at 02:24:35PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> On 3/17/2020 11:59 PM, Matthias Kaehlcke wrote:
> > Hi Akash,
> > 
> > On Tue, Mar 17, 2020 at 04:27:47PM +0530, Akash Asthana wrote:
> > > Hi Matthias,
> > > 
> > > On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> > > > Hi Akash,
> > > > 
> > > > On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
> > > > > V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
> > > > > to reset at boot time.
> > > > The v1 patch isn't relevant in the commit message, please just describe the
> > > > problem. Also the crash only occurs when earlycon is used.
> > > ok
> > > > > As QUP core clock is shared among all the SE drivers present on particular
> > > > > QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
> > > > > is put to 0 from other SE drivers before real console comes up.
> > > > > 
> > > > > As earlycon can't vote for it's QUP core need, to fix this add ICC
> > > > > support to common/QUP wrapper driver and put vote for QUP core from
> > > > > probe on behalf of earlycon and remove vote during sys suspend.
> > > > Only removing the vote on suspend isn't ideal, the system might never get
> > > > suspended. That said I don't have a really good alternative suggestion.
> > > > 
> > > > One thing you could possibly do is to launch a delayed work, check
> > > > console_device() every second or so and remove the vote when it returns
> > > > non-NULL. Not claiming this would be a great solution ...
> > > > 
> > > > The cleanest solution might be a notifier when the early console is
> > > > unregistered, it seems somewhat over-engineered though ... Then again
> > > > other (future) uart drivers with interconnect support might run into
> > > > the same problem.
> > > We are hitting this problem because QUP core clocks are shared among all the
> > > SE driver present in particular QUP wrapper, if other HW controllers has
> > > similar architecture we will hit this issue.
> > > 
> > > How about if we expose an API from common driver(geni-se) for putting QUP
> > > core BW vote to 0.
> > > 
> > > We call this from console probe just after uart_add_one_port call (console
> > > resources are enabled as part of this call) to put core quota to 0 on behalf
> > > of earlyconsole?
> >  From my notes from earlier debugging I have doubts this would work:
> > 
> >    There is a short window where the early console and the 'real' console coexist:
> > 
> >    [    3.858122] printk: console [ttyMSM0] enabled
> >    [    3.875692] printk: bootconsole [qcom_geni0] disabled
> > 
> >    The reset probably occurs when the early console tries to write, but the ICC
> >    is effectively disabled because ttyMSM0 and the other geni ports are runtime
> >    suspended.
> 
> Code flow from console driver probe(qcom_geni_serial.c)
> 
> uart_add_one_port--->uart_configure_port--->{ 1) uart_change_pm(enable
> console resources)  2)register_console(boot to real console switch happens
> here)}
> 
> Console resources are not disabled from anywhere before the switch happens
> completely. I meant to say until we saw below logs.
> 
> [    3.875692] printk: bootconsole [qcom_geni0] disabled
> 
> I think the board reset issue cannot occur during the window where early
> console and 'real' console coexist.

Thanks for the clarification! Indeed my notes were only a hypothesis, I
don't see evidence that there is an actual downvote shortly after console
registration.

> I have validated proposed solution by me, it is working fine.
> 
> Currently voting is done for every QUP and not only to which earlycon is
> connect, with the above approach we can't remove vote from other QUPs.
> 
> However we can limit voting only to earlycon QUP by removing interconnect
> from DT node of other QUPs.
> 
> I am not sure how clean is this solution.

I'm more inclined towards a solution along the lines of what Evan
proposed, i.e. delaying the votes (either in geni or ICC) until we
are ready.
