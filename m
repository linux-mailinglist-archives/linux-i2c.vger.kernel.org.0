Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122C8770FC7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 15:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjHENBx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 09:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjHENBw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 09:01:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D266EE6A;
        Sat,  5 Aug 2023 06:01:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7091660D37;
        Sat,  5 Aug 2023 13:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5084AC433C7;
        Sat,  5 Aug 2023 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691240510;
        bh=ubNowK1yjlHoJdYc2ZzISgzS0f53Vxpdvy24J0/gKlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q12nSUAasF6GgXNJHfpe9yP4Pnca/XU5GaidDrUVDcAgxeTXH3tIH8Qn/92HfYw1z
         YO3HRhsB952/gp4+CbfUXMZYy/Pg4lebF2CS4enJK5sMft4iG9q5iGSbeIuTgkU94z
         DgvJIUHnidQh0911UhyDj1j5gBIvPSyzoEoHsorT8FN1ab9rm/PwETSCI3YDuYgSrr
         3cAQpm67LfFwOsLj2w3ajaUCppKmeMgb4sIJbqaYjooAmFpwU59CKK9K9n77TkLMX9
         6rDEZTFr1lVzjpEbgmoBmhUAiPkgQDMiMT+QpX6bZ0FZR3Grxb/R7J/Fhnv+/b4iIu
         k2Nn0zvOkBKRw==
Date:   Sat, 5 Aug 2023 15:01:47 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        wsa@kernel.org
Subject: Re: [PATCH] i2c: tegra: Fix the check during DMA channel release
Message-ID: <20230805130147.eabmdfbyttx2mjpl@intel.intel>
References: <20230717151240.68899-1-akhilrajeev@nvidia.com>
 <ZLVdHzFm8yngLDj2@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLVdHzFm8yngLDj2@orome>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Thierry and Akhil,

On Mon, Jul 17, 2023 at 05:24:15PM +0200, Thierry Reding wrote:
> On Mon, Jul 17, 2023 at 08:42:40PM +0530, Akhil R wrote:
> > Check for error and NULL before attempting to release DMA channel.
> > 
> > This, otherwise, was causing panic and crash in kernel when the
> > dma_chan has an invalid value. The condition occurs during init_dma()
> > when the dma_request_chan() function returns an error.
> > 
> > Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

I guess this patch is not needed anymore.

Andi
