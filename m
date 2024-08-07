Return-Path: <linux-i2c+bounces-5199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B094B373
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 01:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FBE21F2253B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 23:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB36E1553AA;
	Wed,  7 Aug 2024 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKa+PcGu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775A313C8EA;
	Wed,  7 Aug 2024 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723072464; cv=none; b=dBlASPiRqZyLRJ9Vp8IcNAs/uPrkAcpHtOMm1dkXuNqLyf0ux2YRNn7l5zGkuTWwD88AFftetFxpsuNnSrFMK5d4dYwd5fmJq+hoYQTd00HrCbKpVX0p29PFCOcfP7eX5CDC95cxbIkuOILRmzITrRSPKy80p5ub6Kvf1uKOZ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723072464; c=relaxed/simple;
	bh=MMApE+y1i7TH7kcZ40ixxUx/3NG1Vliy3cWf2maCfB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKSQuUZ4nT+43mztvkvRCiPPzQxBQCti5gXC52pv4skYxFzKItoKlOzzpKvUZAN0uirRjQvNzPNsOzXp7LFZbHHd1z1IUMyopo5ZAoIdT3jWlGCR9ubJrQGvUADuSZzwf9nKwI/dzwrY9vLhBKNLbcZ6Mo+bGjKHxpeim9K6Mao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKa+PcGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46A9C32781;
	Wed,  7 Aug 2024 23:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723072464;
	bh=MMApE+y1i7TH7kcZ40ixxUx/3NG1Vliy3cWf2maCfB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKa+PcGuo/Dhror5cMn2zoQ8FexRnmFm3o1ZnK9g8G8+ueTpV4uForWkP5f1o5/P+
	 dBymeQJ5sRti6IRQ5L6LQXA66qIgbuIlDp/+kPjC0Zgs7K5nzE5yQs+AYGG9VFPcQe
	 Rq/g8/Utb26N9rGhqXbrDN169YoXJiC3O7YD7T+7eSnBFWhtbXii/1UIuC7iuLH1T5
	 TAGRD5W723gCYRSZhMQqXGPa+t9ZjOsGGW7SgKdAxexjBweQi01quk29K8KVLvVVTb
	 OLJiveMgNZNU0U/B7GTZd7MqdZIjlS5a6l7hl88k+P+CdMtnpTokfBhBGpTO89Kor1
	 pAMRnA5lVNclg==
Date: Thu, 8 Aug 2024 00:14:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org, lee@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v2 0/2] Add support for Congatec CGEB BIOS interface
Message-ID: <qqb5ho7urmhy6e55efu3uxiz4gupikhiqgngilzx35djfgouf2@wlo336gdkoer>
References: <20240801160610.101859-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160610.101859-1-mstrodl@csh.rit.edu>

Hi Mary,

On Thu, Aug 01, 2024 at 12:06:08PM GMT, Mary Strodl wrote:
> The following series adds support for the Congatec CGEB interface
> found on some Congatec x86 boards. The CGEB interface is a BIOS
> interface which provides access to onboard peripherals like I2C
> busses and watchdogs. It works by mapping BIOS code and searching
> for magic values which specify the entry points to the CGEB call.
> The CGEB call is an API provided by the BIOS which provides access
> to the functions in an ioctl like fashion.
> 
> At the request of some folks last time this series went out, CGEB
> now has a userspace component which runs the x86 blob (rather than
> running it directly in the kernel), which sends requests back and
> forth using the cn_netlink API.

this little paragraph is the closest to a changelog I can see.
Could you please write up a real changlog and list all the
changes from v1 to v2?

You can do it as reply to this e-mail, but please, next time do
it either in the cover letter or for each patch.

Thanks,
Andi

> You can find a reference implementation of the userspace helper here:
> https://github.com/Mstrodl/cgeb-helper
> 
> I didn't get an answer when I asked where the userspace component
> should live, so I didn't put a ton of work into getting the helper
> up to snuff since similar userspace helpers (like v86d) are not
> in-tree. If folks would like the helper in-tree, that's fine too.
> 
> This series is based on the excellent work of Sascha Hauer and
> Christian Gmeiner. You can find their original work here:
> 
> http://patchwork.ozlabs.org/patch/219756/
> http://patchwork.ozlabs.org/patch/219755/
> http://patchwork.ozlabs.org/patch/219757/
> 
> http://patchwork.ozlabs.org/patch/483262/
> http://patchwork.ozlabs.org/patch/483264/
> http://patchwork.ozlabs.org/patch/483261/
> http://patchwork.ozlabs.org/patch/483263/
> 
> Mary Strodl (1):
>   x86: Add basic support for the Congatec CGEB BIOS interface
> 
> Sascha Hauer (1):
>   i2c: Add Congatec CGEB I2C driver
> 
>  drivers/i2c/busses/Kconfig             |    7 +
>  drivers/i2c/busses/Makefile            |    1 +
>  drivers/i2c/busses/i2c-congatec-cgeb.c |  189 ++++
>  drivers/mfd/Kconfig                    |   10 +
>  drivers/mfd/Makefile                   |    1 +
>  drivers/mfd/congatec-cgeb.c            | 1139 ++++++++++++++++++++++++
>  include/linux/mfd/congatec-cgeb.h      |  111 +++
>  include/uapi/linux/connector.h         |    4 +-
>  8 files changed, 1461 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c
>  create mode 100644 drivers/mfd/congatec-cgeb.c
>  create mode 100644 include/linux/mfd/congatec-cgeb.h
> 
> -- 
> 2.45.2
> 

