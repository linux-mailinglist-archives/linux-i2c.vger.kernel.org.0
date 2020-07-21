Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91ED227706
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 05:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgGUDg0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 23:36:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34388 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgGUDgZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 23:36:25 -0400
Received: by mail-io1-f65.google.com with SMTP id q74so19947827iod.1;
        Mon, 20 Jul 2020 20:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAsJo8xERfHGR71VJmv3ZbMcHE9rd42Dv9/4mhEH3Wg=;
        b=bwK2mw4Ei53ZBufB/1sduVVmhIIXAHbVVIBDin9Spn02QyL9jH/wfo7ZG9Erhx9By0
         89N40erlQ5yai3L+qbpgGpqVUp94M5+Wj41zCYibx+4uOtlFzh2nAm2VT2ioh6GqjG25
         hAIBzm57oPgvnTkwjPEE3UOUansiVgCE1SjRH329vvehwCp4Ph8vvPWF2ZY2FaeAJBi3
         tBHbAtv35nBPN9mRvvducKRxZRWg5hjiT9VW0OrkyHa7fPNUCh+js17xOyUiwZJ7eKBs
         tqyO26nNsBEgCvjFxd+gVXavPQbVV1R+bovGS4Vm9VIO1bR2b+nMI0H/Bbpe1blJtfAf
         /uxg==
X-Gm-Message-State: AOAM533ssalTH+rArNmhuK4Ds26X3YSu6RmRW5/PMRHUMqzm1UG/YnAe
        LLxAiyImF9xSUc0fNrgYLg==
X-Google-Smtp-Source: ABdhPJzrFvJ20jW1Hp+YduXO4PyNsJdhSWfFUkY4PyKiuJTBmQeBTZsE38InZe1NYreyyZDeINhX4g==
X-Received: by 2002:a5d:8f04:: with SMTP id f4mr26176444iof.33.1595302584271;
        Mon, 20 Jul 2020 20:36:24 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m6sm10272866ilb.39.2020.07.20.20.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:36:23 -0700 (PDT)
Received: (nullmailer pid 3507107 invoked by uid 1000);
        Tue, 21 Jul 2020 03:36:21 -0000
Date:   Mon, 20 Jul 2020 21:36:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        dmaengine@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/20] dt-bindings: media: renesas,vin: Add R8A774E1
 support
Message-ID: <20200721033621.GA3507062@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Jul 2020 18:18:32 +0100, Lad Prabhakar wrote:
> Document support for the VIN module in the Renesas RZ/G2H (R8A774E1) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
