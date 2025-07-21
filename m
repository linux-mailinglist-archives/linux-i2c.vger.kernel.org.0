Return-Path: <linux-i2c+bounces-11989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A196B0CB9A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 22:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B1F1C22720
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB9323AB85;
	Mon, 21 Jul 2025 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNkNYQMb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C623816D;
	Mon, 21 Jul 2025 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129032; cv=none; b=rvmnTd4+jGkZDuvOw/ZfuB/dLZkCzil0JrA6j1Z/u50ljOXah5TLQY5N8t70IepFJPi+Vj5BgJbrG7/FI1e7zi3AmLlRJGPWy0pBD38hsrnL9yJFpD3Mji0GU1H1fq6Wm0QWeskk4vCgq/sDMCiw929NEHHXpxoS8ehAMYQ2vrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129032; c=relaxed/simple;
	bh=zsoAwwBko42CkVECzPsq8auhWL/xsEzIc97plmn6jec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJkCaje7z4NBRXqEE7gDQdn2CTIPkCsE+r2pmIMwq8+DngO+MsVmrVth8DzHJJGa/F8QeZmVYR/GPOeSH6XtqSpDw5CtfScrQrODlTl+XUPCcyyU68iYMGe6g1mSbsMX6FgXfJpiEA84eLVspWV9dMCF9+d1bZUY3MEAgPhEZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNkNYQMb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36CDC4CEED;
	Mon, 21 Jul 2025 20:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753129032;
	bh=zsoAwwBko42CkVECzPsq8auhWL/xsEzIc97plmn6jec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNkNYQMbWATXsZca7uECJh52TBQOODxYQsDYpWchJQxNuXKrA3n6QxfTQqlyf2DXp
	 8O9P3kApfSVThW5ioV5bC6VMj885JSOXK4utaVtFbCq2jmJdYe5W2BnwxgfbzmRvOy
	 u2rE5/BPq2MCA2MKeRo6YZ5tz8KLk4/15NNF5ViPy/FAPnxNp5N3SXMjlgFXm7zKJ6
	 sNpJQWhV9BpOxtx6vVmlXvKvHQBqJtZVSc3chFMUwXgQxqtuIP2rNwHJwnOVQchS3p
	 coEqzM7h36xXVukQtHdWd1TJIkz4F0cvtz5Ym4kGZ9M/5jEaM2Oa27ue8o03jek+55
	 NXaY/8AZThvKA==
Date: Mon, 21 Jul 2025 15:17:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Stefan Roese <sr@denx.de>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: i2c: mt7621: Document an7581
 compatible
Message-ID: <175312902965.1260431.17671364110549858903.robh@kernel.org>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
 <20250721180710.2116-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721180710.2116-4-ansuelsmth@gmail.com>


On Mon, 21 Jul 2025 20:05:54 +0200, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having a dedicated reset line to reset it.
> 
> Add a dedicated compatible for the Airoha AN7581 SoC and reject the
> unsupported property.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


