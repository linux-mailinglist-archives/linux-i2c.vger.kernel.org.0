Return-Path: <linux-i2c+bounces-10468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435AA9225D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 18:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBFAB7B146B
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 16:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA0B25485B;
	Thu, 17 Apr 2025 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCD+0vPV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2C2236EF;
	Thu, 17 Apr 2025 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906299; cv=none; b=ZobiYTFy216rLsks6Yb6lAHT1rH3+IetEMph7CfpgW86bLf+WIbYp0zGPOP+NeJUcNBGX2DWZ16IjMZGhGVNXLgkRdl7aHAc+KIWDwAzjselgnikmUGruyu6O7g1wpBeF2geYx8Kn3oYddGIoRiX4QZBFE6PpbubbJ4FL1iJuKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906299; c=relaxed/simple;
	bh=PKyTrfEuurXxihtN12vI8NuAEhUtn57gwj36sy0sUYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/7cJcosuxWIjB8he8SsqujMIFtcd48zWDwGDl0UufOBooEHyg/ZP1o6N6j+IfVFlh379xkwMI/dvq7KfkND6hwrv6YmZqMj4sH4j3Xd4h+Mx0UnqLTRz1MS11GUaq7dRtF/tkt0PAKLqnj/bnBQBo3vJ8gU0BFk/qIKegCWwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCD+0vPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D088C4CEE4;
	Thu, 17 Apr 2025 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744906299;
	bh=PKyTrfEuurXxihtN12vI8NuAEhUtn57gwj36sy0sUYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCD+0vPVYt8lxFPizihBcQn3MUxV7msoi9R/0BSSqif6oAzf6csPfNORTq9d29CCi
	 7jgxjJAP34YLUrgTshKOP6UGPJ/6eFcAy+ja/nj6yGS7fXBJe9STfgVGbCRAT/+w5n
	 IPTj7wBWnLTmEGUwuEr9nZgMDqNeb3jKSEVBXSpjNW5iE4XfWM5tvwzLfnQiSLBeOR
	 yk5C2cMlMg7Begf9t4GDRwo6AZVvjXF85v+cXEe+vyInuCkIwWTaGT+M3l8s7cjn4J
	 CWh4geb5bvrrCkC47wO/NhqxG2AiARSAyayY5+mgG9Nmv2IoCjHT23rNLUxMbsvE7u
	 lY/UfMKhaQ9jw==
Date: Thu, 17 Apr 2025 18:11:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
Message-ID: <npt666jrmw4qhesdwup4khufkxczy3zkf4sd4ygjx6dl6joas2@pb2jumja7cgb>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
 <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
 <CAHdq5QHUeMk4WLf8uGz78KagN3WSvS_skhvKFMqUD5YkwJOOkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHdq5QHUeMk4WLf8uGz78KagN3WSvS_skhvKFMqUD5YkwJOOkg@mail.gmail.com>

Hi Mohammed,

...

> > > +                              npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> > > +             if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> > > +                     dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
> > > +                             bus->num, npcm_i2c_get_SDA(&bus->adap),
> > > +                             npcm_i2c_get_SCL(&bus->adap));
> > > +                     return -ENXIO;
> >
> > why don't we return the error coming from
> > npcm_i2c_recovery_tgclk() instead of forcing it to ENXIO?
> 
> The error that comes from the current driver is only -ENOTRECOVERABLE.
> I do not see why we cannot return that error instead. I understand the
> difference between both states; however, from the driver's
> perspective, on initialization, ENXIO and ENOTRECOVERABLE behavior is
> identical in that state.

I think it makes more sense to return the error we receive from
npcm_i2c_recovery_tgclk(). Then we can discuss whether that error
is correct or not, but that's a different topic.

> ENXIO was what the driver returned by default without trying to
> recover. Do you recommend changing it? Let me know. I am happy to send
> the v5 patch with the change and address the above comments, too.

Yes, please do.

Andi

