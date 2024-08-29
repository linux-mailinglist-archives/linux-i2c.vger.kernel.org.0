Return-Path: <linux-i2c+bounces-5932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4C964A03
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 17:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D884C28412E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 15:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFA51B29AD;
	Thu, 29 Aug 2024 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LA3ziV72"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF81B1B1D6A;
	Thu, 29 Aug 2024 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945287; cv=none; b=OXrdUn3gKxTMwtCzkwxuGzC7oipc8mQ4WjDsrMuJuE1lNOVrGjlNHlwO2xRriJ4+gw2KnpdZyL00PfBVJTv03RsZvJUkkQiThjGBqpUELTxiFSht2emGTgrLe8fG12DgaCClOCB7ZeQV8IAgffrKt6hgj7m+rNIvPUnT0E6/e0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945287; c=relaxed/simple;
	bh=j3wF1/+CjvrnFq96OzU1cabBWLL9M370ULdhiAke8Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es23Jr+354Z3t8/T9+LR/+JfBGRGWNM4JyJbfZjNSS1yfPivETMwxVW9E/LPb0G+j7+aAQ9V4f0mxDm6e4J7GSxvtFcs9OsRMru5+dAeRPiLHIIbPlVR+NReVSDEAcLUAjIe9HAsci7VkSK/bOyujdCOBN7C4Ma8HIFAIlIcIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=LA3ziV72; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iYajlu8nXcp9mdsq8dnR8bmfv3P3vLA5E9s6fy855Cg=; b=LA3ziV72IQuhqZuwGvmgCj8sJq
	WI87+SDWfySdfgWdn2/0B7s7uuC7xlC2zQf10rAYMDN9u0/Ldrd0sb/l18485jA3DhlxAQs0wkL+y
	k9km6FT6vSvVzbcZwmBkt943v716zSecJSyUQwjxDDQzRxUnlNBueU5HyWJUa8JQcpZg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sjh3t-00637r-K7; Thu, 29 Aug 2024 17:27:49 +0200
Date: Thu, 29 Aug 2024 17:27:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com
Subject: Re: [PATCH net 0/3] Add I2C bus lock for Wangxun
Message-ID: <d91674af-1682-4efe-ad15-bd64f871c1de@lunn.ch>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch>
 <01d701daf75c$50db4450$f291ccf0$@trustnetic.com>
 <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch>
 <020f01daf827$d765ffd0$8631ff70$@trustnetic.com>
 <509abfeb-b1fb-4c53-9898-6106c8dde411@lunn.ch>
 <02a001daf9de$529edd90$f7dc98b0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02a001daf9de$529edd90$f7dc98b0$@trustnetic.com>

> > O.K, that is bad. The SFP is totally unreliable...
> > 
> > You however have still not answered my question. What is the firmware
> > accessing? How does it handle pages?
> >
> > The hack you have put in place is per i2c transaction. But accessing
> > pages is likely to be multiple transactions. One to change the page,
> > followed by a few reads/writes in the new page, then maybe followed by
> > a transactions to return to page 0.
> 
> Do you mean the bus address A0 or A2? Firmware accesses I2C just like driver,
> but it only change the page once per full transaction, during a possession of
> the semaphore.  What you fear seems unlikely to happen.

What sort of SFP is this? QSFP byte 127 selects the page for addresses
128-255. Paged 0 and 3 are mandatory, pages 1 and 2 are optional.

SFP+ also uses byte 127 in the same way:

10.3 Optional Page Select Byte [Address A2h, Byte 127]

In order to provide memory space for DWDM and CDR control functions
and for other potential extensions, multiple Pages can be defined for
the upper half of the A2h address space. At startup the value of byte
127 defaults to 00h, which points to the User EEPROM. This ensures
backward compatibility for transceivers that do not implement the
optional Page structure. When a Page value is written to byte 127,
subsequent reads and writes to bytes 128-255 are made to the relevant
Page.

This specification defines functions in Pages 00h-02h. Pages 03-7Fh
are reserved for future use. Writing the value of a non-supported Page
shall not be accepted by the transceiver. The Page Select byte shall
revert to 0 and read / write operations shall be to the unpaged A2h
memory map.

ethtool allows you to access more than page 0.

ethtool -m|--dump-module-eeprom|--module-info devname [raw on|off]
        [hex on|off] [offset N] [length N] [page N] [bank N] [i2c N]

> > I think your best solution is to simply take the mutex and never
> > release it. Block your firmware from accessing the SFP.
> 
> Firmware accesses the SFP in order to provide information to the BMC.
> So it cannot simply be blocked.

Then you have a design problem. And i don't think locking the I2C bus
per transaction is sufficient.

	Andrew

