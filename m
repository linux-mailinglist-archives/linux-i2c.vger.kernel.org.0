Return-Path: <linux-i2c+bounces-2288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE687644C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F951C2110C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6155731B;
	Fri,  8 Mar 2024 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG1/jAKL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F356762;
	Fri,  8 Mar 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709900910; cv=none; b=jLwxv5YAYRFj4uAAkzToTqtTcKCD4CSfL5/P08/SbNVkAMKi7GqctHKmGKePCQNRofDDmDv79tSeaB99/CqQmkVuA35mBX6nUMZDWeyc1lKkeQ6H2QxUzGXq3idyXk7y3gFTv3Dc/+0dICtDmUDUF+usNh725k+56yn8IWlWcCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709900910; c=relaxed/simple;
	bh=G3abgL7lSZKNvx+oCpQFpD2Hau/UhMQditlHgaJLjag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKlrg9zfsYJ5IRTytwzJImpCXN8/hnuBzaPmZecxwbLDoyYVsM/q4q7ygwailP9MXSLYQEE3M13oBjZ0W6e8RG4nBHjJnAVneslWZO2CWuusn4ikxb28zalV5vXISbzHc5HeH1/xgDpL45CB3SPFSN07eB7XEzkO5MGq5c+ikMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG1/jAKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CFAC433C7;
	Fri,  8 Mar 2024 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709900909;
	bh=G3abgL7lSZKNvx+oCpQFpD2Hau/UhMQditlHgaJLjag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YG1/jAKLIKVcc4uM70e5mtEWDGWBuBYn3wgiVHBnglwEr/qT3l1pWU6zzWpWDcxe5
	 SWi4kasxfdKcQbkuEhJg2NDhDUVMlSTtPCiqcECOv1om6Wr8+TjDSTWkWdVv7q9IQU
	 lU2/Mor4M1AomR+kI0uXGdmN9r72+7H1wRImKqXZ7sjXxy3WXcap8Ww8sSz8/Czlki
	 hOO6VI/JxgQTMPdpV1c7scx0HKiSDWl8t7Q4j4lrRFO11p5Mb69t+ogHzL6PVroJmh
	 d2QoIYrb2+dyOgJpnaieB2Kvc+ux4L53hGghFkf8naGcM4eqKxjlhzKQlFOnAfVk16
	 U63Nav73VrYCA==
Date: Fri, 8 Mar 2024 13:28:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 08/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Message-ID: <inf7gsz4a655brkem6zj37knx5zspaiv6tzth4pbaj2mcr443y@aj6eoqjrusor>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>
 <xy2nxcjxkw6pkprrjx2sol62xvq2nr3ukdwpn4h3wuwpnnu43j@2djyqtkdpcwc>
 <CZO97FHGERJG.37RVSW2CIYP7R@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CZO97FHGERJG.37RVSW2CIYP7R@bootlin.com>

Hi Theo,

> > Looks good!
> >
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> Thanks Andi! Any chance of seeing this series queued for v6.9?

I'll try to sneak it in in a last minute pull request.

Andi

