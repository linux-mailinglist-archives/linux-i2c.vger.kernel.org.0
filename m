Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A817D1716D6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2020 13:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgB0MLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Feb 2020 07:11:19 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42154 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgB0MLS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Feb 2020 07:11:18 -0500
Received: by mail-ua1-f66.google.com with SMTP id p2so850159uao.9
        for <linux-i2c@vger.kernel.org>; Thu, 27 Feb 2020 04:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=maw8fNiBZ+S2xv6T6LqluUYlWnMWB69qS0344f6fpEE=;
        b=WnH2J12/8/JJX+kKUCb5VZGwQLfj8WV4pZf93vOutsFpK4XJxfFRUJdp5rCI/YqLLk
         9bx5GfFILgWU9q32avz26AGXCIlaiyjXicPiQaSXIRsRl6kdDnfiEVprwdCF6e0raIej
         4oFu5TFe3aVlltqr4TVCV5+epg52KTMrxmJS9Ul0+9iRK2G9OYHaAbrMTU9kexipWyHu
         PVahiBTbhJpkjvY6kTFgUiI2heciM2dmQrsppsGQgzuYGfHmM3ud8vMfmTJKKc6WF+Sh
         mrkPd+07a/BKGTAMX+GAQpJ7M6NNaqSnkixe8x3YwfQbggjN0X0yjWn/B+Fxb8YC7Ozy
         KhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=maw8fNiBZ+S2xv6T6LqluUYlWnMWB69qS0344f6fpEE=;
        b=Gd7E8VqKtYM8EcOFwcwefAkbnEhvaqotGQLsqx8Ep2gdAwMeZ06pK623j7pAa2FaiM
         jeYZbeW0uKVrtvt1WG3arYD2NlFdADGbfFw76bQVZgaevZX27jv5il/YK2m4HkKBokai
         bERw3sLPhfWc2MTQsuiMGZZQHI/OMqUkO/xFbO7kxZqRZcAgGenBa+AQPOJLL5+TSctV
         j/IIelV2iJ00SXby6rEhyPTuhuhsyVLc2ST6+8IB/cFp1dG7AHKDwOclU6CMAWS168wP
         R4QqONOCVft0d6w42SI4TTbMdnJ888i9z2blhktj/pTO95bk1NEvDz/YFCbnfbsBOkHA
         YPYw==
X-Gm-Message-State: APjAAAX02tdAntptvayDz/UsQ4FZcZ6hxkaz7oqzqLXDmL9I2re6H7WP
        Yh3Vw4t7+I/+I6AuxmjPmfFh+/gczU4YbUgGI4Pg6z2PD0tC7Q==
X-Google-Smtp-Source: APXvYqzGAVBcfDoQ/3mCviHMDzmELhH3MdSHbuNtZGC3bH2Uh2LGIuyBsUKc4ZGbkF4Je69N7zVEnv4lgayLX9gobWs=
X-Received: by 2002:ab0:2819:: with SMTP id w25mr1023157uap.67.1582805474959;
 Thu, 27 Feb 2020 04:11:14 -0800 (PST)
MIME-Version: 1.0
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org> <1581946205-27189-7-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1581946205-27189-7-git-send-email-akashast@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 27 Feb 2020 17:41:03 +0530
Message-ID: <CAHLCerM8Av_x8smUfOS_-TMEMzi1xRjgs0ta7=tqdYL2CgjNrw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: sc7180: Add interconnect for QUP and QSPI
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, broonie@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        mgautam@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,


On Mon, Feb 17, 2020 at 7:01 PM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Add interconnect ports for GENI QUPs and QSPI to set bus capabilities.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Note:
>  - This patch depends on series https://patchwork.kernel.org/cover/11313817/
>    [Add SC7180 interconnect provider driver]. It won't compile without that.

I've tried picking up v4 of Odelu's series to add the SC7180 but I'm
still unable to compile this. I see the following error:

Error: /home/amit/work/sources/worktree-review-pipeline/arch/arm64/boot/dts/qcom/sc7180.dtsi:353.32-33
syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.lib:296:
arch/arm64/boot/dts/qcom/sc7180-idp.dtb] Error 1

As part of picking up the dependencies, I've pulled the following
series on top of v5.6-rc2:

- https://lore.kernel.org/r/1581932974-21654-2-git-send-email-akashast@codeaurora.org
- https://lore.kernel.org/r/1581932212-19469-2-git-send-email-akashast@codeaurora.org
- https://lore.kernel.org/r/1581946205-27189-2-git-send-email-akashast@codeaurora.org
- https://lore.kernel.org/r/1582646384-1458-2-git-send-email-okukatla@codeaurora.org
- https://lore.kernel.org/r/20200209183411.17195-2-sibis@codeaurora.org

What am I missing?

I've pushed the aggregate branch here for convenience:
https://git.linaro.org/people/amit.kucheria/kernel.git/log/

Regards,
Amit

>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 199 +++++++++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index cc5a94f..04569c9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -352,6 +352,14 @@
>                                 interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>,
> +                                               <&aggre1_noc MASTER_QUP_0
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -365,6 +373,11 @@
>                                 interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -376,6 +389,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart0_default>;
>                                 interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -389,6 +407,14 @@
>                                 interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>,
> +                                               <&aggre1_noc MASTER_QUP_0
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -402,6 +428,11 @@
>                                 interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -413,6 +444,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart1_default>;
>                                 interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -426,6 +462,14 @@
>                                 interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>,
> +                                               <&aggre1_noc MASTER_QUP_0
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -437,6 +481,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart2_default>;
>                                 interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -450,6 +499,14 @@
>                                 interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>,
> +                                               <&aggre1_noc MASTER_QUP_0
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -463,6 +520,11 @@
>                                 interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -474,6 +536,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart3_default>;
>                                 interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -487,6 +554,14 @@
>                                 interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>,
> +                                               <&aggre1_noc MASTER_QUP_0
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -498,6 +573,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart4_default>;
>                                 interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -511,6 +591,14 @@
>                                 interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>,
> +                                               <&aggre1_noc MASTER_QUP_0
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -524,6 +612,11 @@
>                                 interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -535,6 +628,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart5_default>;
>                                 interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> +                                               &qup_virt SLAVE_QUP_CORE_0>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_0>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>                 };
> @@ -561,6 +659,14 @@
>                                 interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>,
> +                                               <&aggre2_noc MASTER_QUP_1
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -574,6 +680,11 @@
>                                 interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -585,6 +696,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart6_default>;
>                                 interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -598,6 +714,14 @@
>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>,
> +                                               <&aggre2_noc MASTER_QUP_1
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -609,6 +733,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart7_default>;
>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -622,6 +751,14 @@
>                                 interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>,
> +                                               <&aggre2_noc MASTER_QUP_1
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -635,6 +772,11 @@
>                                 interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -646,6 +788,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart8_default>;
>                                 interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -659,6 +806,14 @@
>                                 interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>,
> +                                               <&aggre2_noc MASTER_QUP_1
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -670,6 +825,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart9_default>;
>                                 interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -683,6 +843,14 @@
>                                 interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>,
> +                                               <&aggre2_noc MASTER_QUP_1
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -696,6 +864,11 @@
>                                 interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -707,6 +880,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart10_default>;
>                                 interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -720,6 +898,14 @@
>                                 interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>,
> +                                               <&aggre2_noc MASTER_QUP_1
> +                                               &mc_virt SLAVE_EBI1>;
> +                               interconnect-names = "qup-core", "qup-config",
> +                                                       "qup-memory";
>                                 status = "disabled";
>                         };
>
> @@ -733,6 +919,11 @@
>                                 interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>
> @@ -744,6 +935,11 @@
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&qup_uart11_default>;
>                                 interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> +                                               &qup_virt SLAVE_QUP_CORE_1>,
> +                                               <&gem_noc MASTER_APPSS_PROC
> +                                               &config_noc SLAVE_QUP_1>;
> +                               interconnect-names = "qup-core", "qup-config";
>                                 status = "disabled";
>                         };
>                 };
> @@ -1051,6 +1247,9 @@
>                         clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>                                  <&gcc GCC_QSPI_CORE_CLK>;
>                         clock-names = "iface", "core";
> +                       interconnects = <&gem_noc MASTER_APPSS_PROC
> +                                       &config_noc SLAVE_QSPI_0>;
> +                       interconnect-names = "qspi-config";
>                         status = "disabled";
>                 };
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
