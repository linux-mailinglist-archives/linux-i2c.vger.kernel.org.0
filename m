Return-Path: <linux-i2c+bounces-11745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B233AEFFE6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 18:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA325178FC5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 16:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7250276058;
	Tue,  1 Jul 2025 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqFMmRMr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA311F428F;
	Tue,  1 Jul 2025 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387552; cv=none; b=d/ElODCbYJjGRVB2ldVH/WqvQvut2VOG76x1KASYZZrhno6ZAUKVT2PPQhdXRw7eZRF1gtgp0tgHrNkAaBpkQ8aYU+rkM2x60dyTatoZfJBvYiGlq0dTJS4nZ8wg6s4QIfLfishxLBATyjKB1WVcr89DjIALpxVP9kvZ77qAu/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387552; c=relaxed/simple;
	bh=yY8157hjb4vrAMHnghGfwO7Y+f3XeiGwvIscnnt6e+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpeSNm4fWMutN/HzbjruJ6o0EtkkcJuYMNc94BZdZ4aY+53AOegL2336f/gW8T7CN1MTpztO8j3VXZUKqBZfSt54m7IbVZEFpDTW8EdnvO3MH8fXdN1oRmAF9pp2T9+r4N06Rq5mQrri8FdzJXLuXvzdo1gGDv7WCGFq8EMfpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqFMmRMr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F2EC4CEEF;
	Tue,  1 Jul 2025 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751387552;
	bh=yY8157hjb4vrAMHnghGfwO7Y+f3XeiGwvIscnnt6e+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqFMmRMrIizrNOGH2fB1eaIMDlUhGC7FiaC/70V4QaOdSD89FPdlLYXcxOPDIcAFd
	 uCaBuWxE5JyHmDuAFTknPvT7nI5Fo/80xn0v95o7TRElwbEK4QLyWxsoYarzO6lqjr
	 oCwH/cuqgeNip76TAfCqGKclrRJs524FMIyF4vD53+CPvj+CM/+9AUReVtpkIg7/+C
	 7ppRv2HggSE8R68Dn57qQCc4LpdHhkImMTrzTpB9s5tu8A6UG7F/GznadlPLBcPKT0
	 43E8iJf/S2oWSGY2ME6F55VzkCGGcmGAElUYNxx3PnWyUnCUSdKSlhrcrRJGslkwlo
	 MkvyEy+bnq+oA==
Date: Tue, 1 Jul 2025 18:32:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] i2c: designware: Add quirk for Intel Xe
Message-ID: <fv437o3j3j3durqvdtvd5fjgfdhbzsnfv4r34xptxahctbzhq6@kvy3zoiowrnp>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-3-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Tue, Jul 01, 2025 at 03:22:49PM +0300, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

