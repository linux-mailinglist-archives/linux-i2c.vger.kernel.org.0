Return-Path: <linux-i2c+bounces-4823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A95092CC78
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0B0CB235C9
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C575784A32;
	Wed, 10 Jul 2024 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usugGRJk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D364AEE5;
	Wed, 10 Jul 2024 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598725; cv=none; b=gPz5rj80keKRlFW0F/fTvR6n4OaiLs2huu9S8hhLb1iEPELnGy+3466NrqJ9Nsiphb4fNXCKuaNEYgIlvaeQ6akQgwYRkMArvf6HMV9X4Vc3iYVscljO5su/tTjkvkoe0B14rucf2/3yz7t5I8xddTLB88XUliXIT7oVNsi5iKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598725; c=relaxed/simple;
	bh=ySqV5oZX1kYcAOKkjreo5J33aXlORaIMk45fFkmv2i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKPDl4L6OMbp1gekvRUmyPXuxjl6pIOF49WnFyyrLLeVikmSCbQW+B4nAmFkcNeVp7iy8mU8Elaf2OEu7tyZ+0AWZXUQGulN/fXOgR5OOQyLtM02E3S/jN5M9aWufqQsY04jf53AZCm3/wqZnqANGSNqBE65oxUikQUN63IXJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usugGRJk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0697EC32781;
	Wed, 10 Jul 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598725;
	bh=ySqV5oZX1kYcAOKkjreo5J33aXlORaIMk45fFkmv2i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usugGRJkfimflIm9v1pthfAT7vZah1cSVOBLa0j/YuoFAXf62p2RCGIliDN0ISelN
	 bsmrx4NIcQisY6PLI5i13OTsHMecO7tMtO00TeAq1nQLcsVMmJhswYwP/YHv+Sv/Z0
	 E47EqwgBLj8vHMc3LHUimln7z6imtRLlHJevDD+6jDcTlCOOQtsBYkxv/Zi+pT0bI1
	 H5JcUJcEClqskjl6sTseJh2o1Ct2Hr/AvkZqSGtcMJMzDpvtjgpbaA+zV2y9coobEY
	 Ld+ufeaVSSj5iYm8zkuvZ3JVdlmaDPJ0aLZ60+nSH17r1femWI/144Xp/1LTMx9FOm
	 bNJCha76HfamA==
Date: Wed, 10 Jul 2024 10:05:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/60] i2c: digicolor: reword according to newest
 specification
Message-ID: <hohjeifhsfgrudhrjwvevl42l5f7wkv7de6pr62kxl656ei47f@jj4vp6eaz6me>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-13-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-13-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:12PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

