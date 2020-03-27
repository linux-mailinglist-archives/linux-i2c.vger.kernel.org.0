Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 226B91961EB
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 00:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgC0XaL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 19:30:11 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:40907 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgC0XaK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 19:30:10 -0400
Received: by mail-qv1-f67.google.com with SMTP id bp12so1805000qvb.7
        for <linux-i2c@vger.kernel.org>; Fri, 27 Mar 2020 16:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O1GvI+xFM1FBiQL/lNsi04NXxyujijnrO0wFrw3iEaA=;
        b=AoOqU2Iw5iNjiMKPZrMi6dHRRUePrxjxp+Qtr1vJ+IrlU9XiomgunWPNb48nax0B5q
         S2s5VpjjKmpZ2vmRzwc7FYK8BGF+dsEOJrJpu8EsyvdA4WdeDwNSNfFJgaEhVaN7ikJ0
         6/397mTiLc3gUu6I5ER1bxg7KTyf/IdJLee/Elk+o1C0xmQg668B0wMbsRxqhWdWoDyI
         my8bhwZE9ueVvSl4AC1JpfZhb36Fvo9asb3J6zMLTRrqbFJgUOPNC+wm+9Hzf0Kymc8L
         6Yc6Oxfkp2wuTsot7ErcvaiFvyWqjyC5SJTA1/Dvq8CWggN4fvgq0vfRxnn8N6fm54aS
         a+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O1GvI+xFM1FBiQL/lNsi04NXxyujijnrO0wFrw3iEaA=;
        b=t8lOMDXCY4gIdLUQI+rFo1UMFlgedoMFXK4UyTWhUnH3I1f3p0aXJf+2KPdVIOpA5s
         0pCCFiH+zUJ8tayDlBdciY3hTBgXGfI0LYsJByu3SCkgQnCwBAaz6ArZvNYd+XHS/Gla
         J8tMi/woyimy1ieGK+UjnKcc34Ncgt6z7xdT+f+0sBE5wxD0GX3tpo9l/1cZCLg/vV9L
         M5NqpMfpLSmvmrD3ESnhvRL1OQvMdUcxPRYoWfG9cc3E1zKjGEU2RriO5hNIeICA0oVD
         Dm1iq3M31elBulOWHR+GkH/qlkirL8fL89Wk2MHaDJ2mDDwHMy/t7ETvviP7Ye660aW8
         DkTA==
X-Gm-Message-State: ANhLgQ3sOYbjoeraUnv5pHuyzz24KdqdhgYlbfFE52wfyWhqT0qMIxlv
        nfCN3nkvzsjSMcWGnx+ap+7cS5KwQuc=
X-Google-Smtp-Source: ADFU+vuoqh2rq3JlGCXgjP8/hQAqhr+Zh5UniIICv8++F9RDKUVsGBejmVNWlonpv7SUXCWSkRpL0g==
X-Received: by 2002:a62:1dd3:: with SMTP id d202mr1654818pfd.47.1585351421886;
        Fri, 27 Mar 2020 16:23:41 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m7sm426908pjb.7.2020.03.27.16.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 16:23:40 -0700 (PDT)
Date:   Fri, 27 Mar 2020 16:23:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, wsa@the-dreams.de,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200327232338.GL5063@builder>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com>
 <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
 <20200317182910.GR144492@google.com>
 <3831b33c-93ee-e5e0-fcfb-530b4738f930@codeaurora.org>
 <20200319194332.GA60149@google.com>
 <a7227a1f-00a1-0818-80f3-904fe264f864@codeaurora.org>
 <CAE=gft6AGkcdUAkoyevZgmtBgaiEkoQzzJcg7sYjbpy5Kh2fyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=gft6AGkcdUAkoyevZgmtBgaiEkoQzzJcg7sYjbpy5Kh2fyA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 20 Mar 09:30 PDT 2020, Evan Green wrote:

> On Fri, Mar 20, 2020 at 3:22 AM Akash Asthana <akashast@codeaurora.org> wrote:
> >
> > Hi Evan, Matthias,
> >
> > On 3/20/2020 1:13 AM, Matthias Kaehlcke wrote:
> > > On Wed, Mar 18, 2020 at 02:24:35PM +0530, Akash Asthana wrote:
> > >> Hi Matthias,
> > >>
> > >> On 3/17/2020 11:59 PM, Matthias Kaehlcke wrote:
> > >>> Hi Akash,
> > >>>
> > >>> On Tue, Mar 17, 2020 at 04:27:47PM +0530, Akash Asthana wrote:
> > >>>> Hi Matthias,
> > >>>>
> > >>>> On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> > >>>>> Hi Akash,
> > >>>>>
> > >>>>> On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
> > >>>>>> V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
> > >>>>>> to reset at boot time.
> > >>>>> The v1 patch isn't relevant in the commit message, please just describe the
> > >>>>> problem. Also the crash only occurs when earlycon is used.
> > >>>> ok
> > >>>>>> As QUP core clock is shared among all the SE drivers present on particular
> > >>>>>> QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
> > >>>>>> is put to 0 from other SE drivers before real console comes up.
> > >>>>>>
> > >>>>>> As earlycon can't vote for it's QUP core need, to fix this add ICC
> > >>>>>> support to common/QUP wrapper driver and put vote for QUP core from
> > >>>>>> probe on behalf of earlycon and remove vote during sys suspend.
> > >>>>> Only removing the vote on suspend isn't ideal, the system might never get
> > >>>>> suspended. That said I don't have a really good alternative suggestion.
> > >>>>>
> > >>>>> One thing you could possibly do is to launch a delayed work, check
> > >>>>> console_device() every second or so and remove the vote when it returns
> > >>>>> non-NULL. Not claiming this would be a great solution ...
> > >>>>>
> > >>>>> The cleanest solution might be a notifier when the early console is
> > >>>>> unregistered, it seems somewhat over-engineered though ... Then again
> > >>>>> other (future) uart drivers with interconnect support might run into
> > >>>>> the same problem.
> > >>>> We are hitting this problem because QUP core clocks are shared among all the
> > >>>> SE driver present in particular QUP wrapper, if other HW controllers has
> > >>>> similar architecture we will hit this issue.
> > >>>>
> > >>>> How about if we expose an API from common driver(geni-se) for putting QUP
> > >>>> core BW vote to 0.
> > >>>>
> > >>>> We call this from console probe just after uart_add_one_port call (console
> > >>>> resources are enabled as part of this call) to put core quota to 0 on behalf
> > >>>> of earlyconsole?
> > >>>   From my notes from earlier debugging I have doubts this would work:
> > >>>
> > >>>     There is a short window where the early console and the 'real' console coexist:
> > >>>
> > >>>     [    3.858122] printk: console [ttyMSM0] enabled
> > >>>     [    3.875692] printk: bootconsole [qcom_geni0] disabled
> > >>>
> > >>>     The reset probably occurs when the early console tries to write, but the ICC
> > >>>     is effectively disabled because ttyMSM0 and the other geni ports are runtime
> > >>>     suspended.
> > >> Code flow from console driver probe(qcom_geni_serial.c)
> > >>
> > >> uart_add_one_port--->uart_configure_port--->{ 1) uart_change_pm(enable
> > >> console resources)  2)register_console(boot to real console switch happens
> > >> here)}
> > >>
> > >> Console resources are not disabled from anywhere before the switch happens
> > >> completely. I meant to say until we saw below logs.
> > >>
> > >> [    3.875692] printk: bootconsole [qcom_geni0] disabled
> > >>
> > >> I think the board reset issue cannot occur during the window where early
> > >> console and 'real' console coexist.
> > > Thanks for the clarification! Indeed my notes were only a hypothesis, I
> > > don't see evidence that there is an actual downvote shortly after console
> > > registration.
> > >
> > >> I have validated proposed solution by me, it is working fine.
> > >>
> > >> Currently voting is done for every QUP and not only to which earlycon is
> > >> connect, with the above approach we can't remove vote from other QUPs.
> > >>
> > >> However we can limit voting only to earlycon QUP by removing interconnect
> > >> from DT node of other QUPs.
> > >>
> > >> I am not sure how clean is this solution.
> > > I'm more inclined towards a solution along the lines of what Evan
> > > proposed, i.e. delaying the votes (either in geni or ICC) until we
> > > are ready.
> >
> > Based on discussion I think the delayed solution is most suited if
> > implemented in ICC core because other ICC client might face the similar
> > problem.
> >
> > However for geni case I am more inclined towards below proposed solution.
> >
> > -----------------------------------------------------------------------------------------------------
> >
> > How about if we expose an API from common driver(geni-se) for putting QUP
> > core BW vote to 0.
> >
> > We call this from console probe just after uart_add_one_port call (console
> > resources are enabled as part of this call) to put core quota to 0 on behalf
> > of earlyconsole?
> 
> This seems ok to me. Earlycon sets up a vote, and then real probe
> tears it down. As long as in the shuffle of all of these things into
> SE library helpers you still have a way of differentiating the
> earlycon vote from the real vote.

Note though that the boot console will outlive the real console when the
kernel is booted with "keep_bootcon" on the command line (something I do
from time to time).

So rather than relying on "real probe" to signal when we can release the
earlycon's icc vote I think we should specify dev->con->exit in
qcom_geni_serial_earlycon_setup(), so that it will signal when the
earlycon actually goes away - and until that point the clocks should
just be on.

> In other words, don't reuse this
> early icc_path for the real UART vote. You should probably also
> destroy the path once you've voted zero on it.

Maintaining the early and real votes completely separate sounds like a
sure way to keep this sane; and there's no drawback on having multiple
votes for the same thing and rely on the framework to keep track of the
various users.

Regards,
Bjorn
