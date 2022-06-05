Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46DF53DCD8
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 18:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241758AbiFEQJY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 12:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbiFEQJX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 12:09:23 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF34119007;
        Sun,  5 Jun 2022 09:09:22 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id x16so5692808qtw.12;
        Sun, 05 Jun 2022 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6up09UGqR4zDkptKkUpRxOQclq8e/PxkqljErjcyQ2E=;
        b=VbQjAFRK2076PcSPrRV5HFm7+YD8sWkdvgQcJlk5EQN0aal9q301HlK/X2lc4ZmySa
         aTtFsNq0zWZhraZT83Hi6VTGpl/TT/m9KkvLQljDidlAK8fAo/YyFm+OenUw+gjmoygK
         2pXQEHfNqvQ42Qpg+89Mok3y17t0GzI0szbih20AcfsG8EZj0S3lsW7LFslIGUB+DE8A
         yn2mxIs+xegyuGlP34hHjKlxrSlAbViSeZeqOvizO3RvxX/kfNyUU0kiRju+YuE2EIAc
         Hh3s5mvYpikROcPJFwxXY1B/7vm7+3Y0awoCLTcJdjsL3VC4sVwv4mVdHq08s/5DsHFQ
         dWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6up09UGqR4zDkptKkUpRxOQclq8e/PxkqljErjcyQ2E=;
        b=KgpvxatHHI5z9GZTOQpfgpW1Z4+JgYq1xcXUAMmBjgYVEP3gJprbkSIApooYGk+yIP
         atHJgEF0OCeDzph4IbEDAjfuyZQcYFs7f+YYDriVVbULLrfVncp9nQ9WwgX6YuMd6Hwe
         NLG2+z85Zoiut/FhJ9vsxR55PRKpxvPfLHVUb7TIQeIHZVVtcTiaNJHpuRF8qL6GEul0
         n2GTMp64bB2as9Het4Vkc1Yhg67WdC4RkS0f+um2SLsFuHMZ3oonM9p8tpoh3bgbtQlA
         sGluMXw8GJAzOnpmLeeQH+DG2moMAX0bgQqQjK2lTkBEA/NuR0HwFlKlCHjaEEG4xnBN
         GlHA==
X-Gm-Message-State: AOAM533iU5nTgFA2WlIiBEPy7Dqn0lcylp+KWQ0ZSYdxMkAq7CMia4ze
        +e5NdAht6VdJRd4zBOOS8S3oc/lvx768+fqUL9rq7WfKCyo=
X-Google-Smtp-Source: ABdhPJywOCa4JlrqnpzvOPcfnToSWNzzpI6MTYAso0GYBwlHVATHQIbN8TAROAwYj3k3ojftAmvK9igBBdtJghbl7ME=
X-Received: by 2002:ac8:5dcb:0:b0:2f3:e079:8d66 with SMTP id
 e11-20020ac85dcb000000b002f3e0798d66mr14959327qtx.318.1654445361883; Sun, 05
 Jun 2022 09:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220604164653.79284-1-robimarko@gmail.com> <20220605140744.GA3416078-robh@kernel.org>
In-Reply-To: <20220605140744.GA3416078-robh@kernel.org>
From:   Robert Marko <robimarko@gmail.com>
Date:   Sun, 5 Jun 2022 18:09:10 +0200
Message-ID: <CAOX2RU7PHpzKUNvuv=-MyqGtgcz30qKkvx2MHNV=ehtCZGBYEA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 5 Jun 2022 at 16:07, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Jun 04, 2022 at 06:46:53PM +0200, Robert Marko wrote:
> > Convert DT bindings for Qualcomm QUP I2C controller to DT schema format.
> >
> > Old text bindings were missing usage of DMA so that was documented, as
> > well as the max clock-frequency.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
> >  .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 83 +++++++++++++++++++
> >  2 files changed, 83 insertions(+), 40 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
>
> This one is already done.

Yeah, I did not check linux-next before doing the conversion.
Sorry for the noise.

Regards,
Robert
>
> Rob
