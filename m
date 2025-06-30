Return-Path: <linux-i2c+bounces-11714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C26AEE713
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 20:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E239178709
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 18:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B675E2E7622;
	Mon, 30 Jun 2025 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvEnm43Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F906299957;
	Mon, 30 Jun 2025 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309953; cv=none; b=k7fU581h4bFDLye9RrOqQbV3Otk+6BncQqseoROgowxixMpzTDXbVUBQRs2apJFJw1t/y/rO7gh+nD0h+FwdrqpB+Pe5Sw8eAXggia9EFbxRnCn5RdP9yPwPoim4QZBhPY0WkjmehuzBA4be3ZU2u9GqkgUCxYkI6zr5qgGqGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309953; c=relaxed/simple;
	bh=apVsCLGXuvk8MiW3/veGMsk3v3m01GoVUsdwZYIYpd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzqzEqEwET3aAQJe91+vsyttfcCIzb+fgADQy/4ZOWkTDlv3aJIN3h+i0rm+vvbPSE9EMvVvnPWauuYDPyRYY4h5kYfrTOQC/zmu6Ul6nr5t1d6nGfXda+5RXLuEpUHoxQLuD/vV826RZ7xp4mww3rO4owSL8Ods0iTAq01UXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvEnm43Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45454C4CEE3;
	Mon, 30 Jun 2025 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751309953;
	bh=apVsCLGXuvk8MiW3/veGMsk3v3m01GoVUsdwZYIYpd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvEnm43Y2QyAq9MMcwuHyQRaHojJAwpOjjB2DoTepb/JsZfXp/2sipjrzsHxbdQC+
	 BmJdFiyRMXC6NF3oH7GoLOmm1BdXOoXtjF4RfJC6SG7XiduBhkLPdVxI6hCfJe1Csq
	 5+YBNdpZU3KvqniKeWatQFmhTX4GU+d55uM300sdJjHd+EUKapyuOOCudsOyeWZhQy
	 MRep2XYOpDfEs1Pa7mRtG+V1/Bumv4wS55/nhvr28vzEQlPFvL7iGH+IA/duG6hSlm
	 +E6A/sQ1F/xSe+1XfYfG72C5jtBvPVUi+tk+9FG7jqmhKPjkHr8+CMt80kZe5awJqk
	 nuAsedv9USXWQ==
Date: Mon, 30 Jun 2025 20:59:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v5 3/4] drm/xe/pm: Wire up suspend/resume for I2C
 controller
Message-ID: <ey7uujbwrgp2qxt4mnz75uf3kldcgr7nbctbz56j7ni2huchte@2xisn3m4bbvm>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-4-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-4-heikki.krogerus@linux.intel.com>

Hi Heikki and Raag,

On Fri, Jun 27, 2025 at 04:53:13PM +0300, Heikki Krogerus wrote:
> From: Raag Jadav <raag.jadav@intel.com>
> 
> Wire up suspend/resume handles for I2C controller to match its power
> state with SGUnit.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

