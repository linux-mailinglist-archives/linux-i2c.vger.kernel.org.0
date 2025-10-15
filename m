Return-Path: <linux-i2c+bounces-13552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE4BE0FAF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 00:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02A631899808
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 22:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968D0315D3E;
	Wed, 15 Oct 2025 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esXcHjM1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C763314D0B;
	Wed, 15 Oct 2025 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760568652; cv=none; b=C3Q5awAS18TCeUxTfp81k741REXtOhlXcG1ubHMbJRmVHbeTle24sUuXf2NeImnHdEEJXAhWiZ1X5QtsRPCl8UXTtu0tonsELhagxpd6LuPsicAfNNvYix3UZP7EkcYarEWJqu4thRU5hylHoVW51rdFii0bvek5LMcnWOBVnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760568652; c=relaxed/simple;
	bh=s9gvyqIQ/ITNu1mIK9bPaw2rTK5vZqjgAJlhLaXBaD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTSbkC7Onh/lorkTVcHHKgGl0pG/1C6K/1FyDeywMYn/XNzkx5q1fAtbE/rkfH4ljBLpJo91Qo4BjL+MULPdTQdTVSCwHmEuowAPZs5QX+uJ1btErI28jPERkssKOXSPvquOiJdwyQ6g62+CZmUPkg6XCyjeY+AhWa3/utAvR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esXcHjM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3027C4CEF8;
	Wed, 15 Oct 2025 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760568651;
	bh=s9gvyqIQ/ITNu1mIK9bPaw2rTK5vZqjgAJlhLaXBaD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esXcHjM19dxiBMmjYc9Tea0RIJgRrFRTuGKLJMJIovQSUfAV/oqvYpmi/qZrhlVMz
	 Ddyu6WerM3yHzhyQCnSAnsaRA5KILXLTCC+1fzmGQ7iPH9iJUVw0TBzXBHCRl/ywI5
	 +OeY3uNvh4Bd1ZrmtUBmbINCtYH6hHofZ2Xdtjf7X4SnAcyG+zPsWhFtqGq52faWqu
	 +SJjIgRS8HMVE6khN1vPc1JPQ0msfo33aT723gnlAUSbvU9fzNBwH7VSDlHZxz1u7k
	 SDAdCwJb/EDdMBlD8PxhEJseUclOEpx1MAgCP3OUtSYGEDeOFfQVnvqQW+1vXLIrL7
	 9gblHoMB4/PNw==
Date: Thu, 16 Oct 2025 00:50:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>, 
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
References: <20251013060018.43851-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013060018.43851-1-clamor95@gmail.com>

Hi,

On Mon, Oct 13, 2025 at 09:00:15AM +0300, Svyatoslav Ryhel wrote:
> Implement driver for hot-plugged I2C busses, where some devices on
> a bus are hot-pluggable and their presence is indicated by GPIO line.
> This feature is used by the ASUS Transformers family, by the  Microsoft
> Surface RT/2 and maybe more.
> 
> ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
> that line through optional dock accessory. Devices in the dock are
> connected to this i2c line and docks presence is detected by a dedicted
> GPIO.

This is a resend of the previous series. I want to understand
whether this effort can align with what Herve and Luca are
working on. I have not looked into the implementation details
yet, but I want to avoid overlapping or conflicting patches.

Thanks,
Andi

