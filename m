Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5277A468F9E
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 04:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbhLFDOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 22:14:48 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50748 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235660AbhLFDOr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 22:14:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5733FB80EDC;
        Mon,  6 Dec 2021 03:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42535C00446;
        Mon,  6 Dec 2021 03:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638760277;
        bh=qZ5ctq25tgpUTFTLFO5yqSLmLDWPG/7d+CfZf1haYJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a2ERqpCwH7ovJ7V2WOkblq8+RCWZzE/L1/XXsLW+9H+1LIBHnaiQCpaSSBY3hTzwO
         xlHk7fgDocZPu/65c3K8l8N/CQmXxsrbwQ2zrqRSIf57pRJpV+lWiNMi5O+FiPLeFJ
         UI9ZCinTiddu+mqtITZL3CfjiR09dllL9RGzgeCB+rxKuPjRuyoVjAyao5IrbRfvv/
         Sy3nt1hbNs7l6rOYb5lbisS3ol5+rk8WvAJqseSUeIXQowRkx+ZsRo8sovOOYLn65I
         8LS2wu0H58nMrjARdiHHylabF88yYQWC43yMqVI+bS1rXJ8bqfnu0RxOgmwLFw3ZCl
         ycschvohl5+vA==
Date:   Mon, 6 Dec 2021 11:11:09 +0800
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
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V6 7/7] arm64: dts: imx8ulp: Add the basic dts for
 imx8ulp evk board
Message-ID: <20211206031108.GE4216@dragon>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-8-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126074002.1535696-8-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 26, 2021 at 03:40:02PM +0800, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add the basic dts file for i.MX8ULP EVK board.
> Only the necessary devices for minimal system boot up are enabled:
> enet, emmc, usb, console uart.
> 
> some of the devices' pin status may lost during low power mode,
> so additional sleep pinctrl properties are included by default.
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!
