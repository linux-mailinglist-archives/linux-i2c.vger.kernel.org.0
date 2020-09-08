Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518E4260DDE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 10:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730030AbgIHIqA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 04:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729775AbgIHIp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 04:45:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56887C061573;
        Tue,  8 Sep 2020 01:45:56 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e33so9578437pgm.0;
        Tue, 08 Sep 2020 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9CmeY/WTDoYECSjvqqIxqdwSFM0WARVNjGLbs9KdPkQ=;
        b=RR5nnWXuJXQJb9BMiL3TX2LGldgr/CH4nU9KIiA0/jpKWegyEo1Bpp67zySDAMHni3
         zX0UwspZq0KVDxv72Yr7v+nTPWhsMfaTIeh7eA5ZHriCVVF+SVIvmfF5OzJtilPb55sj
         RFNSYZZT6+LIT+z18qVP/OfLjNoFxdBrXH85+YLMCVB82y613R/c0qbgpC1Qvc7GluDS
         DzD5OJp0UblvOB4MLHFU8fG7JE3/PSRNxN82tikp9KB/5YI+MUCpObY8oDZWlMECU39w
         L5rq53S9ISOHsku+00np1qCC1Y5NHe95iUI2S18FOHYvzumLUc4T9Tlq4r+HgvBaw+qh
         9r4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9CmeY/WTDoYECSjvqqIxqdwSFM0WARVNjGLbs9KdPkQ=;
        b=EPo7sgI3GQNdtgSmqaX8jYd9saBTRCnkxIJQAJAv5g9Yjfy00ETu4qaZDf9+dzKzIq
         zHB25+Icpa2Qs7bLF/QaaaMui/vmqI0iqlVVJwNEKV8mNBnJ6u1GUEBzDd+SUA+kfc+t
         SXC7LXoNfpvJEhXU2gGNZc+SBNRxHRqCOBnnHGjTfmV9IVMY8S823X0oiFhbViDFgWbf
         FMhGcYiDw2OsMi0K1eRifZCHohsY0U58lYAfhhox6fhbGEj6n+kLxDTOiSbFU3C9pAGK
         XqzdxRLy3+vmRYoqRzgqOQ476GVSVU5F9Zt7DXBGf3U26F7k3ABz8qu2zdt3XbozQz98
         htmg==
X-Gm-Message-State: AOAM533upLJ/l4dQo5ocLcsVCKcL/xvf8JpNOqEF7Td6srR8lNlxXECz
        dx0rtv/DZHggqYlZfHli1uTWRxEx+yV/c5Kt5Iw=
X-Google-Smtp-Source: ABdhPJwO4Jiln87NzX4UzdJDznGaPX+7YG0t3I4pVshrrtRG3atvAmMNnE/YGPS3Y/sRdxzOn1z4D+z0zrqglHza178=
X-Received: by 2002:a63:c543:: with SMTP id g3mr19781155pgd.203.1599554755929;
 Tue, 08 Sep 2020 01:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200908021021.9123-1-digetx@gmail.com> <20200908021021.9123-25-digetx@gmail.com>
In-Reply-To: <20200908021021.9123-25-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Sep 2020 11:45:38 +0300
Message-ID: <CAHp75VeVckiwqDpu8Qt+7Zh+YGiD2q4C6RrANTf5uF4gE99hPA@mail.gmail.com>
Subject: Re: [PATCH v6 24/35] i2c: tegra: Rename wait/poll functions
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

On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Drop '_timeout' postfix from the wait/poll completion function names in
> order to make the names shorter, making code cleaner a tad.

...

> +       time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
> +                                             50);

Why not one line?

-- 
With Best Regards,
Andy Shevchenko
