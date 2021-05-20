Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D3738B7A5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238506AbhETTfK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbhETTfK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:35:10 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7292C061761
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:33:48 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id t20so13659938qtx.8
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8G0uB0F2NEQKNMVrVQoid1N5+N7dmGBlMzWRHpJEjE=;
        b=kDONrh86vDKBFTcyz1CD3cz/Tb0aQ+GqykCRp/E8pJqPhug2KqL60svLYIqdu2WlFh
         kAcCc1V39WMLTg1+IEWvEGQ7tkkWqvTGsgSOq26jxTM5NjJ5JnfXihyBfEfa3S59ANBo
         lscZt3x58JxvHz52hU7MixzSVaR9ISakHYEJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8G0uB0F2NEQKNMVrVQoid1N5+N7dmGBlMzWRHpJEjE=;
        b=syAfQJE5rIGAJLyApy6nctkk0eeF7EtaXdvFI/ICOza6BTLORWDJOt32SI8HV1m4Oo
         BfQcRgu/3W2zEPXRX5Se46iQ4fYaaideungv2BzHoq4OxJCYKuKiDBjtVR+9eQze8XVW
         m8kQH/aPp2tKMhDacLfa21AUC7omj+yLFCiYyMaIRkZN7VrvlAF9ZvjqnjrjingoUoIC
         rw5yj8nydtfkxLLs4H42FYM/VfYswToFc1xm5iEb0ZxVk1Z+8E34Dc5sDhps3AnI4niO
         8B7OgPkPeMTBOHO/huuThqzznkpuRo3glQLUypEdrvDywrvCL4jhlmlHws2eS0hoOldY
         LoIQ==
X-Gm-Message-State: AOAM530atqRWViVJVoqmpLqaF4Zrw3rrV+HPO1qKOIOcWPCwJaFSLiCy
        rqdh4XGnztmn7H9YrWnfYDEftmFrZxz/vw==
X-Google-Smtp-Source: ABdhPJzg+Bv04XYXZC8Mq5+H211briE8wAY3AfDSDCRmWhVfEK/JimT80NjQx1mAb3IieBChlj+4Mg==
X-Received: by 2002:ac8:57c5:: with SMTP id w5mr6687943qta.166.1621539227680;
        Thu, 20 May 2021 12:33:47 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id f19sm2963362qkg.70.2021.05.20.12.33.47
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 12:33:47 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id n4so5896586ybf.5
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:33:47 -0700 (PDT)
X-Received: by 2002:a25:4252:: with SMTP id p79mr9576627yba.276.1621539226800;
 Thu, 20 May 2021 12:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190105.3772683-1-lee.jones@linaro.org> <20210520190105.3772683-3-lee.jones@linaro.org>
In-Reply-To: <20210520190105.3772683-3-lee.jones@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 20 May 2021 12:33:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJQQpa2BedjrmPFBebVY1Ay6=CFLmBhFFCV5ZEaQsq3w@mail.gmail.com>
Message-ID: <CAD=FV=WJQQpa2BedjrmPFBebVY1Ay6=CFLmBhFFCV5ZEaQsq3w@mail.gmail.com>
Subject: Re: [PATCH 02/16] i2c: muxes: i2c-arb-gpio-challenge: Demote
 non-conformant kernel-doc headers
To:     Lee Jones <lee.jones@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, May 20, 2021 at 12:01 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function parameter or member 'muxc' not described in 'i2c_arbitrator_select'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function parameter or member 'chan' not described in 'i2c_arbitrator_select'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function parameter or member 'muxc' not described in 'i2c_arbitrator_deselect'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function parameter or member 'chan' not described in 'i2c_arbitrator_deselect'
>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

No objections from me.

Acked-by: Douglas Anderson <dianders@chromium.org>

-Doug
