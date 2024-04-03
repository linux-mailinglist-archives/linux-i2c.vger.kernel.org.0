Return-Path: <linux-i2c+bounces-2757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0D897C01
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 01:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9BA1F27B07
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 23:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABFA156227;
	Wed,  3 Apr 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klRqBzJq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96CE15696C
	for <linux-i2c@vger.kernel.org>; Wed,  3 Apr 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186701; cv=none; b=YILZ494NcMb7dIYY6hQiwpf60oGXCDzrznN9hvZzkfNCDwUiTEz2sr4ZhvYDImTK46WAq5rWVB+9EcnajbSaB+/WrXWI+jWoZaFCCnBZDLmZMYY7Uho/gMKiO/eRN2wtn6lrNBljj5U++xb97+aoZ2/9Yw7VSTT6DLbtTsWfgeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186701; c=relaxed/simple;
	bh=3dQhYhXX+NgTKECIVLUZrGB0K0rLaHTuz7CMfo/EkFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5FYeS/ZlEEKmVbm1sDNaqoYx6paoGww3Hzq119Heai59S4lw2vSaOW4o+bruKPkwa25UkzG+3/IRhKyDJXhYz+p6n9cVIVOI+gN0dBf4gdNnjdtty6HJIqixdPe1iVPYSve4cf7qp65SdZe+V7wSFMDjb2tCvPYiEKrXOJ7RdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klRqBzJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5466CC433C7;
	Wed,  3 Apr 2024 23:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712186701;
	bh=3dQhYhXX+NgTKECIVLUZrGB0K0rLaHTuz7CMfo/EkFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klRqBzJqX4CYHv7rUI4rJY/8qCLYyjLJaYNA1Cxh0PfmcNA4xcrEJEPZeLqbZyNYu
	 iob788q/J2EO2UIvHhu+uJPwxntPrEfK5c6bFwaIoOpdiHFT4uEwP7E6z8ic8nsg9l
	 2qJJXwIiHMA+HvPFmSjJMtPNseHdJVTF1J2hE3DPN51A8WMatwwHzjcWX4hTDCtZVW
	 sPlkGlQMEVbY8GzMWbN8mDd5yf6/m5lX8U3PzDawRiVnDjj96r0JS8IpKMZDPurB+i
	 hiKIe2ltE9UWIw/l25mkLX6ZDdYGRL5CnlXo9o+iynnaUAUgo1ZnJeKXFrTXFayYek
	 eG1smeP8KpUyg==
Date: Thu, 4 Apr 2024 01:24:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Call i2c_register_spd for muxed child segments
Message-ID: <ucg3nwboyzm5hwml3ce6kpsvhfrmzt7g7h5m4r477bnmt4blzv@rww45hznmwlu>
References: <f9df04f6-9dc2-4874-bc6c-473dc3d692b9@gmail.com>
 <171184484323.16458.16364948555678328368.b4-ty@kernel.org>
 <4cb242be-2dbf-4b6d-a962-42e31df165d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb242be-2dbf-4b6d-a962-42e31df165d0@gmail.com>

Hi Heiner,

On Wed, Apr 03, 2024 at 09:18:04PM +0200, Heiner Kallweit wrote:
> On 31.03.2024 01:27, Andi Shyti wrote:
> > Hi
> > 
> > On Tue, 26 Mar 2024 21:42:44 +0100, Heiner Kallweit wrote:
> >> Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
> >> this creates the i2c adapters for the muxed child segments.
> >> We can use the bus notifier mechanism to check for creation of the
> >> child i2d adapters, and call i2c_register_spd() for them. This allows
> >> to detect all DIMM's on systems with more than 8 memory slots.
> >>
> >>
> >> [...]
> > 
> > Applied to i2c/i2c-host on
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > 
> I don't see the patch in this repo. Technical problem or any other
> reason I may be missing?

It's there, so that either I forgot to push it or you checked
something else. In any case, thanks for checking and please,
don't hesitate to ping when you see something unusual.

Andi

PS I'm setting up some new scripts for handling the whole thing,
so that it's likely that sometimes might I miss the order of
things :-)

> > Thank you,
> > Andi
> > 
> Heiner
> 
> > Patches applied
> > ===============
> > [1/1] i2c: i801: Call i2c_register_spd for muxed child segments
> >       commit: d33bd3b707f476efcb907a7fd3ba3352f49775ed
> > 
> 

