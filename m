Return-Path: <linux-i2c+bounces-6805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE597A44C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 16:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F051C25F24
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F77815820E;
	Mon, 16 Sep 2024 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="saTJ0Vx2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7E15699D;
	Mon, 16 Sep 2024 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497614; cv=none; b=oMe6XBgijbwa0mWGLFk4V3eP1NQeEwCqC8bmCWKiFZPct3NYO8VR15sEvWa65F7YKJuwouj55o+yUaqE0ZzSjXdNUmOuAvRbdq7F1RccqL0eVazTh7yMC1oSWtGnAOMSQmueI3/K0EGkit9rsukcD/zm8HtolA3D/tljZem39Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497614; c=relaxed/simple;
	bh=ase2EtK58dnbqX+XHGgnnZ7iGG7Dh9FkcUnUJomep6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuP0uMsjsoTHFB16ZJSVfkyoc3B+ch39hSdvadAFvNwy0+Y5FmHYZJVlo8jUenycMoj8d9exhmtBAPnOVdRhZUghTO/ip0knRyKl0EY6V/mc3ccMTajyn6LRvttQGwUEJXJznmMVnghg1SPbYVGwYPCBYuJH8WXExjelcpC2eiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=saTJ0Vx2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B16C4CEC4;
	Mon, 16 Sep 2024 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726497613;
	bh=ase2EtK58dnbqX+XHGgnnZ7iGG7Dh9FkcUnUJomep6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saTJ0Vx2drn9LMFWyT9D5tgGkbNWBTUYWYrCPVmkOA443m24xG5qIZRcTxuw3Rya1
	 IoNIZhV+ITAOfDMwdPCbot/UShrbdePk4QtAH1zldxEKT7MZSm4eqxz2U33Qho7phS
	 630Rj6fDzPkPzmjTINORmiasrZmBzQHwOL1jMFvnA5ZZTL69I1X5ZX5X7sjJVqLSLu
	 sPv/2Hwf4mdOgXQWLDFk9tlKc7I/DBncDZfWZDsYbiyRzBnrqZWUoe+i02+CMqnuAO
	 Id43YqSoKntIWtR9rDV0Pp2BSNuB86gDc22pemlEgFv1pcryJfXCS1e8/PMfUH5wrm
	 PDtuGAJfPY25g==
Date: Mon, 16 Sep 2024 16:40:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 00/11] i2c: isch: Put the driver into shape
Message-ID: <hhn6u5q2gmrolhygs33d36odpszueq3qtmv77tz37lhxmc7sjl@ndohkc6czrpt>
References: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (11):
>   i2c: isch: Pass pointer to struct i2c_adapter down
>   i2c: isch: Use string_choices API instead of ternary operator
>   i2c: isch: Switch to memory mapped IO accessors
>   i2c: isch: Use custom private data structure
>   i2c: isch: switch i2c registration to devm functions
>   i2c: isch: Utilize temporary variable to hold device pointer
>   i2c: isch: Use read_poll_timeout()
>   i2c: isch: Unify the name of the variable to hold an error code
>   i2c: isch: Don't use "proxy" headers
>   i2c: isch: Prefer to use octal permission
>   i2c: isch: Convert to kernel-doc

Applied to i2c/i2c-host-for-6.13. These patches will be moved
into i2c/i2c-host after the merge window.

Thanks,
Andi

