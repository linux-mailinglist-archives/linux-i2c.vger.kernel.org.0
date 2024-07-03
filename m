Return-Path: <linux-i2c+bounces-4616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3492926AB1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 23:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 609F8B26026
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 21:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A8F190694;
	Wed,  3 Jul 2024 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gdc7iCkV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2421891B6;
	Wed,  3 Jul 2024 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720043179; cv=none; b=Rw5hFsYbr56gqlDDIlxdE2HxCdidyhHghViDjIPXL+gFKvX1P8OrFZWrweOZxNM38H/uRT1fltskwtqQgrDDJb8+DgTd6cJ9SAJNJ8OEqkPdma/CXRpJQleRMUn8/q1It7VMHz/I1qO8vztggsoSJRbUTMsXkVFdV0Mjl5xORio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720043179; c=relaxed/simple;
	bh=agN1VFzDdSLqPGLpdAw2jOT8E3vfw5rnSDl00bt8rXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCdOnbBHWoqueKtfgWblCI3ghCqf80qV05M1c6xPQCXDLJibx1kYIObALZtD09NdTKDUeiA+DiIJZqAHueZpvIC0SRNAMp0W7lgpwnNz7/EI+vlJSIe9VAmdSkx9exk3AZbULDJvqgPiqIT8SW0FxJAJ1/orCC15K4ER6kYBJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gdc7iCkV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA479C2BD10;
	Wed,  3 Jul 2024 21:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720043178;
	bh=agN1VFzDdSLqPGLpdAw2jOT8E3vfw5rnSDl00bt8rXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gdc7iCkVppWzHjS83RRYkXW6FN+Klufs1dzRzyc9iBQccC1qZk/dInQeqwp9c/1e2
	 266xKCpOzDfPvwJ64pLeZZqohLscOLhoj+OUPmRqbDBMa1DugtSBjV7ZADOsytNSxv
	 vEPXRi/knskr5XNWEhazzUbmOqvMv89on6hlw44+/tkpeViDSOa5+vBIJEo4IkTIa4
	 7/AgfsDYwwTyyFYg3/HgvEFhGQc82TtnPfUoKxWUgl8eN0IPKDEFwRPd0l6cmLJehY
	 Iqmfom11DJyQ7KUeVQkQz/3o+wsSRgtbvqnqZImJ46ivLyAwSPpAXGzzmYwCYN/k8J
	 NfzFepA9Z/v7w==
Date: Wed, 3 Jul 2024 23:46:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: gupt21@gmail.com, jikos@kernel.org, bentiss@kernel.org, 
	Jonathan.Cameron@huawei.com, matt@ranostay.sg, linux-i2c@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: Remove unneeded semicolon
Message-ID: <mqqatbuibseyxxtz44wialt2tlzihosdvlv2ajhh3y5jcfe3qj@gdsj6baftv5f>
References: <20240701071639.846169-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701071639.846169-1-nichen@iscas.ac.cn>

On Mon, Jul 01, 2024 at 03:16:39PM GMT, Chen Ni wrote:
> Remove unneeded semicolon.

Please be a bit more precise: "Remove unnecessary semicolon at
the end of the switch statement"

> This is detected by coccinelle.
> 
> Fixes: 960f9df7c620 ("HID: mcp2221: add ADC/DAC support via iio subsystem")

No need for the Fixes tag here.

Andi

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/hid/hid-mcp2221.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index da5ea5a23b08..0f93c22a479f 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -1048,7 +1048,7 @@ static int mcp_iio_channels(struct mcp2221 *mcp)
>  			break;
>  		default:
>  			continue;
> -		};
> +		}
>  
>  		chan->type = IIO_VOLTAGE;
>  		chan->indexed = 1;
> -- 
> 2.25.1
> 

