Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E371F478044
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 00:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbhLPXEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 18:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236755AbhLPXEu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 18:04:50 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA05DC06173E
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 15:04:50 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id b192so412680vkf.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 15:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=62Uz9CtJjse1+mi3hhz9xxMLxgwHg1IYiyqR2g0WvAA=;
        b=oPpXX7fgyAeN9ysmwYzwz32+GFqY/Iii0AaKKKG+n0F9HkkkErU2yygWDqsaUCYycZ
         PcNZbJ12SXX3b3Ku2pVI0MO8fMqE5E7ZnTAgG8m/oSqCbVuVnCwPSgHfCP6PtW8k3QeN
         m640crZ1dsbJ0nS1wTE0RVThYDu93z94C8BXBYq4A1y+1pujPBnx/afeq5nwSzcA1aMU
         BbuSP5Mr1hR29FbnlS+jkOci7VnaFa2W/yi17LxpDiKDriiemUVO/gNl2Bc4Ewf8hLog
         NqD1KMoJHN4h8hcOO/JPmJzzFbg6N1ey9V8xhj7D87bcKMvi/NEsMJOKW7LmZbiMbR32
         8VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=62Uz9CtJjse1+mi3hhz9xxMLxgwHg1IYiyqR2g0WvAA=;
        b=K2MaZ6BF2xZoXRo4E7gJPLEn7f+8xbVLq/NbaiVxbXVgEjI+Rh7kGIJw2WJ0XVBAZS
         vLcWJATFjCi+EZuYF1FrXIWkgHmse19I8G/HG68tr+/U0WYf/HS/o/qTiIAiABejpqhH
         nN4INnfGhwTc8M5iuTaKhQbx5wYh4Qb48HEveX3b4gr++G1iSsu+8O+M98oV05tRP0hM
         e+0vEjo8Xx7XdX1NE09965IDh7AqXwTOKcP/6YkuE831nzZNwx4V3KcYM51cv4JZSz1v
         pUNDrLu+eG/G3wfSo8V+7UTGwdIZSET63BBJkkKLDVCPI98/IjHpplrXgQkUxbKRoBQ3
         qnhw==
X-Gm-Message-State: AOAM5310qGs6tUHgdeYkzotcu/ZgtVbw1MXx0hnPXu08PiAgyyQkMJO8
        cuUBRwzXWu5kX3HhVlHz3hL72N3I4+gzcintAN1xEw==
X-Google-Smtp-Source: ABdhPJw2TfUn4th8xuwGPyMcVF2I9HdXvfjfdX6cQIhp0D9opZOAXKvCtBGcWZWf6KrSbEYAnCgWoautwgTD+eidIEM=
X-Received: by 2002:a05:6122:c9b:: with SMTP id ba27mr176340vkb.14.1639695889846;
 Thu, 16 Dec 2021 15:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20211212181057.20210-1-semen.protsenko@linaro.org> <YbuuFztynhVUcyTM@kunai>
In-Reply-To: <YbuuFztynhVUcyTM@kunai>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 17 Dec 2021 01:04:38 +0200
Message-ID: <CAPLW+4mB5=ZfVPBAyV+yMr6xZif_kqtPTwO_8dMmVXyntE-4yg@mail.gmail.com>
Subject: Re: [PATCH] i2c: exynos5: Fix getting the optional clock
To:     Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Dec 2021 at 23:22, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sun, Dec 12, 2021 at 08:10:57PM +0200, Sam Protsenko wrote:
> > "hsi2c_pclk" clock is optional and may not be present for some SoCs
> > supported by this driver. Nevertheless, in case the clock is provided
> > but some error happens during its getting, that error should be handled
> > properly. Use devm_clk_get_optional() API for that. Also report possible
> > errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> > clock provider is not ready by the time I2C probe function is executed).
> >
> > Fixes: c93ac09df2a8 ("i2c: exynos5: Add bus clock support")
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Applied to for-next, thanks! But I needed to fix the Fixes tag?
>

Ah, sorry about that! I probably looked at some other tree. Thanks for applying!
