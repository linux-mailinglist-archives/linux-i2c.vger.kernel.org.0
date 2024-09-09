Return-Path: <linux-i2c+bounces-6428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E297212B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C273D28225B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41AB188CA6;
	Mon,  9 Sep 2024 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvQeDOMo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9FB17A924;
	Mon,  9 Sep 2024 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903410; cv=none; b=dYml9vPKPAN3Lf8nt8f0mNVgT0MsQ/BTm3qoAfb3V0Er5W+1ffabGUKc6nLbabWH76/A2YjHIp0oNaWKVSDcL+HabfyGMizDp4IQiVdzUjJcmCtf3MCTVGSDtgJML3pWdPebaZA+4e/uGCAwKPgBK20P3BPDdTthdQmAe6BM5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903410; c=relaxed/simple;
	bh=QIq02CEQ3sFJNx83g6r2WJLTGuQ7Zbmg9wwdFQA6m/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0sZFvfpZlYULnuNGDAfN8mbtrM74GayzjcVM1ENWuVxrnzznHNL+xEm9CiZnx/jj9UJC41jxRehg1drMeda+CY1bz8pnBheOv7vK+L/1BeTK9JOMv37U85/CHFUurBJl6ZYC3A4i4l9LwYIPGzYBMvOORGtMlV+lrrNbCu3tsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvQeDOMo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EA8C4CEC5;
	Mon,  9 Sep 2024 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725903409;
	bh=QIq02CEQ3sFJNx83g6r2WJLTGuQ7Zbmg9wwdFQA6m/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvQeDOMorLgrbcotGFIcvW1BzYziAlVcuA2SNuBFHbLiJCqJ2DlM17I7Sl72xyIB5
	 bNb9OpUahhr3NIRZrMULFHx+P02IaxDLYnitPBV1DWNP2lr32D34KiNbcqfmyuu+OC
	 55VAu/TKRo/guYOPw+Md0hctSLRXaf6RIZl4zGmDNnTd3uohvtQaDbjJJ8KQHcdLBe
	 Wn9qOMGX1RP+JSagbE2IKIoY042vcr31EYKHwoRx+Kb8a8zzzdz2MUeJ3F14kZ4sxN
	 Xl/qYdtxAwmm8URQFDuKRBoCf37ftNNuWJX+YUg5OXOCT2/RKxQepdlQUWihYawymA
	 RjVIX4mvmLsoA==
Date: Mon, 9 Sep 2024 19:36:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Liu =?utf-8?B?S2ltcml2ZXIv5YiY6YeR5rKz?= <kimriver.liu@siengine.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "jsd@semihalf.com" <jsd@semihalf.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v7] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <zr3kwfko3ibotqivmszpthbulcre5iofw4ihc3nwnks3or5mje@pkiynzbboxpn>
References: <9B8C909B-AF7A-4F0F-BD75-ED368BE71E28@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9B8C909B-AF7A-4F0F-BD75-ED368BE71E28@siengine.com>

Hi Kimriver,

On Mon, Sep 09, 2024 at 02:26:30PM GMT, Liu Kimriver/刘金河 wrote:
> 
> HI andi
> 
> Due to a 12 time difference，I had been off work.
> I am very sorry that I can't reply email in time. I will reply to your email  immediately after going to work tomorrow.

It's not a problem, take your time! :-)

> >> --- a/drivers/i2c/busses/i2c-designware-common.c
> >> +++ b/drivers/i2c/busses/i2c-designware-common.c
> >> @@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
> >>  
> >>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
> >>  	if (abort_needed) {
> >> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> >> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> >> +			enable |= DW_IC_ENABLE_ENABLE;
> >> +			/*
> >> +			 * Need two ic_clk delay when enabling the I2C to ensure ENABLE bit
> >> +			 * is already set. Wait 10 times the signaling period of the highest
> >> +			 * I2C transfer supported by the driver(for 400KHz this is 25us)
> >> +			 * as described in the DesignWare I2C databook.
> >> +			 */
> >> +			usleep_range(25, 250);
> 
> >I think there is a misunderstanding here. Andy asked you to use
> >flseep and improve the calculation: "Please, calculate this delay
> >based on the actual speed in use (or about to be in use)."[*]
> 
> >Andy can you please clarify with Kimriver here?
> 
>  if we use 400kHz ,need setting flseep(25);
>  if we use 100kHz ,need setting flseep(100);
>  Overall, take the maximum value:flseep(100);

Thanks for clarifying, then this is what Andy asked to do,
instead of waiting an average random amount from 25 to 250us.
Does it make sense to you?

Thanks,
Andi

