Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE52421E361
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jul 2020 01:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGMXCN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 19:02:13 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39939 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgGMXCN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 19:02:13 -0400
Received: by mail-il1-f193.google.com with SMTP id e18so12662638ilr.7;
        Mon, 13 Jul 2020 16:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0JkY/IydW/gEv8qHIx3b5ShKlXszMgynuLTSr7LPSiY=;
        b=V095K5swDUq+zOcrhks/UeoKKIutafug3bYIxlOYHDh5GLanYYWq2J2WOzxfpHit0g
         eEC3+2gjmdMD32JLrGjm64wACOpqueT3fwwTeScqFn5lvoI3Vsm7q+eqL/qNx+C8eEFY
         RLjYQNxHdyvEtXVkD6jCz+WUVK2BBtEPjc273h/fouXJnCPI15gtyko+c5Z8NnR2vdpV
         wCVL4UFghLmsXF5Cr3Vf6EjGqvHdzRrvWciXuJYGhN/MR36b18dKOWiaLM50d004UlKh
         RVdbbnVnRHOR8nN9JHQVrwB9TDXg3hv/rxjcnvQFIAT6KTdD9fLtf7MDgvFjzERX4kgt
         Dt4w==
X-Gm-Message-State: AOAM530BiJIqL5Z6v+YZfwnnjwh8tGNDLTPYcpEVFwum43ZlAZiaIHg0
        Cu4FXQ2y9aRiEter2eUSAQ==
X-Google-Smtp-Source: ABdhPJxe9k1suva8aVWluB0pMau2ihw31/IveMFIbqWcliLeoU1S1b8L1Guy6UtfWOj37Ipt2k6A/w==
X-Received: by 2002:a92:b6d4:: with SMTP id m81mr2123220ill.72.1594681331730;
        Mon, 13 Jul 2020 16:02:11 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c3sm8887100ilj.31.2020.07.13.16.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:02:11 -0700 (PDT)
Received: (nullmailer pid 884155 invoked by uid 1000);
        Mon, 13 Jul 2020 23:02:06 -0000
Date:   Mon, 13 Jul 2020 17:02:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     mturquette@baylibre.com, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, mripard@kernel.org,
        lee.jones@linaro.org, sboyd@kernel.org, liyong@allwinnertech.com,
        daniel.lezcano@linaro.org, anarsoul@gmail.com,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        megous@megous.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, rui.zhang@intel.com,
        srinivas.kandagatla@linaro.org, linux-pm@vger.kernel.org,
        gregory.clement@bootlin.com, icenowy@aosc.io,
        tiny.windzz@gmail.com, jason@lakedaemon.net, stefan@olimex.com,
        maz@kernel.org, tglx@linutronix.de, wens@csie.org,
        bage@linutronix.de, huangshuosheng@allwinnertech.com,
        amit.kucheria@verdurent.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, clabbe@baylibre.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 07/16] dt-bindings: thermal: sun8i: Add binding for
 A100's THS controller
Message-ID: <20200713230206.GA884103@bogus>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-8-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-8-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 08 Jul 2020 15:19:33 +0800, Frank Lee wrote:
> Add a binding for A100's ths controller.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> Reviewed-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
