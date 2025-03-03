Return-Path: <linux-i2c+bounces-9679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5ADA4B824
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 08:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B591188BF14
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 07:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB02313D539;
	Mon,  3 Mar 2025 07:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="K2iHlyiA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D084C85;
	Mon,  3 Mar 2025 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740985919; cv=none; b=CzHIm4T/fVhheqx9LmBMVG+jo3MdW1OdFdSq4KH6v+fw19vivlP/MzH0e6FiIh9YuKyj/19ej6+7KNXSV9LVrY2aa6l8NoU5RsLVSKptzGWP+QGcZJivn4BhaH4QTqFP9BSA6Ha4GE3X4c0v6RCon4p3GSJgRYw5PcY0ZlLnhTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740985919; c=relaxed/simple;
	bh=VMN8Xd0ghhP1cTP0V0cYW52AfHb3ymyFSS1C2YenNK0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5gzxjbGVuhBWBdhobbXQqM2TxCOOpc7z9LdWnWoN3tuqfwkFO6KeCAoh60ctPbUiLKLWbDm1dJ/X3RDb5LF64vIdnSwCgABzjBlYKpeaWKB89q+2mM/sawOcVFsmeVeDYKb8CzNa7nossCFr8aIi+ON9w2a0H1t/r04INL1POk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=K2iHlyiA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 48DC52061F;
	Mon,  3 Mar 2025 08:11:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeaFyw_v4m5d; Mon,  3 Mar 2025 08:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740985910; bh=VMN8Xd0ghhP1cTP0V0cYW52AfHb3ymyFSS1C2YenNK0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=K2iHlyiArGPniZayHlQw9dJk6E60ujtfNIS83hLkTvCrwgLwEgJssUeHKNL6DmF3m
	 kvJJA29hr8NvT6k6ON/kkag1OGdx6tNiRR05FIpkdQy9GbOy1yycMqvJSRmTDTqwfV
	 DqgPisvWCsMInxjNxWDNF+D4upxRbrkK3XaHS9+/LR8hri9+5kC2FVGB0tbRP7PaOz
	 sHBt2mApSfNm+8FDfjLmKUDFxNZYj5KyWMH3qivTog5uhIck3wHzWxyAkQOYYqaPKM
	 Xx8bNJPqs6XbhsyoWrHTZNbdx/FWLdjHydX7bc9knVQUnW9xmYslrK0zf1IgQQliLi
	 ilRk3et4Drf4g==
Date: Mon, 3 Mar 2025 07:11:27 +0000
From: Yao Zi <ziyao@disroot.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
Message-ID: <Z8VWH-ZXv1FWQU3u@pie>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
 <Z8VHaQsqAmhtQnbv@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8VHaQsqAmhtQnbv@shikoro>

On Mon, Mar 03, 2025 at 07:08:41AM +0100, Wolfram Sang wrote:
> 
> > +/* spacemit i2c registers */
> > +#define SPACEMIT_ICR		 0x0		/* Control Register */
> > +#define SPACEMIT_ISR		 0x4		/* Status Register */
> > +#define SPACEMIT_IDBR		 0xc		/* Data Buffer Register */
> > +#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> > +
> > +/* register SPACEMIT_ICR fields */
> > +#define SPACEMIT_CR_START        BIT(0)		/* start bit */
> > +#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
> > +#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
> > +#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */
> 
> This looks like a lot like a variant of the i2c-pxa register set. Has it
> been considered to reuse that driver?
> 

Reusing existing driver has been discussed earlier[1] and the answer was
no. It really has been a long time.

Thanks,
Yao Zi

[1]: https://lore.kernel.org/all/6015d35d-6d91-4ac1-8ebf-4f79b304370f@gmail.com/

