Return-Path: <linux-i2c+bounces-13400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA7BC15F3
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 14:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A2D188D112
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 12:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A672DCC17;
	Tue,  7 Oct 2025 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eUqWWGrZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4A2D979F;
	Tue,  7 Oct 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840471; cv=none; b=HdATcyjFJb8u6pWPd1pUEVm9pfHICriNeDkyvOBOm7pPgdR/ui136wi88lZ14DYGhIQJytP7sSEmDVDMUuBpOirkVD94/xJPf3mZqauX1++0iOhiUCydTFiLixblgr/7CZpR/OjKOr9II/lV46Xgaw2uSFxpgGsdV+Haa8LlUaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840471; c=relaxed/simple;
	bh=Q+x/tyllQSCVP1N45CGsf/4/VXsOzjtdlTK7trEnYDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJngu0rBNF3iOk0zegq0FSkIC0Ie7FWOresCCyzWxWaf754pP/Kvu8VASJVJoavFL5OH72FrNBgPHR3qP3O/2302wibcBNBBdFdu7gyzEkH2LOqFDlNeq+t1K9WISa94fOa6f/NWXft5gWDg3BpphebT3h1xdDZjpdEVOm18Cm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eUqWWGrZ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CeR/nNVfj2ruH5KoFVbRCO4/42mMYrtwrDmRcpDO6cs=; b=eUqWWGrZExXmyV2Ncbg6pOFbXA
	g14WbrUbS88ZpBPuKEVVoOLVScCaem2C6Jnf91E7C6K6rqaTvz8vhktmm+JeNSpMtPGGS5qsxLTk/
	D6eFR5thMF66QxW+E9swrITHXkDWjQrweJkA5dHG7/VBbd8PDsf9OOI97Bkp5TXRzBfk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v66td-00AMkH-BM; Tue, 07 Oct 2025 14:34:25 +0200
Date: Tue, 7 Oct 2025 14:34:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout with
 total transfer timeout
Message-ID: <7dbefacc-3ce0-47ea-b521-102320f49420@lunn.ch>
References: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>

On Tue, Oct 07, 2025 at 02:09:24PM +0200, Matthias Schiffer wrote:
> When a target makes use of clock stretching, a timeout of 1ms may not be
> enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, which
> takes ~320ms to send its ACK after a flash command has been
> submitted.
> 
> Replace the per-iteration timeout of 1ms with limiting the total
> transfer time to the timeout set in struct i2c_adapter (defaulting to
> 1s, configurable through the I2C_TIMEOUT ioctl). While we're at it, also
> add a cpu_relax() to the busy poll loop.

1s is a long time to spin. Maybe it would be better to keep with the
current spin for 1ms, and then use one of the helpers from iopoll.h to
do a sleeping wait? Say with 10ms sleeps, up to the 1s maximum?

	Andrew

