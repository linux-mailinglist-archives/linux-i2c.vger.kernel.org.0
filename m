Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1F6270CF6
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 12:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgISKXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 06:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKXq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Sep 2020 06:23:46 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF754C0613CE;
        Sat, 19 Sep 2020 03:23:45 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id g96so6283380ybi.12;
        Sat, 19 Sep 2020 03:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6eCfSV8Ptzwh9vo0B+QF+qFkhZVWBhG7mYqX5yvNY50=;
        b=UTgudd0w5mQs9vT1TTOv7Ft4rtia6NtVy8EXAdA5Nr3DW6o/m6ioJ/RkkKJJ35ZTz0
         DIVTYbQO7Nr5qj0sxh/WN85JJEz/Y2xDTPSqhE6myX5le0fDmSK8gfEZn6TjCeKYBIC5
         cHW5+IjsIjMc7X7nlYgzPOZUoebvuQ7CvXfeproRRaFtXdzaiJUyCENgrMEXKMNUWd65
         FOScJtIjjzh0IP9lmkvggcgpTu3m0TkTZ30YzjNbDgbaUB1Sr9MYp8eTQiHGL7e0ieQS
         v2Bgu1n5tLj95nSasFpmYYKfLNsI4CVUzOLbL3O0+OULq763EX5R+Q/20pEPYbR4T+DG
         klPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6eCfSV8Ptzwh9vo0B+QF+qFkhZVWBhG7mYqX5yvNY50=;
        b=mTntCYocOTCEQ6elfsGEWcDP5bxGmQPC/rXgMkOcvlLF2OuYHWo+F/XDI+O28UAaqg
         2mjbeIT1KYs1C1jRrmyflLZw9ghD8lDOsZQVQyZ69GIHRqNeGg2cWxCiY8hJF0UZPefg
         JznmrkZ7tNKAR9P5VMqHOUVXH3GcrxcQ6+4YqdeNnT8BWK+bkajylUFBJMhFOYdAqhha
         MT7AyBI/7viWEYIFXdjTEfU1Ey6Xyb3BskD7fl28ZQZ1qY34AU4cWttpbi+4riPea/sE
         AodAUfieEkTHsdwZKLUDgNglvbgovw9Y+md97F/orx2TGJ+1VKieywgGQWmIblCPmTIz
         d5dA==
X-Gm-Message-State: AOAM533kEjEpdGPySnsFhcrAJdqe75igGHl7joNLhOgmnaEFjhz2vs0X
        U/ZU5nJ77ufCa/DqZJsMbBXUjk+/ph9cuU6L9Z4=
X-Google-Smtp-Source: ABdhPJxJvGLmkjcwDwl3wap9FpKrFE9YZL6lgmFOz6nspGUWPzIFULr921hybhvvnKUrHrAjjmPYowSLNP5qI7UbVnU=
X-Received: by 2002:a25:23d6:: with SMTP id j205mr36022995ybj.76.1600511024640;
 Sat, 19 Sep 2020 03:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 19 Sep 2020 11:23:18 +0100
Message-ID: <CA+V-a8uMoCs40RYENPhhpPQGrnoj-S_Zir718nvd94knsphO1Q@mail.gmail.com>
Subject: Re: [PATCH 03/20] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jens,

On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document SATA support for the RZ/G2H, no driver change required.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar


> diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> index d06096a7ba4b..2ad2444f1042 100644
> --- a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,sata-r8a774b1     # RZ/G2N
> +              - renesas,sata-r8a774e1     # RZ/G2H
>                - renesas,sata-r8a7795      # R-Car H3
>                - renesas,sata-r8a77965     # R-Car M3-N
>            - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2
> --
> 2.17.1
>
