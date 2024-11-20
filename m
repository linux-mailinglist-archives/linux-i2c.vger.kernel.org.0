Return-Path: <linux-i2c+bounces-8080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E019D34D0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9E22844A2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 07:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DE21684B4;
	Wed, 20 Nov 2024 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUE5x0jm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB843179;
	Wed, 20 Nov 2024 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732089078; cv=none; b=bbAUmaVkJBbMfzw+3Zrsyo1GFk5VnLEk6Vm1mJNSPbj/G0vS75KPMew+89iwjKkZZxlpHqYEPSpaVSj1TsDAkzK1hdiO8NvXuA32RsYApkANANAo8FcD60uF+VNnkpmxWm1mlht7zR97FfUIJ3heV5n3jFOuu4OI00BvezbyeKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732089078; c=relaxed/simple;
	bh=BUcHT1ASxFp7/I/iBKu4Mwn2dVjffAwHYZbUQTN/Et8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMKqG8WMo95FXcMQihg/N5qlgVxm7QqyECF4KFSKW/gjjywPBIkoBfpuFnoBIDwPwX11Bh4N7DK9vuF7yKzTNY7dVLUuPROyHKPFb+//LDKMO+USX7O+kHzXYQAQ5Qx4CGY4N3Ljv4Vc9FExSJd8uBbmEi15lAFH42eJ0bLUkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUE5x0jm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77E3C4CECD;
	Wed, 20 Nov 2024 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732089077;
	bh=BUcHT1ASxFp7/I/iBKu4Mwn2dVjffAwHYZbUQTN/Et8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUE5x0jmrQQnknEfB4FmY1/ICPo3TLSIkM3+SB9xuOWa5UpbVJydWk/znF56bGKmQ
	 ZBN7FX3Eiite1zTEXI/kphmbJycFZITJlk7EwaoqtUEw0RqmYvuVmez7HPTvFCgSEM
	 jPLBtjMdA6Cs413yBRh89QSuRRTDSNFXmOnkLtDkfg2Ttk7IU8XcU9spBu0q+DC66e
	 3EmVQtffia+U1sMcXpJ4iQNRORMlwebtvD3xmd+UPmNuzXFouq5yFcVJS0LKLhJ1Q5
	 +r9+Gw6WM/eYc0CJnFg72cjIdiMFZbV/8Z3B1SqcZ8+mDgm3gEub5fxSRdExvwV642
	 5Q3daCS7dqe/Q==
Date: Wed, 20 Nov 2024 08:51:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
Message-ID: <6nv6cngt3w5gj4hhlmqae26at3ey6ogwbskclsknycbzeuy4ia@jsjmx4nuhtss>
References: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
 <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>
 <Zz10-aGTFmWcw-1e@shikoro>
 <r34ulkawh3c3e2mzyv4eskla7e76z73otpbp4ei2gddarabyxk@pcuw2a3kards>
 <Zz2M68kCkuZvzzel@shikoro>
 <xyxayycrcki4gjvgyc4x4onmsoxl24rf5ab4ybgpyggsrmdygr@v5xpdhphourb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xyxayycrcki4gjvgyc4x4onmsoxl24rf5ab4ybgpyggsrmdygr@v5xpdhphourb>

Hi Uwe,

On Wed, Nov 20, 2024 at 08:33:44AM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 20, 2024 at 08:16:59AM +0100, Wolfram Sang wrote:
> > On Wed, Nov 20, 2024 at 08:01:20AM +0100, Andi Shyti wrote:
> > > > > This driver has not been merged yet.
> > > > 
> > > > It is in Lee's MFD tree, and thus, in -next.  It will go to Linus' tree
> > > > this mergewindow.
> > > 
> > > right! I saw it but forgot about it... then I will pin this
> > > patch for later.
> > 
> > Lee provided an immutable branch with all the patches. If you pull it
> > into your tree next time, you probably won't forget :)
> 
> That would be fine. The patch was marked as "Not Applicable" in
> patchwork. For the time being I updated that to "Awaiting Upstream"
> (though that doesn't make it appear as actionable).

I updated it to "Not Applicable". I was going to set the proper
status, thanks for doing it.

> If you don't pull, be asserted that I will remember you as my quest to
> drop remove_new depends on that.

Thanks! :-)

Andi

