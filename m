Return-Path: <linux-i2c+bounces-6888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F60397D304
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C35E3B21095
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF02D7DA6E;
	Fri, 20 Sep 2024 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFxMDfO6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E802AE77;
	Fri, 20 Sep 2024 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822347; cv=none; b=im7ghKUszAK+X9hUgy3ATc50AcOzVtvIrZxUTWJfamp1BYp4m8/9vPOCicjlok+pr0qsiYypjGP5r9tNE22fmdpWip88JKSXZ6FNYjxyxEXnso5LXm0qLVx7UhodLfTVChcMCNXk3AFmhEMv5XZdga99smuojrbUl6JIXM7/l0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822347; c=relaxed/simple;
	bh=utnaNPaf6qjYT3lfCRcXfqm/eoc8XViXnZwkwH1E5lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WviZXcB0d/kLeRyYJMACl077zhFdywScugnVw/E36DG4JxHNcuc3eyyxs9Y09ndSNGpgUu9bYlQSAQQhJS400bxJo7aAPI0Caca1owluC2FaC9qyWT+1RcE1KP3d+6S2I1VFIInOs/etWSN56R+bzjF+cMQI1oNUowDFxfagCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFxMDfO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F6AC4CEC3;
	Fri, 20 Sep 2024 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726822347;
	bh=utnaNPaf6qjYT3lfCRcXfqm/eoc8XViXnZwkwH1E5lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFxMDfO6HDqrHJujhpl6lnKs6ESLaNum82xa14u7kEtbPENB1ZbmVB1cbsQgVB2A7
	 kh1uLOJH0DkU0FqkpGd98/MluXLbyj8EtxrVAElY2d/9WDxQl1UNRN3oeibVGsCHZ0
	 SgIKfHoWW4GzcvhjrRQRcDUNZ/6f/VG/VV/ZK30ebKohyR0TwvFT9hhLF5u2PyM+xE
	 EcAuj78M8Ul8m/vQZvvQEqkSmBRQDPT4zpXSs/G3WDC25isGtEaqnwsRvOFmvDHLYr
	 z7PSMRuLzYSHBbpfXfv2v8vsgeffZJSi074QeDJW9HxuTTjCEraxYU6I2ltHg1GB6r
	 jtZZuZi4m6nXQ==
Date: Fri, 20 Sep 2024 10:52:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <hua4cnnstss2lw5ejau25ktdiujwz3m3ixawnfuz7havwsr7vc@i7jlayooy3ha>
References: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>

Hi Kimriver,

On Fri, Sep 13, 2024 at 11:31:46AM GMT, Kimriver Liu wrote:
> It was observed that issuing the ABORT bit (IC_ENABLE[1]) will not
> work when IC_ENABLE is already disabled.
> 
> Check if the ENABLE bit (IC_ENABLE[0]) is disabled when the controller
> is holding SCL low. If the ENABLE bit is disabled, the software needs
> to enable it before trying to issue the ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> These kernel logs show up whenever an I2C transaction is
> attempted after this failure.
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> i2c_designware e95e0000.i2c: timeout in disabling adapter
> 
> The patch fixes the issue where the controller cannot be disabled
> while SCL is held low if the ENABLE bit is already disabled.
> 
> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

I'm sorry for the delay, but I needed to wait for the previous
batch of fixes to be merged.

[...]

> +/*
> + * This function waits controller idling before disabling I2C
> + * When the controller is not in the IDLE state,
> + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> + * Values:
> + * 0x1 (ACTIVE): Controller not idle
> + * 0x0 (IDLE): Controller is idle
> + * The function is called after returning the end of the current transfer
> + * Returns:
> + * False when controller is in IDLE state.
> + * True when controller is in ACTIVE state.
> + */

I took the liberty of making some small changes to the comment:

+/*
+ * This function waits for the controller to be idle before disabling I2C
+ * When the controller is not in the IDLE state, the MST_ACTIVITY bit
+ * (IC_STATUS[5]) is set.
+ *
+ * Values:
+ * 0x1 (ACTIVE): Controller not idle
+ * 0x0 (IDLE): Controller is idle
+ *
+ * The function is called after completing the current transfer.
+ *
+ * Returns:
+ * False when the controller is in the IDLE state.
+ * True when the controller is in the ACTIVE state.
+ */

for an improved clarity and address a few grammatical issues.
Please verify that it's correct.

I merged your patch to i2c/i2c-host-fixes along with the latest 
changes proposed by Andy.

Thanks for your work,
Andi

