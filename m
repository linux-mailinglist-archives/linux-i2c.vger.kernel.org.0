Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02688193DB7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 12:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgCZLPe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 07:15:34 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37911 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCZLPe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 07:15:34 -0400
Received: by mail-oi1-f194.google.com with SMTP id w2so5127548oic.5;
        Thu, 26 Mar 2020 04:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhgWZHiLvCZQylXqPbfoONkgweSkSMwYvnlW8CKimmY=;
        b=H27aAFmq/ixt3ZZ281TizstbDIcAa3jQN/K0ssxoCFa/GP3z706a5EpoGsUBAGqAU6
         ArIKYztoaIM/Vu2kr9EkMZgovNVgoGviMrAv9u5GfIA4xvxzLBepi/+a2RNPBuc/PwtP
         Hdb7AFspOqCmhtvIDfqQdEU2MBt53IJgSYKjz+AIqQKJvmNjxJ9/yBTGxEa3IF/7kvq2
         WTFlEK3p4GhzBteegd3GsWCvpnLWuPlOf3iykDUqiyBMKaw7SwS4UF3oWtbVbKyxPSoM
         guFlVg2fq8mpkKiXtTD5S0Vb0SPZIqwFHdVDgNnt0tbvD/crcoMzVnX+ZPH1QcGCzSfJ
         3cFg==
X-Gm-Message-State: ANhLgQ3djQz0PKYQjqQLKown0ldY0IQQHr5XsS3mIalNdVvYNwvrSaq3
        VXqSPcZcGfE0c91YmtMoX9N0EEuALGqJhwbQdf7nxsgu
X-Google-Smtp-Source: ADFU+vtpW4xBBlP1DX7m28ITNU/n5RwmwkNCSP9Ck2I7ciP331jBEKSG3cvhSMmSDkjFegn1O6hWKTV32CjHkwshV/Q=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr1328778oib.148.1585221333668;
 Thu, 26 Mar 2020 04:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com> <20200326105241.GA1538@ninjato>
In-Reply-To: <20200326105241.GA1538@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 12:15:22 +0100
Message-ID: <CAMuHMdWmBE5qpouuJfJMvw_TuxbmnQd70CTH3RVaoK6k5eUcqw@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Mar 26, 2020 at 11:52 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > +{
> > > +       int ret;
> > > +
> > > +       ret = device_property_read_u32(dev, prop_name, cur_val_p);
> > > +       if (ret && use_def)
> > > +               *cur_val_p = def_val;
> >
> > Alternatively, you could just preinitialize the value with the default value
> > before calling this function, and ignoring ret.
> > That would remove the need for both the def_val and use_def parameters.
>
> I can't do that because if !use_def and ret, then the value must not be
> changed.

Of course the preinitialization must still be done conditionally:

    if (use_defaults)
            t->foo = DEFAULT_FOO;
    i2c_parse_timing(dev, "foo-name", &t->foo);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
