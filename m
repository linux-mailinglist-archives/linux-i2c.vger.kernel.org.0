Return-Path: <linux-i2c+bounces-4661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE89A928853
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 13:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 842EFB2157C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2967014A096;
	Fri,  5 Jul 2024 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkMbWpIt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9F146A96;
	Fri,  5 Jul 2024 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720180587; cv=none; b=OOGGmtJQezF/j/uCrdbRUeXoGV1/hiv/9BNPQ0eaWoTyhPvIaxdCV99YoGoRMue4bnPTlnSnpPP9HZWxtV9f6L0atmZpLcNA+tlfal2BIyRVxzS8+Tjl1Z3g2vI+c8y3Gh5x6YFMZCGZaSWigauNxgARMN3ooF4nEyKhxsIHkZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720180587; c=relaxed/simple;
	bh=k/YHBLBWjOt0yIDrM6yiv0CQetE7GMAcVImDtUBMBxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqIuJPiDn6JuPD5BzLA78UcV1M8s1pAvLtSBZmNZFPsdRDz/G5Lvh6Nektwpag/pVBZZy9nCT+QJQzEgJoCS5c0Gx/Na7y02VRm+O2pzBZaZes4NOhOePFmrDUhNZJUNt621iBYfOUrNRX2M75eu+Kk2ipkvLBSe7yplEIPN1+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkMbWpIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04384C116B1;
	Fri,  5 Jul 2024 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720180587;
	bh=k/YHBLBWjOt0yIDrM6yiv0CQetE7GMAcVImDtUBMBxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkMbWpItLZJSOTvEyDYm8np8z5X33dTRcQMfLYT5zckTImLfyEhJgQKu7XVRsmiKM
	 BJShWbtawbgYZ3PqRDt9qj9xJUyhbdmUgupic/iM3PRfWToLQ3RvEemhvcfLCSJGZi
	 vsBlbLLbTgHnjNd+g4n6+2qYQKB5vhR724uhqHUF7fgzOfdWkz4MN2e8rnlJGu8QZD
	 zlxgIgrwjmDAo8DLuSk94EyMwg/f6bEh500Tq0PiMDJFmOt/DRHS0oAHDswgtISM82
	 bCGVv+/3P7mUnGQ8UKGuoX/xkllglo+domw1IQdWtRcp8IMQH9aqJgCGp7Bf55wZl/
	 2CjxRA243CCCg==
Date: Fri, 5 Jul 2024 13:56:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: smbus: only limit max banks to eight
Message-ID: <ibxkewtaxywpabogm776h7ty3grjquravsuwhtjbe2k4j7vlw6@enzxsfkk326z>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net>
 <2mtehll54bpuozsjswynp2xron3dfxknsixnouovby2nxlnrun@3sxdqqbvfr22>
 <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>

Hi Thomas,

On Fri, Jul 05, 2024 at 07:55:21AM GMT, Thomas Weiﬂschuh  wrote:
> Jul 4, 2024 23:57:36 Andi Shyti <andi.shyti@kernel.org>:
> > On Thu, Jun 27, 2024 at 07:48:11PM GMT, Thomas Weiﬂschuh wrote:
> >> If there are less than eight slots in total,
> >> only probe those.
> >> Now the code matches the comment "..., then limit slots to 8".
> >>
> >> Fixes: 8821c8376993 ("i2c: smbus: Prepare i2c_register_spd for usage on muxed segments")
> >> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> >
> > I don't see the need for the Fixes here... was there a bug that
> > has been fixed?
> 
> More addresses are probed than are possible.
> Which is a change from the old behavior and also
> contradicts the comment.
> IMO it's a bug. Probably not a big one and I'm not sure if user-observable.
> Surely nothing for stable.

The Fixes tag means that you want the patch to be backported to
stable kernels. Someone will take the effort of taking all the
new "Fixes:" and port them to older kernels.

We want this when patches fix crashes, deadlocks, memory leaks,
security holes, misbehaviours, earthquakes and floodings.

Andi

> But I'm not hung up on it and will drop that tag in the next revision.

