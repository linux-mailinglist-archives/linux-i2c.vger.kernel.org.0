Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCAA79270C
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240655AbjIEQTu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354433AbjIELgc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 07:36:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA061AB;
        Tue,  5 Sep 2023 04:36:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CABA3602E0;
        Tue,  5 Sep 2023 11:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA19C433C8;
        Tue,  5 Sep 2023 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693913788;
        bh=JJ1xgbKs1Vv5+UBKm7oDOUD1ckh8Fc4bT3kqxnA3/sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DGQX5q5hkl16T4RhaWAG4GCnv6bCK0EwaWZ9Ztvnh8bfULdbZqoFFL+LN4ptVukir
         Ib/NOa2YKgggCD2D7iBAegSc5e8caSpP0r48/8O7pR6E8s0CciR8cUuBuOhXeyLXbu
         AMqEd1pSvTOZUZCR3d8ZDxGwNnXR9HGKZZaRUayB9b1aeHOZsDVDDwLns7sVZAPnEN
         D31jV9zkSr6fYBtFEAXFCaH0224mkWO1s8Kadr3gcvECqhb8wamOG2UF3poCpaACZ/
         yf/NRTrWYz/bn0PkiyTwP5o0KZ+IOkZdwwlACkEVZtf3k4lze7Mh6rbxsmicJQKEkb
         /hXyAvTfIrp+g==
Date:   Tue, 5 Sep 2023 13:36:24 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
Message-ID: <20230905113624.5o2hfjojh3he7aex@zenone.zhora.eu>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> @@ -1031,10 +1021,12 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
>  	{ .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
>  	{ .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
>  	{ .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
> +	/* S4 has no FM+ bit */
> +	{ .compatible = "renesas,i2c-r8a779f0", .data = (void *)I2C_RCAR_GEN3 },

is this I2C_RCAR_GEN3 or I2C_RCAR_GEN4?

Rest looks good.

Andi

>  	{ .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
>  	{ .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },
>  	{ .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 },
> -	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN3 },
> +	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN4 },
>  	{},
