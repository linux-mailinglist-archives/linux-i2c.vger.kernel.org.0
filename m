Return-Path: <linux-i2c+bounces-7311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C49B99703B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 18:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA515285730
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412181AD9ED;
	Wed,  9 Oct 2024 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubTSdqyG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1E1925A0;
	Wed,  9 Oct 2024 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488131; cv=none; b=PnXAxWMc0BvykK9tz0d5OLbt6ozKyAEyZU+Jq3kKhqdfT1ayNgSVobSl0H5eUSz9hulfA2Z3H+DfGkhlJr5fQo6tOZ93mD1EUnkhU52xPX4THyTb9P8IrNIB7yA0Jv5yw4NvjU7xxoOP2KWJCvUda4hTdu98Nut+ucvWcEnK3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488131; c=relaxed/simple;
	bh=3YKf4wKe97IZuGPzRWJvZsU/s9xM8HMmlYnkvbFJI0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EwT32akgyE6666Cbf1n8HnyJu2rZKiActY0Crd0pX0Mdhwu8FkH6WQRkSE4ZiO2pJCdboxhhcLEdT4Bmbhe6063l05AQQ1m+/N44W2Ml6K2Nf1R6bSDw1ZPCVERvmI0TOsl7cfiDPshhdMjyXa7g6V03pz32yrItXPxXRVxRhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubTSdqyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D880BC4CEC3;
	Wed,  9 Oct 2024 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728488130;
	bh=3YKf4wKe97IZuGPzRWJvZsU/s9xM8HMmlYnkvbFJI0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ubTSdqyGo6z5z/ZicbAqro0XaI2uqoDHton7yrxCOJ5efww9Qgvg3PPesV7zgkmPv
	 BazLs0C6im+4Lygt+FLdjJEcFrqDJFFd5UKlLdh3qoaqGRBhL5E1QpC2COaKprk6Wu
	 S9kyamdWcuY0PHosV+KOpuDDxDvoa6lhCo43RvULn5bn+cSc7Mq8xjDo701cXJ+gLq
	 EoEHYn4YCDPWLvTH1fcsQz33nZuEjTPhPl+GscVEYNhHhr58apExEIeA9L2VYaaRRl
	 QLkVYBrMnTOia9LBc26h0cj3oNqZRYBPs8Jemy7Bvf3PNshornxsm8zaT9W6IBkSG3
	 TdSmAq+4cw8uw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
In-Reply-To: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
Subject: Re: [PATCH v3 0/5] Congatec Board Controller drivers
Message-Id: <172848812261.638400.481811844035668418.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 16:35:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 01 Oct 2024 13:53:26 +0200, Thomas Richard wrote:
> This is the third iteration of the Congatec Board Controller series.
> 
> There are only few changes for the GPIO driver (commit message, Kconfig,
> remove useless cast).
> I also rebased the series on Linux v6.12-rc1.
> 
> Best Regards,
> 
> [...]

Applied, thanks!

[1/5] mfd: add Congatec Board Controller mfd driver
      commit: 6f1067cfbee72b04fc42234f7f1588f838cec0b6
[2/5] gpio: Congatec Board Controller gpio driver
      commit: 4342bf63b64b09561f4ad1537de2e1a971cfb197
[3/5] i2c: Congatec Board Controller i2c bus driver
      commit: 6894f640b8f3f48700ccc828419ba60704f5a405
[4/5] watchdog: Congatec Board Controller watchdog timer driver
      commit: 6f264047869e9683520ff8f7c235c07c1ca989d6
[5/5] MAINTAINERS: Add entry for Congatec Board Controller
      commit: 590bcce85e014a2e16afe910bc6a20b4c1b2b374

--
Lee Jones [李琼斯]


