Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2925E54CF81
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 19:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239067AbiFOROG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 13:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357701AbiFORNr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 13:13:47 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3370F25596
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 10:13:46 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id w21so12064467pfc.0
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2hy2Qkd4xSuW4p+5Dl7PR+SUIjoj02p8RkTpyxOOHqo=;
        b=MIBH7WuXuo8XsYajlXRYGYomRcjkj6nPW/WNdlCyCciKwmkvzYPIwiUtu3Qe629RgZ
         cuZ+zyqFYzWMeEFMfJdGt0BHvJjKgqniKy+bjOBj6jDlMyWtrs3W0Kv7ICDIf+bPGVQu
         YKSqWlun8uCo52RezaVUDBTIzQJ0dRW3jXZr/cRhhFeI3XTfNXAi5Fm4tPE/WNES69zR
         z81w78Yli3gGEzD34bUQx0paNeHz/lAx8+6t53Y0vstuIrX5MZl1i1yT+KyK+JNu2m9q
         JCaaGDzWFoBHOjvizAqml7ahRmwIaspthWws+j4MfxDyF8u7+zgD9rKYNV1mLWk2GK6i
         xkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=2hy2Qkd4xSuW4p+5Dl7PR+SUIjoj02p8RkTpyxOOHqo=;
        b=VuHWuJxS/Ov2HQ6nSwF9/YuLDLX1sUuNcChZs2OxUf4CbnD2gj0sSu8LLa9OkYTqi3
         2yxuNUjX0taZJ5y9mbZLisZBy5K3T5q+IDTX4dnOw3RuWfixQXlPotDVSoqLI3ote3PR
         y9BRX/J0KWQ/0VDVbV09rj26D5oX48SmuYKWOPFvGTgv7YemPUT3ZvnvbbJ8sFU69qph
         9sGOKdawVpK1QkcJMYwEN3nGxbHeeUrE7RIfbEf57/FsdkZxgsTJ/XN/OAhI4wcVCqKD
         epB++Y0JghIiHvhSOdRsxXrk68ArLQjSWqiMiw5828U2LHPafVqQxgjoCUh52424CHpz
         dnOw==
X-Gm-Message-State: AJIora9yhFTWl4ZqwL4eVwSwgK97viAPAvAJgFEzLEBy2Sy5J+9hvya3
        UgarNyCrb/8vyEvJ7bZgmUyFznN3XPlrkXuDi53M0A==
X-Google-Smtp-Source: AGRyM1uDSl1WVzfzUp2fssJ9HirywV+QKxtYdrezojo5TjTmtib/dvB0jLtBLE0xMnYmMStriT3vSKgQ4Fy4j6rlNt0=
X-Received: by 2002:a62:7c14:0:b0:51b:9d03:a4c7 with SMTP id
 x20-20020a627c14000000b0051b9d03a4c7mr395031pfc.74.1655313225618; Wed, 15 Jun
 2022 10:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-11-luca@z3ntu.xyz>
 <Yqjti8s06LIfTE52@shikoro>
In-Reply-To: <Yqjti8s06LIfTE52@shikoro>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 15 Jun 2022 19:13:09 +0200
Message-ID: <CAMZdPi_c931ejPA2Nkim1cwBS9sdcTNnfUEvUOvFSsfrdN18AQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/14] i2c: qcom-cci: add msm8974 compatible
To:     Wolfram Sang <wsa@kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 14 Jun 2022 at 22:20, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sun, May 22, 2022 at 06:27:58PM +0200, Luca Weiss wrote:
> > From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> >
> > MSM8974 CCI is the same as MSM8916 except it has two masters.
> >
> > Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > To note, the cci_v1_5_data variable name is just a bit arbitrary and
> > isn't meant to reflect IP version "1.5". I'd be happy to change the
> > variable name to something else.
>
> Loic, Robert: I know this series is marked RFC, but the I2C patches
> adding a new SoC to the driver are maybe interesting already?

Yes I agree, no objection to get them.

Regards,
Loic
