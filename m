Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DD4394AFE
	for <lists+linux-i2c@lfdr.de>; Sat, 29 May 2021 09:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhE2Hvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 May 2021 03:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2Hvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 May 2021 03:51:47 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A37FC061574;
        Sat, 29 May 2021 00:50:11 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d78so4983798pfd.10;
        Sat, 29 May 2021 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/4SUnmRsEvEoCQbynPnIZ3E8JwoH+A1ueWYI0Pbiw9w=;
        b=Bx8aiW5rNAKwEkjR6SKvyEIJS+3ogOsQgjgj5HhuviojVf4zBkN8SX0VCChsDIMFzJ
         4zdsG/FTki/lsUulBvOrAKiG0KvApU5AY7Uhz3rWbsd/PnJWvd2rd1g1mb8rODPfXUJA
         JL/IPywG198E0YSDix9nYgnsRG13Rz2rpzvKO4c18jXFl0jIU4ekGgZCKNLhYYvcleXb
         F66vTtk/zXrf0j//zwfW4Q91nIdzDtap7ooTJHfiodeX7iCxiXZ5MEBoQj0IGIVqAVjy
         WxXWorabWE0Z4mHIel+lNu8sgk6Ugu9BaY/b3ly94U+l/AxPuJqjGCsg84MLKc/8EAp+
         UyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/4SUnmRsEvEoCQbynPnIZ3E8JwoH+A1ueWYI0Pbiw9w=;
        b=OXLRBcPViVlbPm6jUYyrG5h0BDCPAVr+1f2gDuiHaIJ9ZJq1C9g/I23re7zA7pt/QP
         5iT2hwFpLDVr1EGx3FWdvxwPy5ItGjbCfuK776ath8YxsAcEW048sJiQGIEPTlFflVoX
         Gs8QR7N58MBwz8lvpqk8J7IGi03sKVF9XvK9JbizjtJsoWkb2xPXxre9PJ8trSHHYJOY
         RfsfZnR06YIU4mcCaqPLdjY9EwtJ+M/4gZarilquK3CY+7ayKC5B1VX7VZXPOsGIDfrG
         uj0TxQwznxetJgQDsbZ+iRtLT6rr0ewKwf8YhjWtfobxMJxZwAbUCWnH9ytf5oyqGBtQ
         ee+g==
X-Gm-Message-State: AOAM531+LtXeUcmdDX9i/wjAtPVvP6EkRvGBH13gRXvXrOePP96TQu3+
        kX/LmmAa//bh493ODOxjKm5JPBXtWGq6W4yuwSE=
X-Google-Smtp-Source: ABdhPJyioiFRUFcnBijlM3oOsk3K1syg/1g997AAdbEmOsAdGRsW49ZQe0KKqQafR6H1BR4vIqJgB+00gcIa1h19Bco=
X-Received: by 2002:a63:b507:: with SMTP id y7mr12836118pge.74.1622274610413;
 Sat, 29 May 2021 00:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
 <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
 <YLD/ZQiX5VhpWJg7@smile.fi.intel.com> <YLECsC9y8ici47Ln@kunai>
 <YLEmJVbVwQaMk+dq@smile.fi.intel.com> <20210528181943.GR543307@dell>
In-Reply-To: <20210528181943.GR543307@dell>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 10:49:54 +0300
Message-ID: <CAHp75VcGMH53xDSQt257f-rfCMZidHfrVQuHd8T8A0zs9fzN5g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform data
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 28, 2021 at 9:20 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Fri, 28 May 2021, Andy Shevchenko wrote:
> > On Fri, May 28, 2021 at 04:48:16PM +0200, Wolfram Sang wrote:

...

> > Ah, I see. AFAIR Lee doesn't update his branch frequently, so it might be that
> > he already applied that but it's not visible to Linux Next.
>
> I'm not sure whether to find this funny or be offended.

Definitely not about offending anyone. Let's go with funny!

-- 
With Best Regards,
Andy Shevchenko
