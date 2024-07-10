Return-Path: <linux-i2c+bounces-4854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F192DB2F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7080D1C2123A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2890F13C3F2;
	Wed, 10 Jul 2024 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkVzWwQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7F13B59F;
	Wed, 10 Jul 2024 21:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647879; cv=none; b=h/9kOpWqQfDT2RbcwZQD81ramFx3OYx7t+8o5yXvJhbY/ptZkijnwc6mL6vkZ6ELoM7uK1CBJJfPBR3RuUIGr6jp1LH3NL0M6rNDk5Jam+yBqHVdM+jkhLsMCu2MQzr+t1Avb2O43aJiHCtCMClhEDoJjly/9YA+IbTOSVkNX5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647879; c=relaxed/simple;
	bh=xFpR2KqJN8kU5DUfiAuThPM024QnoKAyoRf86+QYcH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZKPS6NrG3aI8X2Tc++rGt3kcHYqssp0kfmG6rLFNm0Tt8taGmpQ4ywnRM2rcVRHf0OaoTIkKi1y2qLa+kBJBnJPIjF1riF1NQo43N1u928YrwcEBR5qHPXbmW/2UV97IODGj5Ra3IVvtYVzJqX5waHiks1BWQV0kA5AIHDZjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkVzWwQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7631C32781;
	Wed, 10 Jul 2024 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720647879;
	bh=xFpR2KqJN8kU5DUfiAuThPM024QnoKAyoRf86+QYcH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkVzWwQfDJrmpcminKTctlZ36YitHgGkwmlwAWNzvP3lbWRDEgoEfyHvO2vpltRvz
	 1Iq4/5pWKeSS5CbR8leClsyik9oLTfOGI8UEBgeKvxL7DeGNs3GJXje5DfKhz8l5ly
	 rRreYfjb/gCSr+fiXcWet9J+5g5AN/V6d64RsXOEtW8muEJasxo0VdA3vmJ0j134yi
	 d7I+ZpKVBYBmzPOOnZOWtuo5kmuU21VjGH+LzOMWVs+buStjk9KtlhTiyuwC/Hwhmn
	 Y6FKc7Wy4jDBb0j4oNAlJGNAAXYrLXUqPKWTgNlWUGkOV5Vn1R6LyqepsznGk0XIH8
	 TyK23krNhSrWw==
Date: Wed, 10 Jul 2024 23:44:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 22/60] i2c: iop3xx: reword according to newest
 specification
Message-ID: <2ez5zpt7n3n42pwd5dxyxskbm674iifsixustgispahethonds@m2nechcwlk7g>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-23-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-23-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:22PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> Remove a useless comment while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

