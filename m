Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE843CA4A7
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 19:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhGORqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 13:46:40 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:43544 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGORqj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 13:46:39 -0400
Received: by mail-il1-f170.google.com with SMTP id w1so5717456ilg.10;
        Thu, 15 Jul 2021 10:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eJvBNVIbt4HGtOUd1eE/GFLNbukv56MIw2CIkqxy0xM=;
        b=moKe+B8jqMI25Wq+Qb2g98jdgm3YH1s0FGb+HBemsUouyYl01ePZf3SP0Pq7Xn2blE
         17RyaWvH+f4VstCwvNqRtPl7hfkJ4sD55pu1mUxYM08ZljKKzyVc77iRJWxouiyPyjNO
         f7uXSVjfx5eBirSlBBqPAe14gwfLCKeXuO5277lz8y/wX7YSZSqgVJA9IqpS9ZBdv9G9
         R3iVmIvGU+Z7m8RlHOx5dBoDaspXKCD5BrM6FYj5CXTNlZ85a+wZZO3lKZj3865OmlU8
         g+975RMxBxKyF5orF3fumJWPwcsWWqrux0r6JUqf3lFnjH3il/VagD4atrdS0BHCAZID
         6T3g==
X-Gm-Message-State: AOAM532ZaSthoCp4OXjd82/kEuS4R168np8zBbxhJQoBHWgHqql9tQ18
        SyB+PQx5pSFg/dFfYJBsGQ==
X-Google-Smtp-Source: ABdhPJyUCaDwlujyrWqGxamEcOBQBh/mEVhjQMODh+aCT6OUUAmS+sAvZKgCichuIqty/y4GGWAqLg==
X-Received: by 2002:a05:6e02:1b8f:: with SMTP id h15mr3426922ili.151.1626371025179;
        Thu, 15 Jul 2021 10:43:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w1sm3056450ilv.59.2021.07.15.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:43:42 -0700 (PDT)
Received: (nullmailer pid 1309176 invoked by uid 1000);
        Thu, 15 Jul 2021 17:43:39 -0000
Date:   Thu, 15 Jul 2021 11:43:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Corey Minyard <minyard@acm.org>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-arm-kernel@lists.infradead.org,
        Open Source Submission <patches@amperecomputing.com>,
        linux-kernel@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Phong Vo <phong@os.amperecomputing.com>,
        Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v5 3/3] bindings: ipmi: Add binding for SSIF BMC driver
Message-ID: <20210715174339.GA1309142@robh.at.kernel.org>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210714033833.11640-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714033833.11640-4-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 14 Jul 2021 10:38:33 +0700, Quan Nguyen wrote:
> Add device tree binding document for the SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v5:
>   + None
> 
> v4:
>   + Fix warning with dt_binding_check [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]
> 
> v3:
>   + Switched to use DT schema format [Rob]
> 
> v2:
>   + None
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
