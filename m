Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3992D25F53D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgIGIax (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgIGIaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:30:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D59C061755;
        Mon,  7 Sep 2020 01:30:45 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z19so6100493pfn.8;
        Mon, 07 Sep 2020 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9h0lDrPWdRbWiaNLkxl77HakkIHCpLAE0bHCcA5vmcs=;
        b=bOGbMqniXGObpt2ofBeZZlBOy12k34ZVF9u94DBTUtAv4M7Ef/fpFgNKYvjqWbsm9i
         PhUXY4h+SdHOOCBfZ5Mo263d3johR/Hx3VHe9rl5kAPd32KMqR7QRD2M1PYcMr4zELq9
         i7X/Q6AqmQqrjqHbpoJeMTtR8O7lH80+C/QwIuNgWHqbyb96n2nw1hmZw4JRsih4q+fn
         H+N1Evv8jGIbaeRtekkSa5wMoOHNn8dwSetI0kAHdFDOoOmpiCWZHuZ/uAdtC3Y2QtI2
         y2cxC78uCD7m51+Q0wFq2Xby6TwxpBSGGgNyUbXLuLQ/TEjjjW+J6JuRegi2bz9MNv5a
         i6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9h0lDrPWdRbWiaNLkxl77HakkIHCpLAE0bHCcA5vmcs=;
        b=cD5PFcEGg5ziXVPTDfidCCRURJoAu3LqG5o7OIAiz6+bMXh51/3pTeBBL1dtkJYy/v
         WKYyKfEkLM4kS1dZ6/WGsLmvxg832yRqOLDa2Lm4CiOAPTBdW50Lg1lupu9AidLO39KB
         d6hLjCSJPO0frmaadxjMoTwK2vixPl9gVvehNyGKCF00pgDLraV1CtEnt+94im+XOjl5
         Jc0NIPANA6Xb3DWM4aXwkdQL4d0BnTmlrYEYz3keO+UD1mWmd/iUi+B7MCnC+O32FyKm
         mxCp/LWI/weL7ciN3wMyGJnL4T9f6QdmlkV6Sq02n/+LvRiiYB9MVEAgpEDU2MI1Nw7j
         vJBg==
X-Gm-Message-State: AOAM533zQH+DVbHqqfabAuWmkmETIqDVbsmU6/R6x99j/+MVb3KWNOjB
        wgfxHPZqJKhedHO3eNMKdWs2H+327MRkSJcEJQ4=
X-Google-Smtp-Source: ABdhPJyf6VObopwl4l8DgveExV0UocJ0XlI+7qEUvCwsLILjSx5kiwA87VDN1pttWtczUNTMzN6YxGJbWemNqmiOKlE=
X-Received: by 2002:a62:6083:0:b029:13c:1611:66c4 with SMTP id
 u125-20020a6260830000b029013c161166c4mr18035876pfb.15.1599467444839; Mon, 07
 Sep 2020 01:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-34-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-34-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:30:27 +0300
Message-ID: <CAHp75VeM5Nd5aC5zLHPHS5rYouNJQoKRBziJAikKUoDzLWvCFQ@mail.gmail.com>
Subject: Re: [PATCH v5 33/36] i2c: tegra: Clean up variable types
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
> Don't use signed types for unsigned values.

This is a potential semantic changer, so should go even before all
whitespace / comment cleanups.


-- 
With Best Regards,
Andy Shevchenko
