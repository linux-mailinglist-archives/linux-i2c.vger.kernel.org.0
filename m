Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF65513267E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbgAGMjU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:20 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11055 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgAGMjS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:18 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147be40000>; Tue, 07 Jan 2020 04:39:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:17 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:17 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:17 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:14 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Mikko Perttunen" <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 7/9] clk: tegra: Fix double-free in tegra_clk_init()
In-Reply-To: <20200106010423.5890-8-digetx@gmail.com>
References: <20200106010423.5890-8-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <8dcca34c74c341cfb86ed8b2a914953e@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400740; bh=uBmwjQ9lsKAbtgB1s/7SapzKraayGy+WnllL76sXA8I=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=Rme7GQs70el4cB5YQMPZ9VtqS2hTN5yUiXDct8F2EVJpXeiKZ05Ru40HrzsWVfgGF
         5dzSni9gXIDApSeDYUNiHov+ZoyM6Wa2PHAn7J/36SFiv3xvy9KozG3NqnTgEH33oQ
         qJLQpgBRljFKfKxfURmO9jQwOQDlOIgJ+OTPozyklV+4HQ8yCtNvsFfGaAMVHAfsSW
         3scgG5JcBtXVdXBj7s3pP8JRNvUPCRTkeTtVJXaey9IKheSSq4RtSqLDPgvv6co7Xx
         b0GNTKQE6wFeV3NaQ7cI9kLBhIHBhKH/+/p6Uxn2KaSRjFsY7rnp42QmAfY7XC5uja
         J05bZZz0Xt37w==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:21 +0300, Dmitry Osipenko wrote:
> It's unlikely to happen in practice ever, but makes static checkers happy.
> 
> Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra210")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Thierry Reding <treding@nvidia.com>
