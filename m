Return-Path: <linux-i2c+bounces-7208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1104998EFD2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 14:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431BF1C224E5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 12:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28178198836;
	Thu,  3 Oct 2024 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyMG2GY4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D825B19309D;
	Thu,  3 Oct 2024 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727960215; cv=none; b=DCH9UY0aOtu9G2EGq21tv4EZEfBtq+bgMzoD5Lcr2oHC2n1R9vgiqpAWqVm3AeaZs2X5EiK04IBPOZTz480qLBfaT4p+p0stwHtWfmIAxfCuqM9RrlEIOFPALSCBtRaaGgk+QqvrXUjIzuEB5EnbyetQxY5WJRiPfGhsjSFlvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727960215; c=relaxed/simple;
	bh=b3o2grP0GZ7eFjxPtC+/l0sm8iFwDIbqgxFu4CCYHKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRCb0CfIjRESlOS3la8VS/I/bBlJNcWdxU0ncGZh5QwefEoFFZzL/QiRKPhkYFqbOvCoc3ak40s4+OTyb5valzs3bXekg//gdKBpZPAqGGI8782kUY2iH9Amb+odnTri1yQC2S5D0s71C0amRlxhjRV7+p6I0LW9w+1IVOhe6DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyMG2GY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5387C4CEC5;
	Thu,  3 Oct 2024 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727960215;
	bh=b3o2grP0GZ7eFjxPtC+/l0sm8iFwDIbqgxFu4CCYHKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyMG2GY4rWuFScIGN8gIwIxGohzUA8bKJPIzDyU18cSYOD4lkd0hcznsmfaQCpRwh
	 qxhZ/C3/4ML2f/Nw6h/rvtznKLz0UwzT1PM90VL1MmSm4ffFcWOAEfS0WLhK23Dnmy
	 YpHa0f7LtvRHsDLWtFQ2ajC90UP+LO5XKuSF7MyjDYwPJg4s3Dyjl1hV6SRsNndMkr
	 Ru6GdGrxT180Gf6ercL3szFpwf8esA9dpPWC41AIs40Kb6t7eXEmnryzhgjB8aUQ59
	 HK891PCOrnVEQF+Q1CsmrUcb+a2FHM10FUt+vLj9TWpDjMYxQKfGs4mHAB0fZejPzb
	 EbEBpN3JDk1Lw==
Date: Thu, 3 Oct 2024 14:56:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "hunter.yu" <hunter.yu@hj-micro.com>
Cc: andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com, 
	lenb@kernel.org, rafael@kernel.org, jsd@semihalf.com, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, andy.xu@hj-micro.com, peter.du@hj-micro.com
Subject: Re: [PATCH v2 0/2] i2c: Add ACPI support for HJMC01
Message-ID: <z36ad43lbhitrb6z263d43fie3ykfjjw4wr76xd73quianocsn@5lccbdjen4bc>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926024026.2539-1-hunter.yu@hj-micro.com>

Hi Hunter,

> hunter.yu (2):
>   ACPI: APD: Add clock frequency for HJMC01 I2C controller
>   i2c: designware: Add a new ACPI HID for HJMC01 I2C controller

Applied to i2c/i2c-host and I took the freedom to change
"hunter.yu" with "Hunter Yu".

Thanks,
Andi

