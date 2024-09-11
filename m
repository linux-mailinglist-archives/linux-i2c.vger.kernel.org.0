Return-Path: <linux-i2c+bounces-6538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA72974F74
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842591F25309
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69AE13635F;
	Wed, 11 Sep 2024 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7yQ4jHT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A013D510;
	Wed, 11 Sep 2024 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049793; cv=none; b=oOZYUcKHrkqYsjFaKVQg7yZ4QlzfY8XHSUEHeGcY5SmCnWAGYeZrzV5FyScsoyugXdBJaaZ6ILh0HdlruENyx89dTDiNbrmsuZNUdq4/DFaYrvI30A6nHuBaX+lJkg2+WCIlM5SnfQUXJHC5mqlKSz1LFJr6lIa3CEfAs1oUBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049793; c=relaxed/simple;
	bh=+3O/jx2ed8H+XiWq0pb8D0EUrf/esXqg2Fktj89Mslg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcHs3bo2dkNRBl/jZPBRLJIS9/TuxwnQsTR3vuKKGiRS9BJs1KLapJXhMDPPxmKMjblh5pPZc65XmVSOo/V2dsFIL+k6LH/1Bgm1gmSTJSwrnFDnQkfOVDQij6DorL1aGiAFhbJgUN9bQls1gsUToxrGtedlUn0JQVcY5XfdYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7yQ4jHT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65495C4CEC5;
	Wed, 11 Sep 2024 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726049792;
	bh=+3O/jx2ed8H+XiWq0pb8D0EUrf/esXqg2Fktj89Mslg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7yQ4jHTsHMqCg3bALlFr1dEIvkCfmW+eeuGFxTj3entrK68KTecuJMS3j0U0gu3b
	 MwCWnVS2qE9VcE9NSMVHPEZiuOm+8iMYA/3Z/igMXzFPlxgU8GHe/peo98/d8EItfC
	 /vY+7+2+A//RK2WcOUC+pC/zNfj3rrWjLkOrviBmHCCPa0N4/iISSiBri7d/XdnwgJ
	 q/aj3j4KgvjRfTwrD20PKAjDVdurPJ+OEce6R8fTfVnUJVxdmgJxTTc9774BccQtIe
	 BuzytZUAQa+N+68nE5Q0OQwHyNLt0VagvnhmB10/uNQDf6lV/tWD63B0m9lsxSMeU5
	 BeWkor5gs5DpA==
Date: Wed, 11 Sep 2024 12:16:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <ynzj54wf54b3ebxambxu73trcxee5xjiwhvs6tok652hhkxiff@wympszncw2gx>
References: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>

Andy,

On Wed, Sep 11, 2024 at 04:39:45PM GMT, Kimriver Liu wrote:
> It was observed that issuing ABORT bit (IC_ENABLE[1]) will not
> work when IC_ENABLE is already disabled.
> 
> Check if ENABLE bit (IC_ENABLE[0]) is disabled when the controller
> is holding SCL low. If ENABLE bit is disabled, the software need
> to enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> These kernel logs show up whenever an I2C transaction is
> attempted after this failure.
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> i2c_designware e95e0000.i2c: timeout in disabling adapter
> 
> The patch can be fix the controller cannot be disabled while
> SCL is held low in ENABLE bit is already disabled.
> 
> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

if you're happe, I would take this in.

Thanks Kimriver for following up on all the reviews, I really
appreciate your responsivness.

Andi

