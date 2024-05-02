Return-Path: <linux-i2c+bounces-3364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B08B9521
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 09:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47F191F21C5A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 07:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBC621A04;
	Thu,  2 May 2024 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gN+fT53I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF72032D;
	Thu,  2 May 2024 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714634279; cv=none; b=sgaDy/vYPD9y9YEdpBaVqON1hXWY6ktlRtIjgLMBbRbntAWHWpGl1ECy9+J1Ly0s/bXgEEtY0abSXy4Z13LtpkbTiuOApq4D4dFd5ZCWW/ACYTmRa3EWZy9wZXh3luCa/iuot6ceSxHVsW4Vby9SzvEeDzY7GcCAV28kslQvTTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714634279; c=relaxed/simple;
	bh=GKVkaZSZdTJ1ZSoNC/bu+eyVkUGbSrKVfeyYCZywwhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwJk2RL9E8cV0kqjL345xvbDJcH6erC0JQHo+gCNGnhCzd/TBHkDsXsc6W7pWx6aDvxzo1LaQIFI/9x+nFlS1wI4g2ldev8UJSPkMNJuMkrA6OkyIWE+e/rfjsvAmKLz5WJG/M6tceIaPieUZVwaizvb6XtUBKxE8iRGNTycWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gN+fT53I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE876C116B1;
	Thu,  2 May 2024 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714634278;
	bh=GKVkaZSZdTJ1ZSoNC/bu+eyVkUGbSrKVfeyYCZywwhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gN+fT53IhX0Um7069irc19JXE58aEy2S2UWaqUw+4RquL2cNYVSw8NnDyNSt+/yq7
	 F/AtBIjOL8QdKS/SJfK4wb2Tiqlv1kA7W+itZZQhzAVXQUF1jZ87+a97p6yyfbYSmp
	 SEm8GU845LER13PopJEqEJ5PJ92kgATndYi7/Rr4zDNQLNktsjc+UhLttMDOs5BB91
	 sCyGQRhYzZ0hztg6Y4tuZooxP5raHEqzAZkuxJbw4zjaMfDDwH4t96tX2vbkZnc5Ez
	 ceZ5q+HJhFxrFicUxbTUqEb65vWKu0YAZthBK/bXmC3WV7HH+hguLDZhWXzbFSWwsi
	 EHQL/Tyom4JSw==
Date: Thu, 2 May 2024 08:17:51 +0100
From: Lee Jones <lee@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Message-ID: <20240502071751.GA5338@google.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-3-florian.fainelli@broadcom.com>
 <ZihLhl8eLC1ntJZK@surfacebook.localdomain>
 <1d1467d1-b57b-4cc6-a995-4068d6741a73@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d1467d1-b57b-4cc6-a995-4068d6741a73@broadcom.com>

On Tue, 23 Apr 2024, Florian Fainelli wrote:

> 
> 
> On 4/23/2024 5:00 PM, Andy Shevchenko wrote:
> > Tue, Apr 23, 2024 at 04:36:20PM -0700, Florian Fainelli kirjoitti:
> > > Rather than open code the i2c_designware string, utilize the newly
> > > defined constant in i2c-designware.h.
> > 
> > ...
> > 
> > >   static const struct mfd_cell intel_lpss_i2c_cell = {
> > > -	.name = "i2c_designware",
> > > +	.name = I2C_DESIGNWARE_NAME,
> > >   	.num_resources = ARRAY_SIZE(intel_lpss_dev_resources),
> > >   	.resources = intel_lpss_dev_resources,
> > >   };
> > 
> > We have tons of drivers that are using explicit naming, why is this case
> > special?
> > 
> 
> It is not special, just one of the 3 cases outside of drivers/i2c/busses
> that reference a driver living under drivers/i2c/busses, as I replied in the
> cover letter, this is a contract between the various device drivers and
> their users, so we should have a central place where it is defined, not
> repeated.

I have always held the opinion that replacing user-facing strings with
defines harms debugability, since grepping becomes a multi-stage
process, often with ambiguous results (in the case of multiple
definitions with the same name.  Please keep the string in-place.

-- 
Lee Jones [李琼斯]

