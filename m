Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8B41B8DF1
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgDZIeN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgDZIeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 04:34:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296E5C061A0C;
        Sun, 26 Apr 2020 01:34:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n16so7063133pgb.7;
        Sun, 26 Apr 2020 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vRNiq+/NQfiBUnPvQmwAiIXe8fXP7d+itUWKxcAk0Yo=;
        b=mcpvdZJ5h++8suUUwB4j2Dy+51AwFw41QJhjCGOwINduQf5ANP5Qi0877S0RcVL4WS
         30dEs3ZmJLuAWBlNnItJ9oWDFBO/L1/F5ZIpsFpD3oY9yKFNc2vK3tmWNDngZGok29fg
         OMldWH5oyVpVit8jprWG7MB/uoKfJWbZyAdLVCkYjtItCxv2MfjbNyx4mQ9OkUClGzF2
         gQPEuPS7QnkmxwfKmVqHQ/sjgTDYugx7PynTQwXID585G3YHYLQY/6thHxqZOaoMal5s
         q4t2xsWolsE8MrcDNNdwrl8mWeOSvA+BFnD+CHzUhulWhBK8ECt7UfBpec4XFI/UUUuE
         2HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRNiq+/NQfiBUnPvQmwAiIXe8fXP7d+itUWKxcAk0Yo=;
        b=CmVYLw5FF2MNGk8EUDez6npXk+yRYWi6BA9u1OwRAAEXmSWK4Rr2dEZIj/+LUNH1yB
         k2lpf2ZyTTR/KBI+b9HEYcXYTZ1wQ4wfIRR7REgMdWBQbTsgF8fLtxawtW24Tt9jRpoG
         lEFPsIxD2K8xYR0vemna4bv7pkXfKeoQd4op2aToO8mmVtj0CzubHBjHI+vEGJtihreC
         /+QGNBLjuZp2QCoT95fWxWe2eGwMkyoja9xps5jCWX58ahQJqgC0jsjGYSmOfhIZllws
         zk+6MtC3SWC7gvhYk8kn523vYKFu7vNo1E1id04q0d0mpPOHOwcfEAhMpoH3Zz9GeVnp
         YoAQ==
X-Gm-Message-State: AGi0PuZiyViisVl2mblJxwHA/TBk2HlaKRi28+RT32AIJ1x0u5GG5n3p
        nA/AjawH0fq1Gh6+iSJvlPG+EX6Pgb8I1Hk22Go=
X-Google-Smtp-Source: APiQypL4YQFKvFOwWEB7N1Bo6G7y3GfYOsKZHC638CwMbO85lOcARV0kEBd3ey4ZPrKvlbMHXpxdgynJJbeiOhv+5NI=
X-Received: by 2002:a62:f908:: with SMTP id o8mr17759939pfh.170.1587890051522;
 Sun, 26 Apr 2020 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200326210952.12857-1-wsa+renesas@sang-engineering.com>
 <20200326210952.12857-3-wsa+renesas@sang-engineering.com> <CAHp75Vfw4_0ttE2F-WxdULf7hRGsQvqzCLdCNVy7RBaFdEsCGA@mail.gmail.com>
 <20200425205407.GA6774@kunai>
In-Reply-To: <20200425205407.GA6774@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Apr 2020 11:34:00 +0300
Message-ID: <CAHp75VeRcT31WbVM6qXHFtT5aF+d6SbAVWVrH8g1_+ruNvv2sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: convert to use i2c_new_client_device()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 25, 2020 at 11:54 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Fri, Mar 27, 2020 at 09:38:21AM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 26, 2020 at 11:10 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > Move away from the deprecated API and return the shiny new ERRPTR where
> > > useful.
> > >
> >
> > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Thanks, Andy! Is there a platform-x86-tree where this can go in? Or
> shall I take it via the I2C tree?

platform/mellanox usually goes via other trees, so, feel free to carry on.

> Same question for the similar patch
> for x86/platform/intel-mid?

TIP maintainers usually take this. If I didn't tag it, feel free to add my Rb.

-- 
With Best Regards,
Andy Shevchenko
