Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEFF52FC68
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241150AbiEUMge (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232693AbiEUMgc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:36:32 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92DFE0AC;
        Sat, 21 May 2022 05:36:30 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id m203so5168290vke.13;
        Sat, 21 May 2022 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=88aWhuqLs48EjscpwDp8i6PCYgkUo8462NUVXo2FVNA=;
        b=gUz5LdAEB5GxPpTjh1e8cjpjIMcrQpFsYNFNVGK/BPs9nt34cI8exCnEEZ0o1WMZee
         NI9JISZwwxqCJJfphAhwkxrcNyEFmuPHazmMcTWaKXs46ziSwGLgkwKoRdFfsZjfGJhV
         DwRmE4ispD/0SbCLONa7xQWSuS8nPeioFkLaucUZJrtKSf8n+Mf78bQ0yuaaAFPLwVUT
         BOQNxNjCGJv/ediiRTnsaZVxABohBoI/JoSfXXA3LmBqM+lv8pJJZfb6tXQ8rERKuTVE
         55QiOLT0vwwraKtz93jSzeQGofeCM0AJXP7LwEXnrcVpFF9nfyCkeQFguZDUObMfc7w2
         FVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=88aWhuqLs48EjscpwDp8i6PCYgkUo8462NUVXo2FVNA=;
        b=PaLBjj2PYtnkmPkkoI3Npb0UsPXHZMVrGlbx33GC2XPKwKJ3BS2JKPQteM614beQKw
         eixh3yfgOaENuMK8FX6CflJYHMN0MmCFG+BMu5oXDQk398dsgU6wcJ1BzEP4MEmbAKLK
         2IU6rQbLM4OZDjJYNhnBgxBqzeMu0Q10B9p05gDiinODQBlForQfDPs3INCmCD7YmGJr
         svJFFiVp+UoqjzuiJgkwDc9J0c+WjLzcJyd2zQQWAZ1WdmLayrvCrwulXjRkpIv3uPPQ
         a22ycJDm5IRlY5r2zFQ6vg72aeYSnlNEt4yjQ+HquZ7/a2W0O5sTmsEU4iE08Ail8alJ
         myPA==
X-Gm-Message-State: AOAM530cHkNcVF3gp8O8mfbanJOg7TOFyFl8vy+BzvlkdoRR8WisQmBh
        MIj1yZ+Jo45NnEEbkzCYLOEmysCsAb7gHls9cg==
X-Google-Smtp-Source: ABdhPJyKo2dgiaE4q9V+2eJn02CIy5nUblJlWy/nu1zDZs6GmSd3FvSRN3TranOng2H4DBrLGGjHIZvth/2ZQBBIKng=
X-Received: by 2002:a05:6122:8c5:b0:357:8a48:5239 with SMTP id
 5-20020a05612208c500b003578a485239mr162784vkg.5.1653136589971; Sat, 21 May
 2022 05:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-3-warp5tw@gmail.com>
 <Yoh9yL1FO7aXme69@shikoro>
In-Reply-To: <Yoh9yL1FO7aXme69@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 20:36:18 +0800
Message-ID: <CACD3sJYuPJM5NCrD85gnBe=JEvfsfyjZN18prDwY043GqHAj+w@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] i2c: npcm: Change the way of getting GCR regmap
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Got it and thank you for your review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:34PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Change the way of getting NPCM system manager reigster (GCR)
> > and still maintain the old mechanism as a fallback if getting
> > nuvoton,sys-mgr fails while working with the legacy devicetree
> > file.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Applied to for-next, thanks!
>
> I dropped the Fixes tag, doesn't look like a bugfix to me.
>

Best Regards,
Tyrone
