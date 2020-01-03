Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318A312FEC3
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 23:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgACW3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 17:29:23 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35766 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgACW3W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 17:29:22 -0500
Received: by mail-io1-f65.google.com with SMTP id v18so42947303iol.2
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2020 14:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=gGxgEmek66XClr+I4ZOssMbObOa7QPZhKH2BM6JU+5M=;
        b=oLN4ddL5xVBqjrS6QmYNbGLnkqg6HhvrK4sd8piknUblQp2PBvBuTlcfEwzRPCQV/r
         cwWKfHQVhbNGKuT5/3ENGv2rbPDkz65LEUIrh7NLn5t2Iv0+6w+03u1YBOSa/iDBgBPd
         sem6ZundnMF1SJBLgAzlES2Tb1E6lhDP/4gji+YviS3ZAh/t/4maXM9pw0gKJy2WWy/X
         ekRuDKrwaJsWjNQP2COxX5HPMHXyLC45VI0XfOMTB/VVsZhJ23kdkW2m40Y6QMne3MUD
         LXQP+kljC1DdgyOyN8G+y2VPqCwqHLYO2ucOBxPI/7nVbRFE+ZyDrMD8tHvEmXTf5+om
         B4mw==
X-Gm-Message-State: APjAAAVehRUeVZ7OqanfXP8+NsI/VArwbvDjlCHt+pYoX8YQhSxtf4j8
        J/OTpS+hBmyJ2rR6Y/bu7r4D3BY=
X-Google-Smtp-Source: APXvYqwecytCPfdLVduNEnyHNiPKCE6YhJThKkmKLUeYBM8tqSgM1EhxbS2BmjC1psZK0dRHhq3b5w==
X-Received: by 2002:a5e:8f41:: with SMTP id x1mr63528289iop.113.1578090561902;
        Fri, 03 Jan 2020 14:29:21 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g62sm21376133ile.39.2020.01.03.14.29.20
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:29:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:29:19 -0700
Date:   Fri, 3 Jan 2020 15:29:19 -0700
From:   Rob Herring <robh@kernel.org>
To:     Codrin.Ciubotariu@microchip.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, robh@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: at91: document optional bus
 recovery  properties
Message-ID: <20200103222919.GA32421@bogus>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103094821.13185-2-codrin.ciubotariu@microchip.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 3 Jan 2020 09:49:06 +0000, <Codrin.Ciubotariu@microchip.com> wrote:
> 
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> The at91 I2C controller can support bus recovery by re-assigning SCL
> and SDA to gpios. Add the optional pinctrl and gpio properties to do
> so.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> 
> Changes in v2:
>  - none
> 
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
