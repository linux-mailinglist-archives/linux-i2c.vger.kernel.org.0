Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C9F52FC78
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239972AbiEUMzc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233051AbiEUMzb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:55:31 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA595675C;
        Sat, 21 May 2022 05:55:30 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id m188so1835708vsm.2;
        Sat, 21 May 2022 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H2xHMxkjcpE6Uaeb37HMcK9VGfIbnF/CTq+aAJwqeQA=;
        b=Nnt4/kluIb1bMHit+sR8kK3TADuPbS8W/h1yW7D9r+2OBn3yfQCIggFM29OUdOW99C
         Qni+kPF678aDYKJm1lVt++Mh7skT+N5bh1KrXLt3I8vl9tFZCQvJ3J7JT5S1hBsb51//
         bACnQz5K00WnqWxQ340RANSJ0kRukutfbqi4rxWT7d6ARQUntk6ya1N5THcNYto39pKx
         hUnDK5/ABzwIO7szi1+3+5IZJQUkVAuJme1+G6ysAqAjC/CH1TsQbCdP7/MSCD1W/yJW
         muxuYwMw+hC0wru1fZVqaPSMEsr7cbiO2/3oIXwil0sH/Y7VsTfdWShdUNpVTS0SJHkI
         /dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H2xHMxkjcpE6Uaeb37HMcK9VGfIbnF/CTq+aAJwqeQA=;
        b=01eutY0/8CHsnxNpenGZAIOpyEbidMm2dXNRF08dvRNnXZKmUEsM/H+DG580SKrRjK
         pnGAQ8XNg22EUFSWKn4CKORm9CRz46Vs4yZWw8+kQUkeshfMGJnYX5+0XwF0nZwdwGUU
         ZoJssF5qofTBEBylj81kQHBHG4aFHCPZVlqLw8WGAjHf0TQI3ci1Hi9+r/nEntODRFSq
         9RSDfCLa1BWg/qLb2yD+Y8/HA9T2aizh60Rgwqs+YF0eocmfcXlElnWbxAQf4fa1VzOp
         9spCO3HGN9K56U4jG/CkEuwes5RrAiQvRKNo1JQ/iwtuhM1Kc9OflWTQ+usW/BrJxguk
         vJBQ==
X-Gm-Message-State: AOAM533XEUEf2xdZzku9WkvJHTVz5Q73ShOp4BPoVpkTAMUjUc2nZokV
        kJk1Iie2OzbB9/yfKtn7C1R+ZhUQ0Xdekaja8Q==
X-Google-Smtp-Source: ABdhPJzQ2VfCqFP9LhoWMNuMbL7j9f/7je/mD/CUsRkDGjmqTFXaaGolpNH0JgmofFJ7a1BERDEpL2iUuEg6O6L3Sno=
X-Received: by 2002:a67:d88c:0:b0:337:9a25:36c3 with SMTP id
 f12-20020a67d88c000000b003379a2536c3mr813357vsj.84.1653137729800; Sat, 21 May
 2022 05:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-5-warp5tw@gmail.com>
 <Yoh+CgMPJM/Qp2V+@shikoro>
In-Reply-To: <Yoh+CgMPJM/Qp2V+@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 20:55:17 +0800
Message-ID: <CACD3sJYdcCUuWY3oZTgowsk5ayQicu+50M996v3maAs_67JtDw@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] i2c: npcm: Fix timeout calculation
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

Thank you for your review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:36PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Use adap.timeout for timeout calculation instead of hard-coded
> > value of 35ms.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>
> I dropped the Reported-by tag, doesn't look like test robot found this
> issue.
>

Best Regards,
Tyrone
