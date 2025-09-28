Return-Path: <linux-i2c+bounces-13268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF38BA745B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 17:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 871C81899306
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898171D9A5F;
	Sun, 28 Sep 2025 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yaFUXg/1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2760480604;
	Sun, 28 Sep 2025 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759074611; cv=none; b=egmd2GCdNlQD7bzOaNClE+Ci9BA2kGM9IcfC+fb714Qgf46YmmQLHHpQC37SEXlhPz78UjFETfTGzMZXD3pBEFXI4cgFpdf8tQawToeFu3F6R1qmzNGt60JZUIr6dz8vP1BuRWINVw0v+LPl1EBe+fhQz6HOnS9bnzQpLazVork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759074611; c=relaxed/simple;
	bh=4ZTOtCw+qu6v/PS9GBSsh8HQ+OZ1h1e3pN5XZ7G4qY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHGVSC65rUoIOwqs/dJPDsZLGyN0Qsr8+Hp5P+TWeMBhYacRIsdEiyrs+3+nKsxWaCQLtuAmJwZDrIvRCNg8LMtGNRSwO5M2t5L4UqQO9EcLF7Uf83jmXau5/nXBYi7rfg04dMliVC9KrjF8ezqtJr2pK/+YcPXDwFy1JhBeSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yaFUXg/1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B36C4CEF0;
	Sun, 28 Sep 2025 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759074610;
	bh=4ZTOtCw+qu6v/PS9GBSsh8HQ+OZ1h1e3pN5XZ7G4qY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yaFUXg/1iP9j2FHKIlvTC7wyXfpWdP3xLvWzTV5vKKH8JOn5fdLVrdZef0hJ/pPgK
	 7UOlwxLFhTO0OWuepe/ulhr3bj+51AouX5uWvGOfgS+fv53w/rWFROru7GToVA0Nce
	 z3M4/82A3QKQJeR+6LlSPG+PSaoFRz74Vk0UyKRk=
Date: Sun, 28 Sep 2025 17:50:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: make24@iscas.ac.cn, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Wolfram Sang <wsa@kernel.org>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] i2c: fix reference leak in MP2 PCI device
Message-ID: <2025092800-occultist-postbox-305f@gregkh>
References: <20250928071933.1627-1-make24@iscas.ac.cn>
 <0cfce9e4-b84d-41c8-824d-3e1c53d4b6b2@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cfce9e4-b84d-41c8-824d-3e1c53d4b6b2@web.de>

On Sun, Sep 28, 2025 at 01:00:13PM +0200, Markus Elfring wrote:
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
> Under which circumstances would you become interested to apply an attribute
> like “__free(put_device)”?
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

