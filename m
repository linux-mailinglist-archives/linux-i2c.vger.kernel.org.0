Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604D82214FC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 21:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgGOTVv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 15:21:51 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35545 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgGOTVv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 15:21:51 -0400
Received: by mail-io1-f68.google.com with SMTP id v8so3495109iox.2;
        Wed, 15 Jul 2020 12:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpO2PmYmWFeYwVE+k7Xx8wRkBjcoL7yVQGNUR1MHgJU=;
        b=rkVsyUrOiFKQTZPfC3qY0Slb6btxKYkxTkyU3SuU2+1fKn8/dqsgji+xhKbXGKBoiE
         2X9N3O45rLldVec4orE4oAFPKuvKRgs68cH6d4y+eBgnWqjwSm6LqsFr6eA1yObBHkF7
         0BdkrLJVwjwBCkHdkfCLksjXyDoltm3ax0QxREuebwJX6OiGVwjXlTruhrWnzEIDcxP4
         5LyK1avioby7YNLam1AbMrDgLuuBpaAiKKnRhMPMyja95Rh+78XWjuKbkQl1TxDXWIFg
         ccMkT3vebV6SK4TcMitFDQh5wEMh6oc5Z/a2RxlRjx+dEZyd4rrdxHNR7GxPbIbmn8dU
         8Q2Q==
X-Gm-Message-State: AOAM532d6YVxeYVi7FeeCVzmkCVkSeStaRNTJzSIkvAwmRvGAizZCDvw
        tQ0IrYxmqkxohOantFq91JfPbf/4JA==
X-Google-Smtp-Source: ABdhPJynn0MDDy8fnolqF32P3LzcbAvnAj/VAANNkoeMF6+dMrtRFB2N5E81MG9VXkm5KqIzuoogWQ==
X-Received: by 2002:a05:6602:21c3:: with SMTP id c3mr773323ioc.93.1594840910191;
        Wed, 15 Jul 2020 12:21:50 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j17sm1478157ilq.7.2020.07.15.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:21:49 -0700 (PDT)
Received: (nullmailer pid 674969 invoked by uid 1000);
        Wed, 15 Jul 2020 19:21:48 -0000
Date:   Wed, 15 Jul 2020 13:21:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        alexandre.belloni@bootlin.com, linux@armlinux.org.uk,
        ludovic.desroches@microchip.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamel.bouhara@bootlin.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Message-ID: <20200715192148.GA674938@bogus>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 19 Jun 2020 17:19:01 +0300, Codrin Ciubotariu wrote:
> The I2C GPIO bus recovery properties consist of two GPIOS and one extra
> pinctrl state ("gpio" or "recovery"). Not all are mandatory for recovery.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
