Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56B2E529684
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 03:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiEQBGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 21:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243436AbiEQBGK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 21:06:10 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D3F26C9;
        Mon, 16 May 2022 18:06:07 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id t85so17288681vst.4;
        Mon, 16 May 2022 18:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PqfKXA6ummtQ+loFC+cW0O+uRd4VLSHz2ygvVnQgwiU=;
        b=EwqkajjvILngo/hPlj2gD1B0kZLe+HqgcsLrswamUj84PjcL8x5fFL8PyyMx/WPQyZ
         J8y037SO1wFqV7A7t8TRJBitoBuKP+qt+bCSzrhcKo79VN7VsKM3rT8HFAGoV6xlOdf/
         yeDSi3FJmV84SvF24GORUnCEJij9TXExClyVBx1l481rYPTphONONmk6tr0kI34GlXwp
         MygAf1aeauH5DfQh10gsfHK8YfpuszVX7RIDU8wIMj2A1rV6/u8dFzNqV4HeHwNFIAxS
         5oYyRsRYQ2Yg705cfpRhl7bjBDSM2KGSEn3tmrNR7ioSni3NF2DNc/+fumrg2jyGAZvA
         AYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PqfKXA6ummtQ+loFC+cW0O+uRd4VLSHz2ygvVnQgwiU=;
        b=eUtcIRL/e4Ed/4Ni0aCoPPLNlIc6WUippa0glJ+C0z/2rsnF+dfYLODcEsl6li2rHQ
         wXEeX2b6ih2VaFNHiQ6lNUIiwn2k3w586QBD54ubU1jjTI5ErX+HbyDv7AqBnRmCTnSU
         3g/A30fZFM5V8FN1MsV2XYoHzt0mura1JRExkeB563P4eK28Lz93hX7UQeulKV73v/ED
         cnFongLXu0RwByHjAQtVvn78rIDHVrmPan3/UtcWvTsB+WvbEEuBYr1QY9OUGCY06uHf
         5W5YiFEYgyhSQJPbQTX8VF/bNLutkVE1CrdvB0xa//DmO9wCQWDaXnlNYBc4RLcpskzg
         S3Lg==
X-Gm-Message-State: AOAM532eUdG/RjT59Y7CqBiRlhCvGr+WzCoR3mAvo/ZE77UCPzRJPpz8
        GjwM5Qmds5q4kc/Tk9+RnD8MU7dmuWitSxXZXw==
X-Google-Smtp-Source: ABdhPJyHd5SN+PJcKF3EF7zTD8roA8ERM0HTQe4FTb7vQj3gof9y61JaQmfxGfW5LVwLF5BKV3X/Dz4+dgmGOzY4HTw=
X-Received: by 2002:a67:cb98:0:b0:32d:6652:cedb with SMTP id
 h24-20020a67cb98000000b0032d6652cedbmr7824968vsl.29.1652749566894; Mon, 16
 May 2022 18:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-3-warp5tw@gmail.com>
 <YoKqdfLSeJ69WFhi@kunai>
In-Reply-To: <YoKqdfLSeJ69WFhi@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Tue, 17 May 2022 09:05:54 +0800
Message-ID: <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
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
        linux-kernel@vger.kernel.org
Cc:     krzysztof.kozlowski@canonical.com, jie.deng@intel.com
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

Thank you for your feedback and here is my reply below.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8817=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
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
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Tyrone, your SoB is missing for all patches from Tali.
>

After reviewing these two links, we decided to keep only the author's
SoB for each commit.

https://lore.kernel.org/lkml/YiCZlhJoXPLpQ6%2FD@smile.fi.intel.com/
https://lore.kernel.org/lkml/YiCb7LNY9tmMCZx7@smile.fi.intel.com/

Best Regards,
Tyrone
