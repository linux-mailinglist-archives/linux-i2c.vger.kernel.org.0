Return-Path: <linux-i2c+bounces-594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F5802844
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 23:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8671C20935
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 22:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D03A1A261;
	Sun,  3 Dec 2023 22:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9DWCNur"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5616916438
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 22:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5269CC433C7;
	Sun,  3 Dec 2023 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701641089;
	bh=yWVNt5na0IVZTKjNq/PoOUxkD5DWSVWmT3XXg28BXJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9DWCNurQ+NPd32Cg/gr6daK8b5ofUHuEIyMagA2pAlqgcX/8c8+pm9dVeXSfa0w8
	 JA23gBI3vLChVAws7Eh1+2rGGxmD3G/MpzkNFpd7UM4h6wH9SHIeyt3FOdXZzVCTH1
	 y4Ldt8zCldr6OApgwJdRvZAetLaI6v5T896kTq39z9vCm+/XpeROmsE1YyFy/P9+Dx
	 4QhAypMpA6ji+JSB2R41y3NPRAxo97LZuU3ehI1xWgudAfv8Js6uClOmcWi7Dbld0w
	 xmAi32xaXCP3Mx5PeIIdyDzVn45Ki3E8OkZu5aPKvr2qWoqXSoIHOjeyr8wEVPg4m2
	 RI1dW+x4Qy6nA==
Date: Sun, 3 Dec 2023 23:04:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] i2c: imx: Make SDA actually optional for bus
 recovering
Message-ID: <20231203220444.thaeuyqyv36hpv2y@zenone.zhora.eu>
References: <20231130095751.65773-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130095751.65773-1-alexander.stein@ew.tq-group.com>

Hi,

On Thu, Nov 30, 2023 at 10:57:51AM +0100, Alexander Stein wrote:
> Both i2c_generic_scl_recovery() and the debug output indicate that SDA is
> purely optional for bus recovery. But devm_gpiod_get() never returns NULL
> making it mandatory. Fix this my calling devm_gpiod_get_optional instead.
                               ^^^^
as Uwe pointed out, /my/by/.

I think Wolfram can fix this before taking it.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

otherwise:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

