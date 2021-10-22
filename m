Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7A54373E2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 10:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhJVIuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 04:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbhJVIuG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 04:50:06 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9A9C061348;
        Fri, 22 Oct 2021 01:47:49 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 5so1086232edw.7;
        Fri, 22 Oct 2021 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqw/x/vCZKbqjafLM39rvi0on+kDAQS0f57EQg/oMGM=;
        b=SqMgUQ5JC2NqnLjncR7he30QQm6LqBBbJ6cIwA1IQqOw+af6qlYnX6Y5DdJWYKM3xX
         5cFn4E+3J2Wi9yoLyjh1v4O5Kge16fTRATfNGHCaNcmA5ykHxz7XUe0POknDB5rLoiVL
         q3ZHE0MS6MVkg6Hjkz2FlsFAWx7+PY1UQI5MkSGLqicVnnzD89p9n6iXh6XsoRBOifv5
         ezX5/s7wp0lqFI0u7TGci7K8IyqMH8npNsJ/EbuMJnmLBXcwgwzeo1xp3uId+E9vSmI/
         1P2+O6lRgKE+8Jvg18vtii+yNMuPUG+d9+rFrimNiqTMPZPQ45R5pOmRe3YLjSTvTJJM
         yltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqw/x/vCZKbqjafLM39rvi0on+kDAQS0f57EQg/oMGM=;
        b=2+qRgZKfmZONZcrWierQ8rG5myGa8Tag1kBpEP4ORc9J2vR4YpweDK+J/m2BNCXhra
         2ERp1cwzrCu/KekIg0tE2mjKgf8d6g7E3Qq2dHXfUvIIkzNx5J0XcL2vwj/byBRMLa65
         PPYTGqAnHMUDRZPHZHy2hmmtAtCz4vmE1h7r+CKfn1p9v76LapIkeap1lOxtOhIUMbbd
         P2NVlcXZaYqH4IC2ma0g43JEkEwSFMuug/Jc04r2F3v0roofC+OJx0NjCmW3VqQp0TRT
         Bwy7qJ/tMTg0Sy9zUSTeULnNIP3amgkTlCTzPUzF6rYq+baIFXByYrqLy6Nq1CB9hDqv
         /+aQ==
X-Gm-Message-State: AOAM531T/asMGcQR0RIWH9NIqs0brK8BYYgfE3nwg4F3pxWsUJF+m7Ml
        YowkFP6IxNKkVaqWdPBCVPi0XQWzncpvBKMe1p4=
X-Google-Smtp-Source: ABdhPJyGk3siQwyG3NqnEjN0QkNpukSjalEA+eN76UWN1FifKQqpLxgKBn6CkVIHGlTpv8P2bWenUiHQ4c67AdGnQtQ=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr13255982ejc.128.1634892467672;
 Fri, 22 Oct 2021 01:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211010185707.195883-1-hdegoede@redhat.com> <20211010185707.195883-6-hdegoede@redhat.com>
 <163415237957.936110.1269283416777498553@swboyd.mtv.corp.google.com> <4e5884d5-bcde-dac9-34fb-e29ed32f73c9@redhat.com>
In-Reply-To: <4e5884d5-bcde-dac9-34fb-e29ed32f73c9@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 11:46:51 +0300
Message-ID: <CAHp75Ve_xqgnaCqc3oyDMWDE9kVm8HNOEcdMuDkOD9epwgfWnA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] clk: Introduce clk-tps68470 driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J.Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@the-dreams.de>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 21, 2021 at 8:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/13/21 21:12, Stephen Boyd wrote:

...

> >> +       regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1,

> >> +                          (TPS68470_PLL_OUTPUT_ENABLE <<
> >> +                          TPS68470_OUTPUT_A_SHIFT) |

One line, please?

> >> +                          (TPS68470_PLL_OUTPUT_ENABLE <<
> >> +                          TPS68470_OUTPUT_B_SHIFT));

Ditto.

...

> > Also, why isn't this function actually writing
> > hardware?
>
> set_rate can only be called when the clock is disabled, all the
> necessary values are programmed based on the clk_cfg_idx in
> tps68470_clk_prepare().
>
> Note there is no enable() since enable() may not sleep and
> this device is interfaced over I2C, so the clock is already
> enabled from the prepare() op.

This reminds me other drivers that do commit the changes to the
hardware on bus lock, but I'm not sure if anything like that is
applicable here.

-- 
With Best Regards,
Andy Shevchenko
