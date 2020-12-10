Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EA82D526F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 05:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732048AbgLJECE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 23:02:04 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44119 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732225AbgLJEAD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 23:00:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id d189so4270978oig.11;
        Wed, 09 Dec 2020 19:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6oGGK+dOGnoINWzCvubHZwwfiFrKLTQRjMEQW/QxQb0=;
        b=e7T57kNJBsn9PdhWT2j/OO2t8sHG/BFtEW4vm1NTEUwXBVTcst4WhkoYNZl2DaJMsT
         AXTpHr+riZvxHHgv3hO89EXhBNb9vli/WJVkiP66T1kTR56pzPa7gPz1f+RlHOu76NaD
         4z3zqplmjbbFZMKn9RF0x16oyi39kqXpTTPIXf+UWhUUFNHsTu2ynLtbNBbMGqWmaLFe
         Ucqmx9Y4o6sBTGnS8RXP2ZE+kcl6P56mknpOFWukBOw8KlnlM1S5AmTMJInz0d2KspIC
         EBwaHGyPOOhb51zv9hmy67Nn2cEgUyoQzYkbOge/V+DYCUAMUeWBYgmJ1vWEu4NQXKNH
         xWTw==
X-Gm-Message-State: AOAM530ONunrVJfIsnSe/VgR/H37//34d5PVxN7Him5Dhbr9dbb1Kgfi
        A0g2E42HAOMwZH4QdagcDg==
X-Google-Smtp-Source: ABdhPJzEJCziD7jzt8D07hIPtVj4iDG6Ls9LzxABH6iHQCPLAjSuLffty8DXLKn3cyFZUEmG/e2Tew==
X-Received: by 2002:aca:6044:: with SMTP id u65mr4205383oib.109.1607572762746;
        Wed, 09 Dec 2020 19:59:22 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g12sm795862oos.8.2020.12.09.19.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:59:22 -0800 (PST)
Received: (nullmailer pid 1638029 invoked by uid 1000);
        Thu, 10 Dec 2020 03:59:20 -0000
Date:   Wed, 9 Dec 2020 21:59:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        paul.walmsley@sifive.com, peter@korsgaard.com,
        lee.jones@linaro.org, linux-serial@vger.kernel.org,
        thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        palmer@dabbelt.com, u.kleine-koenig@pengutronix.de,
        broonie@kernel.org, linus.walleij@linaro.org,
        linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org,
        andrew@lunn.ch, linux-pwm@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 8/9] dt-bindings: riscv: Update YAML doc to support
 SiFive HiFive Unmatched board
Message-ID: <20201210035920.GA1637999@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 08 Dec 2020 10:25:40 +0530, Yash Shah wrote:
> Add new compatible strings to the YAML DT binding document to support
> SiFive's HiFive Unmatched board
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
