Return-Path: <linux-i2c+bounces-4797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B27592C267
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 19:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 364272826B9
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 17:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394AC12D769;
	Tue,  9 Jul 2024 17:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="SE72vTa0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7BD7F7C7;
	Tue,  9 Jul 2024 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546040; cv=none; b=ll9tvZTSKrEUgykpen6sfpIvZhjKbYgNVDM5MjYs5Ek33Ak2NUk9G3akHgMwFRAq0lJ5q/Vn2O6ve78Ai4Z8yDPgJMr7YxYCh6gk6oqbjplD9sV2RpwXO/YZGHl1mTS5BDa9Kbwk6YzDv0btPaS073dzQTAKHv9wrD+IQ6f/QoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546040; c=relaxed/simple;
	bh=jJqzLWpuJU6fN5IlXtyGHL0m8ooFcYD//JixsujqzLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAEajE+3monEhbuPpfykhG6YDpzg5AUskYaxgH7uhQzMeVgqjYXAmaqEoPlALJWoLsZlE/yZh7u9uEGFhbmzGuISqJmqM0GzK/2Dxb+v0vlAQUG+tYLGGsHLsx6f97HH9TcYU2yzqygvf3qucjEi9eSXMBD0EK4PgLgz1wJ4kgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=SE72vTa0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1720546024; bh=jJqzLWpuJU6fN5IlXtyGHL0m8ooFcYD//JixsujqzLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SE72vTa0mM+H5gpV/YUGYJ3MgaVPMfSYRfmJ6KDLgtACScl69njov3cWP2odrzTVb
	 pQbHaDumHObLlwu/+dbEVv3JiFmGj3NzD5RPMjyeKhKmzAcWq8YASC5H/qyvCBR81X
	 FEf7gTi3FayfG0YCq2b7hiiX4S37Zgr4uFhOqvMI=
Date: Tue, 9 Jul 2024 19:27:03 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: smbus: only limit max banks to eight
Message-ID: <ee0b2612-afb4-4ccb-9afd-b0cfd7e26a6f@t-8ch.de>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net>
 <2mtehll54bpuozsjswynp2xron3dfxknsixnouovby2nxlnrun@3sxdqqbvfr22>
 <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>
 <ibxkewtaxywpabogm776h7ty3grjquravsuwhtjbe2k4j7vlw6@enzxsfkk326z>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ibxkewtaxywpabogm776h7ty3grjquravsuwhtjbe2k4j7vlw6@enzxsfkk326z>

Hi Andi,

On 2024-07-05 13:56:24+0000, Andi Shyti wrote:
> On Fri, Jul 05, 2024 at 07:55:21AM GMT, Thomas Weißschuh  wrote:
> > Jul 4, 2024 23:57:36 Andi Shyti <andi.shyti@kernel.org>:
> > > On Thu, Jun 27, 2024 at 07:48:11PM GMT, Thomas Weißschuh wrote:
> > >> If there are less than eight slots in total,
> > >> only probe those.
> > >> Now the code matches the comment "..., then limit slots to 8".
> > >>
> > >> Fixes: 8821c8376993 ("i2c: smbus: Prepare i2c_register_spd for usage on muxed segments")
> > >> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > >
> > > I don't see the need for the Fixes here... was there a bug that
> > > has been fixed?
> > 
> > More addresses are probed than are possible.
> > Which is a change from the old behavior and also
> > contradicts the comment.
> > IMO it's a bug. Probably not a big one and I'm not sure if user-observable.
> > Surely nothing for stable.
> 
> The Fixes tag means that you want the patch to be backported to
> stable kernels. Someone will take the effort of taking all the
> new "Fixes:" and port them to older kernels.

It's my understanding that a Fixes tag itself is not enough for the
stable process. For that it also needs a "Cc: stable@vger.kernel.org" in
the patch or explicit notification of the stable team.
(Or being picked up by Autosel)

Anyways, I'll squash the commits and drop the Fixes tat, as there was no
bug as pointed out by Heiner.

> We want this when patches fix crashes, deadlocks, memory leaks,
> security holes, misbehaviours, earthquakes and floodings.
> 
> Andi
> 
> > But I'm not hung up on it and will drop that tag in the next revision.

