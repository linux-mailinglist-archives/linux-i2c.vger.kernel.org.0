Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AE13760BC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 08:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234536AbhEGG5y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 02:57:54 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:40781 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbhEGG5x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 02:57:53 -0400
Received: by mail-ua1-f50.google.com with SMTP id 33so2526372uaa.7;
        Thu, 06 May 2021 23:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ye20i1nLyErkfusT6LVogGCOz0LglqHJoFvU8uj64UI=;
        b=p138PyNgU6kMnnUuByNC4CYBEa/Cd7Kd2zJObpLNtj8qaTHwgdf6fxroJv7IQjgDBY
         LGUmZ5liiczLj1SIesx0O6fEezcEBZ3TMN5wKkItDeHIWluygadket2mKNNYjVLNSY90
         mK2NPDdodYq1vYl7bSUyXp6AUJTBcqOz5jedTksrZ+m31NuSE+kxKp9fAEsV/MVdKH65
         pBaqXGwI40mRpnMJ65dN6j0rUHxlItSGDmu73AAT7hY6PsbouZ4PhIjRoBHOWwa9vS+p
         d4+vxP/T07GeD3HkXlF0GrlYc4uFQhzZ1RCIAj+KqE0Xva66JjHcczCmgamcOyaWNrxg
         zryg==
X-Gm-Message-State: AOAM530AkZTw8VIrC9qNv2bVjo1tQiDHwiiX30IoKwP3vH3z4AXDGCjG
        uCjVWLLtymh5wTZMBfgEe58c5HcNKFk87KsHd60=
X-Google-Smtp-Source: ABdhPJxZOKNiNGbotHxvD4HMLfuzc4Sit041T5Yaofr8+xurSaUIXG4sCtBtAPQQYt716gkVgnRbv7PGm2tAbPUSJ58=
X-Received: by 2002:ab0:45e8:: with SMTP id u95mr7553240uau.106.1620370612802;
 Thu, 06 May 2021 23:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620138454.git.geert+renesas@glider.be> <e1bb5790675b6f4a518c6a9cbc22eb7452a2f78c.1620138454.git.geert+renesas@glider.be>
 <20210506205611.GA785508@robh.at.kernel.org>
In-Reply-To: <20210506205611.GA785508@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 May 2021 08:56:41 +0200
Message-ID: <CAMuHMdUh=Cne==VAqv_DRXZpB7cOyRJehaq-mOWQb__DUk1Orw@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: i2c: renesas,riic: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Thu, May 6, 2021 at 10:56 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, May 04, 2021 at 04:51:12PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas RZ/A I2C Bus Interface (RIIC) Device Tree binding
> > documentation to json-schema.
> >
> > Document missing properties.
> > Update the example to match reality.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml

> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
>
> Don't need oneOf here with only 1 entry. Otherwise,

Thanks, dropping for v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
