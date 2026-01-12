Return-Path: <linux-i2c+bounces-15029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E79A7D10488
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 02:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7C6D30230DA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 01:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6CE22A7F9;
	Mon, 12 Jan 2026 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ljS1iWNy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B46B672
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 01:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182711; cv=none; b=W2LVPVIP0wvfRbLbOA8ls5OgZLLgKLE+YXSR6yk92ywY3v2dC6X/R6cgxuZtCqNe37eqsouXuG3vdpl85UDyb6FkHZD2rjFn2QTYPcvxEcHkqdcwrec6qpHuQ0e7HOoq/RHeGNJFum79qcoOYGw/409xdv+8t7dC0fk9B6nOnbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182711; c=relaxed/simple;
	bh=ojSmuF3bZThAalVPD7IUaTZ+sCk8cbn5RsgGUwN9KTc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=skJIXWnIyH7MbwzCN0J4T6QdDX0rK/IRRAstxmv1SBTkVj6RWWOmdLBEC4KUm6YCWCQoGuNLeFViv5BI52tWobmNFgA/KazsQ9t8Q2Hz9ZxhTQrplEA1z9QtjyJXfPRh5Tv1TuYicRlngot55BfzzJC7E2sf6dbfaYWIWzgJq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ljS1iWNy; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768182609;
	bh=vXgizy4wIkS+ntIQMrsglm/OU4vxbvEgmvJk8CbngJo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ljS1iWNyyDP7Izbtve5uuShlNoMFo+GAVtivObDIdHgOrEB+IDuMnhbK4tzroiNeQ
	 M4fyUn6pyPDqBsCx1m8dQOmVO/DsVSxNgb7fRCUSJvcMj9pkidm+DyFkbCWEIVQM6U
	 ayzcO9Z/nz06f+i5CcC0osniPle4r6NqMnNvlArU=
X-QQ-mid: zesmtpgz7t1768182601td230d057
X-QQ-Originating-IP: d/IJDIFXP7NV4/kPf6kV6P2D6IG5d8UiUn9KgZOiZR8=
Received: from = ( [183.48.247.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 09:49:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 52625910496199400
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 09:49:59 +0800
Message-Id: <DFM8F4B9RK3A.1RG65AV3UCWC6@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Lee Jones"
 <lee@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-i2c@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alex Elder" <elder@riscstar.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
 <20260109223627b566d2b0@mail.local>
 <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
In-Reply-To: <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McnXz9EssJMzD/tsDuf0SJgGVRu2/Sr5Aev4csbGYmINtatJRn/yTKTL
	cNkXWVDoFueM4TVfh6PAh9T6B7H2BcO/zhEpGHhDcfaE1XAhW0FDBTh13hBCjvxs+t5+KAe
	eghkzXOqqygdwRlmrrv0IoxuB8PCCjG/8s2PytbvUURTSgZxKy4+ZbK+3UnfZ/FuFn/Bc9s
	mquaP6DzSwUmIyT50OlBMd2+AY9kMbrUVl39DrV18HyppEHDeo2tkb8lCiCmNDO/KhzVLXg
	tLb6lqDRSHJLcESE7kfdMqy9tdICtzSdbUEfanF1fLxCf9cQEeqLkDSHYiKeRIoR2zPWUYa
	N+nW946yuS9j20kkzFJ1PbMzRWt+cjF7X5ZhKwLgh1qei9lD7N+JfiBYbe5oL2GXnBBpZgN
	bJQGUDlviHccrlwUGEl8UfhQeKPeMXMic6rUXND3gQWg+DYsmA/PwesKJ5Gs28jLGApipDq
	Sgky0qOtYPX8n6zPHJIEPfdLLUjQOxWEvl9qYgwqm7SdGZaS2yuOKMwv7ttz5e8i4hvh5mL
	tFpiHt0fO3CRNVbxWVK2ipBcwWR0n0MBwwe34zVS+8YyG9So2trXap9x0VOC/Gdck4SbMIF
	EEyWF/I3XwFDJaq8Fst4EIdwGGNPF18e7b/T3XaqP2SDW6wgIqGSz5pkhfj/a9fFc8xfgDV
	R16I2uTxtWjAq+2grfpo3NUWV8JKwSnRGd9b53A6JAKarIZP3gf1jYUkRD3AgTbfhuv3/i3
	QNTnyLOdN6QHYabGhjl9B8htdsaToruu2dw+FUtyAXJedW/iVbjD0q3N4nPRtSeLlWJql3S
	QcJQorXvyFcnM87Qn6HoinDI6+zCLLE26YjvWB9jCtLhTD69KpiB6PN3HWaxEVmFXbCk1na
	3bwCq2vtdLkfDwc6v6WJNNthmXlWND9GA42FUK/8tXYfW7UTbyXoiuzDwHFt9tOeOlIWccR
	0q/5qztWVjHZIJ0wdpwbWaN/UZgUz1zFArlZ9mTvuzPSQ3rOS7Y9qsrpcVy/DLoZs2TcQog
	tt9ArqhXhN2PFyhNOREtOhapGnp4lR3eQjmObhF3AvYBkwLbU5B0mrK0QFRL4=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Mon Jan 12, 2026 at 3:55 AM CST, Alex Elder wrote:
> On 1/9/26 4:36 PM, Alexandre Belloni wrote:
>>> The purpose is to make the driver a module (not built-in)
>>> when "defconfig" is used (without the need for any Kconfig
>>> fragments to unselect things).
>>>
>>>
>>> In arch/riscv/configs/defconfig, we have this:
>>>      CONFIG_ARCH_SPACEMIT=3Dy
>>>
>>> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
>>> (added by patch 2 in this series):
>>>      config MFD_SPACEMIT_P1
>>> 	default m if ARCH_SPACEMIT
>>>
>>> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
>>> to benefit non-SpacemiT RISC-V platforms.
>>>
>>> This patch is trying to do the same thing for the RTC,
>>> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
>>> by default.
>>>
>>> I think you understand.
>> I'm sorry, I must be dumb but I don't understand. The current behaviour
>
> I think I'm the dumb one.  I think I finally understand your
> point.
>
>> is that when MFD_SPACEMIT_P1 is m, then the default value for
>> RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
>> (MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
>> the default of RTC_DRV_SPACEMIT_P1.
>
> Your point is that patch has no real effect, at least not
> on the scenario I was talking about.
>
> I.e., I was saying this mattered for using defconfig alone.
> But, as you point out, using defconfig alone gives us:
>
>    ARCH_SPACMIT=3Dy	(in defconfig)
>    MFD_SPACEMIT_P1=3Dm	(from patch 2)
>
> And then, *without* this patch:
>    RTC_DRV_SPACEMIT_P1=3DMFD_SPACEMIT_P1
> meaning
>    RTC_DRV_SPACEMIT_P1=3Dm
>
> And therefore there's no need for this patch to set the
> default to m rather than MFD_SPACEMIT_P1.
>
Thanks Alex and Alexandre for the clarification. You're absolutely right -=
=20
the patch is indeed redundant since RTC_DRV_SPACEMIT_P1 already inherits=20
the correct default value (m) through its dependency on MFD_SPACEMIT_P1.

I'll drop this patch in the next version and review the rest of the series
for similar unnecessary default overrides.

                                          - Troy
>
>
>> The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
>> correct one and the proper fix is then patch 2.
>
> Yes, now I understand.  I'm sorry about my confusion.
>
> 					-Alex


