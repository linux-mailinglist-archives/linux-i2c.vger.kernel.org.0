Return-Path: <linux-i2c+bounces-7312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA47F99704C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 18:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F7EE282F5A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A3F1F4FA2;
	Wed,  9 Oct 2024 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhi7ajTr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81E01F4709;
	Wed,  9 Oct 2024 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488222; cv=none; b=kMScGHcJL5qMHo/YS89tNvcTfp6ojVMH4sNlc5MAT95o2mi3YZBi+TXb1UBeMmM4zVDICbBVwHbk5SzksJK6GWO6+Ol3c5YsJHVgbod5wizN08phi6ZXlKESh9ubVHepyMDd4UTaaDODauvpL/bTu37icEGvjoLDTkcwWa5mDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488222; c=relaxed/simple;
	bh=cCaGEMvA2mlKaW+ZQZkA251yMVNDbAcCyJ1hQ7Q2uNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfRugNbMhi6B7VlNP+eBYRa2Bq9sITyzBwHEoajw5crr0Dj3o2qNGWbKSZciBahYtKIBnKFfOuTgFRTUsXU3tYRpw+S2UUsGw4RN+MpsNKvQxNHgDjj5uHlDnZyh/5XEArBIiJmZKJbgGQlOArXyzGY8/eosOb9jQPKzwRcXq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhi7ajTr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7048C4CEC3;
	Wed,  9 Oct 2024 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728488222;
	bh=cCaGEMvA2mlKaW+ZQZkA251yMVNDbAcCyJ1hQ7Q2uNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhi7ajTrwclrGl3LZSwHfLyXG3n7NZGMHB4HTfSzdWqSVyaYojVKCPh2kqrRN4+r2
	 zFTGCN8PgLqtz5vf/lezHjSUQmbJsO5OnwGznZiemnRKAlOdE7AlkLFcxQEKYHn7Mm
	 IuueNjPVk/21JBH+UeTYKpe+/qDClhouhguveAybJoJtN2na8/SIufxW8rkKlvxsKA
	 euRdob9EF3t4h4k6h4ShNh5eXQx3COdXf4mfeY/Vio8nRNhy+zKF8TTShmKWEXmwMc
	 KdEvc4K8reuRFuKhkquHoxhmzI9zghJG+FQlsQWM7e9MhfsvTcD2TOYXsQyQTIFn25
	 YN/LfoW3qySjg==
Date: Wed, 9 Oct 2024 16:36:30 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
	thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
Subject: Re: [PATCH v3 0/5] Congatec Board Controller drivers
Message-ID: <20241009153630.GA637580@google.com>
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
 <172848812261.638400.481811844035668418.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172848812261.638400.481811844035668418.b4-ty@kernel.org>

On Wed, 09 Oct 2024, Lee Jones wrote:

> On Tue, 01 Oct 2024 13:53:26 +0200, Thomas Richard wrote:
> > This is the third iteration of the Congatec Board Controller series.
> > 
> > There are only few changes for the GPIO driver (commit message, Kconfig,
> > remove useless cast).
> > I also rebased the series on Linux v6.12-rc1.
> > 
> > Best Regards,
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] mfd: add Congatec Board Controller mfd driver
>       commit: 6f1067cfbee72b04fc42234f7f1588f838cec0b6
> [2/5] gpio: Congatec Board Controller gpio driver
>       commit: 4342bf63b64b09561f4ad1537de2e1a971cfb197
> [3/5] i2c: Congatec Board Controller i2c bus driver
>       commit: 6894f640b8f3f48700ccc828419ba60704f5a405
> [4/5] watchdog: Congatec Board Controller watchdog timer driver
>       commit: 6f264047869e9683520ff8f7c235c07c1ca989d6
> [5/5] MAINTAINERS: Add entry for Congatec Board Controller
>       commit: 590bcce85e014a2e16afe910bc6a20b4c1b2b374

Sent for build testing.  Will follow-up with an PR once complete.

Note to self: ib-mfd-gpio-i2c-watchdog-6.13

-- 
Lee Jones [李琼斯]

