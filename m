Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143ED2276D0
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 05:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgGUDe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 23:34:27 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33719 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgGUDe1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 23:34:27 -0400
Received: by mail-il1-f193.google.com with SMTP id a11so15238013ilk.0;
        Mon, 20 Jul 2020 20:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lEjdQBbW/boyhDiNTM7TD+vH0KD1i9XRl22iZgkm7F4=;
        b=iM9eHPMaTwa7KIurLieFv6eQGYlSrCqGbeAPD0hASAvHYhMSypaqGRGRBF4KJNI5RY
         1Ul02C15a4K8e2fW74YVGW+Fm5vwI+Ai+hioPp4go+v6loJI5dw5GuiNf9BLNBkDqpQE
         yBStn6Gqpqh4ZWiNkGQ2cx2XxY3nJSDMa9C47lF8v+ayBwc+sqrG0i2dlGcZHC2uK8gk
         tGTROGh9NWEIQFhnymCU7CYQysSVxrTj/0/ivLiME9R+YTGUEaozlbAcqw0wTdBUDk8j
         IIBSfXw1L54A2MlDYAmDGWLw6rnGI1MMb2ew0+QmtJylqkCG4bi/Flv5oHWAOr4EK/uC
         FbJw==
X-Gm-Message-State: AOAM532/59VeUbHw9LVucR+3StTMY8hHMDwzAqarz1oM9miPnZWLe0tY
        inlBVEBGilyyqMobuk8Zeg==
X-Google-Smtp-Source: ABdhPJwGADjpvMQZr5FlN1g/SWnGPSX43dFPvjZNtWgdOfy0gtgfbIwb8I4jFOahligwaecKrl9/pA==
X-Received: by 2002:a05:6e02:1212:: with SMTP id a18mr24024250ilq.97.1595302465691;
        Mon, 20 Jul 2020 20:34:25 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v62sm10081537ila.37.2020.07.20.20.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:34:24 -0700 (PDT)
Received: (nullmailer pid 3503819 invoked by uid 1000);
        Tue, 21 Jul 2020 03:34:23 -0000
Date:   Mon, 20 Jul 2020 21:34:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     dmaengine@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-ide@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/20] dt-bindings: ata: renesas, rcar-sata: Add r8a774e1
 support
Message-ID: <20200721033423.GA3503378@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Jul 2020 18:18:18 +0100, Lad Prabhakar wrote:
> Document SATA support for the RZ/G2H, no driver change required.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
