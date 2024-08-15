Return-Path: <linux-i2c+bounces-5445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80915953DDA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 01:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DE128A7ED
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 23:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C70F155385;
	Thu, 15 Aug 2024 23:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDV2OMPk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51F812B94
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 23:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723763461; cv=none; b=WlLNVg0WP0KdEjdY79lgVVST4f4WYu9UMGIWNeHywiybOvIUv/lpgqXHBgqhtPeF428Wq/ZPnPKIOAhKvFKGoPe1UHygePhL55GAz1bTLdl2uWDdL9tWY4YLV4glLyW6tZ+iQd8coIwIKUtcNiX/I+ni1XNEeIxAYDXjMcwlzxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723763461; c=relaxed/simple;
	bh=35HVKXraDZgirR5NJWYQtLEm5EsWCXKL5l9bEVWJocs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwumxJllE90LHcKBzh6Gy13KL/FWCkiczQ5ozn8y1WDuQv4Mjo/mRrTUl613xiHKyWSVI2OCPrJfQI16OyuQDrzrRcb2yLCozVcOZauKwxWnLHd2EZ1ku3fq8joM/609bAVJW/YKFm7bWLxdB43W87yLflkWZEaLzNtrNL8NXzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDV2OMPk; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-710d1de6e79so1067273b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 16:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723763459; x=1724368259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjzw/Gnu8Hnch8iWNmpHXzMPDwC9wtRXctV0y4uxsic=;
        b=IDV2OMPkxApOOxB26mu75eiXvEsRJMm7bRy+Xk7s/R5mm1aqjJx4NHb1wj/6ec/2L9
         aWEhsSKGyTQRkuBbz8253PNUysy+wpYKu7R6GQFSuCanIrJ3HUwXp6hswVlR95vSXGpl
         LTUz4pHaQxZAK+iRlO+s26ycwk8pkrKJTpJMVMemi7K9QGKb+vCA5a2JZSE6f838pBDx
         Y1zYiuAzYe6AeZi8NsqTEOkyBA2+2QgkGmb+DLgg25u9fbX4t+2ijZDU+IjawlubL/xE
         jzd3BEA3y9RC819Qzz2jxGW/lbFueSI3GRjFbGzQlC4zhse5bn6IuOd7BeRbuhgv9+QN
         CtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723763459; x=1724368259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjzw/Gnu8Hnch8iWNmpHXzMPDwC9wtRXctV0y4uxsic=;
        b=l2pvcemhy9vObgjDT728LUF6XQLc1Vyv/R7MebFIs1BIbovIrDJrnZD4DX/LYv5p+Y
         UGG3eoXkF/YneWbHxsIEXvpQ5uazefSV/PYLML3nHxOpvODDGunRZZVPQIA/lkTW4OVW
         5jhYuLc/pf7/NDYwPU6jE/j+SsxSOWrRB9KVIVnDDYrGdYaHfLhALiyl158y2NxDYG+P
         omsXSwiS+kaB8JTSv9bc3bx908gsD0CAI0D8kWHITcVdpm6rhe5QYT7Ueki0cKKPsjqN
         Zjpkk7GRn3xb44Yf06Fm0rLAqcIA2/4SV9DrB988P/cdW2pPdNGBYMTSVt1PqC4eiFUi
         Ep3w==
X-Forwarded-Encrypted: i=1; AJvYcCVd9e8V2rmbgN3y691vXVxNuTjb7gCRZOBf82kSOSQD4bYhVJQ4U2F407VY2a3INNcg1y+3frckGjzC/vjEbGbhqzA6xzh9pfrL
X-Gm-Message-State: AOJu0YwwxsxEW4vDEB/uD8HvwjvPQh4nw3QQN4ATy99OM+R8qLx8A2tg
	m85r+wL++yN490pgxOCAg8iEOBpGUkAGgimY06hdOw8YtzZeuK+7
X-Google-Smtp-Source: AGHT+IH9kjIpJZTmrVg7n4Ow4pzjYfz9khBDfIBEeGfTv7t+Hloi2/jzRTyDgtlkOr0yRi9c/mq+VA==
X-Received: by 2002:a05:6a00:3e14:b0:705:c0a1:61c9 with SMTP id d2e1a72fcca58-713c4e37d59mr1475904b3a.9.1723763458863;
        Thu, 15 Aug 2024 16:10:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1ffe:470a:d451:c59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae0df3fsm1516873b3a.72.2024.08.15.16.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 16:10:58 -0700 (PDT)
Date: Thu, 15 Aug 2024 16:10:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH v2] i2c: core: Lock address during client device
 instantiation
Message-ID: <Zr6LAJPqabEMMy17@google.com>
References: <32a2d535-d7c8-47da-a42f-b41d3fae972f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a2d535-d7c8-47da-a42f-b41d3fae972f@gmail.com>

Hi Heiner,

On Thu, Aug 15, 2024 at 09:44:50PM +0200, Heiner Kallweit wrote:
>  
> +/*
> + * Serialize device instantiation in case it can be instantiated explicitly
> + * and by auto-detection
> + */
> +static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
> +			 unsigned short flags)
> +{
> +	if (!(flags & I2C_CLIENT_TEN) &&
> +	    test_and_set_bit(addr, adap->addrs_in_instantiation))
> +		return -EBUSY;

Why don't you add a list of client devices to the adapter structure
instead of using bitmap? Then you could handle cases with 10 bit
addresses as well.

I know that there is already a list of children in the driver core, but
it is populated too late for what we need.

Thanks.

-- 
Dmitry

