Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E90A472D93
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 14:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237769AbhLMNk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 08:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237757AbhLMNk0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Dec 2021 08:40:26 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A010BC06173F
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 05:40:25 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id e3so52885730edu.4
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 05:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BVi3OMOtIsMt0rZekIf42I4V9k2B4o2jzkOkYY9rgjQ=;
        b=XUx29dLwQL/keLebXmLZAqYzsWcwOkeOhyqGaNeWB+KumkzG+Hl5gVnKdilLiBtblz
         6bAd/8zsx15+BaHtCf8ZgGHPJBjnydP185+xqV0He2pPCjZmLFtvNYWtnbw/m1SHlYmk
         MNXj11S/XZDBQVZL+CI6qNIJw3OvAHm8OOsEC0hW0ZyEdxyMz2rEjdUOWURIrhnPwdhT
         rUOoBihAX2rlbp9P3VsMi8PB/ILlQ73jICG3IcRk1mTuqZf285ww0vuOTt3cofGIOrbJ
         sy7C/g3r7BFr4kRXZcvIb0PR9cNBY0KSIVV8Jrxs0BbGMcZCgn7cD8ZjxU+dcykMgaOI
         DuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BVi3OMOtIsMt0rZekIf42I4V9k2B4o2jzkOkYY9rgjQ=;
        b=Ze/3SpZo5x69NEBfMqvdkwtSU8+MZ2iJLuiJElqa2Ghmd02C8cYVGDN42+M2ELNrY/
         xc8/4jlV6Mk+M9JfajehCV/1n+ve1XgpIhzMNsZ4wNKxVG9IP711l+mT1agoVlS0m7Xb
         cgJIKLbXE5/LPyYadilAz3tOLcrUyuyz3QX0ksRq0L/HFtwBtVtj+MW3oJl1NGsxJNsG
         PQUyeHhYgH9O5KCqxufmnySRYi1dcPn2DHcdZrhQNLYRmu9aetr78hKsmb6PZtg7bAvV
         h7KRYsZQ1GphumPBQSWs25iFpuQpkufqjgfsZrovRbETVThGtTTCnCPD50y4BAFVtEMy
         fffg==
X-Gm-Message-State: AOAM533z7zXrWa7JfDboUPo8TMwzd9sqUjUzW9tFhqW4K68h/ddN7IB3
        A2EvQaibttz9obD0GUrcpJz+xcv+2KfSPaDENdcm+oxatIU=
X-Google-Smtp-Source: ABdhPJwHuDE0WNZNKHG4PwCr6Bz3jdArhOaFb24hhw1BfJsO6IjW+n4zE+91Tx5jLkHwKSIrQs5DRJrFW5cU1BdTPjc=
X-Received: by 2002:a17:906:4787:: with SMTP id cw7mr47436974ejc.311.1639402824215;
 Mon, 13 Dec 2021 05:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20211210182604.14288-1-fido_max@inbox.ru>
In-Reply-To: <20211210182604.14288-1-fido_max@inbox.ru>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 14:40:13 +0100
Message-ID: <CAMRc=MdXmFxLKumVE632420O=TVwx9FyYqX1K-XK_r91jYzcpg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Microchip EEPROM 24xx1025 support.
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 10, 2021 at 7:26 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> Add Microchip EEPROM 24xx1025 support.
>
> v3: add dt-bindings
> v2: rebased on git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/at24/for-next
>
> Maxim Kochetkov (2):
>   eeprom: at24: Add support for 24c1025 EEPROM
>   dt-bindings: at24: add at24c1025
>
>  .../devicetree/bindings/eeprom/at24.yaml          |  4 ++++
>  drivers/misc/eeprom/at24.c                        | 15 ++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> --
> 2.32.0
>

Series queued for v5.17.

Bart
