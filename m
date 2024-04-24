Return-Path: <linux-i2c+bounces-3115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9A8B1111
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 19:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D3F1F27B34
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 17:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231BA16D338;
	Wed, 24 Apr 2024 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCoYCSHx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9B16C423;
	Wed, 24 Apr 2024 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713980066; cv=none; b=tpfwgIJpb+0uKY71aQf68RKJG0nFqe6Att9YJ7xw6gMCYTvktZ1FmxmcC/gLZwm1Aojhl0Gphi5nmphmsSGV2x4oAiERhtiAMcBjQdPq9bU6wpjsoY6LRAZHccGcJzDGYg2azf/qnN39jVQLuELBRCTcJVY837aOjAVacJEnT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713980066; c=relaxed/simple;
	bh=3g+rp8K8bwvWoF0UnQzgDY4BiHIy7JIhe8O7E/yKVB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nsz+SVjhZsk1Xvh7uT45ILcN38XpV6fRXGrXCMlO+0UO+JqCfbP47O4CuP2zLnzyNOgICA4DNWnXyvHkt4agEPmF0583Z71dYVf+c+jHXZjnu35dUuhAc7fylic0LbrLQLUu75ky9x3ezwu9HNBnMu0eSTfFyiyUhbt2pq/Z708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCoYCSHx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79556C113CD;
	Wed, 24 Apr 2024 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713980066;
	bh=3g+rp8K8bwvWoF0UnQzgDY4BiHIy7JIhe8O7E/yKVB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCoYCSHxTJDj9oIeKKiCDiLnKfm4Ra5kMlyWGHLC7aj6qxhGt+QLuQeNe+8CSqOrp
	 mPHN75Hr2JAWJnJMJu3I/PoYx+SHUqIqXsHi/kPp7anPOkVbJdIuk4Unu1+e6QiPxP
	 2Or0glkWFDMkiGUTU2K8JxvJSrnmuAhA+Jhf0kblq4bDQL0x1bxa3O0aq5bit786fm
	 0ic1QEkTy3GauWXYG3my6nWhlnDdqJrF/fTGs2TWkGbV9eDPPG00AKKlk1SijNEU9h
	 WNZlKxcnXdXamxbYuH0abJiZKwJTByaz27XV8lUtuFUUGabWXniNwMRm+EBh3624Bh
	 W91O6UY/Xba3Q==
Date: Wed, 24 Apr 2024 18:34:19 +0100
From: Simon Horman <horms@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 4/4] net: txgbe: Utilize i2c-designware.h
Message-ID: <20240424173419.GO42092@kernel.org>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-5-florian.fainelli@broadcom.com>
 <20240424161406.GM42092@kernel.org>
 <59cbfcf1-d5c4-470b-8c81-67432d6ffc11@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59cbfcf1-d5c4-470b-8c81-67432d6ffc11@broadcom.com>

On Wed, Apr 24, 2024 at 09:22:49AM -0700, Florian Fainelli wrote:
> On 4/24/24 09:14, Simon Horman wrote:
> > On Tue, Apr 23, 2024 at 04:36:22PM -0700, Florian Fainelli wrote:
> > > Rather than open code the i2c_designware string, utilize the newly
> > > defined constant in i2c-designware.h.
> > > 
> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > Hi Florian,
> > 
> > FYI, this conflicts with:
> > 
> > c644920ce922 ("net: txgbe: fix i2c dev name cannot match clkdev")
> > 
> > But a patch-set has been submitted which reverts that commit:
> > 
> > https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/
> 
> That's right, I mentioned in the cover letter this was based on top of
> Duanqiang's couple patches. Thanks Simon!

Thanks Florian,

Sorry for missing that.


