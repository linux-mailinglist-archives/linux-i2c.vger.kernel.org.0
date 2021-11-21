Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622AC4586CF
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 23:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbhKUWyH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 17:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbhKUWyG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 17:54:06 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532EEC06174A
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 14:51:01 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so26106235otg.4
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 14:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPWdnLAG4F0+O/cKfXO41ARuBr52660bNdQdvywOP4Y=;
        b=KOB6vV4KS8hxKMpT0VDKo61v+J3w0emW1YgL/HvpwnQlY7FZUmFVBcVfteUKoNkqYG
         X1RQyE5cKCrlbMC//GYbSdEe4DjunnFt5bFqFb/T/aB9hljIjiijGW9OxbXqMpVkm/sE
         n52BhCrngNN3aBfsfRDEm/QnCaPRDekq5hRqU/dAu+3tPlns3KgqmWIl7LZffCZZPVgQ
         8TCNkX/L56KJhckqSfPijLbXvBG0ug4DMQtFWpWkIsj/r1UYMbFwQdD6/CHvSe+7ZTY1
         SreqClOPDK1m1bwZl74XjBrgSbNYnDQoYz7y5QAO2x5yhUFOyOQV7e4Cr5/gyYiKCKVx
         3m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPWdnLAG4F0+O/cKfXO41ARuBr52660bNdQdvywOP4Y=;
        b=S+iaDAQMSIUGbuQzr49XUCPKfDFytUs3Az3vImrfvtj0osGKSBH1J4KDmWQMf42rFZ
         /X/IzP9m85OqxaI2sJjfp/esojV06Q8F51kgLvGtzGFtRopl4kM33SrKMOyeWB412VDX
         VAdfLgKpxMKE791rq9aYwJbQ2qpkVjqAcoucgRB68thR2iBnkzWa+451Q/UbuixsTA3C
         PhoPljyNh0cGJmg5eSE/Y2ikYchyyDgQsjeSTEZGwxb7b+4XE6Mn3jlCVcskrPHW8sq3
         q1NqZRJEZjOY9A3NXNoFMq/tIZQhFkuqWli46W5+BwDV45UzZxF2y3vVNxRwTBd8ervD
         45Dg==
X-Gm-Message-State: AOAM5331D6NjFAHTED40wvkSX5j6daSrKeB/WzxwSgbPmgW0TNv2BJED
        Jc/I3XdJoYtpDAPlh4RpxePTHf53/izwD4ZTq+94WQ==
X-Google-Smtp-Source: ABdhPJw+IURZg7LAXOySyG68vfWW1OBtjBY5hqcbBojTczIDo4sqsxNk20a2JBnKqNRdEf8UrKSDBSMPsc577lx54AI=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20420713otj.35.1637535060584;
 Sun, 21 Nov 2021 14:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20211109161707.2209170-1-robh@kernel.org>
In-Reply-To: <20211109161707.2209170-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Nov 2021 23:50:49 +0100
Message-ID: <CACRpkdZdZH9e5fHaFArcRxBcdEdfWDmxmDkTwL9EwchkTceCHg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove Netlogic bindings
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        George Cherian <gcherian@marvell.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 9, 2021 at 5:17 PM Rob Herring <robh@kernel.org> wrote:

> Support for Netlogic was removed in commit 95b8a5e0111a ("MIPS: Remove
> NETLOGIC support"). Remove the now unused bindings.
>
> The GPIO binding also includes "brcm,vulcan-gpio", but it appears to be
> unused as well as Broadcom Vulkan became Cavium ThunderX2 which is ACPI
> based.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: George Cherian <gcherian@marvell.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
