Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2183F48FE53
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 19:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235948AbiAPSDk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jan 2022 13:03:40 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:22170 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232590AbiAPSDj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jan 2022 13:03:39 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JcNFP47TWz31;
        Sun, 16 Jan 2022 19:03:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642356217; bh=OCX8RQVXW+Ih2SExLOFC0/hrP5roomVpY2akm3RUlpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TSNDiFZGl7ZGtPSW/LGnN9E+RzRlD98lm5qyJVJn+KM+0M/sDQxjIEFl6go+2keNY
         JT6spAs5MHYvVMzS2OyWa/c2jhIXQmquWXY97JTvgc4Fe4lD3GPkbJeCACltAy3Ug5
         36aDAd/NBrZ+33pzEWA1xtOHeejcRhT5ueTJompo9hVR2ThgQRTqc7MWKuO+eUmCaB
         0E4DauS2pTixk8YedGezzorNMVgO7Zks988oljbpL4BcUq3P4J3we/csKGig14oEsf
         zKLAJab6KtkxF/vmz4e0m+LW+D5BpxuS+ERvH2tCN5zBoFcnuYVa6c9tEbAaT4UALy
         hVvuy7XZifhxw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Sun, 16 Jan 2022 19:03:35 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's
 special constrollers
Message-ID: <YeRd90gLqtsz2zVV@qmqm.qmqm.pl>
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jan 16, 2022 at 08:54:08PM +0300, Dmitry Osipenko wrote:
> 16.01.2022 19:02, Michał Mirosław пишет:
> > To patches that, combined, reduce I2C driver's code by ~2kB and a bit
> > from runtime overhead for non-Tegra20 or non-Tegra210 builds.
> > 
> > Michał Mirosław (2):
> >   i2c: tegra: allow DVC support to be compiled out
> >   i2c: tegra: allow VI support to be compiled out
> > 
> >  drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
> >  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
> >  2 files changed, 38 insertions(+), 13 deletions(-)
> > 
> 
> 2KB is a too small difference to justify the ifdefs and Kconfig entries,
> IMO.

Maybe I should have mentioned that it's ~20%? With my "embedded" hat on:
I think it might be small, but sometimes it is the difference between
bootable kernel or one too big.

Best Regards
Michał Mirosław
