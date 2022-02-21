Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDE74BD7CD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 09:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiBUIRl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 03:17:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239108AbiBUIQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 03:16:53 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9930C1AF3B;
        Mon, 21 Feb 2022 00:16:27 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id 4so7572110uaf.0;
        Mon, 21 Feb 2022 00:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ZtiehFZPrmpWvveDKWHT6rZBAs1vzApL4d4uaQ55HM=;
        b=P1GYRFZQeNPXDzMXWJMxK1Yx5Aiz56hvaICJRp4ELbWmjcvC2CljnRwc/RkSBLwm8C
         TvcnGVTln6qK7UEbtJb9Q784S9w0JvfjCLBlD99ydBcfj2HEXUa4/SRKzvw9gUXFPqUM
         e4jWTf4H0mAw8dE8PqxzIciBHPF4Y8x2AYqK+RIDZBA+7NcDreAWaUiCe+skZFOps1RA
         ThBwCqO4Ruxw2Vd/8MhEVA/9dOAcrjDUSmMkgaF36az5l/0DMjdbmH04n5uhdkaFgf31
         Z0L3V+iR9uJjo+wfRWUWd4IheeWR0FOC7u2J1mqrYLBCJaL9YZ7pvC0cfJeYvIARTgAB
         kLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9ZtiehFZPrmpWvveDKWHT6rZBAs1vzApL4d4uaQ55HM=;
        b=D4MGkUFGlOUPTQGZ/iafirC1Z8PQqWuELrnvaGsxlqAADr5OuIzNc1gnrd3uYZCC16
         0lH3BKZqr9bjubVGSIWgLUmmeDOBe6q+V6bsprXkh1h1pkRwC9gU4pFrPf5AD+zVJ0h+
         Nm9MLvIP1hnlAhmo9FlxDBjqXpRJVWWeOOeU/0WdSmnDG3FHbKnBf7gwmMn9LEofOwXA
         hWx11fFeT3OQmeLozMJ0d8ZygTM5X1tuvPojp+5mkRWC69hcxzbwq//crrIxijQfw9+O
         L27AGKlzBWTZ6ERiyY62gl5PsyYCagsCq3gh561cr4p0QuNDYnAKq1gTUFWjmC3T+nkF
         unig==
X-Gm-Message-State: AOAM533KkIwA0gv/BRP941zPwLWc0deHCwzpAZ2rpIaEWrMOaNApgovR
        TdRToFGs61jO/SBShk9DpwhXFXtEYwugGOuP1w==
X-Google-Smtp-Source: ABdhPJyCMqtc8yHa/Q//l3WPGW/u7LD/b3KNuHBI4Tjjh+j6t4LGe5SjDXAiedVRJD5oqBZFsxBlyHaEwvCXTA8W/yw=
X-Received: by 2002:a05:6130:388:b0:342:b8e5:15c2 with SMTP id
 az8-20020a056130038800b00342b8e515c2mr580343uab.85.1645431386642; Mon, 21 Feb
 2022 00:16:26 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
In-Reply-To: <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Mon, 21 Feb 2022 16:16:14 +0800
Message-ID: <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
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

Thank you for your comments and please find my reply next to your comments.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8820=E6=97=A5
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 20/02/2022 04:53, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
> > - Add dt-bindings description for NPCM845.
> > - Bug fix for timeout calculation.
> > - Better handling of spurious interrupts.
> > - Fix for event type in slave mode.
> > - Removal of own slave addresses [2:10].
> > - Support for next gen BMC (NPCM845).
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
> >
> > Addressed comments from:
> >  - Jonathan Neusch=C3=A4fer : https://lkml.org/lkml/2022/2/7/670
> >  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
>
> How did you address the ABI change comment? I still see you break the
> ABI with the introduction of a new, required property.
>

I add the new, required property "nuvoton,sys-mgr" in the file
nuvoton-common-npcm7xx.dtsi.
The file nuvoton-common-npcm7xx.dtsi is required by the existing
upstream NPCM devicetree files.
It is also updated and committed in this patch set [PATCH v2 01/11]
arm: dts: add new property for NPCM i2c module.
Please let me know if I misunderstand the meaning of "breaking the ABI".
Thank you again.

>
> Best regards,
> Krzysztof

Best regards,
Tyrone
