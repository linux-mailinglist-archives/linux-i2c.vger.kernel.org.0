Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB597765CB5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 21:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjG0T7A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 15:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjG0T6t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 15:58:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC37130D6;
        Thu, 27 Jul 2023 12:58:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5AB161F25;
        Thu, 27 Jul 2023 19:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81505C433C8;
        Thu, 27 Jul 2023 19:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690487855;
        bh=56ZtGTGNX0Q1hSDQ8QFwkA2S7F4L6MfkDzeKlTph/CA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iV24V3/CFJuA8ohd7sSKjp/g9CwR1SyBZUOSjhJ+hnyrW+OgtSvCgyDlXvfaTe1xe
         11jEgRYrPBYknzE245JvINtj+PLyK7duAbGZcy9K4HIeOEG+XDonZg4w1Ki7RjKl5e
         unxdQFJTV/OeR0Lo/12EGBltSc0A/B+LG8XrHCiX/z96hl3Oc/S9o1/TGw6BHNoKJx
         //jZwh5JAWBpd1wjIkLRIpwf+LWR0fo/wQu0giWp8+kOZtLlHLlMdsd+pG+80hYk3B
         iRgtgyDZ+dDBtzW+evhMWX2dWQ+/dG2X1rrRWRO/XsB9XhhVB7h1jdY2waysgK0Vta
         /6ltz350xUE8Q==
Date:   Thu, 27 Jul 2023 21:57:26 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <20230727195726.ueowrrb7zhnyz5jb@intel.intel>
References: <20230707132619.2998382-1-thierry.reding@gmail.com>
 <20230725213404.gj3fjiuz3wh4ak2i@intel.intel>
 <ZMKHs9WwPNhR3Z_o@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMKHs9WwPNhR3Z_o@orome>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Thierry,

> > > If the driver fails to obtain a DMA channel, it will initiate cleanup
> > > and try to release the DMA channel that couldn't be retrieved. This will
> > > cause a crash because the cleanup will try to dereference an ERR_PTR()-
> > > encoded error code.
> > 
> > while this is a valid solution I think the best thing here is to
> > clear the exit path by adding another goto label.
> > 
> > By setting dma_chan = NULL you would go through some extra checks
> > that are not needed.
> > 
> > I guess that by doing this we could even remove the
> > 
> > 	if (i2c_dev->dma_buf)
> > 	if (i2c_dev->dma_chan)
> > 
> > in tegra_i2c_release_dma(). However you see it cleaner. I'm not
> > going to be picky, though. Let me know if you are up for some
> > more clean up, otherwise I can give you an r-b... after a little
> > clarification...
> 
> The problem is that DMA support is optional, so we will typically
> succeed probe even when the DMA channel cannot be retrieved. The
> tegra_i2c_release_dma() is going to get called in any case and if
> we were to remove those checks, it would try and release a NULL
> buffer and a NULL channel for the non-DMA case.
> 
> That's also the reason why we set dma_chan = NULL rather than use
> an error label. We could technically skip tegra_i2c_release_dma()
> when we fail to get the channel, but we do want to run it when we
> fail to allocate the DMA buffer. So that would mean we end up with
> two different cleanup paths rather than just one. So overall the
> cleanup is simpler if we treat both code paths the same.

that's indeed an easy one-liner fix... that's why I proposed my
r-b in the earlier mail.

> > > However, there's nothing to clean up at this point yet, so we can avoid
> > > this by simply resetting the DMA channel to NULL instead of storing the
> > > error code.
> > > 
> > > Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> > 
> > ... is this the correct commit that is getting fixed? I think
> > it's this one:
> > 
> > Fixes: 86c92b9965ff ("i2c: tegra: Add DMA support")
> > Cc: <stable@vger.kernel.org> # v5.1+
> 
> The original DMA support patch didn't have this issue because it was
> storing the DMA channel (or error code) in a local variable first and
> only assigned it to the i2c_dev->{rx,tx}_dma_channel fields after
> checking for errors. Hence, those fields would never end up with an
> error code and therefore this wasn't causing any issues previously.

Yes, you are right! the patch commit you mentioned is actually
releasing the channel by checking i2c_dev->dma_chan which might
store the error number and therefore is not NULL.

Thanks for the clarification!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

> I hope that answers all your questions.
> 
> Thanks,
> Thierry


