Return-Path: <linux-i2c+bounces-1630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EE8491F4
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 01:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67B72B2157E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 00:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1482210A28;
	Mon,  5 Feb 2024 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpXAVm5s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C0B10A17
	for <linux-i2c@vger.kernel.org>; Mon,  5 Feb 2024 00:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707091398; cv=none; b=SFBzu9rsgH7hVyIDlZ2f2xYaiNWl3DPPULopphOoSXCzjk/XUnx/I2Z3ziY1QaHrM1YmLj9i7D3gYKmQpWb1JsQBOROVBI9Bw53ZcQbnghz10xL1mnsY6OWtalQiHCtTTpAHPy9PDHyFCDBUftHBUCdDDZIDC+SxoPvzjey10hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707091398; c=relaxed/simple;
	bh=RlA4ablhyUV6i0lPUk6831fAN7z7LQr7klkirUXDHz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yrd1vZsGZcblsut7y8AuqTCOxnHENNqi0QPQIcuvBmdoCF7TN+RODc4JGB+E0ObKm3ZX+lGeJQ1T8tOnCgqFuXtCpz09TUWxjNweI1yODp64YkbZIQYpZr5YHXfxq5iLdvYFHIw5sb7o+J/hy1ApQdpQDjIjVX/XeGoeVBQDfX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpXAVm5s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A906C433C7;
	Mon,  5 Feb 2024 00:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707091398;
	bh=RlA4ablhyUV6i0lPUk6831fAN7z7LQr7klkirUXDHz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpXAVm5ssrZfwGtLK2GPNq1KLEVtdQpOAE0tALcDVlFQyHqe7BDJcXKOVXJ/winrS
	 SQCgm17L8m/kxRgFprXdD+eWKBoDLd/PpExQdqiDQqHs53VZYnxG78lH3EPPJEwFwv
	 AV6jNKxfT4o8Zyn9gziKibsWImGoNKg/qNHgqvLmWqMvGH6geph1QoR7SFDNAw8v4I
	 2qu+mH3tPQdrEkU3/66IS4gnkt9mSuezn5+jo9e1/hYj8AcB9bUhgfGtT+cF8e0pqP
	 7tL3A1L23BBnb6mYmAyBm65ubq89QaBdCLrbayW8bYE0CjVkHJ+ZaT5Q0YJv+zlc3K
	 UAuZlSpBoqcVg==
Date: Mon, 5 Feb 2024 01:03:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	linux-i2c@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Sanket Goswami <Sanket.Goswami@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Ruhl@smile.fi.intel.com, Michael J <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 1/6] i2c: designware: Uniform initialization flow for
 polling mode
Message-ID: <4ck4ocksd5njbyxoegijexvu3h7xfb4jwvti7r3wz2wkxbkdps@vsb42p3xx4io>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <20240131141653.2689260-2-jarkko.nikula@linux.intel.com>
 <ZbuHF31mMv_KN2J4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbuHF31mMv_KN2J4@smile.fi.intel.com>

Hi Andy,

> > +	if (!(dev->flags & ACCESS_POLLING)) {
> 
> Actually seems to me that is better to have in a separate helper and you
> then can do here something like
> 
> 	ret = i2c_dw_request_irq(...);
> 	if (ret)
> 		return ret;

I find it a bit misleading because the first question that comes
to mind upon reading such a line is, 'What if access is polling?'
without looking inside the function. In this case, a more
appropriate name would then be i2c_sw_request_irq_if_needed(). :)

Andi

