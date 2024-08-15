Return-Path: <linux-i2c+bounces-5444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D3953D8C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 00:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AAFE28257B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 22:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD862155C80;
	Thu, 15 Aug 2024 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8P3EDHw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88600155749;
	Thu, 15 Aug 2024 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762116; cv=none; b=hGjxCMwlICyUg9gnlZSDm6Y2NXz98fBZNvNy2cIefKWmvPdW7lZjPLfg5DF4SxRUNFIMdyKoi/fy5bXP1nL9fpE3FOfrlaiRHTy6DxJJyu852vLEwJ6UEr7l3Qn1FOofIUOqaNXbM6lxHaV0athS28sD2X72r2q5wtJZ/j59GlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762116; c=relaxed/simple;
	bh=iDXaL3PgPtaL78Posd8L2U/dDWjO2qga+a8I7G+pm5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdtHOB5srBlNyDLwp/a0uoJbx8AJiWA6bg0CsP1DPO2teEcYdPJc8kRD3X/jVneb8JIvvnssiYFXvnE7geTJJk7T6LB7DkgGZnbg+iayZapyPI+aqvYfcsRrFAgHjMT+kIqD7nGVHViWj7AUjOG8R1ihCUS+Hx6AgJfm8pHicpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8P3EDHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6EBC32786;
	Thu, 15 Aug 2024 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723762116;
	bh=iDXaL3PgPtaL78Posd8L2U/dDWjO2qga+a8I7G+pm5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8P3EDHw56bBuFWtIkImDRjzjuIBvzQOSqA1Olv2fZ/ObxH6wgX7JSKU9MsQ6F3tD
	 y+QKU80YGmll6WuScH/WkO8jTt/I+nbS5X4CqH5q+r41JOSBFfxYx8Lc7trUMYsAFD
	 dw3wEFWJhhjxX6OiejfzIvN1Tk4aMvRCy/3xv1efBiYEXS7mOOWYJ9FEmysMpFdoub
	 znp0Ok+S3coMRc2Le3NVsF7D3fq/Ee+3ALmtZjyTxck8YtOzGM/RLbMRgTfdqfjIFn
	 O2tSWKIZYoQSjrudys34JqfJ9d3cMDu0RaqUJB2ePogYfjpDmz8hNSkZv6MT+Jhgqv
	 r6Lxjwv8Xhl6Q==
Date: Thu, 15 Aug 2024 16:48:35 -0600
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH v2 dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
Message-ID: <20240815224835.GA3287461-robh@kernel.org>
References: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>

On Thu, Aug 15, 2024 at 11:40:10PM +0200, Wolfram Sang wrote:
> "smbus_alert" is currently listed as an interrupt for targets. This is
> wrong, it is an interrupt for the controller. The mistake (mea culpa!)
> was already in the originating "i2c.txt" file in the Linux Kernel. Time
> to fix it. Make small changes to descriptions to use inclusive language
> while we are here.
> 
> Changes since v1:
> * use "contains" instead of "items" in patch 2+3
> * drop "irq" binding from patch 3
> * checked with dt-doc-validate now
> 
> Thanks, Rob, for the support!
> 
> 
> Wolfram Sang (3):
>   schemas: i2c: reword descriptions for inclusive language
>   schemas: i2c: clean up interrupt descriptions for I2C targets
>   schemas: i2c: add generic interrupt name for I2C controllers

Applied, thanks!

Rob

