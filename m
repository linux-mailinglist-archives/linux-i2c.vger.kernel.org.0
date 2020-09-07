Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3D925F545
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgIGIbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgIGIbk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:31:40 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C842FC061573;
        Mon,  7 Sep 2020 01:31:40 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v196so8280379pfc.1;
        Mon, 07 Sep 2020 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=raMg+ZSUIovYhnJRZHPdsSxRiKrmsuNdVzy4GC7ybkw=;
        b=MqC1thIzB8xxpbWi5Hql0Y+4cU0U6d+GjaFsCGpTCrHe99YmDDRZzJRxPHuPmZbc1V
         yBfyPKdal/O0L/b8MnNd1DsQmqW0rst6gPTkqlLoKNOrgEpXF+iV1T30XXfK7BNd2JAe
         keMT4gGAiW4ueqvWGv3xadiGcQSm1c8QDC6Mp9RbSR9ZXTY+cSaH96sLBnZD0JLdMy9N
         1fCRK55iDBCx9jBsaOPwGQqhGxdyLJCUowA/NBuNNJ5+l426kfEL78n+p8ccQzeL9jwK
         kE0PCyiIaUCUT1BvYcRIYs6QxRxxeuRvBFTUQ3HTAkwbXXn0hVDg6YE3XLFlLClMDtsz
         3BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=raMg+ZSUIovYhnJRZHPdsSxRiKrmsuNdVzy4GC7ybkw=;
        b=bL1uNK8y7r78EtkSQt0d8k4vuA6+DTlfr9Qe1HBHpqxGufGOW0SddEfa9K6fWXFq+0
         lQMkr2LvCqM/BxT9hVLIwyPh3TJ5pR0xECpvSpnwPoOB3xNUTrm2RWs0rq7wsqUugd3+
         FQZsRrtOzIv9n/AyFyRTyNELKid3z1QMNjpvaZNbSfN9NOw0QsE3LcXZrMB0woKQ5K8Q
         bBxAzipP/84L5qC5btYAh2COy/bFWMgu1QU5cX0mz3h0vR5hh08IGY8rGr4EQgGd2s4H
         l2ywbMGNsHMjZy/hxQgrpFyIhSao67D496qYVdLS+KnD+nHez7QkRPKAsUX0eMj9lfT9
         knzg==
X-Gm-Message-State: AOAM530VqJlr6IEGO605y7RLtJGSDnFRyIzSUrZMZ0wBh755u+yIp3N8
        1gyw78kuDMecIxqqEAQAzVVxxqYLfQ6VmJTjTklrDRzXk70dyw==
X-Google-Smtp-Source: ABdhPJxl9PpwZtjUcXwvjYSoit4K15o3ULXO9GItuOBMypPQi5ccGgFkIfrvJI0I0kOAgItqFjRk6P2ON5wv/IEW0Es=
X-Received: by 2002:a63:d648:: with SMTP id d8mr15988989pgj.4.1599467500305;
 Mon, 07 Sep 2020 01:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-36-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-36-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:31:23 +0300
Message-ID: <CAHp75VcFA97CTJVJ_7m=BDp_Jqsf2O1EOVDZ3ju2ieQhMKG_8g@mail.gmail.com>
Subject: Re: [PATCH v5 35/36] i2c: tegra: Rename couple "ret" variables to "err"
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
> Rename "ret" variables to "err" in order to make code a bit more
> expressive, emphasizing that the returned value is a error code.

an error

Should go before whitespace changes.

-- 
With Best Regards,
Andy Shevchenko
