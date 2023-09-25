Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89107AD1E7
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 09:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjIYHlS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 03:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbjIYHlQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 03:41:16 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5058DA
        for <linux-i2c@vger.kernel.org>; Mon, 25 Sep 2023 00:41:08 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-452863742f3so2436729137.1
        for <linux-i2c@vger.kernel.org>; Mon, 25 Sep 2023 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695627667; x=1696232467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiYZdX9DU54hlyCL6A/xG5cg0RmJhcg6NNDUibAVUyM=;
        b=T+SWuozF8p5UNcF4T8GwMGauc784jE2iIkm53erAQQ30lNHY8u3xAUjX6P2uPLyWee
         rbXYSdDrsy3uHF1ClYhkxlw7wEhRX4ckShYHTrKfegTvOtLHoVtis8DHD6geh/XsrW5x
         vJVwN9uFuZYZx3YSReBnawR8jg0OyugWDMPuKUuK0pmU//MSffcj0+xOH2MMrJzgoxYA
         JOZCGtqf57WdeJ+XEH33FP/PKAnUNzYnv3WtJ00JjgUi/bGBdVr7hGe3d0hoh3rbwOqq
         HPZMp24PtdeYQTGZ3nV3T7ZyL0ekt1GMjP5RMQi7lFqXtyK1kG3w75m5LFUWoZ99SnwH
         O24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627667; x=1696232467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiYZdX9DU54hlyCL6A/xG5cg0RmJhcg6NNDUibAVUyM=;
        b=jQ8MaTGP9JcuOZPKvY15f+E7BQpIsJjdDB2AvVWCyhC/Hg/rEAgMK+/RgfsiiPemrD
         /4GSIOnQKy6X7KGblPJKc8Rx874oBUpwbdndjhr2X0MEJMPdkqyKL/mIud7lexAtRrpP
         Uc2ZE2XSZUfd0W54Irv4Elf7VjcRAoAWHVTr5xCLfgTBy6TWdXm+VQhkKRiXPnk7mBUC
         8LV83dRW/COzHc9IY+FrTJ1XXCBRnku8s0Kxuy/RzJl+fsuMKaT8MCmjbC7Z4Hoh+p1V
         05ln4xE9HO6jn6qlp0Au67xCGmZwjzm0LheapgGIrrp9uIHqCeD2/mzjZoVkbTh0VnQ9
         QWGQ==
X-Gm-Message-State: AOJu0YxmqhFf9CU7It+nlf6yf5wimd3xIjB/NwB/b49FZgd4Kwdc2gj5
        yM0+ffUbPSAsB64Tt9G016z6bsfsfUiUB+VPofm52Q==
X-Google-Smtp-Source: AGHT+IFx82zmsxjoLuNTPGGd8GrhippPyNF9FQn3hKIpX7aWK+Ny/ek0o4jNsCfrxS8J3MiCNYA4klx50t41kyL94KQ=
X-Received: by 2002:a67:fb89:0:b0:44e:e7d7:6847 with SMTP id
 n9-20020a67fb89000000b0044ee7d76847mr2800971vsr.7.1695627667358; Mon, 25 Sep
 2023 00:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230922175155.work.872-kees@kernel.org>
In-Reply-To: <20230922175155.work.872-kees@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Sep 2023 09:40:56 +0200
Message-ID: <CAMRc=Md+BM0fGoO9SrnmKOKAmXmMBNJ9aBvuOCfKpT94rhv+zQ@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Annotate struct at24_data with __counted_by
To:     Kees Cook <keescook@chromium.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 22, 2023 at 7:51=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct at24_data.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/misc/eeprom/at24.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index af83aca452b7..7dfd7fdb423e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -92,7 +92,7 @@ struct at24_data {
>          * them for us.
>          */
>         u8 bank_addr_shift;
> -       struct regmap *client_regmaps[];
> +       struct regmap *client_regmaps[] __counted_by(num_addresses);
>  };
>
>  /*
> --
> 2.34.1
>

Applied, thanks!

Bart
