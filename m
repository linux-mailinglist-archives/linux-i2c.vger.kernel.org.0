Return-Path: <linux-i2c+bounces-10737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2EAA729E
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 14:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859063A8A75
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 12:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8A62522AB;
	Fri,  2 May 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="tefFsVbb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237F211A1E;
	Fri,  2 May 2025 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190482; cv=none; b=AvSeRhMkrIbryT303F56W3mUagfwdQUWOVjyOowwGDzw22xReuhZ95ZJI9mpNQ8ZWHggtZO0TkBxQL7Es4h8fkSWQuOKwJVtS1rDS1uJcyZaCeCcffA4DHSVFWgzw77SrMxmmtDPlKmmSSzL3ExfB4vn1McD0wDcHmNEDYF0kCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190482; c=relaxed/simple;
	bh=0S4njLBx477UY0EGQFCzlms0FZEfXroNv1KmF3jVh3w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcqItCZuKJ5rs3HYwS+jjY/GzZ+uxUS7F2u6x4wpmrzdVMGpxcm9rleZt7EgWQjBxId+OC2erzRvgN4oJAdlNcK8MYjOkaoNCZRQ5PIMiBYXHLx3pQWnr2xD9QYc8g0047Wo8MWqiKeAcCBbYNQGuJEV7ixKZpZhBZ104nzIwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=tefFsVbb; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fdclFqSEaIk6BP0kwR3B1xdvCQwhZtNIC8kiyckL4fw=; b=tefFsVbbmieIaZxr6uA2/anU1g
	k5v7LsaWGOffxM3gI22D/S19P9jGpatY0I/0oZwayz6xjHv/6xUm0WltatFayDFTdKe1OwucSY1OS
	57MlVNPgsFcgJpfsHEYztOTk/I5iZ5Av7I3Q3/n/zxTEa1AdvOBRLDrsmJDSmOaM6JHt2SjnR1BZh
	i5afFoydi+2HqxggIxX0YtqnCou8R5FlDgpQCRfmDvvSz7qK+CdZRaREeCVAHsDWueArLBGt+Cz2k
	eg2CRZgqPXJx4JeLpHwMlj2sXdp3dhgnbT9mpQWGY7f2Wik9JZnmMzkYM8EFdQEF8OR/RLenGr4x4
	hucT8ymg==;
Date: Fri, 2 May 2025 14:54:20 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <20250502145420.6bca53f9@akair>
In-Reply-To: <hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
	<vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
	<aAIiJQVAUdWJFVy7@hovoldconsulting.com>
	<hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 29 Apr 2025 15:10:13 +0200
schrieb Andi Shyti <andi.shyti@kernel.org>:

> Hi Johan,
> 
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
> 
hmm, some issue new in -rc1 could be fixed in a later -rcX. I have seen
a lot of typos and other minor stuff getting fixed that way. So
it does not need to be backported to any stable/longterm tree at all.
Are the rules for that really that tough as for stable trees? I really
doubt.

Regards,
Andreas 


