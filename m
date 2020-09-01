Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0870D2587C9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 08:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgIAGBW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 02:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgIAGBV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 02:01:21 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027E4C0612A3;
        Mon, 31 Aug 2020 23:01:21 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z22so839539ejl.7;
        Mon, 31 Aug 2020 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaHfsFFvsKz8Si4WdVVOjQJsf4E9yNDaoM4FPWbSNvE=;
        b=Yrn5M09qMo7Ev8s79fvPnWTl2NFswv8DuA0HiCrXU9QyHiKt4/Q9LiFX09QFi10GZW
         bPayA7qZ+7h9StZJ6G8Rzq/FUGwnovc+Abo/ZKNmcTxwIiUJi2uD/uvpELc8KQojWu6s
         OAwRQUh16hX9et97nwHOUEx6hpkcFJ+Bk9O7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaHfsFFvsKz8Si4WdVVOjQJsf4E9yNDaoM4FPWbSNvE=;
        b=UKr8AJ3ofZsh/S2z2vtKquDAhNXQdlDAgRYmYK3APaWxRkV10432gizThFeLBLXskk
         ty7BUXJ/l7no00gDqQl6QNwr6w4lzRUcB3/ig7qx14MsvzBOf1bgUEkgXe3KLxzcZXjv
         +N/2MH6Qykw4C6Slibd3B4UXzkNlcrSIcMycARxCxEw5qcVBHKm4cChqmN7g6QVsszj1
         KG3sEXJWXTs2Ug2XaPDLXoyx/kqfVIjO4nF/PZ+rVBgBVEjHFY/g9CRYK6NyMYVt+rZ5
         MoVALOkjqoTB8LmgH+5sOStLhTC8jdzeBQyK4fF9gSSjt6vV20TQkqJg8quy0C1t8eS+
         Nq5w==
X-Gm-Message-State: AOAM533whvYH+RxA+/jSNC4iKTHhbjftJZC9lNlkuiBT0ArRGrRAWggm
        YWdCTK8J/1O/MxRqMegG2wU90lKKEIGp8owL+RCxctp4BnY=
X-Google-Smtp-Source: ABdhPJxqy/GN58FoQLdvnCX11Vvy8+zzlnuPo/ylntZPwFduXZjSx80mFGNsb6xczOXnJ2uuauRFvtkGNeRxJJbngzI=
X-Received: by 2002:a17:906:4c58:: with SMTP id d24mr110959ejw.108.1598940079725;
 Mon, 31 Aug 2020 23:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com> <20200820161152.22751-6-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-6-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 1 Sep 2020 06:01:07 +0000
Message-ID: <CACPK8XcW-LfJ6FBdKntod_F1dnRoSP=4D7=TLtM5yGkhTm79Rw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: Aspeed: Rainier: Add IBM Operation Panel
 I2C device
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
> Set I2C bus 7 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Same comments as for Tacoma.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index b94421f6cbd5..f121f3c26a3a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -698,6 +698,7 @@ eeprom@53 {
>  };
>
>  &i2c7 {
> +       multi-master;
>         status = "okay";
>
>         si7021-a20@20 {
> @@ -831,6 +832,11 @@ gpio@15 {
>                 };
>         };
>
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <0x40000062>;     /* I2C_OWN_SLAVE_ADDRESS */
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 2.26.2
>
