Return-Path: <linux-i2c+bounces-10969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6569AB6068
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 03:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6B953BAED6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 01:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9171519BC;
	Wed, 14 May 2025 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWdg4JyX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69653D984;
	Wed, 14 May 2025 01:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747185430; cv=none; b=sfbN9WxxUCUkOIrCzHihjlUbXqBsxcPnZr/7H0OtxfHYoyY5Rw2gCUajjwgOZXT5FrxG66YwtKPjV6KuAVeEaTsbNtBH7JEWr/oqoT7z5+26H5v9Wx6b+b3llKm7MJE2i5J5ta/9B+fzlcF3CbmE/2WuhBfah6uUL8/sq8QCnAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747185430; c=relaxed/simple;
	bh=nSrQLIIz5NOYeKv3kZaGWloZT+mJKQ6M7Z/Z39vrA4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9kttIrdSA4BDmVb5XdFaZEMNhbM2TFE/BCTLdNvhS9bdCu9yPsVwDdMf4YwRInw0NCporIIXmqAdbawdcXWTy5Um/JyMIqPhpdoNGTqqFTI+CYzvpKW7223lLJBwwNvGJdd6PNfm2Q4LUrrjfw7i0xL9loKMK45DiQSxGwnjko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWdg4JyX; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f5373067b3so88991426d6.2;
        Tue, 13 May 2025 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747185427; x=1747790227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEaVOh/9lfsZXQCmNPE6lSqX4P2H8nzTwz/gMp/qKyg=;
        b=NWdg4JyX+k3PGBStFbWwTw1A7SF6FnE9w9WR1oBl0IbO9YbLgS2Ym+ChmRdGA4m/2v
         n40tn5RWhUDlCWOgzfKW4zUHDJxN3ZsEvYhXwsTQyWwsEpa6rANqgJLMmWJwzKKhx+2H
         hU5/XxuGbjtVtCrRVWLAT2mqMxxrvNNw5oQJP860lF1E2BRAyiUNFBQERLqHBwK7KOj9
         KfHdOxxsSmAsrlxZLZ4guj11L/WDGN03utEM4U5LXkj5ykiyzy8aLxwsbVSgACr6Fzw6
         G8HGT0hDFqp74ZbLsoDrf92l2HF4X7ZX7xj0wQpf8WeQByz/O32qkD6HsmbQ0EtJWuDz
         OBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747185427; x=1747790227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEaVOh/9lfsZXQCmNPE6lSqX4P2H8nzTwz/gMp/qKyg=;
        b=E2e3kNPUAP/9tfAE7ICVzc2YXe76mmfk0H1AbOhmoU+miWI8fAbDajTdSMvHMCmHs3
         e0A8iZ7U2vt6rfSX+uSwVjd2S+1osy4qOaYbMXX4OWyPeC8RPd6tPuYke0JRgaeARp9v
         EDpGNHILYg95mta92hohu9MFiNyfPtg7xOa9LIFrN1g/PZfekMYDUKYgHXF3pBO928v/
         HjjjmXsWFSrseB2snmRJtCNSisb5Ipe+d+04V8fPSskBvfGntIV8DvF56alb0AV5YY82
         xF9ovAtxzmmVhxSJUPTepA19aDggQeMTepmgxypPtUv8ef7WrsxxvY8Ol88LzdoJDhyW
         zT/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdzOOHr2ij+GdVONp47UVhytscV3icsMi1tdqCVQbVMQA7kt1gaZWQyTXqNlfBlOhnwLYVVaPU7IWY@vger.kernel.org, AJvYcCVjn13RECH4tglXPaDJDuMYX+qNMVmKEGiBz2+ZjunfYPZDeQYiLVkAYFjq+5XLWTtP/NRJP6lktEIKnQLn@vger.kernel.org, AJvYcCVpEiOlSllR1f6W4SpjBG7nkUT/4ihMthXxrPlNvv0kvilJXJJ1GyS9hDcG7FhG8iyAoirSM6OTHHM9@vger.kernel.org, AJvYcCVpigvjM6nC3jsaWFQ1fSvDWkM1BAaxbxP/0SVP/u0k2j9ztg6gavanyG8BTQmmU0WnDUCIHS03JVai@vger.kernel.org, AJvYcCXhminsnedlBW3vF7JvAO0IGqGISrcNIZrMBMMrPr3e1kDJl9YibzxgnluSDHfH23jBIci8Xzhj83EDlVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyry1cmqnmo1rSGHOU5znnjYgaD+CceGxCAJWWSQ+EY7U+B488J
	eyJotgQ0msaqSeS8WVpodfZamOXj/Wi+Mh8MrOxzvtPpvtTF7RAF
X-Gm-Gg: ASbGncs+XNjovWJGQyftVMo+1Ys6K6pFLMgfB2BXbRupm9x8IbgOCeyhkOKmheuKlpX
	+gGuX43KEC82fG0VWmmT+aRlU2FrfZbRrxQYqfe5s82aQCTorhpHZvvFJoEBfzYMgT2Fy5GWjkt
	/TzPgNlyabfWMa77M/mPaVndE61+z1d5Q9MzvRzcjdpB8nQo5GzAZXkNkNJ7bk4cYlVWkwoxbIM
	5Bd/zdFhWBHC3wr0qfPIny/SxWfJXRpNn3Ha5gvqWQmJC4S0XEFMX1ZZpaJ0WAsQqdiC2LRcR0O
	VYoo3bbPD/9DzG7IFSWpNEY6vkI=
X-Google-Smtp-Source: AGHT+IFq80xt7wr+N4Is1nsHfkVqlHuQBXPmL2/8vRvaUgO/7OiqL00yD+wmu1pLVR3Zg8H9LoV5EQ==
X-Received: by 2002:a05:6214:2468:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6f896e4c936mr24184336d6.17.1747185427543;
        Tue, 13 May 2025 18:17:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f588asm74175596d6.49.2025.05.13.18.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 18:17:07 -0700 (PDT)
Date: Wed, 14 May 2025 09:16:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <g45xqtuit7apkduwsfsmw7giqttrb7kjtobejs44rtslx37ynp@ugic2medlczo>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
 <aCNYItP6SWImMvFv@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNYItP6SWImMvFv@mai.linaro.org>

On Tue, May 13, 2025 at 04:33:06PM +0200, Daniel Lezcano wrote:
> On Mon, Apr 14, 2025 at 06:34:56AM +0800, Inochi Amaoto wrote:
> > Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> > compatible string for SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> 
> Applied patch 2, thanks!
> 

Thanks, as you take this patch, I will drop this one in our repo
to avoid duplicate.

Regards,
Inochi

