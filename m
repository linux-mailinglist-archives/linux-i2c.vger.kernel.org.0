Return-Path: <linux-i2c+bounces-5980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8F967BF1
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 21:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1BA0B21041
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 19:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B355B05E;
	Sun,  1 Sep 2024 19:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="IhTu//ft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA1482FA
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 19:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725219394; cv=none; b=I+SIXA7RBqmf7LK4HMhNnBkTHn5fiLrTDaeAtt74Xz0cmYicNwttaBNSv8w2DR1dlICSRiBp14NVGZnSFjVA7saikqI4BL2xVA2lO5ZcMLAaz6tr9LECa1GWaLOIJ/YO0F6/tje0vJixIZXrlpGo43X/sz1mWNBhTqzrun15OaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725219394; c=relaxed/simple;
	bh=55cEkcsmnDLhMTDbdd9K2ijc1dx/EsofROUUEYVy2cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR/bzR67n+0dpmTCc/Qs5WkBYr15SP8vlnsUbCHWE+GHvwPfKiFnbFaQ8q3LpuxYXNZfkrRr29A1IQqhTYCTQhhlFbUv4Aqk6F278stNf1VWOHIQeK+Ho65FK0lc6Wq+25m1hbJ1Ge6mt+F7Z4twO4rfXDV+T+QrLSRfLAgeKDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=IhTu//ft; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-277df202ca9so502527fac.0
        for <linux-i2c@vger.kernel.org>; Sun, 01 Sep 2024 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1725219391; x=1725824191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiOFp46qhP2eeXetIvuZsxlfaW7Lra2Ek61RDRs0VMM=;
        b=IhTu//ftgH9LMMuA5MZFcw0sRYq/EkxD9sur6nu/HWNnn+68MdFcUOmJD7XCwXwyP4
         e3raCKHZpZyeZ/AL9WjPJ2Boi1zzMLBvb/IEvPE5607D+IbI4p+6kjEwY/trHSNtGNz2
         zK0kgvfikbE8PCTiJ1APX34EJ7CBTZi9pbUyowBlB3iyQPOxHh/RnEjULb9JoWJK7Um9
         wSdy2JF0pn1AoRlGKPP1rcwcSOYuA0p48uGV09h5/c6e62QOUx7THh7vFCP9wPRWo8bi
         Jbo8IBudQYcXPwFN0Ef1DuNt0fwapYDwJVM4xql3nviT9biG/r5zhrHSz3YIEpqrgIQb
         1msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725219391; x=1725824191;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiOFp46qhP2eeXetIvuZsxlfaW7Lra2Ek61RDRs0VMM=;
        b=WJrqJNJ2JOb5IrDllSZ7clkSBiVciwpWK5V3NNCu7cmnP3IJKcOuxOIbHAxFdb/zYG
         oMH9ob1osvcxCEKydejbDTjaoOokwpHC62r0stTp7J7oSYV8atRKsAPWi0NqVG7yfkAk
         bzmAoHpQxUdljcgvMF3tf20dGBPzqWalHITbleF9/ubdogtlMMYy9wGVvL45oBCCeB71
         qurIXUewQ+i5Xda+AgS2SeXPtEfJJawXL/+mZOY/2xXwudqBT5T3XvzrKzCxjjX8pbDG
         YRX59fxuGGvK56u0y5L+7WS4ZzIn3zD8nrGTcQYriBnuqlpRs57IwTuXB3hheAovmhzU
         Qi6g==
X-Gm-Message-State: AOJu0YzKKccfwt4VwXGEn4giRtTKMvm0Rr+vJLyb0Yl7uWRQt+MNEcXV
	MdDRe3YzdHWx+jfp0tjQ/FUvngd7+Y8v3W947Mee+3MTBRMlkYRge1DldjlKOz0=
X-Google-Smtp-Source: AGHT+IG5bNU+8xFP1f27d3WC/VyPLz6YYCq5+TlVAUmorRNBQNYcIL6WeKBq4LEQuKFASWo/wAm4kg==
X-Received: by 2002:a05:6870:9a1e:b0:24f:e5f2:1cf0 with SMTP id 586e51a60fabf-277900c6c6dmr14746876fac.14.1725219390944;
        Sun, 01 Sep 2024 12:36:30 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:a4c5:2f87:1c10:5fa2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-277cb790846sm1259385fac.47.2024.09.01.12.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 12:36:30 -0700 (PDT)
Date: Sun, 1 Sep 2024 14:36:28 -0500
From: Corey Minyard <corey@minyard.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	Corey Minyard <minyard@acm.org>, Jonathan Corbet <corbet@lwn.net>,
	openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ipmi: docs: don't advertise deprecated sysfs entries
Message-ID: <ZtTCPPZSzVZMZiqf@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20240901090211.3797-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901090211.3797-2-wsa+renesas@sang-engineering.com>

On Sun, Sep 01, 2024 at 11:02:11AM +0200, Wolfram Sang wrote:
> "i2c-adapter" class entries are deprecated since 2009. Switch to the
> proper location.

Thanks, in my queue.

-corey

> 
> Reported-by: Heiner Kallweit <hkallweit1@gmail.com>
> Closes: https://lore.kernel.org/r/80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com
> Fixes: 259307074bfc ("ipmi: Add SMBus interface driver (SSIF)")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/driver-api/ipmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
> index e224e47b6b09..dfa021eacd63 100644
> --- a/Documentation/driver-api/ipmi.rst
> +++ b/Documentation/driver-api/ipmi.rst
> @@ -540,7 +540,7 @@ at module load time (for a module) with::
>  	alerts_broken
>  
>  The addresses are normal I2C addresses.  The adapter is the string
> -name of the adapter, as shown in /sys/class/i2c-adapter/i2c-<n>/name.
> +name of the adapter, as shown in /sys/bus/i2c/devices/i2c-<n>/name.
>  It is *NOT* i2c-<n> itself.  Also, the comparison is done ignoring
>  spaces, so if the name is "This is an I2C chip" you can say
>  adapter_name=ThisisanI2cchip.  This is because it's hard to pass in
> -- 
> 2.43.0
> 

