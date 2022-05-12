Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F629524215
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 03:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiELBbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 21:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiELBbT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 21:31:19 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B41994CD;
        Wed, 11 May 2022 18:31:17 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id z15so1453422uad.7;
        Wed, 11 May 2022 18:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=izi87e4xdMz6LmYhPRp48LrcOnBQxKpRxLhyMwRFH0c=;
        b=b+gkm0bYZ8uNyQdSPV8PZRfQzGQtBxCjNaHXwmxEEL0encPEDceqhmcqMKWc0J86VO
         bWKJZ22mU/irATvyq2v+pvad+frrSJonoOeNZY5ZnPxTX5xPMT5N9L98udGOy65AJNdN
         KVgw5ZZtbxRJx/PRPeauWz4VDF0F/c9pKfyzKqQuMChX5EV0FMx68sjGjEJZMkE9d8Ka
         XRNTbhCDa/cw+Nh7u4WXo6TS+4uQUbXXkllNcdQIl1uNAR7s5AZxD/e+Y4vjJUKjOGVF
         yy5/JYsMs3tgryVPM+OadJcWrcGKENrirKQuIaQhOB81t1Z8/sik9haw7XbLw+psYzGt
         uuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=izi87e4xdMz6LmYhPRp48LrcOnBQxKpRxLhyMwRFH0c=;
        b=ous5EYgl+ixcmRrTawnAuDcpC0+JOUqy+rJLrTI2GV+fYE5yBhoV1KMI1Lplv2hnjw
         XWAGz9aD81V0NezmKSe7fu8IRZiyjRx0cs8wlw1iJCoLv5i9FZjOtRgxpSNwNrVURLDW
         VS39OoH75PzTzV6II/HT3BgnNgIxoI7FE10f7V6asEcbhKG6Ybju94x9OM9ms3m3pqPc
         RXdzn0eqoMxwmwbnTaefT274VmTPQdeSANXAVGUdL6Jz8olmMRt3UDxWUeLwHJXgwN0p
         D4TnPTcTDAAJRLPx8VAnXW6LymKwBWC2zbpGFp7TQbHrJ9NpxkeGpNN+L/Mi/XidkL2g
         kUsw==
X-Gm-Message-State: AOAM532QWSXib+eW6JWUD4OsdtSpfzrjKPmtPa6EDRvaOf6AJM/D5EXq
        r4t1UVdLaHSzW3TtRFh7X7ZaHBjMb5WrU6Aa8A==
X-Google-Smtp-Source: ABdhPJxFpJ2a8wB4d9oBe1bLcmgo7DLtuCR49Ty/ZdQW74K93TPNyttHA0PwWQOkkjHrO4v0bEo0GynEtX+sVQJYVkk=
X-Received: by 2002:ab0:6f95:0:b0:362:8cb3:36f3 with SMTP id
 f21-20020ab06f95000000b003628cb336f3mr15208878uav.46.1652319076461; Wed, 11
 May 2022 18:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-2-warp5tw@gmail.com>
 <20220511152422.GA339769-robh@kernel.org>
In-Reply-To: <20220511152422.GA339769-robh@kernel.org>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Thu, 12 May 2022 09:31:05 +0800
Message-ID: <CACD3sJbiPYcckyLncXcVR-TFBo_-3XwSDYbmid4qwnoHX-JtUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
To:     Rob Herring <robh@kernel.org>
Cc:     sven@svenpeter.dev, JJLIU0@nuvoton.com,
        linux-kernel@vger.kernel.org, olof@lixom.net,
        lukas.bulwahn@gmail.com, jarkko.nikula@linux.intel.com,
        yuenn@google.com, arnd@arndb.de, tali.perry1@gmail.com,
        openbmc@lists.ozlabs.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-i2c@vger.kernel.org,
        tmaimon77@gmail.com, benjaminfair@google.com,
        tomer.maimon@nuvoton.com, kfting@nuvoton.com,
        semen.protsenko@linaro.org, Avi.Fishman@nuvoton.com,
        jsd@semihalf.com, wsa@kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, KWLIU@nuvoton.com,
        tali.perry@nuvoton.com, avifishman70@gmail.com, venture@google.com
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

Hi Rob:

Thank you for your review. I would like to apply Krzysztof's comment
from the link https://www.spinics.net/lists/linux-i2c/msg56795.html
and remove the
quotes of the statement "$ref: "/schemas/types.yaml#/definitions/phandle"".

If it's okay with you, I'll come up with a new patch with
"Reviewed-by" from you and Krzysztof.

Thank you.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 10 May 2022 17:16:46 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Best Regards,
Tyrone
