Return-Path: <linux-i2c+bounces-7672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868289B75FD
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 09:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 006E5B23E73
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 08:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4951E14A604;
	Thu, 31 Oct 2024 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABuOf0UU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1F12CDB6;
	Thu, 31 Oct 2024 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730361641; cv=none; b=lwAfEmnnJ++jYcDehoEthsrzuIwOKusXmNVG2xoZcgeVV56Nu9kSW5Y6OYulxgUVNclYU6ORSPiGZtm1XC3ug7dZSYamxsMnkGBg5oivhhGgaIdOnqgVm64q7KZ4hvFV6OCmPHpT//Y6pVpvNFurhznR1ATb6peEshR6d8BM+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730361641; c=relaxed/simple;
	bh=/lcem0/na5hpUEq0FSk7UNYC0n854xl8K8X1eIkKK0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNfqa9hYDkRoSn6KUJd7scFObX+Y5uFvi6swDXoqThGaFYSxhoD2MBgDo3mXNi9cnUxv+Hz6XhTMjPdww5H4N5i/iUfaubEPcq24e/mPG3Mvj9oCRNe0TMclnmpiXhJ/f2ADwdl2II5MORp2KNBzyN0OZh0WhVM9mbA2jONwFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABuOf0UU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF5EC4CED0;
	Thu, 31 Oct 2024 08:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730361639;
	bh=/lcem0/na5hpUEq0FSk7UNYC0n854xl8K8X1eIkKK0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABuOf0UU2rrlUl5SunupXLXdIHGcTmiKNXrcQOSjBgQJpYBZW9gpdUOF8AQvG3mXT
	 V7f86biGefFlMZu7uCyH8h/+6AYIsU5Vx7ZF7VBeHikrTiWFtn3AZWQ69xAHaEPdRV
	 KC6qTWjqTB3S8jvoUnZVyqN83FFF5fQk2dE2HI1EBk5tibzVOsWNUbAqP4bJNqV2q+
	 eqB9JXQkpDMcp8bAGDYecefYD5oAY/p3FLm7WMAcy4XaRjIDURXM2m0WMnv1f3wRJc
	 ZpeNn/9wq0kGVl94H3AR6wBPq1fvagWLlScEnjeDzSVemzUUDGXIIObc+P/LZO/GUq
	 jjmKxuUwnC6WA==
Date: Thu, 31 Oct 2024 09:00:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>

On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
> > On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> >> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> >> and supports FIFO transmission.
> >>
> >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> ---
> > 
> > Where is the changelog? Nothing here, nothing in cover letter.
> > 
> > I asked for several changes, so now I don't know if you implemented
> > them.
> 
> I deleted the FIFO property because I believe your suggestion is correct.
> this should be decided by the driver, even though the FIFO is provided
> by the hardware.
> 
> Apologies for missing the changelog. To correct this, should I send a v3 
> version with the changelog or resend v2?

Reply now with changelog. Your binding has some other unrelated and
incorrect changes, which I do not understand.

Best regards,
Krzysztof


