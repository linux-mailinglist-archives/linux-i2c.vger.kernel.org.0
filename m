Return-Path: <linux-i2c+bounces-3338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC38B6E8C
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 11:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E372813CC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F949194C8A;
	Tue, 30 Apr 2024 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyX+AXMA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568771292CE;
	Tue, 30 Apr 2024 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469776; cv=none; b=MRRhs7Sq/Rdx3cMheMtuPHbg23Awvp1cmDW14lXP7osZ0/u6Az5Qob6zE86ROb95mxtG68MAWCXPmyDInfpmrLdfgVrNMGN8CZjx8hUiJDd+2zigXnC62FOkcJTaOj1+Qc9E4vc8s1/EUXXoXU9PFAw6WJ12TjbArviFeRdLITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469776; c=relaxed/simple;
	bh=3l20woefNrUTmYr2WXVuXJsLYYGk9ONQKilh/0kO8iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfDre1ZhayB4HWfrxOMm9nlpwmaHawrk6dC69qP8M/6nfG1jUIJuRSr4+UsLphNhI7XyaG6oalwKJBg40SfNcvyuGN0BUadb3/n6UpNE804Hk4s0kXAeb+S/R3H1/lu5RsAgr99LBszQX5WZRxlAUpprsgYI6XIsk+aGwFP7f90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyX+AXMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647EEC2BBFC;
	Tue, 30 Apr 2024 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714469775;
	bh=3l20woefNrUTmYr2WXVuXJsLYYGk9ONQKilh/0kO8iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyX+AXMA9YSULYnBC+gtH6mJufvYQCBvx6Ht5xJUrQvYCrX49bBiw6tH+Xj6k01im
	 Rmo5vvSa1PYWEDPmetLVJZCJqSxWc2rl/4x3WGZ0Urr3ZHirbdjZxcLwT35sJVJWA0
	 oZGrVOL5ET+QVSwNr+1Bphxt6zLbUjS+lCHYMy4wdrernxtiLWEmdYvhCWcc6hKMD9
	 r7OByvdGgwnHbb5Row0k7R4W/2AticzWeWOpyut759IWQSdvxGVNMp4+7Ypp2pVoBn
	 t2c/FtoCBv2qm91Sph9G79mT1SovRErqRlHEKvx6Zg5DYmO7IgQMjDI1Q0Mx7OLKW0
	 BxQLptzD3DobQ==
Date: Tue, 30 Apr 2024 11:36:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	linux-kernel@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Lee Jones <lee@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Duanqiang Wen <duanqiangwen@net-swift.com>, 
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>, "open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] mfd: intel_quark_i2c_gpio: Utilize
 i2c-designware.h
Message-ID: <fidbc7locp32lypdui67crj3qkj3nbcp5vpxcnlxrdmme2sn4c@npdan5ncxxog>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <20240425214438.2100534-5-florian.fainelli@broadcom.com>
 <Ziu6gDOqhEYQNhcH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ziu6gDOqhEYQNhcH@smile.fi.intel.com>

Hi Andy,

On Fri, Apr 26, 2024 at 05:30:24PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 25, 2024 at 02:44:37PM -0700, Florian Fainelli wrote:
> > Rather than open code the i2c_designware string, utilize the newly
> > defined constant in i2c-designware.h.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> P.S>
> Note, my tags for MFD patches does not imply that I agree on the general idea
> of this series, it's just in case if it will be approved by the respective
> maintainers (I²C / MFD / etc).

I waited a bit to see if more comments were coming.

Do you have a better approach in mind?

Andi

