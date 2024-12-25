Return-Path: <linux-i2c+bounces-8708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC209FC6AD
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 23:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06EF91882DF7
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 22:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44B5156C6A;
	Wed, 25 Dec 2024 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVfuuWlz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E201BC3F;
	Wed, 25 Dec 2024 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735167165; cv=none; b=ZJPx4wX5aRKEjkQFOJAl/d/jOMCgld95gZ8oJT25TiUBHshHL1I7AcAZF5jnPhllKiEVdryfuOxKswLSQMzCbvOhgQt/R3o+D3jpmhVLgbb2LaEW83tOsfy3id7ykTTfOPpQ/G2n8bN6B7bd/3zbtCLTKbg9VGPUYivOogPMqfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735167165; c=relaxed/simple;
	bh=nubzzPhGve0/s0biOhKXPj+keSPBoyokkW6/wjH4feA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWWU58nR00dmPMvlkv27klgc0SdJW54VXg3LOGG8fW40B2Bdkn8zimT32AOk8VyWd45W1bR5fn4Xq4EZor5Q1OYA5GWX3wPXLDr4DsmgnjuLbl2XNZEGsN5bIHo3RYygE69YKP8I3+p5A6EwCyLvWDnxxhEDc+lpb9+QMLKKl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVfuuWlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF40C4CECD;
	Wed, 25 Dec 2024 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735167165;
	bh=nubzzPhGve0/s0biOhKXPj+keSPBoyokkW6/wjH4feA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVfuuWlzerb6qv9akpsWm9tlGYrcY4D4blMrqIibhULjbB7gyCjmeGiYGc7hwlZB6
	 bGX8QdaRR5fEQUA1LiANzegLxR6jUPlrvXNSyUtGRXe/lbJtccUGGQkJWrsZXBoKI+
	 fBJu4A+TlGhV3CiTlZYh0qSSqOFTm5bt31LIOB0FbiAFLKtjMdeoVQ/0Wq9piry2jA
	 ldLlfWW8jVxoKs3VbqkVAEbo+7wnUQCKJbTIa763vPV/hfc7aEtR/bs+f0tlKVohJ2
	 aedGgXgmlGPGb0G2dRBTBgnUWdMboY+5YkLun6mtLgQglauqf+IHtLpit5XgoQXh8h
	 4DGj2Ekvl7jPA==
Date: Wed, 25 Dec 2024 23:52:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: switch different pinctrl state in different
 system power status
Message-ID: <inrb2afgefwxc2n4dqooj7cixkpr7vm3ub2osj7qotgt6brx5d@fifvmmp5mkay>
References: <20241223034343.544002-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223034343.544002-1-carlos.song@nxp.com>

Hi Carlos,

On Mon, Dec 23, 2024 at 11:43:43AM +0800, Carlos Song wrote:
> Switch different pinctrl state in different system power status.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

