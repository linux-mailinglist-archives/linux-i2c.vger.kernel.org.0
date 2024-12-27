Return-Path: <linux-i2c+bounces-8775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B979FD7EB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 23:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6252916313C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 22:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29171F76DB;
	Fri, 27 Dec 2024 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyPt0OUW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778FF12C475;
	Fri, 27 Dec 2024 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735337391; cv=none; b=Yscmp0vHUCL8CXtoHnoONKXzA5FON1NGO1/3DeAVVVdckgnuTwW67QLQ0RCDxbAf5ZYCalGeqp0IlQT8uaNffXOfBgqdrc/mIstzXsuCEcAvD4u/twR9hNAJ7ChsnZsa6a8QKWug49tujjb8bO8Ct1TAYyZdBe3GIlyrzDjkZps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735337391; c=relaxed/simple;
	bh=Gy7RQh43p81red2VPwbsXvh8YfkHq1heFjtuOnZf4eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdS4j9A6+gX+1xdY42NMGKn67sWkEoUKYBYIK5KymwofCE5VF30D5SvJ4x7B/HH8mL38ZwbYMrEIZLiQ9/9gczVvoDc515O68dleplrCTTzJ+ELSICAi7rEBT1Zo3Hrp87/MIGM0/CELWjp593LAHp1nKHjp8N6/q3Al13Cumls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyPt0OUW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE59C4CED0;
	Fri, 27 Dec 2024 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735337391;
	bh=Gy7RQh43p81red2VPwbsXvh8YfkHq1heFjtuOnZf4eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyPt0OUW/c4pxG1tG9qOmg9Ru2qnoqFv7b2m6OLSUlaqkt6+yrbTPOhmr776PGa4G
	 Hlmq/lUUtECGt/KHm4oF+SI/pj3rYK+dlHCsciy8KOI3Vb9OqLISaOPcehJnVf5eFz
	 1cFXK0R+vM7O4XTTB3A0QoNjP2TpRIQLkqnQDSj8dQuJr2HghJMoigIlfYSoidvOOq
	 dsg1z9RHqUvhyO41I7eRA5WY9XWVzoUotmtZCYf+dwIe9kKqJBb2IvjQb29jc07SY7
	 cwdQawAhcbRx4PFtZF/geVeQc1vOECEvEez+zCRGDZT19Mdf6Z6pvatunPvPNKieP4
	 h4DhlXytL6N8g==
Date: Fri, 27 Dec 2024 23:09:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, frank.li@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: imx-lpi2c: add target mode support
Message-ID: <bnc3walr3iemiz4ljb4agoer7moevnph4sm4x34nc7ybo3irhk@z65dk3nvr66u>
References: <20241227072857.1146099-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227072857.1146099-1-carlos.song@nxp.com>

Hi Carlos,

On Fri, Dec 27, 2024 at 03:28:57PM +0800, Carlos Song wrote:
> LPI2C support master controller and target controller enabled
> simultaneously. Both controllers share the same SDA/SCL lines
> and interrupt source but has a separate control and status
> registers. When target is enabled and an interrupt has been
> triggered, target register status will be checked to determine
> IRQ source. Then enter the corresponding interrupt handler
> function of master or target to handle the interrupt event.
> 
> This patch supports basic target data read/write operations in
> 7-bit target address. LPI2C target mode can be enabled by using
> I2C slave backend. I2C slave backend behaves like a standard I2C
> client. For simple use and test, Linux I2C slave EEPROM backend
> can be used.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

