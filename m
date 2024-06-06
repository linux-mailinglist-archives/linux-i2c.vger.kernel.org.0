Return-Path: <linux-i2c+bounces-3881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A218FDBFE
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 03:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753E01C234CC
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 01:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8F88825;
	Thu,  6 Jun 2024 01:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="a6QwG1+J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F24683;
	Thu,  6 Jun 2024 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717635754; cv=none; b=dsMCU2pP3zpkjb+2P6/NDYTYBPpPBzHs+lwdUkqPW5XiZK4RP1hZHP5XOqRWcrQuX4GzeGaN2jVd922A44OdgnMfF6ET85HF7JY5P04ITFRey4gpKOnOBJoTnK402XNKXi5c+Nj2K7h9+3CFJZZ8g9bHpmFg8KimtUJPn1DAL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717635754; c=relaxed/simple;
	bh=Sk6YBrHyUI9TVmcqBrG3O934lc/IL9MupC9IZikO6V4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KWhE5rZR3ZKeXLXp6RlYxbKUOqtlxyl0AzpjT7DnC4Fjt052wqrrnjch9hhy2ZmWoEt2MB0aLXV6BGzvOP773XGXPpuXC6qDtBy5o3tSD8EzP0/1JdQcpfrxAA4cbQ55iNZQ7FfkeJjxmAshF2+X4XyzsP2FutazohFo0h5uAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=a6QwG1+J; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFF912019A;
	Thu,  6 Jun 2024 09:02:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717635749;
	bh=vAl16jhOUnZ9tQ3HTNy0q9zgou8JX+J4uJEX70eQQas=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a6QwG1+JD5X90B1bRqaQhBMYgVxuOYlUaBMIjoYYWSPS5D4IZQN6DjSP9+3vAjzUz
	 yAP1yUqBY54UzuuOcyD/24+vIXwxyjUb2XUtbpjWwpJ2SHiwfSpwwXvXKUCPxNRGyH
	 0EQZnh9l5jVEL4Rk4U2HPM5mNcgJjMMd71H9Twv/IzvACFgEv6UtGxX8SaLtjYyLgd
	 pXI4Rys+iRa6mdmfJi0qWbCSRBj5szMT5CqY96xLM+MWad05Glwla5dB4xvH4NFJjv
	 O+jbmKtBIU9bzgU02VuAmoNaeLFlM+FWpjWMz1+nMOzQ7GFye9T2pe54RnGrrygo90
	 glzBWJ90n8Iig==
Message-ID: <21490f28ab110ae2eca59ec23591fc9c676361cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 00/40] fsi: Add interrupt support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org, 
	joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org, 
	linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com
Date: Thu, 06 Jun 2024 10:32:27 +0930
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-06-05 at 16:22 -0500, Eddie James wrote:
> Eddie James (40):

...

>=20
>  .../dts/aspeed/aspeed-bmc-ibm-everest.dts     |  32 +-
>  .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
>  .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |  17 +-
>  .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi |  16 +-
>  drivers/fsi/Kconfig                           |   2 +
>  drivers/fsi/fsi-core.c                        | 888 +++++++++++++++---
>  drivers/fsi/fsi-master-aspeed.c               | 431 +++++----
>  drivers/fsi/fsi-master-hub.c                  | 244 ++---
>  drivers/fsi/fsi-master-i2cr.c                 |   2 +-
>  drivers/fsi/fsi-master.h                      |  33 +
>  drivers/fsi/fsi-slave.h                       | 117 +++
>  drivers/i2c/busses/i2c-fsi.c                  | 463 ++++++---
>  drivers/spi/spi-fsi.c                         |  33 +-
>  include/linux/fsi.h                           |   3 +
>  include/trace/events/fsi.h                    | 171 ++--
>  include/trace/events/fsi_master_aspeed.h      |  86 +-
>  include/trace/events/i2c_fsi.h                |  45 +
>  17 files changed, 1897 insertions(+), 687 deletions(-)
>  create mode 100644 include/trace/events/i2c_fsi.h


That's a lot of patches, that span the trees of several maintainers.

What's your expectation for those who should be merging work in this
combined series? Have you had any feedback in that regard?

I'm asking because I need to make a call on what I do with respect to
the Aspeed devicetrees. I think it would clarify responsibility if this
series were split by subsystem. That way I can apply the devicetree
patches and the rest can go through their respective trees.

If there are dependencies that require merging all or none, then it
would be helpful if they were outlined in the cover letter. Even then,
merging the leaves and waiting a cycle might make everyone's lives
easier?

Andrew

