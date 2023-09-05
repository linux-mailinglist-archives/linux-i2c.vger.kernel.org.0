Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCDB7930E6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 23:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjIEV11 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 17:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjIEV11 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 17:27:27 -0400
X-Greylist: delayed 327 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 14:27:24 PDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7755E128
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 14:27:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27FAC433C8;
        Tue,  5 Sep 2023 21:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693948916;
        bh=WEHZIPdvYieo8x9rD32kFOjtSrLk2fYbTpWVJToEjRs=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=jGTfNLL0g0VVtqQttOl/nklD5Pb7aejA/BA/QRYiAWE8xDIEBZk5yVmObpmQkqnOZ
         7FhYmQ4Ymnf0QgchNsRfkEi/yrNqnLPBmSa9evU5jpPDWZeeiQQmi3fOz4FCiiKMrI
         cCGG9yFTUMTusJm8Auh/BGTORRoSHV9CL67JRqQpyUrhyorzi1bZfZzA23wTZOZQrQ
         Nighq2A59+Pvao7aTAPOEjj2bBsUBmdj5GEiPANKX5tzTAgsvrAA4MKUDYzfPOSvzP
         K2TozotYq7aOwMSoAHmK2u4Ou5YcA26upv//F5dLQB0tsBmj1N3wqWF+56YyWBEBB5
         5KfyuqQie+8sQ==
Date:   Tue, 5 Sep 2023 23:21:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
Message-ID: <20230905212152.ilakbue27dh3lz24@zenone.zhora.eu>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
 <20230905113624.5o2hfjojh3he7aex@zenone.zhora.eu>
 <ZPc4ylzR4MJEMlbx@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPc4ylzR4MJEMlbx@ninjato>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> > >  	{ .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
> > >  	{ .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
> > >  	{ .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
> > > +	/* S4 has no FM+ bit */
> > > +	{ .compatible = "renesas,i2c-r8a779f0", .data = (void *)I2C_RCAR_GEN3 },
> > 
> > is this I2C_RCAR_GEN3 or I2C_RCAR_GEN4?
> 
> Technically, it is Gen4. But its I2C controller behaves like Gen3. This
> is why it has a seperate entry to avoid the generic Gen4 fallback...
> 
> > > -	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN3 },
> > > +	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN4 },
> 
> ... here.

got it... I just wanted to be sure... thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
