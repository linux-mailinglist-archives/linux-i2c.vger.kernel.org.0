Return-Path: <linux-i2c+bounces-4808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BF92C625
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 00:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22EA2B2212E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 22:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F3C187841;
	Tue,  9 Jul 2024 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJQvsMi4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B1182A6B;
	Tue,  9 Jul 2024 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720563321; cv=none; b=YWDf6Zw8zzEPYMSz/ZQ5/HNig/1edewYwXdWdD7fbkSSDXd+kkfK8pARuHZfiUfsllCupnMQh0bqY8460ZfmJaIanzHPLtsva/+tD+8Y3AQlc8UCMutcglg+GtdK6UNrgwkbUHAgYLNzkGLS4aKa5cqCTH2K+IGX0aPGRkaOtsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720563321; c=relaxed/simple;
	bh=1SxciMdW/vlSt+GNZuhtzLOZVqUkHi0KwZHiJ6FVPw4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cblbXlhTwX7RsaaYiM+w/84Yva9lbn9S3fKbVHcQ/zrJB7izi5k5CzBHIC8yr7YY3cOGeK5FlkzDzSxUd+4ycAFO6t8LcKHBq4ExI1fxq4nwrBFqNOTly5XOvLCx/J3+LfrWLpMFMedQB2flCI+CaXRYAfFTl9dp4P19QguoBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJQvsMi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E07C3277B;
	Tue,  9 Jul 2024 22:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720563320;
	bh=1SxciMdW/vlSt+GNZuhtzLOZVqUkHi0KwZHiJ6FVPw4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nJQvsMi4B5Z31mNtCM47t7mr5rOw/oZ+vTBumUTbLkl5m13dJGhtHC6aL+kSCHOrd
	 e7NiEtHgRDzhAajYW4A9Tob3X9HSlw4lJ5S4XIv6gzyo+PQxu9ZmCxPhjPXy5aO2+v
	 Al/xT2A/pn8cakT5zy44Dybbv5y1UJ7smIYrrgP1sg93XmB/hfXQicvURcNYDmhlc6
	 J9DPZdGuyKINIcYMCunUqdxhW1rj61vb6OK264sqzQ+ngJSwbg/ii/ehH/CFOeMLPz
	 vMk3ommj4GPrivP59/MVvK7JMHI80yrw5e9bwDO4d80Q/5A+s1DCcs4ZpP29hsHr2+
	 Sv23T9v/YrkHw==
Date: Wed, 10 Jul 2024 00:15:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/60] i2c: cp2615: reword according to newest
 specification
Message-ID: <fihr4etj2t36nlg7zftjvmi24hv7z4oene5tfjzxt6eejponxq@ighv4j3xhrty>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
 <188d9071-01f5-4e81-9427-5b8397864211@sch.bme.hu>
 <Zole1BYectz6k2rV@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zole1BYectz6k2rV@shikoro>

Hi,

> > > -	.master_xfer	= cp2615_i2c_master_xfer,
> > > -	.functionality	= cp2615_i2c_func,
> > > +	.xfer = cp2615_i2c_xfer,
> > > +	.functionality = cp2615_i2c_func,
> > >   };
> > >   /*
> > 
> > I don't understand the need for the whitespace changes.
> 
> If you have only one space in such struct initializations, you can
> change later only the line you are interested in. If you have aligned
> them with tabs, you sometimes change one line and need to realign the
> whole block. This is annoying and spoils history a little.

TBH looks also better. For just to fields in the struct I don't
see it necessary to put the elements in columns.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

