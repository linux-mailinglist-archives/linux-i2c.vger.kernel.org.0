Return-Path: <linux-i2c+bounces-3069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD48AE586
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60228281B4E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF226135A48;
	Tue, 23 Apr 2024 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNHJyRMP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000B135413
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713873757; cv=none; b=CYNp6c0r0CTxueGbbG+p/TMEALiJolou2CYcC1fHytDzk7gFhLXdCJs9dae6hQQdtshS1UNS1mhVLkNSG2KsWdH5ZYzETCgGv0AsiBPHcaVr+xlN9WK6V2DPzbY4EHemMmOLNlyLfpT6ctd3DJJpIQeDujpwTpMPIGG0HfW6wLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713873757; c=relaxed/simple;
	bh=FFtqAFOhfClhptLIov+hzVPnmT+upF/gwE71haXwmt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYczNRjsTHGIGoMppXZMwrx16I7O8t5Xq1rFHo5Thy3q0g2Wxpjp75LUUme23yRRdAA55AOAvu0wzJfm82SeDz22vayjRjle5vsnsFQvoE30LvFEN3VV0nF0wT8OqguYPKhkfNRibIwNM6ECUd1/cTrtpk13W6w8UzI69f4W2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNHJyRMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A980CC116B1;
	Tue, 23 Apr 2024 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713873757;
	bh=FFtqAFOhfClhptLIov+hzVPnmT+upF/gwE71haXwmt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNHJyRMPthF/5BnR5H4qLh90gw6x4jyg9cUwtMaE/w3BZrmfg59JA8GLv3Eelei+m
	 gpYGxTIpnTAkjio3dx6LQ5rdIAb+oADy4B78426XKWmZ8zZJgyE+S6XCZw+iezSHZJ
	 87PIrsnV5upVnZyPuRPRQtDn7gpHi4UABu6xaYxmvAg3+//sYCDXixe+HOxjuAbErv
	 N8SbmHZETfLsa1k0mHvXMCu+i2zY3ujKxvIbLwNElkky1ZZ/0PeLDwSpDg3cHC4Yv9
	 Q3Cxh5a9GXbY+sWVN+7uGRbpWsqaWuckvX9sSmepWTgBf2++qsjqIXGYyx+wuVDGD8
	 4NoFnMOib6W+g==
Date: Tue, 23 Apr 2024 14:02:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, wsa@kernel.org, cobechen@zhaoxin.com, 
	hanshu@zhaoxin.com
Subject: Re: [PATCH v10 0/6] i2c: add zhaoxin i2c controller driver
Message-ID: <pvou2xxuhzjal5ptxpuvir4crl4k2hnqsvjj2lca3xativ2oll@kdsvwmk263kr>
References: <20240306212413.1850236-1-andi.shyti@kernel.org>
 <cover.1712479417.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1712479417.git.hanshu-oc@zhaoxin.com>

Hi Hans,

it all looks good, except for that unrelated cleanup you added in
patch '1'.

If you are OK with it, I can take the series and remove the
cleanup.

Please keep in mind that splitting patches in smaller chunks
helps reviews and future bisects, even if the change is a trivial
cosmetic improvement.

Thanks,
Andi

On Mon, Apr 08, 2024 at 10:54:42AM +0800, Hans Hu wrote:
> v9->v10:
> 	* fixed style issues that were checked out by checkpatch.pl.
> 	* In Patch 3 in wmt_i2c_write() function, deleted the log
> 	  when received nack.
> 	* In Patch 4 in viai2c_irq_xfer() function, return 1 for
> 	  I2C_SMBUS_QUICK access.
> 	* In Patch 6 in zxi2c_get_bus_speed() function, adjusted
> 	  the log when firmware gives inappropriate parameters.
> 	Link: https://lore.kernel.org/all/20240306212413.1850236-1-andi.shyti@kernel.org/
> 
> v8->v9:
> 	* In Patch 1 in probe() do not return at the
> 	  i2c_add_adapter(), but call clk_disable_unprepare()
> 	  in case of failure.
> 	* In Patch 2 fix the conflict when i2c-wmt.c is removed.
> 	* In Patch 2 in wmt_i2c_probe() function, call
> 	  clk_disable_unprepare() in case of failure. While at
> 	  it, add a comment to explain the reason.
> 	* When renaming i2c_dev to i2c, change also the reference
> 	  in clk_disable_unprepare().
> 	Link: https://lore.kernel.org/all/20240306212413.1850236-1-andi.shyti@kernel.org/
> 
> v7->v8:
> 	* move per-msg handling to interrupt context
> 	* add private struct viai2c_zhaoxin to handle zhaoxin specific things
> 	* fixed some other formatting issues
> 	Link: https://lore.kernel.org/all/cover.1704440251.git.hanshu-oc@zhaoxin.com/
> 
> v6->v7:
> 	* adjust the patch sequence
> 	* put those renaming related patches in 1 patch file
> 	* rename i2c-*-plt.c to i2c-viai2c-*.c
> 	* Some other adjustments suggested by Andi
> 	For more details, see the comment in each patch please.
> 	Link: https://lore.kernel.org/all/cover.1703830854.git.hanshu-oc@zhaoxin.com/
> 
> v5->v6:
> 	* fix build warnning reported by kernel test robot.
> 	  Link: https://lore.kernel.org/all/202312291225.cWVt6YF9-lkp@intel.com/
> 	Link: https://lore.kernel.org/all/cover.1703733126.git.hanshu-oc@zhaoxin.com/
> 
> v4->v5:
> 	* fix 1 build error.
> 	  Link: https://lore.kernel.org/all/ZYx0VPVmyQhtG+B9@shikoro/1-a.txt
> 	Link: https://lore.kernel.org/all/cover.1703647471.git.hanshu-oc@zhaoxin.com/
> 
> v3->v4:
> 	* Some adjustments as suggested by Wolfram.
> 	* rebase patch on top of for-next branch.
> 	Link: https://lore.kernel.org/all/cover.1698889581.git.hanshu-oc@zhaoxin.com/
> 
> v2->v3:
> 	* Split the number of patches from 2 to 12. Make it easier to review.
> 	Link: https://lore.kernel.org/all/cover.1691999569.git.hanshu-oc@zhaoxin.com/
> 
> v1->v2:
> 	* Fixed some bugs I found myself.
> 	Link: https://lore.kernel.org/all/cover.1691030850.git.hanshu-oc@zhaoxin.com/
> 
> Old version:
> 	This patch has already gone through a round of reviews.
> 	The difference from the first round is that it reuses
> 	the i2c-wmt driver.
> 	Link: https://lore.kernel.org/all/20230614094858.317652-1-hanshu-oc@zhaoxin.com/
> 
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> 
> Hans Hu (6):
>   i2c: wmt: create wmt_i2c_init for general init
>   i2c: wmt: split out common files
>   i2c: wmt: rename something
>   i2c: wmt: fix a bug when thread blocked
>   i2c: wmt: add platform type VIAI2C_PLAT_WMT
>   i2c: add zhaoxin i2c controller driver
> 
>  MAINTAINERS                             |  10 +-
>  drivers/i2c/busses/Kconfig              |  10 +
>  drivers/i2c/busses/Makefile             |   3 +
>  drivers/i2c/busses/i2c-viai2c-common.c  | 256 ++++++++++++++
>  drivers/i2c/busses/i2c-viai2c-common.h  |  85 +++++
>  drivers/i2c/busses/i2c-viai2c-wmt.c     | 148 +++++++++
>  drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 298 +++++++++++++++++
>  drivers/i2c/busses/i2c-wmt.c            | 421 ------------------------
>  8 files changed, 809 insertions(+), 422 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
>  create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
>  create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
>  create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
>  delete mode 100644 drivers/i2c/busses/i2c-wmt.c
> 
> -- 
> 2.34.1
> 

