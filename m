Return-Path: <linux-i2c+bounces-3987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667CB90522E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 14:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EAA51C23E5C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 12:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B18616F28F;
	Wed, 12 Jun 2024 12:12:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649FE38F83;
	Wed, 12 Jun 2024 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718194370; cv=none; b=Z1+Tp5M2gbN7NaRV56cMyIs/tEYNXSu1p0xVWSp2utp0KNarkpahIS6Hk32zMdzBR3RCktaKrvevy/YHo7I8mgtGSpNxh+JNQhrSMAbvE6r/3uTBpqlQzCyD65pfRA6Ipn6ZcO3uooyyiiyh4DKWrZrU3EqwpYPfd2TyyV1HbLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718194370; c=relaxed/simple;
	bh=VvWykEFj0IqDX/aWlkXc+2OJkJ4bnwO8Nif0QnQ/jdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsCw4lIE+DLcR8oke++gZMQiJvLD3dZRsP9wxq8QlYpBQLwXkgh6vY8k1HVhbX4QIkFXiQei7iLgi9q5OP2lsjkHBZPrzh0id5eZjFG1Gi1pKmF+i/PucpAj5iFqYVUHryUcenEJTTZwpzxL9Vhy7G6qm8jEvTvj9usZcFmaJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f1dc06298so276667766b.1;
        Wed, 12 Jun 2024 05:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718194367; x=1718799167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCzkCVOO/S6I7xxBKf3rQmzVC4qFCdmvbVAR9bBl8wg=;
        b=LWhl2q7yCgz8FboLl+91EdsGpSRo858erh4R62l86sjyB9dB6aBgGTL74PtM8ARZoy
         MUIrbGIXQvWA7KUEjPt1/cubMMSpTnbuxWoYUQGPNM3+1DaosSj/rHlGS3nciSceKy7G
         lL3uNNigNcxmO2CDW2ilZL4wsZWKyUnNXU2UMm8UU0oy9uKGbWTo//qn2/DDbfxQlk9G
         pR7e3Br64XtOnfWxsZt4rTsV/bJhbAnYzHy4O4QVD4H9aSuulk+v0vmrO7+2x2Q6PTfF
         2wMHbvhzz6nhF5hw2vB/udtG8gv3rWHxLr7CiWd6iQPUO55x9L4a27OkLvzWCBGSFX8n
         kDwA==
X-Forwarded-Encrypted: i=1; AJvYcCVcuXNBk84aOkE45axKIzdsf+9zF04h37hg4DnZSYFkc4O3FV/IyG86OBEEFrzRkcrrBNPWF9/dTm3b+TvRHQdeVdFTSqQQoiNNr0WOQvk2F6maIu2fxqKZ9yLPLElY6Pt3htoeQ2KGkxdSc0lJXFHUJJVFCmENU49I2V8kJ3HAMjGNKfU=
X-Gm-Message-State: AOJu0Yxh0C8quRpjul4XbHf/kaepS0KNNyPLGxctXV1WfQpLmD8WSVE/
	ESNxkWfzVAQf1bLOulpji+VV1AZo8VlNdFjw1qFAn/nJf5UKlFDI
X-Google-Smtp-Source: AGHT+IGR7F62IHl+JO/8MkXnchbbyZFgrbfk/pEQMitawRZHEq1nsIju8Ip26+AE0FN9ZIgHuNsCLQ==
X-Received: by 2002:a17:906:b1c4:b0:a6f:e01:742f with SMTP id a640c23a62f3a-a6f47c9f048mr94138666b.31.1718194366273;
        Wed, 12 Jun 2024 05:12:46 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-000.fbsv.net. [2a03:2880:30ff::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f42166597sm125092766b.115.2024.06.12.05.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:12:45 -0700 (PDT)
Date: Wed, 12 Jun 2024 05:12:43 -0700
From: Breno Leitao <leitao@debian.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, ldewangan@nvidia.com
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, paulmck@kernel.org,
	apopple@nvidia.com, Michael van der Westhuizen <rmikey@meta.com>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [i2c-tegra] Do not mark ACPI devices as irq safe
Message-ID: <ZmmQu15Z2acgAjZQ@gmail.com>
References: <20240606132708.1610308-1-leitao@debian.org>
 <ZmhHvpHlkxe4kid7@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmhHvpHlkxe4kid7@smile.fi.intel.com>

Hello Andy,

On Tue, Jun 11, 2024 at 03:49:02PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 06, 2024 at 06:27:07AM -0700, Breno Leitao wrote:

> > The problem arises because during __pm_runtime_resume(), the spinlock
> > &dev->power.lock is acquired before rpm_resume() is called. Later,
> > rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> > mutexes, triggering the error.
> > 
> > To address this issue, devices on ACPI are now marked as not IRQ-safe,
> > considering the dependency of acpi_subsys_runtime_resume() on mutexes.
> 
> ...
> 
> While it's a move in the right direction, the real fix is to get rid of
> the IRQ safe PM hack completely.
> Look at how OMAP code was modified for
> the last few years and now it's pm_runtime_irq_safe()-free. The main
> (ab)users are SH code followed by Tegra drivers.

Thanks. 

I think these are two different goals here. This near term goal is just
fix the driver so it can use the pm_runtime_irq_safe() in a saner
way, avoiding calling mutexes inside spinlocks.

Getting rid of the IRQ safe PM seems to me to be more a long term
desirable goal, and unfortunately I cannot afford doing it now.

Laxman, what is your view on this topic?

--breno

