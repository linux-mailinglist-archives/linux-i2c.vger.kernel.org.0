Return-Path: <linux-i2c+bounces-4887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B692E191
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96237B21317
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE5C14F9F3;
	Thu, 11 Jul 2024 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoaxaPPy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68914B97A;
	Thu, 11 Jul 2024 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685351; cv=none; b=t3tanXXr/rslo+WrOgFwGcnTVDpRbbs4gkvCqF7p+yAHjavnTAxFy0PGrDFihjHl9smudmPtmSCEM+fvTzOrhE8Yxaiqr/RxIv7XWIwQmeSKN9Vn/ljaYoU7pas7/92cUf5Oi9hq5uJ1EFjiJ8CRc5QMKrnEzNJGgOWIJMhL3ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685351; c=relaxed/simple;
	bh=nQ/nmNpTKlxBI0gdqoatqMCAQHA+nxAAvKYh/Nxage0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DE2k/6pq1LLej1J4JX5cDi8/hQiKU9n5J52+O+dB8HX7iQoMdYmLrjxGdJiC2wcLSN3HsgGaMiohXC6/C/CKdWesw2QGoHsSZDQDmZTkNZdR78V0xTnbTnip/z4gr63tVX9c4i568haK7yFynZzIJhi/sDwM+CbBAsPI4SfPE2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoaxaPPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E788C116B1;
	Thu, 11 Jul 2024 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685351;
	bh=nQ/nmNpTKlxBI0gdqoatqMCAQHA+nxAAvKYh/Nxage0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoaxaPPy7S3Ibuy7Q4rcKi2MtMqBNhxHYV1F+5/WF2CGIwmTvm/9de7ozsqf83Jq8
	 EJCkwDTtgbQQu5/Ite2hzGK1JPkckx/rvr2ZP1pJhhpCKYOgB1TojeRo6BzYpgAk+f
	 IABUt/vSVAxj4xj+P8vyIoQ9/Ns3RilaLHwOVGT7SJaJeSQQb5zOIRCizxFK+W9ZL2
	 ngFyMslbLbd+zxkcqebaDvRorH7lidEQZq5qYjyOMeNtagJ2D9xpFS9r/YJTjbulzF
	 TbiuYv4nKkhFaKKA8SpoM19UqyVvjW05VBC5Rkmzf0NaxhLH3A2mRRSTk3c4+iXLMQ
	 S1scBhBaQOsjw==
Date: Thu, 11 Jul 2024 10:09:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 38/60] i2c: piix4: reword according to newest
 specification
Message-ID: <gujvzqixm2uq7rwpabf3bdjmmzlmvyxzuxvotbtf5s4ueu3dmw@taxlocfdcn2j>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-39-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-39-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:38PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

