Return-Path: <linux-i2c+bounces-4413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F111691AAD3
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB86286556
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B491990A7;
	Thu, 27 Jun 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTBVHDdL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D36198E9A;
	Thu, 27 Jun 2024 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501199; cv=none; b=V+HkvUCmtTTS/MyvJ3NIPceIN4BGeDwBcjW8KPckI5B9z3IpuJ13HvVjYZI3VykrhqN6LnKwH6SOCVFWbMu2q30K0TJN6x03tuzCgzW1oSyxC9Rg2ilEzUY27UgfPXXR7zot9xrd09T35tjb4jVrOFJLTsACNdCnKGW2rpxBApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501199; c=relaxed/simple;
	bh=4iusKO7Oz+vPe0zePJFZNoyg9RSX22ctFbd5cb6P/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6EhzkFboDXueW+mdqp3zyHkSnvCQHTXMLI71HnyQQJqqKT8y0Qc2h0cBr/XS3JXcTWg8lDlAgBcaqnqZ43lXnQ6U5i84+wfNj5X1EkOIWAPt0MLf8u00d+u1g9kgDgsgK17ZMzc/odurmb0V6kArDKaJ9nYViVcRMlCrHs5C70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTBVHDdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4C3C2BBFC;
	Thu, 27 Jun 2024 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501198;
	bh=4iusKO7Oz+vPe0zePJFZNoyg9RSX22ctFbd5cb6P/ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTBVHDdL4QvvLMjQKzzV8Sa5mOAv5m+mIjvTuCf94IO9b5TTbxoJIBq6lpAM3f+Sl
	 xOz4MSBdtjJ5b4ZBOHS1LeWbuMu84w+Ux9IttDV47XLm/SHKuPy1+taFxEBclXl7m7
	 HxEiL+kP1jV1qna4nKGBgeWWb9Y+z48LJn+C+3GNUWXxNTOfJjm9h8jWm67os7PQO+
	 XPsxesw4xMoFjtvQaarSx5Md73lNujS+WtBucHiyvM/04gykc7iLT+sZOWFRryLwsu
	 ufywUFo2fRE7wL6fT6378hxXFKoKQA8oYrqvp9y4oRf+PLQN2ea3FHpwYXdFCqHm73
	 OIFLABUsG87Sw==
Date: Thu, 27 Jun 2024 17:13:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: add debug message for detected HostNotify alerts
Message-ID: <qsilj5xwtfqzhnttvcmbcmvytrfzid6zcaqwtt3yiu5bn2vu3l@wq2xtbdmk7ue>
References: <20240627124313.1811-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627124313.1811-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Thu, Jun 27, 2024 at 02:43:14PM GMT, Wolfram Sang wrote:
> Setting up HostNotify can be tricky. Support debugging by stating
> whenever we received a HostNotify alert independent of the irq being
> mapped. Especially useful with the in-kernel i2c testunit.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

