Return-Path: <linux-i2c+bounces-10763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E7AA9076
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 12:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1006F3AB95B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13571FBCA1;
	Mon,  5 May 2025 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIwW5rwV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8753C1F7580;
	Mon,  5 May 2025 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746439213; cv=none; b=SMK5xMFgwzKVDcfSN3BCgMeQue0NtPt6n4zfyqhcp7H+kmme7OBZZRQTzqeCm0taiygc8OExpaPRLxUgnd9IqoPE1ueqD+J8tidOn8lu6heMy5BDkPyzKuKKbLBNMmhBTK9y0Cdcm/TgWIEX7vmbeBoovzYTezUQIOV1Lmx4Ik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746439213; c=relaxed/simple;
	bh=FRuf5HxXYzqbfy/RUvMEK/inDPxU9w9/ccNfofTTt/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4864rtkXVMXQuE+xujIM6d38d0Qics7YORjEqwSBl6N9O/wMsAG6VVWr1GE2meXCdTcWWOKBmKfvV6O3yWnrrQxKEAb0kWlxSLpVE1AzTvDSXsaOKhj+CVG9KdIKO+T8NEPHKftN2rryobCM3SMRljMTDdjD+HPrqHT/anWAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIwW5rwV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0997C4CEE4;
	Mon,  5 May 2025 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746439213;
	bh=FRuf5HxXYzqbfy/RUvMEK/inDPxU9w9/ccNfofTTt/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIwW5rwVPrNTtiP0ofBDyXZNRZiVT5pSEc4KBGVD0mn+LdPDS8pTKaep1q9yFc2P+
	 WKgTMvWCMy/i+1Cz2O3qLNjRnmoMDBmjU/LYW1wBudC5QMfBQIPpuKUvZRADJoC93w
	 pI77gm48N82opgZrsBxqpHyND2FCcZ4GZAa9O4hxlHgQytKbRyW5PdbN75BRSAtpg+
	 iKRo5Fet+dik+AqV6JuWilVRsPof1/IBMwBRTnTFbRg2S+0ICUm2hiMhfbyu+bpVqg
	 MRKkZ0Ww4kmZIyS5k0Tf7bb+744BvgPBMFIGnlM/G5B0OKJMosA+s50RTXNshp7yw0
	 y2U8L/Rx7LYQw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uBscJ-000000003oT-36GC;
	Mon, 05 May 2025 12:00:07 +0200
Date: Mon, 5 May 2025 12:00:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <aBiMJ0z5q4K2xTGT@hovoldconsulting.com>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
 <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
 <aAIiJQVAUdWJFVy7@hovoldconsulting.com>
 <hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>

On Tue, Apr 29, 2025 at 03:10:13PM +0200, Andi Shyti wrote:
> On Fri, Apr 18, 2025 at 11:57:57AM +0200, Johan Hovold wrote:
> > On Thu, Apr 17, 2025 at 11:41:51PM +0200, Andi Shyti wrote:
> > > On Tue, Apr 15, 2025 at 09:52:30AM +0200, Johan Hovold wrote:
> > > > Using of_property_read_bool() for non-boolean properties is deprecated
> > > > and results in a warning during runtime since commit c141ecc3cecd ("of:
> > > > Warn when of_property_read_bool() is used on non-boolean properties").
> > > > 
> > > > Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> > > > Cc: Jayesh Choudhary <j-choudhary@ti.com>
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > 
> > > Thanks for your patch! I'm going to drop the Fixes tag, as this
> > > isn't really a bug fix but rather a warning suppression during
> > > boot time.
> > 
> > Thanks, but I think you should have kept the Fixes tag and merged this
> > for 6.15 (i2c-host-fixes) since this is a new warning in 6.15-rc1 (and
> > that does warrant a Fixes tag). Perhaps I should have highlighted that
> > better.
> > 
> > If the offending patch had been posted or merged before such uses
> > started generating warnings in 6.14-rc1 then that would have been a
> > different matter.
> 
> I'm sorry, but as I understand it, the Fixes tag should be used
> only when an actual bug is being fixed. I've seen stable
> maintainers getting annoyed when it's used for non-bug issues.

You seem to confuse the Fixes tag with a CC stable tag. A Fixes tag is
used to indicate which commit introduced an issue, while the CC stable
tag is used to flag a commit for backporting (and the fact that autosel
tends to pick up patches with just a Fixes doesn't change this).

It's perfectly fine to fix an issue and use a Fixes tag when doing so
even if the fix itself does not qualify for backporting (for whatever
reason).

> The system works perfectly fine even with the warning printed.
> It might confuse CI systems, but that shouldn't really be our
> concern.

You should not knowingly be introducing new warnings. The Fixes tag I
added showed that this was an issue introduced in 6.15-rc1, and, unless
discovered really late in the cycle, it should be fixed before 6.15 is
out.

Johan

