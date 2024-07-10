Return-Path: <linux-i2c+bounces-4863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4492DB63
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 277CCB2492C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059EB13DDCC;
	Wed, 10 Jul 2024 21:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3x7yPK9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80ED13C80C;
	Wed, 10 Jul 2024 21:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648769; cv=none; b=TIzyZWdlin93EJOJXPsgxW1yzpOivOCfF0O8cT8BXSGYKDLNN2zq4P1dExn/EaaocApuR/yeZSZItmUUBQO0HisBHgK8LinNrkh6TnuNDPX6e+8m/80QCk99/19DBp0+eJTxF0qp70u2bBQoRbUcdKHYb9G4GuN5LaFp08NP+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648769; c=relaxed/simple;
	bh=+g9T2N860tm0aAUe6j387SMvNO+vFY5N9n+UXcOLh/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IewjDIuVzocpnGNBwy5qSlD54kuxRzYHqCVdpdICsg/ELSVplg4eOeUJR6PNRQGUBx5EUsFDXbI1SNS3vyvcbvd8709EdGIfyFcFG47LGAl1wjVU1x5tiET8dPBb4kzkEqTbiyySytTIOIXGMRcZT2xKJZFbXsj3auuvah9RJgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3x7yPK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192E0C32781;
	Wed, 10 Jul 2024 21:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648769;
	bh=+g9T2N860tm0aAUe6j387SMvNO+vFY5N9n+UXcOLh/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3x7yPK9QLgsnDgR/aB5McWHuzmWuncu+HGCf2/ERJgBxNFgSRIQ1iUvBjT+xYMMs
	 +WP4oXmUW2yPL7KrNlRzKWr3jpFxjzf3Vvb68Tc+GEmIQvaO79xwz9NyQe8cF9RBzA
	 HJmY+QyJ93YD3zyydR6T2mRo8/Z79stS29OwC/LatlOty/3hi2zVIB8Xjtd2N6FrIh
	 FVyMMXCcU74sDL7A/2dsnpVw6c0EnGas2k1E5t3nhcX2gwByJv475ikvkVPiNp1U6f
	 ES4jpmWAJ04RsI5W5fFe9jfFryO4luMqWG4eYQBs87aU0BE8pt+jLrLdSA03KCaWlW
	 8mb8Yjk6ZXhaQ==
Date: Wed, 10 Jul 2024 23:59:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 31/60] i2c: mt7621: reword according to newest
 specification
Message-ID: <w3posivzapfwlfywhryxt7qac7knoscbjbvhqewucpqpxho4pq@sc3ulekjvifu>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-32-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-32-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:31PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

