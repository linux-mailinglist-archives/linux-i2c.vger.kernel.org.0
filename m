Return-Path: <linux-i2c+bounces-11599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAFAE90CD
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 00:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184EF1C230A6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DD826E6FD;
	Wed, 25 Jun 2025 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFlXopTv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6631A1F2BB8;
	Wed, 25 Jun 2025 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889431; cv=none; b=uwUUBhZZH7wJHgHDmk8B86CKhReO8W8mTlk4Rm2I2iMLwEvc7n8Kc4zlz4fEo7nsO88S/Bd+/E/TDd55sp9G4GOsTa0zITDNFLPR3g79GKCoySH4AbPrhvhcdsAhb/unrXFBkpm8xfmJ2Ys2oTw8c9NM/uLNM61iAD1fl5PNiRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889431; c=relaxed/simple;
	bh=cHdPmsE9AvG+FJPkM44ne16K/H/TUnLqw8O2dCdmVIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyCCO1Hpw9GhACBG8fKazk3A420qxUmYOIU3t3uIm2nwippb5TWnCn8Fg9nuM3w1gVtpBTgpFJHLw/VTTVowueK28LGnybPFADpLXY/Q772hXKfD9UV4cUe+uwmterZ3pNxT2pC7Ts9s71WKp++7x+Imn6mEnJB09mM0B2U0QvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFlXopTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16902C4CEEA;
	Wed, 25 Jun 2025 22:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750889431;
	bh=cHdPmsE9AvG+FJPkM44ne16K/H/TUnLqw8O2dCdmVIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFlXopTvSYtxKrT/20/8pYODYJYVwmbJBCPUTsR3AAgijtfGHIR+yZGVOwaC8XE6S
	 grCPgg+qpaXcFbMqHsePXnh56uF57nRIRzEYnJVitphglwZOJXSAUrydVR60bdTczL
	 /wpeGbS/WAk+gj2gYZVZvpytZmN9xdU4J4mp19TiGzUx4x/veDLTjY11KDW0RYL+DF
	 eP/TDW/7HP0q/XBB3dP2w5Gq/x56ZMHytVo3WDNkQkkVaKrBOeSVGHELTzi0cYyUUO
	 7Xk8wAai20pOdDt1PYSz54A/x51+ExqG+vM5YNIOfcy167tQaFU1kLB/pDiIbcUOi+
	 +PTaWEf3TSEZg==
Date: Thu, 26 Jun 2025 00:10:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Jayesh Choudhary <j-choudhary@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Fix an error handling path in omap_i2c_probe()
Message-ID: <vhhxtsspywvuzkfgbn52hysghd6tdxhk32wv3wcnlqwhskto3f@h2bbhek3s4s3>
References: <998542981b6d2435c057dd8b9fe71743927babab.1749913149.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <998542981b6d2435c057dd8b9fe71743927babab.1749913149.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Sat, Jun 14, 2025 at 04:59:26PM +0200, Christophe JAILLET wrote:
> If an error occurs after calling mux_state_select(), mux_state_deselect()
> should be called as already done in the remove function.
> 
> Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host-fixes. Thanks!

> ---
> I'm not 100% sure of the error handling path.
> 
> Should pm_runtime_dont_use_autosuspend() be called after the err_disable_pm
> label? (to match the calling order)

Yes, I think you are right here.

> Also, should errors from omap_i2c_init() be handled?

Yes, if it fails it should be handled.

Thanks for the two reports. Do you have time to fix them or
can I go ahead and do it?

Thanks,
Andi

