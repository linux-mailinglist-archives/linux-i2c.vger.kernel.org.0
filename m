Return-Path: <linux-i2c+bounces-7320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0779980D7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 10:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35F0282B69
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 08:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB531BE856;
	Thu, 10 Oct 2024 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/C4/1ya"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3C1BDA9A;
	Thu, 10 Oct 2024 08:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549624; cv=none; b=I/P/xkcSn7F/MQifCuW4l6fPfuM57AExwBnPQm7djhUDZxf5v2P2xgUUyLobRQ6eFhK5ZTEeqxo3VQD97jHySHqfIM1F9B+7S0cCtLWRxfUHdt1UX6sKJwi6KEAU1KiJEPQXea4Z+LJjuQNj6Ri1pbZ+tBsdr54wuIWeiQSjyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549624; c=relaxed/simple;
	bh=d5L3ruuzQE3YNWbW1AZiD2NWXlJdaPiW0Mdntpz1t0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a60Y85Wr89qxy7KNe0o64/QragkEvE46tpjic0QdsGhqufkDmcxIXZCbnqQoz1pU6gmVeJmSxwnFuICUYbOQuHeBLDnEV9hgLaPg+tAZ358oG/3NrfOHXZsbXmqmvtoIQy7gwmS9DnEWthE5JOqawSSxTxigfpGqARkQqowh6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/C4/1ya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E2DC4CEC5;
	Thu, 10 Oct 2024 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728549624;
	bh=d5L3ruuzQE3YNWbW1AZiD2NWXlJdaPiW0Mdntpz1t0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/C4/1yaqz+mi9cq7KqNX8F6rlQVWOjWPeNT/kVk7qVvOs2fywYWQWdmd1RpI+d8F
	 bmdJKRK1nf/MUn4W4/SCsDwciu56hdxv2tlU5uk28DUKs16wkwe5bk1eQRx6lEORUJ
	 eGRRTAzcXHU6SneBtGNObhBg/ktMjlDYNWwpG14qjWXXWN1HMQQcaAulxmvBxxFnVG
	 J52QxMRGE0qtJajEyO4FCZr9ADZKZnIjE8xvD2a3uc1X8xPgHCS9qAm4Tgrs4sbI6X
	 2DCgVXiWjRHi/mdfwul8yP721WIc04iPIl/jKRhWJ2ZbUzYoKhEnyZ+7UH/8d5NzX9
	 gKdMywKrO3nUQ==
Date: Thu, 10 Oct 2024 09:40:19 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com,
	blake.vermeer@keysight.com
Subject: [GIT PULL] Immutable branch between MFD, GPIO, I2C and Watchdog due
 for the v6.13 merge window
Message-ID: <20241010084019.GF661995@google.com>
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>

Enjoy!

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-gpio-i2c-watchdog-v6.13

for you to fetch changes up to 590bcce85e014a2e16afe910bc6a20b4c1b2b374:

  MAINTAINERS: Add entry for Congatec Board Controller (2024-10-09 16:32:13 +0100)

----------------------------------------------------------------
Immutable branch between MFD, GPIO, I2C and Watchdog due for the v6.13 merge window

----------------------------------------------------------------
Thomas Richard (5):
      mfd: Add Congatec Board Controller driver
      gpio: Congatec Board Controller gpio driver
      i2c: Congatec Board Controller i2c bus driver
      watchdog: Congatec Board Controller watchdog timer driver
      MAINTAINERS: Add entry for Congatec Board Controller

 MAINTAINERS                   |   9 +
 drivers/gpio/Kconfig          |  10 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-cgbc.c      | 196 ++++++++++++++++++++
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-cgbc.c | 406 +++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig           |  12 ++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/cgbc-core.c       | 411 ++++++++++++++++++++++++++++++++++++++++++
 drivers/watchdog/Kconfig      |  10 +
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/cgbc_wdt.c   | 211 ++++++++++++++++++++++
 include/linux/mfd/cgbc.h      |  44 +++++
 14 files changed, 1323 insertions(+)
 create mode 100644 drivers/gpio/gpio-cgbc.c
 create mode 100644 drivers/i2c/busses/i2c-cgbc.c
 create mode 100644 drivers/mfd/cgbc-core.c
 create mode 100644 drivers/watchdog/cgbc_wdt.c
 create mode 100644 include/linux/mfd/cgbc.h

-- 
Lee Jones [李琼斯]

