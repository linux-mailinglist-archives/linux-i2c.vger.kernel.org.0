Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDA71F9770
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 14:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbgFOM56 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 08:57:58 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38126 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729766AbgFOM55 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 08:57:57 -0400
Received: by mail-oi1-f194.google.com with SMTP id c194so15780678oig.5;
        Mon, 15 Jun 2020 05:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQ5Z64m3A+voiLdTRc5oz0ItPjL6c4tfm54JCCWJp5U=;
        b=NIMOq9Akt06lRtJ6bB0KwUe0Efx3V8EPfmLaXeR0BhFS7aZ3TOCd1UwK1pIubQ3mmd
         D4Khrn8ZBOmiy1rgWZVbtLvmvxfpaEeKdfysuRslHpHsrQql0TP9H80hi60EeseMqhyx
         L9PRXSNvA+SQmLUdHRP8TFOP+UzZweD7d/fh6J12auC9e1x+Ztcc4QBOQinT96wQJMsA
         G3FUliFxdfubn8sp/M109sicpzpcwjz0zBRw1h2/wNQM6oQ2RVx+NfijrS7drvI8+SO9
         Dtk4LLMJKYx+1SG/Sbo7PsRuDMKaPnWERxwtLLpBSzHBmssdur3G0TIvydS5mIKkX16+
         7bJA==
X-Gm-Message-State: AOAM533I2wfNCWxq8ferJARJk0pv2a5a04EdOylysc8qDFwR/rQAEqbJ
        nGugUYnlKqUhdhs1gJfNd7ynqGxq6ut/Xm7FYJQ3RhHi
X-Google-Smtp-Source: ABdhPJyS/d3lM9e+BssHKuz3E0GcxonxOrVf2nC3YHjp5kUnGIpQw2bcCm0DJG1YMaUmH2eawOwxh7qr4FVNZER+Wck=
X-Received: by 2002:a54:4006:: with SMTP id x6mr8385606oie.148.1592225876974;
 Mon, 15 Jun 2020 05:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <CAMuHMdW=WfGNtKo6y1RFPydFeQ-UqFq4ixOTqQzuW7x3oGmHjA@mail.gmail.com> <20200615125015.GC4423@kunai>
In-Reply-To: <20200615125015.GC4423@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Jun 2020 14:57:44 +0200
Message-ID: <CAMuHMdVjJTjuswQYkTfWs1oxA676rEQW5TRy35XFecGpeLrrCA@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 15, 2020 at 2:50 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > After removing the first hunk, this works fine on r8a7791/koelsch.
>
> Removing the first hunk? This one?
>
> +       bool atomic_xfer;

Oops, no.  I hadn't looked that close at the numbers, and assumed the failure
was about the first hunk:

Hunk #3 FAILED at 369.
Hunk #4 succeeded at 432 (offset -3 lines).
Hunk #5 succeeded at 585 (offset -3 lines).
Hunk #6 succeeded at 643 (offset -3 lines).
Hunk #7 succeeded at 666 (offset -3 lines).
Hunk #8 succeeded at 717 (offset -3 lines).
1 out of 8 hunks FAILED -- saving rejects to file
drivers/i2c/busses/i2c-sh_mobile.c.rej

I meant the one with the "data" var.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
