Return-Path: <linux-i2c+bounces-13230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68108BA5D48
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A7462A14DD
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29F22D94B9;
	Sat, 27 Sep 2025 10:17:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FE23A9BE;
	Sat, 27 Sep 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968221; cv=none; b=FKYW8GQpuGvjyvdC6U7WmK+a3enhx2wkru9rQYlf0wMFSmgB2ppI+3mtfMaGxAAAj9JS8a94CkqUjr3OZYXlgImrEu+Ro9oE7Eh+nHTsE+nj2ZTQUarIkaoAJg03hLPBsKuEY0VGWLlQc+7D40Z8Oz3MOI9W6eCIKtW7Ayl2fUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968221; c=relaxed/simple;
	bh=qx/WI+3JkHa6MxT/yJXiCM7OSE5/VFUdxozIcz42sjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmH7OhsR1578tRRgrZ3fWAvLowK8tU+rEJcz24BvUNWWV1nIY8rXwofTGMjpSr3q67Uejzl+MavdZD26SiLQMzEfpZcIcPRrxvFLlGhBVcHhKwS1MmCg9pUoroJb5rjtre26qMq81GJPLSxEgaHytTXeXtiDKUUaAMjIho6M2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 424F0340D96;
	Sat, 27 Sep 2025 10:16:59 +0000 (UTC)
Date: Sat, 27 Sep 2025 18:16:48 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927101648-GYA1338789@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927014547-GYA1336612@gentoo.org>
 <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>

Hi Troy,

On 12:04 Sat 27 Sep     , Troy Mitchell wrote:
> On Sat, Sep 27, 2025 at 09:45:47AM +0800, Yixun Lan wrote:
> > Hi Troy,
> > 
> > On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > enabling the use of I2C with interrupts disabled.
> > I feel it's more proper to say
> > s/with interrupts disabled/in atomic context/
> Good point.
> 
> > 
> > I've noticed that K1 I2C controller support three different transmission mode:
> >  non-fifo, fifo mode, dma mode
> > 
> > while you are trying to implement pio support, I'd suggest to think one
> > further step in the long run - support more fifo/dma + normal/atomic features,
> I understand your concern, but I have reviewed the code structure,
> and adding FIFO support would not significantly affect the current PIO implementation.
we will see..

> 
> > 
> > Personally, I'd like to see fifo mode implemented before adding pio
> > support, as it will bring quite significant code changes, require heavy
> > code review effort. And yes, this will put more demanding work on your side
> > and may slow things a bit..
> That said, we don’t have any plans to support FIFO at this point,
> and PIO functionality is something we need urgently.
> So I will continue to push this patch (tomorrow).
please do not flush the mailing list and give people some time, I haven't seen 
enough reviews coming, please wait for ~one week before sending next version,
or make sure you've accumulated enough changes..

> Thanks for your understanding. For details on the code changes, please see above.
> 
> In addition, if anyone is interested in adding FIFO support, I’d be happy to help.
> 
do you want to push the work (support fifo mode) to community?

-- 
Yixun Lan (dlan)

