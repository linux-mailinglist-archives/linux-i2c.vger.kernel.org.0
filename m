Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9BF78A675
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 09:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjH1H2A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 03:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjH1H1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 03:27:36 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CC511B
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 00:27:32 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-48d0dbf4ec5so940183e0c.2
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1693207652; x=1693812452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aAdLCo7+5NsyJy4woVDAtzriNe/Ar/+QNUBkrNNwNk=;
        b=sNMl2UDUX3JowQ3/XIWffWmHya5JO9YpTKjoq3J4anjxUN2AynbD5fBoqugGvh7GaI
         Up1+bihyzpGLtim8dOksR1ahR/JnBOrqoI8+RF5JZVW6Ojhd4QJQ3tngsThX7MgonxsZ
         jxAvSFq5qo2HKZ3lRXBsrvAUpu63EwkaMRLRTxUgB7srNhNWLk1nUyxhzzx8nojSE9kZ
         6iotrIbLyN07GquyYlSi2FIxqX6NH+JlSpbRjB7+s0q8rwuyrDew2QkV5Vrr+9dl38OR
         pyRvmeyGRn3dStLTw44AhUQPVJlrdBtMlBnyVaGR2eWyUvq1NiSTbWgPuz/HF9Vb6SZD
         MokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693207652; x=1693812452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aAdLCo7+5NsyJy4woVDAtzriNe/Ar/+QNUBkrNNwNk=;
        b=AkfyKCYHdhldbrOcvYiV9eIFeWlw1dRF68mVxLWkDtPpgHPuj4y5nHq5j51/wndPec
         qYh+528NXDjrF9Ukr++pehNNYAzUWxtTfEKepSAXag5Uyzj+/fu2OJEO8IVad03WN4Gw
         /Jr0CI66khWg8aHI/01f7hc4KVb1awPbjIjbOm5D45gRT0Q22WgVu1+yLEK5WdtPKt1B
         Pi+frR7f/+eWWGfMpOJAYTjRXOJnMDv1v6n3PluGa9qL+SuMcPlf5rztUr9DhN9m296F
         cAzNFx2t2alQEEJDY1p6WBSWoEcCRtgWXIA49BxJdPYmKRjSZ82WmA1TfxcbzPZZoLhy
         ZSAQ==
X-Gm-Message-State: AOJu0YwHKes8k2MpTJNACvH+nYbBJE7WacpJ5GSHsPDiMpMm6iGzwp43
        ynCHWOw+Tstf3CyQEa1UDgQduNtRYIomEX/MUSmbm3nNSwPJAyTM
X-Google-Smtp-Source: AGHT+IEJylB1pZZ8U3hYbqpKHzzVTBvaaWl9vXTK7SDgTsScgcGSwsEgavbn7vGuUKghrUmhND4cgC8KZjPVxRypeBU=
X-Received: by 2002:a1f:ea84:0:b0:48d:3933:f545 with SMTP id
 i126-20020a1fea84000000b0048d3933f545mr13641569vkh.12.1693207651895; Mon, 28
 Aug 2023 00:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <1693091643-20867-1-git-send-email-wentong.wu@intel.com> <1693091643-20867-5-git-send-email-wentong.wu@intel.com>
In-Reply-To: <1693091643-20867-5-git-send-email-wentong.wu@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Aug 2023 09:27:21 +0200
Message-ID: <CAMRc=MdfUuq3OePe9suXpFnE7T+A8_MYZmFX8Q3rHA4b4mYnFw@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] gpio: update Intel LJCA USB GPIO driver
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
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

On Sun, Aug 27, 2023 at 1:15=E2=80=AFAM Wentong Wu <wentong.wu@intel.com> w=
rote:
>
> This driver communicate with LJCA GPIO module with specific
> protocol through interfaces exported by LJCA USB driver.
> Update the driver according to LJCA USB driver's changes.
>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
