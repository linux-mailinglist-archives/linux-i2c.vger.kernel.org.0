Return-Path: <linux-i2c+bounces-6707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879B977F46
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3EBF1F20F0A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2D41D88DD;
	Fri, 13 Sep 2024 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="dx6Z6IMn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FD1C175F;
	Fri, 13 Sep 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229384; cv=none; b=PcS+SU86yGEtC6+Rv7ABCnt4wgN6aIXZDRNAMkHwYhdq4BqENlXjIxRxX2gD6p+z81QqBxCgOaLI6KHrUkFgVygd2spo67nO+P+FJ2y5LwV8PUP2JZU48IDSqO+HNsiEsvs+6pri2Z3flXdqkbivtx35ziWZWjeciRZtPSxrNK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229384; c=relaxed/simple;
	bh=S8H6jPbmMZNantNVWPG0SCwOFatGJ6CawWw9Frt2PoI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nt69/avCdTOa87/KuE/NZ1Vl8fwY4wBuGHgVy5cAfo/qk3/z14kTc1DSU6AyJtwIw+GDcG03VZnnG6dUD5HZjLQMUlcWR8zDKML9Jdi58Jwi+Hsjr7EjG9OlNl/4Rrhgd1Xjq9WxSzz6GcfUNU4EyjIPhvXcdDLtlWooNmm1Xps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=dx6Z6IMn; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2FWF5Dq/3matU4oupKtZT7KL44HIaVi6C+3SXqNKXc0=; b=dx6Z6IMnRf3u1ptfPnpPqhLsFx
	+w1bFwn6HoyUCcGRq6pq3v+SOshDBRAGp1aNWE5VdbuACTQ0KPZS+f82e4PjAhVz0/sKNEQ3Sv8du
	pudssVcqIs9etPVBwpCCnI88oX8kRS3B6usMZxt2NNPeQiDOVWLGSn6Y9iWVyqa1Bxh9v0Z9W23mU
	YGyewtGmRHbxPfuyJahBeBza3Jjg8uHX8r/chLJaIGG0VxFmOoYypX3+kusijEkcpuIMhxslWT4V5
	M5pvckWGuuKPJKfQkc8tJoOPcZAUqBuLyTaEO5kzGfjmj3QDvmhIuGo5bo4tGJwbXlURpNcLX/Fvl
	fm2UN5jw==;
Date: Fri, 13 Sep 2024 14:09:34 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Reid Tonking <reidt@ti.com>, Tony Lindgren <tony@atomide.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-i2c@vger.kernel.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20240913140934.29bb542b@akair>
In-Reply-To: <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
	<445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
	<20230428074330.GJ14287@atomide.com>
	<20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
	<664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 11 Sep 2024 11:40:04 +0200
schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:

> Hi,
> 
> > Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
> > 
> > On 10:43-20230428, Tony Lindgren wrote:  
> >> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:  
> >>> On 4/27/2023 1:19 AM, Reid Tonking wrote:  
> >>>> Using standard mode, rare false ACK responses were appearing with
> >>>> i2cdetect tool. This was happening due to NACK interrupt
> >>>> triggering ISR thread before register access interrupt was
> >>>> ready. Removing the NACK interrupt's ability to trigger ISR
> >>>> thread lets register access ready interrupt do this instead.  
> >> 
> >> So is it safe to leave NACK interrupt unhandled until we get the
> >> next interrupt, does the ARDY always trigger after hitting this?
> >> 
> >> Regards,
> >> 
> >> Tony  
> > 
> > Yep, the ARDY always gets set after a new command when register
> > access is ready so there's no need for NACK interrupt to control
> > this.  
> 
> I have tested one GTA04A5 board where this patch breaks boot on
> v4.19.283 or v6.11-rc7 (where it was inherited from some earlier -rc
> series).
> 
> The device is either stuck with no signs of activity or reports RCU
> stalls after a 20 second pause.
> 
cannot reproduce it here. I had a patch to disable 1Ghz on that
device in my tree. Do you have anything strange in your
tree?

Regards,
Andreas

