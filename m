Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0CC544CD0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 15:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343557AbiFIM76 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 08:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244167AbiFIM74 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 08:59:56 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D195313EB9;
        Thu,  9 Jun 2022 05:59:55 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3137eb64b67so38601227b3.12;
        Thu, 09 Jun 2022 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=adYpahK+RjveaJ81KLRCwb/NRKB4wZWg1u6S/wEqrF4=;
        b=XaYI4mXJjPjBN4hM0twTQo2PvDXcOm4PS7KigPBCBQNHaMvy1DG7taA5VgGSKu9Rrf
         qDhflEU075jABeHjt9t3KE26MrRacH9p+sB0JGC/3pbAeMQwsxwa5adPAygilD9WlZx4
         GliIFVV2lB790+7OHqVR15ZRpwQEN5/4C0CahvkMwDjdyjupRDoN658mVFLhX4UvfATA
         s8B8AwhBqDcgzgmrMpMnGvx9y7crj8yk+ucAMHG8FCL7GVW7cc4fJnH4erB8v4SUTSsu
         Xapdix/S1m8IjzpYKChODpQ5qMzXr2L2c4UZfPETCrXpcpfBBCpuakJTUQRGFBzjIbBv
         HXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=adYpahK+RjveaJ81KLRCwb/NRKB4wZWg1u6S/wEqrF4=;
        b=Dc5bV9Cto3rDKqYQnnIU5cKqSr7yVgKbHzlCT62oKU2VHCsSeIzTvzOSjJp+//2tSV
         TuoqWkT/q03ZK16NCB947Pp3JDt8buyXtVBOgiQgAnhEW/L04Fi5ObuCn0eIpZ9n4ocQ
         BlLQeVtbt47nVkJ4x0fbFU+3VKOSrnFf+/Pz2MXs0pqqCkQ7ejYyl5fxybHQH4/2RU1C
         jUDwMS18k5j4HY2PwZUUR3D1U/aOzh7tqgnRbeb4/UHKVgx/SmT44DcqanHHouTwUZg+
         hphVAlY7duBzeJgoLWrNfa5ixURjK4ted7YK5uZNQR1fmG/xjEsudQ73js91d+BUKP8W
         ZYeg==
X-Gm-Message-State: AOAM533RLcsEn2y3QD+qK9QMRglg+0xjeDxFvAtB/9hBMdPQF6EPTmS3
        W13oKqCpInyKmAS514bTGDcuKVloj91IYPwX/w==
X-Google-Smtp-Source: ABdhPJzb42fHZWsZOMjZ1rIWT3YnhW413kXIySlzuQKMmPXfvAAo94UdOeKLjvw7k6z8ZCoVoV1C0/g9x4fI47aGp84=
X-Received: by 2002:a81:4bc7:0:b0:313:7a99:5c with SMTP id y190-20020a814bc7000000b003137a99005cmr7071984ywa.51.1654779594980;
 Thu, 09 Jun 2022 05:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-3-warp5tw@gmail.com>
 <YqEAbm2T5zKmk/Nw@kunai>
In-Reply-To: <YqEAbm2T5zKmk/Nw@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Thu, 9 Jun 2022 20:59:44 +0800
Message-ID: <CACD3sJYEud8yagD-8m1UWYNmk7-gkg3R-kmK40Mf65cFb9N5eQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] i2c: npcm: Remove own slave addresses 2:10
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
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:38AM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > NPCM can support up to 10 own slave addresses. In practice, only one
> > address is actually being used. In order to access addresses 2 and abov=
e,
> > need to switch register banks. The switch needs spinlock.
> > To avoid using spinlock for this useless feature removed support of SA =
>=3D
> > 2. Also fix returned slave event enum.
> >
> > Remove some comment since the bank selection is not required. The bank
> > selection is not required since the supported slave addresses are reduc=
ed.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
