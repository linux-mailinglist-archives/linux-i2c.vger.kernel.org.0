Return-Path: <linux-i2c+bounces-934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECFF81C07F
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 22:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06DF286E81
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 21:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0647765D;
	Thu, 21 Dec 2023 21:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grvlhMPd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713A55E59;
	Thu, 21 Dec 2023 21:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29B9C433C9;
	Thu, 21 Dec 2023 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703195502;
	bh=wVhTpALcMiNCntelNMpcmyS353uCxC0tr69XZxUeP7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grvlhMPdSPsEsMrM435z6Ee777r4kKrlEfU5VJO4IHAn4V7pnANe2YaPn9yqlGBHg
	 U7IjIExcXlK1D9VjptD8QyQ+42pMJbqVtaZr9Lh6/W9NcKiHa/4Pi1lg/vqCN4EdnL
	 6kO0lUSi+dNbPKTQgm7u7+8N5icMjEm+Xx0mdV8DwQ4PENu1D0ga/Kb1YDb+J4XM0f
	 ANsuXOYE3cY800vWiRTMZq07yWnLPeaBKYK201IO8zMr9PmgVqaDHP5agM0fLCgIzx
	 SLr/TsqKDLJRLArQCYcVOAdjwxzBrLiXnruS1js2v2YjfWlxH3LNi3VupaDmJHLxBr
	 igbLYfklcAyjA==
Received: (nullmailer pid 153686 invoked by uid 1000);
	Thu, 21 Dec 2023 21:51:38 -0000
Date: Thu, 21 Dec 2023 15:51:38 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: pabeni@redhat.com, netdev@vger.kernel.org, lars@metafoo.de,
	linux-media@vger.kernel.org, hugues.fruchet@foss.st.com,
	olivier.moysan@foss.st.com, lee@kernel.org,
	alexandre.torgue@foss.st.com, catalin.marinas@arm.com,
	peng.fan@oss.nxp.com, linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
	robh+dt@kernel.org, wg@grandegger.com, arnaud.pouliquen@foss.st.com,
	alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
	vkoul@kernel.org, conor+dt@kernel.org, mkl@pengutronix.de,
	Frank Rowand <frowand.list@gmail.com>, linux-crypto@vger.kernel.org,
	edumazet@google.com, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, arnd@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, ulf.hansson@linaro.org,
	will@kernel.org, rcsekar@samsung.com,
	linux-arm-kernel@lists.infradea, d.org@web.codeaurora.org,
	kuba@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, devicetree@vger.kernel.org,
	richardcochran@gmail.com, Oleksii_Moisieiev@epam.com,
	andi.shyti@kernel.org, herbert@gondor.apana.org.au,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v8 01/13] dt-bindings: document generic access controllers
Message-ID: <170319549389.153568.1692332156021513651.robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-2-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-2-gatien.chevallier@foss.st.com>


On Tue, 12 Dec 2023 16:23:44 +0100, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the generic access controllers bindings for the
> access controller provider and consumer devices. Those bindings are
> intended to allow a better handling of accesses to resources in a
> hardware architecture supporting several compartments.
> 
> This patch is based on [1]. It is integrated in this patchset as it
> provides a use-case for it.
> 
> Diffs with [1]:
> 	- Rename feature-domain* properties to access-control* to narrow
> 	  down the scope of the binding
> 	- YAML errors and typos corrected.
> 	- Example updated
> 	- Some rephrasing in the binding description
> 
> [1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
> 	- Renamed access-controller to access-controllers
> 	- Example updated
> 	- Removal of access-control-provider property
> 
> Changes in V5:
> 	- Diffs with [1]
> 	- Discarded the [IGNORE] tag as the patch is now part of the
> 	  patchset
> 
>  .../access-controllers.yaml                   | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


