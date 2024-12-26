Return-Path: <linux-i2c+bounces-8729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E12239FCF34
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBA8188211F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 23:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEDB1B87ED;
	Thu, 26 Dec 2024 23:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSZG1DVV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB6318B46E
	for <linux-i2c@vger.kernel.org>; Thu, 26 Dec 2024 23:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256920; cv=none; b=URVwPahi7KxEC+WR0U+U4BZozp++JKOIrm59PqJjilTm6O8AeWjsQz445llvk2z/yUBd60Ko8G4MzvrCn6oIFQghHRcZlDUrmRfH/dxOF3p2LkwXCjba5bKA6AyHZ3vkiato5vt2xFihbUsylIPxJrP+Ge8DMBpu3vD68dlJ/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256920; c=relaxed/simple;
	bh=KwxC/A1uuCdnWILft3i4rF9RaMokdEZuvhY+M+bIRV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvVFJBhMjXAPbP+I2yHG30Cr8/SWa2Kmp6y8B7FRKSditjiKxjkVAVUzlDM7JBDPsdCSNdfW8LaQgNYFFCo83eWm9gj4owEYtZC4onMwhWCAIOYCLzAoB3dbO3PFLHHC3r/2hDjZTRgPLmvaTBxjKQYSxf1spuqV8ndPJ9drKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSZG1DVV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E64C4CED1;
	Thu, 26 Dec 2024 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256919;
	bh=KwxC/A1uuCdnWILft3i4rF9RaMokdEZuvhY+M+bIRV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSZG1DVVugmlmHLsmZagyplmvCDYMoMXWrs2QyQqJhJCdy7oUlegPfF38oboCBYi0
	 YKIPb+ZTsic0y54XlVHpQyWYMbqpsxJ2QQGK3tFXSKyZBvgZoslyyTzwG4tKinFbS1
	 3pMeG6ew883NU/tD4X5Ju1vFlvjld2RaWmTa8V/cHmxjGwD54vDQVBpIe0VgEAjqHE
	 Nk3JB2yYcOhiy5a0QiVYop8eRqI04SA5UmHSks4o1ea3rfnm+C5g0xncZFcUBuMJbE
	 44pcnTdsp5RS8MYsf+Wm4Or9XJbp2WL76jpA2glrFydQot0QhN7huKhjN2CqzFxSkU
	 bFSpsN3YbqQtA==
Date: Fri, 27 Dec 2024 00:48:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] i2c: nomadik: Enable compile testing for the Nomadik
 driver
Message-ID: <ruidkssdt7zjn2worvnnm4fwa5oombh5awgvihrsy4q474xj5l@tracwpocpqig>
References: <20241210221641.2661577-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210221641.2661577-1-andi.shyti@kernel.org>

Hi,

On Tue, Dec 10, 2024 at 11:16:41PM +0100, Andi Shyti wrote:
> The AMBA bus header files do not generate compilation errors even
> when the AMBA bus is not enabled in Kconfig via ARM_AMBA.
> 
> This allows the Nomadik driver to be compiled for testing
> purposes with the COMPILE_TEST option enabled.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>

merged to i2c/i2c-host.

Andi

