Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58B1544CF1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 15:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243979AbiFINCq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 09:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343664AbiFINCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 09:02:44 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD5B11C3C;
        Thu,  9 Jun 2022 06:02:41 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id r82so41593590ybc.13;
        Thu, 09 Jun 2022 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Gepr+P/b1NDSmcOnfY4R8HvcHSNLzUy+z/OdcbwQQN0=;
        b=IVDzHPmLeelA9KNfGflsoBU8djymr45P8BxesF2r7710KLlLMckE4z+3I6W4224ev3
         37oiqivW+s7XbwUGnNyMeBS94wdkeZNbfdy0yAiKVOzj8EeQBKDc8A9XoDnGlYyFFS3s
         TWR1sNbw+IYPMT1NUZ7B2GCHAToHwtQKHmnUfZziuUZKYPamevhwYPC+G0ZuirPzJgWY
         2qb4bjxZCyRnS5rUUpGN2wFgE7sj+q0DbYiXxJQ4+2SnlXlF5px58u6RogmEP7ve5aK7
         c2v4exBQWteJgnPXJz24OPgNQ/YLMdY+ZAUHD1qzc6BVsb9JNfqb1/uOY+kgZSwIYyy7
         nwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Gepr+P/b1NDSmcOnfY4R8HvcHSNLzUy+z/OdcbwQQN0=;
        b=Oiy2REWl7gBmopr3jeInFfnGbc/qm6rW2ibjCvP8gHyBlfD0+xWPlCiCKMzfHcphHr
         FuRBiRnUXqRskZ/+OkD5vmyjsMo5WxDKeZZwYDR96Hb57UiLcAaNV9lxEf9Bg14Kjv/V
         ZGM1uRz1LHRJ/WgAXLVrg5Germ9EinKxX0wACgL6/QfZcsC3u6vPTBXn+Go53hDNVkUW
         MoIhOLp6PG0WpCADngLI4wK41CrwWXkmMMQmtcgDf86NH1qOwUkThLrhSklf7JQFiJyq
         vvBQ+dkstUlaXwkvO+Gl85EuxHHGW1CN4/EOOWY+j5uwHF9/S1yFMvMAQoDzi3AvofrQ
         AiqQ==
X-Gm-Message-State: AOAM533xAbe9ITyrmlPpgCGY7J3ReReQ6ZpKZuqVGEX6SMr/TxG2H5Up
        V+VFyf52ES+shh7QOz8GLkSfv44vn5rDAM3N5A==
X-Google-Smtp-Source: ABdhPJxkAym7gxT7hPdNdLCg2YPutDnEzJH3BrutiJIqKRXSsLIjivw3RXkwmtR3hh4ND4ddrYQYBEvYVhJpwSM9d3c=
X-Received: by 2002:a25:d03:0:b0:664:37a2:4d03 with SMTP id
 3-20020a250d03000000b0066437a24d03mr2409941ybn.308.1654779760779; Thu, 09 Jun
 2022 06:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-4-warp5tw@gmail.com>
 <YqEAnMTaHTbIDQq+@kunai>
In-Reply-To: <YqEAnMTaHTbIDQq+@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Thu, 9 Jun 2022 21:02:30 +0800
Message-ID: <CACD3sJaDMWbB=akrbAS0hJ=Qwdy4oqDvNE9yVPBthLhyzou+fg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] i2c: npcm: Correct slave role behavior
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jsd@semihalf.com, sven@svenpeter.dev,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram:

Your previous suggestion about this commit is highly appreciated.

Thank you.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:39AM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Correct the slave transaction logic to be compatible with the generic
> > slave backend driver.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Much easier to review this way! Applied to for-next, thank you!
>

Best Regards,
Tyrone
