Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58911679C0
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 10:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgBUJsk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 04:48:40 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41351 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbgBUJsk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 04:48:40 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so1455639otc.8;
        Fri, 21 Feb 2020 01:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIi0c0G5Zb0Jw5ypN9sLASPQpOpXkoB2JbMIvsoRlKU=;
        b=UclMjFAuAV1kAwedwAHcV8UzQWdlayQz+SAZsLLuOeez26hKTozvjWe/1jiwfipf67
         WpsRg+wL4q4vyukT6lcHN6/B5Qe1isJODO1u6yiZuH6o81LlzB0fHXmL2gpAvyzlS/iR
         QoLmBsvmGi7k/HOVD3SD+5lcBI88YVKF75W5wmMpK+TAFgrinaP0t50j6Q5Z9aQn1gkd
         pOEEyzPBh5AuvqiFOV3C2gjp0pgYsIg2A7Nker5ICYUZ/4LYFnKr1BYRuk90V46P7dA3
         vNb8z26M/uIbfRqsS/gvckwl0IYzaxMuBSoLx9j71z79iOplVOe6yhVcQMRz5rj5XdKO
         oGwQ==
X-Gm-Message-State: APjAAAV7UcncDfsQYtRGzXRfiSWQ4TpkLQLGIZSq5WQgL/IjctFDFcJz
        550NfDeplfKfvXjk+Q/5eF77HHMipZRwlbTZz7I=
X-Google-Smtp-Source: APXvYqzCfDGAqcLdudcohpMobUQi25VoP3sGfFSGSDz0m/c8bEwK2Ubq4fI8d2E03xtKyfavurE7PLjwAUBVVtlYtvQ=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr27799290otm.297.1582278518775;
 Fri, 21 Feb 2020 01:48:38 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com> <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
In-Reply-To: <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 10:48:27 +0100
Message-ID: <CAMuHMdXGvRRJUU7fOszPuKcvHA2ttpLTvQ5=9h3vVWPYFUbjaQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
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

On Fri, Feb 21, 2020 at 10:45 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Sometimes, we have unknown devices in a system and still want to block
> > their address. For that, we allow DT nodes with only a 'reg' property.
> > These devices will be bound to the "dummy" driver but with the name
> > "reserved". That way, we can distinguish them and even hand them over to
> > the "dummy" driver later when they are really requested using
> > i2c_new_ancillary_device().
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, depending on the extra dummy removed.

> but one question below.
>
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -50,7 +50,6 @@ Examples:
> >                 reg-io-width = <1>;     /* 8 bit read/write */
> >
> >                 dummy@60 {
> > -                       compatible = "dummy";
> >                         reg = <0x60>;
> >                 };
> >         };
>
> There's a second instance to remove 18 lines below.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
