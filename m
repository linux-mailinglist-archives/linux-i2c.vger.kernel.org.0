Return-Path: <linux-i2c+bounces-7279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F399544B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 18:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1C5289C1F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 16:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF01E102E;
	Tue,  8 Oct 2024 16:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPq5lP35"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74821E1028;
	Tue,  8 Oct 2024 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404514; cv=none; b=e2+scBHUzMpQZa5bk0A31eR7/iW2f7nBVVjKz4JrZGjgXqWgmMd2Y7aSYFH7f17wZPyaX94sVSy1jQoiF+vYGphnA2ADHdXryY6WAIzvC5y0RJtruce6kUWH7BlyubjhmZE7mUzRwfm7V1I/5eLRYssY33ThiPL7LHzo0p7/exc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404514; c=relaxed/simple;
	bh=56j0MbqjsKqUdLUCTSs6ZzNdm7C7JX746nf3ep8nc10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8wxhUbbtoolsAUOq4A32VoaEO/uD9AkCo4ODhV9uCuqqL4RMXHYcTMwKJcZJ8Ypxeo4OHFKB+h5Z7VIXTxFyiIM7vNNiZdXxe1FoltEJj75FdgIvKZKtheXRP+v0N0QVpY8YthNIeXvLQpaTAdKKaa52aJj+vhBWhnKygmo+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPq5lP35; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728404513; x=1759940513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=56j0MbqjsKqUdLUCTSs6ZzNdm7C7JX746nf3ep8nc10=;
  b=fPq5lP35+GJWZCFohh+2tU5Zh0Qa05TSL6TK+cJhOIh28WpAfKte87KG
   iHhqOkiAEQG/bf6WNHSTU+mbgg/pa2JvvHTNczoTRhzrlPTovJbvUpYOu
   yw7+rBLdr52hsVR4gufYyYyCELhg1O6amsll5+5V3C/OAl+xQsjeKfqWB
   g2HCZ7qAin6hjQyCCjv3Mpq//QTKLPKd82e+1VhfxyQVlt7Jkd/ezRsGm
   nA53LeYGqHqQMDSJu8NQ25vvheWRxVCR0+uSF4aI3mNArAdT26VoliYA5
   Ycu5/IPFR3apBHp8RscK9XTIj75CnBdoeJ5iJxzb7nuxryragxuyS658I
   Q==;
X-CSE-ConnectionGUID: uWuqgOhpQSGWBYXWxnRUxQ==
X-CSE-MsgGUID: 5WMImFCjSXev3LpIe86Dbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31320321"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="31320321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 09:21:52 -0700
X-CSE-ConnectionGUID: dcEKRUjyQ5ypUQhDSIsasQ==
X-CSE-MsgGUID: xEP1D9qhTWy6MIHneojlzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="76251435"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 09:21:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 23E3020F; Tue, 08 Oct 2024 19:21:46 +0300 (EEST)
Date: Tue, 8 Oct 2024 19:21:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <ZwVcGu3YeJ6pI0sM@black.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
 <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
 <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 10:29:10AM +0800, Tyrone Ting wrote:
> Hi Andy:
> 
> Thank you for your comments.
> 
> After a second thought, I'll explain why slave_addr << 1 is given here.
> 
> Tyrone Ting <warp5tw@gmail.com> 於 2024年10月4日 週五 上午9:49寫道：
> >
> > Hi Andy:
> >
> > Thank you for your comments and they'll be addressed.
> >
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年10月1日 週二 下午9:17寫道：
> > >
> > > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > >
> > > > Store the client address earlier since it might get called in
> > > > the i2c_recover_bus() logic flow at the early stage of
> > > > npcm_i2c_master_xfer().
> > >
> > > ...
> > >
> > > > +     /*
> > > > +      * Previously, the address was stored w/o left-shift by one bit and
> > > > +      * with that shift in the following call to npcm_i2c_master_start_xmit().
> > > > +      *
> > > > +      * Since there are cases that the i2c_recover_bus() gets called at the
> > > > +      * early stage of npcm_i2c_master_xfer(), the address is stored with
> > > > +      * the shift and used in the i2c_recover_bus().
> > > > +      *
> > > > +      * The address is stored from bit 1 to bit 7 in the register for
> > > > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > > > +      */
> > > > +     bus->dest_addr = slave_addr << 1;
> > >
> > > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> > >
> 
> The current implementation of i2c_8bit_addr_from_msg() (ref link:
> https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
> is
> "return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
> extra consideration about the read flag when retrieving the i2c
> address.
> IOW, if there is a read event, the i2c address contains a read
> indication (bit 0 of the i2c address is 1).
> 
> The patch code "bus->dest_addr = slave_addr << 1;" might get used in
> i2c_recover_bus() later. (ref link:
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L1691)
> 
> Suppose there is a read event and the i2c address is 0x60.
> 
> With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
> With the original patch, bus->dest_addr will be 0xc0.
> 
> If some error condition occurs and it requires i2c_recover_bus() to
> recover the bus, according to the description at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L1742,
> the address "0xc1" is used
> as a parameter to npcm_i2c_wr_byte() which is used to send the address
> in the write direction.
> 
> If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
> described at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L1742,
> which is about to send
> an address in a write direction since the address from
> i2c_8bit_addr_from_msg() contains a read indication.

Okay, then I would do the i2c_8bit_addr_from_msg() call here as AFAICS
this is the real event where you save the address *of the event*.

And in the respective user update the comment to summarize above and do
rather ->dest_addr & ~I2C_M_RD there.

-- 
With Best Regards,
Andy Shevchenko



