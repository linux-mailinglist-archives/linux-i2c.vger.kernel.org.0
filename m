Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A493E492EB1
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 20:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348296AbiARTtA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 14:49:00 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:16225 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240120AbiARTtA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 14:49:00 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JdfV21JQnz6x;
        Tue, 18 Jan 2022 20:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642535338; bh=SkUs0ebXeW/JGNVaeD68Y9y1sx/zclhAcLjcCN7r/P8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AWtyEFdwD9d3e6jsBqVQCNUYGtfsWDhonDF9ML9P3VRSZh+XCcOqv7WkeRjWD5/Dr
         agxVqtXXzGP+KD3uKvLY6pvsPrBZ4fdjgW3u9oF1YrZXBG82t5xQTJZ1sALPaNqDmT
         gFAxLiH+gJZD1JSnvo4haK241ECXNIBuHGOgzSEXpSWRHcytHUrc5OONi4v1jMMi2K
         FMr+snypjTgVFjh0UNSj9n7b4b61YPFe2cBc2F+5kicwsQvQ/HHBTfT6t88rdrokWp
         i3xkU+lM7hrsVKhcidguck6wRBxaNJtE7g+0/gYv++V/bQxSUeGROwdD6upkCXOD7D
         DaCTmQQLhMbPA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Tue, 18 Jan 2022 20:48:56 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: tegra: allow DVC support to be compiled out
Message-ID: <YecZqFqpEGy9eZAq@qmqm.qmqm.pl>
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <87d646818e2605dad62f82d73f8db3f61e70e1f0.1642348712.git.mirq-linux@rere.qmqm.pl>
 <1db263bb-c424-16b2-d435-2c5429eb7bb9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1db263bb-c424-16b2-d435-2c5429eb7bb9@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 18, 2022 at 12:46:39PM +0300, Dmitry Osipenko wrote:
> 16.01.2022 19:02, Michał Mirosław пишет:
> > {
> >  	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
> >  	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
> >  	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
> > +#if IS_ENABLED(CONFIG_I2C_TEGRA_DVC)
> >  	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
> > +#endif
> 
> You can use IS_ENABLED(ARCH_TEGRA_2x_SOC), and similar for T210. Then
> you won't need to add new Kconfig entries.

I can do that, thanks! Indeed, the drivers won't be useful with the
specific SoC support disabled anyway.

Best Regards
Michał Mirosław
