Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4B97B26A7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 22:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjI1Uel (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 16:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjI1Uek (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 16:34:40 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3163F180
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 13:34:39 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3231df68584so9266906f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695933277; x=1696538077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBvlSquIs2Ke7oSWdAw9eQLxREes7YsKeiwzC7+pIWs=;
        b=DBZjETcS6fXLiLbeV7szvia7ngiTxSOHQD4aPhPI6ystFEuiIVW9cYLGxnWStfR+Nq
         4BuxfcIQlXctZtL3SR7gb84SMkWMA4UCQHH5e/IrYsqW/xYWNC8g4qM0xLpxH+2KiIy3
         2vkZuPFC6wJalC7WmG9UMDYqTzDigDNzcf8rHJplLGeocD5xY3G0BQLd8hhLRX74MtxP
         1ta1HSmayZ49xJNtTZN3gSmpF63Q1GkfD/ykiZgf9KT4vT51ch5Rbhydi6w8ELkRFOPa
         m2ktB8TmiOPLdIQrFaQIx4EMrmb2KP3vwTLN0Pnw4DI6JtlS2Fs53yGR3/dmLr7hsgvq
         nrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695933277; x=1696538077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBvlSquIs2Ke7oSWdAw9eQLxREes7YsKeiwzC7+pIWs=;
        b=hPLwCZybGhYLdmBlWz1XDLxuH0szIhRgWjy5/P1CBhp/jlaYDKbT6X4OWWvykjugZY
         TZud8S39sig3Hlvt8nMtRabiC7nck6sUW8K3an8D91iKGpf2kp0uM3N3EQDeTX9n72PD
         Uy1cIHYKGFB3b6JWenHmAClx+1b5XJP15SvyIZfVIKZifba34IwFtcvdfMJmIb2ojNCU
         uciNuxdsdmXL0vQOHtoASsqxXP+BrPN/jS/wY1pqXZsM3PtzEWG7mMqqbWrc1a92FSoV
         uTbJoZ33z+ekC1Oa6p4Kxp3uaODQy7uMAZhoBx2fSRds9ErnvwjRnRFFJN1GlfvkPfkG
         NYKw==
X-Gm-Message-State: AOJu0YzAuVqdOYsVcVaHy7T7oJ6NwyQa+1x25KrgO4jIaS1GYSzDmySM
        YpkrbRAjgMPrLiAkN177S+1NOZBCo+cee+uG0Cfqqm/DqCJ/BKh/Z1WYvg==
X-Google-Smtp-Source: AGHT+IGwU9/E/bmozXOPOWVwQApADfjwAMxXOrk/6UqyGFw/GGtd6o7Gnuax5Z+5myZIOcMHYUJahbI7SwN/2zS0lWE=
X-Received: by 2002:adf:f791:0:b0:317:6513:da7e with SMTP id
 q17-20020adff791000000b003176513da7emr2248703wrp.36.1695933277413; Thu, 28
 Sep 2023 13:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230928101655.47d3dd2a@endymion.delvare> <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
 <ZRWXMRpkO3tOwW1Z@ninjato> <ZRWuILREQejwvM7X@shikoro> <20230928202630.pyccrhc5j6g5svs7@zenone.zhora.eu>
In-Reply-To: <20230928202630.pyccrhc5j6g5svs7@zenone.zhora.eu>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Sep 2023 13:34:25 -0700
Message-ID: <CAKwvOdkURbSiPxLJa2GQHE4-SYjadg+H2V-aprrA+Bx=cdAyTw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 1:26=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Wolfram,
>
> I haven't received your replies and Jean's either, indeed I was
> surprised to see this patch again. Maybe my notmuch filters need
> to be a bit refined.

https://lore.kernel.org/linux-i2c/20230926133725.5c3fb96e@endymion.delvare/
for the lore thread, FWIW.  I too fight with my inbox filters.
--=20
Thanks,
~Nick Desaulniers
