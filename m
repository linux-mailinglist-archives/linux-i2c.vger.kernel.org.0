Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A869C3A6F55
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 21:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbhFNTpo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 15:45:44 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:42546 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbhFNTpn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 15:45:43 -0400
Received: by mail-vs1-f52.google.com with SMTP id l25so8444138vsb.9;
        Mon, 14 Jun 2021 12:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdTUwFo6njgUQ7I8qlXNhzKLMBIH5mb/X2ww4eJb12Y=;
        b=uCCuKHZ6dGkWP2HlSJ2avUlX9qvahHFUY5BRoaSKmgfb9GnNGDrHmi7fnG6eHjVsw3
         +mvC4FwCRs3j7rp2xpEoAugl/L/lg9UV+3xnMG6zLUwXJAodwdRTXydsK76zcloYFJZZ
         Tk1QG1OwCrL757eIK6rRmPSSrP8+n5IlOcPORCy/rs2TvTIT+t0Rv9TxKlScnIn8ptlV
         krA6zGkyiLM+KucFeRy9TKl39YvzxXS1zhkmk8vWkN9vQOFUAcP5DAEmlk1TMQwbGijo
         O7VRZvcwRfb/lW1nOQD0BRUYocFwAOOokCFDaQu4fkqmbXUggl1l1ZAf2aYFf+y/syEO
         G6pw==
X-Gm-Message-State: AOAM532QMIRTB3m0gq6Is99TnBQbT2tY/lTVpZW/DJ6Lmem4YRz/JfIV
        Rpqgje1HsKN3l6Cbx+p1ih7beAA6ukOA9zdC1KmftKU2WcM=
X-Google-Smtp-Source: ABdhPJxQNk1Sgfs48mae1DeSigWbl1e3Wt7CB5qRmsh1T3V/olcbX2Nwzyiz+Hzp/NdIjqBQs0/7CejskGLOd+rpkys=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr1342993vsd.42.1623699820072;
 Mon, 14 Jun 2021 12:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210614193253.10011-1-biju.das.jz@bp.renesas.com> <20210614193253.10011-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210614193253.10011-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 21:43:29 +0200
Message-ID: <CAMuHMdXOxZRPwPokO8xa2nSUi91sBwwdjXHy5_a6hbGCZk6fRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: riic: Add RZ/G2L support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 14, 2021 at 9:33 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> By default IP is in reset state, so need to perform release
> reset before accessing any register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
>   * Changed to devm_reset_control_get_exclusive API for reset_control_get.
>   * Updated KCONFIG to enable RESET_CONTROLLER only if it is RZ/G2L SoC.
>   * Filled .data for RIIC_RZ_A.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
