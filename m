Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D9952994F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 08:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbiEQGJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 02:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbiEQGJS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 02:09:18 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3399537A37;
        Mon, 16 May 2022 23:09:18 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id y27so8553885vkl.8;
        Mon, 16 May 2022 23:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=X3p/bJpggzYIlRPwptvT4yV9Dv1X4oCHyy6l5VIG8EM=;
        b=AwPZC/c3Z9TSGTZRgivdf8rrE7Z+UwN+w8JlZlCF+Xg1e0bCfvOvyTnpSE5ve3+Wl8
         rMYGCZD5m6z2jwvW3Bn1HV1nDLYwWX6/h/0o+GgOvOzQASOebkBEWjUuDyuw9XeWlCjH
         ehRDXSuDNo0JXNRQ/82tPQ8OBb348SWgJA57PxQST/OE5Sw/ewF+1ld0mZ7gsMRancXy
         i0SP3xItR4NOphFHCnAv6+7wzZ3rs1P+RVfjmDPCdlfSDmOXp2ylRsfcZ6zOutcWb0ic
         0j5AMtl/1TgssVjgY22To693SgD3ldeGVx0iPtq4hFt6aq9HuM7qTwebpCaeCXiaMZJw
         16pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=X3p/bJpggzYIlRPwptvT4yV9Dv1X4oCHyy6l5VIG8EM=;
        b=s8Dchm7EpI4iboN+wJ21vmqum2lAx3Huht7gHi0SqYlAEOzvg/isRvIuXiiXJuAIeV
         G25IH6koB3Steui+Pqu3LosJK5IOOxlDkSxMKSARuP0RV01nAXuBFVs64rvNLiya9Ga0
         R1Atgl7GjuvOU8uNLGt4MiCAFgqleiAtbe4IcyuM3M99z7wVYoVZVcKcW4987HxOFlAb
         H+vxTSzWcFK9jmhY5KxM5IRpBeWFje70TRU3lLiWG49FXL8os+AI8iFiuDIzjNJHeY4j
         3ieN9VXtY/e0pqA4cU46RZyi9qLc11ShdS2YrDm53N0KtsQo0l7vq+MNxWZLALGDpZ/M
         kxHw==
X-Gm-Message-State: AOAM530wFnHUUfADLHEMjQZb+vIFLZ6OVBjJw8D/wFis+iY95dtFmdeC
        N/C6jSOw5bDFKRFiQGn5Vfnca7EfeWWSyH8nWw==
X-Google-Smtp-Source: ABdhPJx31C9WjnaA9Ui9cwwZ1/uZK5DCWJXNtlPrRxpk2SIkz1TMVt6x3UUJ2oy3erDGaLz95TXTNxD5ZEF34kG90kQ=
X-Received: by 2002:a1f:3254:0:b0:34e:b02d:bdd7 with SMTP id
 y81-20020a1f3254000000b0034eb02dbdd7mr7928465vky.11.1652767757269; Mon, 16
 May 2022 23:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-3-warp5tw@gmail.com>
 <YoKqdfLSeJ69WFhi@kunai> <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
 <YoM63XoYZbFGJ8s7@kunai>
In-Reply-To: <YoM63XoYZbFGJ8s7@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Tue, 17 May 2022 14:09:05 +0800
Message-ID: <CACD3sJaJbmoR-txb2V3Q=YkKpMD76S4zvF5_5SyVmUkPh9tvMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        jie.deng@intel.com
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

Got it and thank you for your help.

I'll come up with the new patch set with the corrected SoBs.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8817=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
> > After reviewing these two links, we decided to keep only the author's
> > SoB for each commit.
> >
> > https://lore.kernel.org/lkml/YiCZlhJoXPLpQ6%2FD@smile.fi.intel.com/
> > https://lore.kernel.org/lkml/YiCb7LNY9tmMCZx7@smile.fi.intel.com/
>
> When Andy said "chain is wrong", he meant the order. You must add your
> SoB, otherwise I can't take the patches. But yours should be last. The
> SoBs need to be in the order people worked on it.
>
> Does that make sense to you?
>

Best Regards,
Tyrone
