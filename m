Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42F1254BD5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 19:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgH0RP3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 13:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgH0RP2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Aug 2020 13:15:28 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9742AC061264;
        Thu, 27 Aug 2020 10:15:28 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id y134so3372809yby.2;
        Thu, 27 Aug 2020 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sIZhYAthYWBYdLdFxX62quaSDkTNt7lcxiX/jTX8QP0=;
        b=UxRhj1E5yWHmK02wVOz5+lpu2UXiBVT2ExRCRprxxH1S4VAKxqdO31TP6ZpqARUlWO
         vwPD+1LblYV2iK3wmfEDOKH/E5ZTWY6ydGbcMxvQadznmQIGU6CHA0dfBHTC7eN8f8He
         7A7yyzMnGwaOS1UvpgrILEQD9gg9JlGFxcQ57SBngIrEapInjNk46HGBRfo+d+FiPKwa
         teLPniL0duptKZinnbwqAFtwwPOSkZwCprfirnyIqNJ5UltaaKsC2y3HDX26vaTuMWXb
         Cpi8lLlOvSa7K2odaQpDx4415Xhp8pYUFQEjAhJrXBzgLdbHLfMW3V9QfNXdJ7ufcgWi
         xf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sIZhYAthYWBYdLdFxX62quaSDkTNt7lcxiX/jTX8QP0=;
        b=bhKptUunvL3Fz3FG6teXImsNxSAkkKMxQFXUNLhMcCzBrYd/Te0lD4w2U048HfdXii
         NSjZIMdpb4dPOsOoxyb5/WubYM6YrsEHAj7WBhoAaMcoXm5kKbBN5XE/SumC66OWbpwG
         M4pV8JakgmlGKaW3wiUHHwuLOmQ20zcUpvsbFw6iWA7KLTZYwKHCqytmuXdUx+XQQNr2
         IR/CkAIXk5OtYogfopJwqOHpOLt202MYhjC0YwY0vNV5E9N6eVAAMmG3MbRj/LG2iAew
         6Bv6bMAa44/YWa8imoius6IXg6Dkoie7bZTjNSreNq3JnzuoDU1RmkU90nMP1+MFDuiM
         MKpA==
X-Gm-Message-State: AOAM532vnOuUUzihm8CchfcmaQ2qzdkCUQbiDi7NqGHtsWwlfcYd5XnB
        FTFsUYWVs5Kc3QK2j3+rfuOT9kFL2zgRH4Il9go=
X-Google-Smtp-Source: ABdhPJz3x0ltioowCpoW9IFahNqovv85mHc+kMeq8iX9slmaAJEwJxGArTLcXBn+w17+vkNbqQZ20FE/b1rvCTEF6pw=
X-Received: by 2002:a25:2a58:: with SMTP id q85mr32915263ybq.518.1598548527955;
 Thu, 27 Aug 2020 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 27 Aug 2020 18:15:02 +0100
Message-ID: <CA+V-a8t-HHWeo4zwnTuyZHnhc8u_aXqt_KZHr1trnXQB15Jj6A@mail.gmail.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1 support
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
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document r8a774e1 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen3-xhci", therefore no driver
> change is needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
>
Gentle ping.

Cheers,
Prabhakar
