Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F5C25F50C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgIGIZh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgIGIZe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:25:34 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAE8C061573;
        Mon,  7 Sep 2020 01:25:31 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so188222pjh.5;
        Mon, 07 Sep 2020 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huTocH0c6AWuhcspnjbzhvXx5R1T6amyle2EL/NOmAQ=;
        b=sGdAGvhAl7Jc8x3M8dAN33rd03W5377rpCRW/Xh1B3vFtfK2TCch5jZhAp8mk11viu
         koFELu5pmeZdYQNrNNPAo2OX9hDsz6boLc9brayMhSTNQbEshuHryVZnPqDK0YC32Hez
         fAs+/l8IONJU+Uz9Xd++BAxn2I1jqcZjqV6GzlaYyTWzhT2NrAv6a2bzy6Q6w1WENdu/
         CX0k7bikk2CQbcuwup/08qwgwUhfQ4ht5BDnRFpAnf7nagN4fiPjn46amOLEcTTCqPOp
         41ErRYMO/DtdoL0fa/Tkn+OFbyceNCVBWDBCNdr4AKRXN8MnxBDq/WrkC2HIgrLiewKz
         Guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huTocH0c6AWuhcspnjbzhvXx5R1T6amyle2EL/NOmAQ=;
        b=FCG8VRRJJRZN8N5blD1y10Xmm7Lhl8jO99V0y1H8Io8mwjtkLBydfR8Hh+U17hyUtm
         +YjSy5OYhQm7fgPDQuL7wEyKz5odS9e4rK1vX4y0WqaLkf/9k4ApoJV1ptftfgMt8peh
         KO205Gf1dA172LFg/zRDFMZZ7ca4OdBOfgVhIQy/gjaax2gY/euWxk6h48rGhzhN1m6k
         uES4jfF8hcRX3nuVwNk1jz3gmteBHrn0u0n2aN6pqRQxbG6pVV0Syprkki9HpDUzQ3iz
         05Lnw78pFmTd6S7d0pti188HzTR+SmLpBbnqxMCtO2rLqVWPj7MKJSvmYD74LNQZHJYd
         aIPw==
X-Gm-Message-State: AOAM531j2ZbP7GxnEVUzM6uxkiVYzV73qSm9K8DaoseEHS7v1LaB67kI
        OapNDLVbSvdCUzmmBTyqdwjzUjECYDEHqT2Puak=
X-Google-Smtp-Source: ABdhPJwx5us1CCOCtYm4MxqdLelLVzzLncyYVT6EDbAd4TmR6r0IebjIOAQviWl9XGOKShK2XZ/6UDR0gw5cI+/yOqg=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr20120964pjr.228.1599467130433;
 Mon, 07 Sep 2020 01:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-27-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-27-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:25:13 +0300
Message-ID: <CAHp75Vcv=0c_MxTmGLTvShYMz8-JecsMpqHp4mnPWYpPM9MFLw@mail.gmail.com>
Subject: Re: [PATCH v5 26/36] i2c: tegra: Factor out hardware initialization
 into separate function
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

On Sun, Sep 6, 2020 at 9:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Factor out hardware initialization into a separate function from the probe
> function. The only place where runtime PM needs to be resumed during probe
> is the place of hardware initialization, hence it makes sense to factor
> out it in order to have a bit cleaner error handling in tegra_i2c_probe().

...

> +static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
> +{
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(i2c_dev->dev);
> +       if (ret < 0) {
> +               dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);

refcount leak.

> +               return ret;
> +       }

-- 
With Best Regards,
Andy Shevchenko
