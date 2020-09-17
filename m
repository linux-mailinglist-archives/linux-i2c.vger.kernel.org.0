Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5DD26DD39
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 15:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgIQNzn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 09:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgIQNzm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 09:55:42 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30825C061354;
        Thu, 17 Sep 2020 06:54:46 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gf14so1265266pjb.5;
        Thu, 17 Sep 2020 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8arQyKVcFoMsxaf7+upG1bKHZzkRUlGuc4HZvvDOaUk=;
        b=pYH5L1q8tdSZGq8cqmfTaZ1G1cYVnO228V4zcBNAOMyQa1kemyvLm97FE+5JgBdNvg
         OmoMbWz0ddPcwtK43CZZDbRtSdTG5MjGNvRxK8JVfK8/vepCiwA5LXLTol4nNE/3/ElL
         O+iTolHoArRnMlUwvjTXE666N1dyNJtJEHtVunv2kqKT4tcEZgM7J6BPdHQuMqwY3uJo
         MG5MbDs9pRvZRbFJdTipJlZ6E9MZdiJmL/QtVjMtLMTz+8iRFa78p9KF57+Gpr+SsP8S
         Fd1FP1f4SFI0tFMqoqtJTpazWniArqTPuHUyAvMsRrRHoycFX6uooGMCGsfWqoDqhSV2
         zMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8arQyKVcFoMsxaf7+upG1bKHZzkRUlGuc4HZvvDOaUk=;
        b=MWHMKMP6mipI4k1ZT0LTSBrJPjWL6jrZrjkYd9YyRk+QxX+9Mega9GPijRJNIpE/MN
         zqm7YUwzFPLAdcQR8uz8M7tarH5AOG/wq8rCUEzFpfAai9HdKfYwn9xsGOlssfV+lYiu
         yHHTDiRLIUHe0OszYhIeyOvWu3lO6ALk41WmLQLjCEys5Qbncklg7Eyi10Q2bcKLSNY8
         BbH54UmTm1PkFBm6HnNmxFbacxJX652b5ESztOsKZ8+NESQSvGIkIOhs+gevpxBOQbJV
         R0k2pLY6Ukv8+3y8WaxOrmufI/XARSo5lloJS96E6BvlkogQqE3zOtyPgUbIQac8Kmhm
         vjyg==
X-Gm-Message-State: AOAM530Yyz6ral5Emf3ypGr3MabfYA3nKmo3/Drpjm+VSK+W9SODXtsa
        Dea2LCX4swe9iDg/OR5EbUImxOHjzTG/tSS06QE=
X-Google-Smtp-Source: ABdhPJzRw2jLHXiTRUSgRINrCCSrzIZPDYCK1UEUCky6r5Xib2G/udNWHIo9encUMcaQ9dPMVe/3runfRqhVJQJAMgE=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr8860381pjr.228.1600350885724;
 Thu, 17 Sep 2020 06:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200908224006.25636-1-digetx@gmail.com> <20200908224006.25636-13-digetx@gmail.com>
 <20200917113846.GX3515672@ulmo>
In-Reply-To: <20200917113846.GX3515672@ulmo>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 16:54:28 +0300
Message-ID: <CAHp75Vd_B9WLM99LnN2YiZ045z8SUkD7KwY2wVEUeQ9Mx7fg5g@mail.gmail.com>
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 2:38 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:
> > Use clk-bulk helpers and factor out clocks initialization into separate
> > function in order to make code cleaner.
> >
> > The clocks initialization now performed after reset-control initialization
> > in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bulk
> > helper which doesn't silence this error code. Hence reset_control_get()
> > now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
> > driver that provides reset controls and BPMP doesn't come up early during
> > boot. Previously rst was protected by the clocks retrieval and now this
> > patch makes dev_err_probe() to be used for the rst error handling.
> >
> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++---------------------
> >  1 file changed, 67 insertions(+), 120 deletions(-)
>
> This is tempting from a diffstat point of view, but the downside is that
> we can now no longer validate that all of the necessary clocks are given
> in device tree.
>
> Previously the driver would fail to probe the I2C controller if any of
> the expected clocks were not defined in device tree, but now it's just
> going to continue without it and not give any indication as to what's
> wrong.

You may print an error in the error path as previously. Since both
clocks are mandatory (as far as I understood the code) user will need
to check DT in any case.

-- 
With Best Regards,
Andy Shevchenko
