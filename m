Return-Path: <linux-i2c+bounces-2876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777D89FB86
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 17:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3D24B27DBA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 15:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F1516DEDC;
	Wed, 10 Apr 2024 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXZkqCa5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F215EFBF;
	Wed, 10 Apr 2024 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762736; cv=none; b=XMJkNy2RjjmsT4IHN3ZFhVYbdFrfFGP0mYumOM9KqWm+yE5pW8f/rPtCDsEgv6d3ue7PWEKLI6syKCNV3PIrvxsDe4O+IVbJJIuAuEgLl4z9KJeAIooGGZ1lWgs7ArYdL8UbbQJ+OASj4gze5ENHPI0uGpF3QkHkKs0Vo7msB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762736; c=relaxed/simple;
	bh=LQ/3a9IWIRDOqBxwrTVme9CWku1ILOMQBl7mQRLiAWo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suq5eW4F3qM4OOzKzI4p9KGWp58lYcw5CJSXEgqqMUNtr6mvDwT974SzlzeSNgZSpXCAp7o63cvOpH0lubo50Q1tUSa35FF/pGV/pzCDPkssDGi+ILeR/FRGb7GfdxtihOAsUiZvvhheq7wLvwefyBhsXH51gY0N5c9jmd7NVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXZkqCa5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575CDC433F1;
	Wed, 10 Apr 2024 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712762735;
	bh=LQ/3a9IWIRDOqBxwrTVme9CWku1ILOMQBl7mQRLiAWo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=HXZkqCa5C0cWESyOvDvsdJ7721ywkhj/ZHDFrvD0IPpt97pujLFOxypMEA9gROI/E
	 2f60JkFVXQSBcP62ktSdW5Sp+dbS4S0iOCvLYqDeAIPwmVaEKjjIcRuNpBELHUXSp/
	 4xe+yjxKl08Sp5q9dpHF4yKlqjz+YASdD6MPd/ZYSBkfk2eJfq+GTld7hZbIPJvrsZ
	 /gcSdMLe0UdDc6O0EXmeEAO89UeSGXMOBdyx2yqqqPPnzUpGry+b2wf4PB7zAcLH3+
	 3Bfkk2kgYJMrp39G0/2VtCdQe3R3wDp0gzMuxXGEGxNG8VCEY/8SdRUXL3ekVPbeVg
	 YZ11CgOGXfeDQ==
Date: Wed, 10 Apr 2024 17:25:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
Message-ID: <26y3smrxv3q56peuqatospr3q6annxvdmleyhykyrjrovne6mu@yg44mmr7aaqp>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
 <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
 <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>

> > >  	out_8(&cpm->i2c_reg->i2mod, 0x00);
> > > -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
> > > +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
> > 
> > I2COM_MASTER might be coming from the datasheet.
> 
> Maybe we can just drop the comment? The value we write is pretty
> self-explaining.

indeed.

Andi

