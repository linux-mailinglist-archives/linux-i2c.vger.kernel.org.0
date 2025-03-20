Return-Path: <linux-i2c+bounces-9943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F7A6A46F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9BB919C3785
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA6821859F;
	Thu, 20 Mar 2025 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ML92387t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4092144DD;
	Thu, 20 Mar 2025 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742468728; cv=none; b=G3ou6Ch5eDXITIiXWDGSLO3jpDhhqdrlGNPfw3TAvon3ZAeqoDIorMCWSdQ9/zE5ncKXQ/cEiXAlAgnOJ5foh4hbqDABBKrBBTasISf8QlORxegpIOcG0nCRuKy4ejYBXoS46yil4VUdlHRQ2CwZ15x5qOHSj0bfLDbs5PV6GsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742468728; c=relaxed/simple;
	bh=ym9pmY+bExaFUmHDpI9BWFvcQ7tc2Qu+gYjI1KrDL/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgGjB3iIIBMQkYyN80J27jy7B2CJzucCQs/rC/QTXNldWfopH9wHOO/5ESofFUh+YY7AG1prjBDozOpo+Fhe0he1xiPpwDROEWGuD6yLgWNqy4iQa3RydyFpxm1k7+ewaGdNz8CRKfqRbVN9gzfpGX5VGVkdlKXfj1ev9yl43UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ML92387t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0DDC4CEDD;
	Thu, 20 Mar 2025 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742468728;
	bh=ym9pmY+bExaFUmHDpI9BWFvcQ7tc2Qu+gYjI1KrDL/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML92387t6eN27z7fTfpDqns/dGo0rXFopgqWzGBMCF0ypcTLO6V+3OVH4EU94fvId
	 65VETwXRQ6yyaEKRYDkdpECM6zAKhsl6Nb0Lmx+tLLp2aCAdERvWTXkQWM+BasoUts
	 o2IK6eOP5EkQsuY2z+BBC0S8VKUfCnSY3M5qssIL6dBT/O6OOLldYUyrzZlE9GtzU0
	 8mfws9kUofDIUVE8RQWCRogkLZLdHTmG9kNuRMWi0BabQG9SA1/3YWaUINHH41zwdO
	 RHYuTD2bCE8ewwJhtA196pp1oBsQUZy+uqlwyu/B5C/s27fieg1uaKnSJ/zpJzf7th
	 H7oxCJociwJTA==
Date: Thu, 20 Mar 2025 12:05:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Babroski <cbabroski@nvidia.com>
Cc: kblaiech@nvidia.com, asmaa@nvidia.com, davthompson@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c-mlxbf: Add repeated start condition support
Message-ID: <qmsa5g5bktfknhw2xmcdgtpwxql4fxkl2gbpkezbwnhgsrxncj@375ed77upc4a>
References: <20250131175016.2790291-1-cbabroski@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131175016.2790291-1-cbabroski@nvidia.com>

Hi Chris,

sorry for looking into this patch so late.

On Fri, Jan 31, 2025 at 05:50:16PM +0000, Chris Babroski wrote:
> Add support for SMBus repeated start conditions to the Mellanox I2C
> driver. This support is specifically enabled for the
> I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
> communication with an I2C device on BlueField 3.
> 
> The I2C bus timing configuration values have also been updated to fix
> an issue found when testing block reads requiring a repeated start
> condition. The "timeout" value, which determines how long the clock
> can be held low before the I2C transaction is aborted, was too short
> and caused unwanted failures. It was also found that other timing values
> do not match the configuration that is recommended and has been verified by
> the BlueField HW team so those values have been updated as well.

Could we split this patches into two parts? It looks good to me,
so that once you send it, I will apply it right away.

Thanks,
Andi

