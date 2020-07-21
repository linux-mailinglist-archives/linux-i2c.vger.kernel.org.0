Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF622276EA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 05:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgGUDf1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 23:35:27 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36289 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgGUDf1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 23:35:27 -0400
Received: by mail-io1-f67.google.com with SMTP id y2so19912007ioy.3;
        Mon, 20 Jul 2020 20:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3efDbbFBeN9lqo2tvpiUSIlbTXNfjWRmqWbgrnEOjxI=;
        b=MYG2BXmv1ascCGBMoPWbBohWbBt2iHxDNUDimP4NziHgrFG4vuPM7BCB9K2WGnWgeQ
         g6ZlfzORQ6+pn6YnqOvjJaGAb3jCuKJet4kzG5XY9Somh6sglyUJZum/UD4OBI1hMooi
         QiqMwnCNorktyD+0Rttd40R0KtxBr+a3i9T72neIwwnO/pe7YO3zg++3WKhfdtUzBeO5
         uhgroAJQg2xIZsanJsKPJL8LVosLI8x7zlH5B/xCnsqGB6a/AfWFOKmSZoAgz2pH8dsu
         4TuZf0Bk4wqlz3zMO//WG1vOUfeQBbSxgJOm+EmPPiQp3zfxHWDnWjNzQJizEM1jVK+s
         2A3A==
X-Gm-Message-State: AOAM5325Ep80xW6fhJM9glryNOPBxric1F6ibvKtrmt9i1oTqdOcnAWW
        OcJLM2DlXM35eCAGgv6WdQ==
X-Google-Smtp-Source: ABdhPJxyTK/slrF/ELkVKEXDGq34caiEcqrqROYHvjuYHKegslg+EOIDnAZwxhbIOcvtRfx4gn0QQA==
X-Received: by 2002:a6b:4409:: with SMTP id r9mr25670926ioa.158.1595302526232;
        Mon, 20 Jul 2020 20:35:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m5sm9868709ilg.18.2020.07.20.20.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:35:25 -0700 (PDT)
Received: (nullmailer pid 3505359 invoked by uid 1000);
        Tue, 21 Jul 2020 03:35:21 -0000
Date:   Mon, 20 Jul 2020 21:35:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-pci@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        Niklas <niklas.soderlund@ragnatech.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        alsa-devel@alsa-project.org, Bjorn Helgaas <bhelgaas@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
Message-ID: <20200721033521.GA3505276@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Jul 2020 18:18:23 +0100, Lad Prabhakar wrote:
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

Acked-by: Rob Herring <robh@kernel.org>
