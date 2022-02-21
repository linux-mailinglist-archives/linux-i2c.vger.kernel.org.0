Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F454BD7BF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 09:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237863AbiBUIcP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 03:32:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiBUIcN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 03:32:13 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E321AA;
        Mon, 21 Feb 2022 00:31:50 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id n142so8214523vkf.5;
        Mon, 21 Feb 2022 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tHxyOUfMHqTikNQZhmqKh+kXdtIHhN+LVh74A17t+GY=;
        b=ZmRctxBTa88LrYcPKv48Jo2DOkCPg3J8+BJGa5YAf4qOWj4lDPQyaGBnoh5LK07bSl
         GuQkwjUEljvrWqMVuobUqaDSiNGYe+hM4PAXzMX0AWUkzf3BLa89jzcu+lGYqfr3xev/
         jYZ2jaurO3ZKelDzIG+mbyK1S6C2u8hbxw8cd85rRcKq5RqK4laMNsQ+3j0IVgE99Tgn
         H1P+umePLXCVFT+WjUMEjkZn6ysW3T2YbFaE1mR4PeaygwaJSX0pxUGx7LWWr32xnNGM
         vCr3y9faUhyqQ+zxyJrFPgICPPI5FYG6b5XT1TgCEIjSYPIqbVEUkfJefYNqUTix8Ec1
         pzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tHxyOUfMHqTikNQZhmqKh+kXdtIHhN+LVh74A17t+GY=;
        b=vhY2ug2mYcp9CZQ9wlHvYA1HOnXfj9bRf7aphI52gUTyYdwdshY1YLiJuKVkwncMbv
         XGY8FT9ZwiPXAzTMh1an6U6nz1KK3Ht/wXzwdcgfQ+RWpHP3NV93suNA+mG+POOKVE/S
         R8RBK3cNp93e6+Qe/U4X4P+WqvOPieVk0T8eUdcAJXtBhbQz/LLcTwGO60opVCOc/pcl
         gRrV6FOFpffs+44UzTNS6vz8u58LPlHKovw71W5Bm/gykjIigCUO1ZeHZFrxKy/QyWbk
         +oAIt2Ooj73rdcNrr0rOkwD7vtDPcEwI2xS6RDACF7OuKQm2xJ16ucX2yPugt1vqHdcz
         7r+w==
X-Gm-Message-State: AOAM530bembsqkEwvKtF301qtSR2oJyow/SostmLPjrTRI7NquMW86o9
        y2FMdcqUhrr/6182cA28btqRTMJ4Ec/R1v/NTw==
X-Google-Smtp-Source: ABdhPJyO2ShXUpYzMd0qiTi2EndkIjvRyGYXHcDdCeZDikC/rlrNM+t7NrbqGV6Pcl/kj/FJx2GB9JU1jI5j/1eJS7o=
X-Received: by 2002:a05:6122:180b:b0:330:ee39:966e with SMTP id
 ay11-20020a056122180b00b00330ee39966emr7269125vkb.5.1645432309857; Mon, 21
 Feb 2022 00:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-3-warp5tw@gmail.com>
 <1645410969.402841.2041548.nullmailer@robh.at.kernel.org>
In-Reply-To: <1645410969.402841.2041548.nullmailer@robh.at.kernel.org>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Mon, 21 Feb 2022 16:31:37 +0800
Message-ID: <CACD3sJaC-8BO9TkunmAfFQOow1rmWxEjhSRE-kekFRM1wmKq2Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
To:     Rob Herring <robh@kernel.org>
Cc:     semen.protsenko@linaro.org, andriy.shevchenko@linux.intel.com,
        yuenn@google.com, digetx@gmail.com, devicetree@vger.kernel.org,
        tmaimon77@gmail.com, krzysztof.kozlowski@canonical.com,
        lukas.bulwahn@gmail.com, Avi.Fishman@nuvoton.com,
        JJLIU0@nuvoton.com, tali.perry1@gmail.com, jie.deng@intel.com,
        openbmc@lists.ozlabs.org, sven@svenpeter.dev,
        linux-i2c@vger.kernel.org, tali.perry@nuvoton.com,
        robh+dt@kernel.org, benjaminfair@google.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, olof@lixom.net,
        wsa@kernel.org, kfting@nuvoton.com, avifishman70@gmail.com,
        yangyicong@hisilicon.com, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, venture@google.com,
        linux-kernel@vger.kernel.org, arnd@arndb.de
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

Thank you for your comments and they will be addressed.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:36=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Sun, 20 Feb 2022 11:53:12 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:19:6: [w=
arning] wrong indentation: expected 4 but found 5 (indentation)
> ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:20:7: [w=
arning] wrong indentation: expected 7 but found 6 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1595125
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Best regards,
Tyrone
