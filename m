Return-Path: <linux-i2c+bounces-10779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF36AA9D88
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBEB47ADAE3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 20:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B6325D213;
	Mon,  5 May 2025 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icXJXNJk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DEF1E5B73;
	Mon,  5 May 2025 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478028; cv=none; b=bCTsdCY18JqtgyEYhyH6CHBrh3sUGnBiEj4Ny2bgZoNmA2yxRIJS5rtmehTJWOMIYW4i8KqXL8BY+m6ZJ6F+0PX2VzgEVlMl+wOgIgXI/VtmB3TWq9z6oF5kDpU7j7B3NctlPwXd8FNBys0T5pBABHG9VU9DmzBwAb8QqZT6r9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478028; c=relaxed/simple;
	bh=ddICR0mNLi+4InQVuEWoff9w1rDtvhO3HLxEJlaCnm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrvWMp1gMSDOSQvTdJEmPXJSovMmEzW+RTtqrJq1sQcsf/ThlNi5wH1FkFmb4QwDeNcsvTlVsrczbAW3TvZtBE0aF7aDe1FOiRPJI8AD04wS/B/9a5j4f2guTEXBnRbp54zqsiznUVyCZbxQD2VRDYLweZtMiYLGTyF+77hT0JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icXJXNJk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B18C4CEE4;
	Mon,  5 May 2025 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746478027;
	bh=ddICR0mNLi+4InQVuEWoff9w1rDtvhO3HLxEJlaCnm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icXJXNJkCkS3jEBYBORhYqhUxh4ijb8wCNsrwpLDigvQZTu34Ixq0g5KDz6Y+m05y
	 IqmJjx+isaC5GgW7iJRdYYT6lfi2YrQW4VB7h4iGBZi60Zrr86alt2rTnqy4R065IE
	 DAlm2PYfwlNhdzbYGhbx1834+Mpq301d8pDoy22ydcFvrQ2dy319Jm67hLwB7b9I7Y
	 fRmFaurIX3eEcL5osM5jAI7YpspBaSYGnDOwoNpCIjHyrormRj6zC9Letnu891gSG5
	 t/LP3UrJ2Cz0N0piHmmXkXoTw6D6crpEYCewgK10rnk6r66AHvjv+10TQEMqJXFCxT
	 eFNqc0vjXr7TA==
Date: Mon, 5 May 2025 22:47:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string
 for RK3528
Message-ID: <h4hpaadpeu2pnsbcfbg4iye7w5sn26wflth4uztdghafuegqi5@2xbtygdwe2hu>
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-4-ziyao@disroot.org>
 <4864135.rnE6jSC6OK@diego>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4864135.rnE6jSC6OK@diego>

Hi Heiko,

On Mon, May 05, 2025 at 09:49:36AM +0200, Heiko Stübner wrote:
> Am Donnerstag, 17. April 2025, 14:01:17 Mitteleuropäische Sommerzeit schrieb Yao Zi:
> > Document I2C controllers integrated in RK3528, which are compatible with
> > the RK3399 variant.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> do you expect to apply this patch to the i2c tree individually,
> or have it go together with the devicetree patch?

with these patches, I normally wait a bit to see how the others
in the same series go before merging.

I now merged this patch into i2c/i2c-host.

If there is any particular need to merge everything together in
the devicetree, then I can take it out.

Thanks,
Andi

