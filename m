Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C10E172472
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2020 18:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgB0RDe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Feb 2020 12:03:34 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46975 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbgB0RDe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Feb 2020 12:03:34 -0500
Received: by mail-pl1-f194.google.com with SMTP id y8so19506pll.13
        for <linux-i2c@vger.kernel.org>; Thu, 27 Feb 2020 09:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yBJPiQ0lbOVfSLOfY+tNxn+dKqPwPLLFFEsiwvstDG8=;
        b=VIkHqSxtex3FQfqYTBYAEyUYzs4GfsPK7twrZmzNnW2uF4wz1iqcviGBGKwwHz0LAd
         wGBKikXRXJZnQEvd8NZUDZmgqFTtDQwCx1Yni4y6v9uvK8eIZveVsxTVsfKpgOc8vVFI
         2KiI/ort/NLB+sXBdP6Whe4VXi8nI3AhfuiYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yBJPiQ0lbOVfSLOfY+tNxn+dKqPwPLLFFEsiwvstDG8=;
        b=hWBj5teBclDwcrgZHx6GuCK3g2hZg+Y5D27aI3Ca/DBnWUlHqLoECL0GwLIefzMdGx
         zjOvs4GaYR3VldH/hF8OY8xnBg6OOgB+nxkFPmtJls9V9614/CQ38dn/qSPCl25cKr78
         uBBtv+xmbEFY3mo/4vXqz30OQyqlWNwJ3L/fQz2/+PSYSvSaKhcbNFwqR4IOIkcBCcIi
         9kdfbfBxDAupsA5dBpXgfsHSDuzKCiJ3n+AlCefMtQ6yWfpLSNAUXBr8M14oOgBT8L+P
         mIse2/N3y6UZucgJ5LTVt3eBE6WZ6mNtCZgNbqPQ3m+m20yOIUI1H+9kBMA2MQv365D0
         ncfw==
X-Gm-Message-State: APjAAAVrWIlMFefTWE6tvX7pkr6E2CyT81C+tsIz8l6bmsWxXA8pUTYu
        MZORcW0YoGM8H/buHS1ZI4HYdw==
X-Google-Smtp-Source: APXvYqygcAgUdRICx2ZrdIZaI2UzMLhgNb1ZAocwo8lrdXQ8MRvWXJbsnxOlMRUCZrE0zxwR9sWLJw==
X-Received: by 2002:a17:90a:266f:: with SMTP id l102mr667858pje.67.1582823012069;
        Thu, 27 Feb 2020 09:03:32 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y190sm8061108pfb.82.2020.02.27.09.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 09:03:31 -0800 (PST)
Date:   Thu, 27 Feb 2020 09:03:29 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-serial@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6/6] arm64: dts: sc7180: Add interconnect for QUP and QSPI
Message-ID: <20200227170329.GI24720@google.com>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-7-git-send-email-akashast@codeaurora.org>
 <CAHLCerM8Av_x8smUfOS_-TMEMzi1xRjgs0ta7=tqdYL2CgjNrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHLCerM8Av_x8smUfOS_-TMEMzi1xRjgs0ta7=tqdYL2CgjNrw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Amit,

the following include is missing:

#include <dt-bindings/interconnect/qcom,sc7180.h>

It was added in v2 of "arm64: dts: sc7180: Add interconnect provider DT.
nodes", but removed in later versions. v2 had a comment requesting to move
the include one line up, my guess is it got lost while doing that.

On Thu, Feb 27, 2020 at 05:41:03PM +0530, Amit Kucheria wrote:
> Hi Akash,
> 
> 
> On Mon, Feb 17, 2020 at 7:01 PM Akash Asthana <akashast@codeaurora.org> wrote:
> >
> > Add interconnect ports for GENI QUPs and QSPI to set bus capabilities.
> >
> > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > ---
> > Note:
> >  - This patch depends on series https://patchwork.kernel.org/cover/11313817/
> >    [Add SC7180 interconnect provider driver]. It won't compile without that.
> 
> I've tried picking up v4 of Odelu's series to add the SC7180 but I'm
> still unable to compile this. I see the following error:
> 
> Error: /home/amit/work/sources/worktree-review-pipeline/arch/arm64/boot/dts/qcom/sc7180.dtsi:353.32-33
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.lib:296:
> arch/arm64/boot/dts/qcom/sc7180-idp.dtb] Error 1
> 
> As part of picking up the dependencies, I've pulled the following
> series on top of v5.6-rc2:
> 
> - https://lore.kernel.org/r/1581932974-21654-2-git-send-email-akashast@codeaurora.org
> - https://lore.kernel.org/r/1581932212-19469-2-git-send-email-akashast@codeaurora.org
> - https://lore.kernel.org/r/1581946205-27189-2-git-send-email-akashast@codeaurora.org
> - https://lore.kernel.org/r/1582646384-1458-2-git-send-email-okukatla@codeaurora.org
> - https://lore.kernel.org/r/20200209183411.17195-2-sibis@codeaurora.org
> 
> What am I missing?
> 
> I've pushed the aggregate branch here for convenience:
> https://git.linaro.org/people/amit.kucheria/kernel.git/log/
> 
> Regards,
> Amit
> 
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 199 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 199 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index cc5a94f..04569c9 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -352,6 +352,14 @@
> >                                 interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>,
> > +                                               <&aggre1_noc MASTER_QUP_0
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -365,6 +373,11 @@
> >                                 interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -376,6 +389,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart0_default>;
> >                                 interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -389,6 +407,14 @@
> >                                 interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>,
> > +                                               <&aggre1_noc MASTER_QUP_0
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -402,6 +428,11 @@
> >                                 interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -413,6 +444,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart1_default>;
> >                                 interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -426,6 +462,14 @@
> >                                 interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>,
> > +                                               <&aggre1_noc MASTER_QUP_0
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -437,6 +481,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart2_default>;
> >                                 interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -450,6 +499,14 @@
> >                                 interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>,
> > +                                               <&aggre1_noc MASTER_QUP_0
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -463,6 +520,11 @@
> >                                 interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -474,6 +536,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart3_default>;
> >                                 interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -487,6 +554,14 @@
> >                                 interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>,
> > +                                               <&aggre1_noc MASTER_QUP_0
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -498,6 +573,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart4_default>;
> >                                 interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -511,6 +591,14 @@
> >                                 interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>,
> > +                                               <&aggre1_noc MASTER_QUP_0
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -524,6 +612,11 @@
> >                                 interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -535,6 +628,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart5_default>;
> >                                 interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_0
> > +                                               &qup_virt SLAVE_QUP_CORE_0>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_0>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >                 };
> > @@ -561,6 +659,14 @@
> >                                 interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>,
> > +                                               <&aggre2_noc MASTER_QUP_1
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -574,6 +680,11 @@
> >                                 interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -585,6 +696,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart6_default>;
> >                                 interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -598,6 +714,14 @@
> >                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>,
> > +                                               <&aggre2_noc MASTER_QUP_1
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -609,6 +733,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart7_default>;
> >                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -622,6 +751,14 @@
> >                                 interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>,
> > +                                               <&aggre2_noc MASTER_QUP_1
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -635,6 +772,11 @@
> >                                 interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -646,6 +788,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart8_default>;
> >                                 interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -659,6 +806,14 @@
> >                                 interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>,
> > +                                               <&aggre2_noc MASTER_QUP_1
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -670,6 +825,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart9_default>;
> >                                 interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -683,6 +843,14 @@
> >                                 interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>,
> > +                                               <&aggre2_noc MASTER_QUP_1
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -696,6 +864,11 @@
> >                                 interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -707,6 +880,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart10_default>;
> >                                 interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -720,6 +898,14 @@
> >                                 interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>,
> > +                                               <&aggre2_noc MASTER_QUP_1
> > +                                               &mc_virt SLAVE_EBI1>;
> > +                               interconnect-names = "qup-core", "qup-config",
> > +                                                       "qup-memory";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -733,6 +919,11 @@
> >                                 interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >
> > @@ -744,6 +935,11 @@
> >                                 pinctrl-names = "default";
> >                                 pinctrl-0 = <&qup_uart11_default>;
> >                                 interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> > +                               interconnects = <&qup_virt MASTER_QUP_CORE_1
> > +                                               &qup_virt SLAVE_QUP_CORE_1>,
> > +                                               <&gem_noc MASTER_APPSS_PROC
> > +                                               &config_noc SLAVE_QUP_1>;
> > +                               interconnect-names = "qup-core", "qup-config";
> >                                 status = "disabled";
> >                         };
> >                 };
> > @@ -1051,6 +1247,9 @@
> >                         clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> >                                  <&gcc GCC_QSPI_CORE_CLK>;
> >                         clock-names = "iface", "core";
> > +                       interconnects = <&gem_noc MASTER_APPSS_PROC
> > +                                       &config_noc SLAVE_QSPI_0>;
> > +                       interconnect-names = "qspi-config";
> >                         status = "disabled";
> >                 };
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
