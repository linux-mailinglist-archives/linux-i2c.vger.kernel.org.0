Return-Path: <linux-i2c+bounces-4818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344792CC66
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 779402847B4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB085931;
	Wed, 10 Jul 2024 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wa+yGhgz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA63A8E4;
	Wed, 10 Jul 2024 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598536; cv=none; b=QTpXOQKMb2uk9zOVGeGpXcQTSegMWwDiQ7tBgCKGO56bOf0O/sJuIlEY/O4FECoaS4paKmlC+vuaL0/QfDuA2zPpVcLc09Pci9ep9XyamtbdisM6mYlK2TbgBwTiQGYZ9CJkvvxqAqRBp2yKjKH9hkHHyyevPVFeOeJxQb90T9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598536; c=relaxed/simple;
	bh=tsVFU6PpPDag/m1vEhJjAgzkLvickuoY8VN/4QbAiBg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex2iCTJ2Jpde+c8iQmOfavCoqMPDRLnzTxjLkHBM+gj+HzQ8lFsiF2XU9T4WcNp8fByPkGr7Lw5JFZKpkahQPwr87BaqX9HTdxIQWQsl8QvuegPAPreJwSb9SxlfWPh+RwJUvZNA5BwlHw0oMSGpDEKmbMDFRXlHCury1GX2GRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wa+yGhgz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EBFC32781;
	Wed, 10 Jul 2024 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598536;
	bh=tsVFU6PpPDag/m1vEhJjAgzkLvickuoY8VN/4QbAiBg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Wa+yGhgzIUvoAWYtoMybC8N22r5vfYvhr61hvbjZvDvWA4z4t7LI2OudZtzgYkNNh
	 jf8xVEe+PDEbrTiufzJchsiz2ONbvxHkD1uzDrhmd1IAZeajbmvr78Ia+hrQfuAO6g
	 RFilcvM23EVAYz5rg3dBePMCXNJlxP0Q4aQn4GiLYnpP/nZ2u6IJhjY88Om9B9Ni7C
	 YS4hwATG43cJA4cbsfVkvKWjx3YMRY14M4kbWJP05XtetciUErF8xXw39VRdIfW3Pc
	 MFSkOMJqwYv4QYAAeOEKyDHAGFIEO6UJg7a1kmsCsMVowtWAoGgxuVLbberD84FaU0
	 NqO5k6bZM44eQ==
Date: Wed, 10 Jul 2024 10:02:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Message-ID: <k2uzki2fvxzp5sexkgaevdvri5kiw3vrsb5psy4lv4q7idkjlt@vubcmobiyqfv>
References: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
 <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>
 <Zop2vNCrzDmEKKiO@shikoro>
 <Zou2g8nGBD7Pv8kR@shikoro>
 <5trq7ondxem43rfnckonywhrucvjvecc52pvyik2fsz64ivknv@r22caitz5y3s>
 <Zo4qVeIjGCQH5zXn@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo4qVeIjGCQH5zXn@shikoro>

Hi Wolfram,

> > That's OK... if you want I can remove those blank lines before
> > applying them, it's just two cases in your patch.
> 
> Then, please do that. Thanks!

done! Applied 2 and 3 to i2c/i2c-host.

Thanks,
Andi

