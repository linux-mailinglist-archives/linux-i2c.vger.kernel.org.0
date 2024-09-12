Return-Path: <linux-i2c+bounces-6604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810D97611C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 08:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65AE1F21696
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 06:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5A829406;
	Thu, 12 Sep 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3EsUE3q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A661878
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726121753; cv=none; b=ZRlhHMd5FXbzGlQ8xlV9dP9DPdeGu116LxMudyDPCu68yfkDNmJOoYITXfLzRtpVFyYnPNYIpmAE7KLq7zMlNb0cXO2OhJlQZfPNB4I8b2KU/Ir7VMgwMgibl0fEdeQs2ddd/IoFn1kFV7zX4YWIIO2JcsQMjW8BbuKoYjdMk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726121753; c=relaxed/simple;
	bh=B0lcB0/MKrhEUFmSbVIPNIy/bMdZgveL/f9fWCZRfj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htcQcWwxcsazk/HZAD7ydww7eqE4GT4gJxApL/yeMOiMUgiUKpJzoQKyqCkSXLpLBpis/4QS8HiBd0LaQyykEUXY6oOZSAOfZuz104lV3009kjRmCuWcNbsLSFiXFN8cHCoawAIGZcVjVv2S+nwMRRrxYEOp96+qKs33OmwPmPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3EsUE3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A370BC4CEC6;
	Thu, 12 Sep 2024 06:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726121753;
	bh=B0lcB0/MKrhEUFmSbVIPNIy/bMdZgveL/f9fWCZRfj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k3EsUE3qXGKb3ry3bhWUekQ8UGYxgNd/WlYqxtwVFPpWuCd0Yg9sEZJUBsb47Kf5B
	 oMv4dRB06JtIEVfzkpp1IXaYy869c1nBiM7KKAuzopQJUole8jq9EdkEWd0eSYwQWZ
	 AoeFCyXqayeomM97SD+ZXjk38qaxgp8RvWtXNSGK0ze3rwW6J+Yi17pAmCRnbeR/Yq
	 /oCru6aWZEcuJ1HlVF6+rWvSfEDzSR0YDh10lYqzkcO3nytWLQD9WKDN91rFZOwM01
	 fr022l8LiiPdBgeDYlXNMJgVL9ilLYdD/BtLgVSWF25qhrgvn000RYMYS502gep6qd
	 EG3+02qELG/3Q==
Date: Thu, 12 Sep 2024 08:15:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 1/8] i2c: piix4: Change the signature of
 piix4_transaction function
Message-ID: <gjtjzjana2yrgkcoxets4gtgovnldzd5tbytgzba7unqce7tlm@w6zqwkbbndhd>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911115407.1090046-2-Shyam-sundar.S-k@amd.com>

Hi Shyam,

what does it mean signature? Do you mean "parameter list"?

Andi

On Wed, Sep 11, 2024 at 05:24:00PM GMT, Shyam Sundar S K wrote:
> Currently, `piix4_transaction()` accepts only one parameter, which is the
> `i2c_adapter` information. This approach works well as long as SB800 SMBus
> port accesses are confined to the piix4 driver. However, with the
> implementation of a separate ASF driver and the varying address spaces
> across drivers, it is necessary to change the function signature of
> `piix4_transaction()` to include the port address. This modification
> allows other drivers that use piix4 to pass the specific port details they
> need to operate on.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 4e32d57ae0bf..69b362db6d0c 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -536,10 +536,8 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
>  	return piix4_smba;
>  }
>  
> -static int piix4_transaction(struct i2c_adapter *piix4_adapter)
> +static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
>  {
> -	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(piix4_adapter);
> -	unsigned short piix4_smba = adapdata->smba;
>  	int temp;
>  	int result = 0;
>  	int timeout = 0;
> @@ -675,7 +673,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
>  
>  	outb_p((size & 0x1C) + (ENABLE_INT9 & 1), SMBHSTCNT);
>  
> -	status = piix4_transaction(adap);
> +	status = piix4_transaction(adap, piix4_smba);
>  	if (status)
>  		return status;
>  
> -- 
> 2.25.1
> 

