Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF2C530C1F
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 11:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiEWIHo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 04:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbiEWIHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 04:07:40 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E5DFA;
        Mon, 23 May 2022 01:07:38 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id g3so12025406qtb.7;
        Mon, 23 May 2022 01:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fOzm2XqOazWnqz8+qsIbRLXFUmNZHUpcq1ssqKqVUs=;
        b=vkZ9sun0SEO6f1KLpcwYZ3zN96RAwcaYfAyPRZ2r+723dKaFWfbW6Td6qWfz1rfh8b
         7hYbqM4TEM3Lism5xdDane6kHd94HSKjJUtGZeqf2o1xdtKEjSw7VGvkAbdz4onOC6RI
         ne88x20CpnKv8s2WFeCVOvtb5/oWr9J5F+K8xvcM2mDdEaidym6rTsEc8xYXNDPFGk5Z
         KE9hIlONUa/WJcPKyzd35+NRP7NgqdrsieLiKzxzpYH9BTFZ2DSUiM/0PsddZcoZpYqK
         BMY3+Lt0plTt+aa/UblmDtTwCly1NCByipyoi0UXSFWS3fC3cIZWjvhAgL8aeCb1+7Qe
         z3+g==
X-Gm-Message-State: AOAM533gHCofr3UssIL4wHScw+Dj0Dn6WBC8sspyFWaA4MmriI3zvAs8
        EpDn8j3w04/UVfyr2IFWv4lMyr9E8en1eg==
X-Google-Smtp-Source: ABdhPJwPbwTg0cIGT/MlhkoYvZsIZeDYqXnfB5MNRIZQ2plZQ7OU3dl/M7KGllavfUddTMiIwCY0VQ==
X-Received: by 2002:ac8:7c51:0:b0:2f3:cb71:c7a6 with SMTP id o17-20020ac87c51000000b002f3cb71c7a6mr15211224qtv.409.1653293257675;
        Mon, 23 May 2022 01:07:37 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id k123-20020a37ba81000000b0069fc13ce1ddsm4077249qkf.14.2022.05.23.01.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 01:07:37 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f83983782fso138835017b3.6;
        Mon, 23 May 2022 01:07:37 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr22445245ywg.316.1653293257175; Mon, 23
 May 2022 01:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220520095421.51742-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220520095421.51742-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 May 2022 10:07:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=HVwnXKGNgYsHdZ2hyeyqdCGWA--P8ufxG40B1HPvDg@mail.gmail.com>
Message-ID: <CAMuHMdU=HVwnXKGNgYsHdZ2hyeyqdCGWA--P8ufxG40B1HPvDg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: fix PM ref counts in probe error paths
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Sat, May 21, 2022 at 1:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We have to take care of ID_P_PM_BLOCKED when bailing out during probe.
>
> Fixes: 7ee24eb508d6 ("i2c: rcar: disable PM in multi-master mode")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
