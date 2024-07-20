Return-Path: <linux-i2c+bounces-5039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB5937FFC
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 10:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EF7AB21418
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0A73AC1F;
	Sat, 20 Jul 2024 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vB7kriMi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB437169;
	Sat, 20 Jul 2024 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721464161; cv=none; b=e5BmVtDH2zbGgY3G+LNL1YKuH3WmSkE+zR4pzwv0/1Muzr1pmxot76H33Kh4G7IyZ7T1PV99+79vK1kWeiQqkPsRlrTYDZ8giSNMXneA850lJblxlHkmx5bJTx/sbm6XeuHGuZvD2VIJ/1hsP09u1c727Ul8cNnc9sYi+6U6U1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721464161; c=relaxed/simple;
	bh=aAQEjlXOltc0/pkPeHWr9qyxi8t5CaKmx45v9GG3HA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBGIdXGoc0Uvi4eeKaz1j7z6qVs46HAsooP4RndH+Yosqv8MiFQJ27J5C2MMps0coMQq639PBTn3RMFa7InqBmCFVpG8WbUC0nTuwcWbwMXbHQxLTTwY7OnLvf16Q8PUUvvQX2E+1DtIhdAskC/9xESjvY2km9URT6ur+RdH3KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vB7kriMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E07C2BD10;
	Sat, 20 Jul 2024 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721464161;
	bh=aAQEjlXOltc0/pkPeHWr9qyxi8t5CaKmx45v9GG3HA0=;
	h=Date:From:To:Cc:Subject:From;
	b=vB7kriMio2aSHdArzi+VO5iDl1qlfGPa8ytf0te5H3oRzFDDaZeTKyGrh9y8a4tIE
	 miinklfO5Cy6Ff8cmLTy84VAv61irBXs4hXeNZB6BtYw26uiZiIvcFSxwrpNfIAfQa
	 PRWp4suU6tdl1f7CxtuMveXIplZ0Z+XwEEAlXIwwlaGsng9BEA6FPl0nvf4UuaIRgT
	 tu/Al8HfS/9j+uy840T3N5lBr0ypuUwv/UQsIovrDo+aZZquRz+PjI09pVFghbKr+s
	 8zXySBfJ48PtZ8eW+p7vgtdykCChiHIDTx72xSiW3MoK5JzaXPlMAXNovpuvomNCda
	 bDOpntVkNxdRw==
Date: Sat, 20 Jul 2024 10:29:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.11 - part 2
Message-ID: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>
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

here comes the second part of the merge window pull request. I
waited for Linus to take the first part so that I could send this
pull request on top of the mainline.

Until now I was on top of your i2c/for-mergewindow branch.

Thanks and have a great weekend,
Andi

The following changes since commit 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74:

  Merge tag 'input-for-v6.11-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input (2024-07-19 16:51:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.11-part-2

for you to fetch changes up to 930e5186862b115953fb560be357f4e0bf496f94:

  i2c: piix4: Register SPDs (2024-07-20 03:07:56 +0200)

----------------------------------------------------------------
Added descriptions in the DTS for the Qualcomm SM8650 and SM8550
Camera Control Interface (CCI).

Added support for the "settle-time-us" property, which allows the
gpio-mux device to switch from one bus to another with a
configurable delay. The time can be set in the DTS.

The latest change also includes file sorting.

Fixed slot numbering in the SMBus framework to prevent failures
when more than 8 slots are occupied. It now enforces a a maximum
of 8 slots to be used. This ensures that the Intel PIIX4 device
can register the SPDs correctly without failure, even if other
slots are populated but not used.

----------------------------------------------------------------
Bastien Curutchet (3):
      dt-bindings: i2c: mux-gpio: Add 'settle-time-us' property
      i2c: mux: gpio: Re-order #include to match alphabetic order
      i2c: mux: gpio: Add support for the 'settle-time-us' property

Thomas Weiﬂschuh (2):
      i2c: smbus: remove i801 assumptions from SPD probing
      i2c: piix4: Register SPDs

Vladimir Zapolskiy (2):
      dt-bindings: i2c: qcom-cci: Document sm8550 compatible
      dt-bindings: i2c: qcom-cci: Document sm8650 compatible

 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml |  3 +++
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 20 ++++++++++++++++++++
 drivers/i2c/busses/Kconfig                              |  1 +
 drivers/i2c/busses/i2c-piix4.c                          |  9 +++++++++
 drivers/i2c/i2c-smbus.c                                 | 15 ++++-----------
 drivers/i2c/muxes/i2c-mux-gpio.c                        | 14 ++++++++++----
 include/linux/platform_data/i2c-mux-gpio.h              |  2 ++
 7 files changed, 49 insertions(+), 15 deletions(-)

