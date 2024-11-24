Return-Path: <linux-i2c+bounces-8165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878899D6D5A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 10:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6A36B2111F
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2DE154C05;
	Sun, 24 Nov 2024 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+VjuBz3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B133987;
	Sun, 24 Nov 2024 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442101; cv=none; b=o6Wh505r61n1d83L8ukzCWCmpgAFHDeXj7hD5IYGtaO/SJpcgZmXivZxz42Xva90BUUi1+ahscRrynbO07wchywRtZtHa3iOL0By3u2mWP8Viw8rt2adoKEgnp8j1Zwy7eUrt9VHnrUc+BqBeSeu5iHDveIh6WbLmBrhU7MBv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442101; c=relaxed/simple;
	bh=Ju2NM1n+0JxWamVT9l0hVU7x1rv4ubx8xQIT9My6QYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHbQUAhkdnYFIxeuw+6GITXN960U+/+ZMggJnF2El4gXmcPSfTviWGqRYVef1tBBU3N2ZoM1TexdAcHdSENJaDEvvLXvYPAvDlyfbBMcafIjAlbszzcndZhQPYNFpSTkrJTewQJOJEjWt/eSmLOUxijJ6BWKiO4W0P8MlsKgAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+VjuBz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9148C4CECC;
	Sun, 24 Nov 2024 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732442100;
	bh=Ju2NM1n+0JxWamVT9l0hVU7x1rv4ubx8xQIT9My6QYk=;
	h=Date:From:To:Cc:Subject:From;
	b=V+VjuBz3M2ue73E7lMnXXRLpEMM7hgAd7mSeeavHv32Y2D95Hs8++0LfMS/raknvk
	 sPP9tCyUWBysl99B9STd1INyd6TJj7a4sQ9YAetrlz/qoIq/b5NAhoaUX0L7FnsNHc
	 l+g3WsY4ivUDcV14eg04YW05wmZ9gj9s8LF7KuDqQTrquQanBCYd4+oGFIed0c1zZR
	 bM72NbA4bmwELwWeXgI8m8+g45R8LLQ79N2feK+VkXlvuSGgxPwkdTxOBbx08vWs3f
	 kSdGKUFx77j8nwecyrmzJ8Fj0iOqg2Lfy64NWHUgV1jd0GlT9Ax8t9up1XYkgufeU8
	 5Tvf6A2bNrI7Q==
Date: Sun, 24 Nov 2024 10:54:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.13, part 2
Message-ID: <bomhuajtvdsac6bsb5di6sixmr7pflgnmy7axmbpo6qwswm27d@bjwwk3mr5tbu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

please find the description for the second part of the pull 
request.

Thank you again for accepting this second part. I believe we've
now included all the accepted patches for I2C. For the next
release, I plan to focus on clearing out leftovers from the past.

As always, feel free to advise or correct the tag description.
I'm always open to suggestions and never bothered by them.

Thank you,
Andi

The following changes since commit 1b3073291ddbe23fede7e0dd1b6f5635e370f8ba:

  Merge tag 'i2c-host-6.13-p1' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow (2024-11-18 08:35:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.13-p2

for you to fetch changes up to 68e7aa7ae92f5d5af1a3bfd0aae566e687b980fe:

  MAINTAINERS: transfer i2c-aspeed maintainership from Brendan to Ryan (2024-11-22 22:17:43 +0100)

----------------------------------------------------------------
i2c-host updates for v6.13, part 2

Improvements and refactoring:
 - Qualcomm I2C now uses the generic device property functions.
 - Nomadik controller updated to use of_match_device().
 - Fixed the Baud Rate Counter (BRCR) calculation and handling in
   the Nomadik controller, enabling support for frequencies above
   1 MHz.

New feature support:
 - Added support for frequencies up to 3.4 MHz on Nomadik I2C.
 - DesignWare now accounts for bus capacitance and clock
   optimisation (declared as new parameters in the binding) to
   improve the calculation of signal rise and fall times
   (t_high and t_low).
 - Added atomic transfer support to the Xilinx IIC controller.

New Hardware support:
 - DWAPB I2C controller on FUJITSU-MONAKA (new ACPI HID).
 - Allwinner A523 (new compatible ID).
 - Mobileye EyeQ6H (new compatible ID).

Maintenance:
 - Ryan replaces Brendan as the maintainer for the ASPEED
   controller.

----------------------------------------------------------------
Andre Przywara (1):
      dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string

Bartosz Golaszewski (1):
      i2c: qup: use generic device property accessors

Brendan Higgins (1):
      MAINTAINERS: transfer i2c-aspeed maintainership from Brendan to Ryan

Manikanta Guntupalli (2):
      i2c: xiic: Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume to facilitate atomic mode
      i2c: xiic: Add atomic transfer support

Michael Wu (2):
      dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk freq optimized
      i2c: designware: determine HS tHIGH and tLOW based on HW parameters

Théo Lebrun (6):
      dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
      dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <= 3.4MHz
      i2c: nomadik: switch from of_device_is_compatible() to of_match_device()
      i2c: nomadik: support Mobileye EyeQ6H I2C controller
      i2c: nomadik: fix BRCR computation
      i2c: nomadik: support >=1MHz speed modes

Yoshihiro Furudera (1):
      i2c: designware: Add ACPI HID for DWAPB I2C controller on FUJITSU-MONAKA

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |   1 +
 .../bindings/i2c/snps,designware-i2c.yaml          |  18 ++
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    |  13 +-
 MAINTAINERS                                        |   2 +-
 drivers/i2c/busses/i2c-designware-common.c         |   5 +
 drivers/i2c/busses/i2c-designware-core.h           |   6 +
 drivers/i2c/busses/i2c-designware-master.c         |  23 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   1 +
 drivers/i2c/busses/i2c-nomadik.c                   |  87 ++++---
 drivers/i2c/busses/i2c-qup.c                       |   4 +-
 drivers/i2c/busses/i2c-xiic.c                      | 287 +++++++++++++++++----
 11 files changed, 348 insertions(+), 99 deletions(-)

