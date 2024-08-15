Return-Path: <linux-i2c+bounces-5427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801F952EFD
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 15:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D41031F217ED
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 13:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2B719DF9D;
	Thu, 15 Aug 2024 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J91fjJ5O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7+rqDMm7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DDE1714D0;
	Thu, 15 Aug 2024 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723728208; cv=none; b=vFYj+/3pJPgEI9vryD5BkCrVPu4La7IrV/i7agxNcBe2wk3jaWoP+Elnm9RbMeWzThr93zKAOHrOJb3hB6h5Bju4829rtonoPKSRwLi5Dlq44gBow7tv3LbhnCyUvtZSiHUqZWoxB7zQ5nNZS8zZla0vuIJK4r7tOnEGQ+47zFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723728208; c=relaxed/simple;
	bh=2Vb+RMwTgKVFWNik0V48KKODIqOfKyl73RQHm1ZeGNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QQFP5yZ8XwC21tl9L6kyvICY1iYR9GRTmVCvcIIqZAYFWpoX/syBRJFFrD2qcU4U/z2uy5z+nejy+gFOs0XxaEfxM9tVc2D4cGUXBYdkIonODzU1ZHRypnJ+137r4ATruteGstLa874AeQuz0YMcNIu7Fia2IMUztRg42jsaa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J91fjJ5O; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7+rqDMm7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723728204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQR2bfNvJQ81T9N7AIq6wV+tHy/CCdW+i/V2bG+WVoQ=;
	b=J91fjJ5OE5GSKm4Yn7+uXy/2BRdmGXpUz49FVh+BA4ILfaut0E5NYAOSPkF4TWLPmkTd6Y
	INXVTc1bAvUdcJzl9g5O/VCBC8VogFVLVPu5F+Hlrx28LUoYpEZAAef0UHZA97G1rw6yVo
	yiTF0VnEqeMDFce8lu9kBlzvs2RNsUG7SYA2zEAXunHHqjN07RPm1pA3U9UsZgdDcWCRRa
	PrsCt5HXlaadWfcdZD1QcHPijyop5oH2mIew0FFGqavUmiOOoOo212qmG2u1/QCxwWOG1l
	0f6KeNQK9qvaU89V4zrMFSxzhgM9Nv7c/TIG1KoFkdtrajtmjkdRgJFdBN0uXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723728204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQR2bfNvJQ81T9N7AIq6wV+tHy/CCdW+i/V2bG+WVoQ=;
	b=7+rqDMm7t/hgpsBUqCvHKvR3/DTI1UrHrnFjBLInTZ1OyM+x+qzLZ2Ib8YOjU/oOq9VmXA
	VSGleR++SVZC6tDA==
To: Mary Strodl <mstrodl@freedom.csh.rit.edu>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, s.hauer@pengutronix.de,
 christian.gmeiner@gmail.com
Subject: Re: [PATCH v4 1/2] x86: Add basic support for the Congatec CGEB
 BIOS interface
In-Reply-To: <Zr329S8995L0OsCu@freedom.csh.rit.edu>
References: <20240814184731.1310988-2-mstrodl@csh.rit.edu>
 <87sev6m14n.ffs@tglx> <Zr329S8995L0OsCu@freedom.csh.rit.edu>
Date: Thu, 15 Aug 2024 15:23:24 +0200
Message-ID: <87msldncmr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mary!

On Thu, Aug 15 2024 at 08:39, Mary Strodl wrote:
> On Thu, Aug 15, 2024 at 02:17:12PM +0200, Thomas Gleixner wrote:
>> Congatec even provides the GPL2 licenced source for this pokery as a
>> kernel driver.
>
> The only driver I've found from them is the one that runs blobs in the BIOS.
> Where did you find the IOPORT stuff?

Look for CGOS_DIRECT_Lx_R3.0.0.zip on the congatec webpage.

Caveat: You need to wear protective glasses to look at it and you should
        keep your favorite booze handy to clear your brain afterwards.

> Thanks for taking time to read through this!

You're welcome.

       tglx

