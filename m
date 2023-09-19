Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01397A5DDE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjISJ1u convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjISJ1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:27:36 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB785E5D;
        Tue, 19 Sep 2023 02:27:17 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7a2785e34b6so1830123241.1;
        Tue, 19 Sep 2023 02:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115636; x=1695720436;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JmvqCUS79B0h3uf8FIhW3gwIfIF0IhcPU9HGhurHbU=;
        b=gMyY+xBofWiYPWK0rfxWR01Qcze8WeD2itox7gSHPXng0AibXWGS2funBfDO4ldaeW
         8qVPZ0nXQ7hCZe2FCfbWJuzqcy3qTwUsbRv69WpFWyhOroepzYGm4W4g6+PReUMQlYKq
         hTR23/je7P76GCN2+QXfE22aMBtzWB0oUt+56tEgNU2FpIyDDJZYNSkYY6mj2bib2WPy
         WjMavjXlZdIdFI7UwEp/Bef1cgMfwpBw6QhQmEYqg3QlP/z81/Yd83aIOhZ5tNdeHaOI
         OcOB9BjWbnmm7ynSdUqUcr1eO1pmy837DTHJ1uWeuCw7uUst8z0HFIBm48c+o4yV6b3g
         jd2g==
X-Gm-Message-State: AOJu0YxtmTjNuSpA0EoCZSXg/S7TXZoWn+2Iew7xpUV7Sg+Tu7RlGeP6
        YlTZo4PQHy40O1eXPnDfw1DXAxVZjGm5Eg==
X-Google-Smtp-Source: AGHT+IF2dgbvrhQ5rDPs6PUX8rYZsJQ4K7NLSsPmory1vzIpUbnETj/9qgUNF2AJzhfx0/jofGiSWQ==
X-Received: by 2002:a1f:de02:0:b0:48d:461:d9 with SMTP id v2-20020a1fde02000000b0048d046100d9mr9613084vkg.13.1695115636442;
        Tue, 19 Sep 2023 02:27:16 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id u5-20020ac5cdc5000000b0048fcd6ee5dcsm1898236vkn.39.2023.09.19.02.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:27:16 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7a8b5ec9a6fso1056563241.2;
        Tue, 19 Sep 2023 02:27:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2b86:b0:452:723d:a6ac with SMTP id
 ib6-20020a0561022b8600b00452723da6acmr4493376vsb.32.1695115635908; Tue, 19
 Sep 2023 02:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
 <20230913062950.4968-2-wsa+renesas@sang-engineering.com> <CAMuHMdX8Ug6sQX97_CyFbpAN1Emp7d891wJAWg8pLpnM3q+ysQ@mail.gmail.com>
 <ZQlnq4pYp9ZCu0Zs@shikoro>
In-Reply-To: <ZQlnq4pYp9ZCu0Zs@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:27:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL1U=yFdRA6diav8f9DTHPunesvPk1VxxWeaM+9KhjJA@mail.gmail.com>
Message-ID: <CAMuHMdVL1U=yFdRA6diav8f9DTHPunesvPk1VxxWeaM+9KhjJA@mail.gmail.com>
Subject: Re: [PATCH RFT 1/2] i2c: rcar: reset controller is mandatory for Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Sep 19, 2023 at 11:19 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +               ret = reset_control_status(priv->rstc);
> > > +               if (ret < 0)
> > > +                       return ret;
> >
> > This is a pre-existing check, but do you really need it?
> > This condition will be true if the reset is still asserted, which
> > could happen due to some glitch, or force-booting into a new kernel
> > using kexec.  And AFAIUI, that should be resolved by the call to
> > rcar_i2c_do_reset() above.
>
> This check is needed to ensure reset_control_status() really works
> because we need it in rcar_i2c_do_reset(). From the docs:
>
> "reset_control_status - returns a negative errno if not supported,..."
>
> The code only checks for that, not for the status of the reset line.

Right, I missed the negative.
I don't think this can fail on R-Car Gen2+ (using the CPG/MSSR driver)
if devm_reset_control_get_exclusive() succeeded, but it's prudent, in
case the block is every reused on a different SoC family.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
