Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F57925C4DC
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgICPTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 11:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgICL1b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 07:27:31 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A597C061245;
        Thu,  3 Sep 2020 04:18:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w7so2075460pfi.4;
        Thu, 03 Sep 2020 04:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYHgOYFkdCbGZWuPZrhfEhLKQCW87nGOndt8XY8lTCE=;
        b=YTmj5Nx/rxPJZhk7d9yLcM2eIv4s0d3h/2ZR84Em9iBxXXU+6fm3Z5kcFOSLY+Gsu+
         rnb+mSPFr38Rfgetp+MVqEa0Y5Z88781pr3jGwxI9aW9uIc2OIfhdOiAuEMz8ZwWRwrv
         Xtky8ninIqNZ1+nE5/RIr2SDFhktx6FZoCwZ/+NltoqGD8aKYsjsqajhIyssbPj2x/+N
         cNlWAUKA1jars5Ol/hlBfegnT3XpElC5fPQaZ/dSLZTKwBcP23I4SpXHLO0gD4BDMDd4
         TOjqdW4p/n2T6IddPecArk4zZSzmYuWcymqQTKaBEo+10kylkPek6mgPXylU1suF/uhb
         Dt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYHgOYFkdCbGZWuPZrhfEhLKQCW87nGOndt8XY8lTCE=;
        b=I3u4r+FcqjlHj7nPPkNEwEWzHmvcf8EjDtN304Quv9b4+WZ/ITteW9LgnX+XcAi6SQ
         v86HrdHW4Xxf7sLS8cYb8wwmG2AsQT26IjJfL9mrk0XQcyIdTaBiO6bEyesrubXaR5tL
         x2dG2118VIj6nHVxqfm6NaqjCvaYO8Eh6Tepkuz4ft6lWMYZPhgOxAuuUss25IUB04/c
         NgSLaPVRN+coCYviqo2XdrxgPHd6SRVfIorG2QyIL6Nj3P7DXmFJg0X3pzi1piA30muN
         6p/iKzX4Oxe4/rxsGE8PG4jjCT7yJ6gUrYzaJ2Zjo7+bYHTPRWQGssnJcZUYHqpVPOAp
         KdCA==
X-Gm-Message-State: AOAM532V1JSvji1X/vvCNY1hzml2LzMOi8IE78Ui7eLiF3Ubmf6j+X+a
        nT0uj65eLsHwZQqkltWgLM3mT+NR74GB01HoBLKxrtJGX34=
X-Google-Smtp-Source: ABdhPJwb3eyvijxdRfrW78iIFLm79zpgRsDNv/ojUM5mIhB1AodbO4N0A4ueSIU1v6GyeE3AMG04UUsRMgbbuwovn94=
X-Received: by 2002:a17:902:56a:: with SMTP id 97mr3479518plf.130.1599131890968;
 Thu, 03 Sep 2020 04:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-10-digetx@gmail.com>
In-Reply-To: <20200903005300.7894-10-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 14:17:53 +0300
Message-ID: <CAHp75VdPoJFNC+MntKu-CL8jFMEe85ZT3R9DF0aaNC4KjqWXyg@mail.gmail.com>
Subject: Re: [PATCH v3 09/22] i2c: tegra: Clean up probe function
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 3, 2020 at 3:54 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The driver's probe function code is difficult to read and follow. This
> patch reorders code of the probe function, forming logical groups that are
> easy to work with. The clock and hardware initializations are factored
> out into separate functions in order to keep code clean and ease error
> unwinding.
>
> Driver now makes use of devm_platform_get_and_ioremap_resource() and
> platform_get_irq() which are replacing boilerplate parts of the code.
>
> The dev_err_probe() is now used for reset control retrieval because reset
> is now requested before clocks, and thus, BPMP driver that provides reset
> controls for newer SoCs may cause the probe defer.

> The error message of devm_request_irq() is removed because this function
> takes care of printing the message by itself.

I see no evidence of this.

...

> +       of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
> +       i2c_dev->bus_clk_rate = bus_clk_rate;

Hmm... I dunno if Wolfram is going to implement a special helper
exactly for this. I remember we discussed that with him during v5.8
(?) times.

...

> +static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)

Hmm... Don't we have something like devm_clk_bulk_get_all() or so?

-- 
With Best Regards,
Andy Shevchenko
