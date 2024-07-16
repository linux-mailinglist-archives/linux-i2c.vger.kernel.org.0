Return-Path: <linux-i2c+bounces-5001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C3E932F5F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 19:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8347283D8A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 17:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E664B1A00F7;
	Tue, 16 Jul 2024 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HZxZgCsC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BD19DF8D;
	Tue, 16 Jul 2024 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721152215; cv=none; b=JpbDSFAYiSpAS3ob2dajpJbw3dOEMGC7riuFIwchjRKH+uxKy8/WZDI7UezaEC8LA5JDQq3TUb53+QPqe44bdRnoJIyLhgiRUXE0cYD1rO0zB7hvyyyxoPJg15znvu4I/l+XOAlarpnVv7sog9lHbV0bTxrv64swnituSENoEb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721152215; c=relaxed/simple;
	bh=KHqEoHnePTV9FSinsm5s6XR0VJklu3YfJd0AaEm5aZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qctjYP4SOR5/rVQPPil6RzrBGYkPlvEXtD6hC6s69/t3pCuZUNs4fZXzGP5Qwk+pvcy9UY2fa9yepQSssST6nr9h4RqyTAKE0x4DEeT731B2UlGpgjT6BxNq5MwTafsag2TdPTHr2siFr8dourPWX35NOI4e0xzNdQI7cZH2CEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HZxZgCsC; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721152205;
	bh=KHqEoHnePTV9FSinsm5s6XR0VJklu3YfJd0AaEm5aZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZxZgCsCCvntXehct8qIa5ChM6E2I2/VTN7GB8NVk6kj5/P7p47nyGHGzJzYOtHfl
	 6otkC9MVDyaWqI9tmm9R942HHxGqaRVwm+tC6xEcpwMCYdBgGDQV0R9IprDUqVj4R1
	 jnYYaHTCt/RWi/jywVRiVjqMbZJp44m66FR0oF4U=
Date: Tue, 16 Jul 2024 19:50:04 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: piix4: Register SPDs
Message-ID: <1c03bc1c-b1ad-40ee-8219-718455717966@t-8ch.de>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <20240709-piix4-spd-v3-2-9d1daa204983@weissschuh.net>
 <ZpEnXaRYnPIr1vG3@shikoro>
 <i633av3v2a4chdh5a7yk6nv6y77ohvpajeozypjdroufikes6k@cmvpywjwj4df>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i633av3v2a4chdh5a7yk6nv6y77ohvpajeozypjdroufikes6k@cmvpywjwj4df>

Hi Andi,

On 2024-07-16 19:46:43+0000, Andi Shyti wrote:
> On Fri, Jul 12, 2024 at 02:53:49PM GMT, Wolfram Sang wrote:
> > > Only the first 8 slots are supported. If the system has more,
> > > then these will not be visible.
> > > 
> > > The AUX bus can not be probed as on some platforms it reports all
> > > devices present and all reads return "0".
> > > This would allow the ee1004 to be probed incorrectly.
> > 
> > I think this information would also be helpful as a comment above the
> > code. But to allow this series to be applied now, I think an incremental
> > patch will do. With Heiner's ack, I think this can go in now.
> 
> I agree with Wolfram here. Are you up for a v4 or do you want me
> to add the comment while pushing?

I also agree. My first interpretation of that message was that I would
send the incremental patch during the 6.12 cycle.
But if it's still fine for 6.11, even better.
If you could add the comment, that would be great,
but I'm also fine with resending.


Thomas

