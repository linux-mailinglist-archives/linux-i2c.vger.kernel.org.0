Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54826CEFC6
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 18:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjC2QuP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 29 Mar 2023 12:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjC2QuO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 12:50:14 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB384C2D;
        Wed, 29 Mar 2023 09:50:13 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5416698e889so304343637b3.2;
        Wed, 29 Mar 2023 09:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680108612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7RQjEBQKcR2AtQw8SbDRBBSVG7qV4SWyEXRN37gXbg=;
        b=ExhHtqPmqZG4oJR+RXlrAl4+TfvBWZLHllK5jTRoQrqWWEcDNsXqWqZxDPUnJN9oC0
         /YZsbMujS4HvxQerdlUeFsVjKF5GcDGDD2qwgLGJ6DFynF6ImkEDLWGqqGkwlolwa7Mp
         t/RetwYwjW66Pe4Pe+iJjnjr0rzStvbLd1YeuvuNoh8ulxy6bEYxjMsv6Xm9AwPr4kBF
         sXCbAnzZ531TYe8fgnRvRwJcGkHsA6LqTPl+JgWHYQw0MyjnENJlFqksBA3ulOUq0JIA
         NDD7xWkI3ZJI6u4zEWr2QP5AA5kppKrdXc6M6pwdRAzM+h7AKr0ahvqcCwc4L/24wFmw
         GwtQ==
X-Gm-Message-State: AAQBX9dgcR7SJkpFQCwKRxC0+X1n5RERf6WsT31lx0kzwyXy7qlEJ2CS
        W36h9C77/fHex8v4ljZ17ReSOMen4/uVHw==
X-Google-Smtp-Source: AKy350aTHpw80JcyaLQWzJvP9A9nFA8YQ9HUX27e0bcIBkk8upB8LSqfXGY9SijVdo3+I3kW+mpdOw==
X-Received: by 2002:a81:9304:0:b0:53c:d480:f4b1 with SMTP id k4-20020a819304000000b0053cd480f4b1mr20948515ywg.6.1680108611906;
        Wed, 29 Mar 2023 09:50:11 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id da12-20020a05690c0d8c00b00545a08184efsm3083614ywb.127.2023.03.29.09.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 09:50:11 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id i7so20194372ybt.0;
        Wed, 29 Mar 2023 09:50:11 -0700 (PDT)
X-Received: by 2002:a05:6902:722:b0:a09:314f:a3ef with SMTP id
 l2-20020a056902072200b00a09314fa3efmr12938566ybt.12.1680108611093; Wed, 29
 Mar 2023 09:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
 <a2086a3f-e4c7-5bbf-a24c-522d6723a043@gmail.com>
In-Reply-To: <a2086a3f-e4c7-5bbf-a24c-522d6723a043@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Mar 2023 18:49:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSn=OuRWcQ08buh7F7Rqbn_hNSB9hpSLQTAvX=EYtFVw@mail.gmail.com>
Message-ID: <CAMuHMdXSn=OuRWcQ08buh7F7Rqbn_hNSB9hpSLQTAvX=EYtFVw@mail.gmail.com>
Subject: Re: [PATCH v2] treewide: Fix instantiation of devices in DT overlays
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Frank,

On Wed, Mar 29, 2023 at 6:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
> On 3/24/23 04:30, Geert Uytterhoeven wrote:
> > When loading a DT overlay that creates a device, the device is not
> > instantiated, unless the DT overlay is unloaded and reloaded again.
>
> Can you elaborate on why this is?  What the relevant code paths are?

Honestly, I don't know.

From my local quotes collection:

   "There are two ways of constructing a software design.
    One way is to make it so simple that there are obviously no deficiencies.
    And the other way is to make it so complicated that there are no obvious
    deficiencies."
                                           -- C.A.R Hoare

The double hierarchies of DT and fw_devlink are just too complicated...

> > Saravana explains:
> >   Basically for all overlays (I hope the function is only used for
> >   overlays) we assume all nodes are NOT devices until they actually
> >   get added as a device.
> >
> > Based on a patch by Saravana Kannan, which covered only platform and spi
> > devices.
>
> > Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
>
> From a quick scan of the fixed commit, I don't see how that commit caused the problem.
> Can you give a quick clue?  (The clue does not need to be added to the commit message,
> but please at least put it below the "---" if there are additional versions of this
> patch.)

I bisected the issue to that commit. Reverting the commit fixed the
issue for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
