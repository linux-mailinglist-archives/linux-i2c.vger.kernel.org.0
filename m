Return-Path: <linux-i2c+bounces-13437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74498BCA330
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 18:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347B93AF30C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 16:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036B9220F3E;
	Thu,  9 Oct 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgFCYhC1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A51A2545;
	Thu,  9 Oct 2025 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027615; cv=none; b=ICEXx7Z8JuXpH2J0yRUPfyBtP62JJa+pHeWLX97giC+aqFpkbzNsHkretZQW1GdQZPEjaG9p6o1CHuTzj0dSJPKFJ8ruoKu2GlsxbNV91bi5QZw23ASAC93IzV8v1eGAEmsLkLnU9WBAKFdI9/9yEk1jpEBpseuniXBuc9FxJ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027615; c=relaxed/simple;
	bh=ePE6UwXG4mOskOTOs/+qp+ty/ofJpwv5+43knm9orGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4tCrs/E0VczhnsaLR1XRZBayDYb6N6uilZVTw2OxgQnDOFGe1uTpehY33DAPQjNJJB1h7W9OdVRpdPOjufIQ1BSVxL/U9uc1RWxnEzYZi1EVbsaGij5YiU5RxuqBoZnZ/E7zQi/enJLhWyZAw/SJci0q5PMbpLAsduQsG8ivmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgFCYhC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D439CC4CEE7;
	Thu,  9 Oct 2025 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760027615;
	bh=ePE6UwXG4mOskOTOs/+qp+ty/ofJpwv5+43knm9orGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lgFCYhC18OgKWlVAJjrJWpnEuF+LkxylxlEYO8KHpNQoQ/spVHSDdaMCD0Q75JwiE
	 cBMEKsP9rUIoHGctPJn6GfATdwEWuZ4C0bad03DZ9CNIsIzisI3iy4afdkIM/VXN/8
	 RmnxO7M1WMsT9tIyyq11gIsr5xlWOQQrq436ofLKd11CXSH1Rhf/yDy9qBG1wMkCgL
	 Uo1gBNSgeTmEdv3cRvMXxuCdYIgalmRgFBkyVeIGRitz57qhPjWd9gx9sT4uipvFjg
	 Gxe6mR9d00X3XPolwy2wh/wDALvp0RIY/0BoPctJXRNA0VH0hkgsPKcuM78RBsuqER
	 iBNcM6HB93sKg==
Date: Thu, 9 Oct 2025 11:33:33 -0500
From: Rob Herring <robh@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Chintan Vankar <c-vankar@ti.com>, Rajesh Gumasta <rgumasta@nvidia.com>,
	krzk+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, thierry.reding@gmail.com,
	kyarlagadda@nvidia.com, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org, andersson@kernel.org, sjg@chromium.org,
	nm@ti.com
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
Message-ID: <20251009163333.GA2452939-robh@kernel.org>
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <0784441c-9859-4418-a4a7-85ffe3ecf860@ti.com>
 <d619df1f-813d-4be5-8d24-295455f956de@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d619df1f-813d-4be5-8d24-295455f956de@nvidia.com>

On Tue, Sep 30, 2025 at 04:01:27PM +0100, Jon Hunter wrote:
> Hi Chintan,
> 
> On 29/09/2025 05:39, Chintan Vankar wrote:
> 
> ...
> 
> > Following your series, I would like to bring to your attention that
> > Texas Instruments SoCs also have a component which requires similar kind
> > of configuration, named Timesync Router(TSR). It enables the
> > multiplexing of M inputs to N outputs, where inputs can be selectively
> > driven based on N output configuration. A detailed explanation of the
> > TSR and our attempts we tried to implement TSR can be found in following
> > RFC series:
> > https://lore.kernel.org/all/20250605063422.3813260-1-c-vankar@ti.com/
> > https://lore.kernel.org/all/20250205160119.136639-1-c-vankar@ti.com/

I fail to see how that is related to this series. I'm not going to 
study these 2 implementations and imagine how it could be implemented 
using this series. If the amount of overlap is just 'reg-settings' node, 
then that's not really enough. More below.

> > To implement TSR, the relevant registers must be configured via the
> > device tree. We initially assumed that the device could be handled as a
> > mux-controller and could be extended in the same subsystem, but it was
> > ineffective. Having explored both the approaches, we now plan to
> > implement TSR within misc subsystem, which aligns with the dt-bindings
> > that you have proposed in this series.
> > 
> > The purpose to replying over this series is to inform you that we also
> > have a component requiring configuration as outlined in this series. Let
> > us know if you have any suggestions for this.
> 
> That's great! Thanks for the feedback.
> 
> Rob, Krzysztof, Conor, have you guys had chance to look at this series some
> more? We are open to re-working it as necessary to address any
> concerns/comments you have. However, this appears to be stalled at the
> moment and I am not sure what we should do next to push this forward.

I fail to see what is generic here? There's a generic node name, but 
that has nothing else common. The 2 examples share nothing because it 
is all bus specific. But then the bus specific stuff is NVIDIA specific. 
It's the bus specific part that should be generic (to the bus type) IMO. 

A concrete second user would go a long way to help. Anything "common" 
from one vendor ends up needing something different from the 2nd user. 
Somehow that 2nd user always shows up a month later... So the rule is 
generally I want to see 2 users. Yeah, it's hard to get others to pay 
attention, but that's not really my problem.

Rob

