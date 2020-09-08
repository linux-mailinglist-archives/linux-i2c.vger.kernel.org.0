Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC60326213D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgIHUhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:37:35 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36995 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgIHUhc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 16:37:32 -0400
Received: by mail-il1-f195.google.com with SMTP id b17so224638ilh.4;
        Tue, 08 Sep 2020 13:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GEO2mEwTa2BqylVAGWSbETeCOTUBRxw5/MLADpDOoGg=;
        b=fPm4ADyolRFARewi3hqmvtt2NE7KXNuc95uiM/7KKA9D1TsuhD8CszmeepA1hbMe1h
         tSYj4KAOBTUMCv3OiBnLBRul3HxsihiYNGkk09GTqV8ygtpmKaqyGVyKarY/5p8p0fzL
         GjkJuDOO3/vg4S4o+524UvZ46bsUvld26EVTG8LLaHkGoZ0NC/FsmyjIUMOBo8IJR295
         D1oydl04LZixSIcfuvzPBYrtsRRQGVCfIbQHew9G2uAY1Qu3yh/OtEq2uPTQDkm0ZDPJ
         nIttxjrJv6XhPtYTyUKDqt98EZcRkC44nld3jVMlgbcQ/W57Thpb93MAmjf1m0dyXtXi
         29YQ==
X-Gm-Message-State: AOAM532usdfH3H2E70YQHwU5/HkN6rPdum0Wt0Gz9KQIZPi9y7oX0hhB
        +W6I8IIQkFpBQZB11FdCJ4/zbxBUECDu
X-Google-Smtp-Source: ABdhPJw+t2qU979+AdZ8QjmxDAMMoLlZmNZjcpVp7EYdD0LSdmcKy9B0J62qeIINYSFwU668Ssd4nw==
X-Received: by 2002:a92:6a0c:: with SMTP id f12mr501711ilc.213.1599597451673;
        Tue, 08 Sep 2020 13:37:31 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m15sm215036iow.9.2020.09.08.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:37:31 -0700 (PDT)
Received: (nullmailer pid 875163 invoked by uid 1000);
        Tue, 08 Sep 2020 20:37:29 -0000
Date:   Tue, 8 Sep 2020 14:37:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH 1/5] dt-bindings: input: Add documentation for IBM
 Operation Panel
Message-ID: <20200908203729.GA872283@bogus>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820161152.22751-2-eajames@linux.ibm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 20, 2020 at 11:11:48AM -0500, Eddie James wrote:
> Document the bindings for the IBM Operation Panel, which provides
> a simple interface to control a server. It has a display and three
> buttons.
> Also update MAINTAINERS for the new file.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../bindings/input/ibm,op-panel.yaml          | 38 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/ibm,op-panel.yaml b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> new file mode 100644
> index 000000000000..86a32e8f3ef0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/ibm,op-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM Operation Panel
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description: |
> +  The IBM Operation Panel provides a simple interface to control the connected
> +  server. It has a display and three buttons: two directional arrows and one
> +  'Enter' button.
> +
> +properties:
> +  compatible:
> +    const: ibm,op-panel
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

additionalProperties: false

With that added,

Reviewed-by: Rob Herring <robh@kernel.org>
