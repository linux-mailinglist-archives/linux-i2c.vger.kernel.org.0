Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44DEC544D1B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 15:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242679AbiFINIP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 09:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343690AbiFINIH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 09:08:07 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991931AD92;
        Thu,  9 Jun 2022 06:08:00 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id i39so13653585ybj.9;
        Thu, 09 Jun 2022 06:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Gfktszpwr3FPrB93OMpoU20SlFs9qNN/2hDsqmlef5k=;
        b=AvOl4xBJ6PnwNdqiF2CKMUAGTcWvqboIOllVEQ5C9KnjMuMolhKVFOT56tSfI4Lros
         e5iFVGtxosHS8uzp2SM1qfNWqqvxfH7CG2ROKj5f0X1yL2or3MsbsHjFhn0e9Wlv5/Jf
         /zbtE2t4beFBLcZxEuFuV/PYmkPLjVtd3Nbt46j4BACWUpws35POMp+bmWZgyo9ShLjr
         eWtF6eB1mMOMHdyc5f+27IhzVEn/3w8gYU9qJLJ1NAQY6fN0Z58l04GZ+eXFug+LZSX8
         SiFACc6u5T3ahUq6m03kIUZ7G1w81czG2RkCNhi/dnuB9h+OaN4EKcRL7s9IjO57wcIf
         r4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Gfktszpwr3FPrB93OMpoU20SlFs9qNN/2hDsqmlef5k=;
        b=kGjMSMehgP/IQ4iG8/iroudQ23q1ToQn80UhsEU1dY72ZlRv+vGftzkcgL+P6iB3iS
         LWyzoA9u8d/A2Wj4q1YCpj7ky22f0qTlRy3JCA801oIILtyFbwLZmMfT/elzHKl7Ygte
         RY20e9G1AY4XQqq1+jjtg4jb2KvsuwJm9tG7BwmWQ8UHRvL94ADyTUk3E9C29ZwPNqTT
         vQy9nrdcZ5pbiz+D9jueHm3ji6TzDg5oj+htVH3wGRXNBvD09NU7IOzJdxIFOvIbc2xx
         wuVOfGq2CFIKM9aCfcTP8bo06HYmGvKjwNJpgwM42lbUhXUmv9M5gCugSss/N56U414n
         7KNw==
X-Gm-Message-State: AOAM531HnxuzJnEd7RhhJgUPGkvueChSFpOvnUJt/taUbXY27tggTTg+
        LMRBeE568EDY9/AWoslgdIROXiTpQAXmGa49nw==
X-Google-Smtp-Source: ABdhPJxKIWoo2Bn5OL7cz4byjE9SyenNt+2UbaGDu6sWH+o+y9J0RqD6ys/c9I1Gax4iquiL4SI9x2tvzNZDOZ5Is+Q=
X-Received: by 2002:a05:6902:84:b0:63d:4a3d:eb5 with SMTP id
 h4-20020a056902008400b0063d4a3d0eb5mr39339883ybs.145.1654780079760; Thu, 09
 Jun 2022 06:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-6-warp5tw@gmail.com>
 <YqEArxDJoUoPeiGY@kunai>
In-Reply-To: <YqEArxDJoUoPeiGY@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Thu, 9 Jun 2022 21:07:49 +0800
Message-ID: <CACD3sJaHwh2uvdrFYwRB84ZM94S7iGW9oFhWb6GrYGkNAU6K9g@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] i2c: npcm: Capitalize the one-line comment
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

Thank you for your review and comments for this whole patch set.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:41AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Make the one-line comments capital in the driver to get the comment sty=
le
> > consistent.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
