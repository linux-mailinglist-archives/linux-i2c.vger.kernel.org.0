Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9466D79125A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 09:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352392AbjIDHiq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 03:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjIDHiq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 03:38:46 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587C0FA
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 00:38:43 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-48ff372840aso240845e0c.0
        for <linux-i2c@vger.kernel.org>; Mon, 04 Sep 2023 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693813122; x=1694417922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6cfeDL1D00ZwMrWYpJj73nQqWY40d8ljJGAFkaIlIQ=;
        b=Apaa3IRVDJUiHW76w4srsOLl2DmJn/Y9jhzj0nA7SJ4JGiHCG+OxLVVuacF00Y22n3
         TajqjQI29RU7Ho9d3nGBwi59Fvz++FrTU4RLYig/3pelzybsuPuz86kEt5ihwvOYOMdg
         um6qtimEXb+uMDOMZ2aPG3Yn3dxjHOirAxad3DZLAhhr/snQ0vHGJyXgJ/b+1g81D/92
         ymt6p0ojDKL2/Q+a1+tt2Q8kwHHfKTzkJNRaz6Q+NYxcoLPW6pHGAVeFDShXXsL92/Vb
         7BUl8SR/BJotRpUsWU+CBcewOvDAQyx32MTftxMX5gLiKZls+wg6CcrOdYWzC6bpAmYA
         5d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813122; x=1694417922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6cfeDL1D00ZwMrWYpJj73nQqWY40d8ljJGAFkaIlIQ=;
        b=T46MDyxPsHG6YdKvTzAXu3gOSw+a02T8IjvaAT77c/Iw7RDl9gp0XECkZVh0WxP2Vh
         RLUtYrmtg6+H/D0aIXF7UbXIOxxlSBfu4pQH7aZxxpchXIZnGsbUeWgeaE4bPSxW72L3
         mr7R0VhyG+7gl7fDAt9MmYwyJ95fucBiBzQFHHdFo/gs1BED2JwDQiShBUuEoUoTM86H
         NRJsT6F0NCVA0FfYjxW+dxQ5c066Z2X/N8Ei+iIPec+NaG5KsDzPkCd7mQDs2KUxNhHF
         cFQd/wVZ804cXOoXR8BK1UYZiQ5D859TZ0zRXuLz6QEg+LrFBxJ6BJHBjRFEvSBlHkWV
         tnWQ==
X-Gm-Message-State: AOJu0Ywqp9xcr7tTZozmVzRePase3TDPhUeXBi03DaOQxg5eznHqxsv4
        cOHBAtqWOAY7pyezE5FHsAS4nQ0fFwqVcOFL9Wf47g==
X-Google-Smtp-Source: AGHT+IFfV+0RL2PdfPa3BlyLaQiK+NrUpmGL5kdfR8zekPZ1itVYP6/P07f49j0SUwCxN0ng8vS6GlEjUsDM2/Qa1XI=
X-Received: by 2002:a1f:6244:0:b0:490:553b:349 with SMTP id
 w65-20020a1f6244000000b00490553b0349mr6717342vkb.5.1693813122333; Mon, 04 Sep
 2023 00:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
In-Reply-To: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Sep 2023 09:38:31 +0200
Message-ID: <CAMRc=Md2TBRNBrD+w7=tys9fUqNKT0XwHYMHUgJ5WATLiR4UYQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/4] Add Intel LJCA device driver
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, maz@kernel.org, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 4, 2023 at 7:44=E2=80=AFAM Wentong Wu <wentong.wu@intel.com> wr=
ote:
>
> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
> IO-expander expands additional functions to the host system
> such as GPIO, I2C and SPI with USB host interface. We add 4
> drivers to support this device: a USB driver, a GPIO chip driver,
> a I2C controller driver and a SPI controller driver.
>

Please stop spamming the list with resends. Give reviewers at least a
couple days to respond.

Bartosz
