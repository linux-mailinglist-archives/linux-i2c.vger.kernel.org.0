Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C06770B48
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 23:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjHDV4i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 17:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjHDV4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 17:56:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E415F106;
        Fri,  4 Aug 2023 14:56:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 826DD620AE;
        Fri,  4 Aug 2023 21:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D649C433C8;
        Fri,  4 Aug 2023 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691186193;
        bh=mT5bk7cd5EYNsRFZCZ+B+RnmZqOU/3o6oW2FuS19fdE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i8h6vvLiiYBp/5YVfIFpsJFrU4eCoc7Edosf7UxFcXWxdY5ul5jGw860IyHpNWgng
         SMNdrNRVPHjAdNg9OElMKmHV68KP8o3/EZhXOghESGYPjNNEs5TFKtQMvrzEaYPAzC
         14+fJGTlyCNiemugn10hRuoQSK/bSslfTIYB673MKeweQnJjJFsX3Q1P651LsC5qQq
         9lYIZLGIDiL6KwjqO7gO46+y5bSMjXPftLSNU1AKBp54MQ7cdhx9uhE/MPgxnuPU7C
         5NpYNYkmrejnpKAHhxG/FcNJ8SN+FhNrjJvgUPABwin6jwrbFHYZUrLYc8feohtact
         ICRgGVWgfyGYQ==
Date:   Fri, 4 Aug 2023 23:56:31 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Parker Newman <pnewman@connecttech.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Message-ID: <20230804215631.wc22pkyetsyyt5ye@intel.intel>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

BTW...

On Thu, Aug 03, 2023 at 05:10:02PM +0000, Parker Newman wrote:
> 

you have a blank line here.

> This patch fixes the Tegra DMA config option processing in the
> i2c-tegra driver.
> 
> Tegra processors prior to Tegra186 used APB DMA for I2C requiring
> CONFIG_TEGRA20_APB_DMA=y while Tegra186 and later use GPC DMA requiring
> CONFIG_TEGRA186_GPC_DMA=y.
> 
> The check for if the processor uses APB DMA is inverted and so the wrong
> DMA config options are checked.
> 
> This means if CONFIG_TEGRA20_APB_DMA=y but CONFIG_TEGRA186_GPC_DMA=n
> with a Tegra186 or later processor the driver will incorrectly think DMA is
> enabled and attempt to request DMA channels that will never be availible,
> leaving the driver in a perpetual EPROBE_DEFER state.
> 
> Signed-off-by: Parker Newman <pnewman@connecttech.com>

As this is a fix you also need to add

Fixes: 48cb6356fae1 ("i2c: tegra: Add GPCDMA support")
Cc: Akhil R <akhilrajeev@nvidia.com>
Cc: <stable@vger.kernel.org> # v6.1+

Cc'eing Akhil as well for his opinion on this.

Andi
