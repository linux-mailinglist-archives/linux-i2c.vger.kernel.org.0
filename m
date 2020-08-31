Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C3425725F
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 05:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgHaDfw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 23:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgHaDfw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Aug 2020 23:35:52 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9405AC061573;
        Sun, 30 Aug 2020 20:35:51 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id ay8so4086690edb.8;
        Sun, 30 Aug 2020 20:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Es49Pktfv7cyRBR2isn8kE0O0ZV8xR4yhOVye/VQUrk=;
        b=Np8eJ16yZ5iMi3JnVsjqeMJX6+O7o5Ri0YyeWM6xIP2rHgwlMYXKwdrjJFPowbg/BA
         Qnr2rsfVzQudIyB4cK4lD/oNRmPcWdr8Tm3bCZG9DNxyK38R0k0EkF38KUbtIzV7ScCs
         44b/yRnPTi24WZi3x+sC4lM5sLHPLrC56iNp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Es49Pktfv7cyRBR2isn8kE0O0ZV8xR4yhOVye/VQUrk=;
        b=NGfsUVZa9FUQ6OxsUJy2KpKcR+J8+eRIi7nzCFkji9gCERmr/Gw1vGuY69pclKrlUJ
         mt+KsfYM7I1hYEXnnJyxP4SzAOvF2XVWKtHvtbivkHVedW0hmOFjamiCfaMIoV87hDBh
         kvoU/XrD1FUimroG2PZ3KBAZMnTDQk7WD/wqpsWcJMDdQ/N9lD+YH8lxsdfhbiGxH/jt
         LUcBKdTvyhRW7pdGZbJpN6TNVWdh5pbPYkBz3oNGziO8b6hBQWaj06PCIJwrR1KbzLy8
         x91f6sEtOkyTVp1vjL7GgWnTqoF/yiu7GxPw4NEReOxyO0oz4BqRT/02K4Dgpm3WRb9r
         QOqQ==
X-Gm-Message-State: AOAM531++k0FHyjGzDtRowb/NteYSFtA/uOuWvXf8Xl9c99OTuhPsr9D
        iX1kUutSJRMNuFFamQO2A5udeTof0ZDtQfBloZs=
X-Google-Smtp-Source: ABdhPJx7qh+mNkv4fszmTyhwOjH5PtQGv7TcGVXG2A3V0/1q8FyjFJn4lSFRahcWP+iQ09eNAAQjowrra3y2n+LSM3I=
X-Received: by 2002:a05:6402:ca7:: with SMTP id cn7mr1902945edb.143.1598844949735;
 Sun, 30 Aug 2020 20:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200830213121.239533-1-tali.perry1@gmail.com>
In-Reply-To: <20200830213121.239533-1-tali.perry1@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 31 Aug 2020 03:35:36 +0000
Message-ID: <CACPK8Xev4w4BxrxR1zQPk=wiHCK2fSGD9tEeAQwPe_uayGw_CA@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     Kun Yi <kunyi@google.com>, xqiu@google.com,
        Benjamin Fair <benjaminfair@google.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 30 Aug 2020 at 21:31, Tali Perry <tali.perry1@gmail.com> wrote:
>
> timeout_usec value calculation was wrong, the calculated value
> was in msec instead of usec.
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 75f07138a6fa..dfcf04e1967f 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2093,8 +2093,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>                 }
>         }
>
> -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +       /*
> +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> +        * 2: double the timeout for clock stretching case
> +        * 9: bits per transaction (including the ack/nack)
> +        */
> +       timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> 2.22.0
>
