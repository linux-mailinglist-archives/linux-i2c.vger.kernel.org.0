Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA9270D43
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 12:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgISKyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 06:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKyc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Sep 2020 06:54:32 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D683C0613CE;
        Sat, 19 Sep 2020 03:54:32 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id s19so6353848ybc.5;
        Sat, 19 Sep 2020 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pzSAC77KGj3b71DFM8b51B+fZYfC1Bsciu342riUU+I=;
        b=q3aT5V6EYpJSrJl/fZxvehZ9OLp1zFUW4vS7anYCIVy32j7NWiA6qEyJPp+k82RqFP
         0RcCLeEvdynv7ZL1KsxKuAPjJ3CmL385W0hTKZR3Svfxfq64HyLGOZv7XUxG1gVPiKY4
         OcxFH/huz5+ZJwenNgGrJiujfVF077N5O7y/pTAEqSD5fVfPZDg0r3vfztI1xzKMhn27
         /fFkHqgw4wyFop0l/J0qOegfFQsObv+T9uhO1opjkrdYtDjIzInwNF97zfNG12gyugE6
         rPZISBt5qEfy55VNNc4dP4clg7dPo0hdPZolHWAEWcaS94b//yBekPMElBwzBVvlUdTm
         GmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pzSAC77KGj3b71DFM8b51B+fZYfC1Bsciu342riUU+I=;
        b=itS3dXbvk4S1Ldnp/IIMacECrNyZW/WmgOk4BJlkRnhj31zd3fIisrWlb7sa2Tq7D0
         XezdpcZ8wE7r9azt5c5gvYwFAmsEpdKTWJKagaIjmHtW9XkuuTVbhysf8Q2pSimjzc5e
         WHzl+gq1iGQQhypALmnVRbpPGYEEZpiVfai52LS2x7hM7ttKwlIF7t3iolaTagj367uG
         kgbIWlKHevrvD6xjwGIarmMCVhHrxXaSmxecrZhpdLVa3MI3pnOUzyCA76U5AdwZtbka
         jPiabqUMKmfBMBaacWtxE8JJkYM4dIIAHvixIdGdrxqtOpP5haG7PEWQfEjc+pGC1+ji
         JfuQ==
X-Gm-Message-State: AOAM531XdgWFPWEOTN/3l75PFwNKJjjBwgv6lxNpFjBcJL1G0s2iotAp
        TrLVy4dZ9CAd4Pkac9cOaZCF1BO01avuPhF/o48=
X-Google-Smtp-Source: ABdhPJw5efc5NhFkTetrZgcf7Z8DzfCZh/tmjP6pUg93tWkSjNZlODD1MWwUBtozQzW7FY/5hEpct+waFEd5OOBoI4k=
X-Received: by 2002:a25:e811:: with SMTP id k17mr45613290ybd.401.1600512871413;
 Sat, 19 Sep 2020 03:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 19 Sep 2020 11:54:05 +0100
Message-ID: <CA+V-a8vuR-7vqxNnrqQ5Ysf3Xjvhp3xRZ33i8+6nEGFLJciT3A@mail.gmail.com>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1 support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Hi Greg,

On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> index af4826fb6824..737c1f47b7de 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -39,6 +39,7 @@ properties:
>                - renesas,usbhs-r8a774a1 # RZ/G2M
>                - renesas,usbhs-r8a774b1 # RZ/G2N
>                - renesas,usbhs-r8a774c0 # RZ/G2E
> +              - renesas,usbhs-r8a774e1 # RZ/G2H
>                - renesas,usbhs-r8a7795  # R-Car H3
>                - renesas,usbhs-r8a7796  # R-Car M3-W
>                - renesas,usbhs-r8a77961 # R-Car M3-W+
> --
> 2.17.1
>
