Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082DD4ADB28
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351156AbiBHOag (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiBHOae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:30:34 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EC3C03FECE;
        Tue,  8 Feb 2022 06:30:33 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id t10so3559386vsp.8;
        Tue, 08 Feb 2022 06:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6/t6U2q+d+HOvKBbMhQ8XHiCVe1JvODhVqof8DN8Y9c=;
        b=n/vf1I5wb3Ntna0+6SAza5cmY6SS5sygF2mt7h4kap3Rc3yfxkCwe4ZhltpFVoQPoK
         GDaiu7el/P++1RXczIy+GvhDl+z7KEUpE35bWaao4t1WMn46B++AcYsNecn4hCrZk0ow
         5H3LIaQ9AGzA+AoSj8U0MlfUdf/xT+cWBnvYuFqDggB0B+ljwYkyfTMM+U4zw2OVYIOe
         l9V625fzP68g8JfKBm1d0M7zT++eW6azj0dklU0HX3M3BUe8IpHH5TOAVFL/RIfiU3fo
         oZDrHYycPri23MRi9BKHwUXPubGw0pjeA9dTc9X0dtuoUKRo68Gke3KoRkZIi2nlrJhd
         VEyA==
X-Gm-Message-State: AOAM5301hXdQUTz6dcj+mCJT61tVaYCqiBhXX8vc3BD4hDIZTZCXzcfj
        QpBY8gYMoiuOe0j1iMyQ4KbCLxEMlsog2g==
X-Google-Smtp-Source: ABdhPJzvsxMjfjaf8gsY1ZjGB8Kv8Pf9SJ8D6bE34+RXk9AoZRNDeWTA/qVrmOirqWNBYiY9XjA69Q==
X-Received: by 2002:a67:ab43:: with SMTP id k3mr1359990vsh.60.1644330632299;
        Tue, 08 Feb 2022 06:30:32 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id q22sm2681331vsj.23.2022.02.08.06.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 06:30:31 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id u82so314002vkb.11;
        Tue, 08 Feb 2022 06:30:31 -0800 (PST)
X-Received: by 2002:a05:6122:1254:: with SMTP id b20mr1812781vkp.0.1644330631572;
 Tue, 08 Feb 2022 06:30:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643898531.git.geert+renesas@glider.be> <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
 <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com> <YgJjkOqg6YL7499D@ninjato>
In-Reply-To: <YgJjkOqg6YL7499D@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Feb 2022 15:30:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNUC+XqMLjY22L6XZ5NTyWTGA6HLruZUNFWBDEpcsmGg@mail.gmail.com>
Message-ID: <CAMuHMdWNUC+XqMLjY22L6XZ5NTyWTGA6HLruZUNFWBDEpcsmGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Feb 8, 2022 at 1:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > While I2C on R-Car Gen4 does support some extra features (Slave Clock
> > > Stretch Select, Fast-mode Plus), for now it is treated the same as I2C
> >
> > Correction: R-Car S4 does not support Fast-mode Plus, so there will be
> > a v2 of this patch, eventually.
>
> But why? Unless we implement slave clock stretching, we can still keep
> it at Gen3 level. Which does also not have FM+.

Don't we want to introduce a family-specific compatible value for
R-Car Gen4? At least the SCSS seems to be a new R-Car Gen4 feature
common to R-Car S4 and R-Car V3U (yes, the latter is advertised as
the first member of the R-Car Gen4 family, so I intend to move it
over to renesas,rcar-gen4-* where it makes sense).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
