Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2BE4E1AE0
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Mar 2022 10:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243227AbiCTJf7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Mar 2022 05:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241129AbiCTJf7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Mar 2022 05:35:59 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31BA985AC;
        Sun, 20 Mar 2022 02:34:35 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id a127so4713421vsa.3;
        Sun, 20 Mar 2022 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=k96JhXl3WCD4rA/nH5gA5Te+rz3QsUmRsaPBqcMVBro=;
        b=L5nbzkpvlCIIjhR5U72pm4Gf81AS26MXKr4gBtTeHv72wOkdrrqBi7uM58y4kWqE2L
         NaQTufKL8JYCwSb4AeDQ4RqSyNuuX2v/qfnVwIUi0KYhT+p0hdNzxYi/m4J+Xh83hhLz
         AY4oyZGSXslc4Xz2AkcKYSm/ovuDMGELJSCRXC4hU+Lwuk7QrBJfaWkF90Rfar98xHP8
         ZI7tD0cG+tmRHQuvhxHZxxWjx4/XrWJ1LHWRurhPjIkbOriLkGgjbfIArw6cP9IMLLEp
         00RTqk0BzNTdgi346D6z5BybWhzbapieP6zbFuXLJ4soZsSE9yOaCSPCaFK83VUn568C
         BZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=k96JhXl3WCD4rA/nH5gA5Te+rz3QsUmRsaPBqcMVBro=;
        b=WFXpUwqDRo3DCsMBqsBAFBa+BcXaLBPDNX3lVNmrX+iZ4osOi2wVOXZPEW/kjt6phz
         glo82aDVqJbbzF+NZBHMt2sKHvSoXYCkUuL6h8AXaDNhPlMyWuXQLBCIO75ScIg7id6G
         Ls4Xv2lddrU/eoh2xKDGc9kuTd3qXyFraOju9mJNQB5NcFwH+n7x9Ly0IrjVpEx9NMdl
         b09smpgPtvjs0+zpKOOpCQa8vAYd6J/jjt2okLODM+nuWiv/1om771VC8iaELEYHQx1A
         SzCKbexFSbSxeqGfMXKoNh8J+hMPpBtgoMtC89II5tWnKKVqe9aZTrokPFBqdOxMGwx2
         bdfg==
X-Gm-Message-State: AOAM53335ECwzJSAs9M/TqXpREKnmGovgSlnAUgaiJASIHuCI80D/ysR
        Lcy4h0mfCQKDdXsh98siw9HsBi0dLbm47yS9sA==
X-Google-Smtp-Source: ABdhPJxz/+otTMk11U8KJ5mGaJRfVbBxkf9afGF7WtFFI5Z9nzL4Z6guq/Xh6KBFSKcN/wtr1W2v2eCd6vYHLnmNABY=
X-Received: by 2002:a67:f353:0:b0:324:fc5f:5261 with SMTP id
 p19-20020a67f353000000b00324fc5f5261mr1031275vsm.47.1647768874683; Sun, 20
 Mar 2022 02:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-2-warp5tw@gmail.com>
 <YjTrgia/VX6rBT1r@shikoro>
In-Reply-To: <YjTrgia/VX6rBT1r@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sun, 20 Mar 2022 17:34:24 +0800
Message-ID: <CACD3sJarf9jBny8ru0YihehT4C6k1pqw9Ln+5a+Rs6_F_o6=AQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
        lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
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

Thank you for your reminder and suggestion.

There are still some discussions for the patch V4 and it might take
some time though.

Yes, the dts patch could be submitted via arm-soc.

I really appreciate your comments.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B43=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Mar 03, 2022 at 04:31:31PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add nuvoton,sys-mgr property for controlling NPCM gcr register.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>
> There are some comments about this series, so I am expecting a v4
> somewhen. However, I already want to state that I usually don't take DTS
> patches. So, I guess the path forward is that Rob needs to ack the patch
> which is now patch 2. Once he does this and I apply it, you can take this
> DTS patch via arm-soc. Sounds good?
>

Regards,
Tyrone
