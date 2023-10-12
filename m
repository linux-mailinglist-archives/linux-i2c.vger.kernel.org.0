Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB807C6604
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 09:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377538AbjJLG6C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 02:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377241AbjJLG6B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 02:58:01 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36ED990
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 23:58:00 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7db1f864bso7493877b3.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697093879; x=1697698679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM69six1InBTZLWkTEUw9fhsQh0Ijge8x6lDDJDQry4=;
        b=a91pK2LE+PxN4nWA3rFddtUTcjmL5Y8Xinaey7u3R8jEplauvrq/Mbpyjpmd2BIWnI
         Ty6c1oyAMPH5buBckGChIfPx6x67QuzAlHb8RXvp9UOhWc7LuRF0lA5B+QeozUOX/oBt
         DRW0qXk6NX4R4d2EOuhEKu6wsiuiLONhVo9HxqA/76pWnmYHS0JLQXvU8DEvFTQ2N2r0
         lfFfiDRYJKZwZWOYc//mP7+qHucdxoi4zRKmp3WtOuIBKuo8UtoopMYcC0cW2MIKKvK6
         Ov7gWAwcySAprPOjnHAN51bnyFKgFmDcLHBKT0140D/I3UNJ6Lr+yj4BpOr8znV6cg0E
         gnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697093879; x=1697698679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM69six1InBTZLWkTEUw9fhsQh0Ijge8x6lDDJDQry4=;
        b=Tqbkj7Grd51oQmkb1jvv9gc21/pF4pxMKhpsiTMT11L1A274iACqJUX+wzl8yXtlzH
         TBNqv/lK8d5MmAfztzNYI7m173P7TuMwYdC7Q8jGafs4dLGqRlZwHPOG4Bv63Bjy7Nog
         5RgLoaEhdSfceFAk5aI1+TeUkGKUM5HJvlbTkPlrzPlZ6+Qqpxei1XTzLRJ4C+k1Ou+r
         gsQh+qarYZiEh9ZXVCq1UENMQcc4aUjaRn58DqSkG6JKXEMciLz1kGwdl5IBxKlNgMdP
         zqfpKNvuy31i+pN5riN2AvbDS8NFiic4z+TDHkBtuVTXGjGbBQsLBuTJhCYd0T8P0Ksv
         yxIg==
X-Gm-Message-State: AOJu0YyhWkhMkc6BDhkoMMKvAUjlP4rpSX0wnqMq3Ie/K9Sd3HXOXx4x
        +ldlw3x82LZINLOOHcNcopJYlaZ604vQjYmHU6zd0w==
X-Google-Smtp-Source: AGHT+IGQP4VnanZFqXEMtI5+ShLzVdtzEVbFQP4fLT/CbIuZIDEdaVqY+lxfB6tlUvWGJFwv+1zzbITyyQzxoctdZIc=
X-Received: by 2002:a81:4e0f:0:b0:5a7:ba53:6544 with SMTP id
 c15-20020a814e0f000000b005a7ba536544mr8314062ywb.12.1697093879450; Wed, 11
 Oct 2023 23:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-3-brgl@bgdev.pl>
 <CAHp75Vc2vGEYmbaurzEoh-ejkvFwGeo98LtAGvEq5idXNPgnRQ@mail.gmail.com> <CACMJSetxih3kwAVDpQNm_fApgdkOv-XfErqC8+hi7Nac4J+ZOg@mail.gmail.com>
In-Reply-To: <CACMJSetxih3kwAVDpQNm_fApgdkOv-XfErqC8+hi7Nac4J+ZOg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Oct 2023 08:57:47 +0200
Message-ID: <CACRpkdbdU-m6dBZk9rz+7MSS2+mn=Svb5G4jg60ebBfQ7-q6CQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: provide gpiod_to_gpio_device()
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 11, 2023 at 5:39=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:

> The end-goal should be to make gpio_to_desc() an internal GPIOLIB
> symbol. There are still around 10 users outside drivers/gpio/ that
> will need to be addressed in one way or another. Preferably by being
> converted to using descriptors.

Conversely desc_to_gpio() as well, here is one fix for the current
merge window (yeah I keep churning away at this...)
https://lore.kernel.org/alsa-devel/20230926-descriptors-asoc-ti-v1-2-60cf4f=
8adbc5@linaro.org/

Yours,
Linus Walleij
