Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA52262781
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 08:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgIIG5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 02:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgIIG5L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 02:57:11 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF174C061573;
        Tue,  8 Sep 2020 23:57:10 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id q21so1531692edv.1;
        Tue, 08 Sep 2020 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aucFnAaA6n54SqN2ylDW2Uq1+nK592raJ0MmLzBKiSs=;
        b=mYuIK7PT4ChKZXdBvVrAd7YKq7i/4lwweyhypREg+ye6C6cYuYWQo2zLiWiUGH+tWe
         6q6Clmjyx92I7Ed1bHBx7IQzZQc90V8ILbwtoZk/4SAT8ccv3Jo/4cM6wi8z41LJ4v3l
         DSWkf02+8QQ86flhs7lTLOQvzv0X58zrRLhLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aucFnAaA6n54SqN2ylDW2Uq1+nK592raJ0MmLzBKiSs=;
        b=g9mlM9R9Hx9Id5uOFiKHhS/o/RuRP/glVKQnZdUJTGP1XsdANsB3VfXP20ux3BSUdW
         jcjHVi0qO6EcAMHAFjyZNghpGX3kQgYMtu8eTO1iRPem4cf5L3Gh84ihj3VJ01ZddNtx
         SLnto1z+yEZthl74w+GYBbHNYb8WEl/V3izJx1LDVOVq04nokh01Dsu44hlF2/d5yphj
         28uyM8seCa1xNgqQE08caVo/n0OPcUUCwg0s8YRN+cGMyVlB5mwh8HPuIUR3WQZNVxFG
         r5wa6AIs4tTVyFipzBYG/pFnPPD3qzmHMJNlSWTnp4C6k5Z/7MHDkh8kx0YelWI8UuJo
         Wwnw==
X-Gm-Message-State: AOAM530ZRZHoN+gx1GkdbaW6FD9ZzgZ/be0nMbp6Ic6dEWS9WJDPAAi0
        cA/G9/GZacPrhkq353h7+5cC0Hit7VwiR7pOa3g=
X-Google-Smtp-Source: ABdhPJwPlzh1DnLGo9MSTT8J/yrnEnx7UmuC9FQVeFtz+arOOvvLH5XkI0R9H39kuPOE/iZLcwtZShJUK72WQR+TAXI=
X-Received: by 2002:a05:6402:ca7:: with SMTP id cn7mr2599331edb.143.1599634629657;
 Tue, 08 Sep 2020 23:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200908200101.64974-1-eajames@linux.ibm.com> <20200908200101.64974-5-eajames@linux.ibm.com>
In-Reply-To: <20200908200101.64974-5-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 9 Sep 2020 06:56:57 +0000
Message-ID: <CACPK8Xf0z4kz9JkTWPKveQsmEpKq0YtEQ+1Jracndu9g9UW7ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel
 I2C device
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>,
        wsa@kernel.org, Tao Ren <rentao.bupt@gmail.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Sep 2020 at 20:01, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 0 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I will take this and the rainier dts patch through the aspeed tree so
we don't get conflicts.

Eddie, when you send v3, you can omit them.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 5f4ee67ac787..4d070d6ba09f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -4,6 +4,7 @@
>
>  #include "aspeed-g6.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
>  #include <dt-bindings/leds/leds-pca955x.h>
>
>  / {
> @@ -438,7 +439,13 @@ aliases {
>  };
>
>  &i2c0 {
> +       multi-master;
>         status = "okay";
> +
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
>  };
>
>  &i2c1 {
> --
> 2.26.2
>
