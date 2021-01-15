Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1692F806D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 17:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbhAOQQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 11:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOQQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jan 2021 11:16:23 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDFCC06179C
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jan 2021 08:15:36 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id n42so8977009ota.12
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jan 2021 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iPVfTfHT6gBAu795m3aMHoadgoj03D2XwLab0IXl/KI=;
        b=fRz2PsY+IiJRIlRpWYA01nOlQDMkIc3+bzy+f+B3aETjnc4lrmL82O34lrRJeAYqKL
         PM7VboLHDgF94iykA1AUpoK8oygf7ee74W4KXWCxaR6dkDpeq7obO32vFpV90rZn31T3
         lVAM1dMP/1x17O+tHeAZJNy8RWm/xgt6OOr1WIRwZ5WTpyjGYCLWMhIvMB/C0FFH3YXf
         czLJtem84F+aidVI8flVnY5X/HxvkhkCIWaxkMO7/76f8Hlf2bnIaonltDEGT9Ah5SNz
         BZhAxg1Kkf8ItwwFKeM+15072ayLQeSrlP4gGq8AtfbQFvMK3pArIrJdl/Wk+m62zDWP
         UlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPVfTfHT6gBAu795m3aMHoadgoj03D2XwLab0IXl/KI=;
        b=L+NT7I802gyr9uxmzlfJYlPytfPPfxr94jx/FGrN+6DCR3OTp15IpSvYkZEAZ2AdEU
         XQpWPhj6gAkky3Bwb9P5ceUYZHmzqtS5vdrWTvXAm0O2WElzSu9cTrGjBj7PReIjHlN5
         n6W3bmXKUhf46sRh249dSPHUakfNpX8hFezYynoBgKb229S/lFGmbyzHK47xOuGdZy8Y
         TcoQ6XepwjemdvQkGluGAcNu2NqpfConSqUbCEkWZlcxysBZYi3TFpcU19fHmOWGiSW6
         me7fLLT6QHcWuzQSoOkdgH1w4t9GpyujH1XSlnnhut9wiEYaebbYeGgowsyiA4+Dw3FU
         mHnw==
X-Gm-Message-State: AOAM5304WQxHSnD2LBXoeTAmBN45ZbUJWHfrjoHwobRRfP1hrOw492LR
        NaMdCvvG7rvG9FVmahWVHCTwaQ==
X-Google-Smtp-Source: ABdhPJwhQwng3lLCyVUn+0lS0lljn8lNlR018JLdd32oPBp51d9spPV8DW2uWmJVivUOa7dZtWxpxg==
X-Received: by 2002:a05:6830:44a:: with SMTP id d10mr8631694otc.254.1610727336025;
        Fri, 15 Jan 2021 08:15:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m3sm1924324ots.72.2021.01.15.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:15:35 -0800 (PST)
Date:   Fri, 15 Jan 2021 10:15:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org, wsa@kernel.org,
        swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, rnayak@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce
 'assigned-performance-states' property
Message-ID: <YAG/pNXQOS+C2zLr@builder.lan>
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224111210.1214-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu 24 Dec 05:12 CST 2020, Roja Rani Yarubandi wrote:

> While most devices within power-domains which support performance states,
> scale the performance state dynamically, some devices might want to
> set a static/default performance state while the device is active.
> These devices typically would also run off a fixed clock and not support
> dynamically scaling the device's performance, also known as DVFS
> techniques.
> 
> Add a property 'assigned-performance-states' which client devices can
> use to set this default performance state on their power-domains.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> index aed51e9dcb11..a42977a82d06 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -66,6 +66,18 @@ properties:
>        by the given provider should be subdomains of the domain specified
>        by this binding.
>  
> +  assigned-performance-states:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +       Some devices might need to configure their power domains in a default
> +       performance state while the device is active. These devices typcially
> +       would also run off a fixed clock and not support dynamically scaling
> +       the device's performance, also known as DVFS techniques. Each cell in
> +       performance state value corresponds to one power domain specified as
> +       part of the power-domains property. Performance state value can be an
> +       opp-level inside an OPP table of the power-domain and need not match
> +       with any OPP table performance state.
> +
>  required:
>    - "#power-domain-cells"
>  
> @@ -131,3 +143,40 @@ examples:
>              min-residency-us = <7000>;
>          };
>      };
> +
> +  - |
> +    parent4: power-controller@12340000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x12340000 0x1000>;
> +        #power-domain-cells = <0>;
> +    };
> +
> +    parent5: power-controller@43210000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x43210000 0x1000>;
> +        #power-domain-cells = <0>;
> +        operating-points-v2 = <&power_opp_table>;
> +
> +        power_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            power_opp_low: opp1 {
> +                opp-level = <16>;
> +            };
> +
> +            rpmpd_opp_ret: opp2 {
> +                opp-level = <64>;
> +            };
> +
> +            rpmpd_opp_svs: opp3 {
> +                opp-level = <256>;
> +            };
> +        };
> +    };
> +
> +    child4: consumer@12341000 {
> +        compatible = "foo,consumer";
> +        reg = <0x12341000 0x1000>;
> +        power-domains = <&parent4>, <&parent5>;
> +        assigned-performance-states = <0>, <256>;

May I ask how this is different from saying something like:

	required-opps = <&??>, <&rpmpd_opp_svs>:

Regards,
Bjorn

> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
