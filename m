Return-Path: <linux-i2c+bounces-4932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25792E8D3
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 15:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC77A1F21FBA
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7980F16A382;
	Thu, 11 Jul 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiwoTnzQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF5169AE3;
	Thu, 11 Jul 2024 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720702926; cv=none; b=rjyU/aO24AUl5puvXApXOBHLMi1/Hx8914AdeG7hSAv7zPuwMMd2iQok6jMHUDo8vbni9djAjA+WQI/zPO1m7IjnIlM2rcny9bMdWBDQaGIFJ897XTlPeE+FLaAGeqMIx2Vh4nQ86AbyobaQB9r4gY5N4coAz8XI9L+R5VGkWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720702926; c=relaxed/simple;
	bh=KESGgKqNC00Tm8YMVJpeY0QbGAxoeUiudeDlHUxZfqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEgx73qJmaUisiGVOK8NsYfjYas4LxBPPpa7/ZRGkO2QNhU5qzspNQLcNNRRMe+nJjoh7g3T16SWrh9c2pTWpY6EF1NdOq1vPkl1/5B9NmCONS/t7dsYxNBlcfuU1yFBMCAkriaeqxTGxzyhQHLMOKth4979cc5KtnsZmebghxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiwoTnzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC0FC116B1;
	Thu, 11 Jul 2024 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720702925;
	bh=KESGgKqNC00Tm8YMVJpeY0QbGAxoeUiudeDlHUxZfqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiwoTnzQJrdvYZmWtvBDfqOzjNAAuC6mpM6TDLFgaQ/HjNt9xHywjMdoXV22Xhm0C
	 HcaGdC1zshs0U1mFvC9WgAvURPHk+EiFohSxghzmwRqIusnyxMyf61Fn3Nh/x09OK+
	 S70a8BU/LgIm7hYP7ercTt6ynxCrybF8MOFfR7X0pM62dO/BcMHyBlKc9fMFlVQm2B
	 tFm7o43vofMvNANCVVpxKxFZBntqS91sDrwpodiV3DVOFRqjP5dgnH4q4ihX0nhTJB
	 HaY6WZkEa/58ZPnYg+zRdH6c6GWvckwQ5xDXxoUfp36f7ALaCe3DA52q5LCUTvXFo1
	 HUQIy2nFsaDAQ==
Date: Thu, 11 Jul 2024 15:02:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 55/60] i2c: viperboard: reword according to newest
 specification
Message-ID: <k4mfuolt7i5u4eu22dq3ouvritsgrqv5ryuwd33racfjnctkmi@nvdbvpuqvc6b>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-56-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-56-wsa+renesas@sang-engineering.com>

Hi Solfram,

On Sat, Jul 06, 2024 at 01:20:55PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> Remove a superfluous debug output which is already available via
> tracing.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

