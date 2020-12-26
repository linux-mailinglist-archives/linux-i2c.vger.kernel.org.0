Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF42F2E2CB4
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Dec 2020 01:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbgLZAR0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Dec 2020 19:17:26 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:44146 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgLZARZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Dec 2020 19:17:25 -0500
Received: by mail-ot1-f46.google.com with SMTP id r9so4646780otk.11;
        Fri, 25 Dec 2020 16:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EOlAg2v9iu08C98UhOwCODLFZ1ENz3Eke06f2dm8E8Q=;
        b=SPdhs4bOso/wgZ4rIyP3pKl72Xrn4eNemSZzr1idxP5OwPd2oJL1W87uB5P0EWhFdn
         cy8q1+nyVwSaT1pBd0qifVh8JgFpPbRlGNa+prBUfTdvE5TdyxqjlIij+JISNPYMQtE1
         knSQaJpsPflYJyC6GIW5b/W0xh3le9KssRgd+Im7ytcg8ICl2kr33M5K2V/vRJL2KuIo
         JWsoagdjirhhhqoveYboF+H56/Rxb2IkSkr7GVtpe5oOJ6MnHRHAYC5D7iFOy3tOOA9Q
         Vebx78sQj5HTxbjsvnXKgwlsjqnBym7CHDQ9sJ/AKi+QXtQy54W/B5MW7QO/zpKneFy9
         XMpw==
X-Gm-Message-State: AOAM531uk1GEfpoLtMCb8N/bxkX6+SjASyBNyGtLE9O84FTbz37tX6ZS
        ZraZlBeABOuX7xnQurwWjA==
X-Google-Smtp-Source: ABdhPJwgTn5dMd8lKkA/dE21p/GLjF838PevUwAH24B1igEvQbHfjhM7yzFhe79pSbNQ31FASnTunA==
X-Received: by 2002:a9d:aca:: with SMTP id 68mr26852801otq.272.1608941804882;
        Fri, 25 Dec 2020 16:16:44 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 39sm7692517otu.6.2020.12.25.16.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 16:16:44 -0800 (PST)
Received: (nullmailer pid 1641174 invoked by uid 1000);
        Sat, 26 Dec 2020 00:16:42 -0000
Date:   Fri, 25 Dec 2020 17:16:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     akashast@codeaurora.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, wsa@kernel.org, ulf.hansson@linaro.org,
        parashar@codeaurora.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        agross@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        mka@chromium.org, rnayak@codeaurora.org, swboyd@chromium.org,
        devicetree@vger.kernel.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce
 'assigned-performance-states' property
Message-ID: <20201226001641.GA1641022@robh.at.kernel.org>
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224111210.1214-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 24 Dec 2020 16:42:08 +0530, Roja Rani Yarubandi wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/power-domain.yaml:72:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1420485

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
