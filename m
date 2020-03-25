Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490041930B2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 19:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCYSxz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 14:53:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45814 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgCYSxz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Mar 2020 14:53:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id o26so1577597pgc.12;
        Wed, 25 Mar 2020 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0A8XwLK/VHei5BNSLIP6RyAAlYr0PTQ3mUKooO2YHBI=;
        b=lRUs5gXjxEoqkj3/if5a2+eHB3Ind5z4U93waFxX6C2QEaho1OmHCbTn6w3kJqmrsf
         zrDUxx73i5J8KwBO5S1V+hx9GySQTXzGAkJ3upVOVowTfBnu49udAiW/y844IdGedClK
         loRaz52mO50+7BX5vqOf86CiRhXFAceiVCgzU+dOcR89dabpTMxLvslKANhq0WAxcZZg
         45ve6G5zRJgMup1TmPq8jKMj3OdlJXKEOOBhKbr9Sjo/MCHm5x60TFVxK4281OPRHOwk
         3KE1NAALBMq4ydP/SB1Gn/MKu8LbM6XLamBKfdq03weClINJIji8s8YHQbCDJFK+pFtS
         +U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0A8XwLK/VHei5BNSLIP6RyAAlYr0PTQ3mUKooO2YHBI=;
        b=TosjpIzVAaeYKt72kBu+nI5nRxMr09HgGYrbm43h3BGcxwhMxA3koeDws8giKWQgQ/
         8LpOttTzknZkeu9+CdKgOJFo0+TZj5Z+2x9eRJ1PVYJQnTiTueHe1IAkOxGQfjccNvEV
         eAghES++wvjxVQwS+JD13ZqFWYbxz9F5jNJywIyecIs6AWxj6bb8eW3ynqygJJ0G8RvS
         CblVVdjH+AtND5g852411g60kEnECCopHKAYyFranZ9IavUn2XMt/DztOmRU/bLi5mWN
         KneICZQiNU2dp9KzJ7VtHeROE9dsQ04HMcfx9mz61+F8WZTmwHxBKfPqYF+4kLtDwoUf
         C8zA==
X-Gm-Message-State: ANhLgQ2zBx1ps2EQrWx5lHcbXHciM92R8oZ9gd619vU5/sd8r0rhRaZ1
        4jcnWF4L0phERvXW1B7NJBFUgmDsNTqf2GfCxJY=
X-Google-Smtp-Source: ADFU+vs5IGiqDBHOJuHFA5G0E6zEcgp/2GS7T1qnTQ7Iwf3xjKO0zWxnArLFNE7IurwGXRC7fD0ppU5owx2lakG1HzI=
X-Received: by 2002:a63:5859:: with SMTP id i25mr4349929pgm.74.1585162433449;
 Wed, 25 Mar 2020 11:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <1585161361-3408-1-git-send-email-alain.volmat@st.com> <1585161361-3408-3-git-send-email-alain.volmat@st.com>
In-Reply-To: <1585161361-3408-3-git-send-email-alain.volmat@st.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Mar 2020 20:53:45 +0200
Message-ID: <CAHp75VdPCWdpGo=2n9g0ivti-g2m4jZ=cG4BKHBLk8BVDzaCyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: i2c-stm32f7: allows for any bus frequency
To:     Alain Volmat <alain.volmat@st.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        pierre-yves.mordret@st.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        fabrice.gasnier@st.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 25, 2020 at 8:38 PM Alain Volmat <alain.volmat@st.com> wrote:
>
> Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> instead allows any frequency (if it matches timing requirements).
> Depending on the requested frequency, use the spec data from either
> Standard, Fast or Fast Plus mode.
>
> Hardcoding of min/max bus frequencies is removed and is instead computed.
>
> The driver do not use anymore speed identifier but instead handle
> directly the frequency and figure out the spec data (necessary
> for the computation of the timing register) based on the frequency.

...

> +static struct stm32f7_i2c_spec *get_specs(u32 rate)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(i2c_specs); i++)
> +               if (rate <= i2c_specs[i].rate)
> +                       return &i2c_specs[i];
> +

> +       /* NOT REACHED */
> +       return ERR_PTR(-EINVAL);

WARN_ONCE() ?

> +}

...

> -                       if ((tscl_l < i2c_specs[setup->speed].l_min) ||
> +                       if ((tscl_l < specs->l_min) ||

>                             (i2cclk >=
>                              ((tscl_l - af_delay_min - dnf_delay) / 4))) {

Perhaps squash above two to one line at the same time?

...

> +       int i;
> +
> +       for (i = ARRAY_SIZE(i2c_specs) - 1; i >= 0; i--)


Perhaps

       int i = ARRAY_SIZE(i2c_specs);

       while(i--)

?

> +               if (i2c_specs[i].rate < rate)
> +                       return i2c_specs[i].rate;

-- 
With Best Regards,
Andy Shevchenko
