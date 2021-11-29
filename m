Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5819B462131
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 20:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348091AbhK2UBk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:01:40 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:45949 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbhK2T7j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 14:59:39 -0500
Received: by mail-oi1-f170.google.com with SMTP id 7so36633289oip.12;
        Mon, 29 Nov 2021 11:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2bv3MqtAYFd6aKtve0kHQtlsznvcV7uI6PKWd3pGaDM=;
        b=X88vgMLAI3oyhQvhaT64JRUvMyHndg57SxwE5FMqckKihmubAmO5KwY/DZde6bTL63
         Efy8dVhWzA4jJWnyuUuRvPuv3xLbBwznxbVUd5914elZiL8dTOfAj0YwVmuJQXDl8gVM
         4swUONxD5xok4sGpf/ueZeFO2BxIU0PctTiMvRzbvkojvU1lxpjlAOWBMahJ3eJgOPQB
         O1d75iwZ9G76c0bH0jnBlNSopX0UfxJ4P9/Fx8crtq3qHttKbQnyJVZCst6a5aC9jgbM
         l78k1QMyj8w2kM7guR2FN1cWIpkyO55e8fRwuswfjE5S4gDB6au+zVT/hG8W1evSfrVi
         H+Ag==
X-Gm-Message-State: AOAM5332l3lfz2LIB6eyhzbp/IpUfgJ+4T2pVbpMWhOofXE/buJ6o/Tf
        MrCwflx/iqMXowku97cYsgWr7SU28A==
X-Google-Smtp-Source: ABdhPJzZTkmKa7Ovd7T72fND6EsSsej/FmXr489BG/R05JxgA09sAstD4jrlNB2n0QXW7mdfgksy5g==
X-Received: by 2002:aca:4307:: with SMTP id q7mr156403oia.3.1638215780450;
        Mon, 29 Nov 2021 11:56:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w29sm2522578ooe.25.2021.11.29.11.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 11:56:19 -0800 (PST)
Received: (nullmailer pid 502661 invoked by uid 1000);
        Mon, 29 Nov 2021 19:56:18 -0000
Date:   Mon, 29 Nov 2021 13:56:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        bin.meng@windriver.com
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller: add defines for
 mpfs-plic
Message-ID: <YaUwYkHHhTsPkAQh@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108150554.4457-3-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 08, 2021 at 03:05:43PM +0000, conor.dooley@microchip.com wrote:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Add device tree bindings for the Microchip Polarfire Soc interrupt
> controller
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> ---
>  .../microchip,mpfs-plic.h                     | 199 ++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h

Notice how there are not SoC interrupt defines in this directory. That's 
because we don't do defines for them. The 'rule' is only defines for 
made up numbers which are not in a reference manual.

Rob
