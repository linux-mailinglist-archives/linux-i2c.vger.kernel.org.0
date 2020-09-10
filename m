Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC88263AC3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 04:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbgIJCoC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 22:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730699AbgIJCmE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 22:42:04 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3920C061756;
        Wed,  9 Sep 2020 19:42:03 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so6467320eja.2;
        Wed, 09 Sep 2020 19:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqwpRLg4PT44jhpT//Uf1w2MoxgHWm0NwZNCgoTWYaQ=;
        b=SzbeO7Oa0OQJSMhsqoY5ZVWwaerWZtBxMvU91a4ZbLSIjrnT/wA/jxzt9sw1LWMGWg
         MR13QS591LgNNIInj50Q+kz8yNMCRw08k0PnyEa0ts12t7O+VSo9CsnK1c9akMFFkMSu
         C3JuOqI5xeP4ZEbgA+ikOy3PHSXgtGgZU85ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqwpRLg4PT44jhpT//Uf1w2MoxgHWm0NwZNCgoTWYaQ=;
        b=S7kLjoz7yfPQownPM4pmK1omA3moG32ZAMxFNcTGp+EepkCob+NUaudGW+uUjtM2N8
         In6Z5lWgUUB4fWul99GS+YOIScFs5rL/zHwEggXwN1MsKXyzAvWatoubcqMdlh65Z57h
         s4IUSuVuDO4Ihy483OdOqzZz6Q5OkH7ElQSRR9a/G4ia92PtA/AqE9gSVyqcUIFpxKbi
         e9tOQ+TO3dL4gb5OGZC3Q8FE3EWpp0lCy9J6Se5AohTxxoZoh5v3iVEZXxuD49gIuRGF
         np2joc7J5JSYrhq6m0XHjok8Zck/ORbSpRNiv1C57FOkWNCD9F5+42Zcqp8OKeWlHoVI
         MMtg==
X-Gm-Message-State: AOAM533pOQpfGoVote4SNhjY0rfJgDDKKac+qKU4tkq9sopYjzUcPqPo
        bwQqKzVlIwX58gR+KGSteZoE+m9AzkYfkD7ODmFM7OjPYmA=
X-Google-Smtp-Source: ABdhPJwcXluGz3hInva1gKy4bM6y+M5N5Gn1vQaAuMY9KP0ILDgfzMQslOJeSPPJbmHsAfiiGjCmfeI9GQntCW6JJLg=
X-Received: by 2002:a17:906:e918:: with SMTP id ju24mr6428814ejb.442.1599705722453;
 Wed, 09 Sep 2020 19:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200909203059.23427-1-eajames@linux.ibm.com> <20200909203059.23427-5-eajames@linux.ibm.com>
In-Reply-To: <20200909203059.23427-5-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 02:41:49 +0000
Message-ID: <CACPK8XdSUAiShnY2CZOb8_6YfaMxXnbUg0k=mWctYbRWEUpyBg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel
 I2C device
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, dmitry.torokhov@gmail.com,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>, wsa@kernel.org,
        Tao Ren <rentao.bupt@gmail.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 9 Sep 2020 at 20:31, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 0 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to the aspeed tree for v5.10.

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
