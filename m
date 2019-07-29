Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17EBC78AB4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 13:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387778AbfG2Lj7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 07:39:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34413 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbfG2Lj6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jul 2019 07:39:58 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so61512700wrm.1;
        Mon, 29 Jul 2019 04:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtJdzbW3OOpjsEtmQxM3ki8nrSOXvXY0ubiY8BKmPl0=;
        b=bDM6wAzqzUPDQPK1u8I5YAC+Elo8N8L8XcItoO58fuMCSb66b37k/KAqrQGoEDjtXD
         M1B6lCHfiyTT3iNK7UAEav7yERU3tYcvKTeEIXuD+BmzqlfEg9Wxf7roe23J8bwgeEEF
         k6/0OPubnZGt/WvGBxbOqF9GsN9b5UPdJ9kCPH0eqljdDM3wyyTGRFuPEYnI6EAUa/f6
         1Q250Pdotgq5GLq3ToUqTGJy9GOx6yKosWeRag/PnTQYtPYByK/V1H5pZ/g5/9N/P3xk
         lmCKkcp4m9Xq30YJLB8n15MMmH2y5QldUEjl8V6sHlNPa2ugycRflbzhYZcrAPw7PIIi
         jQ+Q==
X-Gm-Message-State: APjAAAUm5mrrUffKUY9Bfo1JXqXFqLJs9oaGMUn7ZaWAIRsLfRXKExcG
        LTYF59O6XOvlsknxbx/AiMeO4ry1u8z7TTzWelA=
X-Google-Smtp-Source: APXvYqwsv0EP2D3Ic1LzSkwSX02GY0PnXhgzpnFiIdu6QLxaYoTsm4jdSzeorUlunM5h+Z3JxZLDkICDq21xY7TBAak=
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr346128wrt.57.1564400396173;
 Mon, 29 Jul 2019 04:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190724121559.19079-2-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 13:39:44 +0200
Message-ID: <CAMuHMdVmTSinvJ9RbG0MdFd9LoxtFHRPqZV31dju2n=PLbYG6w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: sh_mobile: Rename bindings
 documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 24, 2019 at 3:25 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Rename the bindings documentation file for sh_mobile I2C controller
> from i2c-sh_mobile.txt to renesas,iic.txt.
>
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
