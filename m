Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09CA13266B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgAGMi6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:38:58 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11015 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbgAGMi5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:38:57 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147bcf0000>; Tue, 07 Jan 2020 04:38:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:38:56 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:38:56 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:38:55 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:38:55 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:38:53 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Mikko Perttunen" <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/9] i2c: tegra: Fix suspending in active runtime PM state
In-Reply-To: <20200106010423.5890-2-digetx@gmail.com>
References: <20200106010423.5890-2-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <e2342be158e84496ba99ec26ad506292@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:38:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400719; bh=yUlzoUmEWEuVYLFL8uw99xkZj0/vPM8e/0q6WO3gKUg=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=cyF0l7Y7WvqE7gvJa5F8TwWyj4PVWBYayuhS9kPFxWXoJHP5gVYsKTKqzxqwutDni
         IK0w8D3O5OapHRSsR9ZGxGhZAAWhVqR833ZxWTokf7VcGN8u9hXb41NEn3qNBkM9Py
         xc5nfIOftOSWInnbqY8vpMjvtglUYhOYddJF1Y7qolnpTan5TcZwOVI6YG0itLN+YG
         /6zBBThTOgLcTEw7bld3d4II043z7FVG3dmokLGRknHrc7W1XZJQhFAs/p1dxojWer
         4CemF4alnZPBDP7bSXVcCA+V7/iRmnrqTnjlIZBCAOvg1tZqZSb6cFLXthQsyqDzfS
         4AHlm9GkuwLEg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:15 +0300, Dmitry Osipenko wrote:
> I noticed that sometime I2C clock is kept enabled during suspend-resume.
> This happens because runtime PM defers dynamic suspension and thus it may
> happen that runtime PM is in active state when system enters into suspend.
> In particular I2C controller that is used for CPU's DVFS is often kept ON
> during suspend because CPU's voltage scaling happens quite often.
> 
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Tested-by: Thierry Reding <treding@nvidia.com>
