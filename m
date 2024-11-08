Return-Path: <linux-i2c+bounces-7876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB279C12E9
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 01:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 204011F23105
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 00:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C1AEBE;
	Fri,  8 Nov 2024 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gwIHnxL2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8EC629
	for <linux-i2c@vger.kernel.org>; Fri,  8 Nov 2024 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731024836; cv=none; b=q8oycYl5qafQ4640Nj8THNXowg2OnMvuQIQwppj+8ushn0M44vLezLh0Tgh32dRXcC9euD/CcavmDuUmeI2cIgJuE4it/hzDfdg5HbNwzTEY4KO6cZKSoOmr4tOcU0cwt4lk2nij5Gx9FAVBAJSKILXn3YClItu+P+vjA1xMPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731024836; c=relaxed/simple;
	bh=NOMCMry9fM7muBAW3IdfEmyNmvqPVzwg+MGT8mPmCek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6oT28Czz1RD76P//pNPp3CPiH8JmHoCts9qleRs1yP5lfLMk+2u7fYRpNU0DUiSubYkc2XdChtOqnw6FJb2ctYIoM8NhphnWmt3W7VwrCC4fDVUlLMwnwqs4MKtx/xzb7PDncGeGKoh9xmXVQHL1/EQT1vNPd3BOQF94FHD9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gwIHnxL2; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a3b28ac9a1so23855ab.1
        for <linux-i2c@vger.kernel.org>; Thu, 07 Nov 2024 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731024834; x=1731629634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WArJZsg1N6vAqQam1Ti66Bn4ToK/NY0ZHWyQAcoQtDM=;
        b=gwIHnxL2e8wtRfo3a/fp+83Ix0jNvz88tfq2SObkEnYfxLJ3D3bxezTli4HYvw9mH5
         1F/uXzM4BAD7asY61+5B+etD+UJa98QMzMatwtBQLrH/UmThber6BhxO/IK3qxrkcV/Q
         RKs+TgC5L8eOK+7K2k2tJIk/d0ZtnZGNv23F/F9FNOQGob4VdbTb575BIDJRFBf2q7HZ
         ca9kOikYTZH7VizVQ2myydvgHwTYcDa+JbkhlBHXq6aWD/rMRkJmG6+DCwUl0gzqUC98
         vJuQRaR6BcQupTEGEvWNg0LJdYN2fUvQ2C7+FpTqyx5tglXX/w9uGIE864yGe/vuLZvD
         Pjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731024834; x=1731629634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WArJZsg1N6vAqQam1Ti66Bn4ToK/NY0ZHWyQAcoQtDM=;
        b=DHrm67uqIl0TiTr9AndI3TSZcRWASWKZkkuXnAKLYJqemnDQIT8dAN6laMYeGySsWe
         3BQV4zAT1s9t1acW6jXj+3HhbyQTt9aZ+2MaFVsldRDKHMuL1lQzKMEdhwLE/e4DSuRY
         mHrg2Kegdyk8DcmQcef3XySfGCQxYguqzcjOXG6//+3HbShdAy5VEUEBVp1i44+5DIF2
         cACHrc+tdMaxlXoXWuyxt1tQbPHqDaPHHmTUwlRx4ZFKIT7T491IT1thveyJSq58L6xs
         0PGVzHL6vGbs1LzZfWB3wCneullS5To0fAqqrrly/qj7kSmk8+dWjeAfpfy9K+7D7OaG
         DhAw==
X-Forwarded-Encrypted: i=1; AJvYcCWhqAqUCQjZ2ekQj5S0ZrUVUFP8cNQ5ey3p8fLRPsS4NdU8MYP4akAxJ4V9LRdyofSBA3VIY5oeWB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPknwyjWG3nVEyGvofX6oTX6jQMUU0etFjtcHZgzpbU4EMJVJA
	1WrDajWo7psS9bCfoOzAgoEmOl28lg6mw9br8MMyPqvQiTVdCeu6R/s72IwHvQ==
X-Gm-Gg: ASbGncvuESSFZj+GZJRD0uDMLeBN4FQvN66gHiz42+I6rqa4TqmdKum+2ZvaM4KBDXh
	35n40krzH3C7SUCwpsVvon05JqPrtG6oTYwSVtZ3rrzA6gvR69fvRHEBuOY0WlcBmM2HakSh5A3
	gbGysrQploKAdbDi5xwEwor9W3fcgYxUjA1VhqEU+K0KQDWQtNmuPJ0UxzZaMnriUx9xPpoE9Jp
	cO/yiAWOtVNc9AhIBP7WrUPpZOk8xVyno1K2NZP49vIX1wI/eYSWeXw1OR4/PzIME+n3IyBLcAn
	Gax0J62MG3cr
X-Google-Smtp-Source: AGHT+IFli50z58Q8piVHDbT4N8joEA65iTon5BhGcKUq3FKRg2ka27CwgBMtgshOVs+Nbm7aTn91gg==
X-Received: by 2002:a05:6e02:12ea:b0:3a0:8cb6:3ad1 with SMTP id e9e14a558f8ab-3a6e7a62020mr8287555ab.20.1731024834208;
        Thu, 07 Nov 2024 16:13:54 -0800 (PST)
Received: from google.com (98.144.168.34.bc.googleusercontent.com. [34.168.144.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a5f935dsm4664987a91.35.2024.11.07.16.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:13:53 -0800 (PST)
Date: Fri, 8 Nov 2024 00:13:50 +0000
From: Igor Pylypiv <ipylypiv@google.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix memory leak when underlying adapter does
 not support I2C
Message-ID: <Zy1Xvk9YKrjqc4S7@google.com>
References: <20241107014827.3962940-1-ipylypiv@google.com>
 <jc76qean5mqxba4nh5qdocxhl5aa7r4epryyviqkyktbu6grog@u43wzsaki23k>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jc76qean5mqxba4nh5qdocxhl5aa7r4epryyviqkyktbu6grog@u43wzsaki23k>

On Thu, Nov 07, 2024 at 06:14:29PM +0100, Andi Shyti wrote:
> Hi Igor,
> 
> that's a good catch, but...
> 
> On Thu, Nov 07, 2024 at 01:48:27AM +0000, Igor Pylypiv wrote:
> > i2cdev_ioctl_rdwr() receives a buffer which is allocated by the caller.
> 
> This needs to be a bit re-written. In the commit log you should
> describe what the patch does. You are telling where the buffer is
> allocated.

I thought subject line covered what the patch does. Ack. I'll update
the commit message in v2.

> 
> > Fixes: 97ca843f6ad3 ("i2c: dev: Check for I2C_FUNC_I2C before calling i2c_transfer")
> > Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
> > ---
> >  drivers/i2c/i2c-dev.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> > index 61f7c4003d2f..5d15519ef737 100644
> > --- a/drivers/i2c/i2c-dev.c
> > +++ b/drivers/i2c/i2c-dev.c
> > @@ -247,8 +247,10 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
> >  	int i, res;
> >  
> >  	/* Adapter must support I2C transfers */
> > -	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> > +		kfree(msgs);
> >  		return -EOPNOTSUPP;
> 
> Please, don't free it here, free it where it has been allocated,
> i.e. in compat_i2cdev_ioctl().
>

Sounds good. I'll move kfree() in v2.

Thanks,
Igor
 
> Andi
> 
> > +	}
> >  
> >  	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
> >  	if (data_ptrs == NULL) {
> > -- 
> > 2.47.0.277.g8800431eea-goog
> > 

