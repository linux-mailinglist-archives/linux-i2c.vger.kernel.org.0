Return-Path: <linux-i2c+bounces-2708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D5894E22
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 11:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16962B23F43
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7527456444;
	Tue,  2 Apr 2024 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qp9OqSaH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FE17C7C;
	Tue,  2 Apr 2024 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048434; cv=none; b=LvL6sZzrhoaxmwLgBE24upsDIZtNGHhr0/ldGJWiqcL8JAIl2/Vv88aaunQ+ZBtaSTBQvu1DaBX3tacgHiQIDpbBIb6SMJ7l6E08ZXRNfO1jB/GGVu/wI0Z0Xok6Txd+Px2dUNasEdlqTK7jCdNpTTbLe+ynnDx5yjCpTB/Bn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048434; c=relaxed/simple;
	bh=eL1PiuC+OxtsN6+5kmmUfS/ddM6OPqhmPRBb17Qn1mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWFZNCDhOnS0sS79rSN4JPtIw7lhaEd/X9y9f8QukWoiQud15m0gW6I46lE5mI2wbYYUai1K73VlH+HFCi95A/wNf3gM47irkDzyYub6rs9VXPZ8J6qAO7V6mHCJEkUjIAArvvQ4x743mcbEWNt33ZBE2waz9X/wJ67Rv6YXuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qp9OqSaH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41568096c4aso9815115e9.0;
        Tue, 02 Apr 2024 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712048431; x=1712653231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7HP43l12eov1KUoh9mzxUyEYfgWNMnEq1EVajRpXoI=;
        b=Qp9OqSaHyxdnx5Nn4yKbDWyqbqKRlqe60Udo5gEMOunhoZAWFoGpQcdVvpDiGRsRON
         /LHR+o3ujfPQkG/cm0EXm17JIqjTFBWRiQ728dZ4SMVQPxeMCOePw5Wu33gqNYJBL4Qy
         4mfI/m4MfO8HRgciDR1+9Wxl7RaIR+ts4nmz8xjtSTBz51A6i9DWSCoPJc2OABO6nWjO
         3kJZyNa0//m7Ilc9WF6diIZAIn1roBO0wKay6KN67oqjEUtWtWeiCffxyTk1H0G5scxu
         hw1TaTGn+jlmKTth0vjHwHtjdz47cYbWEp5NwbkISF/TK+0DnAIinELyyCWKkeQcX1G4
         ning==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712048431; x=1712653231;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7HP43l12eov1KUoh9mzxUyEYfgWNMnEq1EVajRpXoI=;
        b=R4Q86+dQkZGLI9xNEsDy1/OT2a5/m1JE47Ie7rvoznVTLaJqBb23R1E3tlXNctPtUq
         twrU/JbrnAZ4G2Gb29kAw40CvtlhdK1/Us8Tk6mTzS+kcZBciFii1VhPE0Nr4QQitnBP
         Ws3m3/R5pyfOq2Iyw1TNZe5b7fdx73UnjDAaYmlhXQbvVwGdXtPiBT5LjDgjGnakDhX1
         Rj4L9kF1J1LhCXn66cZGkRPwtEyCgksZ2b4eVtuYX7T2bo6ohSv74E0TasnOs9Sc3rZj
         rzTvHDBvi55LAAhEWdHlTF/xe+mUrc+HD5zPJ6H6la3PwDu8NRw+Bm//pd6Iz2OXaHNP
         bIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyBhfBB7doqy1ibeuoF6oEP64WvaE5kmUtndI3nnxhp1gOQOCBeMfz7z9n2y182/V62PT2XRPgb/Mltks94FtFXPswg5ttacMzDIszjneMVz6CZaAHul7PCzjGxJwAi41cXkncUdALjmPL1CiWVmaRGF3HsUb0Z1ro1bxhP35RsopfS1a3T1QWu4iM3qVhZwDJ4T/mRaCsAgWyyEa7D0u/5fdu48a2r2c5Y2qB1m9+9vBH/fjbx8saxg==
X-Gm-Message-State: AOJu0YyMPVZOmr35b1JqPQVufzXd0r56exbSFGKfXqtGHnEooyvzKFJd
	LDJwQHQa5zz2G21al44b1oSqBYX+1YhY+DJVPh0BgiiucnqPmBcR
X-Google-Smtp-Source: AGHT+IG8frznok1aF9okpQQTY2pR3XWd8JzFp2tX7BIUva1VqLJJmQZ3+crxPhY7ojqin4XV81Hf4w==
X-Received: by 2002:a05:6000:1143:b0:33d:b2d6:b3a6 with SMTP id d3-20020a056000114300b0033db2d6b3a6mr7466595wrx.48.1712048430463;
        Tue, 02 Apr 2024 02:00:30 -0700 (PDT)
Received: from localhost ([81.168.73.77])
        by smtp.gmail.com with ESMTPSA id l2-20020adff482000000b0033ec312cd8asm13554997wro.33.2024.04.02.02.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:00:29 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:00:28 +0100
From: Martin Habets <habetsm.xilinx@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
	"open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
	open list <linux-kernel@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240402090028.GA1759653@gmail.com>
Mail-Followup-To: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
	"open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
	open list <linux-kernel@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-11-eahariha@linux.microsoft.com>

On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>

> ---
>  drivers/net/ethernet/sfc/falcon/falcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
> index 7a1c9337081b..147e7c8e3c02 100644
> --- a/drivers/net/ethernet/sfc/falcon/falcon.c
> +++ b/drivers/net/ethernet/sfc/falcon/falcon.c
> @@ -367,7 +367,7 @@ static const struct i2c_algo_bit_data falcon_i2c_bit_operations = {
>  	.getsda		= falcon_getsda,
>  	.getscl		= falcon_getscl,
>  	.udelay		= 5,
> -	/* Wait up to 50 ms for slave to let us pull SCL high */
> +	/* Wait up to 50 ms for client to let us pull SCL high */
>  	.timeout	= DIV_ROUND_UP(HZ, 20),
>  };
>  
> -- 
> 2.34.1
> 

