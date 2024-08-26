Return-Path: <linux-i2c+bounces-5783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E095E6BC
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 04:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D6AC1F217BB
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 02:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7D7BA50;
	Mon, 26 Aug 2024 02:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uZ4ud1B+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2A266A7;
	Mon, 26 Aug 2024 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724639653; cv=none; b=shzR82yVtg7WpWB0Lgs4LSHkFmaIpGp5un9geQr6mP3134J/Fj8seAwqvTwAd22Rj7tp+oZ9XBs87wsLURtRhkOAXjgTR+pZUPfL5JSL1K7I/2+ufItv0Z1ZR1HYr3fl+RTWRNHOVEhz+wich2wyABO3cPzqFd7fSAYn9+FFG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724639653; c=relaxed/simple;
	bh=XFwCdiRqD8KbMHhOnUn5gZn/z1fT216PI43Mv0zZByY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk9ipTETyrkJUFV/dr3Q/eqWIftYqqm1C8w4oerBym8GzIyW3xjdvzDYKdU6F8TTgJAboo5saYH8fKsXNn4ODBwewCgd7Bdqt3lWqlgEfjHyx5/U1mVHt2XHTmlsDKLDMn2P0o1y3s/NspN5wYMSTL2RpNYCyNP785TBAn1dnF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uZ4ud1B+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=adFmv7fY6JyWCpgyvzJgNvSpo9ewuSk0pkwBsnmVVd4=; b=uZ4ud1B+yutGNlv1nD0CPgXKOF
	6mQLu4bb94TOoyBVK9OVA0FVa8hALIfigVV2ZmgqFvIw2Swhxvs95sNM6X3tKk0v2M7Iab/ke1tfF
	4HAiCV1rBNv2WIkdvUbWb+uMb2t/UC397dGsLF/WWrkU0gZaBqk7yWIdjtTkKBKSfrHQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1siPYF-005fNc-2d; Mon, 26 Aug 2024 04:33:51 +0200
Date: Mon, 26 Aug 2024 04:33:51 +0200
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
Message-ID: <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch>
 <01d701daf75c$50db4450$f291ccf0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d701daf75c$50db4450$f291ccf0$@trustnetic.com>

On Mon, Aug 26, 2024 at 10:04:42AM +0800, Jiawen Wu wrote:
> On Mon, Aug 26, 2024 9:33 AM, Andrew Lunn wrote:
> > On Fri, Aug 23, 2024 at 11:02:39AM +0800, Jiawen Wu wrote:
> > > Sometimes the driver can not get the SFP information because the I2C bus
> > > is accessed by the firmware at the same time.
> > 
> > Please could you explain this some more. What firmware?
> 
> It's the firmware of our ethernet devices.
> 
> > There some registers which are clear on read. They don't work when you
> > have multiple entities reading them.
> 
> I'm not trying to multiple access the I2C registers, but these registers cannot
> be accessed by other interfaces in the process of reading complete information
> each time. So there is a semaphore needed that locks up the entire read process.

More details please.

Linux assume it is driving the hardware. Your firmware cannot be
touching any registers which will clear on read. QSFP states that
registers 3-31 of page 0 are all clear on read, for example. The
firmware should also not be setting any registers, otherwise you can
confuse Linux which assumes registers it set stay set, because it is
controlling the hardware.

Your firmware also needs to handle that Linux can change the page. If
the firmware changes the page, it must restore it back to whatever
page Linux selected, etc.

The fact you are submitting this for net suggests you have seen real
issues. Please describe what those issues are.

	Andrew



