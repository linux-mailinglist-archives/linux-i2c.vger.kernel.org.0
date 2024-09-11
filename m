Return-Path: <linux-i2c+bounces-6584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7379757AD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FEA31C261D7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BDB1AAE36;
	Wed, 11 Sep 2024 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBWv22ZG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA32192D86;
	Wed, 11 Sep 2024 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070062; cv=none; b=mLp/fwNR0lnjIBEZv2Uukh12r6aKCHuDvwdNvbKjzabSQteYLMJoGJeU6yCVoD5hyEWutG4BU9a6gON8VqxoxD1Xm/rXYqlj+UEottXiZpV0aLUUAjYnIFHN8LAGWu9kX3yVMtUTlIFzL9KZNZosLpLqaaAtBRmicsBs0Zcebuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070062; c=relaxed/simple;
	bh=ZkB3CWsdIJOZ4M4galTAh3aYUNJfnGGRA3TBjTjVxio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MP7YADq/MVXZmfdRzchoIqHuXbOoQj6eN7l82tveiMzgex084WgfDup79zJ4JzWa+w/pMIG/VG2AsW56wkwzaIXfCxo5S8tRS7GuYwGbRscyzTwHE13zFiwSRDihbyxEnfGpaV0A31EiyHENYeoJo+iPfOan3FHALws3qALpCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBWv22ZG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206e614953aso213665ad.1;
        Wed, 11 Sep 2024 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726070061; x=1726674861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PPhqrR+rUKLY9Ke/C76E17iBv1z5TKbqfgaCfQBPdgE=;
        b=PBWv22ZGpDdMCFytpq8zTvU43mgPd7CW3QFrQcI4rpAXI7zlIbxcE2f3fEUOgraWuZ
         WrPwOrZz2+Rd1hY3rtzIILGrYXep97Cpx0WN9sK1oRbyZTYB/6Ws2y3GuXVGKnwex09A
         shvVxTvScqbtsTOgKHKaWLkURwHT4s4ePS6+XkKBRMP6qYfygT+txzpJsN/YpLNmmr5k
         H32Mz5N5b+7wzafop55RqbvDvhp1SCQzPn2qyrlSIn3WBcVwbc6v2UHuRd+yW4JS+awz
         Mu4P+QwO7WVPUqsm69edhLROy+KGwKGpJdWQCznvV29gh6kg+iAeBzUPX9ILpYiqXrS4
         NIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726070061; x=1726674861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPhqrR+rUKLY9Ke/C76E17iBv1z5TKbqfgaCfQBPdgE=;
        b=LXzFvE29dzhzk/Y53lbYV+fCCtkxUfMbWYoeRoGDl7VHHN5LW9k3ODCoe63vYkHqiZ
         yF/y2I+jpYoxGpHTi/GIqHa5nR7CTDlrS4/znvkd7HtUC+Ca4Epez2W9pPeYvREiGidD
         K56cd5jIs8Uv5HHXJvJJpisb1bI/ieqA0YydzFIbm/THYA89tGR8+LzaKOJUC5pUgAOu
         nyoX29iFqLxrLbsGw6675yFXYx2TfYqinBfCY/c5XecmaYraPUg5JC/lmwzc4JlMDy0F
         1JshRf6L6fmYS3s3zacHW69cJ8i0TGxl5ZRPifXhM/OnK3ZdTb9zctXyry23XB4yYPDf
         CC6A==
X-Forwarded-Encrypted: i=1; AJvYcCXoxIb49mnnlnk2WlFIGhgOedMW8cqvqluQ16a2umdS+WVwXFRWO57F2mATye9xgiE4g0vA6CJmSHrr4sk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aN/n0Y9BQoCJxx7jzY9hQn3Bbs4UaFzoZZKpQIoMi30YaAvZ
	P6GiTQug12PR9W5bhI+gyR1lloAvMCzCPHVNZnx2vReppK7BKvT1661LlSlLwgpxcT7W9m0Ky9W
	CnyzFFVIfOIECo858+aGzTg2tDWk=
X-Google-Smtp-Source: AGHT+IFRcM3zM6MOhmIE7dVzBD5H48pHxY7bqxvSLeqzD9ebgH+YW7mvcY8RKA6RvREhtYueCMyCfFWipm+OqkOm+dc=
X-Received: by 2002:a17:902:ea08:b0:205:7db3:fdd1 with SMTP id
 d9443c01a7336-2074c6240c5mr60051715ad.36.1726070060455; Wed, 11 Sep 2024
 08:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com> <20240911154820.2846187-12-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240911154820.2846187-12-andriy.shevchenko@linux.intel.com>
From: Jesper Juhl <jesperjuhl76@gmail.com>
Date: Wed, 11 Sep 2024 17:53:44 +0200
Message-ID: <CAHaCkmd_HWCgyfiAV56VgENgMaS3kG9cz5CPrUzyiVoy0y1oBg@mail.gmail.com>
Subject: Re: [PATCH v1 11/12] i2c: isch: Prefer to use octal permission
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Personally I find this to be *less* readable, but maybe that's just me.

On Wed, 11 Sept 2024 at 17:51, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Octal permissions are preferred over the symbolics ones
> for readbility. This ceases warning message pointed by checkpatch.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-isch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
> index 8fa48a346e12..a6aa28000568 100644
> --- a/drivers/i2c/busses/i2c-isch.c
> +++ b/drivers/i2c/busses/i2c-isch.c
> @@ -49,7 +49,7 @@ struct sch_i2c {
>  };
>
>  static int backbone_speed = 33000; /* backbone speed in kHz */
> -module_param(backbone_speed, int, S_IRUSR | S_IWUSR);
> +module_param(backbone_speed, int, 0600);
>  MODULE_PARM_DESC(backbone_speed, "Backbone speed in kHz, (default = 33000)");
>
>  static inline u8 sch_io_rd8(struct sch_i2c *priv, unsigned int offset)
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>
>

