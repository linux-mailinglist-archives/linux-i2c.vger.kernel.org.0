Return-Path: <linux-i2c+bounces-9891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F4A680A8
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 00:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31668423617
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 23:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445C61F8753;
	Tue, 18 Mar 2025 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6fA4BmZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031741DED62
	for <linux-i2c@vger.kernel.org>; Tue, 18 Mar 2025 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742340168; cv=none; b=VhFbKnUANJNXpMd2L0jp/KxZzk/YmU/E8Vh8eRAMGD0Gmn0O+K0UnhZlLE+dF0CfNagS+QWQuQZqjN8C6P/kuBx9CMGJkKBw1UnoPaH+hYwWi7JwAhChGtt+FlW1T+LiDF/p/MkQd7Pes/8P59Opw0Q5/smybp0QyO7KcP2501E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742340168; c=relaxed/simple;
	bh=uldzqid6VB8VahhmxyL4MHbHco4UsYBJFGTxjlGWRZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwP5ZEc3T/tMevK3kZvd7dzk+zkQmXAmPszuyb9ux3SxirxZk7PoAvIoz/VgM5Lc4a5OEj+blsaDh+6UVNuobqJ5k7ksj57M/XBgTIYddx1Ct4m1VWIWfVK/IflSCvgW+025v/D3Gf7605oi5Hrocu4oyCnzgsBuIyW6ivo/g+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6fA4BmZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C480BC4CEDD;
	Tue, 18 Mar 2025 23:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742340167;
	bh=uldzqid6VB8VahhmxyL4MHbHco4UsYBJFGTxjlGWRZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6fA4BmZj7u1j7mH/9UyNHUxdw5CsaoGAN/GeY4mdTz/FgRSGV8wR3tPaj9fuejlt
	 D6cU4IcrjSWOLbv+OFcTqdeOLWiXAvCoFtXLM2hzXqS8FgwtteMGSO6exVIy86Qkht
	 3y0D5kRGUstwMktCuQ/dvexxglqH8rZM6m6yto5cg08oqmCkbrxxye3j/yrQt32rsF
	 PxI7FwUMEj6Cr8yjBg+mf1xImDCzp98GNvm0SkwGwMDvmEdkLMU+be68nNmx95d5qQ
	 9mSIRFiD6Ck6hP1HK6aiL8s/oYvEKreIm+UBuS3/8vKEdwF7YFX5dNnaklEemeeiIP
	 XLwJHNEin6eoQ==
Date: Wed, 19 Mar 2025 00:22:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
Message-ID: <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
 <Z9nxRwoeLEriKP84@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9nxRwoeLEriKP84@surfacebook.localdomain>

Hi Andy,

On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
> > Switch to iomapped register access as a prerequisite for adding
> > support for MMIO register access.
> 
> I believe that I at least discussed the similar change a few years ago or even
> proposed a one. The problem here is that *_p() variants of IO port accessors
> are not the same as non-_p ones. And commit message is kept silent about
> possible consequences of this change.
> 
> So, at bare minumum it would be good to test for some period of time before
> going for it.

How would you do it?

Andi

