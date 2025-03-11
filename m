Return-Path: <linux-i2c+bounces-9791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74852A5D2B6
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375FF1891770
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141862248B4;
	Tue, 11 Mar 2025 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Na5n4Dho"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D811E832A;
	Tue, 11 Mar 2025 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741733501; cv=none; b=Z01eq4W7PpRkCt+Q/3fJAYUSVB8l1ygcMNtLKTzvdy9bxCtpcoIbSUUq6W3XufRAxPGHq+1P16LlX4GlJEpI/5PgLw0rLvmXfJzNveaZZK8SETQwPiSMeQoDJguEtNd9vbDbQzut9tEArDn3S2jQIrCIOleCWQUFwbfJBvbvz9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741733501; c=relaxed/simple;
	bh=cQ32UG7gcBmU0q9LiPDwqk5Trgsxlc2FpDLbm/adFj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMmEFFSSYFvDYi9ueQe1s7OzXFdFFVZnm2TV5ozB0PV3Zlbs7NxhvIBLpsXjaVfOAq1t1m8swgDPk/mnLKYeo3+jjsofhusdIILeBCE8/xN2qLjdVGlbngTh2FvgQmVMOgZM5lLSP5ymd/gJyFlZvuSkTKTu0KnNxIeMUDmTZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Na5n4Dho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8352AC4CEE9;
	Tue, 11 Mar 2025 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741733501;
	bh=cQ32UG7gcBmU0q9LiPDwqk5Trgsxlc2FpDLbm/adFj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Na5n4DhoO8vB/ZZp9X0AIMkONd7kUt4XrONA99mgyzOTmYq3IXKUM/K7QszUAnmxl
	 wktFngOe7+oy6P1rXVNhgaY7aX87c/yiuDSFnMwrhg1KCBUbnz5c9NfSnzaqmaVu4H
	 Usq7L1Z7dTSmcp7IJUm4C+2NlMWSt35x/nMkQs39ZpHQqnEqFW19SFhk32IthVtBWC
	 6AM4RNIesAspf6pdig1nfmk2cmtDnjDO3ZZ7vPDRZxJHS9XDEnbHq/KNzbwdtX3+0+
	 gwU/R+7/gjrrSPDuuOWgQDc7Hv71GxvVcAp1qwJV71Nc96FHEZy8MRL5eIEm1i/x7B
	 +YFpaiKVfDFBw==
Date: Tue, 11 Mar 2025 23:51:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, p.zabel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manikantaguntupalli09@gmail.com
Subject: Re: [PATCH 0/2] Simplify clock handling and fix probe error handling
 sequence
Message-ID: <6xj34bjcmcdktbztrovkionpazqadiscmpg632k2qevxbuf2bb@tzdnnrkc4py5>
References: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>

Hi,

On Thu, Feb 06, 2025 at 05:27:06PM +0530, Manikanta Guntupalli wrote:
> This series includes two patches that improve the Cadence I2C driver
> by simplifying clock handling and ensuring correct reset sequencing
> in the probe error path.
> 
> Manikanta Guntupalli (1):
>   i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended
>     in probe error path
> 
> Michal Simek (1):
>   i2c: cadence: Simplify using devm_clk_get_enabled()

I was sure I did take this patch, but unfortunately I forgot it.
Feel free to ping me in such case.

Merged to i2c/i2c-host.

Thanks,
Andi

