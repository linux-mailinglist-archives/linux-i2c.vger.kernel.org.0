Return-Path: <linux-i2c+bounces-8635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D59F7AB0
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 12:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A4361606B4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 11:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83D02236F4;
	Thu, 19 Dec 2024 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+KtOd11"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221A22256E;
	Thu, 19 Dec 2024 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734609061; cv=none; b=Pd4NMfQ0mikQP7Vp3fRisd7BzhreQgfnsPvd1KkVhpcOSxKo16Hm5iC+aQ2rd5WObKvzsXqpZr5py/zERy6XQ/HPUga6exvnp0Y3cDZVXr6txZJbELpXtYY+O9AIr2oVkUjeElNz/S+FlrhRJ16h+2+3OhOSMP1FlCPQdBNe47g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734609061; c=relaxed/simple;
	bh=e/PtZOP08X9uNbZQClRarcWAa1DyAY26IrldpLYTJqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqFgooem+F2bQKx9KFi679mbdYWc4hon4uaRyvl+TT8Fs1aOSVHsbgMluVZBekwgxYZjfX6vzoCVPkRQLNtyOOpHH2SisCXQt8Muv0qGQm0njgrdKVTm/0Q7fIwFHLKFvdrFTxmX4GWAI0ucb+epKv/y5XhIiG0DXgarur/dmwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+KtOd11; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462B4C4CECE;
	Thu, 19 Dec 2024 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734609059;
	bh=e/PtZOP08X9uNbZQClRarcWAa1DyAY26IrldpLYTJqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+KtOd11HqB7s4qStP9fuBKoSyOay1t0gOaC0YPPhFy2n6FXati0Aw59LbBC2F/3w
	 IDHDKGZjU0LoQcpFAT5XmMDiVKuY5x/oWSPD+La8ehi1abGSVZ2Znbsn5vb2RmqDMN
	 mY7HR79mGbStOdAAq43au2PRIuPletq5XvGe9Qlbczxsq9x27d0FbMow3fDmpbu83X
	 8HEZEPqNBedvxDSVC1cNbUBiKJFihZKPto0Xt1Sg2xl1sNEd5kmpCDDeMHOegl3NIY
	 rGA4F5phQ/QlaPFq6YgPZkipOzyjUlxfY00PfZE/wEAy4ppAotkQu1A6f6ARhxeAZx
	 keEllArR2rjxw==
Date: Thu, 19 Dec 2024 12:50:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Microchip CoreI2C driver fixes
Message-ID: <axscykf5n2lutd7pqljaiyyfwgw2vuh7knnxcv6vlphu2fxefp@7kmgimahqop4>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>

Hi Conor,

On Wed, Dec 18, 2024 at 12:07:39PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v2 with one of the minor items pointed out by Andi resolved and
> a new patch for an issue fixed in the months since v1, plus some minor
> checkpatch things that I seem to have missed on v1. On v1 there was
> unresolved discussion with Wolfram, but it has been two months without a
> response so I am sending this v2 in an attempt to make progress.
> 
> Cheers,
> Conor.
> 
> v2:
> - remove extra () Andi pointed out
> - fix some {} use that defied the coding style
> - new patch for "ghost detections"
> 
> v1: https://lore.kernel.org/linux-i2c/20240930-uneasy-dorsal-1acda9227b0d@spud/
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Andi Shyti <andi.shyti@kernel.org>
> CC: Wolfram Sang <wsa@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-i2c@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> 
> Conor Dooley (2):
>   i2c: microchip-core: actually use repeated sends
>   i2c: microchip-core: fix "ghost" detections

Thanks for your patches, they look fine to me. For self reference
I'm going to add

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

to both of them. If you don't mind, I'm going to queue them up
for next week, as I'm not accepting anymore Fixes for this week
(unless they are trivial).

Thank you,
Andi

