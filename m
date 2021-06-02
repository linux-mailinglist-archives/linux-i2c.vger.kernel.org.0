Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C1639932E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 21:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhFBTIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 15:08:02 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37618 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhFBTH4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 15:07:56 -0400
Received: by mail-oi1-f178.google.com with SMTP id h9so3706056oih.4;
        Wed, 02 Jun 2021 12:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NvH5YtSqCqcW4oiU66DUShfepYhayf/HTsXXwX+47T8=;
        b=RgCi/ndRzTLHDzdu5MJc1qgf8KzxKlL5i8st/FwmDfpBw49PZ2MdLnVLDyh9+7u1iw
         nPXcISE4ylbciJWY8+ByWmY7lNcL8UsgeKMcL0rbZ00jxI/YSXQ725vho1+I5t5nGXjS
         aYu0yPNG59TPserNcQMO4eQbXA9FqEFi9cnuN7w6PTLzvhoc0CRYuHkwcs2uZZYb9S7v
         ohBwdNiRwnOs5IkIQ9lHrpKO/foNHGHpsTbfXwxn10LjflMZ1+6TSr5r9/VMyCcvaaT/
         F2VOPL4QrsGJFtAhdAY6uHt9g4NOkQpbqbknLOXq8DyNUFXxWHj+wVP75IHXKmNYtZre
         8Qrw==
X-Gm-Message-State: AOAM5301+iYGbxN1Mx2kQsqNL0w6P7DtQ+eqHvspRaiPeMbINrkVVNy0
        USYKyBxc0mSeVoCvfEs0qbHitOlnew==
X-Google-Smtp-Source: ABdhPJwFEhxXlxwklU/haoTKdWmDMAbQpKHhIQwZCu8sTq1fzjNp33QS1/8m8NWeptaphkUBpXZx0Q==
X-Received: by 2002:aca:3704:: with SMTP id e4mr4883623oia.154.1622660773077;
        Wed, 02 Jun 2021 12:06:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v19sm165128otk.22.2021.06.02.12.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:06:12 -0700 (PDT)
Received: (nullmailer pid 3792765 invoked by uid 1000);
        Wed, 02 Jun 2021 19:06:11 -0000
Date:   Wed, 2 Jun 2021 14:06:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Wolfram Sang <wsa@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <20210602190611.GA3792700@robh.at.kernel.org>
References: <20210526100412.484-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526100412.484-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 26 May 2021 15:34:12 +0530, Vignesh Raghavendra wrote:
> Convert i2c-omap.txt to YAML schema for better checks and documentation.
> 
> Following properties were used in DT but were not documented in txt
> bindings and has been included in YAML schema:
> 1. Include ti,am4372-i2c compatible
> 2. Document clocks property
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> 
> Note that am335x-myirtech*.dtsi needs fixing to drop scl/sda-gpios
> which are not supported by i2c-omap driver.
> omap2/3 dmas property is being dropped by:
> https://lore.kernel.org/20210526094424.27234-1-vigneshr@ti.com
> 
> v3:
> Add conditions around ti,hwmods usage
> drop dmas property as it was never used/supported
> set additionalProperties: False
> Address Rob H comments
> 
> v2:
> Fix issues with make dt_bindings_check
> Add description on usage of ti,hwmods
> 
> v2: https://lore.kernel.org/r/20210506140026.31254-1-vigneshr@ti.com
> v1: https://lore.kernel.org/r/20210505065511.918-1-vigneshr@ti.com
> 
>  .../devicetree/bindings/i2c/i2c-omap.txt      |  37 -------
>  .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 102 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 103 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
