Return-Path: <linux-i2c+bounces-11400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF06AD80CE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 04:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E31CB1897F23
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 02:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA031A01B9;
	Fri, 13 Jun 2025 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfCvXX0b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770191DF268;
	Fri, 13 Jun 2025 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780737; cv=none; b=QfACml63QkDQdjjpeOXAqRQxNeFqG5YFvt2ohnTaFYl4ITWdF6nlK4JIgGH3GVOa7hWxbsVFv24xYhu4WZUwd/THSpEoR7bxI7UG2ub46zgEKfDjRpKdxdFEsKmw9OVPqPooUYEPJZ8Ee1TW9W+M7Hps+ENHZTYBp/Z+i5xvgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780737; c=relaxed/simple;
	bh=oV2F7jyiXlkuJRhDsFyY1YWgqEbzKbiBKXchw7JTdGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF2Fm6ObhuHWtIvBdN6ENDygvfkpDencYn1ICPakUq8zj+vE+OK5PP1k9mTnsWDArsQrtkWQef0CrT278+kclLYuZtdVLz+ORrdYGXRIUzCV3WYEmYe25EB0tAXEQzmTyy8U4qi7V/02twaPv0Dfi0V3gH+UBdDFQvhTFKaz3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfCvXX0b; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2350fc2591dso15683405ad.1;
        Thu, 12 Jun 2025 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749780735; x=1750385535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hna0O+LUaLx+0oktXX+K8llS+HEe3f1PFlR9cMiAfc=;
        b=MfCvXX0br3I4InM6lyJ+7/ORK5J2GlhY+0CTcFfRHnnG7TfkMqJhlVwPdwBppsvzml
         NUGAxoVKFz5pviO1nYtUph+MVM8jhjXtcuAWGuUvT9I64O0fhqsprkf2upchB/n4WGAz
         7ATeYR6awWaNTzCRo5NPg/E0LYxrBHZMIuQkpRdyjrAWg4cT/fSb0BJqWg4ZVB3dRorv
         VmA8YBrBRgDzzXbwepiUhAhvltY1B+/9dsGwS58Fz0P1YQzcGzuUWaKd03CqRgrTFGTe
         bwsmYhYmxYmPMWrt9kziLWuB21HO9AfJ/qgpUBZY9UI99SR+nlx7+tW4eH511UnQEZJE
         dQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780735; x=1750385535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hna0O+LUaLx+0oktXX+K8llS+HEe3f1PFlR9cMiAfc=;
        b=q9U7vM+IbrV3z5Nb/T8PpKGFk5e23djOblUsqU7xTgoGtxp25aQEmpF3tF6oaxXUpu
         x1m+ijQxtRGPLG0n9QxLH2MByC4IFjLOBlvQqwq1gnqCioR7jdY0CQEgNJcdR5u3lPQ8
         ItOI0kZ+2+yM1P1w04tVbgL5iMd/pXzyLbizrh/e9z1p8L/mGgqaqcIG8lkAIjmXU53y
         zJZuqpdOgq9b20fudDXckWMN5SD5OMsBId5s00Yo4ynx1bVJTjzvyAG4tGS5gcww9geh
         NdeGjQE+lWT70Ys0i5v1JMnISLfkI/iCbiXeDO1ayTzo9xJwtJ2weWOUMFzTmj2Kw9ll
         hxGw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEnlqkxY8Gx+guEayWQZTqfsN7tWOhYcaEZ1JZqHNDzLLpc8pXxOrtVdXodQzBPx0aBo22z6+MAtdn/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/yHmPEPhumUkIFmd8TJSRqe0HV07ouebS1QqWeOd+WgzZBjh
	yEg/XcMHT50dnxvyh1ju1Y1BC2QU47JNgoEsQiv4f52yZDhb210qXpMe
X-Gm-Gg: ASbGnct/yfTOChKpUj3T3mYOR5pj1paYyM2hARUZcE7JieA3bJlCis+39tX93lHXtjG
	DFVxc9A6z9zDJsFbfnUeY8SQBdvNARj1TbijgedFZ9WuXUdBQEXVqosw3DYQ+RI4y7hRh7EH2OH
	8l5qegLC9Ee6NCUoOSwCzYWB3jP3gaV5jN+WzUAtz7uu8O7nDlLgFuKKCzkEMlMBiCDR4lt2siG
	TtOJW3dWPUFIldFyIE6/u3oVtODOkxj/VYElHcV247Xq5p8Zaw9RrTxk/Wno5Sf1G0OueCAyzpJ
	3OQeXOiiFEPdYfWGd23H3QppCEln0m4yM3lgyMnuAT1AdnWjOfxvqw==
X-Google-Smtp-Source: AGHT+IEn+f3gutrZsuGdkCNgFErV5PdSC6Hef2d/nsG5l9WFwb349LMISTX9gwCyLloUOhY8JzqgdQ==
X-Received: by 2002:a17:902:ecc1:b0:21f:5063:d3ca with SMTP id d9443c01a7336-2365fb3dde4mr12310335ad.16.1749780734677;
        Thu, 12 Jun 2025 19:12:14 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1639e5bsm403153a12.2.2025.06.12.19.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 19:12:14 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:12:07 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>, andi.shyti@kernel.org, dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] i2c: k1: check for transfer error
Message-ID: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
References: <20250612225627.1106735-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612225627.1106735-1-elder@riscstar.com>

On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
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
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
> ---
> v2: Added Troy's Reviewed-by
Hi Alex, you added the changelog, but the subject line 
doesn't have the "V2" suffix. Is this a mistake?

            - Troy

> 
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
>  	else if (ret < 0)
>  		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>  	else
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.45.2
> 

