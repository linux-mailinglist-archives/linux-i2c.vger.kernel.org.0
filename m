Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C3B468F9B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 04:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbhLFDO1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 22:14:27 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50554 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235673AbhLFDO0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 22:14:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C5F4B80EFE;
        Mon,  6 Dec 2021 03:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5C5C00446;
        Mon,  6 Dec 2021 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638760254;
        bh=/KpvftyM/7pqLcTG4cMnRJ/Day9VweXq3JvZ+3NARpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D2oq72S+C+zX70F9fsBfid15cxe5Pa3wEiDkxU8eLbiBe7DL99xXrt5m/kRBZ6qba
         B+5QSNoH3jzvqx0H6Lz6hQGETuYLKcEmJBjA/B3sPsycbhisfrQ8eI6InSn7ekO0zO
         RDiPsiphBrnAzVZnZWRCnQ9FJkJzBnqOkSzh2+eBYnhuqMl0CwpScHEpJeyRr3RUZZ
         8z+TTXu8jg6frWRjFeWrBo6oXk6Gd1509hT+PkfnW3sDOs9bMvU5w63m/kVlp2Z6Wh
         aWGdFgTE+CHW5iueuADFUsA4NCqvbA8qqLUYY97pXlahW/nFJ3Szb4DZ26DDNMCC2d
         BjnNJMumfRzlQ==
Date:   Mon, 6 Dec 2021 11:10:46 +0800
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
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file for
 imx8ulp
Message-ID: <20211206031046.GD4216@dragon>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-7-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126074002.1535696-7-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 26, 2021 at 03:40:01PM +0800, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add the basic dtsi support for i.MX8ULP.
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
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thanks!
