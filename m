Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0492C21E01A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 20:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgGMStj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 14:49:39 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33137 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGMStj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 14:49:39 -0400
Received: by mail-il1-f194.google.com with SMTP id a11so12134417ilk.0;
        Mon, 13 Jul 2020 11:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D2pEC3wrhCgsQyFWELi0L0bjElIETMMY7GPEG8vzOa4=;
        b=AAW87OdxFuU7LFiVoogoSoFn57W407dKhnSwjhovi3BnAcwjCaSEO1sv7qZ9xqtEip
         G1BCOfpd1CSr3cjMnMZME7Sh6lQ+1Nhroyxu8N1zNxdY07Tz4sXFJsXLpg5dFayO6FTV
         5CaL7gwC4zJww8FjYHxON8SivmPE2cdJPDH/H9ZZf8jVvz704DhZJW6O+REOeTbfprf9
         vT885GGygzHZGTV0QIETXUsh3sRmYZDz6MIq9Z83Q9LLk3cVZb9VJKvLNfrAH6jyVtuO
         JIMfLnFjJSf5h0uAI6M9JJ4rV6C0BcV6NHsQSoh7rnL9EgA3PF1OphiOQiMO437HMs6r
         W05g==
X-Gm-Message-State: AOAM531cqBovoAWA2VRuRXgsaofECJMYAHT7l4lPHHdxUcAHl80n5bF6
        WUTmNBy2S92VeBufo2+HoiKJpHyGeQ==
X-Google-Smtp-Source: ABdhPJyP/pl5I6zbz0C7TeX4/5kUapJB9XyFwzuhnpEOXC9kRpfTO0YGPJ4Fovdmqn23DjQWcYsaNQ==
X-Received: by 2002:a05:6e02:dd1:: with SMTP id l17mr1154698ilj.136.1594666178303;
        Mon, 13 Jul 2020 11:49:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k24sm8962781ilg.66.2020.07.13.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:49:37 -0700 (PDT)
Received: (nullmailer pid 528776 invoked by uid 1000);
        Mon, 13 Jul 2020 18:49:36 -0000
Date:   Mon, 13 Jul 2020 12:49:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 3/5] dt-bindings: interrupt-controller: Convert
 mrvl,intc to json-schema
Message-ID: <20200713184936.GA528729@bogus>
References: <20200616223353.993567-1-lkundrak@v3.sk>
 <20200616223353.993567-4-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616223353.993567-4-lkundrak@v3.sk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Jun 2020 00:33:51 +0200, Lubomir Rintel wrote:
> Convert the mrvl,intc binding to DT schema format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Move minItems/maxItems to main reg property definition from the
>   conditional one
> - Drop the condition for marvell,orion-intc
> - Add default GPL-2.0-only license tag
> - Fill in maintainers from MAINTAINERS file
> 
>  .../interrupt-controller/mrvl,intc.txt        |  64 ---------
>  .../interrupt-controller/mrvl,intc.yaml       | 134 ++++++++++++++++++
>  2 files changed, 134 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
> 

Applied, thanks!
