Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9379673B73B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 14:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjFWMbA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 08:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFWMbA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 08:31:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D2210A
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 05:30:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F9A561A3D
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 12:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11380C433C0;
        Fri, 23 Jun 2023 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687523458;
        bh=NHjfJehKHbV0Y+qDGnCOrAgD/z+kIubkkz4e0cSyRrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OrXqbi+429jd0YJRyQXARmLZejVxlSSy64neRMd5/j8EL1AuN/J0qFNXHNriGCmhk
         fnXaQ/WuyMZg9lGQwKdfB2wqKCn5cKzIZ4ilgrPkB/CavtfPCEKsSxwvFMwtOgc0Aj
         Pk+Uxk1A6MAdkTA8uPa9NWeZigYMCZ6edOsycK0z628i51pWqM8e5Ru6w/aHlFsF/k
         VWRDOTn232ou3QbdS25c3ZC9pmhlCR8n0NwF3W2woSTvwxXbvtXPttT4k8wwuwMuXK
         6MsejWHvg46rhQqfM/sohZHEQeuyRUMQa3Lu8MN0CMmRssd2I4h7gt+cNN7sut+U1R
         lGHI7BY9yR4bw==
Date:   Fri, 23 Jun 2023 14:30:55 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 04/15] i2c: busses: exynos5: Use devm_clk_get_enabled()
Message-ID: <20230623123055.lxjbhvae7arl5uvj@intel.intel>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-5-andi.shyti@kernel.org>
 <ZJVuDEa/7IBwAusj@shikoro>
 <20230623114803.rvzxjb7iatr6jlvu@intel.intel>
 <9189aad9-5053-81e1-b0f3-9b585d75734d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9189aad9-5053-81e1-b0f3-9b585d75734d@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Fri, Jun 23, 2023 at 02:18:32PM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2023 13:48, Andi Shyti wrote:
> > On Fri, Jun 23, 2023 at 12:03:56PM +0200, Wolfram Sang wrote:
> >>
> >>> -	clk_unprepare(i2c->clk);
> >>> -	clk_unprepare(i2c->pclk);
> >>
> >> Are you sure we can use devm_clk_get_enabled() here which calls
> >> clk_disable_unprepare() on remove and not clk_unprepare()?
> > 
> > Unless I am missing something, I think so. This is what the
> > driver does, gets the clock and enables it.
> > 
> > I don't know why there is just unprepare() and not
> > disable_unprepare() in this function.
> 
> Your code is not equivalent and does not explain why. Pure
> devm_clk_get_enabled() conversion should be equivalent.
> 
> If original code was correct, your patch will cause double clk disable.
> If original code was not correct, your patch silently fixes it without
> explaining that there was a bug.
> 
> Did you test the patch, including the unbind path?

you are right! My code, indeed, doesn't do a 1to1 conversion.

Will prepare it again, maybe in two patches, one for the
conversion and one for clearing the removal path.

Thanks for dropping in,
Andi
