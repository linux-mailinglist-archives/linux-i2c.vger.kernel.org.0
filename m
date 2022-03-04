Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09F94CD54F
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Mar 2022 14:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbiCDNkL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Mar 2022 08:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbiCDNkL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Mar 2022 08:40:11 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CA710EC4A;
        Fri,  4 Mar 2022 05:39:23 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id d64so3459187vsd.12;
        Fri, 04 Mar 2022 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4cvMl/4qYoB0J9ZtKfUyo3O1j1h4wuQkE/ll5CQ0EvE=;
        b=BOf+p0bXU0//OteVvJrqjfh2RxAMmJA0rI4mRyPA1+kD9F9k8jQUQKx9UUVW4JcAn0
         R+u5HF9s+ires93EjvMO0Pxu2gO29z5cyOkS9RH69rN9sM7V7ndD0oBV7jQJaxKD79qk
         vht7crtzrG+E20IUp79ds32p22VqMC/JSjiZj9U95mvGXdENjqYRxoytgXKQj9o68r0p
         CeVfwkZ+svIlIELuLKPyG7LcqOdY+k7xJWPfJXF7QaWZF4WEl2T7zUtEa5fFDYkuI05O
         SorVG79DepqQgC7qfq0LRF3X6NqSZGQVk9HS1Zizx2gd2NlYnkJIAjHtV1rYqihNfPLx
         rvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4cvMl/4qYoB0J9ZtKfUyo3O1j1h4wuQkE/ll5CQ0EvE=;
        b=SEAwi52O3xWc3XcHErgseJIRdWUbhkyLqYRFmuF4g+ZVdxO6v60XVxf7uYNI3tGc4j
         efGVUJCtQayuUUETxTglzF0lCR/BmzAT7v5/vzKFV96Jyi8MfHEnbjQLWvW+4fq0pCbt
         0GVPP7T5NoY7ZHbrw1Ng7PLf7G6ZnoC3yGv9YCGyCgfyPokfdu0HAxIvXB7DSPq5ULVb
         2dysHm94a2znhyxWxcanaJKvP8XZenhLTx2KnAaaOIce+q9blvh2CKgoQBvMS9g/SFDz
         QKSlRQQuRurD7uNfYDIgb5Y8Wli4LBRenh1dttn3Xnw4UBycx1GGBgzOukD4KlBjv7lH
         F3FQ==
X-Gm-Message-State: AOAM532Jb/vwGaXvWJdT2Qlw+ghO9+5lbFYbkTyaJ/MdsyHnI3f3P8gQ
        wmlZDa3TLxE6f15fcIdqSRyb+zWzX6xYUpVxaV634GavUA==
X-Google-Smtp-Source: ABdhPJylHP1GmLWtcK6ibGHJi6U7Q9Nprg9MNaWs6QPNI9/RlRS8QJn5WasxlxNnf9ODDDxRXY2eEnX+GKY0yoC59SA=
X-Received: by 2002:a05:6102:6d4:b0:320:7cd0:a5e3 with SMTP id
 m20-20020a05610206d400b003207cd0a5e3mr1575595vsg.84.1646401162809; Fri, 04
 Mar 2022 05:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-4-warp5tw@gmail.com>
 <YiCYshb354S9T5ev@smile.fi.intel.com>
In-Reply-To: <YiCYshb354S9T5ev@smile.fi.intel.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Fri, 4 Mar 2022 21:39:11 +0800
Message-ID: <CACD3sJZQJFvgNT2da+1Zx0UugoMRWNw4np3Ub3PTKejjS7X0Sg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] i2c: npcm: Fix client address calculation
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
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

Hi Andy:

Thank you for your comment and it'll be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
3=E6=9C=883=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:31=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Thu, Mar 03, 2022 at 04:31:33PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Fix i2c client address by left-shifting 1 bit before
> > applying it to the data register.
>
> ...
>
> > -     bus->dest_addr =3D slave_addr;
> > +     bus->dest_addr =3D slave_addr << 1;
>
> 1. Why this is not using i2c_8bit_addr_from_msg() helper?
> 2. This is duplication of what npcm_i2c_master_start_xmit() does.
>
> Taking 2 into account, what is this exactly fixing?
> Sounds like a red herring.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best regards,
Tyrone
