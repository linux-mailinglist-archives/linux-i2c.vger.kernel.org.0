Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87E72587B1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 07:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgIAF61 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 01:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIAF61 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 01:58:27 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D515CC0612A3;
        Mon, 31 Aug 2020 22:58:26 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id c10so240243edk.6;
        Mon, 31 Aug 2020 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXS7+3EgnC5I92ixxRxNaCdg1MKz+VkNDCcOltlFbJA=;
        b=cTMpbC4o8DudpdOFlrGnTxYKJhR5TLl9BTn35t1Vg80O5o366+KbhUnyM7rEN5o1cj
         gLVgVdvfRy2k8csl7iDtnYcWyRBV54dXE4hV+jPTK7+YPFFOVNaJ6hiNjWPJfKqj3mE+
         TlMOCmQ8kMybmwAZ2PzJZbHgzB3c8HMJrduJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXS7+3EgnC5I92ixxRxNaCdg1MKz+VkNDCcOltlFbJA=;
        b=T+kwbbFnWw7qI+igVtvJAma6EGaVDPmC++wlW/Yc/tYTsU8f9YsiNYcuCaDdCZYNz+
         qVqq7xGiHdQo209WUz/uNU8kWTuXOMymVLnkCAu31hTesSETGWJmoEY/p2KiRdYly+VS
         6Bbq/01EtFsprdSDsn51P0SJJKt5u/2WzLCNS2un0ipc3NPZIC1DpCYkb+m4anwFUDlK
         PWt3mYWvxpZ6I8bffyUD/V8BJsaRc+Pr/SOArXJX69rAhec1vzBtauAnBIk33rslXxOV
         r2iCOzVWbPmrvc/ATKsBppBM2TWQ2hDkDh87jlaGE/HmYcowbQm8YiwnLsdnqBUE+aX1
         nf7A==
X-Gm-Message-State: AOAM530ecWBM/ahaRoPOj7B/KRpq0TrLAC7FAW2jh1/gXKhyz1ylfLET
        wcv/yA4wMLt8iAgXvulgthOmYNvuoeYnDj3tRxo=
X-Google-Smtp-Source: ABdhPJzPz7FKzhyE9tVkVgSodtZ62x5Kp312jVoxK4YoGK8nlMeYcU3Y4PKQ1ykmm4tDi9GtbIpQnd5EMQO2LKaGHEc=
X-Received: by 2002:a50:f403:: with SMTP id r3mr342011edm.260.1598939905467;
 Mon, 31 Aug 2020 22:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com> <20200820161152.22751-3-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-3-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 1 Sep 2020 05:58:12 +0000
Message-ID: <CACPK8XdMqZv5f0X1-G2WPrYSpYMpMjJC4WxNsiKSxqtWb0M1jw@mail.gmail.com>
Subject: Re: [PATCH 2/5] input: misc: Add IBM Operation Panel driver
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
> Add a driver to get the button events from the panel and provide
> them to userspace with the input subsystem. The panel is
> connected with I2C and controls the bus, so the driver registers
> as an I2C slave device.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  MAINTAINERS                    |   1 +
>  drivers/input/misc/Kconfig     |  10 ++
>  drivers/input/misc/Makefile    |   1 +
>  drivers/input/misc/ibm-panel.c | 186 +++++++++++++++++++++++++++++++++
>  4 files changed, 198 insertions(+)
>  create mode 100644 drivers/input/misc/ibm-panel.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a9fd08e9cd54..077cc79ad7fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8283,6 +8283,7 @@ M:        Eddie James <eajames@linux.ibm.com>
>  L:     linux-input@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> +F:     drivers/input/misc/ibm-panel.c
>
>  IBM Power 842 compression accelerator
>  M:     Haren Myneni <haren@us.ibm.com>
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 362e8a01980c..88fb465a18b8 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -708,6 +708,16 @@ config INPUT_ADXL34X_SPI
>           To compile this driver as a module, choose M here: the
>           module will be called adxl34x-spi.
>
> +config INPUT_IBM_PANEL
> +       tristate "IBM Operation Panel driver"
> +       depends on I2C_SLAVE || COMPILE_TEST
> +       help
> +         Supports the IBM Operation Panel as an input device. The panel is a
> +         controller attached to the system with some buttons and an LCD display
> +         that allows someone with physical access to the system to perform
> +         various administrative tasks. This driver only supports the part of
> +         the controller that sends commands to the system.

Is this always attached via a service processor/bmc? If so, mention it
here so people know there's no point enabling it on a host/distro
kernel.

I assume you're implementing the protocol correctly.  If you have a
link to a specification then include that in the file.

The code looks okay to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>
