Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E94A6FFBAB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 23:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239064AbjEKVHz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 17:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjEKVHw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 17:07:52 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130C9D3
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 14:07:51 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ba1cde4ee59so7153334276.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683839270; x=1686431270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMJSAuzmDEOyslGFpKNIuHv7WTx2jYS+xwESl4OR1aU=;
        b=JrlILs/FJvcqjFimI5g8pLCwZ7MlikV+mp66z3cACXcbS1BbgdeUUlwPgpDYjOZ9N5
         JEcC+QlYiJQB7bxuXZuug+8mQXYNE4D4eFkybnQ3pnEjFqw7zgqwVrvCGajgde2f4Mcq
         GOUKw/vsgB0PLN2AoH0WRkZ4lkkCU1Ylf+McKd01DUUSqGOMKozMV1idVjXpuW+69+by
         Kj65G4SKjtiP3DpPGJ+2mlrLS4FvsYr2x+HtVwQJjLnt6d5ua/w7ZXP2ofUBRz1ZgXiN
         /CJPKvt6C3OTXYCaEW5EEqq6exRx+7x7Iohej2pGkTN+QRIalksSCq65PFEhO/EYZB0v
         3aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683839270; x=1686431270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMJSAuzmDEOyslGFpKNIuHv7WTx2jYS+xwESl4OR1aU=;
        b=ceDthwFQuJyQyn9uMJD0tm4NricyX0oJAZgDu20U9DwaeTydRQ37wpaxz/61SfyUO2
         6IAsYTvQWCgs7QDIFi3OFP+RxtHNIcmlfkY90szfpQgZOFG94OnOYP9BHsU0m9602nA5
         WiTUjjYfiSTnY0k2Df/HjLHTAoK3ukulf3YFlMexG3oL3azR2nYVQT0Jwa0z3eaIlhDx
         YHYNomXDBfprDaZ/T6luUeP5m+x6ZQAYc9Tpi03ifSGWRU8XUcFfAc4RjYJM5ZUGoPTR
         ZFs8ni+rIqPYpBHyLQsj1uTa/0N5f1SbkphtiS1fcAu7PU6pfatsBdylBJrAgJP0RCAu
         r9wA==
X-Gm-Message-State: AC+VfDySyqpM8Up5lBKfgkzf6LZzInXA2a471BaFNnAVUeNTtnHRbEvV
        0NM+ZbOX2SggymFdZNhFP8k+iysA0LEGCizPMCK4gQ==
X-Google-Smtp-Source: ACHHUZ5OKCRCzCdvnNSAXPYO3cSOrmnSrMrAUBIkganKJVWu8iiA56tmWT0d2y016WQRBVytrjHjwYEzMXjqLbOa8l0=
X-Received: by 2002:a25:aa0c:0:b0:b9d:b5f0:3b33 with SMTP id
 s12-20020a25aa0c000000b00b9db5f03b33mr20809376ybi.58.1683839270282; Thu, 11
 May 2023 14:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230511175844.185070-1-xiang.ye@intel.com> <20230511175844.185070-5-xiang.ye@intel.com>
In-Reply-To: <20230511175844.185070-5-xiang.ye@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 May 2023 23:07:38 +0200
Message-ID: <CACRpkdZvn_cX=GNO2VYC6YfJif-cXST=avT2yoMpYVq5C87bMA@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
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

On Thu, May 11, 2023 at 8:01=E2=80=AFPM Ye Xiang <xiang.ye@intel.com> wrote=
:

> Implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with
> LJCA GPIO module with specific protocol through interfaces exported
> by LJCA USB driver.
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>

Overall this looks very nice.

> +static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 c=
onfig)

All other functions are prefixed ljca_* except this one, so I think you
should do that on this one too.

With that fixes:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
