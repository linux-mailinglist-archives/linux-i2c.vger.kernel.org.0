Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40CA76F8CB
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 06:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjHDEIQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 00:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjHDEIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 00:08:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3D23A90;
        Thu,  3 Aug 2023 21:08:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F20EA61F1F;
        Fri,  4 Aug 2023 04:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FB3C433C7;
        Fri,  4 Aug 2023 04:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691122090;
        bh=qTtD5TWnoHpW2u2IuehOQmD6gyBJwP6/55k/zGA/OkA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BzJov61P8SqjVhM6x3gOO7LhTIMmFRu4cX+cUWRsbJVep9EifS/ErXten/q8iicOq
         dX1cv+0PTkOSJvw2i+q7p1IESifF3B67Lrg3HJipCC7vliw6KsugYMAEYPBp3Ktr1A
         /yAh4nCJ+J/Ac0z46ZNjOnPu4+WpLpbAeJqdmJizeMmDCWPDMPpfaiDnoNjFf7LZHb
         10DJQDFQgKO8SoACGCzZlNwrwhjm8ZHIIMZglTm9SFcccICI9peaBjkjcwoNcXUTPV
         uHz2LupnG126pvfbGHbndxNvVhRCLe8ws6lyMReWyrA5LPVftLTe2Cs2YNZ52ApleX
         wu5LQ56g2b5mw==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56c711a88e8so1105176eaf.2;
        Thu, 03 Aug 2023 21:08:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YwIa9kfrfWdb8SzrZDRigTFtzvGl9Z4onKUHq+26RPyRzTrx3co
        yxUDQd8+AJTCKL16IhspOe9pLRNF/zdZGqAugwQ=
X-Google-Smtp-Source: AGHT+IGMPLp7ZQDzNQTXY9U4n72nm6+aNOorveA44nZo4400bxELjfRBGLQ+pgcjsLlWfpdLr5Dmc1tXEwnopqK9jJk=
X-Received: by 2002:a05:6871:5228:b0:1b0:5bf7:3bb6 with SMTP id
 ht40-20020a056871522800b001b05bf73bb6mr1030818oac.28.1691122089649; Thu, 03
 Aug 2023 21:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASvTLTj3hKkjsWBwm8++nXqMpomjZd6QbpmrfR+3iveNg@mail.gmail.com>
In-Reply-To: <CAK7LNASvTLTj3hKkjsWBwm8++nXqMpomjZd6QbpmrfR+3iveNg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 4 Aug 2023 13:07:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASEjbwYNV+EaJx8CxXtjNUMLq=uN0B5TMfAWQyinNifFQ@mail.gmail.com>
Message-ID: <CAK7LNASEjbwYNV+EaJx8CxXtjNUMLq=uN0B5TMfAWQyinNifFQ@mail.gmail.com>
Subject: Re: Wake up sequence of crypto - atmel-i2c
To:     Jianhui Zhao <zhaojh329@gmail.com>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 3, 2023 at 5:56=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Hi Jianhui,
> (CC: crypto and i2c sub-systems)
>
>
> I am trying to use ATECC608B chip
> (it is compatible with ATECC508), but no luck so far.
>
> Specifically, it fails in atmel_i2c_wakeup() in
> drivers/crypto/atmel-i2c.c



FWIW, I decided to work around the issue
by lowering I2C bus speed.

The I2C bus speed 400 kHz did not work,
but 100 kHz worked in my case.

I changed the DT property to
clock-frequency =3D <100000>;

Perhaps, the address phase (slave-addr + R/W)
provided a low pulse long enough to wake up
the ATECC chip.

Thanks.





--
Best Regards
Masahiro Yamada
