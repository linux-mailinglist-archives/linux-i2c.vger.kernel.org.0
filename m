Return-Path: <linux-i2c+bounces-8811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D79FE1B2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ACA818818F6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 02:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078172AF0E;
	Mon, 30 Dec 2024 02:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrbG963x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4B3C30;
	Mon, 30 Dec 2024 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524198; cv=none; b=lNe8hTlYKk5gm2Mc5/npE8OmE9Zl+SCslEBMbc9cwCAcm02w6+A2ciJkJJKcbLlDnpY/QH41Lrw83T/fb2xABG0sJY6sSo0fyW19/U3i4qPuZGChAVRO6QEsWvuoIW+Q3hDwP6+E4KuiK/7X8qlp3oSv4BpytuNVQoHSSMaYXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524198; c=relaxed/simple;
	bh=GSaXRjF4QnigYAPirmIr7KU+v7YajcIusLdZQfk0afw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHbSQ40xRW5y5TXfIT+Kof559wuh5dsfsoOc3a7Kplb3zIQY9t91+OJ4M8LfR22ATk9syg30uW9tqpqgGUsH2EfDBxv0SZYeilGv3vybBlnJgL18nGXS3AFekTufSNli6dcPpLy4ksu6yXaCv2iJXyZyjY+ImswjQK/aUE1PFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrbG963x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06E8C4CED1;
	Mon, 30 Dec 2024 02:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735524198;
	bh=GSaXRjF4QnigYAPirmIr7KU+v7YajcIusLdZQfk0afw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrbG963xteurLuSf6i0damL07HATotkzO4CAYysknccmWST/RF3H6h7+/HIA3GOmg
	 OZWbgopd7CX94sWl7gpbRr8cNxFhkW6buuptgkLzebOsg4orqhdjKMyWTQ4If9HCM6
	 XlW7qOky0moQ1VrQbzR/ZEOAhpF5zS660q48ZNq+Tun42l6ybGZu0mme72DHbfpU5I
	 0BbscYTpJnbXct0FBwbqepp7WEn7McI52ReSSFrsKsCEILpYSs2IPw73BenNXylt4G
	 RDdSCgc0KUrhpqNNju65/6xB9KW5Ps0Rxq3cz1DfRYB6E0m5ZTGde7B/x3DYqbjGAR
	 8Gm834g/Z91RA==
Date: Mon, 30 Dec 2024 03:03:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <xvercm2x7t7pnlkjlfouobjgotnsona55z7uxwzmbjia64boe4@g4pvesirt5im>
References: <20241227132250.14435-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227132250.14435-1-evepolonium@gmail.com>

Hi Atharva,

On Fri, Dec 27, 2024 at 06:52:49PM +0530, Atharva Tiwari wrote:
> Ensure correct handling of "endianness"
> for word-sized data in amd756_access
> 
>  - Convert word data into little-endian using cpu_to_le16
>  - Convert word data from little-endian 
>    to cpu native format using le16_to_cpu
> 
> This fixes poteential issues on big-endian systems and
> ensure proper byte ordering for SMBus word transacitions
> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi

