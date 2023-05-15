Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED767031D4
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 17:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242161AbjEOPuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 11:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242212AbjEOPuJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 11:50:09 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0CB1FDF
        for <linux-i2c@vger.kernel.org>; Mon, 15 May 2023 08:50:07 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-44fd3c2300dso4612301e0c.1
        for <linux-i2c@vger.kernel.org>; Mon, 15 May 2023 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684165807; x=1686757807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uXwd7SkGWJ9529scZ7Lnjm/OI4iOYOHZ1+uN+qCB8o=;
        b=BRGFiqvAymUeQVN0HIUkI4cDilaqFL8JwVUAQXqbK5Dly5MRpbNeE7wHPNesGhl/U/
         UkkSAd0XKWTvdQtQ51iivKux1NvkipJUH1KT04Z+ThOCC68XGuV7tESffJ0ivIFshk9l
         4fQ2BWkzqjoouDQVT9TDALhOI87Iur3/D5/Ye1uHcdpYEt/KJHtM47uR0YSXd+8VfWA5
         oytyCyiIxZUovqSW/xvm5wrZvUbHmuEQj6o+TMsnjIEhtYoaHB5aY2QLVZY+12iGOn+a
         plPO6KKj8WGl5MRLEP10QEdjhSgJoQW8brQ8SPTt/NO42WmVLpisrq+5yPq6+ONeJhcX
         MXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165807; x=1686757807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uXwd7SkGWJ9529scZ7Lnjm/OI4iOYOHZ1+uN+qCB8o=;
        b=NU05jHMDkFxLSsmzbdKorUXwsVCOWWyXdHptP83gRWs6DOt51167KVhYUpcn6jogWu
         sxzJB/WTYREkEiEruaZ3cbY2M7Up9qHiJ2y5n9TmiABLZxSHPk18iYAk+ncFV6B/cS8L
         zby8Ncenxfbx9BqRYT2DW0psiy7SYeZ6M3uHfyYJICeRr+3nZrpt+LKH2MR4gOevj3p7
         E8A1wkZlNU/PNNvMJeai3URNEzTbEUkdYm6LYkdKDEsM2Wh/4A3pumJVGvfRahTE4mI9
         JMa0R/QlIeTy5ytJgI7MvSCvcAMoyG4gmpsy02niZJoKugiL3BHSsoqDAOpywRa1Y7UB
         Crzg==
X-Gm-Message-State: AC+VfDz2HT+GTD3rPTxw+MewiHUSR+QBVi/3P8cRdoulROnsixwIww7Q
        9vEi/rdLtuh9BnpcKXKSyMgBv2CKlzjQhl1rAB7+5A==
X-Google-Smtp-Source: ACHHUZ6aSG8aekPziwzEAgEVCJVbKN3TbOZcZmLa2Iu2jZW0AOUW4z09Kk/htLolRL0j1BYZPl7edgyr1z9rTkFtOGM=
X-Received: by 2002:a1f:5343:0:b0:440:3b4e:9a31 with SMTP id
 h64-20020a1f5343000000b004403b4e9a31mr12233542vkb.2.1684165805899; Mon, 15
 May 2023 08:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230511175844.185070-1-xiang.ye@intel.com> <20230511175844.185070-5-xiang.ye@intel.com>
In-Reply-To: <20230511175844.185070-5-xiang.ye@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 May 2023 17:49:55 +0200
Message-ID: <CAMRc=MeLyqLsgCbxA1jnz8r4kRoS6AvvOyUffuHg3ojVMTF-3A@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 11, 2023 at 8:01=E2=80=AFPM Ye Xiang <xiang.ye@intel.com> wrote=
:
>
> Implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with
> LJCA GPIO module with specific protocol through interfaces exported
> by LJCA USB driver.
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> ---

With Linus' comment addressed, you can add:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
