Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181DA5A543D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 20:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiH2S4J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 14:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiH2S4I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 14:56:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650F87CB76;
        Mon, 29 Aug 2022 11:56:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F9F461345;
        Mon, 29 Aug 2022 18:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27BFC433C1;
        Mon, 29 Aug 2022 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661799363;
        bh=TamrP8iZ3a/vwgNl6jeDj9HDRxUSmknwoJjwZBLDgZY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KQSQvxsbeIzLLxiwlVjxFLR3ADrZcGpYgb0rnA2Gj7j9j3KfTgZgKN4g+/UhIvJMO
         SOLXQwI7NIbj+ZS3tgc0smVXv1AX9v5oZzhjASP/JoZRo+vJmIms3LQhRczoIzZDGg
         8uAtSEpbdBeKpaXA2DKuVdckUbKt5q9r7YAkguWMBM1D8I7V/sHkis490ERcpUYMfN
         8FudKRGCp3jqO4TLZ4XywvXiKpWcae3MAYoJ4ULv210JBOxg3D5RPNtgETYiq8lW+7
         1he/aZaCwwmgF5VySnbOYmFP/5FUowYnvS2YMvq/O8pC7Kahhi8Yafg3O+OWcAw1Cm
         3ZL8Vw8VmBGgw==
Received: by mail-vs1-f48.google.com with SMTP id n125so9263960vsc.5;
        Mon, 29 Aug 2022 11:56:03 -0700 (PDT)
X-Gm-Message-State: ACgBeo3bFoEieJgvVV/IUFUY+z4d9DsyzzEOYKjsa85EUgpARwM9sgng
        d51AJ2KxSgZksPhOuYBrX4g5J2g2E6g9lcUIJQ==
X-Google-Smtp-Source: AA6agR6grX62i/E7StDauHsP3fBx3+bPYIqqhnUmd09JKq60dD7onEKO6KegzCgQzwWjRmCEa5WeupJu32B4Li6Aoes=
X-Received: by 2002:a05:6102:3353:b0:38c:9170:a96b with SMTP id
 j19-20020a056102335300b0038c9170a96bmr4295635vse.26.1661799362886; Mon, 29
 Aug 2022 11:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220828154904.20477-1-farbere@amazon.com> <20220828154904.20477-2-farbere@amazon.com>
In-Reply-To: <20220828154904.20477-2-farbere@amazon.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 29 Aug 2022 13:55:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1UAM80wydnq7hjsKB1zO9tE_Xnba8U3KjDiFY157TOA@mail.gmail.com>
Message-ID: <CAL_JsqL1UAM80wydnq7hjsKB1zO9tE_Xnba8U3KjDiFY157TOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: at24: add new optional power-supply property
To:     Eliav Farber <farbere@amazon.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Talel Shenhar <talel@amazon.com>,
        "Hawa, Hanna" <hhhawa@amazon.com>,
        Jonathan Chocron <jonnyc@amazon.com>,
        "Hanoch, Uri" <hanochu@amazon.com>,
        "Krupnik, Ronen" <ronenk@amazon.com>, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dkl@amazon.com,
        "Woodhouse, David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 28, 2022 at 10:49 AM Eliav Farber <farbere@amazon.com> wrote:
>
> Boards using the AT24 EEPROMs might have a GPIO that controls the power
> supply of the chip, and it must be set to enable the usage of it.
>
> Add a new optional property to the device tree binding document, which
> allows to specify a GPIO regulator for the pin that controls the power.
>
> On Linux this means that we need to enable the GPIO at the beginning of
> probe function, before trying to access the chip.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> V2 -> V3:
> Apply on top of v6.0-rc1
>
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index d14e0accbda8..82f0046f67a9 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -179,6 +179,10 @@ properties:
>      description:
>        phandle of the regulator that provides the supply voltage.
>
> +  power-supply:

The datasheets I looked at say the supply name is 'VCC', so vcc-supply.

> +    description:
> +      phandle of the gpio regulator that provides the supply voltage.

What the connection is is outside the scope of the binding. IOW, it
might not be a GPIO controlled regulator. So drop the description.

> +
>  required:
>    - compatible
>    - reg
> --
> 2.37.1
>
