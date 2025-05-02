Return-Path: <linux-i2c+bounces-10732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA5AA6D27
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 10:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEDBA4C096D
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 08:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC0D22B8B5;
	Fri,  2 May 2025 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTuYBJWg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171222A7E1;
	Fri,  2 May 2025 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176218; cv=none; b=QNIQJxTlMSI7yu6ns7ABa24i7bten7a/Ys34KQo6lJQ+UCXEh2UeWvRlDOKVWeyzlZNBxW5MT7uZUMJV3I1PTFyrRCBRg5LVWhN9djNGtf6mo14/oCLMoX+Vn0c71KmgIZLo3+RunIN/caU9e/M/76SYVKzVrP7B0D49yoVJ8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176218; c=relaxed/simple;
	bh=B2S7t4hxs70eyK+EQYt9MPrDHRd6O/BscLmI9x3WT+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKykmRSv1bGynN2FWGK/PvMgM9jn3BlznJorWcU6KA1t8tFxy9lKRNtkEzeY3OGMPoqJpP7exqDLlHfjXmPWgV1khbWP5KdkF/kQTeEOUrn3BLtumt4pqiYy0/IKMLEjbyMqlb4hjID75mNPOTCSE4sxbUIVRDA0dYI+7EXMl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTuYBJWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C966C4CEE4;
	Fri,  2 May 2025 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746176217;
	bh=B2S7t4hxs70eyK+EQYt9MPrDHRd6O/BscLmI9x3WT+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTuYBJWg3ZllVDS6TqDA2/08BRO8eMvMWSJDjVQUYMYMF/gDtP4zorMllb9Hr6OxC
	 Gb2ApUDw+/SRT/mUanbqi2ScpvoPh3eGt1AKONCl2Trul8z8IkKyDZGjI/EKoT7Hb6
	 WJuUXuSy9Nh9gbERJBVyn7KsNKQCMjWTKFPQrjHe9crztqPxvxqVlQiRJvkTVdRjwF
	 khp/fjWKVhJSnTN80enTaqZDFWtq/QaFEgxTvZrVhbY5nsGnqNqjWiu3D8QI+Fa3z6
	 qxw7NJx6MG8xXPtf4hoRX4/0BktSJz7UYj3gpF0se4EtrBeFNjIWT5y53tXcYJCwnX
	 mLfjtyYlyZ6dw==
Date: Fri, 2 May 2025 10:56:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2N
 (R9A09G056) support
Message-ID: <2msodreg2o4vpcqbnorgxbqnbw5gytxmpguroox2lvtfvtm24t@iq3zb3xe5whe>
References: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

On Thu, May 01, 2025 at 09:33:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The RIIC IP is identical to that on RZ/V2H(P),
> so `renesas,riic-r9a09g057` will be used as a fallback compatible,
> enabling reuse of the existing driver without changes.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

merged to i2c/i2c-host.

Thanks,
Andi

