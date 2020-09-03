Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6968D25C3A7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 16:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbgICOzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 10:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbgICOLy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 10:11:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C862C061249;
        Thu,  3 Sep 2020 07:02:36 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id o16so1585564pjr.2;
        Thu, 03 Sep 2020 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=49A9aeIFdmHDcRIkQHriMpz6lE3JWxr0PldhLtC8qt0=;
        b=SQtt7SzKrG6DaNEyGfxX5XwoHo4i/dcT7LKhKfbmdlABg0wik2erYixTDgLZZifEtT
         lTWm34bIVf9bUCSATFdNaqWG9AVnQw9WMCtdTmUIY7punEno0HlE9nnZWgUP9HXBscDC
         uPdXWKZf6HL87EULVYTwckDAVO0uQbTSVR/mtsl2worIExzxv1wtSiGvWFx2XiagGNd6
         ZjlE2ItUxUCvlujUnF0W1k4HAv3+4fI8yvYjrevnO47xbB++Wuzh2Nqsxs50kLacDuwT
         lXckxwmX/+nN5gG0Ok0HxlpfiJpuO/EO8mNmpZu2AbYTWHPg+HmIIK3oVfqVcynrQBSq
         ugAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=49A9aeIFdmHDcRIkQHriMpz6lE3JWxr0PldhLtC8qt0=;
        b=WThqJp19wnNYy431ucOQoHQO7ttLpVS3kBoq7q+Ipy+G/EPseIobbZ/MfSgU0Vi6Lq
         JfgZvJYrEKmOPGRERtNzw44cmKK5AZFmjyBSvK802A5pGUlNU+l/3Qud7oQowf6bXJJW
         B0Lod57fzAzMEFdTe7U/Coinkgk6eOQ485NGAW1bFvwxoRy+DycGNTuny5NTzyE86l4o
         48rXupPdOlDUPk2gvzRcE9t0Z5chJZcP8roQh+kov4xEsUQXqK/w6dzE7e4a3Um5V4PH
         UkuUwmOMaBVx1y/c8VnbytJA6YDDVhd86mVGbRj87+UNNBiZSvNhFPs3/FIUUPAyggxj
         TuTw==
X-Gm-Message-State: AOAM531DnVQoqVmhz6FNANiDVTcYntRI0lcpQ3vzI1ILBuhb4gpv3Ihk
        yDwAb0a7ANUyWT6/CH6x3Dgg9ZZthPVES8n0V+U=
X-Google-Smtp-Source: ABdhPJwFgSljebq/SNlzE73+hLRfPqfCH28CvG+u4ut4f0+IKxAQOiTd2OW6REn+/uM8F8LH7Cs3l5w88lmhp1SSd4k=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr3543210pjr.228.1599141755915;
 Thu, 03 Sep 2020 07:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-10-digetx@gmail.com>
 <CAHp75VdPoJFNC+MntKu-CL8jFMEe85ZT3R9DF0aaNC4KjqWXyg@mail.gmail.com> <4bd12095-7a29-bcb4-6b49-83eca285c897@gmail.com>
In-Reply-To: <4bd12095-7a29-bcb4-6b49-83eca285c897@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 17:02:18 +0300
Message-ID: <CAHp75VerqMmyDnbxaWN0R-DYPkOosh-R9CG970Sh+EqG21oZ8w@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 3, 2020 at 4:48 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 03.09.2020 14:17, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Sep 3, 2020 at 3:54 AM Dmitry Osipenko <digetx@gmail.com> wrote=
:

...

> >> +       of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
> >> +       i2c_dev->bus_clk_rate =3D bus_clk_rate;
> >
> > Hmm... I dunno if Wolfram is going to implement a special helper
> > exactly for this. I remember we discussed that with him during v5.8
> > (?) times.
>
> I now see that there is a i2c_parse_fw_timings() which parses
> "clock-frequency" and other common properties. I could switch to use
> that helper, but not sure whether it would be really worthwhile because
> only one property is needed to be parsed. I'll consider this change for
> v4, thank you for the suggestion!

That's exactly why I was wondering about the current state of affairs
with the discussed helper which should only parse the clock-frequency
property.

--=20
With Best Regards,
Andy Shevchenko
