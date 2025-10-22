Return-Path: <linux-i2c+bounces-13715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E22BF9A41
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 03:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB6E8349559
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 01:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A141EEA31;
	Wed, 22 Oct 2025 01:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="V0JH4R/4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B791A0712;
	Wed, 22 Oct 2025 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097776; cv=none; b=DkAGgsaPK0HRSzu7D/276/Lhi4Su+1bp4CipUzbFsuPTsCxIWhcZA8UmGnDZn8xK660LyZca9N+imf754u8ivaxdFPle0WRPL2xYO8MBWV38x866WXpYV6SyPB0GLRh8jtT50kgerThnRg+oDhcTuvtNJjiUPgimevPArIGDQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097776; c=relaxed/simple;
	bh=yI5/QQViHBfIHu2GLKaOLG3HaftNfSEfF0z4vSZaQNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQAm0cqI+sCXcIrArzD3F2mOKXk/cVjXkgooTaSc02kT0Lx6Wwi9Tk4asHgSgZWMGac/KwQc6MlhG6scMW2QtxvBgCQAy5vDRQzr348pLn/d/D10zct3iXsVH8qBpDTp4YZDRfDt291jT8f6fcjefu0jS5vjU3a5jOWgQZKLY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=V0JH4R/4; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761097692;
	bh=X7vhDG495g1PdZKo8SLtLFS6XGZDbpBLt2YVQRk/xzU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=V0JH4R/40gAcKh+inDPGZmYd64cPK9KggsL9RFO83woRgMyGLnX4Yb6W8qsj9Byco
	 mKRtA3Vg9+lu/95xHmjzEzGCnxyaA/75eFJO9daK33W2PA3PP0/Bs7lrsPmuwrEtVu
	 kl65k5yOZ+0xMf5U0fmphiiT7m8hCIQnLCzAM3eE=
X-QQ-mid: esmtpsz11t1761097685t6631861a
X-QQ-Originating-IP: XeCO6qz22dmz9Hct7O9nhli4miv2nRud+MoWQJbKTto=
Received: from = ( [14.123.255.147])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Oct 2025 09:48:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 87910848643870731
EX-QQ-RecipientCnt: 7
Date: Wed, 22 Oct 2025 09:48:04 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <748544ABF6A72D31+aPg31PBvHDkBALoa@kernel.org>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
 <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
 <sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NDtUtlvFer7ve2K//w09cAR88dsVH4wGZELugfbnvP/F/FT2vXAdwHKf
	Rr5Z8b4KfgRc9OHxuHdwnZwfKVfU/uGmbdfac+DQhysUbqMWj3/e0dkCtvUJdCbIitBszoV
	dVQar2Qniz5Dbo3ckPTZSumd3+/Dr+rJEueQBXTMgkD2Q2mKdKevG5C8UEvUQhjKwFRzoTy
	gqzJ+BDAkFcmCp+1Y3KJoKKZ6XafpCdcKmvvN9Decj5WhxD6BmnreKn+/I9+/TDzGXji4dM
	/tLvcSvv/oBmB6uhdCEjMQhahabXSWnaHJold3SMU9TXbirVR6b1r1xUgriUIQjIcVqi11o
	vKT0RTF7kkE3bBuykyw0TKSSk/+P0aOcztZth6UgjOpC36VC/uqXR3zshSWbdsL1HM2nHpO
	rlb5T+40gegKMISEs6rw5gjGs6gUTIx+RRc10ztgXALYFCjxGlGt8k7a+aiISYDSwQITrs/
	lvvPNH/qP89VsGSiZnT+/RCIW+0qM++UgN+0+bs+hXNT73fY8dYCXOueB6jaIod7Ln9z2LO
	fbofD1zt938vSvu8vvUEGK1iioWGco83rhR7e+GWisgcXhod+p1UtjHYXcw/hExzzWnJhy+
	/fIV/JsEak9s4mN31zn3snE6sVonv79B2VAtevz1/qrIBgfxxhBvrO4h49oCXBgZl2cCScc
	RO96nn/Poujn2hT6Uro1wcjNl6OW6nseguJ7/QnVfeXGmYZGI4aeybayFsLXLb2aoCrlvxO
	BmIZ3PvXAEhRe9iesn93SQZD8qm/aMBAFQ7FxybsAIxJ7ufhaax3aRioQjEOLOYdHu/7oXp
	KinojmAuy7kfZcMtWzSGc72AJSb29J06hkR3UnV1xFc/mcEJmUDK0vr4b7hnka2ZtQHdsqS
	YqX7bbTgcIb2MHD18fELke9G9rOccqSF1laE/l1KFlD7uZ65vyPCsvrKdwIZpKqiBwyJXNU
	c6Q3bCNCv66Vn1ZkUlgQtQQQfS9E77qY61+dIYJ1lyD9UUF6/7fCQ35h+Y2ft33/4FImR5i
	NH5852JbblGtvMUhInuJoV1giZRETcyKv4HJXf+ZdAPnw/rAmQ
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Hi Andi,
On Tue, Oct 21, 2025 at 06:03:34PM +0200, Andi Shyti wrote:
> Hi Troy,
> 
> On Mon, Oct 20, 2025 at 11:28:45AM +0200, Andi Shyti wrote:
> > On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> > > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > > master mode operations is determined by the ILCR (I2C Load Count Register).
> > > Previously, the driver relied on the hardware's reset default
> > > values for this register.
> > > 
> > > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > > frequencies lower than intended. For example, with the default
> > > 31.5 MHz input clock, these default settings result in an SCL
> > > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > > 
> > > This patch integrates the SCL frequency management into
> > > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > > which acts as a frequency divider for the SCL clock, is now registered
> > > as a managed clock (scl_clk) within the CCF.
> > > 
> > > This patch also cleans up unnecessary whitespace
> > > in the included header files.
> > > 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > 
> > merged to i2c/i2c-host.
> 
> I'm sorry, because of the report from LKP(*) I reverted your
> patch. I2C_K1 is selected by MFD_SPACEMIT_P1, so that we get the
> following warning:
> 
>   WARNING: unmet direct dependencies detected for I2C_K1
> 
> and compile I2C_K1 without COMMON_CLK. Please, fix it and
> resubmit the patch.
Yes, I noticed that too. The issue is introduced by PMIC driver(P1)
instead of I2C.
Should I resubmit this patch right after sending the fix,
or wait until the fix gets merged first?

                                - Troy
> 
> Thanks,
> Andi
> 
> (*) https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/
> 

