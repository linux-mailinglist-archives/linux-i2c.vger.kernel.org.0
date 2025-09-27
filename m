Return-Path: <linux-i2c+bounces-13242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A822BA5DAE
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A20CF17830F
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89BE2D9493;
	Sat, 27 Sep 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="hZIbkHm1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84191F91D6;
	Sat, 27 Sep 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968738; cv=none; b=kPZtnzTPUtSzL94QtoHQfgldv09gEFzu7qDvd5+Ok3MPN1XknWvpLjzR237eJY4SnKTxS6vCF2vpaLNiQKnRxSzYHKUY0Fyrl8SjXwKd8BR6lgewGE2uO/0/Vl0nhj6+1IpPSuQ1ywP/YcuQ8eHJY0EyrIvcZ92Whu4cxmu6Cic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968738; c=relaxed/simple;
	bh=CNoMXfWgLcGJvfa77hW6zkuKjvN+uN7hAOsHWEF2+1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICmPKJe9UYIVtOoRly4FQMw6ioAXq/HCky+f6nK+ZJhLdemdqTakouy6LngwdRcrYOb4CgfHHjp+LlHv1F+5CClbljuVVKJEKFEA8TOOvtXIjf8bnVf+MOJDT/WP9/Zn7qs+jNBDiY6hDgiwNyREN++S5YHLBm/iK1X13zBb694=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=hZIbkHm1; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758968654;
	bh=8gQ1btfcS9lR4xyhO4eNmmxoMM9MV//3rCHOmLGPOus=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=hZIbkHm10wA9hp7X5Q3PdaFA7mnSA2gAlv2sQC9GwILeCZYty5KPZuqkiuXOSkruv
	 mJFu1L+VnSV2uMkA6rLp2vOIuRIj11P7pzf3pYLpuICFM6CmFCjSNrP7SRJlp775oN
	 t3TvaIiNiWY9OkE+24tcPtYSwdep/sPfx+tzsgUA=
X-QQ-mid: zesmtpip2t1758968646t6adf6663
X-QQ-Originating-IP: /kIp1FpEbrRs/kHZGWmafReKwU4afgvz1uRmtyEjXAs=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 18:24:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11619624960712165615
EX-QQ-RecipientCnt: 9
Date: Sat, 27 Sep 2025 18:24:05 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <64AD69A1C43D8A13+aNe7RUmS73q-jSBk@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927014547-GYA1336612@gentoo.org>
 <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
 <20250927101648-GYA1338789@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250927101648-GYA1338789@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NojR6Ao/DkEDWzK408R5Uhp1H+tIhTv87PPDP6mL828IdsNJnBLVf/I1
	zz4yTnVuKMmB1sWnG2yqMNIDSXhtAkdPlmzt5fJcLc6VlRoMFI61Hi66RDl4KJq9e1Cp+NL
	dm/ATz/KkYq+r74Kvvf0d2zgaxswyBiOlQvRKNTMlK9TQFqPp/LbjcNMxrTb4UpNfrYEGiB
	evPqt+SrBBKk2ih69WQoefWMAHfVorp/X8on7/FjcCQyI3QZk1FUO0/E93TfyGnB94au0gy
	q7itSI3RsvmsbRQp26C6kJmXLfp2/0MlVklYdohZbKv+WmnSZrqQU5dIL8APY4WsKkufxzS
	eY6g7+jOgjLmw3+laHqFBudppVKId08482oADUPF8udZx+wmUPTMHhhjpvCs64dV+jmdfAC
	4rC47Wp/Ne+JDYZSVLXnuvPnkcwm14KrTsSJOaKXNdkSD8Xg52CS5ipIwvhzBmvaFEbW8ar
	SPIF/w30f78e34wgeMnFAKzg2GMlhLQLZyqZD+s7cjnhhEKTUCiKbsd6pxkO6mSf+L9ab+M
	A4zQ8WXkVdEJCY2T918HFmhtqkTfknIE4ldUG3qMfaMHcA6S95PxEm0BPzzo6iGad4WHa33
	ruG6h27g85NOsN7Rupni7kxHw3nDAEMXbN11djy5JtNIaFoTQc7doeSD63unhlUEzcXlT18
	SSy9vH2zB19P07DBg09qprxCAnfxPdd5U2354f3TOfgnBRN4yz3iWZJCDJiJzAF0VgbMDeG
	jcYYSbZmISudzZEWGBXdnyDMRaz+pqN2dWgKEQ1/OD4rqRfLTzYT9AoKG/spY+EFThTgXfg
	lXjo1DDt8q9f5Qe9qcorEVLKYj+QtXMV/gAnSjRx6ISvuYGRMcNeOwtZ6s+WewqJhNLuylf
	jAdTuxgMdJ0pRyfIWOkg2YrWon/U5r6oFhq2QcWFzXIYaBMlixELHM3QjdqTHwC0k+PP3/g
	0igcT3lY8xw/mmokt3YybYz1IUvEKqtEFXlFDDh87l0LvBeSebFxwkjxr3LXjsjYxftGnHy
	jav+asMQAA+FYFZVpcQQw5ebjKzD7JX4DCi8caYBhENsbv7TcQ7rqwguD/EErx1XJ6JANiG
	g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Sat, Sep 27, 2025 at 06:16:48PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 12:04 Sat 27 Sep     , Troy Mitchell wrote:
> > On Sat, Sep 27, 2025 at 09:45:47AM +0800, Yixun Lan wrote:
> > > Hi Troy,
> > > 
> > > On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > > enabling the use of I2C with interrupts disabled.
> > > I feel it's more proper to say
> > > s/with interrupts disabled/in atomic context/
> > Good point.
> > 
> > > 
> > > I've noticed that K1 I2C controller support three different transmission mode:
> > >  non-fifo, fifo mode, dma mode
> > > 
> > > while you are trying to implement pio support, I'd suggest to think one
> > > further step in the long run - support more fifo/dma + normal/atomic features,
> > I understand your concern, but I have reviewed the code structure,
> > and adding FIFO support would not significantly affect the current PIO implementation.
> we will see..
> 
> > 
> > > 
> > > Personally, I'd like to see fifo mode implemented before adding pio
> > > support, as it will bring quite significant code changes, require heavy
> > > code review effort. And yes, this will put more demanding work on your side
> > > and may slow things a bit..
> > That said, we don’t have any plans to support FIFO at this point,
> > and PIO functionality is something we need urgently.
> > So I will continue to push this patch (tomorrow).
> please do not flush the mailing list and give people some time, I haven't seen 
> enough reviews coming, please wait for ~one week before sending next version,
> or make sure you've accumulated enough changes..
Okay.. I will wait for more review

> 
> > Thanks for your understanding. For details on the code changes, please see above.
> > 
> > In addition, if anyone is interested in adding FIFO support, I’d be happy to help.
> > 
> do you want to push the work (support fifo mode) to community?
Personally, I want.
Since K3 is going to reuse the upstream driver,
PIO support has high priority (needed as P1, e.g. for shutdown and reboot).
FIFO support, is not considered a high priority at this point.

That's why I want to push PIO ASAP
Does this make sense?

                - Troy
> 
> -- 
> Yixun Lan (dlan)
> 

