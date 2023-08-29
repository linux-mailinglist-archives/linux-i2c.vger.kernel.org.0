Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913E278C4B2
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 15:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjH2NBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 09:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235388AbjH2NAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 09:00:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79ECE56;
        Tue, 29 Aug 2023 06:00:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2B3B655D4;
        Tue, 29 Aug 2023 13:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A376BC433C9;
        Tue, 29 Aug 2023 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693314008;
        bh=k02n8H/pMA/2kxbcumIZSPEHc62SYzyV55gFzonZl7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OoY82y9T92qWO1tGbT8KzEsY1f9Gxs0bdfJw07827vw/O4pDOB8b9eky4FDaOJDxZ
         nNopPpx46xa787BpymXdvh6dNsOS8MFbtvRRyFOfOeaAv+TuGd0pLWds+6Fn2GJj2+
         liAzppz6R0dgO3q3UHdb/6LOS+WYzw3i67u0wEqgnrQND8ifudybM1JTl6gAwHjdrH
         152pWIJRPigSn/xZkpYHXDxnM6o7zpDnAZs52KbRo7lRXSRbKx1+yHoGfwuZSZ5j9b
         A7Lv+8JVqxkZI5UNMCQCS5epYRqbkZk2AnhhPcSWsZ+TYDRfWagj4TU31oslzf7CmL
         Lc1xTrtlJE0Lw==
Date:   Tue, 29 Aug 2023 15:00:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: at91: Use dev_err_probe() instead of
 dev_err()
Message-ID: <20230829130004.tx45hldmp7balxr6@intel.intel>
References: <20230825143234.38336-1-yann@sionneau.net>
 <20230829125720.jqk52g3lsbfvodk4@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829125720.jqk52g3lsbfvodk4@intel.intel>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

BTW...

> > Change
> > if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
> > into
> > return dev_err_probe()
> > 
> > Also, return the correct error instead of hardcoding -ENODEV
> > This change has also the advantage of handling the -EPROBE_DEFER situation.
> > 
> > Signed-off-by: Yann Sionneau <yann@sionneau.net>
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

for the next time, please, if you make changes to the patch,
starting from the commit title, commit message, patch body, you
need to increment the versioning and note the change in the
changelog.

Use resend only if the patch is taken and sent as it is without
any change, anywhere.

This should have been [PATCH v2].

Andi
