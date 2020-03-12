Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB03183567
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 16:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbgCLPur (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 11:50:47 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40496 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbgCLPuq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 11:50:46 -0400
Received: by mail-ot1-f65.google.com with SMTP id h17so6753492otn.7;
        Thu, 12 Mar 2020 08:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VmSnjUg0wpW0rLa5TeV8iHT4CfQoAhuM8tvfmUdklCI=;
        b=dk/dw4TzGWxjDvOBxagGNuaP763REENZC9LsEIVgPOdedkuZX4tK2foU1JN2Tzlbcw
         Tq+2lNdbl7R0cdlVFQI9C+q9v6BgkzzLP8E0FB7KO00fZ3csfLdBGLiFaY7u3h6OhDa1
         sxbOnEtR5rLqWKGdnZdrZewetSJk/EP79J6QGun6/ZBRTO0ZSmV8PIpQrTNOaLvkXAuX
         cr/H2Dv2Yo9WJN7yHdcddGSa90f6IfyHMPmsTRs/ZAeaMxv9J6wUkQXZhRTOZoKbSU4W
         woBaKcPzfO7o8BHwIkl++ehtfy/ICGfcihyIZToLwAFFB8H4XGC5dYh9Od0KW+rusFOs
         Z8xA==
X-Gm-Message-State: ANhLgQ18yj8UJGYRY20TkIK9Zj4OAAw4U8c40ltQzqP1Ui88A6pIcYp5
        kzv0nBpSa4RnTuJ01qFnyA==
X-Google-Smtp-Source: ADFU+vtZdELV7BCrf8YMUOe0vH5ZKPB7JioeAIO2CIRABTehRRGFIR2nr2WBf9t9ELKW/BQbZJCPgw==
X-Received: by 2002:a9d:404b:: with SMTP id o11mr6582435oti.368.1584028245722;
        Thu, 12 Mar 2020 08:50:45 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 81sm7075701otu.51.2020.03.12.08.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:50:45 -0700 (PDT)
Received: (nullmailer pid 25348 invoked by uid 1000);
        Thu, 12 Mar 2020 15:50:44 -0000
Date:   Thu, 12 Mar 2020 10:50:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: i2c: convert rockchip i2c bindings
 to yaml
Message-ID: <20200312155044.GA25292@bogus>
References: <20200305143611.10733-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305143611.10733-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  5 Mar 2020 15:36:07 +0100, Johan Jonker wrote:
> Current dts files with 'i2c' nodes are manually verified.
> In order to automate this process i2c-rk3x.txt
> has to be converted to yaml. In the new setup
> i2c-rk3x.yaml will inherit properties from
> i2c-controller.yaml.
> 
> Also change document name in MAINTAINERS.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.txt |  68 -----------
>  .../devicetree/bindings/i2c/i2c-rk3x.yaml          | 129 +++++++++++++++++++++
>  MAINTAINERS                                        |   2 +-
>  3 files changed, 130 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
