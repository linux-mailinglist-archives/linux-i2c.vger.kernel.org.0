Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DD8167995
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 10:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgBUJin (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 04:38:43 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42080 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgBUJin (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 04:38:43 -0500
Received: by mail-oi1-f193.google.com with SMTP id j132so977350oih.9;
        Fri, 21 Feb 2020 01:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uD4laB3s8bi0BFiMPx+I3Obi95+70uww5AFzLEhj4u4=;
        b=cPiwwSvrzt3jVkssV1QddsOGEYliivRiWaQohkfFJhrRQTKL81ccDB9P87jBUYJ6CT
         fVuSXvdXGNR1VO3swkd/iApCOvsoDFFIcjXOGPD0MEJ/hw7l3Sze6tAdyqJn6hNRh53T
         2JZVqereiXtTvIZbNoc4c1/tv/TLUrCLnprmGb+qk9dSl8tu3PbxUkvHWJseHEaroIdU
         ewMN56Adro6BVeNlbwLNy+kiLfSYEm+fCxhzchvU099ouzAS1YdvzmKJYdmetMjYWjTB
         uGAUOmrncfS4dUn0gpqLV6c4Byfl9bzqDHSHaadNpucUpOBL5AmjNLKbtRcDVd/edpVq
         S9BQ==
X-Gm-Message-State: APjAAAX+rYFk+V2MD1LIl9epvwmZSShsFWK73ibgPNWm7+UDbAEd2Zuh
        //Zi3BdkaOBqSUhF6/xJKGzCZ46tid9N1/S6gCo=
X-Google-Smtp-Source: APXvYqy4vUm+VI9GjjFc09JRIyZV/BmC+3fmvmW3aFzesDOM/pFSOuqf1mSriMqU+kB52tcCLY0NhaK/KfKQ7khW+Qo=
X-Received: by 2002:aca:52d0:: with SMTP id g199mr1152890oib.153.1582277922433;
 Fri, 21 Feb 2020 01:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 10:38:31 +0100
Message-ID: <CAMuHMdX=w0=qBe=qZxsdoat7VLpi53hdi_CPLybR3sVHq+9jkA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] i2c: use DEFINE for the dummy driver name
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 20, 2020 at 6:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We use it in multiple places, so make sure it is consistent whenever we
> need to change it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
