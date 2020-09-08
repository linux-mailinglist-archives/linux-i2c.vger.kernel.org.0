Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9240260DC4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 10:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgIHIku (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 04:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbgIHIks (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 04:40:48 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93754C061573;
        Tue,  8 Sep 2020 01:40:48 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u3so4439740pjr.3;
        Tue, 08 Sep 2020 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KC9tYnJwh82RhmK0pmp4QhAwulz+049YrDznSq/rF2A=;
        b=eER/9ny5yztJ/nnbbZqWoEAZPcpNczvrg8zmaqlohpkWRovwAGkggPpky3we9Sf2Mb
         F55YJUKlGF+yz/8ZLTajZE6MxIoqViAbCl1969YyFBPAan2JPzGO9RRBPfY1pGUQZqmc
         +Om38N1bo++C1z5vpu7fB+NqMiqi+egURX3uLh6ng99ZxmY9uhs9Sop6ZyoZPFNHF7qs
         PghL4+es2WSwc3/zXTi65OWFlq6TBmn5/Ge56HzQsee0Rna9G1G6AD8wcRf2EIG4cVYM
         zWez2OLHyjc5e0gjypjEzsC5DbbYfppDtA2xt5hg7ooosA4Yqs1uTVvC5H4CbDHcYz+P
         cLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KC9tYnJwh82RhmK0pmp4QhAwulz+049YrDznSq/rF2A=;
        b=H+9UqpRTaVUQ6KAGb4Vhmzs3OHbBWpUzapt0lD2cFIFKImIIijmbZ70VQRd3ydqZNU
         oZvF+1BVakWcHYBMZ9mYSIYX0wtcs10ExYIPmtvhMMd8KgNitq0FEuxF8QVJY0c2iMom
         IWfQSwiHKMhihT7//mrZyh82PU2lvdPdSNwfgaNVokBivAOZ1meMOdwcI24yq1ecjN4b
         s9hzq4eXRBofpFkh+i20obSzPlz3+jSNNJKvPYHKeABUw1WVd6g7DuecEPUe9VE40uRn
         OpbAWNPDYSZh/lT+Pq/8lPTGxakzcgMP3yUnrui06grm9/MNrMKO4gAlfE+s8/o9IjHy
         MDSQ==
X-Gm-Message-State: AOAM531SEY2sH5ySMYSrMAuzw0hHTW48H0RzTCFGfjzN2zWbSAMxhZhb
        JsipWKOCA3IL9NBEW6avGTuRmcke8ui6rwcf4Ww=
X-Google-Smtp-Source: ABdhPJz2NrrFuREYMpIBuEZRgttjzrXONj8B3hw50alF6es+7jbsUgnOot3te+0FHTtczRaEtqQyVzsOa0WDiLrvhew=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr3056664pjb.129.1599554447911;
 Tue, 08 Sep 2020 01:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200908021021.9123-1-digetx@gmail.com> <20200908021021.9123-15-digetx@gmail.com>
In-Reply-To: <20200908021021.9123-15-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Sep 2020 11:40:30 +0300
Message-ID: <CAHp75Vc9srPR1BYes9ZEo46gxV2BAhZ71ov_JZ_sHrmtgdAr-g@mail.gmail.com>
Subject: Re: [PATCH v6 14/35] i2c: tegra: Clean up probe function
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
> The driver's probe function code is a bit difficult to read. This patch
> reorders code of the probe function, forming groups of code that are easy
> to work with.
>
> The probe tear-down order now matches the driver-removal order.

> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
> code style across the driver.

You see, below is my point why leaving a temporary variable can reduce a churn.

> The "ret" variable renamed to "err" since it only carries error code and
> the new name clearly shows that.

Overall it sounds like you need to split this into a few patches.

...

> -       struct device *dev = &pdev->dev;

> -       i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");

> +       i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");

You see, if it had been simple 'dev', this line would have not been changed.

And so on.

-- 
With Best Regards,
Andy Shevchenko
