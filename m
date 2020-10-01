Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18F928093D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 23:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgJAVLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 17:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgJAVLP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Oct 2020 17:11:15 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D42FC0613E2
        for <linux-i2c@vger.kernel.org>; Thu,  1 Oct 2020 14:11:14 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m13so98761otl.9
        for <linux-i2c@vger.kernel.org>; Thu, 01 Oct 2020 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m+YYuOGfjR+pz1ug1JOX4HfqWyfMVXMcD5ez2Q2W6EY=;
        b=fPG28hR3+ElDHaok1coAb15VBGOxPHvavjn1+R2FlD8REunHXkZlvsDfEGH9wiQaF2
         KvyY8Ze9/EThbpGscdJNDIMWBpg1/2tElBbq/9omzMP3EN6TPdZwGn649zkEKiVJ9Jwb
         W1jn97DnlnWyxRMBeA/fcnGrMzGABs4bb/r0g3jh7kYB2xorJADT8psq/Y+vsSmA+Y1K
         GaZhSJxk2gh2zpHyYVRCwUGmC8gdakJGc8PlRiK4gcJk0ihVf+ZuwNaG0NqHAQasV+zI
         xT7cOItLxZKesH2VycqKmgqh9slqqANIseUSv/Rk3cmRVp7zznL2PQBH+5DygN1ldF8o
         RueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m+YYuOGfjR+pz1ug1JOX4HfqWyfMVXMcD5ez2Q2W6EY=;
        b=XK7ryonnACSyBJwLSZw3LqFD2D1aw3BPBJI2LLZV7bhm5qVRQIIG+1e1xV0y/ciTXJ
         W/gLrmJcr2FiyGHsb97uwcjKPOq5U2JYJToOoCzXWOIS2Fy8H0TNn2N5vXKnceT7GTNn
         oPx654F6V0h2i/UeN+gLPe76o2neGz7rOmOPl8ekiRBaG9Fy7f/vMtbyZsFTQ8DEaAaI
         y93nsrElXzAwADEBVkL1aJm5mRp9vjhD6CLs1JZcVqC1euYLI8CIKByybVmXp0PQyf5x
         jSCgUJKTq8ThDlnysgIsIvOribTydD0O1bqKKDzDihxKegsdXnf9LxJFEIX4e5WU4tX+
         YP8w==
X-Gm-Message-State: AOAM533cjcti0+b6NUODMDiPyRqvZbGO2+u1ZYc2Gk+vMskxkgT9on/r
        Aq+KiplDVcIyzuv8DaEMbWFUTYEbi7ZHVt5Nn02aVw==
X-Google-Smtp-Source: ABdhPJxGJ6qQVW6nndRug8X+BSvf0baEKqe+DQDcXeAnDZDLc7BtQWlfudbLCsaMAbs7xkE+Dw/9iUIJKsv6dsfPnXs=
X-Received: by 2002:a9d:7448:: with SMTP id p8mr6252420otk.306.1601586673364;
 Thu, 01 Oct 2020 14:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com> <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com> <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
 <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com> <CAHp75Ver-O8=3eKHsHoKgpdd0sBQhLiC+UAqM=4C-gUfMBteuA@mail.gmail.com>
In-Reply-To: <CAHp75Ver-O8=3eKHsHoKgpdd0sBQhLiC+UAqM=4C-gUfMBteuA@mail.gmail.com>
From:   Alex Qiu <xqiu@google.com>
Date:   Thu, 1 Oct 2020 14:11:02 -0700
Message-ID: <CAA_a9xL98fV8Rd=vBLBZBcFCUo8iE6O=Q4WsOcB0Z-tFa1GtoQ@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 1, 2020 at 11:51 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> I see. So, there are following statements:
>  - the elaboration is good but I guess needs to be added somewhere in
> form of the documentation
>  - the internal schedules or so are not crucial for the upstream (it
> rather sounds like a bribing the judge)
>  - the current approach, if I'm not mistaken, is using debugfs, which
> is not ABI and it's good
>  - I'm not a maintainer here, but I don't like the approach
>
> Let the maintainer decide.
>
> --
> With Best Regards,
> Andy Shevchenko

Hi Andy,

That makes perfect sense. We may keep it downstream to unblock our own
work if it's not accepted upstream. Thanks for your review!

- Alex Qiu
