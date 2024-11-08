Return-Path: <linux-i2c+bounces-7903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D69C24D9
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 19:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0A5283257
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 18:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6808E192B6F;
	Fri,  8 Nov 2024 18:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QraTUNJr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6B233D60;
	Fri,  8 Nov 2024 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090199; cv=none; b=akxTbvBLmleI1WIy6vfPds3jf0yWBvlZ0pZT8lG7n2wss+R9qwm7CjyaMS050tOEluI6+dnu9XuLSyhXqo6DJv8eEv11lEqnd6I2Vmv5p+7cXVJrjm02uUD6H1ipob1g7i4H+bQ9wxCLLFPmjzNIN/WU7H2OCPNtaqLAg38fGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090199; c=relaxed/simple;
	bh=eGOwjOJlqgnf58z56wkJF0jcGe3ezBtB3M10NACI6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPJpJKqYx7W1HWjYwp7EMU6YjfEQnHDBjMS2bn/MScgYkogT5wvfUES6vIqwvBW412rynMZWrseap2OV1mo7mUexpL/h4infrjSt4BeddX4MaAHN6KDQNTpX7F/r+H/XNbh/HPC6oBAYNjA+gELpJmCZiZ3MhB5LaXeBqXaztA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QraTUNJr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8D0C4CECD;
	Fri,  8 Nov 2024 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731090197;
	bh=eGOwjOJlqgnf58z56wkJF0jcGe3ezBtB3M10NACI6Gs=;
	h=Date:From:To:Cc:Subject:From;
	b=QraTUNJr+IRqtCXH2lH1Wa2lOI9da8W/cFBzH80R31T30IN5WofyvdZMUWYd9kx6g
	 +Gb4Ylbi2EvVJ2oiuPL4E6GLPSy5xv7feLnBNpqxW8TsM0YwUPV7JrMts5AyLcMiAb
	 wHjWRUzt6cl2+IkJ6rnv5QfKKsVA/rINUGZrhfy1/al7lsiSPyDYQi+bVThSIRYZg2
	 J0mgOFXtEwQPJYA/qCVYAgmQuaVMaeYtqgu3vBCVYiHyOWBp4DAHKwR/msQ6/CB2SY
	 jz1swf/66ryjekXKUi36es088GdKBuhTOXbcSQ2kc/ZnA2f8BGbJb4Tde3TBepPeZT
	 GsaZfBTGfGFAw==
Date: Fri, 8 Nov 2024 19:23:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.12-rc7
Message-ID: <mulwdseybgm5uo4ml5zsurp4wno6afjwbi4miz4dm5zc4whtav@fqlocb6allqv>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Two fixes this week: one is the fix from last week that you had
doubts about.

Thanks and have a great weekend,
Andi

The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.12-rc7

for you to fetch changes up to 8de3e97f3d3d62cd9f3067f073e8ac93261597db:

  i2c: designware: do not hold SCL low when I2C_DYNAMIC_TAR_UPDATE is not set (2024-11-08 19:13:06 +0100)

----------------------------------------------------------------
i2c-host fixes for v6.12-rc7

In designware an incorrect behavior has been fixes when
concluding a transmission.

Fixed return error value evaluation in the Mule multiplexer.

----------------------------------------------------------------
Liu Peibao (1):
      i2c: designware: do not hold SCL low when I2C_DYNAMIC_TAR_UPDATE is not set

Yang Yingliang (1):
      i2c: muxes: Fix return value check in mule_i2c_mux_probe()

 drivers/i2c/busses/i2c-designware-common.c | 6 ++++--
 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/muxes/i2c-mux-mule.c           | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

