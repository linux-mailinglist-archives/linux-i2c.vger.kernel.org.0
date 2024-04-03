Return-Path: <linux-i2c+bounces-2748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C5A896E3F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 13:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992961F27173
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 11:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F7F143865;
	Wed,  3 Apr 2024 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPYoONGP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7313958E;
	Wed,  3 Apr 2024 11:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712144093; cv=none; b=jA+5n+Uy/d1VVDBJBzYTguktbknei4LHLTJ5/cwCvT5xTZfPfJC+Qv92wrFpurNplcbSyX+soLNymo3ZT2naqB0dPgPBgsePNOHNPIwbeC8Csg8/3pf6CmL2+I1HnyaITACqA3koNI+mrn/YfH+1pqCgV08J1Lq/2PoqEhZkam8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712144093; c=relaxed/simple;
	bh=/1FdhJ9j3YsGxn2x6BZ0RA0uu6K60/KgnMao7N8mf9I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gumErw763k56hsAF1FCOhHhSnpJ6ul6zmLUa9jw5m+TqKrRQEDu4YfYTptEZ35HTy7q9iP3mfg5M0Od6s0fHYZxNN1ap8jUI/E6+r7fV1lxdSRYxZlT8nDUdLQwtMBWRqzWGorHh03pgEpiIVz93JeFMoczW6xqOb+WU3YBZp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPYoONGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BB9C433C7;
	Wed,  3 Apr 2024 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712144092;
	bh=/1FdhJ9j3YsGxn2x6BZ0RA0uu6K60/KgnMao7N8mf9I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YPYoONGP9VG+OzIO9HijTwRnUDAEVbNhe3G6DttCorCsK8ZZR5gc44qDs66ibmzhp
	 tdidGS4DAE1KHsSpKPY/lqY5dJF2s393LD5eWw4kbJxJYFe5GGSv4Lk++dU9ShVyC1
	 f6IaDVCkjqxpLlq6jEUB/QXr/BioJLaxfyIXMXiOiYalSl7fH+kS0PDgXSrvpcNhJF
	 RpjpT6Ra5R/+lgo+S36viFSbDHjgHwL+5gfP/zBBMiV3XTo7/Rqm5G8cfnDiua7ION
	 Z1goY2uzodJxbr58oWljrtJjw5BQJ3i8X3d5Zlo0Lj3uNmp1hIj1mBZRVllT/Z6oYs
	 fCxTUrdJhjjTg==
Date: Wed, 3 Apr 2024 13:34:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Christina Quast <contact@christina-quast.de>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, equinox@diac24.net, 
    Daniel Beer <daniel.beer@igorinstitute.com>, 
    Michael Zaidman <michael.zaidman@gmail.com>
Subject: Re: [PATCH v5] hid-ft260: Add serial driver
In-Reply-To: <20240216-ft260_review5-v5-1-36db44673ac7@christina-quast.de>
Message-ID: <nycvar.YFH.7.76.2404031332560.20263@cbobk.fhfr.pm>
References: <20240216-ft260_review5-v5-1-36db44673ac7@christina-quast.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Feb 2024, Christina Quast wrote:

> Adds the serial driver for FT260 USB HID devices, providing direct and
> simplified access to UART functionality without the need for FT260 HID
> report format knowledge.
> 
> This chip implements an UART and I2C interface, but only the latter was
> previously supported with a kernel driver. For the UART interface, only
> FTDI example code using hidraw from userspace was available.
> 
> This commit adds a serial interface /dev/ttyFTx (FT as in FT260), which
> implements tty serial driver ops, facilitating baudrate configuration,
> data transmission and reception, termios settings.

I don't see a dependency on CONFIG_TTY being added, and I believe it 
should be there (even though !CONFIG_TTY configurations are likely 
super-rare).

Thanks,

-- 
Jiri Kosina
SUSE Labs


