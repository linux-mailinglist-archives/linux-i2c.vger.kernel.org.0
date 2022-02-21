Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4884BDD68
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 18:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243462AbiBUIro (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 03:47:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiBUIro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 03:47:44 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693CA2BB;
        Mon, 21 Feb 2022 00:47:21 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id j3so2571040vsi.7;
        Mon, 21 Feb 2022 00:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7bU+t7iJxXJ0OaoM2yVGvL7go0S1hioO91rPjZv/0z0=;
        b=FrtcLlrS/mN+1ArTCSqQJP7OwWJSKnAIJoEa5iarc+OoEiID9eblolED3MW+RpC4iI
         Uj30iVniCj9z114z9iXB5YPM3o8zMMxdE/XyclQUnkTJmjc7xdNvdEXqtX9zBX7B5P9x
         8NOmjkfVirVkz4mkkYwkCObwJee276QceLrN8lO1ulssWB7HaA27T4BlB8YKaB9Hee+1
         3g8lLGE+rXQ3gmr7VTsZS9PcV6ZDbMeTWrnyk0fQditLy3NT4JaZ+8/DHH8cgYeg96jp
         H7kmCh40l0g5eZp7iDk2YhKhCTCI3douvetEz6cRvpjYB4vUamQT9Hk8fKmX9GUj79nr
         XTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7bU+t7iJxXJ0OaoM2yVGvL7go0S1hioO91rPjZv/0z0=;
        b=zkrBsNmYElpzkyYjShqD0+4gYsm+D5lF2Dy+spB4Vi6ZPyO3c9xhnftyWTAMaEIa3i
         xPr+u7mY29J7HU1kzMfkereHKKy395GI1UIrP9zer/wxKilVqdy247VmBaSqGcE9Xi5c
         HJ1652JaX1RoCNjcuAbAiBVR0zQM+OnLJNPhlI0qdVeq8GpOLXHJjfCLMQL0Rk5rCHk5
         OB7Egkhu/VtblNfpWqd4RhVvJ6j61lZoQE7trltEU7Qxw82pD5l32qv3y4YYGcAUBiZp
         m8mayijVmeu8oi7yFTtjB0QmMd5ZRNUepP4RODjkqVU27wU3ByVNZYEMFtyhlgR7Pti2
         LOhw==
X-Gm-Message-State: AOAM5336gcCCPDAaQuCIVz6SZ9kJOkORj1M00uq9WYdtKuPABUQa7dbl
        VP/osuCj3clSD3oFIj7M7vniuuAjVsmYRnAciw==
X-Google-Smtp-Source: ABdhPJz87q7UEAPD90zMY5JUvmglimvP7o+lLeN7nmUzh3gNThbLp0iMMhFUe/WQABY4n4qBW73VqlU3+BeJKoEH4IM=
X-Received: by 2002:a05:6102:370f:b0:31b:60dc:4f76 with SMTP id
 s15-20020a056102370f00b0031b60dc4f76mr7914160vst.2.1645433240460; Mon, 21 Feb
 2022 00:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com> <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
In-Reply-To: <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Mon, 21 Feb 2022 16:47:08 +0800
Message-ID: <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
        olof@lixom.net, arnd@arndb.de, digetx@gmail.com,
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

Hi Krzysztof:

Got it and thank you for your comments.

I'll keep old code as fallback, if getting nuvoton,sys-mgr fails as
you point out.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8821=E6=97=A5
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 21/02/2022 09:16, Tyrone Ting wrote:
> > Hi Krzysztof:
> >
> > Thank you for your comments and please find my reply next to your comme=
nts.
> >
> > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=
=E5=B9=B42=E6=9C=8820=E6=97=A5
> > =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:30=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> On 20/02/2022 04:53, Tyrone Ting wrote:
> >>> From: Tyrone Ting <kfting@nuvoton.com>
> >>>
> >>> This patchset includes the following fixes:
> >>>
> >>> - Add dt-bindings description for NPCM845.
> >>> - Bug fix for timeout calculation.
> >>> - Better handling of spurious interrupts.
> >>> - Fix for event type in slave mode.
> >>> - Removal of own slave addresses [2:10].
> >>> - Support for next gen BMC (NPCM845).
> >>>
> >>> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation board=
s.
> >>>
> >>> Addressed comments from:
> >>>  - Jonathan Neusch=C3=A4fer : https://lkml.org/lkml/2022/2/7/670
> >>>  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
> >>
> >> How did you address the ABI change comment? I still see you break the
> >> ABI with the introduction of a new, required property.
> >>
> >
> > I add the new, required property "nuvoton,sys-mgr" in the file
> > nuvoton-common-npcm7xx.dtsi.
> > The file nuvoton-common-npcm7xx.dtsi is required by the existing
> > upstream NPCM devicetree files.
> > It is also updated and committed in this patch set [PATCH v2 01/11]
> > arm: dts: add new property for NPCM i2c module.
> > Please let me know if I misunderstand the meaning of "breaking the ABI"=
.
> > Thank you again.
>
> Breaking the ABI means that old DTS stop working with new kernel. Your
> change breaks old (and out-of-tree) DTS.
>
> What is more, your change is not bisectable because DTS goes via
> separate branch or tree than driver change.
>
> You need to keep old code as fallback, if getting nuvoton,sys-mgr fails.
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
