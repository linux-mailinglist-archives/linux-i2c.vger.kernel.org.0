Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D005D263AC8
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 04:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbgIJCpL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 22:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730449AbgIJCmh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 22:42:37 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F304C061757;
        Wed,  9 Sep 2020 19:42:37 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c10so4731854edk.6;
        Wed, 09 Sep 2020 19:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IV24EMooKIdI1/XvCM1HiUrz4TlPj+AnTpwU1/6j+Fs=;
        b=mWO6yxylw5PrvytFJ8u0boPEDxdTeiaoYmRzeT/uCBQ8/QFlbRfV1kV6i9EY6Z4BEd
         QRREVP9cHw0qx5Cq+pWhmbmW1yobRKr1CllHpkaCfuhaNnn0UI3I5hNUVU4z86QyqE0e
         f9k/LXU/j+MhEp69BBWsqcmKrKNP/Q/mpzRK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IV24EMooKIdI1/XvCM1HiUrz4TlPj+AnTpwU1/6j+Fs=;
        b=kKHrDo1iEySLF8EdB0mpDAFcfi6xGWWNLi8qucIL59nQImlxfiyKkJnAwxvAQsxiUt
         WQ6VgF2ZcmsMQPMeTEHeHA2KOh/6ikFsgkoRbRsa25C/E4nrVgk35XIxKJ6W9RvoJdFi
         s2QEkrRzzXDrB0K3sMqGt6y6qCpNzeiD4nSaViJDK5LJQNDwJ9TRuok4u1NvBOsy537t
         pw781aMW/4wVqb2NTCCsi9YdEHIxc3NtiajxlL/ZkMpgY9eb9La4GDOE51OWBIyU3Omi
         4/C+80LV1Dq7+iyWGAYV3maWsR6gBnhxo7AVVo5wvnHYz1JTZYYs5lEOLJe6cfxB5GzR
         oddQ==
X-Gm-Message-State: AOAM5324nFcnYjZ56Gvx55AbwqbALLJg7/yZLJdlPaJ6D6varGwyt+ij
        b48FEm+K7lfWzxovibbIZZVBaAgUsfpw15/OG/E=
X-Google-Smtp-Source: ABdhPJwTM4O5O5xRMECD/ml4XHGuaZA2V4he+MJw7w757tMECPm75d0txtkWrhCsL/3ha/ISqjZVL6egBSM4IlbTHrs=
X-Received: by 2002:a05:6402:220d:: with SMTP id cq13mr7091704edb.260.1599705755811;
 Wed, 09 Sep 2020 19:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200909203059.23427-1-eajames@linux.ibm.com> <20200909203059.23427-6-eajames@linux.ibm.com>
In-Reply-To: <20200909203059.23427-6-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 02:42:23 +0000
Message-ID: <CACPK8XeWS23xdBKs7Ge+MWqHr4HANTVeC4LSLqEujcp8eG=auw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: Aspeed: Rainier: Add IBM Operation Panel
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
> Set I2C bus 7 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to the aspeed tree for v5.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index b94421f6cbd5..50d528444f5d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -4,6 +4,7 @@
>
>  #include "aspeed-g6.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
>  #include <dt-bindings/leds/leds-pca955x.h>
>
>  / {
> @@ -698,6 +699,7 @@ eeprom@53 {
>  };
>
>  &i2c7 {
> +       multi-master;
>         status = "okay";
>
>         si7021-a20@20 {
> @@ -831,6 +833,11 @@ gpio@15 {
>                 };
>         };
>
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 2.26.2
>
