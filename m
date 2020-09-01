Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCBB2587BA
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 08:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIAGAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 02:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgIAGAi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 02:00:38 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB5FC0612A3;
        Mon, 31 Aug 2020 23:00:37 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c10so245494edk.6;
        Mon, 31 Aug 2020 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YG5VVLnr0PW/yZAIIXvrmgCG3qrxXpxZ6xJoDnhxDp8=;
        b=I1Cl2FDVaVvaOSOfgtQ92iqMB0672fG0G4xJKICPc4tAG3bPNWYmcZAC48HM3JiKyd
         oLAnsx6Z8+CW7CjXdqggMfMDaXGZAQAwAWOkEvYOqmABVzvNjcS1+g/1nsPV2qsJsaGX
         3dTTEn2MWKQZ2EcnCx6rB+dHrADKNuYQwfz+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YG5VVLnr0PW/yZAIIXvrmgCG3qrxXpxZ6xJoDnhxDp8=;
        b=kAnRDKSzwqnIf4dpESupSYW95pdT8HZd+5QTIxJuVICJOl00mK/l0j5jCNAqm9Xcie
         8GsEyJ/fRCg2LR/8WIdrBIUEstnsE2wxeSduCHu6LdkLN6cTvgN7IAFr65bsdo5P23Vj
         v4jncIBueCeYDvEhJicSt54B+/OM9BqQF/zUkUXNOeoyOZRtLT8N8jukDwbvMp0IYdnt
         Aix3LlZXv9YRlV8uaGHTf/Z3Zzw2aVfG53cIGX8fCxlUIF3ByNkQsWeZsoJ2Pxyo/EKt
         du2VU0N5ltbkZ7FYBU9d5b8irptvKv9YazZWXPwNKrsdNO+M6imM611Q3CmFKQZHjAaX
         hsww==
X-Gm-Message-State: AOAM530MiAEVRth5kzRjW96HuvKa/IS1HJA2xnbGDokyMC6BjyA8vHPn
        AcPI8J+/XNsMfPgNAz3hXGcnIchDqPuqZ9Nr3ig=
X-Google-Smtp-Source: ABdhPJz9eU3v8XlDwZfFwqePNcy+jcI0AiJOMWa794CyKfXIs0MDCh9UQDA9Ak+JcJYKcyUTgG+a6ltohowcflXsO3A=
X-Received: by 2002:a50:f403:: with SMTP id r3mr348556edm.260.1598940036519;
 Mon, 31 Aug 2020 23:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com> <20200820161152.22751-5-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-5-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 1 Sep 2020 06:00:24 +0000
Message-ID: <CACPK8XfeKiee-LAQZXs6jygr1Bj7pqGTGLUnTV1mzO5FBZ-XZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel I2C device
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 0 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 5f4ee67ac787..9cf2e02ae9e2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -438,7 +438,13 @@ aliases {
>  };
>
>  &i2c0 {
> +       multi-master;
>         status = "okay";
> +
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */

Other users of SLAVE_ADDRESS have included <dt-bindings/i2c/i2c.h> and
written the reg as follows:

reg = <(I2C_OWN_SLAVE_ADDRESS | 0x62)>

Which obviously has the same result. I'll leave it up to you.

Cheers,

Joel

> +       };
>  };
>
>  &i2c1 {
> --
> 2.26.2
>
