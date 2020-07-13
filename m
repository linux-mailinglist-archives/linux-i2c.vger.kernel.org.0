Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BDB21E33B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jul 2020 00:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgGMWy6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 18:54:58 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:39590 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgGMWy5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 18:54:57 -0400
Received: by mail-il1-f195.google.com with SMTP id k6so12673972ili.6;
        Mon, 13 Jul 2020 15:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lx27nXKsEHDAQ3zBwCOzlK62p9t1j+kSDxv2fkLBnl0=;
        b=omMEP7ix62sxfXYmZON9ompwOwJNPJ54PXm7iQ/l02jxQVcl/DBzLjFg3ULfadJeqn
         RAvoVohi4oCVIWPfRG0BJxLmm7GTWUE+bKyJ+CqvDtk+G6XnNyiksO2NbTXJMtiPDYKy
         ncivOCPxMNbhCfoBjRsjmbUDmbOEag6BAQpvnP71ti0FudDRVkHVIwln2swv/Q5YMF1G
         1hlpd7WEWZW5E1lwjeasJg/c7UsQHxTaXQF+tFunHVCN/K9SxY7pcLVQnoWLS6drc1xH
         YMnO7fYFMLYkuGCtExs3plDnqPZs6iYmOWyTivnccKl68dtqxAVhipvdL2uJZg9SuXjE
         05gw==
X-Gm-Message-State: AOAM533rw92vFKakVDVO0Oxj4DKBtI3vlLUVbN5CsnbWzhvT0yGpz9wm
        Ejj0GN5xuT6lwEdQsti3YQ==
X-Google-Smtp-Source: ABdhPJxKGIcBl7P0g7fSqwC5X3R2fzaMf2mpBeKTxIr+o8fUnEkwxEhRcUXiVhulNMpWIs3AEYRpIg==
X-Received: by 2002:a92:58d6:: with SMTP id z83mr2086323ilf.186.1594680896394;
        Mon, 13 Jul 2020 15:54:56 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t5sm8807373iov.53.2020.07.13.15.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 15:54:55 -0700 (PDT)
Received: (nullmailer pid 874330 invoked by uid 1000);
        Mon, 13 Jul 2020 22:54:53 -0000
Date:   Mon, 13 Jul 2020 16:54:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     mturquette@baylibre.com, linus.walleij@linaro.org,
        clabbe@baylibre.com, liyong@allwinnertech.com,
        srinivas.kandagatla@linaro.org, icenowy@aosc.io,
        p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
        gregory.clement@bootlin.com, sboyd@kernel.org,
        amit.kucheria@verdurent.com, bage@linutronix.de,
        tglx@linutronix.de, linux-pm@vger.kernel.org,
        daniel.lezcano@linaro.org, anarsoul@gmail.com, megous@megous.com,
        tiny.windzz@gmail.com, lee.jones@linaro.org, rui.zhang@intel.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        wens@csie.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        maz@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, mripard@kernel.org, stefan@olimex.com,
        huangshuosheng@allwinnertech.com, jason@lakedaemon.net
Subject: Re: [PATCH v3 01/16] dt-bindings: clk: sunxi-ccu: add compatible
 string for A100 CCU and R-CCU
Message-ID: <20200713225453.GA874275@bogus>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-2-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-2-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 08 Jul 2020 15:19:27 +0800, Frank Lee wrote:
> This patch adds binding to a100's ccu clock and r-ccu clock.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
