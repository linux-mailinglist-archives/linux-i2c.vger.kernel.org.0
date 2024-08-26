Return-Path: <linux-i2c+bounces-5780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1195E653
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 03:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5F81F21296
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 01:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53721443D;
	Mon, 26 Aug 2024 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zpG3rq55"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C658479;
	Mon, 26 Aug 2024 01:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724635977; cv=none; b=CPrM1BvPi0ug+gNm04DNoRhQMg1hCYaUzRU3GPGvnSaXRgCmehi9aZBxiGfu7NqpiPgNZRB3TYBuG/maG3qBMQX5MRde+kUjtYvlUB9rPxPaXzk8BALD5z3mCMqQPnigKGSGD4Sbusv6jKUST69nQvVUk06BfgJVEAPoPv1UqB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724635977; c=relaxed/simple;
	bh=t8hRP68zdxXnXm09FgZ7FOl2XrKJUXBEPmuPYRNHkIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tv9Pnb3Bqk7kizFHkQeOD3RvNaeWOxC/Nc00CDggzyFS7K9Y0q0kFMsDkhd8EZ5vp/7e3nQF+vUhSV+cw+MzillwJH5gMBHvVTU1grPw1IdoEtqgd8d3Nd7m0CaFscdAWpFowK1iDRPiKah4S+2dc8zTbxP9jhZGKuBhTF4m/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zpG3rq55; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iRPPPGtfVs0dJvN9gXSb9zXS+OUUNcHsGhUAGPwaDQk=; b=zpG3rq55OLuVUrDh/GWPCJKAyE
	wYTUo6xl4G+ks5VoqN46M4fP757ENmmWGMhJWpLUXx0DQKGhRkLM/cfO2aa4UoLXemtA2W2xka3yG
	F2mlnfk504T24ZXmLOStZOIda7IUcqPCajMC7Gitnj4sKXUmeXtxJbYJ3FlitpLC+S7E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1siOaw-005fBD-Oa; Mon, 26 Aug 2024 03:32:34 +0200
Date: Mon, 26 Aug 2024 03:32:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, mengyuanlou@net-swift.com,
	duanqiangwen@net-swift.com
Subject: Re: [PATCH net 0/3] Add I2C bus lock for Wangxun
Message-ID: <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823030242.3083528-1-jiawenwu@trustnetic.com>

On Fri, Aug 23, 2024 at 11:02:39AM +0800, Jiawen Wu wrote:
> Sometimes the driver can not get the SFP information because the I2C bus
> is accessed by the firmware at the same time.

Please could you explain this some more. What firmware?

There some registers which are clear on read. They don't work when you
have multiple entities reading them.

	Andrew

