Return-Path: <linux-i2c+bounces-14815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C20BECE5B9F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 03:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83A653000DED
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 02:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010511FE45A;
	Mon, 29 Dec 2025 02:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="CTVgvUJy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA08BEC;
	Mon, 29 Dec 2025 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766974157; cv=none; b=e4TwpNWil9aMY+TuuKcWpZzOJ3M86CSPzhk2btnuGS/BekYOD0XP89OQCkxICBMSfaUuRsc7DNQ2BoMt1zn5JWw3jVHHhkqi7LWC+DhKEwlwTwe2kWn39hn/ik2/jfWdZEFXBUkThunDMUsCVxlpO4gXYdraRbtTs+Udm7lnPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766974157; c=relaxed/simple;
	bh=Ly17IRCXf+PpezMZj2RubN6m9ia+kDuxgx/+ao5pAWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogmhLQ6rFiDfY9ynbSPow9Azj5pVJjU5tPAqR6/s3BnmNqRYSzigSJUKl/iPQ7xaI9DYiyPzPZ+kafgC5Tbzu112s1twnBw9uRsyuTJd6tug8zXdZF1Yx0qdHNBKDDSsm34vp+/jAOVt6lGxj5McHFSE8Gf77QYAkQ88caMw2/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=CTVgvUJy; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766974065;
	bh=PQImGFjWOUyAK1IDHTVdJv3c+SXK+cKNa1d2Bg+qzF0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=CTVgvUJyYaZeGjZC/u4hjDTwwV2zC7HCIHFsxhEe/UoIH7/rKKcTegrTSWdQ00r2f
	 6Q5JZmLdHIVLW5rYWaEwc4pj42rO3ChoL/AEExiQGAwUuIPZZnvRbwh2wwABX6/4Fi
	 54lkRtye26qaWwj5Ym10cDC6Yz6WdKTLNrdEK1+0=
X-QQ-mid: zesmtpsz2t1766974056tbc048f24
X-QQ-Originating-IP: 4ECW4Bo3pMvb33vEOeyUaEHe2Q3GyIVA8m5u3tnBJRs=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 10:07:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16099099167800225801
EX-QQ-RecipientCnt: 11
Date: Mon, 29 Dec 2025 10:07:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <6D29D0765AB5632A+aVHiZ9Wph0hNzqDY@kernel.org>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MtJoEQFRGvIzjRIpniR076rR5J1pEXAcgJ2vLhffiUUfkbJ14q8rJ6+x
	FutnnVzxbI8qxvGlMFgCobaEGw0Pqqaemdb5E52XstXPGrN321lQxV/C3pHskddpev6m6iu
	OiaVYLonevwiaudytfv6cwNQsc9hGqa0LizAgPhiNisM6s0biIurXr0xCOySZHdLd2BGLyP
	YPMyCafe+hZKaf8hctd03VbZgm/v5Hl+znhKLv0CKY/Hp4gUm8t+4FjhLT8VmWQ9L5HY1Xo
	YJphrGl1BNhgfvG5fJovAsGq3VNypF5hIwcA8eg6CllVvwHzTwxw4DFYv2UFBiTNNFrrR3z
	PkGd6gzwOV/3xn2CUaUqt9+apGn9k29lq1Iy3jZpfb1oFRAjEdkN386WRiO3r1+gtpS30ex
	wptS26mMi7J+mIVLDDpNFUjhr+rpIGWm9QVnuCiRfyx1+6Y3uINAc51i/uRarPGXVQ8NMyK
	h1M6Uzl1/9UiG/OfnCWO96txuN8ZnVtk3wjir486V2zusG9N2WZ7tx4ynNvae69y1bB6OrH
	8ir3TkZYYt4cFYekwcl9vw19cwhI9kW7esKduKG1+odz2FZbqG9eYcx2R2zDQUqUQDU5Lco
	AtuluTMUsYG2jNxR52pZNHvG58W39sf0OQ5QSVyOTLTNjRDLCPr9SV0j5+m3g2wICCY5ITB
	JM2jAcgF6mEkjoFRHifmZy79LjwJNzLyjo9VobvEdep+fbrfwfVB0xUybUY9dUt/9rp/o86
	2TYCI7D8xgmoSvM37pDxXTf+YNkJCef4b+uRM+z9cQ8iD6Z/bRyU9EIZ6AR7NDfHt+HTTCd
	fj5vptzmHPnXxopoS+qO/1vP78Jsw361oOUnUiv281Yzni2Rukh66rE05lW4pisWIoXvCPv
	KSc8SIXDEEWwwJK5/Wd2r1rNvycmy7khyeYK1LI1p4aqouqup3GbTM5JP0BMC2Lhnu43dF7
	ABkaeHd9/c8h5wywjF0ZvuNxcca7FZtH1LRP1h//9QOjo3Uh5GLuL3jH+K8EsoUCz+bDqD5
	7TvLr9xiW1zdwdhHqis4u0ed+wmRn2gPMk4Ezcg6Xke1oL/AVVKUs2xep+HmY=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

> > @@ -474,6 +608,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> >   	unsigned long timeout;
> >   	int idx = 0, cnt = 0;
> > +	if (i2c->use_pio) {
> > +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> 
> Again, why is a rough 1000 millisecond timeout OK for PIO, while a
> fairly precise timeout value based on the number of bytes to be
> transferred and the transfer bit rate computed for interrupt mode?
Sorry I didn't see this.

In interrupt-driven mode we wait for a single completion event, so the
timeout needs to reflect the worst-case transfer duration to avoid
spurious timeouts.
In PIO mode the loop is driven by FIFO/status progress, and the timeout
is only a safeguard against a stalled bus rather than an exact transfer
time.
Therefore a simple conservative value is sufficient there.

                                  - Troy

