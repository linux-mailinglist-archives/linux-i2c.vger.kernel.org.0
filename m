Return-Path: <linux-i2c+bounces-2472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F8885D11
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 17:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10A9EB20F4B
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 16:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937A112BF23;
	Thu, 21 Mar 2024 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huqyANyA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74588662F;
	Thu, 21 Mar 2024 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711037484; cv=none; b=tC94yyyvx6GrDye1GB+qICR72k5YWkYiFen/ZwzDClnrULgAADT6jtjTNCBm11V3R7G1TeFfZFitzSidN5Tc6KAsTCSLGflno4N+s8H78KdJi+uK0AqK8Icxx+Que0hJOEhzI8xq8xpgKGpWWLzG9loe5QJMWTKiiX4Hfz5bbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711037484; c=relaxed/simple;
	bh=LAQZ4ZLWmBUyE62rnU+861jDb9FZB7bhHoZ+WNbwthI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/AZmNC+05MeWMgNmDqctZZh1995We/i1mr+/PqRX2j5Zt7J8lHVbPcG5w9cXESYn0zhMX0G6qQZTTuQ7zBYkFxx/Mn97fHIakoElpctUnR/C1ZVWRqHwem3TIJfwJI4DBbsmgwK27fP9sMoFLJuJ5SV3UwmDYICpJLyiBjk+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huqyANyA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so1680074a12.0;
        Thu, 21 Mar 2024 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711037481; x=1711642281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4TbJuGZPf1PxibNME+z5tQkWAHrehGe5LkiCxqU6ik=;
        b=huqyANyAhtWUhkKHop+7ua2FUccWY7UCxyw4tdZuIlLA0uWiB4PJgNMnlJfbX6EoV9
         XIDajsQs0kmLvyjDXObAX4cpB/LaBwd/YMYtFBR2GdeK5i4ED284vHJkJAj2soPTswX2
         XxS48NIWK7xiLZHTxglWcu+OtOmrCSDYTRlC5wyMoTrXi1RXtx0esDHY58W3LdpmncDM
         3Idj/SkGBUlOvyeXqBs6UyXSfToeQ2JqXV+KlVVo5A43xxp0pALisbE90mpIwLtqj/Ps
         m+rUVzWpJgUqD6+N/h/BwqA3GXvsW3x3Tu1xlBveneaLocpIDiIgj5tBTVXwjnJ2ZKE9
         xxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711037481; x=1711642281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4TbJuGZPf1PxibNME+z5tQkWAHrehGe5LkiCxqU6ik=;
        b=rYUf9HXM+v1YoMfYExjoggon6lQJuR6sDG2+sng5RyyosVcw3oEqtWgvEBAJFWvgiQ
         SPttNYBVXpIX4wzOnYjIv0qZo1ohq2CfeNLNQm/CGRNNOFtk/c/qnAeI62NVrPb7okH4
         wZ+1g4arVOSuS9D27QNaxricXU5lkM2Pgah8IkIxpnG4EI7KSVMI8bziD4gXJQDHfW7h
         S5Nfy1UTlNLcehtMDCrViGFO0SyUx6DRk3l5ltD+VA+CBMZzmAIOlkeN1jQVxJH4n8g7
         gOWlP3FU913V1fhbbKFWJfc6136Y42/dg0ixStvWgaXkwEmko7d2H9m7Du/u4SLOUojF
         0hjA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7IIHRJeknQPA+teGivFc7BYV86sUrzpi2bDQQbprMw/uNKZwmjN+MpiltnoPFJiN0UquVmPW0aRAyd5PqZhJ9S0e03ZBY+9gxddR
X-Gm-Message-State: AOJu0YwwfZJmc71Pr+i8SULq9VGUibVKKLeo9hQlz7Tveof1ljQh2326
	wbdly4AegjlPSU57v9z/Rno+FHhfeUYaBGRCqyrW88lQPZeyA5Mv
X-Google-Smtp-Source: AGHT+IHphC7/sIkGBVNLXbe7tRTyFazgJWF3pN4v5m1MheZTRe6KwUTvCZzUmRXHKoB2xtFdUWB8qA==
X-Received: by 2002:a05:6402:1cc9:b0:565:6c72:40a9 with SMTP id ds9-20020a0564021cc900b005656c7240a9mr4685582edb.28.1711037480685;
        Thu, 21 Mar 2024 09:11:20 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7b76:3a00:1c23:60d1:b92b:f2e7? (dynamic-2a01-0c22-7b76-3a00-1c23-60d1-b92b-f2e7.c22.pool.telefonica.de. [2a01:c22:7b76:3a00:1c23:60d1:b92b:f2e7])
        by smtp.googlemail.com with ESMTPSA id e13-20020a056402104d00b0056bbf8898e7sm32883edu.54.2024.03.21.09.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 09:11:20 -0700 (PDT)
Message-ID: <c87a9702-07c3-412f-a9a9-0e32b8aab668@gmail.com>
Date: Thu, 21 Mar 2024 17:11:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Fix a refactoring that broke a touchpad on
 Lenovo P1
Content-Language: en-US
To: Maxim Levitsky <mlevitsk@redhat.com>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240321141919.26844-1-mlevitsk@redhat.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240321141919.26844-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 15:19, Maxim Levitsky wrote:
> Commit 857cc04cdf50 ("i2c: i801: Add helper i801_get_block_len")
> introduced a slight functional change: the status variable is now
> overwritten with the length of an SMBUS tranasaction,
> even in case of success.
> 
> This breaks the touchpad on at least my Lenovo P1:
> 
> rmi4_physical rmi4-00: Read PDT entry at 0x00e9 failed, code: -6.
> rmi4_physical rmi4-00: RMI initial reset failed! Continuing in spite of this.
> rmi4_physical rmi4-00: Read PDT entry at 0x00e9 failed, code: -6.
> rmi4_physical rmi4-00: IRQ counting failed with code -6.
> 
> Fixes: 857cc04cdf50 ("i2c: i801: Add helper i801_get_block_len")
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a6861660cb8c..79870dd7a014 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -536,11 +536,12 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
>  
>  	if (read_write == I2C_SMBUS_READ ||
>  	    command == I2C_SMBUS_BLOCK_PROC_CALL) {
> -		status = i801_get_block_len(priv);
> -		if (status < 0)
> +		len = i801_get_block_len(priv);
> +		if (len < 0) {
> +			status = len;
>  			goto out;
> +		}
>  
> -		len = status;
>  		data->block[0] = len;
>  		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
>  		for (i = 0; i < len; i++)

Indeed, my bad.

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>


