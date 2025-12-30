Return-Path: <linux-i2c+bounces-14877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB6CE9E50
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26CA4302E154
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 14:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBD72356BA;
	Tue, 30 Dec 2025 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ShnyEpOD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F0230BEC;
	Tue, 30 Dec 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103981; cv=none; b=qoQWin0egYw5DhSXtm7ZpKoP0xvCCZak4KcIjVl5EusYBN1EHaqWM7ypyuRs7wy4JM6Vhs667CwnUCLHBoqFzxZX6eowelseo5KAJLAebUjF5TY0zn8ej2MSjc9Kpo1QTM+8AJRyFJ+pWrvmeChl+7G0flO8erEzr28ID36kuEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103981; c=relaxed/simple;
	bh=ZCrfW3diL3UVB1Z6PpdpZXyMJbQP00JZRoqAWDHxudw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGI7zHWJyvFtd7POHkktS2XQEQiZCwc3FXUT5dgvjp/pAap0mz4iCcvX87hpwoYUzjPRWBAxHiiyDDcMPwk8Yr+PeXSCoDi9Arc5W82UGaTx0f7qJhPuj8tsOIC56yKF3Lwkj5UcoyWtADEjlhvg3nkbVedvFLd2TQQGMw6QBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ShnyEpOD; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767103880;
	bh=HGcM/4CGiCg5j1GuuOjB4A3W1LbzH42pGnBqQOzGYas=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ShnyEpODwop694fgDxtILKWs4zmbdLHuNzk+x/a5i4ol3owp9kuA01xMir6Q+w6yp
	 Qtsmn6A9eJDVgmcrTjm3zncMCtEnosCXXzLwETPPT6xEHTsKLtMBE7ZcBFywU4QRbp
	 R3j0fmzzKBS1h/19AB81B+O5Rb04uNa6MKhkhqUA=
X-QQ-mid: zesmtpip4t1767103878t2e71f83a
X-QQ-Originating-IP: aRra+fta2Rh/1Rh/TuAarSVo2Eo0tTTTZHbS8NjGWpY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Dec 2025 22:11:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12681321409791623687
EX-QQ-RecipientCnt: 19
Date: Tue, 30 Dec 2025 22:11:16 +0800
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
Message-ID: <541066FE3973E490+aVPdhNKK70qltaVV@troy-wujie14pro-arch>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
 <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
 <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
 <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NUTz4BkILuKLfPgngVy2VbSwqKFERblinWpytd78pVsafI+Y7EQFZAVv
	IKnumd+i4592ZOf8feHQuLzd+dmKjyO1UxGtvg69KkbufDgZkOSj1WnKLykMZ0PA75lE7OH
	nN2ZsyjqQxgduF17crVSHfqnt76Zbi5dUTHdUHk0Dk/RD8ntGlsa2zC4C6//fa5yMvzkGxU
	+P9HI0o83Vpb6/DMzVcVUjl1jLXqMY5c2wVfahjZZHt4KUCx73Wkj14V9SMvArzdL7dEX9k
	3QBiQqL/cJeT9Ocr6pKbKVr2B4VGzW0v6YjKLaBONQr8dTLLXoPnfLMgTm1AQaRTCXP0YEm
	0VfbuTmKAk1WwNdrS7AgmH+5gWWUk0VRNmEXeRuEW+5l+qp1uKwOIXeVRICMVfMGM2xUJYA
	3bbuP9lmHUtw1yswDtsNk1SfLv8GWzQk2SOOVVyP4rzQgNsojQxjVaIYUFw0Yatuzmv6sf9
	oDWIp9iHB9a6ha9hliHyNN7zXEzKM3WApDkTVCwQqIEkTmvOKjThysUNv6ckY5vZB7VBhNL
	BXYP7QD2pBQ/1SVcUnyp+O5HApl7gwOqNomLtS7UGNAHJUIzu3hd/ajchoRVoc/IUq5zqDm
	d33cuK8ahMIuynaQ48S6ZY/8OHlJvMPj8lAIAUhN/kMNVez6cBIYqIz78e7saFoA49Wenv9
	Uw0/R+Yre34DLvW/hzewT9vqYqm2p3wzWmlf+q5SiTnAzmdOX3ZEFjYS8vpK7CLUJncoJX5
	T6xY2oWJ6kPd6dFf+VNfI3X6GZmM8LTYC9tuh1hwR+YWQCHqXUZWPsgx1t33strwymPZiCy
	7mZN9ITu07hqAGOG+ejQu8tN8vQQLdm5fVWHwMRQNgMH4BBoVqXfq1n/hwu+00dL3SzLm9W
	5ETg1GcnLtbmqmukSE8i7msN4izjztvUe3hHnKKBI2yLYe3dI12AoH128ASS5+FZhahMw4o
	GA+pgSHOblbg1W+8oA8I2mljIwVveA0CwA8Sq638nBbZWV0AZcSNV+mYDc7p0w5GLeGW4p9
	ThWI5h9xKgVcWR6i598G7P4q4cm0klmLC3F+3VoUFog7aPQF+IIDbk4/r03vZTzQrjocs1j
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Sun, Dec 28, 2025 at 08:42:47AM +0800, Guodong Xu wrote:
> Hi, Andi
> 
> On Sun, Dec 28, 2025 at 3:26 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Guodong,
> >
> > On Fri, Dec 26, 2025 at 07:38:22AM +0800, Guodong Xu wrote:
> > > On Fri, Dec 26, 2025 at 5:01 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > > > +     rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> > > > > +     if (IS_ERR(rst))
> > > > > +             return dev_err_probe(dev, PTR_ERR(rst),
> > > > > +                                  "failed to acquire deasserted reset\n");
> > > >
> > > > If this is optional, why are we returning with error?
> > > >
> > >
> > > According to include/linux/reset.h, if the requested reset is not
> > > specified in the device tree, this function returns NULL instead of
> > > an error. Therefore, IS_ERR(rst) will only be true for actual
> > > errors (e.g probe deferral).
> >
> > And this is quite obvious, but you haven't answered my qestion.
> >
> > Why do we care of internal failures in reset? If reset fails on
> > an optional reset control function why should we kill our driver?
> 
> Thanks for the clarification. I see your point now.
> 
> My reasoning is that if the resets property is explicitly listed in the
> Device Tree, the driver must respect it.
It's not required.

>
> If the property is present but
> we encounter an error (like -EPROBE_DEFER), ignoring that failure could
> put the hardware in an undefined or dirty state.
Then why it's optional?

The real reason:
"Optional" here means the reset line is allowed to be absent from the
Device Tree. It does not mean we can ignore the failure when it is
defined in the DT but fails to be acquired.

If devm_reset_control_get_optional_* returns an error (e.g.,
-EPROBE_DEFER), it indicates the hardware description expects a reset
control, but the system is not yet ready to provide it. Ignoring this
error would break the probe deferral mechanism and potentially cause the
driver to access hardware in an invalid state.

                          - Troy

