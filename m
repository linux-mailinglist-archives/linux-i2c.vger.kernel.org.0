Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6BD544D00
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 15:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244398AbiFINGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 09:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236095AbiFINGU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 09:06:20 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BA11A831;
        Thu,  9 Jun 2022 06:06:20 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id r3so7498900ybr.6;
        Thu, 09 Jun 2022 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Pg1uSbt+5F+q0T+5YfntGf3p8VXaWjfEA9ANle3En2U=;
        b=hlVgN2RNaysjXtI72nuyLVRODGVEdRbSDDhzDhzWbB+I+NsvGhLzFG1friAVKrCtgI
         XRgwc02AKbV7G5ciKkqhmS+iGAsO2qr4VpX7AKZdlTFlhCUcPRE6ub+8IOV7kt2iOj2D
         AD4a4PEq4t1yP74sAKfzZCqFYKYLrozI1+Nf9bRIK6zd+CtCE+7/NpOkTCXk/BJMH6u7
         huOJRxoBjDLg4IUCDFIOI7ehSB8ZiduB0TV/qXmDvPqtcLMZ9K43qexeZIDPKQ369GZb
         e9HIxt+fra9MgCkOXCOUEXQRh28k8giOxw0EMeG0aDA4Dq/GC7jZLjUsPv865zb41wZD
         xy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Pg1uSbt+5F+q0T+5YfntGf3p8VXaWjfEA9ANle3En2U=;
        b=eS4MrNHiI2bwxjp8Ai2tlbbOyl8gZYDmpPvfHDl+tDfnManfn4uyTYsyee1B/+qf+d
         2pcYleP2l/zNUcyEjbUXZOVtMESukBB5iGL6FkyhI90PnRyTq5LbMMj1KfvLz3jpUF7i
         hl1N1hfvC45+fw6TP50i1FeURujdxoEfDhdeB1+P68RhaY0eZkgjcc4X8eMgSrLa85TM
         eT+dqXuSHXSGZzZQJ/TnYuM2CHyufrl6GbXbWzxAahsIobkUcsTVoEqDxdZ2qVlMJyB9
         ahjSHnRwR54YQ6JdDFirwFuEuhKhMNZlGXh2zha6g0UHRRGZ54rEtmvgRVQZRXx2kgd9
         F5lQ==
X-Gm-Message-State: AOAM530Pr4acKsxasvtDrO108woQBXrvOvhM8kFtDeHry8BjLkJ/XUcU
        sub4Iw2J66mLyAIAXOq3KbPx+QeGD9YIzeQM1w==
X-Google-Smtp-Source: ABdhPJw8dPUiN7w74XOgE90ezMUwmVLRGc4h7RO8Lc6z8d/C3yKPl3uNHR9hTeYnbSZJl/XuNhUdEctCmpK6S+ArZCo=
X-Received: by 2002:a25:8809:0:b0:663:e8fc:7974 with SMTP id
 c9-20020a258809000000b00663e8fc7974mr11576057ybl.45.1654779979194; Thu, 09
 Jun 2022 06:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-5-warp5tw@gmail.com>
 <YqEApWattWwRIS2H@kunai>
In-Reply-To: <YqEApWattWwRIS2H@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Thu, 9 Jun 2022 21:06:08 +0800
Message-ID: <CACD3sJZ0mXttAyoFZqKzgNpGS+UW7fEvfYrnSAMgNOUFx=XVBw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: npcm: Support NPCM845
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

Thank you for your review and comments.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:40AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add NPCM8XX I2C support.
> > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > The internal HW FIFO is larger in NPCM8XX.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Acked-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
