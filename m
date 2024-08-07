Return-Path: <linux-i2c+bounces-5182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE984949CB4
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 02:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D27428545E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07884A06;
	Wed,  7 Aug 2024 00:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrNEfVxx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1D10E4;
	Wed,  7 Aug 2024 00:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722989721; cv=none; b=u2Qx0lPkzB7tw+R4Y/hU4pjtTCpRty3++qSyg1qmxlEOVxMRz9rv9mzb/R/GYdp8OfHBZ6x7sQP3j35Xo4w7Xcg2RWI8jQnLu5740dxfFDX4B4JvDBhJe1tjLT31NIhg/Cdj0pltHDSJRxdCgk1dAc9Re+ju6XvFo6FuHP8fbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722989721; c=relaxed/simple;
	bh=UA624rrIplYm5bYViBQrFeGAf4DqmN14dvZNWYvj+rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbkxKU4YdkR43WC46xIoSoO4KUA0iMLjai6LyeZb08VfkFRG5KgF5alVunKiBMJYLD7LA0HtGxBenv4Ebdqfk/0heu+EyH3e/TYdn/YQnnr31KbaCSc7wowfSVzjsKHNmMepGCjt7DLav2ekYee3/WQfxhMB1CpJQKCEUj0p97k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrNEfVxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05BAC32786;
	Wed,  7 Aug 2024 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722989721;
	bh=UA624rrIplYm5bYViBQrFeGAf4DqmN14dvZNWYvj+rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrNEfVxxAEryDmkW5lWsQzdnOXEy9efwM1g+L+9j2QXp8ZZfTJJW6nXAx0wUyuMrs
	 8y7lHimdx4Hzx2IkAGZRQ5xZ1DfpVmGedOFBDAC5NLcjJTvHVvMCILf4vTTdi8cMWw
	 AiW6A9oN4mDFzQS/BvP2LaEKTwKOqw/WNb4iVWZBAb8hmM6eVFbPc7WONrtjmGvZHi
	 Zb5e1Fm31sYYILnZAtdCk21Pfz1rFIGTLy0Aq4TO28yQGbnFUFhFtam4quauteNF1r
	 XfYOe2egsQbrA0i6X6b+MqjLm2nDqpkrtvg+NEfEWxYbg2bvP8hK9bmmhpo7XtZHDX
	 OmzGAUZ6FTMZw==
Date: Wed, 7 Aug 2024 01:15:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] i2c: mt65xx: Avoid double initialization of restart_flag
 in isr
Message-ID: <rmn65agbosovoto3zwr6pqio32ad4uyhekxncvqx46w7eyj4wj@cxhtrvmlj5sv>
References: <20240806094537.90747-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806094537.90747-1-angelogioacchino.delregno@collabora.com>

Hi Angelo,

On Tue, Aug 06, 2024 at 11:45:37AM GMT, AngeloGioacchino Del Regno wrote:
> In the mtk_i2c_irq() handler, variable restart_flag is initialized
> to zero and then reassigned with I2C_RS_TRANSFER if and only if
> auto_restart is enabled.
> 
> Avoid a double initialization of this variable by transferring the
> auto_restart check to the restart_flag declaration.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

merged to i2c/i2c-host.

Thanks,
Andi

