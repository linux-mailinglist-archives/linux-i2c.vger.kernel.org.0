Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBCA322966
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 12:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhBWLTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 06:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhBWLTX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 06:19:23 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB7FC061574;
        Tue, 23 Feb 2021 03:18:43 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id o34so460617qtd.11;
        Tue, 23 Feb 2021 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VV7rEIve6yKGpkMRY5hUYwZ7RTxYrpNXrvLCtfvfuXg=;
        b=RzmUtKDC7CFuAPBTb7dsBZ1dX6XfNmRs/2DfC1ACIN3taC6QwxcYqjuUCkaqT/FmHp
         RZm8vt/wPryOa+vCnT6Is/iWpucbeyJROoZnGWdCdOgIbUL+ac6CMR85zZ/8un3eVDYy
         hVfwIRWlkdbBFZ0lF6SKe7WdEmfB1EgtLrOSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VV7rEIve6yKGpkMRY5hUYwZ7RTxYrpNXrvLCtfvfuXg=;
        b=R4FCml49oT5UgA860PGVUuEq0xjT/ngLr5W9uUZwcYZ8vejEYzntZrEEjF6tlsOEKs
         utDa6RBKyvMRWHgQ2b0YI8ZpYQkjj/kc7A9QSDFvyDkGeSVqtAgzjZhiJpmQb1iDM/z+
         oqmQx7hLpSqu4fymB+9Nz2zJTD7LKJwaiz7ppTC+MYmDunfajqotlNjzTCZV/TvgNEtF
         NffQCHECRz8UL6Ww6BvuXL7bUhYYFhbyUCl7pcmau7f+jh33fF3EFC1nm65y9OkDtaQE
         4qxHiTJUD8wrY4fJx+oNQwmLvEhL4SxqpxeGHxEdp05egJQV6rTdP09fj445RfdUYA36
         RmIg==
X-Gm-Message-State: AOAM530P5OsvhXGud7uCW0k4Vw5JmTARDUBW+UbdW41yAubfaxiZjlXs
        U0Rinfds5nmV/T38WHlaPGgXnyuXHi3i0QbmhiSKu6Or
X-Google-Smtp-Source: ABdhPJxAlqNlBFfBiQeyjUiNfVYmAYsZbURb6MXd2/TmhTdms/rgFCRvOm6E5N3wwEesKB9w7do60A/zBEzwkJXA8SA=
X-Received: by 2002:ac8:7599:: with SMTP id s25mr23612473qtq.135.1614079121544;
 Tue, 23 Feb 2021 03:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20210223020925.22856-1-dingsenjie@163.com>
In-Reply-To: <20210223020925.22856-1-dingsenjie@163.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 23 Feb 2021 11:18:28 +0000
Message-ID: <CACPK8XeYaRkgWfG33+3ohCPKupqCay0jPp85hdt-XybWvM1eRA@mail.gmail.com>
Subject: Re: [PATCH] i2c/busses:remove unneeded variable: "ret"
To:     dingsenjie@163.com
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dingsenjie <dingsenjie@yulong.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 23 Feb 2021 at 08:04, <dingsenjie@163.com> wrote:
>
> From: dingsenjie <dingsenjie@yulong.com>
>
> remove unneeded variable: "ret".
>
> Signed-off-by: dingsenjie <dingsenjie@yulong.com>

Thanks for the patch. Instead of removing the unused variable, I think
the code could be improved to return error codes when the recovery
fails.

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30..efad900 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -175,7 +175,6 @@ struct aspeed_i2c_bus {
>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
>         unsigned long time_left, flags;
> -       int ret = 0;
>         u32 command;
>
>         spin_lock_irqsave(&bus->lock, flags);
> @@ -232,7 +231,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  out:
>         spin_unlock_irqrestore(&bus->lock, flags);
>
> -       return ret;
> +       return 0;
>
>  reset_out:
>         spin_unlock_irqrestore(&bus->lock, flags);
> --
> 1.9.1
>
>
