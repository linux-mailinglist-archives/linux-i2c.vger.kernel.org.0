Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C30F450A45
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 17:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhKOQ6l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 11:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbhKOQ6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 11:58:40 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FE9C061570
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 08:55:43 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id w15so17413214ill.2
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 08:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EZ7NYt0W413AD7cV4RQDPmgYwsGcXKqpIAx5+YC6+Bo=;
        b=XsnQEFUknE61g50ai18W9TgJ92Cg0GKsw7/0yRbT5zg9e0A0FIC9p0J7wEr6WsX57Z
         veF10fQeNCSVRbgxVjX+tOdfVRGtvIhM4jgBRHh8cRd1dLfmVlCAIPEtoArcQoH5nn5L
         NxQ51PkeKFKDH+37zbAWK8JAGzRZWib1RaFNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EZ7NYt0W413AD7cV4RQDPmgYwsGcXKqpIAx5+YC6+Bo=;
        b=JCvXtmZbVScvp22pAa6gzOwiJi/hjaS00TONOkxv0Qw7U6tMxYC+Yr31nbm3C60yHw
         Ym5Y5yOPiUVXgAu6qsOT8HkS8KSb/MLSo5niAcQibYnTGJMtVf+9VQPlN1iw3M6EpXXS
         1BVeDAfR7GJvI/H65Mox+bp7SAm8stCdYrkKJqv1E84evp1BQRzAe3HVbBM06xhj6SC8
         BusYfZPv87rF+xwmo7iGvwVgvGXOod0sqTQ5BefXBRf6tl8k8198XY3FPHzm7g7A8LRN
         Tw1DOPlI0S8f2ZRsvdu5zrF1AMPYi+NuTdYT5RZwKeWPlFqEd/Q/qDXxt88i85Ndl2c+
         dV4A==
X-Gm-Message-State: AOAM530vFdc2QirnN19Ypjo1x8B+N7FhKdeVqQmFXqb8KjNscGMi6m+c
        zhePyQdior3eDYCP9am6I2q7GGH3hSgcIA==
X-Google-Smtp-Source: ABdhPJyu321nM6eTxIETfygDt2QHIU3UHJXz2ZYLo5YicQ5VBXXRMOVbPM2tYqwYBN6bKE68Cye9Gw==
X-Received: by 2002:a05:6e02:1a85:: with SMTP id k5mr204398ilv.27.1636995343039;
        Mon, 15 Nov 2021 08:55:43 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id r3sm9098287ila.42.2021.11.15.08.55.42
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 08:55:42 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id m11so17440749ilh.5
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 08:55:42 -0800 (PST)
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id l2mr227461ilv.114.1636995342360;
 Mon, 15 Nov 2021 08:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 15 Nov 2021 08:55:06 -0800
X-Gmail-Original-Message-ID: <CAE=gft5CXQaC3M-LoWtY_TEnBEdK-kR9uH_Zqp1y6EDWyXdaYg@mail.gmail.com>
Message-ID: <CAE=gft5CXQaC3M-LoWtY_TEnBEdK-kR9uH_Zqp1y6EDWyXdaYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] i2c: mux: gpio: Replace custom acpi_get_local_address()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 7:42 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Recently ACPI gained the acpi_get_local_address() API which may be used
> instead of home grown i2c_mux_gpio_get_acpi_adr().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Evan Green <evgreen@chromium.org>
