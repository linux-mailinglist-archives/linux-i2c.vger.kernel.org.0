Return-Path: <linux-i2c+bounces-4885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AC92E17E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E72101F21C6D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F071914B978;
	Thu, 11 Jul 2024 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIJJs4Ai"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81F3D548;
	Thu, 11 Jul 2024 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685221; cv=none; b=iHpJDTQFQ8LZ+YU4xNbhsdk7qb0pEgV2f9xx8ktoAly69emrE0lRtNs26av1BD8Sik4zTWd1BP+EJkMfqUcNwjxZsIOf629nTJlE0/MzCOaYbl6iIn7z5CVEF4FXAJwwpDrXtPhcnS0E2F5BLcCtkA/PRSoCGOmtr3x8c/vR1gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685221; c=relaxed/simple;
	bh=ya42iC1HaLU1+9FUVqJrobHOEo6l7IYp3aDbWOkHNK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2YPj7SwR1N1gYknMP1092+f0Geu4kXcIkTnLKN3yCsGUuHoA1stH7590UJlASVxAXdKmF+BGAfNmuyTEm+IHXmQ94dbj4Az9jBDXYX11VUJzCcpn6JHeUrIn+Rsms4aaUTupQfms5b2CBa4ojpFa6MuOI0GRqFrhLzeIiKCsuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIJJs4Ai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEFAC4AF0B;
	Thu, 11 Jul 2024 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685221;
	bh=ya42iC1HaLU1+9FUVqJrobHOEo6l7IYp3aDbWOkHNK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIJJs4AizH3w5A+rYyO7E2y0RShss1tf4l6Oh8V7ux9iE807ydWM1PzPGgGUXWL6o
	 f4T+FMLJKjixXexv1v60rAClycSecftcDXZQSUOcAekrQH15R7AeyvV5Mgwg3WQXBn
	 2qbP/xuNgc/UXU97ENvu/2IQ6NvTAcoZRaDD900DW7tCPNhqbaNRiJYbQyppvJeguf
	 Hha4zgsUgy1b8bV3gDaWCP2F+/I60IN3W4sN6Opyp8uhVlFwB9j1k403P7l+OtLiRB
	 UPe9/YKAkGZrMKuHT6Kg8ytmOADIWBDydeCcsG1J0svrr0o0qZjgxTXTkk4YAfV778
	 3VQ5U46CFNfXA==
Date: Thu, 11 Jul 2024 10:06:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 36/60] i2c: owl: reword according to newest
 specification
Message-ID: <cwo4ksmjohvzvvnkqficablqcik3oo3bzqyonm6m53trkkk6o5@dib5q626dl7i>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-37-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-37-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:36PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

