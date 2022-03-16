Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC6E4DB51C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Mar 2022 16:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240823AbiCPPop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Mar 2022 11:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350516AbiCPPoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Mar 2022 11:44:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0422333E14;
        Wed, 16 Mar 2022 08:43:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a17so2190726edm.9;
        Wed, 16 Mar 2022 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EL8SPq0tFGKKMPZ6eWOoFq+B8Y0BC0Wp+VatKXyZsfg=;
        b=ilg6KEssa9OxmAVaCZokfR8oveD05mfB2MjaDdtdZDOfsQ8sQhGe7i4Kx/aNPa6aPN
         gZaH2xA2LCFpFjnLburwk2rSVaaHfJWl7tneHlobMqwkLCp1J8K436Em9pJ1qtJZ2Ke9
         EyfTt9OU2rZeJkRMM3WOn+N2v/uuTYHumXN6/gT1/dJsAVb0E9YOyWXBgqZ1N5VZWicf
         M0iRhMGMw00HQRdkqTL7JCNDHDGH8lI5SAvVSF/rCkosc61ZFPo4MZl5yjZ/7mBocWif
         qT32n/kYN+lHVmHwMc/PXDLArbUcnVL3RGRh+PNMXdbQQTwzwQveo3K+keBGR+d4F9dE
         lXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EL8SPq0tFGKKMPZ6eWOoFq+B8Y0BC0Wp+VatKXyZsfg=;
        b=wn5Jb/B035EuqEclqzv1VahJJpZ5/PZVIo5TBux/z6DX215rLE3Cq0DDHGS1pBu5j1
         QuKdE8ozbjw7UYYmDTVsvAxGMyjJq3YimBUo8kfAgSY4sTtEtujwQxeS4zeUWuOpJ4CM
         42MObuamw6YTsSK/9uSLt3w6XFgwqSjrdYqHbEg3u/WwFCRcCZA5gfn5vgkMiqIWLgyg
         Yt5ujiQlLcog1lZOTbA5ag422qm2FDU7WujfYYIBgs7BjgtRzpl52rJpACIr8wb9s7Xn
         spSO3MEHfJsoINgKbNjW/QLc8uOGQF/6B0HP4GmMnpQEl3sNbe0qFXwK8nDQcatQuExV
         p9ZQ==
X-Gm-Message-State: AOAM533Ir0TbiMrCw9B0uf3XCzu0s/5nb4ou2mzUIVk5qL9INDMUHz1S
        MPCLt5RiDMUt6ETGhUCPOKv6OYVT2N32nWygVhQ=
X-Google-Smtp-Source: ABdhPJybEl1wu5fLBjs9JJKe9wXxnEFgIV4wrI5bCRrEaFk7ObVhQKonoGWk2+0ayUXt+GkwD9+hDw5opq0w5monWKQ=
X-Received: by 2002:aa7:da93:0:b0:416:4aca:bef7 with SMTP id
 q19-20020aa7da93000000b004164acabef7mr111360eds.296.1647445408611; Wed, 16
 Mar 2022 08:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220316064716.16587-1-linmq006@gmail.com> <CAHp75Veae=8Ev-xU3zbVYh=AxbAPFayZD3MeRSrAGNNZ8LMBPg@mail.gmail.com>
 <20220316071841.GA43@VICKYMQLIN-NB1.localdomain>
In-Reply-To: <20220316071841.GA43@VICKYMQLIN-NB1.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Mar 2022 17:42:15 +0200
Message-ID: <CAHp75Ve+tkrzzz3ZjhexW4eRXXCjejh=w=uTbb4Vuo6XL6jP3Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: busses: Fix error handling in synquacer_i2c_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, Mar 16, 2022 at 9:18 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> Hi, Andy Shevchenko
>
> On Wed, Mar 16, 2022 at 09:04:06AM +0200, Andy Shevchenko wrote:
> >
> > > In the error handling path, the clk_prepare_enable() function
> > > call should be balanced by a corresponding 'clk_disable_unprepare()'
> > > call, as already done in the remove function.
> >
> >
> > It=E2=80=99s not good to mix devm approach with non-devm.
> >
> Thanks for your review. I'm sorry, I don't quite understand. Could you pl=
ease explain more? What functions are your referring to? Thanks.

Your entire patch is broken. The error handling in ->probe() and
complete ->remove() now have asymmetrical ordering.

On top of that the CCF is NULL aware (and error pointer IIRC), so no
need to have additional checks.

--=20
With Best Regards,
Andy Shevchenko
