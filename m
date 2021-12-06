Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD739468F90
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 04:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbhLFDNx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 22:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235402AbhLFDNx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 22:13:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D13C0613F8;
        Sun,  5 Dec 2021 19:10:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 01939B80EFE;
        Mon,  6 Dec 2021 03:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C01C00446;
        Mon,  6 Dec 2021 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638760222;
        bh=LZYHcFhx3dYR89MBXO9JWQYZeFN9rEo7us39n5fpMgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dg4F5aXYffHbY7cTLcGBzXbEhX2Cg6DlKfoVZqPwPKmwXHLiVK/4rFoygdnyhCTkV
         IwapdbfAnFD65yW8xiCqVgVPn1v+h4ROpCKeVEFOi8AAKJvY3+Zl3uFjrlh98Q/Uez
         k63/fS/hqDzyaifyclwQ2DFPGahmGZuEFD1k3Lbo2tQgYfUq7oGqdpke7yXHmn96x8
         VWV1pbdLv+Ood6jPV/1SPCGknVauVLV5lLr+olZzCYkt9cVRfn0KUv19qS4H2Ieooz
         Yi7mYGUF4Hh+aHoWmNavRab1qzR05oksVswA0KX9fgvrTgWvM6+utWtZrjUbeVKUNP
         hVIviM50D0DXA==
Date:   Mon, 6 Dec 2021 11:10:15 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     robh+dt@kernel.org, aisheng.dong@nxp.com, s.hauer@pengutronix.de,
        ulf.hansson@linaro.org, broonie@kernel.org, linux@roeck-us.net,
        wim@linux-watchdog.org, linux@rempel-privat.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V6 5/7] dt-bindings: arm: fsl: Add binding for imx8ulp evk
Message-ID: <20211206031014.GC4216@dragon>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-6-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126074002.1535696-6-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 26, 2021 at 03:40:00PM +0800, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add the dt binding for i.MX8ULP EVK board.
> 
> i.MX 8ULP is part of the ULP family with emphasis on extreme
> low-power techniques using the 28 nm fully depleted silicon on
> insulator process. Like i.MX 7ULP, i.MX 8ULP continues to be
> based on asymmetric architecture, however will add a third DSP
> domain for advanced voice/audio capability and a Graphics domain
> where it is possible to access graphics resources from the
> application side or the realtime side.
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!
