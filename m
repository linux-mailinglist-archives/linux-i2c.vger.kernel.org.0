Return-Path: <linux-i2c+bounces-13258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F32BA6687
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 04:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48F43BDADF
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 02:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA8822FE02;
	Sun, 28 Sep 2025 02:54:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284822AE7A;
	Sun, 28 Sep 2025 02:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759028047; cv=none; b=redaq+G62JJ1Qew9Qk7AGe8bcf26kCZcBXHcm25E5h+Muke/sKB4e2AX7igebSZx5YK65IW70iTEjteOQBd8DxQdbtH/JgUDbq6kz5bEKaaViWDdodR5iV7qh/9CVK88EUSt6a0bBD2ZrV07SjnlRaqBawLDtLTeve0Ax9k7M/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759028047; c=relaxed/simple;
	bh=tNuhvw/dBLQVPe8NgroFNiR3wp2cMxgJpy3KYZhZq/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCs5cBg/hjADyeNF2x+4ChvLGt9wT4jrpjoIGMdORgJBblpboppcDTBXc8gQyYYyEsNs/Xc7u2xcBfYNrRAjtuyXsfABjSd6oHXD6sU3Kn/ucsAGojbAaplP8w17WFqqNrOgWMMlm9cS4A5aAhHdX6CasEC4+VIV3Iymu4PYkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 19F74340E37;
	Sun, 28 Sep 2025 02:54:04 +0000 (UTC)
Date: Sun, 28 Sep 2025 10:54:00 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250928025400-GYB1330052@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
 <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>

Hi Troy,

On 09:17 Sun 28 Sep     , Troy Mitchell wrote:
> On Sat, Sep 27, 2025 at 06:56:16PM +0800, Yixun Lan wrote:
> > On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > enabling the use of I2C with interrupts disabled.
> > > 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
> > >  1 file changed, 140 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > > index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> > > --- a/drivers/i2c/busses/i2c-k1.c
> > > +++ b/drivers/i2c/busses/i2c-k1.c
> > > @@ -97,6 +97,9 @@
> > >  
> > ..
> > >  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> > >  {
> > >  	unsigned long time_left;
> > > @@ -310,10 +368,28 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> > >  
> > >  		reinit_completion(&i2c->complete);
> > >  
> > > -		spacemit_i2c_start(i2c);
> > > +		if (i2c->is_pio) {
> > > +			/* We disable the interrupt to avoid unintended spurious triggers. */
> > the comment is suspicious, and seems wrong..
> > > +			disable_irq(i2c->irq);
> > > +
> > I guess this doesn't disable interrupt in the hardware layer, it will still
> > fire interrupt once enabled, so instead of calling disable_irq(), why not
> > dealing with ISR setting of the controller? I mean those "IE bits"(interrupt
> > enableing) of ICR REGISTER, disabling them should prevent the interrupt
> > triggered?
> For example, take MSD (master stop detect).
> If we disable this interrupt, even the interrupt status bit will never be triggered.
No, this is not something I understand..
> Then how are we supposed to know when the transfer has completed?
> That’s why we disable the global interrupt here, but still keep the pending bit.
checking 18.1.4.1 ICR REGISTER, there is Master Stop Deteced Enable - MSDE (Bit[26]) and
Master Stop Deteced Interrupt Enable - MSDIE (BIT[25])
you can disable MSDIE but still enable MSDE, and check status of MSD (BIT[26]) of ISR REGISTER?
it should still work with interrupt disabled, otherwise I'd consider the hardware is broken.

-- 
Yixun Lan (dlan)

