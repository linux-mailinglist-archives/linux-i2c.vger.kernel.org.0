Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0011679FB
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 10:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbgBUJya (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 04:54:30 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:47055 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgBUJya (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 04:54:30 -0500
Received: by mail-ot1-f67.google.com with SMTP id g64so1441453otb.13;
        Fri, 21 Feb 2020 01:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6KWuWbwpy5eV1ugbAOKbTPCDhSjq5tBX3gsYSurm6FU=;
        b=BHOVmoTR9eeC3nzMH+otKaox1Nsqffd4TPTvM59LzjCUZnf5MhN+F1U27K6CNOdZJW
         a3PdOHHdyIDj/v+YPzj7Pl36hL/YaqWvIbhOb5JFw5vJZqLlxQAypr1n608CMU1Ou4QP
         n7xupIXb4wCxi9t0O/tl8XotO0ZV8dfPGrc1oRjrjL7donyMaiFJYYCbdKnWtlFZVi66
         vz8mjy5Ju4bBJtHRefQl/vGdU0DjA39PYeXDZ1Pm+1a4cBIam7qSl4Q6xpb85vZpBzLq
         K8KCA+nacJfMpfCghzrVYqtetZvMBIutRVG13LgDMlbJw93hPVFBQ57IefCsi+VEWQJG
         w6cw==
X-Gm-Message-State: APjAAAXHAGtY9nt89wBBaG79rn9vI67xyUt8bgJeZagkx049k39o73Nq
        eygf0CzKK4gckASVJ2WWY2cfcYAC6n1ypKoeMnU=
X-Google-Smtp-Source: APXvYqyhskulP9XNKEDIW8WGFVwSFpIZubz6Szsv+4aJV+5XVybq6Gl2c8lJKMieOTMpUoN9JopRyDO5qSQyZQelS5w=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr27510706ots.250.1582278869027;
 Fri, 21 Feb 2020 01:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 10:54:18 +0100
Message-ID: <CAMuHMdXy=B6ZjC=X12yeOjSfr5-Z6HNL4vp0vQciMsW31i-CPw@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] i2c: of: error message unification
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your patch!

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> - don't prefix the device if %pOF is provided. That information is
>   enough.

While that information is sufficient to identify the device, using a mix
of dev_*() and pr_*("... %pOF...") makes it harder to grep for relevant
information in the kernel log.  Hence I'm not convinced this is an
improvement.

> - move the prefix to pr_fmt
> - change prefix from "of_i2c" to "i2c_of" because the code was moved
>   out of the of-domain long ago
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Nevertheless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
