Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0446270D27
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 12:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgISKqb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 06:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKqb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Sep 2020 06:46:31 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E64C0613CE;
        Sat, 19 Sep 2020 03:46:31 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id a2so6355480ybj.2;
        Sat, 19 Sep 2020 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0S4Ht4NHIpyZ6tU7+DqxhQ4MU+jt5ffLJy99tEJzOgU=;
        b=RbMN5zRWTm+yR39er0gdwyqlNcRtPlWXgaCF8b88WKxXhoRLE6Mn2AJPtrz4kxyyiY
         P2bgIO58FWIfV2Ob4gx9iFfTuPA4mnLP7u054ZYJHmosYKD4YIXgggwrTTYX1tv4Za3W
         YTFtkHvEB9PSsmaog8XNcYGLU9zaztr4gm1EdalTFWIariXDmB2qMfzDI1CvL1lszS73
         H68oGFMn98K9SaHCrSQhZWPgXKaBQ1E07ns448nMyUAyVZ5Ov59JWfhx4VGh4YMjVsbw
         jvDwFBQmliitx24i5JRU80wShJZMIVfHv7Muhuu+XzCEnTAzqDugUZKqjeq5hv9Jsz3m
         gIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0S4Ht4NHIpyZ6tU7+DqxhQ4MU+jt5ffLJy99tEJzOgU=;
        b=GMB9yZC69zxdoHBvGCprmTcZSnKj5CE/SIrREbMZ4HcPOHLlqDvKPkoE8VYRvE/nIl
         dL4+W/Rb/UG5cEczOn8Sg2hUlfOOd02cwA4vs9JEs7c+MFg1n2A8yh7lsOnzobIcZD/A
         E8JdJ+GYauCXf6nuBbZPPLmWO5dejbroSWAWtzVpyvElbNYIeNNrIXNFLrFuzSyQOOQ4
         IL1siECHZogjczD2Qt9sNLLLM1gnZW74tQCdTfII6IrlvpYJ1ozsbGZsPSApt0tfz+wh
         bVqWGZH7KwvrAL/o4f+VwQHtOE4EtW1+kEN+VKVNRhxjY4SSReybdouVay3EKvc06aNa
         3qZQ==
X-Gm-Message-State: AOAM531zCbcCSyun/W0oY4WPDKUnaeTJeZ+WE2/9+MITdVafro5E0Hvi
        wcpYuNde4t4+5gZJBrgUjVLLu3QqaBnirhfYia8=
X-Google-Smtp-Source: ABdhPJxBzwAMJjSTYjRHy/WAC+nDOGo9k/2nrLlIMxBf5lqxiHWLl+BIDV5S+hhsFapjrr4zITsBsmLzEi7nEIvg5Zw=
X-Received: by 2002:a25:23cb:: with SMTP id j194mr47717339ybj.445.1600512390461;
 Sat, 19 Sep 2020 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 19 Sep 2020 11:46:04 +0100
Message-ID: <CA+V-a8vtGZ8Tfptj6evmhZOWC+6w9M8uVQ_ob05j0UJwZnSWyQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree support
 for r8a774e1
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
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

Hi Lorenzo,

On Thu, Jul 16, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
--Prabhakar Lad

> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> index 1041c44a614f..64bb87e7dd06 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> @@ -6,6 +6,7 @@ compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
>             "renesas,pcie-r8a774a1" for the R8A774A1 SoC;
>             "renesas,pcie-r8a774b1" for the R8A774B1 SoC;
>             "renesas,pcie-r8a774c0" for the R8A774C0 SoC;
> +           "renesas,pcie-r8a774e1" for the R8A774E1 SoC;
>             "renesas,pcie-r8a7779" for the R8A7779 SoC;
>             "renesas,pcie-r8a7790" for the R8A7790 SoC;
>             "renesas,pcie-r8a7791" for the R8A7791 SoC;
> --
> 2.17.1
>
