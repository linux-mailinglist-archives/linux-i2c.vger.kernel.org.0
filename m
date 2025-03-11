Return-Path: <linux-i2c+bounces-9790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00516A5D297
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5C4C189DE2D
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6C8264A7C;
	Tue, 11 Mar 2025 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCAt106v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9EB18A93C;
	Tue, 11 Mar 2025 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741732436; cv=none; b=dG9V13JAggYX/LcuBNfxavY14zOGVz8dIPU2cMqOD8EELQrkxhBm/KIBBnr7QyKA1jMsAAyeSCXXU8UtIHazikWaDeWro8MgPYjl0R2r4U/93E1tO10KMLRdmD5e0RicbhwYTpfTps7Igr5cYjEbRiisvZ9YDVaEYRV+IhXIwiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741732436; c=relaxed/simple;
	bh=3Z1R+L+jSx5edeWaQS0cx6WJe3wb6MZKgrGV01ESFAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an2sia/xdmx7cGPR54y0DREGcASsisDClxRhzNtnbqWRCdn+28pyUkl/xREqusW/Acms+ORihcd61nD49oxXCGqGd6axd9tuZkzohEhi2czwQRy098oTvASiVI5TpfgsLDEKT+D9hlbeXwlVDOaEbBdMuAeZYC1Rul+RXgqNQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCAt106v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9523AC4CEE9;
	Tue, 11 Mar 2025 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741732435;
	bh=3Z1R+L+jSx5edeWaQS0cx6WJe3wb6MZKgrGV01ESFAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCAt106vo4mx0IunDxJo/tZeqkwBgQXFwAdGFGATTpJqAHxWOEzH1rt3h2cbbaL18
	 ELbiVSL6qxyYjnBp0OmGbOFe6TEee2lL32MzveTbUgrceFvDbo/jC9KMeyL7eW7c2D
	 IMf+DRS/ojD2Lhldw/AySw9OwyXFiuV6IaRxHTbZta//FSwmo86+BBuREkvSDbNPCU
	 2fwbAsGDNeNG9qCPu9875swgHns1VFA4H7l7oYstzmp3x9kexg6iYKu+aTVnKx9lpY
	 lgd1LzFGQgH4uDyKQd4jbe6Sp7nyZONyJeTHoZC3zfgpQmcbwNh3qlYhSbBTH4HaOz
	 QcCn7eAth8SOw==
Date: Tue, 11 Mar 2025 23:33:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/15] dt-bindings: i2c: i2c-rk3x: Add rk3562 support
Message-ID: <dqgqw2e33gaieos3lk4vkrfqmnunrxooar7gisrdwqjhdnl4m5@s2cxnaur5a2b>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-5-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-5-kever.yang@rock-chips.com>

Hi Kever,

On Thu, Feb 27, 2025 at 07:19:02PM +0800, Kever Yang wrote:
> rk3562 i2c compatible to the existing rk3399 binding.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

merged to i2c/i2c-host.

Thanks,
Andi

