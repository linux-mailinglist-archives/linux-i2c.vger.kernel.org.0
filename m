Return-Path: <linux-i2c+bounces-937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B453981C0AD
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 23:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7127E288483
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 22:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57BD77F15;
	Thu, 21 Dec 2023 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2O8QXVK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF058224;
	Thu, 21 Dec 2023 22:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B2EC433C8;
	Thu, 21 Dec 2023 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703196075;
	bh=Mu966ENzqAzL5zVpXkX0okIrHoGjPvhJ8rqTFtXNsxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2O8QXVKb3ZUGIFC0OpGxRRynfGqmj+gp7FTRV7NaqGkWM4IE05+Gqd4cUFQEQYL4
	 wG8CTj9V0h17GQd4DGWTQ/ID88OjucDGd4K+yDcA/dII3YbqJZwo8/WEGbw+0/BCww
	 uvzyeWwpnjNf8BE09DbyfTe4eatwQUCKS88qqoFVuq4Fb0xHA3dCIj/qvA6T9heVw1
	 XMReR5iaSQzexSnB5wS2XhpBfBxtK/INvsJIBmzcaV4NgQ/FFgNRrpnmVxI9gmQ0P9
	 68dzeUi++eubqSxVn0qTA5U4n6uBSTfo0lld+kP5+b9rRlCVwpuJxK42akZsycfsTr
	 Hh/bbpwOTtWRw==
Received: (nullmailer pid 166032 invoked by uid 1000);
	Thu, 21 Dec 2023 22:01:11 -0000
Date: Thu, 21 Dec 2023 16:01:11 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: mchehab@kernel.org, rcsekar@samsung.com, olivier.moysan@foss.st.com, Frank Rowand <frowand.list@gmail.com>, dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org, jic23@kernel.org, lars@metafoo.de, mkl@pengutronix.de, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, davem@davemloft.net, conor+dt@kernel.org, fabrice.gasnier@foss.st.com, pabeni@redhat.com, linux-media@vger.kernel.org, catalin.marinas@arm.com, netdev@vger.kernel.org, Oleksii_Moisieiev@epam.com, linux-serial@vger.kernel.org, hugues.fruchet@foss.st.com, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, arnd@kernel.org, linux-iio@vger.kernel.org, will@kernel.org, edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com, krzysztof.kozlowski+dt@linaro.org, ulf.hansson@linaro.org, alexandre.torgue@foss.st.com, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, herbert@gondor.apana.org.au, vkoul@kernel.org, robh+dt@kernel.org, kuba@kernel.org, wg@grandegger.com, lee@kernel.org, peng.fan@oss.nxp.com, 
 linux-phy@lists.infradead.org, arnaud.pouliquen@foss.st.com, gregkh@linuxfoundation.org, richardcochran@gmail.com, linux-arm-kernel@lists.infradead.org, andi.shyti@kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v8 06/13] of: property: fw_devlink: Add support for
 "access-controller"
Message-ID: <170319607084.165973.14576693798188042387.robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-7-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-7-gatien.chevallier@foss.st.com>


On Tue, 12 Dec 2023 16:23:49 +0100, Gatien Chevallier wrote:
> Allows tracking dependencies between devices and their access
> controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
> 
> Changes in V5:
> 	- Rename feature-domain* to access-control*
> 
> Patch not present in V1
> 
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


