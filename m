Return-Path: <linux-i2c+bounces-6423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FB971FC5
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C1A284B6C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF1A16DC36;
	Mon,  9 Sep 2024 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/8LLVNQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924F24B28;
	Mon,  9 Sep 2024 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901248; cv=none; b=B5imk9Cz0Gmk4y/x+6LJcRtEVS8/KOpoCFRoKpenMzeDXofBhQgVI7nr8+/dEVJhP39rG+7V0ohwZ+BzUwMKUx2XsodMQPhN0Pu8eeuROEi7pZ78+i1h8qogc6Hg8nYDjOh9LGC0n/tmwKYfNk6ex7xh910fX35UF92SQize+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901248; c=relaxed/simple;
	bh=uFzAe29One0DWRvE5VSnnZRolQimUfzmHllx6zDt8z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6erFt8JlLkxzkOnFsSH8xoEbfufurgdIosa9/7IHtr4NRlIQGD6UJ37cxGn4JPGe8dYtn+MuoobEp4MfhGRObxsCOm3hsqlUsJGY/kQSNWSbrZAWXQwPSXDb4yFfg64ji2Up4Ul3LW3bhkgVeAQsQ5iVAn8fhoDlglckCgdN9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/8LLVNQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso3967761b3a.3;
        Mon, 09 Sep 2024 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901247; x=1726506047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNu9ig/1jETx0Me4XgmLyZSEn06Q+yK2quW/C+J9PDs=;
        b=i/8LLVNQfrw3Yo+VPwh7ls/LECLq4LKhEPgyOluc7nLYLZSNWpNoDM/Dd65TLV5Wka
         tIpH6arS2ztJ5KJ1BTX4ceesL4jTp4nSRe7ZUAG31KuEfVj0ezcYcjwds/MVYIm3/MCo
         vrCRSAzZQMscmOW5uitWzgCjsY5+iC/FnIlsen/DJ19kK37N8a8MDxnJvVvd0Hf3yHg1
         tCU1jyF+WgWw1OoJvlpN0Zv1O/vaKhvdFfb0lDjDWhfyUjt2Cm0rbBLqgMNZytffRE1C
         2K1eb+8uIeAHhyPDYmHS8F1efpCa2NiqXq2T9oZS6OJ4hxHSpqgWEw4HGMBe9WCYcz8s
         79JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901247; x=1726506047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNu9ig/1jETx0Me4XgmLyZSEn06Q+yK2quW/C+J9PDs=;
        b=mbJzlJJiElnRQPCiqxgmYeOC31kOPf7zz+sPEqGZb36kVUqZokuTopsMwxfL3irD7f
         DiSrufjyThTuTDhDLDhHJZbLwBWVeayoVXdWyErPbfzTn0YUDjGEaKRp8NI6nWwPJQW2
         /vloUvrF7jUQRJ4232qg5cWXfIJrOUxCyRvqyjMsDy5941IuUSXaCfOVDQRLOeJh+WBU
         97aTXYhZUQMlwk9LqD+wSZlwUXdUcUbTp4HHEFm+wKbtQ7W7vh9tPWp+t190gBEgI3Bh
         bzTHJEu8KIFLhQ3MYNlCFz4tRCSKL0T2Y6Pv+Us+CHlKClGwO+myAlZIUSycwovtGcev
         eJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmw6hF6pjZP6+J3HcmyXcFDsJh0wsnH6PYqwn7nYjcDbFbadIYhZuauedJ2VCyYueKOizhEFz43zt3mbw=@vger.kernel.org, AJvYcCUrZLFOE+vZnhoYCy7QMBfsFwaIb8VEQdgKlG4J5JjbowttDzCWoXpN7d6O5I8jCbokrawhDnknZvyW@vger.kernel.org, AJvYcCVElX4+PynvU3nUyy6Ki7HgxqiUqMsDW2ipYeTmRsjvYVxvKSTNzH4LSxbFi0KVLUGSLXENG4bLoZ+dog==@vger.kernel.org
X-Gm-Message-State: AOJu0YymflnuQN+7jmlmDvVoFtHXFHkpUooV4gzztnPGSrr9rAoNOhok
	EB3d8riBnBbE+wh1NEGNkW5taLP39rCxulA2s/UaPaMysHyMC/gl
X-Google-Smtp-Source: AGHT+IGeER6eMfVy+fyRWPaVOYXmTaDcO0K9Jm/601IFj+fqTmkcynuxTL/14YTBzXqqFevfPPmSaA==
X-Received: by 2002:a05:6a00:809:b0:717:85e2:290d with SMTP id d2e1a72fcca58-718d5f068ffmr18289087b3a.25.1725901246588;
        Mon, 09 Sep 2024 10:00:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3910sm4274040a12.54.2024.09.09.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:00:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 10:00:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 13/15] hwmon: (nzxt-kraken2) Use
 devm_hid_hw_start_and_open in kraken2_probe()
Message-ID: <d9419c8a-6a99-43f3-9e5e-d1877b510c72@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-14-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-14-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:11AM +0800, Li Zetao wrote:
> Currently, the nzxt-kraken2 module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Further optimization, use devm_hwmon_device_register_with_info to replace
> hwmon_device_register_with_info, the remote operation can be completely
> deleted, and the kraken2_priv_data no longer needs to hold hwmon device.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

