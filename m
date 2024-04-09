Return-Path: <linux-i2c+bounces-2846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 411ED89E151
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 19:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8857BB258BB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 17:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647B0155A46;
	Tue,  9 Apr 2024 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcmC9XFN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04CD155397;
	Tue,  9 Apr 2024 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712682844; cv=none; b=bo6UstUyqhpeezNaWIQm0Wp77Wq9eakklgQYj06zY5E61MfitHMmLqjFq7dNXXNwiWxxtYKYjvGFGXDuC2GkpQtPxgvlcZK0u6HzB9VSr7sseX4xxNUORd8Wenn6GehwfR9gMDzrJZs9c5DgBDyXYD0MT/KfA1IZggfi84s5Siw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712682844; c=relaxed/simple;
	bh=LPEx6tsL7wgLYi+kk5vkpbbYiQkRmiIS+PLtSy0YjfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yqy98l8tOnyWAvP89YAN5nbNU6/RPN/PRInvhCJxj9fiqfg0dUX22fS2eQa3KjF1LamfNFyyDlkXp0C4WpnRwtyc2nSyqwub5kmA2n8vhSSR5wJjPyiD1lBaxH5FXti1to1ze4xSLHRdGKHuXLhEwUdobGGVyahXA6mVvJUukfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcmC9XFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC579C43330;
	Tue,  9 Apr 2024 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712682843;
	bh=LPEx6tsL7wgLYi+kk5vkpbbYiQkRmiIS+PLtSy0YjfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pcmC9XFN912RMvFMTBsOxs05rus3ioP7iQqJNazGrzDoiP7Ljc4Y9u/OFo2drMYc5
	 Y47oEgBi7UKRS5do5zUKwbtZ6obphKVWoEavPZT728bSAwtVk7J8TSsQZX4ZSa7DKv
	 hpFtmGvI8QwKr8MN2FMRQIJIRKkYD8x6LP5+Ja/yJW27JqneVDqXo/cNBtG96EGr+G
	 T2mQsRtFnusKVDFoDxcoM5aumg8aLfbIe3M865YcFvvVFW1WBeBZOTRWODvbam1aBD
	 yAl1wwAPpS2WSDZ6sYFOjTipL19UOEuq8sVy1JM2KysQHpLosxbKubCxvsHDf3sSbL
	 +uaHRk85y/R4A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso6787566e87.2;
        Tue, 09 Apr 2024 10:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGzY1zWuLSYCs+1xo743OhxbMPN5RQOSzwNAiHvmkzlBpweYvcLDGd7ZXIQtJPvHFEhFP/wLa3mooqYmzGx3nE+ptY0OsFsH1FJ/MJuNdcd5XejtSqwoKHWXnU98b8y3wQowID6aegWdRYTHgchWUfTIhlqMrWyRaNQtqTTail5WV9epIDIZt83p3mtGjmOOsn42PzBIMNF/g9G+sS80G73EsV/YYxq8yDfpgwQQa9tJrHRESHOJzOrluDBxZyv1Es3yA5AfmS+O+vWatjzU/Y7S74yh5G5LzFRDCRp4tEypYV9LpR+adw16gs/Lc6DKPFOzPcgYxsqDNG8cMrva4X2y1VvlxdhD+P7Tiga41vOmLoKV9ZkJPYd4usdaSYNvZyzMzIgMSmI+kPauXSbgaPOrjS7GN+nsCrI1aCzaPgcNfFtCBfkz1gScl5f7ppd6qkZeqTF+VMk824UK+UXMUPmTIFY0TVuV9+ZRPM6taVbBmRg4WhfW7AQy5u
X-Gm-Message-State: AOJu0Yxe+jgjSgCNwm0uGuMhypskIFiKPv0wdyU9heYr3dxsGcXSkU45
	9uvrPveJfSRhTZaNVROUChiPBJc86eu/GrdJi1/VYsBmUobzNcL1nEbM9dIuM2KjtaKViXucikM
	GT3jdSbhdc4xkTnTjE/FHnQvxgw==
X-Google-Smtp-Source: AGHT+IHdmA/YWkORigJ39s8mUHP/Uw9g5JVSthQiryNaRNFp29Jw8Pu75u88BQ1j6apcee4IbBJ9bbXspK3Ch4S3xfA=
X-Received: by 2002:ac2:4acb:0:b0:515:99f6:2ca4 with SMTP id
 m11-20020ac24acb000000b0051599f62ca4mr50062lfp.36.1712682841868; Tue, 09 Apr
 2024 10:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com> <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
In-Reply-To: <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Apr 2024 12:13:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Message-ID: <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] Introduce STM32 Firewall framework
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>, Oleksii_Moisieiev@epam.com, 
	gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, davem@davemloft.net, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, 
	jic23@kernel.org, olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
	mchehab@kernel.org, fabrice.gasnier@foss.st.com, andi.shyti@kernel.org, 
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org, 
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com, 
	lars@metafoo.de, rcsekar@samsung.com, wg@grandegger.com, mkl@pengutronix.de, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 3:44=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Gatien,
>
> On 1/5/24 14:03, Gatien Chevallier wrote:
> > Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
> > platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
> > register to the framework to offer firewall services such as access
> > granting.
> >
> > This series of patches is a new approach on the previous STM32 system
> > bus, history is available here:
> > https://lore.kernel.org/lkml/20230127164040.1047583/
> >
> > The need for such framework arises from the fact that there are now
> > multiple hardware firewalls implemented across multiple products.
> > Drivers are shared between different products, using the same code.
> > When it comes to firewalls, the purpose mostly stays the same: Protect
> > hardware resources. But the implementation differs, and there are
> > multiple types of firewalls: peripheral, memory, ...
> >
> > Some hardware firewall controllers such as the RIFSC implemented on
> > STM32MP2x platforms may require to take ownership of a resource before
> > being able to use it, hence the requirement for firewall services to
> > take/release the ownership of such resources.
> >
> > On the other hand, hardware firewall configurations are becoming
> > more and more complex. These mecanisms prevent platform crashes
> > or other firewall-related incoveniences by denying access to some
> > resources.
> >
> > The stm32 firewall framework offers an API that is defined in
> > firewall controllers drivers to best fit the specificity of each
> > firewall.
> >
> > For every peripherals protected by either the ETZPC or the RIFSC, the
> > firewall framework checks the firewall controlelr registers to see if
> > the peripheral's access is granted to the Linux kernel. If not, the
> > peripheral is configured as secure, the node is marked populated,
> > so that the driver is not probed for that device.
> >
> > The firewall framework relies on the access-controller device tree
> > binding. It is used by peripherals to reference a domain access
> > controller. In this case a firewall controller. The bus uses the ID
> > referenced by the access-controller property to know where to look
> > in the firewall to get the security configuration for the peripheral.
> > This allows a device tree description rather than a hardcoded periphera=
l
> > table in the bus driver.
> >
> > The STM32 ETZPC device is responsible for filtering accesses based on
> > security level, or co-processor isolation for any resource connected
> > to it.
> >
> > The RIFSC is responsible for filtering accesses based on Compartment
> > ID / security level / privilege level for any resource connected to
> > it.
> >
> > STM32MP13/15/25 SoC device tree files are updated in this series to
> > implement this mecanism.
> >
>
> ...
>
> After minor cosmetic fixes, series applied on stm32-next.
> Seen with Arnd: it will be part on my next PR and will come through
> arm-soc tree.

And there's some new warnings in next with it:

      1  venc@480e0000: 'access-controllers' does not match any of the
regexes: 'pinctrl-[0-9]+'
      1  vdec@480d0000: 'access-controllers' does not match any of the
regexes: 'pinctrl-[0-9]+'

Rob

