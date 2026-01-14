Return-Path: <linux-i2c+bounces-15158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E6ED1F159
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 14:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52BE13018960
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 13:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AF937F8AF;
	Wed, 14 Jan 2026 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae/SLp+z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADFC37F73F
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768397816; cv=none; b=gm5qZqEh69aShwCvI7Mg8grpAIv2rWKnyrky4UqUZrH0GEf0A2gX5kFNOtguuB6M2iSfELyIOnVz+r8z5FxJCdeN9jjXpXzWF57QeD+FBh31G+c3HFGtKUFM9h+gOROClGGHnPgRb4oXsjpGHcH8qATbVrySozPrlu5wWF+YrjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768397816; c=relaxed/simple;
	bh=iV2zIwFS7NHR+Qp/+VWDRZd4JeaS2I3vbQOZ53pHX20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWfrKEclWhyfXs6Q/jTnhrEEkNp8MoZJVoZ8ojTNeI2XNZRg8JzqX6AICpzZzK1qvnV/Eiv2gAWGt4Ao3JJTxGAcxA5JVlk+KWZM1qKxXV8g3YNPMdI92NxGNUPb/YMryq2gDgEEXhsgjqUQg/S1AZYoWx37Rv3MQ/GnqZQN1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae/SLp+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6F2C2BC87
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768397816;
	bh=iV2zIwFS7NHR+Qp/+VWDRZd4JeaS2I3vbQOZ53pHX20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ae/SLp+z8fcLXH7RjdXP5OAlh7q/HTebZf2fJPxbwc15QolLGGVph0dLQBokF4x/Y
	 xvDxihJvfZC0zAng2G6VQSKu2JeoFzWDcpO9YokI6i1QQeh5s4Eb4dzzJOtwGW9s2k
	 /dpDYtxCK2yJ5OPgbY23PqJe5iv+oNC9WIQXT1TxJzrF+q6fo5bGq6HG6A3VmBEuuF
	 tSdo5EXyexBqO5oiRGBarXJyHxVSCarKFySdMwlhkxU+PH5d10tzEnIZTBPtF8vYyJ
	 Q/aOQAakcB3L3QEMDUHSrY2cO+MNcBUDPPqpzSxhlgIIFZj5DOc6UYfEhv/fgQCVT3
	 Dwmt13t+b2lAQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b9fee282dso1204977e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 05:36:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxJvqci3F183P/o8v+G0x8tRm8f3K5Q+i+z7rqZoG+ZSfp/O5+IGyGe8RNdhZVjsBc4Ae5wEXYMeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUl6jIwPG29+4vQK1xpJPAT5m9Fafe7qqFrKOqK14mI3d7K5um
	/G60R+6p4qpLRy4KXtKX4OhtyZV1ejyjuegnK91k6y8B3NoKTaaaIpDD3Ig1E9mqr6wEugHZWTZ
	aaQe6mZOt5M7yD29oFy7RrZKA+uIOL4TFWxQucORqrQ==
X-Received: by 2002:a05:6512:3e10:b0:59b:70e7:4121 with SMTP id
 2adb3069b0e04-59ba174d90emr764517e87.36.1768397814581; Wed, 14 Jan 2026
 05:36:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 14:36:42 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
X-Gm-Features: AZwV_QiYLMexanAhF-BM1IfGaqguSnDiL1N1XOc2vJYCEMxqR8GZei0usNH3TDU
Message-ID: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>

FYI: I think the road-map will look something like this: v7.1 will get
new interfaces and most controllers under drivers/i2c/ converted as
this can be done within your tree exclusively. For v7.2 (with the new
interfaces upstream) we can think about converting all i2c controller
drivers treewide to the new helpers. Once v7.2-rc1 is tagged, I would
try to remove struct device from struct i2c_adapter locally and send
it to autobuilders for testing. If that goes well, we could create
struct i2c_adapter_private or something like this and store its
address in struct i2c_adapter. This new struct would be controlled by
i2c core and contain struct device. With that out of the way, for v7.4
we could think about adding SRCU into the mix (possibly using the
then-available revocable).

If all goes well, we should be done in early 2027. :)

Bartosz

