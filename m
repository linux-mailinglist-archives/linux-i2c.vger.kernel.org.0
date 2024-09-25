Return-Path: <linux-i2c+bounces-6982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6A98570C
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 12:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3441F24502
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB4613D504;
	Wed, 25 Sep 2024 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6iB1NSa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F4280043
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727259477; cv=none; b=I0K3iI8NnnaH/ndQih1cr3w0pz31aD0VVSjP7Qc90lNP3DV696HLleyQ6if71XkpkF8ZbEVwsf3NbH0OFwZntU1Qq6wqctp62l4bnrctJY7kz6WPvRfmuA3rOCK3I4BxLl9D295yuwty5OSy01cCHMaEVf+NmuC/fLCYHCTyzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727259477; c=relaxed/simple;
	bh=qtpMjOhQ3+X7OIy4zYRL//UmpPdmpvB+90vxVLeypVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaW58wjpgSTzgSXWGZN3fo1ahdTx9bXsQxBAMiGOlJYnxAHGZSNnlRibMre80T1ezdiDcXQ5GJScIAZWnLDg23pKjY4FniQYUKXlf2onFW2iTHs/bhHETWfbTPzJGQYKUchvCw1ty3Rbrnt35Ipi+yVZ5QFN9sqkEWs514jb7Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6iB1NSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9BAC4CEC3;
	Wed, 25 Sep 2024 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727259477;
	bh=qtpMjOhQ3+X7OIy4zYRL//UmpPdmpvB+90vxVLeypVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6iB1NSapi7X7BS53C54V71uYuhmNfqLhtUyMZqdtncBxMifZebZ9wEQm067iyV3K
	 Gi5Gz6qV+jb7VFQsemrPYcq+gGrTYrDHAZwt7yutSvZm6kyltq4ja6PWfhueefeLHJ
	 BQ9Tl04MGUFeTm6LX9RUb3U4gSI3B7zeLUJXT1Sezr/zOW88MLYX8TZawMWxpeCZDB
	 RxOI19gAmKS/EIKQ21jT0g8edzcNn/X5o/b/HWKwdBxqJoe2tO+COfQ55LTVbje/Dd
	 iWyFM936iWOjyP/G5PG+RuGVgDzBwBF96c87HuRVJ1uf/fVZt2hD8hR9Ey9D0QYcC0
	 j3FhqaRHWkVBg==
Date: Wed, 25 Sep 2024 12:17:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Patil.Reddy@amd.com
Subject: Re: [PATCH v7 0/8] Introduce initial AMD ASF Controller driver
 support
Message-ID: <l2d5tndztzqlh6uox5os5zivxnka2x6x7tvqkwx2ue2mz7dajj@yw3aloojx2mz>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>

Hi Shyam,

> Shyam Sundar S K (8):
>   i2c: piix4: Change the parameter list of piix4_transaction function
>   i2c: piix4: Move i2c_piix4 macros and structures to common header
>   i2c: piix4: Export i2c_piix4 driver functions as library
>   i2c: amd-asf: Add ACPI support for AMD ASF Controller
>   i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with
>     SMBus
>   i2c: amd-asf: Add routine to handle the ASF slave process
>   i2c: amd-asf: Clear remote IRR bit to get successive interrupt
>   MAINTAINERS: Add AMD ASF driver entry

with the suggestions from Andy, I merged your patches to
i2c/i2c-host.

Thanks,
Andi

