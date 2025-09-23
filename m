Return-Path: <linux-i2c+bounces-13114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45EEB94F63
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 10:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABDE32E4F0D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 08:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD51131A545;
	Tue, 23 Sep 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mc11K5lt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4D3101A3;
	Tue, 23 Sep 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615657; cv=none; b=QG2vWf0KWU+xz/lNhnONPysltUqRMgdYMQ+IqCNjFiuMLU7R1s0BCrDDKXmPvk5PQP6ql1E22Ic43rnKHTvucRMeavHGtPdCWa5OSuXxl/ocNGZe3O4QZbxWrXBGePc4iq98x2DCP5pe7I3jwk8ApY2zYDVm2IIR7OQqRQRlVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615657; c=relaxed/simple;
	bh=tLyEr0eopslnhvUtyjtuRFQIrXOLW5XzwF8sJa4Av/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I4yspmzfqK2eXIeygN7hsG5JtQgfnqvmCwFj9H30VxuNj7rsLw3olednAVSgCcybgA6l/saK0YOtoxtD8sSfhESE/vZkynsxFlNNkB36oF1vobJGEYlqAT3W5VOIN7lxES5m6cbXdHrj3+I6zLJ1jfIwx7srCFDzeAEBqTQrOig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mc11K5lt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ED1C4CEF5;
	Tue, 23 Sep 2025 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758615657;
	bh=tLyEr0eopslnhvUtyjtuRFQIrXOLW5XzwF8sJa4Av/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mc11K5ltk2vLIQk8oIcDAhetyfcZnX+9Kegch7h2CgmRfHn+xfIuhjcHvQx+CAJ5p
	 nMGdub0BWOLmQ/e1e7VcOmkcWT2EWmlqPx6bj1b/XCnX2naW5N7QxMU+6CfeWZC0DL
	 YmY4zct5FGRtzCjzxAAiYfB+TB09Soli2Zb+NfxqLFZj4AQHNVvOBUdOrUtJEpAGRq
	 y2XvU3LYYmdSSGooeMtjvVA+Ht1XK6k2eKf72pYz+x/A3WU9Qjc1XUS4iDGjU/hU+T
	 1CZYlYK6EmlNnG8EfSC35iCONqNR82rAm3Gp7GrZpiN0P/RonKnE8ixPtDQ92y0d1i
	 MaXAcDI2kewLA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
Subject: Re: (subset) [PATCH 1/5] usb: misc: ljca: Remove Wentong's e-mail
 address
Message-Id: <175861565278.978616.15497621660014386014.b4-ty@kernel.org>
Date: Tue, 23 Sep 2025 10:20:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Mon, 22 Sep 2025 15:06:28 +0300, Sakari Ailus wrote:
> Wentong's e-mail address no longer works, remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[4/5] spi: ljca: Remove Wentong's e-mail address
      commit: 878702702dbbd933a5da601c75b8e58eadeec311

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


