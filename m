Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F6F188DA8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 20:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgCQTHN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 15:07:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36574 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgCQTHN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 15:07:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id g12so24248685ljj.3
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YEEc09trOmH4D9SUDPMbQiadK7H2Qw9VvDkuRLFStZo=;
        b=RmFy6BxUBkaGc+I1s1MbSATu7fVGC1ZDQWtncIWzCCz4160Yptu+BTMXEBd43s7u2y
         FfV8PoCRMC8uuFC8P+RJRqxTnZeDjQyjwhwyodSTiDLsDFaKrrRaYtTB7WFKhmLDmxeq
         s2DEy9aVLpUQogfr+sbRzzhmkkAtNzcoaIR68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YEEc09trOmH4D9SUDPMbQiadK7H2Qw9VvDkuRLFStZo=;
        b=GzAQeL6GJA4vZB0ARHY8GaHSemu1SohyMI1JAsJY9HP+s9p/oHoU2WgIUC5TpJcXy9
         zTx/DGUxbldjsZEfsErWWBKLzRCJFCDxupo8U64mGCl1khkrMlTXX6t8Rh/NdvOibbO4
         XlaH+6hKLAWI7739C0Vx6lfCa9Z/NYLitifu9oLcyR4YCwsrYfEQ1uV7Ywfg8LxdoOr/
         u63R1S8nxC+0ROD34H81MTkmQgcevCi8RKFki6rLtvysgoLMYX/5urc8WfjbDThhiAFp
         50fp2u/vlCSAKY2XyzqiBfLK5Edlsl+qGoRCndm0RkoX4fw7Ok4QkUNA6SsbQxHuc3VJ
         p3EQ==
X-Gm-Message-State: ANhLgQ3hxC3ChTIFOqValnjDyGHAwZmtHvqi59vW33nxq3eiX6ySVm0x
        2c5D0g1fyL54uP5eoM/AyHuIvyc66Sg=
X-Google-Smtp-Source: ADFU+vvyvh3Sh5ljd5joAYAM7tzmVYRO1/maJDMuJegOJ7DGpqhYV0GCvEcpJIG0G/zcLF+Z0PAf/Q==
X-Received: by 2002:a2e:7018:: with SMTP id l24mr151564ljc.128.1584472030088;
        Tue, 17 Mar 2020 12:07:10 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id f4sm3042844ljo.79.2020.03.17.12.07.08
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:07:09 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id j17so18153114lfe.7
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:07:08 -0700 (PDT)
X-Received: by 2002:a19:8788:: with SMTP id j130mr521058lfd.130.1584472028241;
 Tue, 17 Mar 2020 12:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org> <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 17 Mar 2020 12:06:31 -0700
X-Gmail-Original-Message-ID: <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com>
Message-ID: <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com>
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 13, 2020 at 6:12 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Add necessary macros and structure variables to support ICC BW
> voting from individual SE drivers.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment dropped enums for ICC paths, given the three
>    paths individual members
>
>  include/linux/qcom-geni-se.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..eaae16e 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -6,6 +6,8 @@
>  #ifndef _LINUX_QCOM_GENI_SE
>  #define _LINUX_QCOM_GENI_SE
>
> +#include <linux/interconnect.h>
> +
>  /* Transfer mode supported by GENI Serial Engines */
>  enum geni_se_xfer_mode {
>         GENI_SE_INVALID,
> @@ -33,6 +35,15 @@ struct clk;
>   * @clk:               Handle to the core serial engine clock
>   * @num_clk_levels:    Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:      Table of clock frequency input to serial engine clock
> + * @icc_path_geni_to_core:     ICC path handle for geni to core
> + * @icc_path_cpu_to_geni:      ICC path handle for cpu to geni
> + * @icc_path_geni_to_ddr:      ICC path handle for geni to ddr
> + * @avg_bw_core:       Average bus bandwidth value for QUP core 2x clock
> + * @peak_bw_core:      Peak bus bandwidth value for QUP core 2x clock
> + * @avg_bw_cpu:                Average bus bandwidth value for CPU
> + * @peak_bw_cpu:       Peak bus bandwidth value for CPU
> + * @avg_bw_ddr:                Average bus bandwidth value for DDR
> + * @peak_bw_ddr:       Peak bus bandwidth value for DDR
>   */
>  struct geni_se {
>         void __iomem *base;
> @@ -41,6 +52,15 @@ struct geni_se {
>         struct clk *clk;
>         unsigned int num_clk_levels;
>         unsigned long *clk_perf_tbl;
> +       struct icc_path *icc_path_geni_to_core;
> +       struct icc_path *icc_path_cpu_to_geni;
> +       struct icc_path *icc_path_geni_to_ddr;
> +       unsigned int avg_bw_core;
> +       unsigned int peak_bw_core;
> +       unsigned int avg_bw_cpu;
> +       unsigned int peak_bw_cpu;
> +       unsigned int avg_bw_ddr;
> +       unsigned int peak_bw_ddr;
>  };
>
>  /* Common SE registers */
> @@ -229,6 +249,14 @@ struct geni_se {
>  #define GENI_SE_VERSION_MINOR(ver) ((ver & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT)
>  #define GENI_SE_VERSION_STEP(ver) (ver & HW_VER_STEP_MASK)
>
> +/* Core 2X clock frequency to BCM threshold mapping */
> +#define CORE_2X_19_2_MHZ               960
> +#define CORE_2X_50_MHZ                 2500
> +#define CORE_2X_100_MHZ                        5000
> +#define CORE_2X_150_MHZ                        7500
> +#define CORE_2X_200_MHZ                        10000
> +#define CORE_2X_236_MHZ                        16383

These are all just 50 * clock_rate. Can you instead specify that one
define of CLK_TO_BW_RATIO 50, and then use clk_get_rate() to get the
input clock frequency. That way, if these end up getting clocked at a
different rate, the bandwidth also scales appropriately. Also, can you
enumerate why 50 is an appropriate ratio?
-Evan

-Evan
