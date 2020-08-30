Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D93256DB4
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Aug 2020 14:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgH3MtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 08:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728686AbgH3MtP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Aug 2020 08:49:15 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8B7C061573;
        Sun, 30 Aug 2020 05:49:14 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id d18so3348859iop.13;
        Sun, 30 Aug 2020 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdBRR0cueC+gQFMWe643ZTOPACqLEtpMVbSZLMNIJk8=;
        b=nXZvxVAYREeSQudgh5+FEP9PDKNIFXymwC/FlXmvC3gptxL63qm2e7mHxhHkFau5qh
         2B5zLmRu9pDycfVr8sGnqogTSC9i8RWh2jTLL+eLAlVA1PuposUsD3C4QigoyoS4aV+e
         jC1xTnrrMuj87umbNnmcDgLuO22Hp3K2A6zBqumWazXMaE+CuUrnCnk1fHk+LPmM4sFC
         uKfK5UiIeLES0sJzHHylkDPqEYYO7RGucS0X+HM2h3EZgqIUv0RPWuaxwj249C1VplMd
         ORn/YxVjTGLzbzXCL3crni/RO6PDMpQ6vdePMs7tKwX2BGgt900+8kCsHtjtwtAOfVtn
         ZP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdBRR0cueC+gQFMWe643ZTOPACqLEtpMVbSZLMNIJk8=;
        b=OSNcregdiO8DdPnWrUFndG9/84wCyloGpTlHT06UIQcnTET3Le9mkAHVpadRnSrGDl
         LDyne5AmK44C2cXBiD7+nHbOY3BAWLnf7Z4I9bcfaEXrzYoYkiFXQ6yTnAJF6JNz4vV/
         tJIZlPpyaW5DeWssoUEzeUoJlB3tG8jb/QeeOhXLQEH2daea/fOyI1HG2x4PJeS+ZmOs
         bby5BPKjvgbFk8BCC4SzK8mRW6RVpOGlz0AMPPOj4TSOpg0POoqJhCq2URZhvMR53CxX
         EfLxOYzQaxFi7xDeRgujZn3pJ6QVZrDZA/AIchIj5dyFzyF5/vV90nPvvf6i0sNbLQ+P
         ETow==
X-Gm-Message-State: AOAM533GORqJx2el739mVf0qsp+jzLxrG2sj1reaVlQRPLCUheex1CXZ
        wqrRHdhNX81S58jrT+hdYLuWki36MLCQhFKkxA==
X-Google-Smtp-Source: ABdhPJw7O7EzuonqLJJFe/6YP0MDgHVcW3ajTLQEw/YH6cRXtE4Hd9v1Grf3WAIzDWhra7xl7zwb3LoQhXLRSc5T6Gs=
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr7904474jaq.103.1598791753939;
 Sun, 30 Aug 2020 05:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
In-Reply-To: <20200830122051.197892-1-tali.perry1@gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Sun, 30 Aug 2020 15:47:52 +0300
Message-ID: <CAKKbWA47=-ubf+HZJwNMWdPsKdeOO6VAUvApcvewhOcxhg0KWQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     kunyi@google.com, xqiu@google.com,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>, wsa@the-dreams.de,
        linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 30, 2020 at 3:21 PM Tali Perry <tali.perry1@gmail.com> wrote:
>
> i2c: npcm7xx: bug fix timeout (usec instead of msec)
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>

> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 75f07138a6fa..abb334492a3d 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2093,8 +2093,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>                 }
>         }
>
> -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +       /*
> +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> +        * 2: double the timeout for clock stretching case
> +        * 9: bits per transaction (including the ack/nack)
> +        * 1000000: micro second in a second
> +        */
> +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> 2.22.0
>


--
Regards,
Avi
