Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2041270D3A
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 12:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgISKue (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 06:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Sep 2020 06:50:33 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C8CC0613CE;
        Sat, 19 Sep 2020 03:50:33 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id e11so6366432ybk.1;
        Sat, 19 Sep 2020 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sR4Cf468ttlcnEpD2lR99lnNDLzNYlhl55SIm3LLtd4=;
        b=h+fZZUH6fIgq13gs2kd6hFQTg0H8gYjImJcdR9Qx9rZwfTAIwjI8eKphpv8/Emi18V
         0DMzO+0vOJM9E70MeDuMpUTA/o/QImw4KbEQb17KSGwmDqyVrxWujJvSyZzrbQwNVwEf
         wUe112+xxfMWXK3OtZ2FiwQGtV1fIcJeiXlkb3Zf3471cBTjE3U3lKsg4BuEhoXXuhx1
         MwwdopqSI5Dl/C5SUF/KCzvYgj0fJVHi/c0efCcBCPbiYbQzxBymh5K3mTb1FYR3yzA1
         r1V1FPoYQiJALJIgv1PcjJUIFAgyuRHwbGhpD40ZordPqVYibzS1BsHx6yi/xkiBds8b
         suJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sR4Cf468ttlcnEpD2lR99lnNDLzNYlhl55SIm3LLtd4=;
        b=rmmCDHGKz/oGJ9/o//6eJlXUGY0K6pK33L3M/rwi7GP7ITviK29o1CR8dJRIYNcuO0
         QB9ssTvCftosgkv7WLbI0/T7JJSrMukZZa4oDrFjMMJ0HeeowA+VFlp6MpoSzSLzUFyj
         ZMeHJysYIz0VXFWk2yWNA6jFhQw+q88vSj5FZocbzt6xKENhOyrVMq2awo1JVHUFYyPE
         cX/3oa4pmNWo0erUidGEsShTksg7VrWfdjXxFMXXBVUB3MZb9fDxSrZSaASzbBj4KHN/
         Q2FyFxcfqpNsC8HgCswnU0iaVkWJgW34fK8WxABJwtSZj3iPa3dO3y9PjFUEawsy0aKU
         ZA3g==
X-Gm-Message-State: AOAM533vSA1jOA8oz6F5nVDZ9ySGU0vehbtzlYK1cwuNHOVfrui2TFLN
        NC3MYFvStSeij7QVyB7xGLQ86ddJQN6AAWqgoJ0=
X-Google-Smtp-Source: ABdhPJyE4U9ZnryEOY+zR+FUEkyCD/GHbSRKQqLTyhRoWySjkq/s2si4GtaVgrchY1J9veY4efVDKa+2G+W/Xi8n3pw=
X-Received: by 2002:a25:c487:: with SMTP id u129mr3406786ybf.25.1600512632850;
 Sat, 19 Sep 2020 03:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 19 Sep 2020 11:50:07 +0100
Message-ID: <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
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
>  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index e3cdeab1199f..b9a008e8469f 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -16,6 +16,7 @@ properties:
>            - renesas,r8a774a1-usb3-peri # RZ/G2M
>            - renesas,r8a774b1-usb3-peri # RZ/G2N
>            - renesas,r8a774c0-usb3-peri # RZ/G2E
> +          - renesas,r8a774e1-usb3-peri # RZ/G2H
>            - renesas,r8a7795-usb3-peri  # R-Car H3
>            - renesas,r8a7796-usb3-peri  # R-Car M3-W
>            - renesas,r8a77961-usb3-peri # R-Car M3-W+
> --
> 2.17.1
>
