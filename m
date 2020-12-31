Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA88A2E8117
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Dec 2020 16:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgLaPuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Dec 2020 10:50:13 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46038 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLaPuN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Dec 2020 10:50:13 -0500
Received: by mail-ot1-f43.google.com with SMTP id n42so18255579ota.12;
        Thu, 31 Dec 2020 07:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vrJ54GWrf1gjKYUTCdpFWMnnDxjUx7yI9iWKN6uWpbY=;
        b=WvF9QIlLVRSpAnCEu6QgBoKAuHTPcKyGd+e1ZMmHt+wS6sR2QjayqQmYpr3d+n3QwJ
         /wA2iEuy3vY57OiFvyoKK1K+qH+DngvjTZT1K4ttLJfFSCrcarlLE07PFHrBieGUWMY2
         L5nWjkl8lX2ofRRMqj1CZe0+QClCe8z+BqDH+u9tPUk8kujoj/FVHSzQF3Rf04FeKOD0
         1wqwNML5n4vDcFz8+ZPPhQWtavMi2bW4wQYLAsMp4J8bqicQxuG2Ack9RszxwFu26ITP
         U/I38YCgPP9jK6nT1gdqInwsDobnlxX8lT4L3jWarsicvBmc7m0QUDsM/OZJ7zfCqV2L
         V5Iw==
X-Gm-Message-State: AOAM531ojOihhFtsqX391ljRONdvNRoyx5ogm9TZbmj7fAovbRrUUqfL
        x8cqoSzX5RAP38KKCla+QQ==
X-Google-Smtp-Source: ABdhPJzPV0VHmm9Ury2BxUsTfggiEYoY5ylxj7HrLmkDpdCswUZWCJ4x1QPsJBsLYVaXS9tqBSnGCQ==
X-Received: by 2002:a05:6830:1650:: with SMTP id h16mr42298972otr.266.1609429772107;
        Thu, 31 Dec 2020 07:49:32 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s17sm11209427otg.16.2020.12.31.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 07:49:31 -0800 (PST)
Received: (nullmailer pid 1851540 invoked by uid 1000);
        Thu, 31 Dec 2020 15:49:29 -0000
Date:   Thu, 31 Dec 2020 08:49:29 -0700
From:   Rob Herring <robh@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     ulf.hansson@linaro.org, bjorn.andersson@linaro.org, wsa@kernel.org,
        swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, rnayak@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce
 'assigned-performance-states' property
Message-ID: <20201231154929.GA1846089@robh.at.kernel.org>
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224111210.1214-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 24, 2020 at 04:42:08PM +0530, Roja Rani Yarubandi wrote:
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

Couldn't this just be an additional cell in 'power-domains'?

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
> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
