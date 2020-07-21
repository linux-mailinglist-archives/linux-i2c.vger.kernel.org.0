Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0102276EC
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 05:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgGUDfu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 23:35:50 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45304 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgGUDfu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 23:35:50 -0400
Received: by mail-io1-f67.google.com with SMTP id e64so19888136iof.12;
        Mon, 20 Jul 2020 20:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=11Ss5+TWbTwC5VEy1eRl+9A6ulBKPK04XldeortitXw=;
        b=p+vALysZHkHrDWfrYmjx0+PBIRQyWR5tIqCn2N9biPMAwABq546o7KrpyanLpbvAl1
         wxwWOCqkynZziVWUf8uHyn4qw+MGU7wWC0roV8g7u8AoKIKcSErlmnogHZL2Q8aQComd
         NUDjYe+dk4OBvFKVa2QFmAtlgHm7nV/p1CoeJh3TFMuZ/AT/yssWLkqMBTWGIO3U48+S
         ligDIawGLsUy5+oDJiz7Ld5s++C8WWDCavuFY0ZTm3yEfG2utJgjUxyVTlIXTwGLLy7U
         qiSZsuShTwGvDii0Ttlmsvj7Zw5PYdHkbZ4UIn2idnot5ne/9mZzxhXz/oPkmCyAdjdM
         Qxvg==
X-Gm-Message-State: AOAM532/ImK16ClqG/7DtwhOyLeI70wmSrwSFkUldpxKiBPPw9bA8kpV
        JVwlJlyrj03+th8JNxDc1w==
X-Google-Smtp-Source: ABdhPJzbcZEoyr7cZeAWu9P+ztBiepZzG70KBotB9TIGBfO7NZ3rZRWdA0exLcnDoc0wa9nH60Do6A==
X-Received: by 2002:a5d:8f01:: with SMTP id f1mr26073476iof.20.1595302548761;
        Mon, 20 Jul 2020 20:35:48 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m2sm9859770iln.1.2020.07.20.20.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:35:48 -0700 (PDT)
Received: (nullmailer pid 3506024 invoked by uid 1000);
        Tue, 21 Jul 2020 03:35:44 -0000
Date:   Mon, 20 Jul 2020 21:35:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-ide@vger.kernel.org, Niklas <niklas.soderlund@ragnatech.se>,
        alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-usb@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1
 support
Message-ID: <20200721033544.GA3505976@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Jul 2020 18:18:26 +0100, Lad Prabhakar wrote:
> Document RZ/G2H (R8A774E1) SoC bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
