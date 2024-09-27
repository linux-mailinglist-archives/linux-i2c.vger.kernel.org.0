Return-Path: <linux-i2c+bounces-7060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF6D98865A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 15:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF0B2B2169A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 13:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729C418C03D;
	Fri, 27 Sep 2024 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxFDqsb7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAA282FA
	for <linux-i2c@vger.kernel.org>; Fri, 27 Sep 2024 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727444268; cv=none; b=qHk+39tIlFzoLuFYwVjGKbXm+BhEU8SWBUiJknvtwiQ5QF2UxoTgYwYLWi/m5hpdAbLW2vOOmtnUM2ROB98wAWdI9hwHA6Ij8deYuZwnMtJ2hSM69iIVXcfyZ3G5F/jOLmgFLNPT+oG8bR5RvsxrIOSsNLMsxHdR2EANgeYjaDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727444268; c=relaxed/simple;
	bh=8+XrPKqnUh52/WEs6iih8orIABMrXolWdtJgG75l2U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7Sz7WG08hNqmjBfL+KVCUJbSb8j5FuRogUxt84F+RCNJqOYn9Ub9IFPtQ/YgsqL3dlm1nezt/jmfbu1uFFkAPd00qZ3jLBcSZso+n973ECkHRhv7GWmotsJaNv2LmtoE6Qc80EIgBo4z20dTHthPnl0fCpsA/sz+Mfe6sM7FYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxFDqsb7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f77fe7ccc4so25014981fa.2
        for <linux-i2c@vger.kernel.org>; Fri, 27 Sep 2024 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727444265; x=1728049065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTH6ZrGkkYMdX3NtmPgD5++jH73M4Mz7K2Vca6gurDE=;
        b=GxFDqsb7E7AHG9p0HrirzKJCKN8zlNeJtZSmscHi5QdglvtPV392kfRH795vs4pJaQ
         sXPfsGhU8UtuuY+mHAjvCL70c+y/IVTLAdUHosFiHs6trB3cKXQyMx5ITR7VVzYQUMst
         bqdom+Pfqvgicsk6ft2qukqWXMOYz60XWigOClL1BoPZAbR4MT5qiW4ids94i06IMUBn
         1q1fmGXqPeGUBHigmd3T5J0emLbFxZrBN1VPY0FJWt/MGFBXFbXvdEicTZtuhAKOGqmj
         iRpu+2XG8kKzFVk9IarqYBjn4m8sJJnbS/Bes3qiWqbh3+PjlH5eYF2TMr6EJTRfOb5H
         iqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444265; x=1728049065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTH6ZrGkkYMdX3NtmPgD5++jH73M4Mz7K2Vca6gurDE=;
        b=m5G0F+JiIHypIlbKD0MbeHkX2Y2ygD1POypQ3TnFy1HGLlDa7JdIwucUuw6g7v/hj1
         EOtd6ly/tDi0+e21LpK3Nndbq69ZNvzRsP/nsSuR6frDezjJsy7lyWIANc6X5+jwveAG
         f2tYU/iB+dF6H9a5N11N9AEwnQZXkfi7797WFJ81u6V4o7N3Y1fiBKlNdsB6eq0gi0fJ
         jJM8RrxzfM9/CL+N4pxYpXgYZdaqIccY3SepfSY71B6Ja8TX9uktmWX07eD90Yvij7xs
         SIwA6iSmtgT5ZpfLqC4YfAWgwlnO2uXU8iUC102Yvq/0xVIZozJ4bzTM012noHAKchqP
         HAbg==
X-Forwarded-Encrypted: i=1; AJvYcCXBm80tAHL5YpXOCVVfo49J6zse3ULg05QXmEh2DYOSI9BbW95Vm+gL7xUcSzGmvnxvPm8vrlsovlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NNS30fRWA4dRRKNDNIuqgZWJPuTwA0dqTrzUcZB0bOZURSbx
	pfgTKV2eoTriYWl4KyorWngz/UXD2QG+4ZfvVwK63bhi4kP1ZJpGHQaKElCd4CM=
X-Google-Smtp-Source: AGHT+IEUIoPYdTceER1rVfUCySlMutIai3Lqj3bSsJ9h+h/0Pde7BjN6J15KYzNhMNUKFuRKodedsg==
X-Received: by 2002:a05:651c:1508:b0:2f9:d327:c7d2 with SMTP id 38308e7fff4ca-2f9d3e6ab01mr20849791fa.27.1727444264807;
        Fri, 27 Sep 2024 06:37:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5764c50sm2491326f8f.112.2024.09.27.06.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:37:44 -0700 (PDT)
Date: Fri, 27 Sep 2024 16:37:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: andi.shyti@kernel.org, shyam-sundar.s-k@amd.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: amd-asf: Fix uninitialized variables issue in
 amd_asf_process_target
Message-ID: <f5335fe6-ac72-4223-8acb-5be3e9c89cf8@stanley.mountain>
References: <20240926151348.71206-1-qianqiang.liu@163.com>
 <cc527d62-7d0b-42f8-b14c-6448d3665989@stanley.mountain>
 <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>

On Fri, Sep 27, 2024 at 09:34:44PM +0800, Qianqiang Liu wrote:
> The len variable is not initialized, which may cause the for loop to
> behave unexpectedly.
> 
> Fixes: 20c3cc299218 ("i2c: amd-asf: Add routine to handle the ASF slave process")
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


