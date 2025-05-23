Return-Path: <linux-i2c+bounces-11119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D84AC1DFE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 09:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88FA91BC7B56
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 07:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF4F283FFF;
	Fri, 23 May 2025 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIVLloYW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF8283C89
	for <linux-i2c@vger.kernel.org>; Fri, 23 May 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986978; cv=none; b=WgZWUfSNYv2nvYjNbU+kO2a6Uwd4XHwMee5onTSw19C+aa4ySvNhx/t8568IOmo/gqT4BzQLlLfhGMcXVOZyYJfXF/b+svNOvi9HtocjcNeKD43pCbzO0q/G0VfHBdEUaPkbe2CBn8ULgXVxYH2JV6zT+2EZu7Y7V5LKCi3WhX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986978; c=relaxed/simple;
	bh=ROhn80D1mdhWhJDL4GCQEq79IlV89/R2UxiyoMODa6A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOaGsxdz1vhzO5f4wda1wOioc44rRlsXo8lv8YARwt81rA2y+pxqdh+hkIEp9a7VCbwALHratTRpAsuZaQUTkHNpLu9hkMgBuz3ULFhRTWfkfuMQo60OA0LBU83D/MFzTjlztj5ke1VAGehsTEhsTHWt3EBqtXvezEx0ysx6YXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIVLloYW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C18C4CEE9;
	Fri, 23 May 2025 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747986977;
	bh=ROhn80D1mdhWhJDL4GCQEq79IlV89/R2UxiyoMODa6A=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=XIVLloYWzCsIAtIBiyxFKkjtJkoLv3sZYMxU8R4Gi4+5HUSfkPc6c17JHyYWTlAka
	 rtcPv6WdUcWPHYT6AcWJUEQZTCr7oIWAQIcB4aS26UrrcbtdsF3rjiFVRV7swuIZkk
	 7rUbM+VQLDncbyYybs+xpx3j/luSuAsDh3URNNzP5gRmkgoVfU/b1wiiorB6Czdjif
	 PA30YFciYBjcbvnXt/1s1kkP4ZYVh7+NTbrxicNPG57kYHjMbfDwJrJzyw/zapmpyH
	 KfVFOag7hj2BJntGGdjpQZzf48+YktB9VdUTJB1+6SJxYpxPseawhSqK6uDZNiz58n
	 A//Bc5P5KdjQw==
Date: Fri, 23 May 2025 09:56:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Till Harbaum <till@harbaum.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: tiny-usb: disable zero-length read messages
Message-ID: <kqvsib7qm74cgoeopjldepgios4lpjs6xxbnbgkf3m7lgkk2dw@d3tkxzzgsusa>
References: <20250522064349.3823-2-wsa+renesas@sang-engineering.com>
 <aC7LfOYdq49yDsDt@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC7LfOYdq49yDsDt@shikoro>

Hi Wolfram,

On Thu, May 22, 2025 at 09:00:12AM +0200, Wolfram Sang wrote:
> On Thu, May 22, 2025 at 08:43:49AM +0200, Wolfram Sang wrote:
> > This driver passes the length of an i2c_msg directly to
> > usb_control_msg(). If the message is now a read and of length 0, it
> > violates the USB protocol and a warning will be printed. Enable the
> > I2C_AQ_NO_ZERO_LEN_READ quirk for this adapter thus forbidding 0-length
> > read messages altogether.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Fixes: e8c76eed2ecd ("i2c: New i2c-tiny-usb bus driver")

I will queue these up for next week. There are a few more fixes
that I deliberately left out of this week's pull request to give
them time to be properly reviewed and tested.

Thanks,
Andi

