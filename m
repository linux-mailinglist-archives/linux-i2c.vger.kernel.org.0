Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F81225D2E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 06:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbfEVE7K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 00:59:10 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38528 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfEVE7J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 00:59:09 -0400
Received: by mail-ua1-f65.google.com with SMTP id r19so418843uap.5
        for <linux-i2c@vger.kernel.org>; Tue, 21 May 2019 21:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pfnQkeXApE9YhAL04oZ9pUNXjKBFEtVB3H8ZellBg+s=;
        b=itsCJKdwgb46ITQkTRPoR292kcfck5T1rUAFHDfske/5D5WuP7F7P3FokSkTHFunNf
         7YQ3BXR/Xmoj2jTOP1hfkdJt1lDEmYafTUxvNuFTUleUmyq5ofyPgY6K17FZitXLDLBW
         kj+iGHmuoeu+c5e9mdy7m0/Q22dVjzeQz6NzlsNr3bF2uX9x2lqdQJugNy9c/inxvahE
         s9deVGS5LGzqxTmCVeVTiUYlsDogXeDmD+B0siLITPFo6hjidNKTbr/yuKGPBpmo54LS
         E5sF5haPxlVlTjHw49x9ASoRzcJXsV2qcr4unFMySxZUMuUTc6FwsM1+q3P1NiMcd6AM
         6oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pfnQkeXApE9YhAL04oZ9pUNXjKBFEtVB3H8ZellBg+s=;
        b=qEfxOBvxyt5NpS9mAdI6Vw66+VesMIKxcc8bSy6gdw4ZyG4iMdH/rsrnksJBJAj1ZM
         HX+ykqoe70lMl92dk6bXTWzc6eeR2n1e5B+mocTeIfp2G/CLtLMIraIGZpHkoN0K9RME
         KfjicxYC7Cr28TJk8Gx7xkcFI+4RNildhWsiUkhx21vTnrl+X3LfIuJpGH4gNZ59ULQP
         +NQ1QHlTc5DBPL63HNt/SK+KK7lCtg7o7oK2Tnrp10+BUUGKmEfISfEUI586oEIj9slr
         8+qI1zsqmUF9IytQfLOqK9ZxPrb2bFOtkRMEtJzkC9CX2/GLwbnzX1mRgYwSTYWVPI5N
         Y7hw==
X-Gm-Message-State: APjAAAWeOsHHHsnZaFR5ZWoB8Cmu+GhP6YPFN89Cn8JQV7ArbtDQN3hJ
        gNEcQ/eyi/lPXDbLJ8HqsMpq5NC6843x7bu/qkPS4w==
X-Google-Smtp-Source: APXvYqxVjzH04GMwRGsl2rdzhYHjRj2cXzo6oi7TYlti/cF3kn9df3BQ4J7NHUBk2S9snvBN4LcYAu8LQxGMcT/lIYg=
X-Received: by 2002:ab0:3119:: with SMTP id e25mr3548887ual.96.1558501148962;
 Tue, 21 May 2019 21:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
 <1558445574-16471-4-git-send-email-sagar.kadam@sifive.com> <20190521135439.GM22024@lunn.ch>
In-Reply-To: <20190521135439.GM22024@lunn.ch>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Wed, 22 May 2019 10:28:58 +0530
Message-ID: <CAARK3HnTkpkH9rP4oW456V6KYsCah7-gAXdjm5+3cLwJaPs6tg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,

On Tue, May 21, 2019 at 7:24 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  static void ocores_process_polling(struct ocores_i2c *i2c)
> >  {
> > +     const struct of_device_id *match;
> > +
> > +     match = of_match_node(ocores_i2c_match, i2c->adap.dev.of_node);
> > +
> >       while (1) {
> >               irqreturn_t ret;
> >               int err;
>
> Please keep with the idea of i2c->flags, which is set during probe.
> Just because it was removed because it was no longer needed does not
> stop you from putting it back again if it is needed.
>
I had modified the implementation, so as to keep it compatible with
the new implementation of polling mode.
As per your suggestion, I will keep the older method (the v5 version
which you Reviewed earlier : https://lkml.org/lkml/2019/5/20/1261)
 and submit a v7 for this.

>        Andrew

Thanks & Regards,
Sagar
