Return-Path: <linux-i2c+bounces-7727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6E9B970F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 19:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1F71C2136F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 18:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737E61CDA27;
	Fri,  1 Nov 2024 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y996Av5p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9213B7A3;
	Fri,  1 Nov 2024 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730484315; cv=none; b=gJYmv1WDnxXcYg5EGD8yuIBInc8Am9UEdRsj79zq1wvqJLG6yjiAbfW9DJ1Nb0j3g/TQu4EqJjxs5fSQ446u+ykLojuqOD3GKxlVN2oNimga5/xg8so0JSqatrXuPQ6f8zlNn06acPZRIg+tfGlDv8xamF4Lg5c2vJSMVXJxMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730484315; c=relaxed/simple;
	bh=sxzJoGRLlfvtsPBjmtNEBTQuFxqr0kCI/vso5w4LIY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnvQEmsYgyGxP8ugx6V5jMHlt7KYsbXIFQjqVFLiURNv/MVWUxmlzl48POz3Jkcx8If+nT0zUQRl4uqaxmbO1PQC5H+MIkcxvtXvvibdDWBvfqp0N89mV5YPumeF4L4prWo7zIY+V+ppzpYSQ6bsAQRdFlnE063CTgjt9Itypcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y996Av5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD63CC4CECD;
	Fri,  1 Nov 2024 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730484314;
	bh=sxzJoGRLlfvtsPBjmtNEBTQuFxqr0kCI/vso5w4LIY4=;
	h=Date:From:To:Cc:Subject:From;
	b=Y996Av5pLu8N6VEcgHMPDInjy6vZBykHHlBpNNeWMEnw3U4/atZ060piU800xRavc
	 c/WkY03lh0O4kHWGbvsZENBeAHEwXcYBEo9QvHqyFJM/21Ok0UXUkjnW8tN4o3JiGB
	 OoDxR6WfFvqbcQi8Dn+4w/tygl+yLlirQ7dTdBxiYfCvFI/nUW44iHhfDRLaqoUQ85
	 UsuNZx2ODNKMP7JB4I+iySkepv+HHbuMBHL5xEya/ctmCTTLYQX/gcZ+UgmiRh3vlQ
	 y6e69E+9W0AmliCknlm7tEDwPaWTcjfAakF08DmGHnoLjEFWyQW0lcbSiCXhcadwKZ
	 57joyzvZXniQw==
Date: Fri, 1 Nov 2024 19:05:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [GIT PULL] i2c-host-fixes for v6.12-rc6
Message-ID: <nqnhd2eb26lxm4ho5czgkjgnvorugixpzyvbw7pmle24wdn56f@a63bfcrj52k6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

just one fix in the muxes this week.

I wish you a great weekend,
Andi

The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.12-rc6

for you to fetch changes up to c4c4172fb9c2327262055cda171916e7a79fd7ff:

  i2c: muxes: Fix return value check in mule_i2c_mux_probe() (2024-10-31 13:06:02 +0100)

----------------------------------------------------------------
i2c-host fixes for v6.12-rc6

Fixed an incorrect error return value in the Mule Multiplexer.

----------------------------------------------------------------
Yang Yingliang (1):
      i2c: muxes: Fix return value check in mule_i2c_mux_probe()

 drivers/i2c/muxes/i2c-mux-mule.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

