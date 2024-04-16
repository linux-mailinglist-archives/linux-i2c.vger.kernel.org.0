Return-Path: <linux-i2c+bounces-2975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 604468A6D5C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 16:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170901F2118C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 14:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3592E12E1D9;
	Tue, 16 Apr 2024 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXd2NkHS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31FE12E1C5;
	Tue, 16 Apr 2024 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713276469; cv=none; b=diW4Vbw+H+m+GwGSf3D1cXYXT3VV7k6kTV1m29jIj4XlGRZimJ8/yqsv5Ac6DFPy78mEvz4oj/8TDPmihbceVGFwc3bJtRnlp6YonNyfJYXozglHtRssQhP2xEilCduI736XJwzFK6NoJ8vBtoD7yMGWePTlRwPzhA00cIYu9H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713276469; c=relaxed/simple;
	bh=5yq4csUG5rBzT+UQdA0n4IvddA9o380zAC421EEiAGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syN2CzFuDl4UjFVNVCO5Z2U54PQmxFj6NYslceRV4fPtUOET7Y8hX1ZC1n5aCxT4AHPKAOP3aycWPcA//ShzJEzp0B9ZP707hQ7sIpHh2PZpQgdBHmMR33KNIm/X6qv0xc2yPby3/oK+/1xEeibG7cON9QoiguudcFnNblCNUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXd2NkHS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CEEC32786;
	Tue, 16 Apr 2024 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713276468;
	bh=5yq4csUG5rBzT+UQdA0n4IvddA9o380zAC421EEiAGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXd2NkHSyi6ASW+ZFU0qZIh2V3/ntZeOJG3e2ogSwftrnp8cPKYdTanuUoAaK8tjw
	 W3TeSTJgmcQqACtP7B/ERTGkfCDZuZFfHldIUtb+gEfDAPx5gVsLjIuFXP4eF6uAJa
	 ClMAmc5TBPV11RXDUe3hKUrLCM+6XExKO1P+nzlq5TDh7yFD7sCIS+BIBi0Q6tm7r5
	 InseEYL6db28k6kD4vwa4tVz2sV4dqxnegin7KhAynB31gQfysBQFYtmEVoC+7mScc
	 bg5azoxGxLzEHDLG7nQ7c3SBGPrp9JgxbcTn/Eaaq0NB7Miqa0nG9cBZElv9Pp3ujK
	 d5F1NWeWN2Pug==
Date: Tue, 16 Apr 2024 16:07:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Abhinav Jain <jain.abhinav177@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, Julia Lawall <julia.lawall@inria.fr>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Message-ID: <ctfgvm32ga232lcxlanyu2cvcbybfgkwj5ovxzha6rq7yrf2sn@xduhb3qnssao>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
 <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>

Hi Chris,

On Tue, Apr 16, 2024 at 03:59:13AM +0000, Chris Packham wrote:
> On 16/04/24 08:54, Andi Shyti wrote:
> >>   	/* Enable I2C interrupts for mpc5121 */
> >> -	node_ctrl = of_find_compatible_node(NULL, NULL,
> >> -					    "fsl,mpc5121-i2c-ctrl");
> >> +	struct device_node *node_ctrl __free(device_node) =
> > How have you tested this?
> 
> I'm not sure I know anyone that still has a mpc5121. Maybe someone on 
> linuxppc-dev?

that's why I was asking, this would be the first driver in i2c
using Rob's __free(device_node).

> I did try to take the patch for a spin on my T2081RDB but I'm having 
> some userland issues on it for some reason (unrelated to this change). 
> The kernel boot does discover a few peripherals hanging of the I2C 
> interface but I'm not in a position to offer up a Tested-by and I've run 
> out of time to debug why my board is unhappy.

Thanks for giving it a try.

Andi

