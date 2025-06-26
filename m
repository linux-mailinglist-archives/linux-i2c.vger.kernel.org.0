Return-Path: <linux-i2c+bounces-11626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC4AEA86F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 22:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB4D17B506
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 20:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41675231C9F;
	Thu, 26 Jun 2025 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSSvfBC9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74681DFFD;
	Thu, 26 Jun 2025 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971115; cv=none; b=Hn6SYd1Hy+yhRSkCnVGtBlAavthKJB+qqar3FQOuS3i6dfVs4vWlDmxIyPbHBQu3+CFmz86SbQtCOqmT9PFRzd0whgPYqVcvuFTWsddIB+KNyl1uvT86raNe7AjO8ZlRA7EUstfWXmq7nwbW/cFXVARBN6B8jeqAVUq2gV83SAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971115; c=relaxed/simple;
	bh=eqA2MDwSknSbDQOIuB7k3A6WzHxYtW+T7/XzARm/jTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLC8B+WX7A4wSTPOiTixECgnwV4jWCP5Xc+FSvmDyE902umZFB+lJ4xtKG/tCkyimu2QPJ/6hegSbuXi8GT45S+mVeOoc9TW54Xpnqn7l9ctkZKjU88fe/x5duz1dfngiFpA3vI3r6Bdc1U5FUwoZn5FEZ7mv0r0/+ooYcoPVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSSvfBC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F489C4CEEB;
	Thu, 26 Jun 2025 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971114;
	bh=eqA2MDwSknSbDQOIuB7k3A6WzHxYtW+T7/XzARm/jTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSSvfBC9EKp0AR7MOxASWcrhwGo9pKP9Pnr3l2lVOeuCtZjmDRYUZrQHeHaONa7jp
	 OOUlJcNZsGEbP8pGw+yf6zDpTfkJ6Auf8A9QFGWcMf3CHuaMeS5ztYyM+pTAktUyAE
	 M1LMa6FiyUf52MTiCe9v0ERuG2NZ+2DgEeZQXafzhElTreAYA3u4Vuue0hOJoghCJX
	 qmOlxT9LF1cnDIZIhUX5sDLFWo/k/XJxu2UNzpToyNuV0aUOVzGOVKMfH0J9kgxFae
	 OlRr+FRGwDBTkLCej3TNrKmJ6I3KqLZd6blXgOBEs+7im8472P/25eX7OyVtMpcrmt
	 264o5/fPPix2w==
Date: Thu, 26 Jun 2025 22:51:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: i2c: nxp,pnx-i2c: allow clocks property
Message-ID: <ggailkhwrjvsy6tbh7xvv6epl6ompiwwwomkn2vkp52l77tb6i@xga6nyejlbqc>
References: <20250624200444.2514331-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624200444.2514331-1-Frank.Li@nxp.com>

Hi Frank,

On Tue, Jun 24, 2025 at 04:04:43PM -0400, Frank Li wrote:
> Allow clocks property to fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: i2c@300 (nxp,pnx-i2c): Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

