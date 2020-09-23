Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A6027620A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 22:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgIWUZm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 16:25:42 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33172 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgIWUZm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 16:25:42 -0400
Received: by mail-il1-f193.google.com with SMTP id y2so935471ila.0;
        Wed, 23 Sep 2020 13:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cghI8bcR3CoL6BsfmtrR4Gt10mk4rqZZ+Xy0oFW3Ifo=;
        b=jFh1CYsU3+xMTyaN8J2hA8H/O+SAif+aIAP6ybHVsx3DlaFctXncF1WWpNdYPvdkgF
         WN6ymMJYzFj0y8PQL+c49wMZqIiIJCuFrqiSsH8F9H9kl3XHq88PifdxFbd6F95QMNDB
         6DPcZu3I6f34b9VmLf/c1oC3PQa3uZ2uZHD3pqmJ5v/w0lHxEdxMbIT12Au4rq422ixu
         Wp8gYEL/bW13dGkv2fX5v4zuZgyLkZZmmk3TnN1GyGreL+ixiTgVfR6gjnkrizNCxEwu
         AQvGyvMAA+l3syL5DRhJjBhkIpEIbEhoE3nmclMT1n4LEp1y7CJOFulcl/8PePOvw0zv
         A7Yg==
X-Gm-Message-State: AOAM530B3XovdzDSFseVQkdEQhoXBvlJv7rp/KTwKYwxYK7AWw0Rfvx6
        aes82HujCPY+uJlWAznI8A==
X-Google-Smtp-Source: ABdhPJxQPXXO1WVtwK2Pv4a0dJVR8kqccvwax4j1pJvPBFD/+/V/NAKkAaBDUvhp12M2OvEzbwR6/g==
X-Received: by 2002:a92:8b0e:: with SMTP id i14mr1331029ild.28.1600892741248;
        Wed, 23 Sep 2020 13:25:41 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m18sm358325ili.85.2020.09.23.13.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:25:40 -0700 (PDT)
Received: (nullmailer pid 1243946 invoked by uid 1000);
        Wed, 23 Sep 2020 20:25:39 -0000
Date:   Wed, 23 Sep 2020 14:25:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wolfram Sang <wolfram@the-dreams.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 4/4] dt-bindings: i2c: imx: Fix i.MX 7 compatible
 matching
Message-ID: <20200923202539.GA1243892@bogus>
References: <20200917191321.28741-1-krzk@kernel.org>
 <20200917191321.28741-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-4-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 17 Sep 2020 21:13:21 +0200, Krzysztof Kozlowski wrote:
> The i.MX 7 DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml: i2c@30a20000:
>     compatible: ['fsl,imx7d-i2c', 'fsl,imx21-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
> 
>   arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml: i2c@30a20000:
>     compatible: ['fsl,imx7d-i2c', 'fsl,imx21-i2c'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
