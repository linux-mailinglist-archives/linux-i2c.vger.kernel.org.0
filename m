Return-Path: <linux-i2c+bounces-4858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9F92DB41
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CA6BB22799
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C040113C80C;
	Wed, 10 Jul 2024 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtuDVZoC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9C3AC0C;
	Wed, 10 Jul 2024 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648168; cv=none; b=tS1dGMD2jO2St3uB5fgve5br97mFP21Bp/OzXybsb3xzZ/6ZH+uoTPGCBo7uYijys0Aiq8ALTwM4fjKvPv0rjuRHR5NaSjbWnYZg0g4Fc+D53QVhVbPqvvn+YJw8hiIDtD1rgHJ1rRaI4qVNXUJLKl99QmJnpllvDG/HENXZ2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648168; c=relaxed/simple;
	bh=XwKDnHcxR6ZO6eLa8B+7iGwCfpUqPLQSwDL3DIPuC1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPsNhcHGVCgTopc6EAxzH/oZHSu5Cgje/4pzoORg46T+Z8BrFdcWTIHszMHoeaPSrtiSotB0nEfSSXoJbEVQC7xPs4ANwsxrWmb80xmqXcJUEfofJevqH4X6EazSIuMhR+VjzZXk2gebcLBlN6TWAeMX8EpITqH3XJKt/26qz2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtuDVZoC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6897C32781;
	Wed, 10 Jul 2024 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648168;
	bh=XwKDnHcxR6ZO6eLa8B+7iGwCfpUqPLQSwDL3DIPuC1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtuDVZoCSThYLs6Cjx4ueWG4RhlQRpunKeguJ50q2WdArKkH16Li8h6MczYtVudOy
	 OAQTMLgZWjsn5YGjk+dTLoVdwMSlHe1/PxCol/ESmmYpzQfss+NoaYv1VtXXV1t7FC
	 oxe+FJlPi9OzjEOyXL/jTS3fZV6q768b7VO6WSnIuT4gkmJnzuSukrN5oTl1D1z2d8
	 +pB5y7HvaTUel0WXCYS9/gbjTS5v6CIBK9uNFmXdndUfXAQaH3//Bgl28HX2wGCKR1
	 YLh5Qzk6AU2IFnNAFjst9Uy4pptcwh9HfZ1ptlPfMbFmjIh+EwPRFoO4NWWfFG68Fe
	 tojBQuhmN7mdQ==
Date: Wed, 10 Jul 2024 23:49:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 26/60] i2c: ljca: reword according to newest
 specification
Message-ID: <ifmwwl42s737wfe4g3p63cc2ekv727cofhskvxui2kfvcvbahj@2nwaqkm64raf>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-27-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-27-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:26PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-ljca.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
> index b4927622177c..0b70621cf9d3 100644
> --- a/drivers/i2c/busses/i2c-ljca.c
> +++ b/drivers/i2c/busses/i2c-ljca.c
> @@ -76,7 +76,7 @@ static int ljca_i2c_init(struct ljca_i2c_dev *ljca_i2c, u8 id)
>  	return ret < 0 ? ret : 0;
>  }
>  
> -static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
> +static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 target_addr,
>  			  enum ljca_xfer_type type)
>  {
>  	struct ljca_i2c_rw_packet *w_packet =
> @@ -88,7 +88,7 @@ static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
>  
>  	w_packet->id = ljca_i2c->i2c_info->id;
>  	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
> -	w_packet->data[0] = (slave_addr << 1) | type;
> +	w_packet->data[0] = (target_addr << 1) | type;
>  
>  	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, (u8 *)w_packet,
>  			    struct_size(w_packet, data, 1), (u8 *)r_packet,
> @@ -107,7 +107,7 @@ static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
>  	return 0;
>  }
>  
> -static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr)
> +static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 target_addr)

Actually here the target address is not even used.

I will send a patch to remove it. As for this patch:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

