Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC0778AC3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 13:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387766AbfG2LoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 07:44:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33163 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387701AbfG2LoA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jul 2019 07:44:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so61586686wru.0;
        Mon, 29 Jul 2019 04:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y9jGU/NWtP0PxIwMtXRwacQjdDfvu/rxqjEtlIhxPUE=;
        b=gcFUIxIO4X0XraE63A3zawSvXEY1/ghgJ6m/moZ3IhN5Lf32RI0lewFsDp2EloLMk0
         9RB/z6VV6DSj1zCdTBBhifA/L831xAYlIqHiFr8FoUuuEH9dObpyzNqR6skP9zK3t34R
         /MxOt2dGNcNgAkGqmMiDfKrVvSOE7TqMhem6KfIv9fh8q3bm5Ig9XYhisHhdbWPM2vmn
         kgwKBaC1bkd0IyTiMBiMfzpt07iajo7ANFGMC+524sdb8w32kPoK1b+24FEx2I02eZ+g
         NjJXFoY3xSaivORr7NOjeZmYuXeCwVALYsKO/XHWvSCGqB0IDuN0QEDsbFwRiZxPHWoP
         1Z3A==
X-Gm-Message-State: APjAAAW7H+842Y4D78zeyIJUwYAkYSar5l+HOrtGV8u1BJToh5jmTFfB
        O/TgFXw15/QiIXyJu2yY1jmuV9wZXZuSDBhwt8g=
X-Google-Smtp-Source: APXvYqyt/KtUOLD5yKOkA6Cv/QL1RACKMWpgWzAlXeKhfxVw60x2M7lBTrd8TmkVMJsho43+CYhDE6ZIdveEHmr/X/U=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr36121417wro.213.1564400637649;
 Mon, 29 Jul 2019 04:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190724121559.19079-4-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-4-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 13:43:45 +0200
Message-ID: <CAMuHMdWZ2xSyrhVgnM8x6ebodH3EvNdpLSU_uutsXDoLCvGpmg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: i2c: riic: Rename bindings documentation file
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
> Rename the bindings documentation file for RIIC controller
> from i2c-riic.txt to renesas,riic.txt.
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
