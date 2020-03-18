Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E68D918A069
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 17:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgCRQXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 12:23:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46717 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgCRQXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Mar 2020 12:23:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id d23so27724115ljg.13
        for <linux-i2c@vger.kernel.org>; Wed, 18 Mar 2020 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ja7Isx1qNRnszRlhqWYZPhKFCaFnUP2LrFZhTedcFrQ=;
        b=b82SPi58sEkLQE2lbsmcxURwnmn9qYF8lDLIg6NXyBewO65Gqa3PSz3Y7uDPmz0s41
         xblIbkLP1+55SroiFqDeKplQmH8gr40cNkMg4K7scZYRVoIOZz52x/TkxhPsh8wixtEu
         UYEEAOrEkDWEzhSUqvIsXg4/XjxuC/8kiq1sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ja7Isx1qNRnszRlhqWYZPhKFCaFnUP2LrFZhTedcFrQ=;
        b=O/fE0SIHrZvh6Xs8+wM2867wKJTghOi1czPYpcRWbvuEf15VG0gxCVaRaJTEr2HZWI
         zXEUvKlcywiiW+iKdkn5/QL/zUAp4GQ/YECE6/QpPiJXXKOBhtjen7GWe9kD52G8PFdc
         j2zm4Yl4bxSwP980c7rNfO5rdttL3YGpfocXFBmSO5Ak+HIKnfasdN3FACHKJGKBxlHi
         Ls6z3ECQpoopXfZN+FtbPSWOm87Mdd1loFfNSezAA06XgQVfEjNC1MnigI9r8ypDLVPT
         9xZcHsmI7WF6aQISC2+0uqmI2IJ32RiYKjgO0N1PZk+1Niyi0rnISTdYZi6ZpXkFQFCE
         /jRA==
X-Gm-Message-State: ANhLgQ3SK2MV16j+3lU/y+43slJMKdBSffY2vXsvUu4Gp5WvjvOc0O0a
        7j5WjVtDX7s0GRNQj5KDO1mP/OOxRrA=
X-Google-Smtp-Source: ADFU+vua2ZrAoHN4YIxJVX5U+HXsM0CWw8hKmLdp8rVtM60lLvCJ93Gza8bpdFqZMohPW/p99prqEA==
X-Received: by 2002:a2e:8899:: with SMTP id k25mr2794486lji.24.1584548583319;
        Wed, 18 Mar 2020 09:23:03 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id s10sm5091592ljp.87.2020.03.18.09.23.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 09:23:01 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id m15so2909425lfp.2
        for <linux-i2c@vger.kernel.org>; Wed, 18 Mar 2020 09:23:01 -0700 (PDT)
X-Received: by 2002:a19:3f4b:: with SMTP id m72mr3336660lfa.104.1584548580649;
 Wed, 18 Mar 2020 09:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com> <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
 <CAE=gft5GcOeQ5kh1bGen_P0J98g2XaAJ7NrDsxkirDoLtL4GWg@mail.gmail.com> <0c7c4316-e93a-537c-871a-b7207dbad5c2@codeaurora.org>
In-Reply-To: <0c7c4316-e93a-537c-871a-b7207dbad5c2@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 18 Mar 2020 09:22:23 -0700
X-Gmail-Original-Message-ID: <CAE=gft6=rziOr+-mwHZO+ebQBDDMXMqvCFyuHwOoWjhuK8kaUg@mail.gmail.com>
Message-ID: <CAE=gft6=rziOr+-mwHZO+ebQBDDMXMqvCFyuHwOoWjhuK8kaUg@mail.gmail.com>
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

On Wed, Mar 18, 2020 at 3:57 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Evan
>
> On 3/18/2020 12:38 AM, Evan Green wrote:
> > On Tue, Mar 17, 2020 at 3:58 AM Akash Asthana <akashast@codeaurora.org> wrote:
> >> Hi Matthias,
> >>
> >> On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> >>> Hi Akash,
> >>>
> >>> On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
> >>>> V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
> >>>> to reset at boot time.
> >>> The v1 patch isn't relevant in the commit message, please just describe the
> >>> problem. Also the crash only occurs when earlycon is used.
> >> ok
> >>>> As QUP core clock is shared among all the SE drivers present on particular
> >>>> QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
> >>>> is put to 0 from other SE drivers before real console comes up.
> >>>>
> >>>> As earlycon can't vote for it's QUP core need, to fix this add ICC
> >>>> support to common/QUP wrapper driver and put vote for QUP core from
> >>>> probe on behalf of earlycon and remove vote during sys suspend.
> >>> Only removing the vote on suspend isn't ideal, the system might never get
> >>> suspended. That said I don't have a really good alternative suggestion.
> >>>
> >>> One thing you could possibly do is to launch a delayed work, check
> >>> console_device() every second or so and remove the vote when it returns
> >>> non-NULL. Not claiming this would be a great solution ...
> >>>
> >>> The cleanest solution might be a notifier when the early console is
> >>> unregistered, it seems somewhat over-engineered though ... Then again
> >>> other (future) uart drivers with interconnect support might run into
> >>> the same problem.
> >> We are hitting this problem because QUP core clocks are shared among all
> >> the SE driver present in particular QUP wrapper, if other HW controllers
> >> has similar architecture we will hit this issue.
> >>
> >> How about if we expose an API from common driver(geni-se) for putting
> >> QUP core BW vote to 0.
> >>
> >> We call this from console probe just after uart_add_one_port call
> >> (console resources are enabled as part of this call) to put core quota
> >> to 0 on behalf of earlyconsole?
> > +Georgi
> >
> > Hm, these boot proxy votes are annoying, since the whole house of
> > cards comes down if you replace these votes in the wrong order.
> >
> > I believe consensus in the other patches was to consolidate most of
> > the interconnect support into the common SE code, right?
>
> I think what Matthias suggested is to maintain ICC functions defined
> across I2C, SPI and UART as a library in common SE code.
>
> Still every SE driver will interact with ICC framework individually
> rather than using common SE driver as a bridge.

Right, I'm sort of proposing a blend here, where the individual
drivers pass through the SE library, which looks at some shared state,
and may defer sending the votes during boot time. I was thinking
consolidating this into SE engine library code may make it easier for
you to peek at that shared state.

>
> >   Would that
> > help you with these boot proxy votes? What I'm thinking is something
> > along the lines of:
> >   * SPI, I2C, UART all call into the new common geni_se_icc_on/off()
> > (or whatever it's called)
> >   * If geni_se_icc_off() sees that console UART hasn't voted yet, save
> > the votes but don't actually call icc_set(0) now.
> >   * Once uart votes for the first time, call icc_set() on all of SPI,
> > I2C, UART to get things back in sync.
>
> IIUC, you are suggesting to enhancing ICC
> design@https://patchwork.kernel.org/patch/10774897/ [The very first ICC
> patch posted during sdm845 timeframe].
>
> Where common SE driver aggregate real time BW requirement from all the
> SE driver and put net request to ICC framework.
>
> We received comments on that version of ICC to move voting to individual
> SE driver from common driver. Hence we updated the design accordingly.

I think most of the reaction to that original series came from the
fact that the common SE code was doing aggregation work, which is
something the interconnect core was designed to do. In the solution
I'm proposing, the SE library either passes through votes as-is, or
delays them until the console UART has voted, at which time it passes
them all down as they were.

You could still make the case this is something the interconnect core
should help us with, which is why I was brainstorming about the
provider propping up votes until some probe-finished deadline, maybe
just a 30 second timer :)
-Evan
