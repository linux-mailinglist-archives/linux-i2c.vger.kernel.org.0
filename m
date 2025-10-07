Return-Path: <linux-i2c+bounces-13405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8DBC1CF1
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 16:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D64244EB7DF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 14:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7716019755B;
	Tue,  7 Oct 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="werejtPi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A09191F91;
	Tue,  7 Oct 2025 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848643; cv=none; b=LtPXAm0hZ7Ki5V2JajgSM9ylnnXRS9UwZTkjrYr6RVTgN2Ql1auHtkfajun0aM1ASD6OsFN/7disQyy/TYruMbwFU3VxiHyYs+ee2Bm6X4bjg3or6IDxQSGYs7v7XskMVxsCZATOyayaVObehg1QaloXXoVjbbP4ypbdB803Vpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848643; c=relaxed/simple;
	bh=FOa4ABK9etyMxlNgeRgr5EDIZu/NDtr9Qoo59hOU6v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4WUj6KTR2B+TF48f6+bpbqPnlxM1JHxBPOIriF09BvZPT8r3aIOEFIi+GjBpHOjPPkVqqMeRa8kIurS1Hz+9FJN6gX5gUn+YQTh9/QEJiNdMMZ56IOdnhitc06+cqntvbFJmQAGu002+D0hq7AOBtbZyINfx4W9Mks1L/TzsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=werejtPi; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j9qSBvH7gB2I6qZaVa4MtsOhkIyiiMW+/dPkD5nrEKQ=; b=werejtPiV2xqmGhjRsRKbYUXsW
	qR5xY/QfJmjZgbPVst6v6ldSD9F7RCrct8HmVPDAwSrSSvKY9gTEO3DC4nkXBLaV82WOC6raw51lI
	txW5keqMo0nxtILF0Y+q5rYaJB3NClZlMem+Xe2bS8bbgyMNSt6XABVkG3gS3e47mZYk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v691R-00ANOR-AZ; Tue, 07 Oct 2025 16:50:37 +0200
Date: Tue, 7 Oct 2025 16:50:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout with
 total transfer timeout
Message-ID: <a8252fd8-a1cb-40da-bd74-e2f424136a41@lunn.ch>
References: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
 <7dbefacc-3ce0-47ea-b521-102320f49420@lunn.ch>
 <09aa8945c41cdc0c518bddedf8d3489c1e521661.camel@ew.tq-group.com>
 <7470fb97-1991-4347-a084-11f24006b67f@lunn.ch>
 <0007bc39777fc1e09f953be943fd8ce474b054da.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0007bc39777fc1e09f953be943fd8ce474b054da.camel@ew.tq-group.com>

On Tue, Oct 07, 2025 at 04:41:00PM +0200, Matthias Schiffer wrote:
> On Tue, 2025-10-07 at 16:20 +0200, Andrew Lunn wrote:
> > On Tue, Oct 07, 2025 at 04:06:36PM +0200, Matthias Schiffer wrote:
> > > On Tue, 2025-10-07 at 14:34 +0200, Andrew Lunn wrote:
> > > > On Tue, Oct 07, 2025 at 02:09:24PM +0200, Matthias Schiffer wrote:
> > > > > When a target makes use of clock stretching, a timeout of 1ms may not be
> > > > > enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, which
> > > > > takes ~320ms to send its ACK after a flash command has been
> > > > > submitted.
> > > > > 
> > > > > Replace the per-iteration timeout of 1ms with limiting the total
> > > > > transfer time to the timeout set in struct i2c_adapter (defaulting to
> > > > > 1s, configurable through the I2C_TIMEOUT ioctl). While we're at it, also
> > > > > add a cpu_relax() to the busy poll loop.
> > > > 
> > > > 1s is a long time to spin. Maybe it would be better to keep with the
> > > > current spin for 1ms, and then use one of the helpers from iopoll.h to
> > > > do a sleeping wait? Say with 10ms sleeps, up to the 1s maximum?
> > > > 
> > > > 	Andrew
> > > 
> > > Makes sense. I don't think I can use something from iopoll.h directly, as i2c-
> > > ocores has its own ioreadX abstraction to deal with different register widths
> > > and endianesses, but a combination of spin + sleep is probably the way to go.
> > 
> > I think iopoll.h should work.
> > 
> > 
> > 		u8 status = oc_getreg(i2c, reg);
> > 
> > 		if ((status & mask) == val)
> > 			break;
> > 
> > This maps to
> > 
> > u8 status;
> >      
> > ret = read_poll_timeout(oc_getreg, status, (status & mask) == val,
> >                        10000, 1000000, false, i2c, reg);
> > 
> > Andrew
> 
> Ah, you are right, that should work.
> 
> If we want to keep the spin case for short waits, not duplicating the read and
> mask check seems preferable to me though - maybe something like the following
> (which could also be extended to exponentially increasing sleeps or similar if
> we want to start with something smaller than 10ms):

I think something like this will work:

u8 status;

ret = read_poll_timeout_atomic(oc_getreg, status, (status & mask) == val,
                              100, 1000, false, i2c, reg);

if (ret != ETIMEDOUT)
    return ret;

return read_poll_timeout(oc_getreg, status, (status & mask) == val,
                         10000, 1000000, false, i2c, reg);

which probably ends up being the same length, but simpler than the
current ocores_wait().

	Andrew

