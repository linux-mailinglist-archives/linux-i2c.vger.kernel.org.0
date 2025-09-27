Return-Path: <linux-i2c+bounces-13220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B9BA58C1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 06:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9598417E1FA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 04:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5D22264B0;
	Sat, 27 Sep 2025 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UX+GXElL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03022538F;
	Sat, 27 Sep 2025 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758945960; cv=none; b=gXN80diwwcu0Glh1c6ke/Fdt6FTgLDilMVbCOqR5ji/SWBELMeq7rChAr/+CxZBlicvQ0erVP61DjMRJ2oUH2LtRnkqR8xucBK19lTRbx7roM4PJmGi9luVGyPoz4JWFEtFdcCn+ZW55hUEjR8W3GGu332HC3GCpmzaJZxzy8RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758945960; c=relaxed/simple;
	bh=Fo49InlkBL2egIeunJzNpOgfqJMqVW/GprT3gm5KchE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG43PPcu8N7t8bzbhQsiaXTFKlC67/M5jDIMg77RscKM3i+l4D/ClvMukMGNFn4w7gvaOXtEpI6ML3uns8nvnEmh2qejn40hw//w117iJQqqzrnwLud/6coYBnYzeA0m41wuab5HSWPLPqYb09FTcOGzgk8L+Z/gA4WYxmlUZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UX+GXElL; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758945877;
	bh=dOmDpWGWjAIcXaD2K4pnaMnVFW35Nhm0axjf6jjkM94=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=UX+GXElLT6vMpIUCtKCP8d4WgsQAPMzOoEJ0LXIk8ZbPsTqw6Wj/9QAQe5IV0VzQF
	 Ujg3J2L3GceEI0o8OxoUWmVSx3FeMXIIwHvYCfQAQ7d0vLw4e5Kw0PPBFAXKQdBLbI
	 9ueoLXq8A5Pz1mbdlnJxd6Ky3XKmHZJ1T65084yo=
X-QQ-mid: zesmtpip3t1758945870tf42e45f4
X-QQ-Originating-IP: Loc1WRX0yOLpBxWTT4vSk7P4W5l8b/UGyhQf8IANPZ8=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 12:04:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8734647494709726555
EX-QQ-RecipientCnt: 9
Date: Sat, 27 Sep 2025 12:04:28 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927014547-GYA1336612@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250927014547-GYA1336612@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: No4GWyI4cWt6yq7nsa2Z3T+dRhiHdHb2o95Jy8Vez7Eu1mpPog4IaybQ
	F94BrRltarg9U94Z4iG74LtXAgn6U/J+ZjAxaZsIRzCtZFFz0xtUydnG6wyUswFduybVGsr
	+gzNFgMvEs7NAi0j/TKgDVB2hYNTAtlwwhjRP5ntS8pWx69lLJ7dJwLeEUQxsfPDigq7bVZ
	yN+uvXtu7XEFnf4xdhEElPQmPNtNkk1TNZ40cQHo8k30R44w2rrOQNJk7XFz59L0umJmfy2
	mCgLLnF5Kcpe8tCu9ozfCLIxYKUzzIaytM2w5M5iYQQTxO4lOjfHSJN3RyNaOrks2m8U/5N
	0aWL8xsFlkG8SHSViPqEpsCubdpDkzT5wH1XN7uTjKPDn8bhvho8wJqWHzjfcSeMODcZVrl
	4yMylXCmjkoCCJNOH+anITlvfQQM1HSCR5AAhVmxZ6JhoO4C8idQ116YzMo/P94XgF+YIpF
	vDVg7ij0d4B4zGz8XxncRiPO469fOmVPRKmFfHpE4zJVmOfVOT2lXEM1OMOf0UqY3m2/ssB
	5geM9aG5q6vUVeXxJnGLdbuXz44Sw0Uql9mL7CnJSdJ7Ql+JGsmH2lLkbh2GMx8WVkDd4/T
	R+GZ++JMjRdjdysiY7kTlu1HPwES7tkoWWGtaifFukwNthSfBVzBHUl8fmRw9bzehi6BESi
	u1DA4Hy3xk4q1bQ6hQGWJC3m0JrQTjuDLLqHDKBHNEdSeTmcTDQkLldB/iFuEdROwjBGF64
	VyrofMpsw+L2KjgLmaWXXnUcOeynAOsloofmHiDzMoE2NUz1UpfaEVlTdEstYc/lizRh5U1
	rOnXjtRk0dFfILVMykKy45Y11TLOX4DYAojL8Gvi7+Yy+8oLZ7yif3I+QTx6boErf++zhFa
	VHmEGQ71jH45eOT0UeFeJVJ89odeHmc92YSnaqz/wPaItnI5PwrnCvZXgFPJidYdXIpr5mw
	lgWGHMv2PDh/aIGk5K62ewXQkqwldMGwWNMbVosfwph96JWbdPam3q567yc8XvIo5B5dvVF
	9nnZ5JWA6oSYVdDQs3HgCHGhHuPmuDR3ozgr+T+L3+cllSgTCcUExxOOf6lVY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Sat, Sep 27, 2025 at 09:45:47AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C with interrupts disabled.
> I feel it's more proper to say
> s/with interrupts disabled/in atomic context/
Good point.

> 
> I've noticed that K1 I2C controller support three different transmission mode:
>  non-fifo, fifo mode, dma mode
> 
> while you are trying to implement pio support, I'd suggest to think one
> further step in the long run - support more fifo/dma + normal/atomic features,
I understand your concern, but I have reviewed the code structure,
and adding FIFO support would not significantly affect the current PIO implementation.

> 
> Personally, I'd like to see fifo mode implemented before adding pio
> support, as it will bring quite significant code changes, require heavy
> code review effort. And yes, this will put more demanding work on your side
> and may slow things a bit..
That said, we don’t have any plans to support FIFO at this point,
and PIO functionality is something we need urgently.
So I will continue to push this patch (tomorrow).
Thanks for your understanding. For details on the code changes, please see above.

In addition, if anyone is interested in adding FIFO support, I’d be happy to help.

                                            - Troy
>
> 
> -- 
> Yixun Lan (dlan)
> 

