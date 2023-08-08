Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC03773E58
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 18:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjHHQ3c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 12:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbjHHQ2i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 12:28:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AEA1252B;
        Tue,  8 Aug 2023 08:51:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5308D6148B;
        Tue,  8 Aug 2023 13:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1C5C433C8;
        Tue,  8 Aug 2023 13:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691501000;
        bh=Ej5BSAcAFQoRKPEbSvr0EDDMbbunYGKnJRjORk2jT44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R/gcp1zkiO6/9zQgU4exHjrYiN/xwMjr15N8BGZNjHmqU0y8lyh09FNNyLLQUReAz
         laXy0oBtOFI++WgrR00YOmYy674YKdd4NXIURtcrvwc+C+99DTJakcysGChJpev5Ts
         FEEaBZD1fGL9RidM/eAE4So6BtKx5tAtx7fu9hJRvVXCNGS++8x4WQHsCIiiNDvtvf
         YJ6QujQFKhLxa0Caa8ZZU1gj8gWMpn8MuhP8ePwDaNoZHxkoi30/gvJqR7vsSHOh3t
         8hxJSiq5SEdlnsgrHDeC+Hw08BhYPuR2F/6cC7+PiZ94qPxE1K3007dbSxDdNpJ9wk
         fCTnxIJwpfS/w==
Date:   Tue, 8 Aug 2023 15:23:17 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Parker Newman <pnewman@connecttech.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Message-ID: <20230808132317.e6wxml5mo4hz7fjo@intel.intel>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804215631.wc22pkyetsyyt5ye@intel.intel>
 <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
 <eb8ceb2b-3a23-8cef-91b5-ef416fbc3594@connecttech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb8ceb2b-3a23-8cef-91b5-ef416fbc3594@connecttech.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Parker,

On Tue, Aug 08, 2023 at 12:42:28PM +0000, Parker Newman wrote:
> On 2023-08-06 10:21, Akhil R wrote:
> >>
> >> BTW...
> >>
> >> On Thu, Aug 03, 2023 at 05:10:02PM +0000, Parker Newman wrote:
> >>>
> >>
> >> you have a blank line here.
> >>
> >>> This patch fixes the Tegra DMA config option processing in the
> >>> i2c-tegra driver.
> >>>
> >>> Tegra processors prior to Tegra186 used APB DMA for I2C requiring
> >>> CONFIG_TEGRA20_APB_DMA=y while Tegra186 and later use GPC DMA
> >>> requiring CONFIG_TEGRA186_GPC_DMA=y.
> >>>
> >>> The check for if the processor uses APB DMA is inverted and so the
> >>> wrong DMA config options are checked.
> >>>
> >>> This means if CONFIG_TEGRA20_APB_DMA=y but
> >> CONFIG_TEGRA186_GPC_DMA=n
> >>> with a Tegra186 or later processor the driver will incorrectly think
> >>> DMA is enabled and attempt to request DMA channels that will never be
> >>> availible, leaving the driver in a perpetual EPROBE_DEFER state.
> >>>
> >>> Signed-off-by: Parker Newman <pnewman@connecttech.com>
> >>
> >> As this is a fix you also need to add
> >>
> >> Fixes: 48cb6356fae1 ("i2c: tegra: Add GPCDMA support")
> >> Cc: Akhil R <akhilrajeev@nvidia.com>
> >> Cc: <stable@vger.kernel.org> # v6.1+
> >>
> >> Cc'eing Akhil as well for his opinion on this.
> > The fix looks valid to me. Must have been a typo there.
> > 
> > Regards,
> > Akhil
> > 
> Yes it appears to be a simple typo and if you have both DMA Config options 
> set the bug would get missed. 
> 
> I am new to the Linux mailing list, should I send a new message to 
> stable@vger.kernel.org or CC them on this one?

First of all... welcome to the Linux mailing list :)

No need to resend, I can add it... I was hoping for an official
ack, but as that's not coming, I will ack it

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thank you Parker and wishing to see more patches from you ;)

Andi
