Return-Path: <linux-i2c+bounces-9716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54217A4DCE0
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 12:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FB2D7A6E82
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 11:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5471FE44B;
	Tue,  4 Mar 2025 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIFAl15s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F23D561;
	Tue,  4 Mar 2025 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088799; cv=none; b=BC3kj7zBpE/FfcnoUKwOf/l6ow594fs+tJ3GiQLqNTZL2mL3al66zYW8NR40VGGuuZNIG+xNY6eyd/XWC91b91Qf/Utu4QMkwFBuybuN46USuHfK5NsLII2aUK66wrNHD095CLLwiOreM7oqmEN/Ut3Q7itl9z5jFRqRAxmlUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088799; c=relaxed/simple;
	bh=DGdpbwsprKb7q5vHU7Qkn/Vh9qRIL24D4EFUl8V+ykA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZKsSuXiTiQv4iFtjAg6BYDzTAvjuxeqOSNljHK2i4P0yffoUucvzRWO7DpMedLZEvvpyKjhyaRAtyfEzqhs6FCuhHL2hYefmoHkrx4xFJ0t1YIBophZ/Ly8ZZhLnTMS5x3qQi+sTc+TglwmwHu9rD65m32mGNYJHHPQyOD5wK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIFAl15s; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c0155af484so762935885a.0;
        Tue, 04 Mar 2025 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741088797; x=1741693597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxl4weZ8h9bua9Xeo/sLQwpKElrEeP5OhrtstJ4mzm4=;
        b=lIFAl15s2Gx4wsxbXCsC29ogsJBl0BrNmDmowNtO9TIl9bOFnaTHxPmKXb2+sOq5DJ
         Llm2OQxNbl898RqQQ6H8dVr+8xHoEgkfCVuCl8E9p3kqCIHhtJtLIwGCle9Ft84v4ztJ
         OifGDIk5PsyawSmmr7iYaL7w17R1RnxcDjpMVngs80p9hqoRaGCj2kLlCbEsU6K13UKk
         l6cCdc9QGb/TLoX5w2H7BQujKQ6PKbSm3UAVM+qLbaxu31LSBTU/cN21o6pTZcHRm+IM
         RnJ5JELrG9j4757l8Ex1H2gR8Fij7GPFkfBvXz8bVUH9eJ8uapadw1VQX9gZvml+gVHn
         Tkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088797; x=1741693597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxl4weZ8h9bua9Xeo/sLQwpKElrEeP5OhrtstJ4mzm4=;
        b=UGxHGMIGhZk/4DMpluSSi3mmkuGRuf8Gn8Y1H9drD3UNAkWdm3oJV0q7Y2/7lshR8p
         BD0YRyq7fXCgSueMycFIYyyS61DDvR22I3G3JFcw7IwO3ylznkGfc61+zBUu8sPjceI7
         tGpB3bWH+0R0SiiaQ00SPoYX7Xrfoo/zAPEKRbtywEEG/3aaeTitDM2LP4k6MT7k/RHB
         UI6lB6yCVfNNPMGKSlAAUwWixBblQAbFkRHakxvX+/IZmXFRB0g05kqSxlFhxjUDPJ0z
         lwaMzOcRLy7mVfmj15WxPSqcT5jsq6GAy4LB6uCEA3yiVk/LAcm9t5Lgss0qkrv2l/2a
         Fa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXHdmeVxgAi+/YBp9lOAgEckIQdU3pmwyuIELXklBx+kOudYpILKCsvt4P3s2Xv8rxWIKcj3Ku+gpZdw/c@vger.kernel.org, AJvYcCXOJV52qNlDFSKRn3dHZ04UKSgdLKsSo7niVB0/Aunlea4QiPCZMc+j2IrRg8qxI+TMo+le/if7Ww4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVShnVVCsfJQnB2995ed67z86KyLDpyopRzjdtFGD7l6VDvDI
	GQk/wyJNAGADpiPtxuQ/TF3y9bB7cVxpWFo0K8t2yJsGgA6fHFBU
X-Gm-Gg: ASbGncsQjKeyIj/Unj3AIRAvUftRqdhC7l9LSB9xPIDOf8qLbETeM/Cd59LFgv+ja0t
	YUSypvtAfjRdQgDWDHg+epynYHwAhyQZJz8eer3J2jdg6wG33FsJS0Qn3b4zgaprVDUpoQwdQ2D
	xvxOggag/sUffoXHuYPh5dyjMK75Pc2OeskoP8zeceL1lqw+7cvGtQkNHHL3fDCd7nxNatpdc2T
	bJ39EQ28cM9rr67brywmEvpJEhy8j4Pc0etWEUQWHqo7zUngvyrpfZsL/eUzd7bs28QPpPinxqV
	3HQv1bqyop9lmjnEbkxx
X-Google-Smtp-Source: AGHT+IHX2QBDRSDkk/0cTi0b+LBdwuu5wiKDqafVZWjNbHyGvrvU8Jiv+1GaAzAmv/hah2o/7T453w==
X-Received: by 2002:a05:620a:1a8a:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c39c66d3a8mr2936867385a.53.1741088796817;
        Tue, 04 Mar 2025 03:46:36 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3bc2c38ccsm265845985a.66.2025.03.04.03.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 03:46:36 -0800 (PST)
Date: Tue, 4 Mar 2025 19:46:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Sophgo SG2044
Message-ID: <53dkcpiewy64hv37kpqhrvpkprr7mgg7bl6f7ofpmpl5utqbe6@yldveipvbisb>
References: <20250304070212.350155-3-inochiama@gmail.com>
 <Z8bnX8zcY3yIxh9n@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8bnX8zcY3yIxh9n@smile.fi.intel.com>

On Tue, Mar 04, 2025 at 01:43:27PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 04, 2025 at 03:02:11PM +0800, Inochi Amaoto wrote:
> > Add ACPI ID for DWAPB I2C controller on Sophgo SG2044 so
> > the SoC can enumerated the device via ACPI.
> 
> Same as per UART:
> 
> ---8<---
> 
> This is fake ACPI ID. Please work with a vendor to issue the proper one.
> Vendor ACPI ID registry has no records on Sophgo:
> https://uefi.org/ACPI_ID_List?acpi_search=SophGo
> 
> NAK.
> 
> ---8<---
> 
> But, it might be that is already in the process of getting proper ACPI vendor
> ID, please provide an evidence in such a case.
> 
> Otherwise drag the representative of the vendor to this email thread to answer
> the question why the heck they abuse ACPI specification.
> 

OK, I will ask for the vendor and check whether there is some
evidence for it. Now let's pause these patch.

Thanks for your info.

Regards,
Inochi.

