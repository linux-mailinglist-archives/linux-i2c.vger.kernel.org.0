Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3714380B1
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Oct 2021 01:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhJVXj7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 19:39:59 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41700 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhJVXj6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 19:39:58 -0400
Received: by mail-oi1-f181.google.com with SMTP id bk18so6949016oib.8;
        Fri, 22 Oct 2021 16:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zSuAE3RSJ43llp8C+stYHPq0rTTeRWYXzdSTZgPFCs4=;
        b=aFvJ8JMlp5j90QHvB9uqaldZ/NgYFaC7uwjbznIwCj0/+YXuqDWI7IfBnLVluFS6uQ
         JlG1GCe4svCdulycyqqE6+oBjEpI45ZEr7uV5OdhXPvsdlX0RPgLzj//mlOafj56XhjJ
         LD5TaP8ArAP1l+0HL9+vixPM2D6nh01/8SwQS4kNE1nXE88lkTANleKFKYRnycDy8RZl
         L2xOiRHb+mt2Motbh50IWT7bsaNb3+w/d8IgAlw1kCcTI3KGaOvqlyiGFRfx84Aplr2u
         5I9J2jmG9zexE+96prkkFl5LsX3CwObVK41fw814jx4o2Jge2L0XTZ21VljwDL64LpJl
         DrmA==
X-Gm-Message-State: AOAM533tkMsdx6GABtR+GkcB8EIobVLc63ztNbCLp/hFD2ssNcQ1avo3
        RshEvA8kc6ufjAiLEaQtdQ==
X-Google-Smtp-Source: ABdhPJygMuUHKwqjAYXnJQ+sF4UCg9hIvLQi6e+ekBq4QT4WLoGAHQT+sUEZ856SUYdCTJjATVBiLQ==
X-Received: by 2002:a05:6808:a1d:: with SMTP id n29mr3711706oij.164.1634945860291;
        Fri, 22 Oct 2021 16:37:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m7sm2271061oiw.49.2021.10.22.16.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 16:37:39 -0700 (PDT)
Received: (nullmailer pid 3386546 invoked by uid 1000);
        Fri, 22 Oct 2021 23:37:38 -0000
Date:   Fri, 22 Oct 2021 18:37:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        codrin.ciubotariu@microchip.com, ludovic.desroches@microchip.com,
        linux-i2c@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: at91: Extend compatible list for
 lan966x
Message-ID: <YXNLQlUKgloigEd8@robh.at.kernel.org>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <20211012140718.2138278-2-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012140718.2138278-2-horatiu.vultur@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 12 Oct 2021 16:07:17 +0200, Horatiu Vultur wrote:
> Extend compatible list and the i2c-sda-hold-time-ns property
> with 'microchip,lan966x-i2c'
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
