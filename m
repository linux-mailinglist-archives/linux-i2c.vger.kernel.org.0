Return-Path: <linux-i2c+bounces-10784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C115AA9E4D
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04BEC17AE84
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD25274667;
	Mon,  5 May 2025 21:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN1rt2nl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B1207A25;
	Mon,  5 May 2025 21:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481326; cv=none; b=ZRaylU5EBS7gzIemCRqgSeG3PxU7y+u7HWazVQxZVES2EN3Deg8z7+AkyUJ9D5Osc59m446PIvHwVEowj/OMdba2u2YCLotwPy8R+VBKccU+M8KWdo2I+CdirygdQ8lj/VF6S6/ffVLfN4lnMTpD62Eaeo0WBV3PwhtpZ+OzJpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481326; c=relaxed/simple;
	bh=MtmX6c+d0GwVwBeHjfAo7cIuED88r24EfNq5zKkSnTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRksDNDea7B09UEEUD/mCBQQs2faKF5pKyKAOwvNNKOlDoBo10+HRQEOLx2z+I5shwF6mVrBSUMpsy+1JtjnpT+TGnXftdLakf3F4UZWZ8DgZLxuQ7D2oww115D4AQqNQBrEucKywbEcIbSQfg7plpuyN0gkHeOELlA8yJs9yaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN1rt2nl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D638C4CEE4;
	Mon,  5 May 2025 21:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746481326;
	bh=MtmX6c+d0GwVwBeHjfAo7cIuED88r24EfNq5zKkSnTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dN1rt2nl9UnTyMSO0TW9E4VA/JPLooqKJGpbnvG78A7NPdl4qwKbENXKYhyy9GqmY
	 2fpoUCfnQySs7syo8IknbIo1Yd5YYsmJfi9MGd3PIQYc8Gzd8Eer090XFD1IYi2YGi
	 pw6+P4gMjCmLXC+FNAKI4VqsOsh48SOIU8EFx1KMutmZTQFW4UzTReTHD6rHwDIxUr
	 hF4XhciVbg+OG0Yx/HPnPIqeFKAPdH/z1viAohNj6wy4tWu5UbRoCLItqJ4rPWFIeV
	 O7WQyJ85uSx9DILPBix5pdhkg7FZgL/zhC2Q7gOtoAHaC8dUFued+M3dxpvy3UyDOg
	 xKTjslAZlYuDg==
Date: Mon, 5 May 2025 23:42:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Seth Heasley <seth.heasley@intel.com>, 
	Neil Horman <nhorman@tuxdriver.com>, Robert Richter <rric@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: ismt: Use non-hybrid PCI devres API
Message-ID: <l26azmnpceka2obq4gtwozziq6lbilb2owx57aajtp3t6jhd3w@llmeikgjvqyh>
References: <20250417082511.22272-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417082511.22272-2-phasta@kernel.org>

Hi Philipp,

On Thu, Apr 17, 2025 at 10:25:11AM +0200, Philipp Stanner wrote:
> ismt enables its PCI device with pcim_enable_device(). This,
> implicitly, switches the function pci_request_region() into managed
> mode, where it becomes a devres function.
> 
> The PCI subsystem wants to remove this hybrid nature from its
> interfaces. To do so, users of the aforementioned combination of
> functions must be ported to non-hybrid functions.
> 
> Replace the call to sometimes-managed pci_request_region() with one to
> the always-managed pcim_request_region().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

merged to i2c/i2c-host.

Thanks,
Andi

