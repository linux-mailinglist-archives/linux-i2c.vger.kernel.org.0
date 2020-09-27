Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775F427A2E8
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 21:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgI0TvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 15:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0TvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Sep 2020 15:51:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062A2C0613CE
        for <linux-i2c@vger.kernel.org>; Sun, 27 Sep 2020 12:51:24 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a15so6631099ljk.2
        for <linux-i2c@vger.kernel.org>; Sun, 27 Sep 2020 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=7byhznMTDMGNZWyHHBM3w4db+dAkh5PJbFVolAq7xGs=;
        b=XL9bbz2OVNOBaK4lzhkkFWRXVTJdIeeEe3fV4JrdrDk5RMWSM5q4fm+HPV88TQDmjg
         Qaw7IU/gSAcEcL0J5tjDdo33ic7AMvm/hm8Zdtsc6G0cfhySFoGp65ZXaopI0oJ3iQsJ
         skGeiqApTPUpUkpd8ki9nVFrLM3W5S3/lUEVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=7byhznMTDMGNZWyHHBM3w4db+dAkh5PJbFVolAq7xGs=;
        b=rpAWqtfINQ4UeGCg3RNNDMw/jQCNKZzng8NXER5MCXXLb2dg2pUhBxqRuQH0jzHJTl
         8TdYBvpI1Z1tHEuwC//VRXiX8UxjoKwrAOBVYa4PbSXUtLv0NRxFssrMlE0cP0elXXPk
         IlPyh1mCrLpbdAPT5siriii+xKCaNSpuN37ShCaMF5nKCY6+0dVs/2NS2SXXE48GOy83
         apwD/LMYaispP5jp2cw2M10LDlv0rLKTkhsu+E/B6SFtd3h3QBb4QbBT8uKLNQldP7SS
         +DDP42x3NcykYB1O79V+dET2sNBQYDfm/yqLxD+MdZLWb/wnRBaYibcxmZv93Bqr4h6i
         SuDA==
X-Gm-Message-State: AOAM533GI0z+10Wwxhn44xEmsP9/4dZ6B3jbAXluHEhocvCyewPVBctM
        MSo4Y7hxMkqnjghKMEcsjMuOMSxpo9GwYw==
X-Google-Smtp-Source: ABdhPJxR5juxQ69AnAiLRol+8v55dgtLAHTNhWOXNEagb7EEnLD8jk/NY/fQSrc2j1QbmqUXtv129A==
X-Received: by 2002:a2e:8ed2:: with SMTP id e18mr3751118ljl.466.1601236282125;
        Sun, 27 Sep 2020 12:51:22 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id l4sm5639675ljg.42.2020.09.27.12.51.21
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2020 12:51:21 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id z17so8607575lfi.12
        for <linux-i2c@vger.kernel.org>; Sun, 27 Sep 2020 12:51:21 -0700 (PDT)
X-Received: by 2002:a5d:6552:: with SMTP id z18mr14720929wrv.32.1601235874347;
 Sun, 27 Sep 2020 12:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net> <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net> <20200914094727.GM26842@paasikivi.fi.intel.com>
 <20200926123807.GA3781977@chromium.org> <20200927193900.GA30711@kunai>
In-Reply-To: <20200927193900.GA30711@kunai>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 27 Sep 2020 21:44:19 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
Message-ID: <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
To:     Wolfram Sang <wsa@the-dreams.de>, Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 27, 2020 at 9:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > I think we might be overly complicating things. IMHO the series as is
> > with the "i2c_" prefix removed from the flags introduced would be
> > reusable as is for any other subsystem that needs it. Of course, for
> > now, the handling of the flag would remain implemented only in the I2C
> > subsystem.
>
> Just to be clear: you are suggesting to remove "i2c" from the DSD
> binding "i2c-allow-low-power-probe". And you are not talking about
> moving I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to struct device_driver? I
> recall the latter has been NACKed by gkh so far.
>

I'd also drop "I2C_" from "I2C_DRV_FL_ALLOW_LOW_POWER_PROBE", but all
the implementation would remain where it is in the code. IOW, I'm just
suggesting a naming change to avoid proliferating duplicate flags of
the same meaning across subsystems.
