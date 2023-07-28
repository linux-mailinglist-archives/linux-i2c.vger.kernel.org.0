Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC100766D1C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbjG1MWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbjG1MVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:21:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C7761BE;
        Fri, 28 Jul 2023 05:19:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C41F26211E;
        Fri, 28 Jul 2023 12:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22DDC433C8;
        Fri, 28 Jul 2023 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690546759;
        bh=Hgw9mIKlRS8BNAKsfxrpDUm2kZAFQ9KwK/pp9SAZwgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmG4YIzOSI8MdzxvPdLiq2I0r/gI2W2DVVZqVSzudaGISQzvKlU/CsefUFXJrp56l
         57CN2vAxlGYT1OsNjiyN0hYdhTG4B/hgAOlJ+frVaQ8Q3xK6mLYNRfRWZenKEY2tPo
         xDdToW/6zBc1nMdiZh1+bbjUnvzGwXASUQKaSq78C8YJZtQoImnqlDhBnW13hTnFoK
         KMXLsaRgKWq+tgujvBI63+jWhKlptqNy1y+RTVaqIkyBVPxcNMuqlVBkb9wyvwp0Pi
         RMjZmd6k7B7rqvVLrSvb/rE4ytOajwu48yu41FYFNeVnkNs4zFMOMOKOlKWgk1Uk9c
         T5nPjhtIc31Mw==
Date:   Fri, 28 Jul 2023 14:19:15 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/22] i2c: kempld: Convert to use regular device PM
Message-ID: <20230728121915.vv2sszyiz5vwuhqg@intel.intel>
References: <20230722115046.27323-1-paul@crapouillou.net>
 <20230722115046.27323-11-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722115046.27323-11-paul@crapouillou.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On Sat, Jul 22, 2023 at 01:50:34PM +0200, Paul Cercueil wrote:
> Provide PM callbacks through platform_driver.driver.pm instead of
> platform_driver.{suspend,resume} as any good-behaved driver should do.
> 
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
