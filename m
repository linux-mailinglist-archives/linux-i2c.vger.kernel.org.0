Return-Path: <linux-i2c+bounces-4643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A8927EBD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 23:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0A0283C60
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 21:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7489C143735;
	Thu,  4 Jul 2024 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llXqSlCm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E28D1411E9;
	Thu,  4 Jul 2024 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129546; cv=none; b=f6YTxpTOfmXW+NtHM/uW9ss1CfWEwdJSnGN2EkJWhzZZzOVHnuFzbu47rhvSgZIz62GHhekNZ7/qLgv29AvMw+JHvea99+dm9fmo90/TIsSETxuImBIe86Ag0+7qQrddNA9cODoTRrvrHqNd5u3GXAoAW4iriz+LEJZ48d3gZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129546; c=relaxed/simple;
	bh=Ey+fvMBk2XKmPtksOy/IQh1U+nD1O5MKaDaE4dC+1YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esvRCAtQoPSAUzQ7jt19QUcrRfYY21ynhZRBJ2zDaNc4PicAM+TuPtU0CNLPafCRd++rltGQ+nX1Euk9sYxBtyHr++npAFAcrtcFWZqgFnNO2GoQT+/iUtaqODco/JhFtNdwTh3X4apCsIuLLLIyYXMMctwTRiIVJb0Dfh7uqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llXqSlCm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8B7C3277B;
	Thu,  4 Jul 2024 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720129545;
	bh=Ey+fvMBk2XKmPtksOy/IQh1U+nD1O5MKaDaE4dC+1YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=llXqSlCm/tOglH46VGKH31HePaNPCkbmpW4gNhX5a4jh1h+9aaKrPJpGhJGyXRA6t
	 F2py2FKlwSemUpxMy+7FDW8uG41ltmrm9ws1kI5auXxvW8Vvx5nkEtKtEN8I77S6LI
	 Cd+QyHKjMSYtnLa2khKd22KHSwupKIFdYAkYOo0ZZVBmIeX6ozV0JojxBCByXM7Toz
	 MR/eGk2kysazJp/jLGbrGig5Ldl6GDFuWWh39kawMsTw5mrcXnS9Zhw1AvOm29bC8P
	 gIZFU1ZbYdxLqXNjrPyrYDKQIRKZGRR2j6V+61CbceKydQjKBQHncebN38g4Y9h5Qt
	 iGFkzJ03s3dBg==
Date: Thu, 4 Jul 2024 23:45:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 4/4] i2c: piix4: Register SPDs
Message-ID: <mzyik2wq7v72ohuhho75nm775fkgtgpkxq2tlkpx5xhuizfovh@pak6gj2d3fn2>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-4-617ce47b8ff4@weissschuh.net>
 <2bbdb1bd-ea4d-4c14-9ea7-9fce09ac76b7@roeck-us.net>
 <afd11870-eab1-4b90-9b81-2a7c84be46e5@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afd11870-eab1-4b90-9b81-2a7c84be46e5@t-8ch.de>

Hi Thomas,

On Sat, Jun 29, 2024 at 09:19:48AM GMT, Thomas Weiﬂschuh wrote:
> On 2024-06-28 16:09:09+0000, Guenter Roeck wrote:
> > On 6/27/24 10:48, Thomas Weiﬂschuh wrote:
> > > The piix4 I2C bus can carry SPDs, register them if present.
> > > Only look on bus 0, as this is where the SPDs seem to be located.
> > > 
> > > Only the first 8 slots are supported. If the system has more,
> > > then these will not be visible.
> > > 
> > > The AUX bus can not be probed as on some platforms it reports all
> > > devices present and all reads return "0".
> > > This would allow the ee1004 to be probed incorrectly.
> > 
> > Was this reported somewhere ? I don't see it happen on any of my systems
> > (of course that doesn't really mean anything).
> 
> It happened on one of the big server systems I tested on.
> 
> > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > 
> > Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks!
> 
> FYI, combined tags are discouraged by
> Documentation/process/maintainer-tip.rst:
> 
>   Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>   they just complicate automated extraction of tags.
> 
> I'll add the tags in split form to the patch.

No worries, I'll take care of it.

Thanks,
Andi

