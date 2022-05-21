Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA1A52FC74
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243603AbiEUMx7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345578AbiEUMxz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:53:55 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523B857108;
        Sat, 21 May 2022 05:53:54 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id j7so9950032vsj.7;
        Sat, 21 May 2022 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ppjd92OlVB/MwGNt1qmR+MgTYt3GgGkBdJL3bf51wdM=;
        b=JUAHcif5tx1tsh8a9gOkhHOqrYPFKfupYtbTdOzIJkq8DfYK0/Z21ySt2t1TfrpqEH
         KsGTrg8Iau6UiiyYg2+i94lQcE/fRGC7VJyWcjm9T6Bx34VKYryJWrkyPVs++2IThb9L
         sSXLTpUpWZgI3X1yvvBgb8mP5Hxz+VWJm/d67G5Gm/tY05/8pHWd7f4jXlygSouAtcyA
         77vC70LozhWzjEl5r9JsSCPs7+U/Gj3nTJIGBzkmdlHmSoLsBY6bknQLmcqyq+/5oBgE
         W/KH4goKZkwIb6cvacuT/XBe/4HMHyjWlpdK3ShXvFgILx5kDFVGEH6IR1Qr9beu0toi
         BdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ppjd92OlVB/MwGNt1qmR+MgTYt3GgGkBdJL3bf51wdM=;
        b=f5W7spL3tBTKiLPmwRZgdSnBGO0QSvQKXZX45X0NC4IUs+VO5BvH/fuQkQw85iULdf
         wgWpiYWE5vihgUESo0YJKCxr+KVlaB3sb8w3u8iSHHejimuDQduNBZIrFgSgPpHf9ViK
         YvL/xtc1/ujbxLQ1YB+hAAw2G+KF3p1H5wRvGDGs8sio4lXCgFWYAO9a77kByQuFJlSD
         zNePyU3W64S5o8O37yaiv84P1NZaI7Z9Iv4x5rpv57yV6N+JP9vWZ5JOEbEHi0Fij6gd
         94u7iMWDXIZHbrWI5aV+IY4/eHjgSdtgOs/jAxpMGDbsl8Nwb8DkLGf3Zv+T6fEW7uIB
         eesQ==
X-Gm-Message-State: AOAM531Ti9+IQo5psnJppQIWYeOIKC3zf5s3yvHGiFk/H8rlsyeoai9f
        26s2XeqA8U/6mzxGMwhc3zyVypBOWkm4h1hfPQ==
X-Google-Smtp-Source: ABdhPJwogOGnDsSgDr+VBYrBTjLQWEj688uoqfvwo2KbNQeayXtr4cwnf42U1VjjRzlgShtbdXe2UHFhH1TP4DRzzG4=
X-Received: by 2002:a05:6102:3ec8:b0:335:d67e:7535 with SMTP id
 n8-20020a0561023ec800b00335d67e7535mr5759276vsv.47.1653137633399; Sat, 21 May
 2022 05:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-4-warp5tw@gmail.com>
 <Yoh9208mogGeWPYe@shikoro>
In-Reply-To: <Yoh9208mogGeWPYe@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 20:53:41 +0800
Message-ID: <CACD3sJa0adxqmzOV9OFz-XzYrtNUq-g=9E99mBWT=zo0RshwQQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] i2c: npcm: Remove unused variable clk_regmap
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     jie.deng@intel.com
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

Thank you for your help and review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:35PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Remove unused variable clk_regmap.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Applied to for-next, thanks!
>
> I dropped the Fixes tag, doesn't look like a bugfix to me.
>

Best Regards,
Tyrone
