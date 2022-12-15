Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FB464DCB5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 15:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiLOOG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 09:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiLOOG1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 09:06:27 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B702183BF
        for <linux-i2c@vger.kernel.org>; Thu, 15 Dec 2022 06:06:26 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id y135so3534988yby.12
        for <linux-i2c@vger.kernel.org>; Thu, 15 Dec 2022 06:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWJCCGajjnlcSU0ERtJA2Tzyvj1nNyfPvgyo5xOAnh8=;
        b=ubJDRqoh84qjmY5+kL5diw37Q0xrZue0jX5Rml7ru2Qk59v6wd3pVEMfmLHkD1sje+
         Fdb7O2f0IpcXKwkmBsU7ZQX2rQ0noHJPcOmsAoI5ukTgLjrVnK2+jj3CiONpwJru+uV6
         MVjtZMhIqMRrpe3HAaSZdAkkKPSWV9Puoj3PjAHzC+fKM+2VXxelqwa4A5NfbGS6ZpQF
         kDi3dsk3mSAOe5JZVmHcAAx8ZcUcE8XrjhIta/Y27F5EZKr3qKyIXwForPHsutViy7Kf
         PBdSRsODCcSx2iy6F/jHBPMWNI//cr2THVaGyl7x1Q17Ysbszstw5dFN4jXvrm2I2TNr
         sPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWJCCGajjnlcSU0ERtJA2Tzyvj1nNyfPvgyo5xOAnh8=;
        b=DKflHAdL4L/AxU5Lh2PsvSFA8EaUYIIYKfJCfQI+jaK6wfpOlAD2WsW7xKTjSLSBO+
         BtQUEIEJyWGLeRqTN4qXTEng+e1lxCOL2BNhYpTaIlphfQmtcNIMsL9VwWacvMV4jDdv
         tZ6oBqS3CpR+GRny/D0FpHYEbWmfrpSmt/+M5fj4sgQUVVxWrjjzsvWV958XPu9vp3D+
         spmJwazqIxuMi4nSwRnyOzbvo2LQ2tJGcpfXxkYirxRe3bHs9GEViEoDYcwAxExOFVzH
         LPS47VufelSIQrcqUbLZUsuPQJ/3wSB9o1i3ILW2mFSzrMCDrjcZPpqHl7k4WN0jbVSt
         ApCg==
X-Gm-Message-State: ANoB5pky/9zxPFxIs2QqysZbM7GdJN1joQ0TDKFi9DosLV2r2zkb8AQO
        21XRqJH79gJaMEfHMNhqLMFgmgj8QFyCXxqBOSxcbw==
X-Google-Smtp-Source: AA0mqf5U7zUeucL6rTpOYLWEgHKQ98eZ+Z3r9sRKA3Dr2UNwEcOHPsyYDmrM6Wym9jMo7XUyPbYxIobVEOMzVTTw8GQ=
X-Received: by 2002:a25:738c:0:b0:703:25b7:67f3 with SMTP id
 o134-20020a25738c000000b0070325b767f3mr13142401ybc.54.1671113185408; Thu, 15
 Dec 2022 06:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214142725.23881-1-hhhawa@amazon.com> <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com> <Y5r2pZhe17dVBMme@smile.fi.intel.com>
In-Reply-To: <Y5r2pZhe17dVBMme@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Dec 2022 15:06:13 +0100
Message-ID: <CACRpkdbawj+Wg2D75MdZavcfyjRa2JRAvqROnNLVH7oMcZTdMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information
 from device pinctrl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Hawa, Hanna" <hhhawa@amazon.com>, Wolfram Sang <wsa@kernel.org>,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 15, 2022 at 11:28 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Dec 15, 2022 at 10:15:35AM +0200, Hawa, Hanna wrote:
> > On 12/14/2022 6:09 PM, Andy Shevchenko wrote:
>
> ...
>
> > > > +     if (dev->dev->pins && dev->dev->pins->p)
> > > > +             rinfo->pinctrl = dev->dev->pins->p;
> > > Hmm... I don't see how this field is being used.
> > > Can you elaborate?
> >
> > This field is used in i2c_generic_scl_recovery(), if it's not NULL then the
> > flow will set the state to GPIO before running the recovery mechanism.
> >         if (bri->pinctrl)
> >                 pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
>
> OK, but why that function doesn't use the dev->pins->p if it's defined?
> (As a fallback when rinfo->pinctrl is NULL.)

I don't understand the context of these things so can't say much
about it.

> > I saw that that the change failed in complication for SPARC architecture, as
> > the pins field is wraparound with CONFIG_PINCTRL in device struct. I though
> > on two options to solve the compilation error, first by adding wraparound of
> > CONFIG_PINCTRL when accessing the pins field. And the second option is to
> > add get function in pinctrl/devinfo.h file, which return the pins field, or
> > NULL in case the PINCTRL is not defined. Which option you think we can go
> > with?
>
> Getter with a stub sounds better to me, so you won't access some device core
> fields.
>
> Linus, what do you think about all these (including previous paragraph)?

A getter may be a good solution, it depends, it can also be pushed
somewhere local in the designware i2c driver can it not?
I am thinking that the rest of the code that is using that field is
certainly not going to work without pinctrl either.

Yours,
Linus Walleij
