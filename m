Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84ED43923B8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 02:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbhE0AXF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 20:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbhE0AXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 20:23:04 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAAAC061574
        for <linux-i2c@vger.kernel.org>; Wed, 26 May 2021 17:21:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q7so5271565lfr.6
        for <linux-i2c@vger.kernel.org>; Wed, 26 May 2021 17:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lRcwXTkXFqjHbLkGyM+Iivo9S+3vdfLIMeWV2k96/WM=;
        b=IcdHg9mtSIbKyQXE7To2tKBA5bjosTWl12QMBa/kT2sO6/0yLESdYBXhe/muIyLQvv
         SDfxb7HhzfyCzr9groZNH5cT/VyTZl+SFMrPNtiEYC80BuIcBHt/CM1kcnTlXc+I52cG
         jJ1rp51adY7ITDDDwKFKiWxeZT39YuNeKEVY4REpR8JJYwXY4P1GOdyACypnwShNTwEd
         UuhGQL0rwxBHlC7RyWiqRpIcoHfVpGk94e9HrlqlLBoXJCms4y/o4Q5FkRume2lEACxC
         Da4Wq0MKqA3qZYSDTd1OpR2yt47XE9w50Lzs/MgUpwmmqbDytgeEaYc9J96rcf114kvY
         /82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lRcwXTkXFqjHbLkGyM+Iivo9S+3vdfLIMeWV2k96/WM=;
        b=CJ5WzYWee0bTK+Q+GVRNfbL3MGQDvoaAW3nGCZcZsWxfcWm4RzaYco8O6jl5jg+vHF
         kUl+Qiw4OKHVbQfqmsR9WiWwLVWsV+tONDv5Lk1G+UqrADUKhFoI1eWjBnRqtTIZ1mYO
         1XBsY7PyJw2uDvmPoqHMCyJKrlMY78Ws3ZZEAxSDBEHP2Y2kHdnXNrMmlq/EcF42Zn80
         DhTIUysi5U9tcvv58athGxIb2KkXntPA1Qgasn5rrQhPEzNpjW/kHMPDP4T6l3r71RcU
         pKJqxDSKlvTKOgEJJIuGkB+ps6prbm2+95FHRMh+BxXJ8hbL4v2M1mHxeJ48Lo2xWEpv
         djIA==
X-Gm-Message-State: AOAM531CqymswNOaH3gDFXhO2/2sYAcziVgovVLDrZa2LUUY6PqWAgbw
        62iQcUQuZHoKNK0OrYAVGenGGl5aRK3rEc/zh+3K5A==
X-Google-Smtp-Source: ABdhPJwrZ46JCTawi7sfWZOjm1/sDDo4oQx316hZrft4mHIMt1cbwJe4Y1fVtf3CXaYRK3O8LpBxZyR4eEcnsnV+p28=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr457753lfd.529.1622074889945;
 Wed, 26 May 2021 17:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190105.3772683-1-lee.jones@linaro.org> <20210520190105.3772683-2-lee.jones@linaro.org>
In-Reply-To: <20210520190105.3772683-2-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 02:21:18 +0200
Message-ID: <CACRpkdYj=kU6ix5GoTYc4bKcskoJM1mmmSbKMW4yEjRy4f3Zwg@mail.gmail.com>
Subject: Re: [PATCH 01/16] i2c: busses: i2c-nomadik: Fix formatting issue
 pertaining to 'timeout'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 9:01 PM Lee Jones <lee.jones@linaro.org> wrote:

> Fixes the following W=1 kernel build warning(s):
>
>  drivers/i2c/busses/i2c-nomadik.c:184: warning: Function parameter or member 'timeout' not described in 'nmk_i2c_dev'
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
> Cc: Sachin Verma <sachin.verma@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
