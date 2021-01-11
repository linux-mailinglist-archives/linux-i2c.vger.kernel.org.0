Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3422F1B64
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 17:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733258AbhAKQsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 11:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389135AbhAKQsU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 11:48:20 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDF5C0617A3
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 08:47:18 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id q10so10030652vsr.13
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 08:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQTCUBSd32PPGYWf+4NIALcXpFdvaLx7ubBy6PwA+oo=;
        b=dV4BlOFvq3NnHp1B03OjVOTUkXxDivdCZzUxDmW4DhWl6JK6pz/TMEZzznL40CNtlU
         qTyNX4XXjyD4aWzUANyL5M3W32syMhp1DThb4pUUuqAM0FwZhL67S1aeDy5vDZDwNy2n
         0n7glfkziSL5hW3iiaR7wq4xhfDKi5Lv9eZxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQTCUBSd32PPGYWf+4NIALcXpFdvaLx7ubBy6PwA+oo=;
        b=dZX+URMU/8if5AnBkQHot16m65VcDmpgCaPTyjEuATlXRG+wHmT99gwrxZn2rgrWe7
         rdc9X/ap7KOdbws09O9tXOt3Vym7yEoMC2BI8qIXqjCqA/DCObmcm2eW7yuJscknbeDW
         2t8ASX0aZc0ZsUZGYJLZqMCgEYMVfJNem0HCB5QehUIabaKj14c6S/wn+7fCt63+dPnN
         Nyk5eWcI8w01pdIweLA86OI38jRUhNL0pJNUmF1PKMzboNe88JL2nvqzZu+fewX0qoCr
         jg8N1PPOTrrZPLPxrUmpyCfx/RbO08kSg9mKn0PHKMCrrIDhTcxGCGyUwusBJTdzpOaU
         vdUQ==
X-Gm-Message-State: AOAM53377AgZ0/9IEUWF57G3FKXawsQ+cyi724yLs+DG7kW/CWDUK5Jd
        dnR8x3S+IbB5asMwWQIz5oNpx1LELjVXfw==
X-Google-Smtp-Source: ABdhPJyrc/tZhSg303UMqDLmmTXCKyk/4wdNzivLpvSsUB8VGc2GAEWuqjb7Fg8AHJlO4WFzDEWZYQ==
X-Received: by 2002:a05:6102:66a:: with SMTP id z10mr422151vsf.53.1610383637026;
        Mon, 11 Jan 2021 08:47:17 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id v65sm57127vkb.31.2021.01.11.08.47.14
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:47:15 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id p128so4365995vkf.12
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 08:47:14 -0800 (PST)
X-Received: by 2002:a1f:4582:: with SMTP id s124mr621617vka.7.1610383633600;
 Mon, 11 Jan 2021 08:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20210111151651.1616813-1-vkoul@kernel.org> <20210111151651.1616813-8-vkoul@kernel.org>
In-Reply-To: <20210111151651.1616813-8-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jan 2021 08:47:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPNnSmgJM33QjAb4VvTe4Xs-OHcQCkk5E+o3u+afjbjA@mail.gmail.com>
Message-ID: <CAD=FV=UPNnSmgJM33QjAb4VvTe4Xs-OHcQCkk5E+o3u+afjbjA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi <linux-spi@vger.kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jan 11, 2021 at 7:18 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> @@ -2622,6 +2626,13 @@ pinmux {
>                                                "gpio2", "gpio3";
>                                         function = "qup0";
>                                 };
> +
> +                               config {

Convention in Qualcomm device tree files seems to be that the node is
"pinconf", not "config".


> +                                       pins = "gpio0", "gpio1",
> +                                              "gpio2", "gpio3";
> +                                       drive-strength = <6>;
> +                                       bias-disable;
> +                               };

Pin config almost never belongs in the SoC dtsi file.  This should be
in the board .dts file.  What if pulls are needed on some pins?  What
if you need a stronger or weaker drive strength?

-Doug
