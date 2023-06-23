Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4771A73B6C8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 13:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjFWLu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 07:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjFWLuk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 07:50:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43AF2969
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 04:49:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9ADB61A38
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 11:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD28C433C8;
        Fri, 23 Jun 2023 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687520887;
        bh=cN6j1+Gzy4V61zs1lpIlLVq8gBjd7rz8wPXM6R4haTU=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=k+yjgf9T3rnrMtDKAaPfHxjQ8JjoZ8dm0KIvCUjYIQQI/ZneRU4MJPwqbzl/hsUTq
         fp+sBpn2sW/rv7SScD48UXPi30IVZaIwyn2Vv82G/y8xeXTUwOwXjoA5WT9dNsMNQk
         x0LK9OAhbIy4j1z1FQid3QwMQg63TIM8g8K/NZobqT34Arct9ULkKdH8asHVsJ2h/W
         1R6lvOpAnMpWbaaqtEukK3+jWIkL3dQDidd3Jf0JUOVqhDBG04VOJCKOW88G41ukBK
         c4NsIKRDBo93SGMtHbhB2uc2a6r1/EcPOzmVQLPheHeZQ5e6XlSbF0oSpGo/SnxRek
         bu1R4DlcLu6RQ==
Date:   Fri, 23 Jun 2023 13:48:03 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 04/15] i2c: busses: exynos5: Use devm_clk_get_enabled()
Message-ID: <20230623114803.rvzxjb7iatr6jlvu@intel.intel>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-5-andi.shyti@kernel.org>
 <ZJVuDEa/7IBwAusj@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJVuDEa/7IBwAusj@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 23, 2023 at 12:03:56PM +0200, Wolfram Sang wrote:
> 
> > -	clk_unprepare(i2c->clk);
> > -	clk_unprepare(i2c->pclk);
> 
> Are you sure we can use devm_clk_get_enabled() here which calls
> clk_disable_unprepare() on remove and not clk_unprepare()?

Unless I am missing something, I think so. This is what the
driver does, gets the clock and enables it.

I don't know why there is just unprepare() and not
disable_unprepare() in this function.

I think the patch is correct, maybe Krzysztof and Alim might spot
something that I have missed.

Thanks,
Andi
