Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3D544CC5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242375AbiFIM6u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 08:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245648AbiFIM60 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 08:58:26 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0B72DCF;
        Thu,  9 Jun 2022 05:58:24 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3137eb64b67so38556587b3.12;
        Thu, 09 Jun 2022 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=iD6McwKwIghg6BHWgeKWaQ5MVkxCurltdSVwKmXM4W0=;
        b=Ay9wSBt6/1FosjTchjqFRaOXNnxcSgSjhy148/OJkjEi2ezSAJkxy8QBigj35N26KT
         YrXCPaCXqBdW01cEHCjRZOd3ZrsaVhd9JjOJqXs+3WHog5ILCEewhryknksUqAeLFMzn
         IGkTdf9foXozaSN0SdrREZd7DLlHGJhC18AFA0nAGhoyZYzASZMHRYOYOmlub34uCcLm
         qYC7xtX+1SCbhNxTr1NeBDqzT5Is4bzgznpa+KDkJsoG2B8YIgk4etJMkRuazEgV5gYB
         O8dPFe9/geqE1+3gSInrglUhfwRBjuGNqqakfdZjebuczOFbzlt71nnkCASlYW028yRL
         Tcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=iD6McwKwIghg6BHWgeKWaQ5MVkxCurltdSVwKmXM4W0=;
        b=MDs9KiSaLqC20spg0lL+/X3TzrzDD2Bjl2Hi8PfYdqAb1bzQFbRyC2vkGAB+q00Du4
         QudUb+Au/DdaiOkixyk067kOvNWCaFyxh7fnyhh27vfPVpJhTl/sbVm4Gzh+MRO/HoAE
         FJLze9tXo97l7GuIxmCybPTE0evvNYNYM+q11eJOW7N3IP8spS2mQ5WzkRUKSCSUdSlv
         JmUCql/4Rq37XEaTDt5uu9Z+JDb1jLExsW53TOdSRcRJKRsAz5zjZCaT1fK6terc31Sb
         2f6AWiauwYLHZk9MWzU2ccGZMuTpQ9AKiVP+TUOlhCtBXw4oJL3mIbbDbfMNi236AcML
         W+Aw==
X-Gm-Message-State: AOAM5316XX6WXs9FgeQ9nmNp6WWfgjlX1ryQSZqbjJdIrkKiv6oU1eER
        SKGD/Ar8ZoPmEfG5kycO1NCsQC6CYfRNaaOq6Q==
X-Google-Smtp-Source: ABdhPJzHr6p91v8bPwlBk8HOqVwk0g7+lCi/t9+Eyex87Yig6dRIrzVd8Xgn/Htk12Bx8Z1hnf1cz8sjT5E846Mh+ic=
X-Received: by 2002:a05:690c:58c:b0:30c:1fe9:af8 with SMTP id
 bo12-20020a05690c058c00b0030c1fe90af8mr44909325ywb.403.1654779503515; Thu, 09
 Jun 2022 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-2-warp5tw@gmail.com>
 <YqEAY2jUQC8itp6h@kunai>
In-Reply-To: <YqEAY2jUQC8itp6h@kunai>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Thu, 9 Jun 2022 20:58:12 +0800
Message-ID: <CACD3sJag7h6Xq1Dcy_hZ3XQy2EhKK6DkqADt0__c9X6RqLuy-g@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: i2c: npcm: support NPCM845
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
> On Wed, May 25, 2022 at 11:23:37AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
