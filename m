Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E08C254B9B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 19:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgH0RIv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 13:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0RIv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Aug 2020 13:08:51 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340C6C061264;
        Thu, 27 Aug 2020 10:08:50 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id m200so3346716ybf.10;
        Thu, 27 Aug 2020 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mHniHlKDMaeGQOVA7wYMtzU65VERCv+oHJvfRmraXqc=;
        b=phVYQvV+p1qAm0gsfY1toQgMji8hPquXZHym9pN14Y2rco5aiKlsT1Gx6zVh2XPdIs
         t2lqa76eF8xs83b9Y54L5hMJo7WCFO2fbUSk+GIfX8iqVvRbExWIpBc7OTj5+vOG4I2P
         JMlFP6YynzTlq7xlgz3eMXxGGT5QMTkUMER9bFTWUu5AQF/UoGISrTL9tqBcLf6hoJk6
         37MLl/pmsybfeZDTrQ+3wnhfTSeXIU6+Q51facRmWQ5yyjSZuiQstgngF0UVxzXRP/21
         X486CABykcDT9yvbgwMMOekgteTdYZM9T9v9hlx2QNelhA/SoEvmBsVsRsEJBl3dLeze
         +W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHniHlKDMaeGQOVA7wYMtzU65VERCv+oHJvfRmraXqc=;
        b=alMi6JrDldOXZ3waYVZCRbVX+TIlmAaSGPrHojLalKfR934zW216I4mqFloP/oDaAw
         CVyb/uBXS87QqLLovo1u/LgZJ/LpzrSaoaADqZeAG98QlKLHv0liNPtn0EqpWLWnivt9
         WIg18GdU0SE4uf/7v24HGHs4mkdypAkp6uAjMYtqQ7ReTmcMOUupuB9W+nLoiDPnVwFc
         YUBWkQ2IBP9NRDFsvbthaJaWzYd1UmLrfjs1ngNj/bYkijUqLmBUOM3tieq6mU0gmRa3
         Iud5pvhxqEx3sHG0KQLxUflbQ8ArB4htL4inxkl3egS+GOjRWmFBH6a/OlFi6RCRxI/I
         CfbA==
X-Gm-Message-State: AOAM531Vnm4yuLxDzlrZsOhMr0EHfTYVYJjc/0u9ME3rPfTmueBwcTxV
        tLWhIWd7NBHgezN5GZdIjvJyqMEKa5ZbuanWcsE=
X-Google-Smtp-Source: ABdhPJynyRKB2vFyMBE3ZSJ4B1YetYq7rZ1URcR+oH1Mlp82FYbmnw++2Z+nCtikyiYgdGx4q742m6zdB4fkuZ+CzIE=
X-Received: by 2002:a25:8149:: with SMTP id j9mr31275854ybm.214.1598548129529;
 Thu, 27 Aug 2020 10:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 27 Aug 2020 18:08:23 +0100
Message-ID: <CA+V-a8t9p9U5oeTp-QNmp2uGHMOvXpo+VhRvp5hv5oDEWUh5QA@mail.gmail.com>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1 support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Gentle ping.

Cheers,
Prabhakar
