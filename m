Return-Path: <linux-i2c+bounces-13402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE9BC1B14
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 16:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564D73AC7C1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 14:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD3C1E835D;
	Tue,  7 Oct 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VnsfuAtE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164752D94A0;
	Tue,  7 Oct 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846832; cv=none; b=O9f6IH2GGYXm1Ag7Z1xwHbfdPEpK1Kuy1h3PxxDEJooTK0zfomlRGsd4yGVhDD+25hgi22vXrXb2ZcRSrqjfPbFLtJT6G6h/CoBK/3wmOqsD55s3/2GdrYOCegCNR0vk/mVUXx0V4mwsYIl1xkEFR2TrU5ribmuwG9/bA18BtI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846832; c=relaxed/simple;
	bh=gZcVRVTLPwM+bJdCp1dnSH4pB3y4UG3AzW5r8bJ0Tcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlKV4LKexbzEUR80rppBpqFodS0YArbXuauEclaxdA2g9Q1SsGBKq2sjWJ7NcNROzm/QsDPOkjPIMfhNVWnz86rte1xDTmP5lDkvoLHTIDbAnp6v/PzTuf+zaFVLbXxVJmfc4HihFv/K79Lxc7B6xN4Nbyncze1D8KZ964iApIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=VnsfuAtE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FsovRwnfcYyTlN5NPaIbZ7Ow+PuE+Xi6DcLbuQc67WQ=; b=VnsfuAtEhr3Y4oVu/wiDZ5pFhH
	FOTTEHhGwrd193yPDCqqto1g4fNfCqyqvB/+yc6nxuB6GOT1nog815K1AOstj47IbgSokSjmaTm4X
	eFHITeBO8fw6110ihvku+4Muq6qZtBze4xKOUKGSgZSPWAWNCCaF0yp/3oFP1nvVl+3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v68Y9-00ANK7-BM; Tue, 07 Oct 2025 16:20:21 +0200
Date: Tue, 7 Oct 2025 16:20:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout with
 total transfer timeout
Message-ID: <7470fb97-1991-4347-a084-11f24006b67f@lunn.ch>
References: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
 <7dbefacc-3ce0-47ea-b521-102320f49420@lunn.ch>
 <09aa8945c41cdc0c518bddedf8d3489c1e521661.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09aa8945c41cdc0c518bddedf8d3489c1e521661.camel@ew.tq-group.com>

On Tue, Oct 07, 2025 at 04:06:36PM +0200, Matthias Schiffer wrote:
> On Tue, 2025-10-07 at 14:34 +0200, Andrew Lunn wrote:
> > On Tue, Oct 07, 2025 at 02:09:24PM +0200, Matthias Schiffer wrote:
> > > When a target makes use of clock stretching, a timeout of 1ms may not be
> > > enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, which
> > > takes ~320ms to send its ACK after a flash command has been
> > > submitted.
> > > 
> > > Replace the per-iteration timeout of 1ms with limiting the total
> > > transfer time to the timeout set in struct i2c_adapter (defaulting to
> > > 1s, configurable through the I2C_TIMEOUT ioctl). While we're at it, also
> > > add a cpu_relax() to the busy poll loop.
> > 
> > 1s is a long time to spin. Maybe it would be better to keep with the
> > current spin for 1ms, and then use one of the helpers from iopoll.h to
> > do a sleeping wait? Say with 10ms sleeps, up to the 1s maximum?
> > 
> > 	Andrew
> 
> Makes sense. I don't think I can use something from iopoll.h directly, as i2c-
> ocores has its own ioreadX abstraction to deal with different register widths
> and endianesses, but a combination of spin + sleep is probably the way to go.

I think iopoll.h should work.


		u8 status = oc_getreg(i2c, reg);

		if ((status & mask) == val)
			break;

This maps to

u8 status;
     
ret = read_poll_timeout(oc_getreg, status, (status & mask) == val,
                       10000, 1000000, false, i2c, reg);

Andrew

