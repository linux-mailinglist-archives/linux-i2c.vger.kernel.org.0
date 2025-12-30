Return-Path: <linux-i2c+bounces-14879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DBCE9E65
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19E353020CF1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384E3272E7C;
	Tue, 30 Dec 2025 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="cbOUUfDX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36751A2545;
	Tue, 30 Dec 2025 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104153; cv=none; b=dLrOLBQAcl/cgZQqt6wzySbg/jXHUzt4q+JAcu/DJPReuX/0vzj5Xav21tWAhag526byNdU1xGvsLV7rwHPPdM9EuNWCDaGzNnmRawvvD9CA6iIyvfh0PGCftoM6NvSWwM+t5n1ctHyxG/HJi1GrB4B8klWpCl9iwKwYhX5WMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104153; c=relaxed/simple;
	bh=CDzYuIbNAIJpAc6AJOA6ruM0uocG/RQE2Z3gqRb4bpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/lvau+Ifo2wMpDVKmEoggA73hhpqV56ydGn35aolncDPsl0VznLSZDrQHSMjQt8nwlzXewjd61Hnaik9SztE0uI20HFC5VtVrH11kXteKzaTUBDnZpjJ+ycrp7NVX6RK1idj6EiItcJh80f3gxQqs5D0qeiy4Yp81G6oWGTFag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=cbOUUfDX; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767104065;
	bh=1pQBCqn047ZruREzSayv9H++iam7PU96IzaK6pwXNeA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cbOUUfDXrpiGqcH1IX4PkqJZeiqZAePxqvgGhDoy9Lsj7mv09Nm+jcwKBVNi4IWPN
	 v1YbGDkDc6TyJ340eyApLTxeyM4tNoe1xIcw/T1Zx/FpjNQ129MHl1l4DARytvCtIi
	 86pIiZY6hieD5H6D1EVPHoE5GRzfv/W95+Bkb2iA=
X-QQ-mid: zesmtpip4t1767104063t07d72edb
X-QQ-Originating-IP: TH1lW9wnYGtTWgVF3zf4Kc6QxAMURlVUrjY62XcUYSE=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Dec 2025 22:14:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18075355756355605530
EX-QQ-RecipientCnt: 19
Date: Tue, 30 Dec 2025 22:14:21 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <guodong@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <97163966BA7F4D3A+aVPePaJvByddfCe3@troy-wujie14pro-arch>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
 <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
 <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
 <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
 <541066FE3973E490+aVPdhNKK70qltaVV@troy-wujie14pro-arch>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <541066FE3973E490+aVPdhNKK70qltaVV@troy-wujie14pro-arch>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEuRTizDJZiQfRQxIN226YVfFJd9jYsNJnrgvfyvCzoKtNKaiSdOxWP2
	Dmw6gbWM1ekdFHWihQv62NKKSLgpFGo3vU8JsXpsel/tFk4FAmvJU8rR0Iq+ONr9NTIrbNY
	PExVQM9eY2NW8QRtlQJVB/lLlrsQu6iHQ4Av4m8zg4QbUv3SU7EUy3BB/dUOT0LyBziI2VV
	0GkeqYhR5JLIJhTjTsCpxW5HZeVdOIcnDseHz5165s8upUMT/xOIuBfAC2+94F+CCbKqJIZ
	4CjaOHAJZzAI6f+Q0Mms3rWL4hQ3ino+BVPEpk3TL6Tq0VOlNfFzVpHXw8vh40eUD9bHlZc
	cbSaVALCOF2jEteVSodadQBHoGBqZZ8nui0iw+EeWewRLjbImA+dMUmSMJt+nXvnwyWFSCo
	82sq7B/WEDMHwHQ7TptrzZfl8V5YAtwHfJJD+s9+AxrdV9/6XMDUkFZqHJFmUZSc3cdV38v
	XWpi2YlK3gRyBDr2z6Q1ov81peeDo7dfc6j1dzwViDW05XzQyYAZbfTE7tXQDT3803FoDsk
	AMB6FHdxcUlGhj2+aQU2IE/b5fPzm+q0LEnr+psFWw0bkmdOFHrV+Cf7i3kezglS9gIm/on
	M6YDZz5m9vR4SLVOo5xEctJWpjkdGrHq7DwN6wYSm0UwjAyS7lSPaSRTxHCE/+tMK9crNaQ
	Y+QkconvuZAP6O/8hQfG7UPJ0yYbb6PoGUEwzTq8GBkZBKXb3hxnsJBlLN+wm8pLZdsZ7gP
	YE6itWiC8aS1DUvm9Fr9lHNagHbjWLs9EZkV74zOKVfbc/V+Hh+QB1hPdmz6mkJHNaI0pzj
	oouUNRJOgeXqlKVwGN/H7wooePKSAfBPZ3QbhJL3p5zOz0DHS0nCuyQWrVOx/1qvjPv/v+N
	2mF3PPSuhcXg7/lPfrrHTdHViv9wRZAUKMONc5TJTg0jUQEJAqqvNtaso9h/gjevZqJrG97
	JUvsOmBSM5gcJzbcdWR4s3lL2nXYSxi0xxyY+GdzX8mD4uk6SstuNDM13ynYare3dya4t0F
	al6GcgWz3pqJMpkwjkPg/74PU9aHJ5Rk7uUjIon9pD1Jaeq7ANJSvwrmnNBzgD6PI2NvH16
	tGe85MKHekK4BPIl7rri8B34N5cg8bCo2Ol69QWLihz2j2XK5PHBjI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Tue, Dec 30, 2025 at 10:11:16PM +0800, Troy Mitchell wrote:
> On Sun, Dec 28, 2025 at 08:42:47AM +0800, Guodong Xu wrote:
> > Hi, Andi
> > 
> > On Sun, Dec 28, 2025 at 3:26 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > >
> > > Hi Guodong,
> > >
> > > On Fri, Dec 26, 2025 at 07:38:22AM +0800, Guodong Xu wrote:
> > > > On Fri, Dec 26, 2025 at 5:01 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > > > > +     rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> > > > > > +     if (IS_ERR(rst))
> > > > > > +             return dev_err_probe(dev, PTR_ERR(rst),
> > > > > > +                                  "failed to acquire deasserted reset\n");
> > > > >
> > > > > If this is optional, why are we returning with error?
> > > > >
> > > >
> > > > According to include/linux/reset.h, if the requested reset is not
> > > > specified in the device tree, this function returns NULL instead of
> > > > an error. Therefore, IS_ERR(rst) will only be true for actual
> > > > errors (e.g probe deferral).
> > >
> > > And this is quite obvious, but you haven't answered my qestion.
> > >
> > > Why do we care of internal failures in reset? If reset fails on
> > > an optional reset control function why should we kill our driver?
> > 
> > Thanks for the clarification. I see your point now.
> > 
> > My reasoning is that if the resets property is explicitly listed in the
> > Device Tree, the driver must respect it.
Sorry, I misread your comment. I thought you were referring to the
bindings. In that case, we are on the same page.

                                    - Troy
> It's not required.
> 
> >
> > If the property is present but
> > we encounter an error (like -EPROBE_DEFER), ignoring that failure could
> > put the hardware in an undefined or dirty state.
> Then why it's optional?
> 
> The real reason:
> "Optional" here means the reset line is allowed to be absent from the
> Device Tree. It does not mean we can ignore the failure when it is
> defined in the DT but fails to be acquired.
> 
> If devm_reset_control_get_optional_* returns an error (e.g.,
> -EPROBE_DEFER), it indicates the hardware description expects a reset
> control, but the system is not yet ready to provide it. Ignoring this
> error would break the probe deferral mechanism and potentially cause the
> driver to access hardware in an invalid state.
> 
>                           - Troy

