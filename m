Return-Path: <linux-i2c+bounces-13248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5BBA6253
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 20:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576BF4A51C7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 18:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF9F22D4C8;
	Sat, 27 Sep 2025 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OrYX9qmF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A482202C30;
	Sat, 27 Sep 2025 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758996535; cv=none; b=BxcnRku7KHlazprKJNFGpduzacz3TKSgh+BdrU971gJ1S/ocMO9B/vwequ+LTTdR0g6euXSlIuAbWdDFrM61w5jR/1jJn2xmq92rsd15aIBD30L/JrKC3fxaqWAfhhmGXg8Kyu+Kl/2KXITdyVeyfkgtw27OTEzjz15EqUcnFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758996535; c=relaxed/simple;
	bh=vixz8K/MO+ym+XudyndtGJ2cXBm1/TKTyCV30y6WPU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPoM118IRbze1qmGeDca8Fegw1mGvxSa2p9lP7QtN2pfTgUPETxacf1tJqwHilLA/0XJaCim1pW/KJcsLuYMgcuWb9Jq5XxDyQvZBQOlevdFI2xlJFBLTqp+/SjugONK7jwiRh3q1ELrmEo0Gj0opiJfgEQtPKFTawU+uWyXE+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OrYX9qmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D98C4CEE7;
	Sat, 27 Sep 2025 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758996535;
	bh=vixz8K/MO+ym+XudyndtGJ2cXBm1/TKTyCV30y6WPU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrYX9qmF2BWNk5RZp0etbC0OAzKbfjaP8pWqx6d65lIoZtIqI5mSMvmuvZo6VPLfW
	 /k4QJLc1WaQihHcvMYcw7jI45VXcwj+nYMyQTGjlKSvGxvh0N/rQK4u7jhLVF+8Nko
	 L1L4fFd2PVnsicXj0fiXn16YYHVki2YX35WMeMsk=
Date: Sat, 27 Sep 2025 20:08:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: make24@iscas.ac.cn, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Wolfram Sang <wsa@kernel.org>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] i2c: fix reference leak in MP2 PCI device
Message-ID: <2025092741-emerald-exciting-aca3@gregkh>
References: <20250927105729.19164-1-make24@iscas.ac.cn>
 <e6703b6c-0ae5-450a-ae3a-1ad899c8f374@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6703b6c-0ae5-450a-ae3a-1ad899c8f374@web.de>

On Sat, Sep 27, 2025 at 02:56:49PM +0200, Markus Elfring wrote:
> > In i2c_amd_probe(), amd_mp2_find_device() utilizes
> > driver_find_next_device() which internally calls driver_find_device()
> > to locate the matching device. driver_find_device() increments the
> > reference count of the found device by calling get_device(), but
> > amd_mp2_find_device() fails to call put_device() to decrement the
> > reference count before returning. This results in a reference count
> > leak of the PCI device each time i2c_amd_probe() is executed, which
> > may prevent the device from being properly released and cause a memory
> > leak.
> 
> How do you think about to increase the application of scope-based resource management?
> https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L1180
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

