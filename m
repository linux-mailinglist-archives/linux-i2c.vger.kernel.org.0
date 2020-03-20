Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB5818D4C7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 17:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgCTQqQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 12:46:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42463 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727492AbgCTQqQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Mar 2020 12:46:16 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so7106822ljp.9
        for <linux-i2c@vger.kernel.org>; Fri, 20 Mar 2020 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVeMWWgOR9TOsajWbE931ud3emvQ0ziFK5hlBW9OADE=;
        b=ZGRQRHVYCzH20glp+CuGONYp6DfLbf36SiaLFRCofD+cDdIUlqDIJFyII0gsPvuBtO
         hCqPw+nLaQvXF1wEZLoYIPhwNfGVkUUZtXGg05RoKCrMYcQutWHg+7zLOZ3+BSB+QIvY
         EV93/VSdJajMFJqONuXGVgXN27wm7h3uUh4yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVeMWWgOR9TOsajWbE931ud3emvQ0ziFK5hlBW9OADE=;
        b=PqF1a4ND/VZ6wqpxpNEhIhCYjSYge8ttAqjHb4h58Gt1LQz0Z2J9e4Owerqh4J/JZs
         NF7fioj5mffRqOrIls8xUP1ezf9eYMKVAoshBl2EnmDh+67npc24P/gNjrJI9h4lideL
         b1jtlsJg5A5MsL34c3n7kAcJRE7HYnZBgXDZrjIPSX0O0NJcClK3/7r41VXn19k1Qiq+
         QB9E7qE38dMjLM7t76rH74dkRItx2U6kKWD1uT8SMZ1a2/9RLjhBtDanwCoI6Z0jWo93
         RZaDb9q+SIAKCTdessY0+TVfD15QVtS0ct7vxEfBdY4MbS/4oxSInXdh9nM2qbR8+x5u
         N/AA==
X-Gm-Message-State: ANhLgQ1jjCBWoDXNxLT9uHq9SVhZ3Q6JW69dBleezyh9jvlAOE/RymaE
        o0gYakaGmIJNdYDRXoVFMQW4P68+T5M=
X-Google-Smtp-Source: ADFU+vtOi+8QFanoaQHHlPHeC4wABfV+YZhJeiPBnfIO5EsgMjF/8DEiUGZh4C3C2aBpsElRY6EVOQ==
X-Received: by 2002:a2e:90da:: with SMTP id o26mr6134167ljg.254.1584722772953;
        Fri, 20 Mar 2020 09:46:12 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id l8sm3768297lfc.31.2020.03.20.09.46.11
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 09:46:11 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id u15so6855889lji.10
        for <linux-i2c@vger.kernel.org>; Fri, 20 Mar 2020 09:46:11 -0700 (PDT)
X-Received: by 2002:a2e:2206:: with SMTP id i6mr5969667lji.208.1584722770463;
 Fri, 20 Mar 2020 09:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
 <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com> <74851dda-296d-cdc5-2449-b9ec59bbc057@codeaurora.org>
In-Reply-To: <74851dda-296d-cdc5-2449-b9ec59bbc057@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 20 Mar 2020 09:45:34 -0700
X-Gmail-Original-Message-ID: <CAE=gft5Uucr83DoQqaE7_8_H=ExnkPBQvRiUK_+LxOMeadam_g@mail.gmail.com>
Message-ID: <CAE=gft5Uucr83DoQqaE7_8_H=ExnkPBQvRiUK_+LxOMeadam_g@mail.gmail.com>
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 20, 2020 at 4:03 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Evan,
>
> +/* Core 2X clock frequency to BCM threshold mapping */
> +#define CORE_2X_19_2_MHZ               960
> +#define CORE_2X_50_MHZ                 2500
> +#define CORE_2X_100_MHZ                        5000
> +#define CORE_2X_150_MHZ                        7500
> +#define CORE_2X_200_MHZ                        10000
> +#define CORE_2X_236_MHZ                        16383
>
> These are all just 50 * clock_rate. Can you instead specify that one
> define of CLK_TO_BW_RATIO 50, and then use clk_get_rate() to get the
> input clock frequency. That way, if these end up getting clocked at a
> different rate, the bandwidth also scales appropriately. Also, can you
> enumerate why 50 is an appropriate ratio?
> -Evan
>
> -Evan
>
> Clock rate for Core 2X is controlled by BW voting only, we don't set clock rate for core 2X clock either by DFS or calling clk_set_rate API like we do for SE clocks from individual driver.
>
> In DT node it's not mentioned as clock.
>
> As discussed in patch@ https://patchwork.kernel.org/patch/11436897/  We are not scaling Core 2X clock based on dynamic need of driver instead we are putting recommended value from HW team for each driver.

Oh I get it. This is pretty opaque, since this table is saying "here
are the bandwidth values that happen to work out to a Core2X clock
rate of N". But it's not obvious why setting the Core2X clock rate to
N is desirable or appropriate. The answer seems to be hardware guys
told us these thresholds work well in practice. And if I'm reading
into it more, probably they're saying these bandwidths are too low to
be worth dynamically managing beyond on/off.

At the very least we should explain some of this in the comment above
these defines. Something like:
/* Define bandwidth thresholds that cause the underlying Core 2X
interconnect clock to run at the named frequency. These baseline
values are recommended by the hardware team, and are not dynamically
scaled with GENI bandwidth beyond basic on/off. */
-Evan
