Return-Path: <linux-i2c+bounces-14802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC3CE4ACB
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 11:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C66CE3004D2C
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 10:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEF72BE035;
	Sun, 28 Dec 2025 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jeryTxn7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC828CF7C;
	Sun, 28 Dec 2025 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766918048; cv=none; b=oNLNNfyQECwbPWbRlcPq0pSLs2JvtDMRbSZug46THAKQ8XPJpsj/YJc5xLH/LMfznSdBYBCY+QndzoHQCRu9P47jkIV2iOVwcJhg7emUUMZe5HaJmoKWg3LQjmKkV1xYwThMtDGpeWRH7O7hOqtas8mxDzjQc6VyfVxsXWVCkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766918048; c=relaxed/simple;
	bh=qjWx4tctoUv5t2iRk1CfdEcE0l7qyPYgAoUnZLIQhEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFPiEC4Pugf5mtpjDMMfwhI7H5X9gRH5DctyYsap6pSJwT5sqHm9wI3CtsSq/KZqfZ36TtXHbM+8KoLIUxeYd88x+U1/9Jtuc1aLa90pt3y+Nz9sUvWAYUfDmdxEWM7KcCGNGQn5DA5+voF2/dAz06kutoEBIyFrHk+IHSXkHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jeryTxn7; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766917884;
	bh=4juI8+CNL0err5MO2vqKaa/2yYGzmUY2NVZNg7kqT8w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=jeryTxn7GKY2364jezJiIaz+IHhY3xIq1JfXd/wSWEvqqVOAnS7+aijnxnepE40se
	 SmroOwsvLRvEhTUBUaqsOGow0oGj3DCHiIsOpYbQyZ2aPrUkxsjh5GVyfL2BYap5kh
	 oczxKjIVVTm45MivtcXgTGr50iTcCcCRX2dBdkRc=
X-QQ-mid: zesmtpip3t1766917875t195b4575
X-QQ-Originating-IP: COBzNePZhwIpXoBfs/bCvY7aRKmMMGtpLegvX3mcOlI=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Dec 2025 18:31:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5684403937810610960
EX-QQ-RecipientCnt: 11
Date: Sun, 28 Dec 2025 18:31:14 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
Message-ID: <86E3DC2399D2C68D+aVEG8iEgR4iSn5Vw@troy-wujie14pro-arch>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
 <fnyar6fvzqr3dw33wv6abg3plmj5p2tr75a45zmyrb765fmrm2@gkw7mupx4wdw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fnyar6fvzqr3dw33wv6abg3plmj5p2tr75a45zmyrb765fmrm2@gkw7mupx4wdw>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M0/UNHhZ6hMGkPFKdgToen6Vp6uEWmWe7Yh5Q0GxBZbIqdgtL8bTjmI3
	ALEflv97CWuNb3vLuaxhCQADM7biZX/QZGQ7I57u5s9ITXRrcd8nno8onIYVhrfeMhFIjeB
	1PpREx3oL3PJ5mXtknlI9Vutt79oCorVpjdIkPsD1Bu4KNmPYOesHRb0Mo8sj4lcgh0I2CA
	GzCwae1HIBa6qWq28fkwkt9IN1T1EUkEUaUADBli+wNnpjdvTFrzE7sf7ZiS8Va2cG8C9Sd
	LMvHPQDAA8WKfNQq+tzMlxATzYDrKn/Ryf/LcdH54sU+gQvngeEXgHGg7ZH4qJmTpJWn5J/
	SYWvtiBcl6D2LEz07wFUiQ6VU5LBs8qtFEuOQJOBhVtPGmDaLi5CQ/1gxPxELtPDcRDVR7x
	FFhy5dLGZAIiTfOMFSI/nc/nNj44SO9e/U3TnxoyloC0+wO4aFKtlJzYK3CQe+B8V4zW3Ts
	NMNYkvXWKTSkPwdP4FBQfm+nRGuNC7Rb51pWSEmrF7JvkaJW8y9Xu0FwnPjfqCJK631CJqI
	BKQ5A71KYWG8H//tDwY8IaVrS+ed/1pqha9SXbqiN+sVF/K1ExWHZwvWOX/v7LQnmFMR1Y3
	4EYD2N0EzPE26cee27WllYfAWAFHNnxe72I/zyBQM/TMa1+PxJTpmR9PT1A0d+ySDgnAFNk
	DqcsC46YN1aMugwMIziL1atSXQMYxvqBzIdryDM+C+RphInC0PNwryrs6djNu+kLM45/YvX
	bSvW1sxYafmeip1EjshhJVxZhGxizabCK9xD/4D8AFLSP9/P2aER1jBVg6PmDX748Ba5yEs
	soRHnuXATCgoIpCLdVBpbMg7Ly6pOTN5RrG+W7qy3Ss1VRGrLdvN2l2gizcMixFpOyYgpK5
	Ud4HiCVDp+c6mNGB5qtn9h1GYZYDXaw+L3B6FmZn/GbFcMFd4J5CBWGBCVnBNPHHD9H97ve
	NotasFXtcd7uXscpRqhlejOmPBTzcoO5cdtIGmbVspz6WznE4zldfeaTns8yHmjjV8ohyKP
	vJBYBCvoK6Ay32cidlnyixh5f6NDFHzN+5RdgHS26WNVW2XyCt
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Sat, Dec 27, 2025 at 08:45:31PM +0100, Andi Shyti wrote:
> Hi Troy,
> 
> On Fri, Dec 26, 2025 at 11:31:10AM +0800, Troy Mitchell wrote:
> > The upcoming PIO support requires a wait_pio_xfer() helper, which is
> > invoked from xfer_msg().
> > 
> > Since wait_pio_xfer() depends on err_check(), move the definition of
> > xfer_msg() after err_check() to avoid a forward declaration of
> > err_check().
> 
> on the subject, this is clearly an i2c_xfer_msg move, not a
> replace, right?
Yes.
> 
> (if no v6 is coming, there is no need to resend for this, it can
> be fixed before merging).
Thanks! 

                                  - Troy

