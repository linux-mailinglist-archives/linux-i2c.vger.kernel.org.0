Return-Path: <linux-i2c+bounces-10989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAABAB6FF4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 17:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4B03BA5F2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 15:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1971E7C24;
	Wed, 14 May 2025 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/1r6hnr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF86342;
	Wed, 14 May 2025 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236724; cv=none; b=T24kc+FvUeB73SHpqKaarl4zJGdajZ4lhNgAH546aX34nETZrzUwNQzjtGgrU3ldm24gYfWig8g48cxxRHnTd/7dogxgEvBayMIsY23cxdm+lF3TIzvTr0H2WvhANDSuP5A8Ur0dLdUz1HCS1SlpzODTZQUjSrqonIPGYPE1MUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236724; c=relaxed/simple;
	bh=ihibllTK5dNCmqfG3tHi2CbY4kCGDEdbxwlZxVd311c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXh3pur5gH+Ezc+/opSvBUkWu0+pAU4Ql2jFUfbEhy5D1t0PkIIsUkQeYkRInNv9BhOcIz2zFULhjtxnoG9oJd1A6HwXXDHQZdqoyJmlHRJAWFwT7IPpF1FjhBd0+Adsrwr9ylPQ9PugC6vhY+BC4n523ex4nEkqUUStRiEI+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/1r6hnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53615C4CEE9;
	Wed, 14 May 2025 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747236723;
	bh=ihibllTK5dNCmqfG3tHi2CbY4kCGDEdbxwlZxVd311c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/1r6hnroO6sRKCZTeKK8nUJy754L3JPrwucXbKnenZfru2xcZH1pqwakgbHl8/Sm
	 5sQAjzAo7kx5rfsxAoz5fcw898u6+28lZWXAWcT1l7aLHn8FjJMiJet8SToU9Inpej
	 d8uLMrr04xssUkZ6R/NTOdnjz24rY0/OkSeZI3dbj0W0MqzG7MuOlI8BepyGkrzmpU
	 Gcual0K5jAZDmJ4fm6Arh8lLbiaYZMR7vYIzcv21t5Uv2phIdzzvkVn/Tm5UrATj1h
	 eJcsVjRpvh31+H/sECUOQQ65HROx5p8s2XnI40t+FF7rpzK/a1+jSwsXCY70pSSiJS
	 kk0QxhBzLEJ9w==
Date: Wed, 14 May 2025 17:31:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Sanket Goswami <Sanket.Goswami@amd.com>, 
	Wolfram Sang <wsa@kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Fix an error handling path in
 i2c_dw_pci_probe()
Message-ID: <757u65xqcuadsr5uteb5x6vnnps4wq3tqrheexxekuf2mxnbj2@wdjzz7wkjdkb>
References: <fcd9651835a32979df8802b2db9504c523a8ebbb.1747158983.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcd9651835a32979df8802b2db9504c523a8ebbb.1747158983.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Tue, May 13, 2025 at 07:56:41PM +0200, Christophe JAILLET wrote:
> If navi_amd_register_client() fails, the previous i2c_dw_probe() call
> should be undone by a corresponding i2c_del_adapter() call, as already done
> in the remove function.
> 
> Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

