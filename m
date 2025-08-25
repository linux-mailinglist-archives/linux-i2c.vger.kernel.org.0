Return-Path: <linux-i2c+bounces-12410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC621B3338B
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 03:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81F8E4E1027
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 01:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284D71400C;
	Mon, 25 Aug 2025 01:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="VXvJnu5u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B5632
	for <linux-i2c@vger.kernel.org>; Mon, 25 Aug 2025 01:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756085451; cv=none; b=MtHb7eub/hHLy7+JH54AUxgImtUJ0CLK8C+wnZTY+ZuI0DGdptszf+j9iJQsoLSy6OjGMVWrFWQWoyptFh2N9jgWIh5fvNnnzsfaTshpQ6FOZKTWRF1qLeoBEsTLgrQM5sgJpuKoP/wKciEra8seHlgpRWdSwqycBYIp25W3YSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756085451; c=relaxed/simple;
	bh=2kwfTXoobLmapxlniSHHmwRO8M1wNd741QK0rAlsvjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpeFHVnd753BAdBdCwi/NG+nzGCb3FsW6mqukmM4x50a1MddU6pRyrYqVYnoaxnTsxEIEw0rGbTXOE5xeNl6J3RURwwzCL1w0FqmVVGkGdy/RS2DXnWAelXiY5CcgLrUQTrqViATKLQP7Xi6sWhanBJ35+tqAvYzJSc4/fOtU9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=VXvJnu5u; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id A4B70104C1E0
	for <linux-i2c@vger.kernel.org>; Mon, 25 Aug 2025 07:00:35 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in A4B70104C1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756085435; bh=2kwfTXoobLmapxlniSHHmwRO8M1wNd741QK0rAlsvjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXvJnu5uu8dlPsEICREGUzUEcFKYpqM3ULN/F5LSB7tLkqLG6DJR2jfx6+ubMcbm2
	 +FxMPGXFYXGjWncqFlY7UEZ9cX+vY1NWBiY9zy1RQa1u/KHRD0plHRZCVoDcI/BL3q
	 TowmpJmStxkJToD9ZILlgyAOWGkIJgOYGRfldFow=
Received: (qmail 11765 invoked by uid 510); 25 Aug 2025 07:00:35 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.148082 secs; 25 Aug 2025 07:00:35 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 25 Aug 2025 07:00:33 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 06354360036;
	Mon, 25 Aug 2025 07:00:33 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id D9DDD1E81387;
	Mon, 25 Aug 2025 07:00:32 +0530 (IST)
Date: Mon, 25 Aug 2025 07:00:28 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: peda@axentia.se, wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] i2c: i2c-mux: Simplify boolean assignment in
 i2c_mux_alloc
Message-ID: <aKu8tBBOWqltEstx@bhairav-test.ee.iitb.ac.in>
References: <20250824181416.4316-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824181416.4316-1-viswanathiyyappan@gmail.com>

On Sun, Aug 24, 2025 at 11:44:16PM +0530, I Viswanath wrote:
> Refactor boolean field assignments of the form `if (a) b = true` to `b = a`
> in i2c_mux_alloc
> 
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
> ---
>  drivers/i2c/i2c-mux.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 4d8690981a55..abf63758856b 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -241,12 +241,9 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>  
>  	muxc->parent = parent;
>  	muxc->dev = dev;
> -	if (flags & I2C_MUX_LOCKED)
> -		muxc->mux_locked = true;
> -	if (flags & I2C_MUX_ARBITRATOR)
> -		muxc->arbitrator = true;
> -	if (flags & I2C_MUX_GATE)
> -		muxc->gate = true;
> +	muxc->mux_locked = flags & I2C_MUX_LOCKED;
> +	muxc->arbitrator = flags & I2C_MUX_ARBITRATOR;
> +	muxc->gate = flags & I2C_MUX_GATE;

Although it looks correct after checking that  mux_locked, arbitrator
and gate are 1 bit bitfields. I think below with more explicitm, would be nice. 

muxc->mux_locked = !!(flags & I2C_MUX_LOCKED);
muxc->arbitrator = !!(flags & I2C_MUX_ARBITRATOR);
muxc->gate = !!(flags & I2C_MUX_GATE);

Regards,
Akhilesh

>  	muxc->select = select;
>  	muxc->deselect = deselect;
>  	muxc->max_adapters = max_adapters;
> -- 
> 2.50.1
> 
> 

