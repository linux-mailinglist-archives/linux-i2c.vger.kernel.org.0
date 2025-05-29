Return-Path: <linux-i2c+bounces-11155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C416AAC7FF1
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 16:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C02CD7A126F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 14:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FF3210FB;
	Thu, 29 May 2025 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OX2JVplO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13840BF5;
	Thu, 29 May 2025 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748530726; cv=none; b=NOdce1Dj1GYdBEckkCFd8M5Vfo7ht/XJPUyVxbUghcu9qPM/57gJn9pbRlahPmNzbPdIICtydwm4vM6dKDq23sQkM0gIfAgIjQlAj+J84N3AGe+HdvgvIx1RJP7HQeO1v8lhbcOG5DNX/AC0oprAAyhNS1wpU2wg4jQoh5M4hPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748530726; c=relaxed/simple;
	bh=Gj43M2OdGB7+ObhhmKp+QmuqAFhLuSNYp+6yibi2rPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHbdaFlH2H+St6YKfSjY9igFhSqTFj+xuHmB7ed+M4/17IW9m78O9qVGO3LFKAP5IQKAjXTT9CRVsL7fnJaI9aOfRUWg6dkX2rFZPQj86zLJpikzrY+/0pedKKFC3ik8r7NeZDKZ13DoljrRPaP3cU2Gtlw1/GQTY2p+JvHgkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OX2JVplO; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1183417b3a.2;
        Thu, 29 May 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748530725; x=1749135525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62giXWg7WsEB0ulrJR1t2wvmt+DLs2PIJk6M7yXmcBE=;
        b=OX2JVplOUZPrI9l9Aw3xboNOlQWTcYhCpeCxEabpxcxYOwe28Xk7jvcDJ16cd6xFjA
         1b41WsylxpG6u+sausHQs9kFlvpQaPP1gT1iIzfx9riYhSBd+9GWLMhPzL/kN88NRcP8
         APU61vHdG6iCoUtUTYoybD1GPaCLTSToE2/PJXOSEc/azJwIIuihWbc1emMXCFbgaUwn
         8mFKk3GTzPqUJG6fT41Gglu/DAhqNu/OEZrgwPO3wJlSUvP290gQ7wWjYghRgF3HWv3e
         fag4OnP1tpqeLkuZBJtMZpk25K41J6OKLM9gISpNxmvmDmELfAfFO5PV0KiAnTBeO6to
         FAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748530725; x=1749135525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62giXWg7WsEB0ulrJR1t2wvmt+DLs2PIJk6M7yXmcBE=;
        b=rODEHE3F+45Eag9sAHV5ev/spxf1btQ4YBXbzLjNO81Ouv9qLb3PcahEYCh+usjrZY
         ue6KLo7bfpManF+pI+GKiyixseDdnECKNiIoa6x+q/EQzpSXUV1Wtd2+MSBSvV8lZHrB
         qCU2eHJV79rVycDotiO4etLOfY6SbKC7muhvia0to7NK48yp/aRWUCGmPAYPxE7CfzKl
         AlWkkTDFx3othXw1fl5PTuBSyXYjN9EjogF+B3coLeZi7iBb/C+VJ9Crsckwp6lHtz5e
         B7Au/8HagLQVC+7S0C2a8tbU6ZCcSkU9MIF38toURAzNov8Xidrphr5WWALnop1Elr01
         D30Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkRvC8DrF57zZpUefkVnIWXJ8LTmv+gPovgYFdV2XaGOU5RMs1zOKrO4jroD6+uSvOCcu4eqmIhqP+36H5@vger.kernel.org, AJvYcCXs7Gm+wKBYsGynj2Gif63HVw0K1QRV3OD70gUdHRDotcjFlZKWrwDvB9dzZhyGTWlY/cCVC62CBbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVRVW2CG1wjlUUpfnde+NXtqEMeOVjRrBOif0PVgTWk2W/aSDO
	6o9txiBQSWMKrMFQ9yRxXBsiGm/tInmMCqHuEAOQjkxp/4u1GRIopucq
X-Gm-Gg: ASbGncvcU/X8krheIPPExUdlQ1lBpE03F1pM3s3DGp9hmOUFe2/pGnCmpXRCLmSu8eo
	BZJZ0h53Myo96TdtDwUFjrzRXqgHZWvjy31KXq/WnLENCUHlbBz3mXs6imQ7Mh1ML9eSHuDrUDj
	B4m1MFHAsQ+1cW98KeuJkwov4nmghhtkzCjfk7bGFKRXwY7HrGmRRVkOAE8xvGx43vRCDAQzV1h
	TKIpeQmTlMT6lMnyeLmuhBF9fg+Tt5XjD/iqdLEk54YmAi3oh1CFcNCq3PY6FtSbQqMNprEhJYU
	LdGrMj+/haeNG7m+OpDGavDz3k8gK8YXqqH8rOjMWVQ=
X-Google-Smtp-Source: AGHT+IGYOhDLZwULgZl6IXzdoOY5xQYtIs9vHAaR3rtKYgby02EA6jBpe6c7R8WjaS7P9RLaVvFF+A==
X-Received: by 2002:a05:6a21:7a47:b0:201:b65:81ab with SMTP id adf61e73a8af0-21ad95ab750mr91459637.23.1748530724635;
        Thu, 29 May 2025 07:58:44 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d672sm95547a12.60.2025.05.29.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:58:44 -0700 (PDT)
Date: Thu, 29 May 2025 22:58:39 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>, andi.shyti@kernel.org, dlan@gentoo.org,
	troymitchell988@gmail.comg
Cc: spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: k1: check for transfer error
Message-ID: <aDh2HxnGVez6T1Zc@troy-wujie14-pro>
References: <20250529122227.1921611-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529122227.1921611-1-elder@riscstar.com>

On Thu, May 29, 2025 at 07:22:26AM -0500, Alex Elder wrote:
> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
> complete, or if the hardware reports an error, it returns a negative
> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
> 
> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
> which is the i2c_algorithm->xfer callback function.  It currently
> does not save the value returned by spacemit_i2c_xfer_msg().
> 
> The result is that transfer errors go unreported, and a caller
> has no indication anything is wrong.
> 
> When this code was out for review, the return value *was* checked
> in early versions.  But for some reason, that assignment got dropped
> between versions 5 and 6 of the series, perhaps related to reworking
> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
> 
> Simply assigning the value returned to "ret" fixes the problem.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 5965b4cf6220e..b68a21fff0b56 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  
>  	ret = spacemit_i2c_wait_bus_idle(i2c);
>  	if (!ret)
> -		spacemit_i2c_xfer_msg(i2c);
> +		ret = spacemit_i2c_xfer_msg(i2c);
Sorry this is my mistake.
Thanks for your fixes.

Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>  	else if (ret < 0)
>  		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>  	else
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
> -- 
> 2.45.2
> 

