Return-Path: <linux-i2c+bounces-3995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354B905A32
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 19:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27EC8283869
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0101822D0;
	Wed, 12 Jun 2024 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZfnEycA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464B16E895;
	Wed, 12 Jun 2024 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214584; cv=none; b=Lhz3NmXuC4eY4iQNsnq2MeFnubFvC4xBqcnTKmTdlrPCM5G3XgIIWPO8MXs9mC2PFOU5U8+rfNTjtj+u6+mmzwQtr4ZK9Xoe/d1h2E9ro+9dKranzdNvpTWRcaA+cTVcpVlJpc7g9sXS719Szcne0/ewsAwUiVcusA8n99CJcmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214584; c=relaxed/simple;
	bh=eknbSOKAkHr7WNotgf3GFZX1KF5IIKMVVYf+Xjthm+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieg/K73m0Mjq7+NwEMy483I/CDj3JGaYzPC6P8cSjO4jdaylgWCHLwXBvWnpuOyqjRSX7LAUJK2J9JAMAv7nsXPI1ffXHfVnPJ8BWmqOUuPj7YZn/I5gID0XNH1a/6xQEqmgH7nRpQPJ/YqRwqIg2Kh2tH4tEa+1oICbka05GPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZfnEycA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f64ecb1766so1476355ad.1;
        Wed, 12 Jun 2024 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718214582; x=1718819382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjPQOb5v9LZYNRlrMIH8bhMWtbaji/7OGHLLhTtyIaw=;
        b=QZfnEycAVTZNj7xAtQQrKUrWZkQlRgDLyma3A11vwx75iMUbIUH0ZmxhxuWmkStXSZ
         uGGcq11wAxOKn7oek0/MGjbQmWJR15kB8DREOKrqtRgFwVj4VrcihRABMqv/V6+JFG0A
         538ZTGDFHzZb5S6rYEWlIluEVHla/R55b0Fljy7x0b7AMvaG1ZfmQNnvAb5yljircIG1
         BRaQDreFHpGHzzOVhnp4Z4BR1c7JOi8LfT3iJ3+IuRTj9YH77bZ+HrbT0Q1ma5SXKr10
         8oSKfgkI10HSXS+y4bAGPHBiEcSTT/jTR3UPK042OoMWjS+DleWyStHmYYdzD8VedGWj
         umiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718214582; x=1718819382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjPQOb5v9LZYNRlrMIH8bhMWtbaji/7OGHLLhTtyIaw=;
        b=jeRvb0qmFyUNjJTQ9o/QJ4FUxFekcv0aE/V+NDilOpwcb/HYypyNpT8vPvJu5fkAbA
         9Ue45gFSBjLJktm/plLKXsiEHtDyUxM1uhYRtJjzT5CMwC5ToqLEJrwLwXakTZ509JtX
         mxqPDIaaUfMTejzOrqblMPRgL6O/IGqDjQ3zMYmRTgSb4zv3uyjfTPtEFDLgevSYrCVQ
         42k6dC2sxHY2aSYBkAU3r3leJyBo6kVNt+Cmj1FDWoMnWZhEoDEzTHuFfJ/qjP5dD7bL
         ARTJ7t5GPmVHg5nye15nvZ+X3FAwuEWy5dvvu3/5bI80rEtf1M73kGdPH9QYzZnYMi5J
         PJNA==
X-Forwarded-Encrypted: i=1; AJvYcCXBPV8x80QFIBcTaV7xet/busrnpN4LfNgxjvElgIy3k1QFvg+N5EwgEn0EVP0sPpISUyKoV5WiKPwYNTwcNnlNYTciiMxoOwmursUKk/uoxo5JEcqcu0T3fQNr608JAdqMdnZHX0lH
X-Gm-Message-State: AOJu0YxvkZWk+17vM5csmN0xLQWOJeLKWdi+x+LMA7bzDJil7rNaM1w7
	UkBOfqv6N8A9IKKZJ5KAuri6Qn21EP/r4lPAtoVv4cY7UqH8HUiPyS+uWg==
X-Google-Smtp-Source: AGHT+IGlVdCQrkzplOB6tZKJ34PhflntCnXbokMIoYyZOeTT9+UoljY2l3lhqspxfBegan5us3U2LQ==
X-Received: by 2002:a17:903:8cc:b0:1f4:620b:6a27 with SMTP id d9443c01a7336-1f83b626511mr29688335ad.13.1718214581782;
        Wed, 12 Jun 2024 10:49:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f849044371sm6993225ad.242.2024.06.12.10.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 10:49:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Jun 2024 10:49:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: smbus: Handle stuck alerts
Message-ID: <18c810b6-2961-44e6-b890-5c6830fde995@roeck-us.net>
References: <20220110172857.2980523-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110172857.2980523-1-linux@roeck-us.net>

Hi,

On Mon, Jan 10, 2022 at 09:28:55AM -0800, Guenter Roeck wrote:
> While playing with SMBus alert functionality, I noticed the following
> messages if alert was active on more than once device.
> 
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
> 
> or:
> 
> smbus_alert 3-000c: SMBALERT# from dev 0x28, flag 0
> 
> This is seen if multiple devices assert alert at the same time and at least
> one of them does not or not correctly implement SMBus arbitration.
> 
> Once it starts, this message repeats forever at high rate.
> Worst case, the problem turn resulted in system crashes after a while.
> 
> The following two patches fix the problem for me. The first patch
> aborts the endless loop in smbus_alert() if no handler is found
> for an alert address. The second patch sends alerts to all devices
> with alert handler if that situation is observed.
> 
> I split the changes into two patches since I figured that the first patch
> might be easier to accept. However, both patches are really needed to
> fix the problem for good.
> 
> Note that there is one situation which is not addressed by this set of
> patches: If the corrupted address points to yet another device with alert
> handler on the same bus, the alert handler of that device will be called.
> If it is not a source of the alert, we are back to the original problem.
> I do not know how to address this case.
> 
> ----------------------------------------------------------------
> Guenter Roeck (2):
>       i2c: smbus: Improve handling of stuck alerts
>       i2c: smbus: Send alert notifications to all devices if source not found
> 
>  drivers/i2c/i2c-smbus.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 58 insertions(+), 6 deletions(-)

Looking through the patches I carry locally, I just noticed that
I never got a reply to this series. Is there a problem with it,
or did it just get lost ?

Thanks,
Guenter

