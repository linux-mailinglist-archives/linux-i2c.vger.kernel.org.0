Return-Path: <linux-i2c+bounces-9939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B4A6A25C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 10:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C40A3B68C9
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 09:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FE322154E;
	Thu, 20 Mar 2025 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmeO5pc5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B52139C9;
	Thu, 20 Mar 2025 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742462179; cv=none; b=q7uTTAFRu88IDo0Is0/6+UEXSXlZ+ZsNUpLoIUPX06DSw6s7Q/FpBozskk1SU2QwRqxiSwJK1sahtPy5znE/lmViHvGEdz3kKW0ZfxYYV2dXuE6qVd4cRV4s6tZc/NXbOf1bMKLTxJ3NJz3oAYSzzSb7/4l2gWWBbsDGyWOUF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742462179; c=relaxed/simple;
	bh=FP5Msvwyil2Nnjhp7rcbhlKSlb1db3EzW/5fWUt/Ogc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmV10NH/CofetlLzUl+KejZhBKLvUMtuwBsq34es26X+gjzrxdBolmcWxJZknSTUJXHfmIlpwvAscF3fNHJpoZlJfy4zAux/bQYuyYlSaBN9NCThesY3xPDc0sVI8S8k2BjSebspllTt8d6mGpHwkoMzUTwquV8jWqjq1BAFll4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmeO5pc5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6BEC4CEDD;
	Thu, 20 Mar 2025 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742462179;
	bh=FP5Msvwyil2Nnjhp7rcbhlKSlb1db3EzW/5fWUt/Ogc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmeO5pc5BrxaK3AvQZIemzhloqfKrspC2y11iBrqWxtxQlz8F5BiW0h2RlXiz5+VP
	 bBnx40Fq33A+ZdJ6nYM2sAtcuTm0+OV2KxagbDYKWIixF09p2V2NyjQTugKdRb/DOm
	 +avZGDObrs0Jn/kaq0Kpgp5dgtH3LO1//xCBCtXlkW0+bToA6+OJjAhOSwwEDyiEHr
	 kTBMnVx9fuz2dPgKfQ7RRjh4iPz+g324OtTNiFsF4WW4LP3xJ/F9Us5s/QmiGt40hy
	 ol9qXti56JidYZxico76YXHi6WnPVe32Kq43yFTDOlMd2kdwf6lkyOmJs9eqH1QO77
	 QUbgkW4OjPF0A==
Date: Thu, 20 Mar 2025 10:16:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH v1 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
 polling
Message-ID: <qvgk4wlbyp2mbyusexx3zvjshsocmdiq42yru6gfpj7hd26afe@7q5j6dwatwz7>
References: <20250212165128.2413430-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212165128.2413430-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Wed, Feb 12, 2025 at 06:51:28PM +0200, Andy Shevchenko wrote:
> Convert the usage of an open-coded custom tight poll while loop
> with the provided readl_poll_timeout_atomic() macro.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

nice cleanup, thanks! Merged to i2c/i2c-host.

Andi

