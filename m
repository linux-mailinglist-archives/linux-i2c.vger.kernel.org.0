Return-Path: <linux-i2c+bounces-6609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55A9762C3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 09:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B20881C2248B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 07:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5486618BBA6;
	Thu, 12 Sep 2024 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJhurP9p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122E186E58;
	Thu, 12 Sep 2024 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726126425; cv=none; b=i+r4ZuZV4z8B8UjnRPKMHC8c8urz9AHz1C+DDeHJx1OS7/hqw6kvERnbY4VEhZmpds0flTHQjOLgPnTRpwQP0H6tsRN+tHG8+5kviCe32/J8a6/K3GLJFUHRkCi/B22d4AM9GKJT0z1xKSJU3+xa7CHMMebO636N1AKmMR5r/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726126425; c=relaxed/simple;
	bh=OKbMY4rkvt7/khnhRGV2aeG58u/xhiIc8zzfHJ4cOmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bi8JebiV/5HiGcp5K3tHBJFSDqeM4Qs4cefSPFntEus1lACTFQMfZ5NlaQj36BFlKGaZocpkgfM28xOoN46fVDK1WN88zjg+/73LT3ImhkiZ0LC+9Fq1lOoRoaVmpXjr2Z5QKwmCDt8hYN37mohnu9XLNKvhUytCiHFazqBHyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJhurP9p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57FCC4CEC6;
	Thu, 12 Sep 2024 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726126424;
	bh=OKbMY4rkvt7/khnhRGV2aeG58u/xhiIc8zzfHJ4cOmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJhurP9ph+TFCfn1IjP8mOKwZxVRSjHMxjEG5keNAusgv2/sGX5Kl/CKhRwL7F51Q
	 GB/kossWucK4arhfxxwUzsElak1aqBTaI5qPGrwm7viQERCIMJ7X0HXwvVkk1JNWLn
	 eno1CAR2s9FAeqJaF5zk/f44nzBDivE1p51jJmHcAWGf+mQ9JswxYetqjyGX3pnVey
	 Nx52DTTvVZlfS8cNFTQrh4L/93Bf8psN6NrPnoRp9SX25lDeCImN0OcVs2vxKS6nvu
	 WXkBlCu2wJJEPsVFevOqCmZNZNSVufIyI0sRsoKuNqpKNuR4Mmg1ZHaGDsWRkTYjHU
	 bemvwREv/j7vQ==
Date: Thu, 12 Sep 2024 09:33:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 00/12] i2c: isch: Put the driver into shape
Message-ID: <4gdk4ktbfbgd4r7rf75o2vr5f6wtw335ywjaec6hiqua2rl27n@mgpevcixnz27>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (12):
>   i2c: isch: Add missed 'else'
>   i2c: isch: Pass pointer to struct i2c_adapter down
>   i2c: isch: Use string_choices API instead of ternary operator
>   i2c: isch: Switch to memory mapped IO accessors
>   i2c: isch: Use custom private data structure
>   i2c: isch: switch i2c registration to devm functions
>   i2c: isch: Utilize temporary variable to hold device pointer
>   i2c: isch: Use read_poll_timeout()
>   i2c: isch: Unify the name of the variable to hold an error code
>   i2c: isch: Don't use "proxy" headers
>   i2c: isch: Prefer to use octal permission
>   i2c: isch: Convert to kernel-doc

very nice cleanup! Now this driver has a nice modern look.
Thanks!

I will leave this patch for some time to give it some more time
for review and then I will take it in.

Thanks,
Andi

