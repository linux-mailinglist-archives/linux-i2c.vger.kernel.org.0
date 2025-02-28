Return-Path: <linux-i2c+bounces-9660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03738A4A415
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 21:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDB13188BBD4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 20:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CFC281373;
	Fri, 28 Feb 2025 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYGOir2h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89563281361;
	Fri, 28 Feb 2025 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740773801; cv=none; b=otH8IFylFLs+3qnAjuBu+m+Pe5ZSMPWRU7cbaWWBJhoFjSCo4YL3HkwgQn1RbZ9OcEdZGr42BddDp6wlM1zO1M+9bU4KmIfWZpTTyg5vSkaO35RkyN/DXtwRmhOjbL3UlighGDB8nAw1j/WJic0n9St9H7I0kZoIZ/Yj3s3AfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740773801; c=relaxed/simple;
	bh=082XE8EtV16kXCGx5pMhPt6eqzhKH8L0hxga2Z++y8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdJ56k79fhBv9ZYWwaW+2X/U0zoMKcCPxj8xWL4SmF4fUP41yKGOr/5reZKQ+Fko0YTUE5I3a4ii2nS4IKiLa9bZ4aJw67z+rZr3S3zWA53n6FjOe4aQSjoRBKauRD57OoIYRTPBAicXRxlij5KjlzKy/WQPdnPlRQACjquaak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYGOir2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0823C4CEE2;
	Fri, 28 Feb 2025 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773801;
	bh=082XE8EtV16kXCGx5pMhPt6eqzhKH8L0hxga2Z++y8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYGOir2hYbW0RMZuK4Q+icdavzLYVBTAX9Kgxo/XQWeXUGuud2lOqMt8xs1iyiEqf
	 A2kfWLLc24JCkcIqf+Y7z0irChDWjGsGz3FLTtAIHqzZt73W1QZocn/PPLCbMrYw9E
	 Q9qMIt054bxKGubE+PuNvJYr/mptQvvM9JVdJz04r2oc7sB3jA+NsIWB31CJ4DAWXW
	 1vp6hkzzCkuUPiKgCBOrxubIsow8/EEiJtktnnFQpaC0HIWh69p+8NcSoTCG5uxoba
	 2nRPiFaFVMw3CCrK4puo7MEFMztlEkvRl3TQt4pm08WTSOVxXDB3qZ2/Y6fgITNKON
	 HG5l5uh3hgNdA==
Date: Fri, 28 Feb 2025 14:16:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	heiko@sntech.de, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 04/15] dt-bindings: i2c: i2c-rk3x: Add rk3562 support
Message-ID: <174077379803.3586340.1454205623159814222.robh@kernel.org>
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


On Thu, 27 Feb 2025 19:19:02 +0800, Kever Yang wrote:
> rk3562 i2c compatible to the existing rk3399 binding.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes in v3:
> - Collect review tag
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


