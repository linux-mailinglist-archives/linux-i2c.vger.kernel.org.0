Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0874AA3D7
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 23:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238653AbiBDW7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 17:59:42 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:33601 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245302AbiBDW7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 17:59:41 -0500
Received: by mail-oo1-f49.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso6333305oop.0;
        Fri, 04 Feb 2022 14:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WDFMU2L+6QlWwTRW5yJ/fDBuGhNU4esi6K8Pw9YQ+vw=;
        b=oGekuGaHFmpeP2Gn2EUCC6bRQuGyLeYkkxDkBXyYbKcalzD8AixpjIX6h9aJRz+80b
         LgbFj97Nvju+OcoxeWWNyCAfmN2YE+iwDdcHYIDtyJBkwrm2mwECUwxNAQ/R0Zke9a0S
         r4BWzgD1hBuWSabqfAKX2T1H4ZTaiyQ/t3AVhcjz0DAcXsYSrBmZdUIeRu/ZPoNW90TO
         QWdHOzk/vUVC3V34vCfnj/twchjYnkjAKqoe74UANd+vIqWyfaQ/u/BSHFaxbFj9qcFz
         cTpk1tyH4O3HOn+hTEiaCG07AbWDh8nXCTO8fsTza03wYcnNm5FgqghNlhGnFup4uqrO
         Z3lA==
X-Gm-Message-State: AOAM533V5f+K7Y1MIoJQmcKEZw0DUwiSZIuvqZdhbf5kATKnpg4+g+lC
        iMpSvtmEaITx74Ghcab/9Q==
X-Google-Smtp-Source: ABdhPJx8zmBhcwwEF7d2V6aqPrQn10Ybg3HAQ2BZ9RbPyyIiDx3P9br6uyE08KYDbuph3Px5uIQ14A==
X-Received: by 2002:a4a:3f46:: with SMTP id x6mr388438ooe.78.1644015580690;
        Fri, 04 Feb 2022 14:59:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g4sm1248498otg.61.2022.02.04.14.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:59:40 -0800 (PST)
Received: (nullmailer pid 3342189 invoked by uid 1000);
        Fri, 04 Feb 2022 22:59:39 -0000
Date:   Fri, 4 Feb 2022 16:59:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Li-hao Kuo <lhjeff911@gmail.com>
Cc:     wells.lu@sunplus.com, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, daniel.thompson@linaro.org,
        linux-kernel@vger.kernel.org, lh.kuo@sunplus.com,
        lee.jones@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings:i2c: Add Sunplus SP7021 schema
Message-ID: <Yf2v25mgg6Afe9oH@robh.at.kernel.org>
References: <cover.1642751147.git.lhjeff911@gmail.com>
 <3361159c0a654eb237638969e64ccde742d2c7c0.1642751147.git.lhjeff911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3361159c0a654eb237638969e64ccde742d2c7c0.1642751147.git.lhjeff911@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Jan 2022 15:50:56 +0800, Li-hao Kuo wrote:
> Add bindings for Sunplus SP7021 i2c driver
> 
> Signed-off-by: Li-hao Kuo <lhjeff911@gmail.com>
> ---
> Changes in v4:
>  - Modified the YAML file : fix indentation issue
> 
>  .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 73 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
