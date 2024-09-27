Return-Path: <linux-i2c+bounces-7065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F99888C7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 18:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83271C2147F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 16:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CE61C0DFB;
	Fri, 27 Sep 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEWNQEBl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208521465A9;
	Fri, 27 Sep 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727453480; cv=none; b=XTXfNfVYQc2HqJgMijP3PijGQg6y/bI4XIhBmZ8OVrHntLxFQrFvKqafZZ3wrOmVzT1tfuUkrDtNEr97bM2xQZEm4Fw/clAQorZcJJrnKuOatCiRYfeHIFmbkR1LJVtR2CwP7doTXOZJExQ1zobJAFHWsXAk5zZRBjP7P+0Aehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727453480; c=relaxed/simple;
	bh=hwp80xBchlI8d2f9lwe2QEBUTSB5l/Wm7VirPgWz14A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kElloaC1kBfmPQAUevGA4xk79yaOPqlOLCr59fOCoQv9VAfSNkU+R71Qhvcxqp39RRiMuDyZvDMjUZ4xDyAzR8k2kdFFMtRR+5S58248iTo/rS+lcPJpbZFQvw3yj86INZcJsaNVRmrqO/rxoCtWreWTldWEhiy6F/ktMXrf27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEWNQEBl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5744C4CEC4;
	Fri, 27 Sep 2024 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727453479;
	bh=hwp80xBchlI8d2f9lwe2QEBUTSB5l/Wm7VirPgWz14A=;
	h=Date:From:To:Cc:Subject:From;
	b=cEWNQEBlcEbXXOlokGljq+k9krehExZeorzMFcf3G0Y4ph/CFdeZwSv1ua+2A2Qy3
	 MlqI4nSabh24akaJ8pIPuDY1/duINvMlOKYiq/cc9dljfy1ob10RvC8ZG/hxYnjKzD
	 NYbYUCfaQaUHBVAZlvxTlcwLAsJUC07JFE1EhaK6BC3VIWbaZcLtFaQg0TVzUVMI4T
	 uGvRAn+lW/B2XIhHNAV21dA8T9m43VmKzosrjI9fLao7siYJIJLa6WXNi+x0L/hny9
	 npMQdgken7NklVGJNUbyhUBZYU9QvC6Dw5m/OBNIqbeIUHLX8fw8U0gAjO9Grt49di
	 0o7hCARQZJjLw==
Date: Fri, 27 Sep 2024 18:11:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [GIT PULL v2] i2c-host-fixes for v6.12-rc1
Message-ID: <dds7o67mr46dyam3kfwrts55hy3dxednkdchwmiss7fztvaywj@6p5ewwdomlz2>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

I’m resending this pull request with some formatting adjustments
based on Andy's suggestions.

Thank you, Andy, for your advice!

Andi

The following changes since commit 4e2c9cd7dce6c7480f236c3ead196ff4e92ed597:

  Merge tag 'i2c-for-6.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux (2024-09-23 14:34:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.12-rc1

for you to fetch changes up to 0c8d604dea437b69a861479b413d629bc9b3da70:

  i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled (2024-09-27 11:48:21 +0200)

----------------------------------------------------------------
I2C host fixes for v6.12-rc1

The DesignWare driver now has the correct ENABLE-ABORT sequence,
ensuring ABORT can always be sent when needed.

In the SynQuacer controller we now check for PCLK as an optional
clock, allowing ACPI to directly provide the clock rate.

The recent KEBA driver required a dependency fix in Kconfig.

The XIIC driver now has a corrected power suspend sequence.

----------------------------------------------------------------
Ard Biesheuvel (1):
      i2c: synquacer: Deal with optional PCLK correctly

Geert Uytterhoeven (1):
      i2c: keba: I2C_KEBA should depend on KEBA_CP500

Jinjie Ruan (1):
      i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled

Kimriver Liu (1):
      i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled

 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-common.c | 14 ++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-synquacer.c         |  5 +++--
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 6 files changed, 58 insertions(+), 3 deletions(-)

