Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924A72E695E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Dec 2020 17:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgL1Mx2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 07:53:28 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:34290 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbgL1Mx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Dec 2020 07:53:26 -0500
Received: by mail-oi1-f171.google.com with SMTP id s75so11373586oih.1;
        Mon, 28 Dec 2020 04:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MqVTZLUYzpLGRsvmeYRnbEICtg3112T1D5wrEvu0WF8=;
        b=Jp3Tib+hkHrVg2j+5A17svkhJcLIr+NmSDZn6NCZUUrHUIWQKjnPxx3vKytknTf8FX
         OHQfVryAbXWVqAtyo6zfAZvgMkXibkJHKRg7u2oKbzenK4c5NqvjdbO4RgnCFTpl+uSo
         t/RSMIqlqb90AEUDRhMpuGeQqb6ipKGhFTXtKdNXBtY/SmYBVs148W3Q9J5GZE4FsoAw
         RjGchmIKe8hVQ2P/M0GzVpYV+KkXtkD2FaXS8KKb9+Xrbj2zJJXK8LztYc62E46Iv80i
         2y9Y4KAIk7sz/eP6zqc5xCGv3TxUqV/P46ipfWG5GYFxaV5E9iZ9q1wSorg7cfpRPMdV
         HzPg==
X-Gm-Message-State: AOAM533mFwpos5OvrFd2OTot/o4182C8NTfJZ5Gf5y5aT6oeArtY9GOG
        qvMz+jTk0LF070aaoaR8ZsPspK5ylx87kmLhRAM=
X-Google-Smtp-Source: ABdhPJy9qjiMw2sR7A98E9EXAUa+LXgugsNTuFCVJdDAb0vPgIvZULk7EDqPspZn/vBLdzi5S08dTTOJAn8sNkO8ho4=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr11763889oih.153.1609159965775;
 Mon, 28 Dec 2020 04:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com> <20201223172154.34462-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172154.34462-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Dec 2020 13:52:34 +0100
Message-ID: <CAMuHMdV7i28HjfLbrzrJaJw6hB51u=kgmqqYmK_zBETFXumCUg@mail.gmail.com>
Subject: Re: [PATCH 2/4] i2c: rcar: optimize cacheline to minimize HW race condition
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 6:22 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'flags' and 'io' are needed first, so they should be at the beginning of
> the private struct.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -119,6 +119,7 @@ enum rcar_i2c_type {
>  };
>
>  struct rcar_i2c_priv {
> +       u32 flags;

Note that this adds a hole on 64-bit.

But if this really can make a difference, IMHO it is still broken

>         void __iomem *io;
>         struct i2c_adapter adap;
>         struct i2c_msg *msg;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
