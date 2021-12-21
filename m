Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B38247C543
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhLURrX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:47:23 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]:36856 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhLURrW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:47:22 -0500
Received: by mail-qk1-f169.google.com with SMTP id d21so13314493qkl.3;
        Tue, 21 Dec 2021 09:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=enBZKRe45Eq3IaJ4YleNfTEAHY3TWjrKA5JUyvv9lv8=;
        b=JeClEPBJLPcofypG3IvhakzxIQWzwUo8T5nVuG+Oqz/QEi2PQZDyAKVz+YxmYn+1jH
         eV6lkdJ1u9IMcvOHuTtqZeBnEflI5buV485I7lYR/s/A3tf6syixl6gRskqXoMEtwU6A
         OYN3zuV26/0pjwXX3SSEdpxNA6kJ2oBdZEbFmZzZb1G0tpBCMRe8hrb4o75MPNxC4Kdk
         VEQcVtvThWZ/dkr8f98Vwkh/Lx7fsS+0wRQB/04eKty7uWHBjPlef10ywhO9XWDHa5sV
         lkm37g5iAwWYOAsyEENpOO0nC+KoNsS5v7DNyPbnLj+l3Y9C/Dv8RiBUs12quY3zKroK
         MOYA==
X-Gm-Message-State: AOAM532DXlnhyPa5dZTTH1kWcvMaDeP7Tqr+eioqJqU0jOoLhC5hy35x
        b928/F29M8bpTaYi6qZVBA==
X-Google-Smtp-Source: ABdhPJz3OOPp5uAFgP2bRqUduxgScmvXC/dj9htul/5dPYzu+6NqrrafVrSjfakiGVyL6R3b5cnMvw==
X-Received: by 2002:a05:620a:1496:: with SMTP id w22mr206198qkj.463.1640108841543;
        Tue, 21 Dec 2021 09:47:21 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id ay42sm13916078qkb.40.2021.12.21.09.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 09:47:20 -0800 (PST)
Received: (nullmailer pid 1484960 invoked by uid 1000);
        Tue, 21 Dec 2021 17:47:16 -0000
Date:   Tue, 21 Dec 2021 13:47:16 -0400
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     lee.jones@linaro.org, devicetree@vger.kernel.org,
        aou@eecs.berkeley.edu, atish.patra@wdc.com,
        linux-crypto@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, heiko@sntech.de, geert@linux-m68k.org,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        robh+dt@kernel.org, u.kleine-koenig@pengutronix.de,
        linux-rtc@vger.kernel.org, linus.walleij@linaro.org,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
        palmer@dabbelt.com, bgolaszewski@baylibre.com,
        ivan.griffin@microchip.com, linux-kernel@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
        bin.meng@windriver.com
Subject: Re: [PATCH v2 01/17] dt-bindings: interrupt-controller: create a
 header for RISC-V interrupts
Message-ID: <YcITJFfZ/U56MxBv@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-2-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:09 +0000, conor.dooley@microchip.com wrote:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Provide named identifiers for device tree for RISC-V interrupts.
> 
> Licensed under GPL and MIT, as this file may be useful to any OS that
> uses device tree.
> 
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h
> 

Acked-by: Rob Herring <robh@kernel.org>
