Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974DF258AC8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 10:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgIAIvq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 04:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgIAIvI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 04:51:08 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C259CC061244;
        Tue,  1 Sep 2020 01:51:06 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t11so209647plr.5;
        Tue, 01 Sep 2020 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xD7AOhYrDQ8kkfdgEvt/y0u2Xdwvh6fCgyljU9EIUyY=;
        b=FABgGNgVrC2WMjW6y8hwbXiuAPDyunDXT3GaLiIjvPsfYjB44e4eMEph/2pKD0Pe4e
         1zRS2pRn35ajG+jI42hIvtEIluvLJiQMOHOWoiC7kujTDm2kf8YDCEWgTWt2Zrs8u/Th
         U9PyZ7uvDi9Lxl5FaWgekWxmvgjMgizz65UUcQJKH3i0PLeAeFhwqtbVu8sf49nSoEsQ
         t5bi3wmPefDBB2LVUII2CdAZ0BoV0Mnn/eNj1/9kMLdPduaK3KCUUCQrYsgU3TdtWRsk
         2ceFG9pCOeScNIN3YOiD+eCb11t8KEBYvz5q1gpxvAXLGfvNxX6d3JQ71gMiSd2OQyzx
         g5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xD7AOhYrDQ8kkfdgEvt/y0u2Xdwvh6fCgyljU9EIUyY=;
        b=To0Sy0YPX5KYwi/KVrsjPWVB0BPBNGgjH2811aDw9N0TmoO1FK1vYzytTeHI1awF6y
         zf9XElZX+/NbYa3ZUJ13mBTyv78auMK8iBVqMZpGJZzoWtNG72cB7KLl2GWgFL45HIfg
         tSHR/LKHoeEKsETxMc9s+WlXaUAaDgMEr/Xv5/ZldI3wpMlaDNSrSkKWarFl2OGfVoJ6
         dP+T3gySc5k8k4ZtcOsQCMoIvlOYyvWO/FyWU/RiABRIWgfVq5wUB268rLF/Y9+BP5s9
         fUUYDWSGvs71TxBI9N7hoBlqwGELq8vMMSc3lN0N0On0TnZV/SI2YzwcFoOyg43HwqdR
         vDig==
X-Gm-Message-State: AOAM531QBsqZ20ZW4bIVPn2b6wEH3NUI7XbOqWOo8DRFd0wPPvQmdjWR
        lmq16ucL8Xv83TC8eRs3Kd0ln241IMUtObjn1V8=
X-Google-Smtp-Source: ABdhPJyksbW8OmcVYhvI14Fj54C4ihpatgb1J0h7uGF9RmYSFYWKfDks9WtvUKyN5qid4RP56VPjpQK04UwFSUAGBaM=
X-Received: by 2002:a17:902:bc85:: with SMTP id bb5mr481240plb.303.1598950265536;
 Tue, 01 Sep 2020 01:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200901005713.27453-1-evan.nimmo@alliedtelesis.co.nz>
 <20200901082046.GO1891694@smile.fi.intel.com> <20200901084619.GA897@ninjato>
In-Reply-To: <20200901084619.GA897@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Sep 2020 11:50:48 +0300
Message-ID: <CAHp75VdGkHqr_bJ5f2hf0yfk5rTAdpNkBUzcM=JGHKgnhyo-=Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: algo-pca: Reapply i2c bus settings after reset
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 1, 2020 at 11:48 AM Wolfram Sang <wsa@kernel.org> wrote:
> > > +/**
> > > + * struct i2c_bus_settings - The configured i2c bus settings
> > > + * @mode: Configured i2c bus mode (PCA9665)
> > > + * @tlow: Configured SCL LOW period (PCA9665)
> > > + * @thi: Configured SCL HIGH period (PCA9665)
> > > + * @clock_freq: The configured clock frequency (PCA9564)
> > > + */
> > > +struct i2c_bus_settings {
> > > +   int mode;
> > > +   int tlow;
> > > +   int thi;
> > > +   int clock_freq;
> > > +};
> >
> > This is a good candidate to have it in generic header for sake of the
> > unification. Possible users:
> >
> > struct tegra_i2c_hw_feature
> > struct cci_data::struct hw_params
>
> Could be evaluated, but outside the scope of this patch, I think. This
> is a bugfix, so a self-contained patch makes backporting a lot easier.

True, my point here is to think if we were beneficial of this
definition in the i2c.h.

-- 
With Best Regards,
Andy Shevchenko
