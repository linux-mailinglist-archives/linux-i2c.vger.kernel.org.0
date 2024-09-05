Return-Path: <linux-i2c+bounces-6243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066396D992
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38761F2754A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7823619D062;
	Thu,  5 Sep 2024 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1WULtDB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98C19AD7B;
	Thu,  5 Sep 2024 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541203; cv=none; b=ebyRJn0ZitWxYbtfDWpg53Bq+u6HzwGJ5iefJbbluMedOBBBqLJeO1KKk5ZoxePGrgy4EsnrPXtIoPu7c1F4SMJK7vyxvWROVGQgaMwpQ7jRSutBC0R8mjn8a/yOYDr5SO2RnhmAncWXuAz+yUd7zzMhxH1kamnfkqNaFaYJIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541203; c=relaxed/simple;
	bh=4uY2WQgSivZ2VQhFIdlGE0xY62rtVvkAX6QFj3t2Dqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVvrJ4xM9TqAuHL8ZIO3/Qj8Msk0ryvx0HB7uemD3fCcTFbLue9zRPv1YeYq+N3y7YYxmxVckUmltjJrNYuJYoYDV459Ve9J0vLUe2RrN0R0Yjt8WcLa5nAea5BttRWJYM6BhuzLIGGvKFGwWa/JeRIBCrv1j6LCH5DHBovPCAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1WULtDB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53568ffc525so973970e87.0;
        Thu, 05 Sep 2024 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725541200; x=1726146000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8aymMdGqVKINPmql7jmoZbSERwTF4J4EhSuMd5HKKg=;
        b=N1WULtDBQSfmjlOvqE4MV/55XWIVIuvKAL6gN7icausgHiGwTI21OmUcSImpr55a0J
         jzqwnVGPG+zFx9ovsu5TntBD812UQwdyvrrDLwIGVbfN6bJvOYNqUFjpRTrRSJtSygT3
         GtRSZBYjcmo9yJwNCzYHOndXDnOb/dziYktJt6D1vm6hEPhuRrNAFxUylJe3jxglyhi2
         tj6gJHlAWIFchzg4lLj3Lde38wQzMHVxu3drXzwNDRAnWsrQMkpdujAlY/u+3qPsare7
         OXdVC6Ag/cmZovfbfv5k+88NmfqUBrj2dNMkjzPx2pFN/NvlU1ucOOM0hL01AzwPcLZE
         VfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541200; x=1726146000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8aymMdGqVKINPmql7jmoZbSERwTF4J4EhSuMd5HKKg=;
        b=HRGXQZSqd0nzBLQVHlnHUBxag6+smE5qgoFtfFAKGNK517BywET/iFInro9Yt0gORt
         TmyPTCOYxrX9lhJbvDudmJbPryfJpwTFFGpc8BYgCj1hmaPGa8WMWgT9ChkSrtRucNQT
         RwgkOhLJR3IdksppCCv5NBvgYH1FiP6X/m919sg59sOVGArGpDIjoFcRTnEDI80vL5Bc
         25WnP4kIIMZWT6HoO6Q4vqIp7sBOPYuzmpXit+hlFy3TOTPVqRgQJnGLQlqGWgrjA0JF
         /4xqbLoEFGb1QDKhPa3KGDG/dH3eUXsKewxuSqgmomDA7Vqwwv5pOEd7zEOk+EEHIen2
         Y4vw==
X-Forwarded-Encrypted: i=1; AJvYcCU1BesVHSF8o17YoFfIJyODvNKemVmoVMllct3NKuLOeI3844BlxaqafIyv2fhP1elKVmOixLYAVi2u@vger.kernel.org, AJvYcCUUYNHR7XP6/zSxk2TC1K4izRZayFMaiVPznsqmJnimi2USRxDlSK2UO6gnGFVkb0qL8HbOk8ZueiG8Ki9EHeg=@vger.kernel.org, AJvYcCV1biotWukQUt58KZ6Zbhl5xID0laHbwcQtE3NRk2/Ed/FmjnMueFcBxT/X9xfi3AaLLOyLz2L2L38=@vger.kernel.org, AJvYcCV4yTc8CLN5/VLr9GG9tjEChQXc1c07MvbHbCVB/jwTZzpB0d1onkZjjy3wk4Wb1F3DlG7ZTNqrQ/+lwMMc@vger.kernel.org, AJvYcCVUtWuc8R4XKjFJQyt5BwIV7kFwkcpfM3tVbx6z1Gz7YvEatFZYegmlebl4XI73aN8/RB+cN/M29A==@vger.kernel.org, AJvYcCVwuFXCdhzb40YdSiPxuaMmLnOxuSwvombtUKU5Sr7CMsbb+Ui1f61kv0RSQJZU500KOo86vVGMJYqG@vger.kernel.org, AJvYcCW6nkqaPXIN4LnVpf7mN3DXpI/MA1xoevRlGrsvpMkz1FUd/20RlUl7FJdMVLQBfXgphFCigGa3pyWtrde0@vger.kernel.org, AJvYcCWEecFgdqKzTvhSxrrWGWQ/OrsJyOEooA7lBacr9ioiGwBhxpVf/3P1gastEbywTjJhBQnAQUiSRn6nlT0Z@vger.kernel.org, AJvYcCWmszh4Yu7QYE7Egay+QeV7/WontReBCGcz/8KLuOE89kAcZU58n5uZzbY7j5Ozc4DUTR7NWiFV+fZeXdNw/Q==@vger.kernel.org, AJvYcCWyg27QU2Nl7cTXh2AI
 9wmt30uhahZ8FxtIVNwqmb/3C4ca+Ad0ESkRid9o1HN2SeQ8lkWLRPuFj0tgcw==@vger.kernel.org, AJvYcCXH3KoZtiPO9PCVq7yB7q559oPnkp5qnuWqzSCxut54Ne3+jtdkfP7cGUgImfHTNfgff9euNGBAYUvnJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjn9Nn2jss0jyaki2jhQiKY7KwSX1l52bTbd5wXZ94oZfqWvcZ
	GAXR3QsysrhS5VJp6Xomj039Efd7JeZPzBWvBTygIyCCvNV4oOPk
X-Google-Smtp-Source: AGHT+IF9QchVfib2TGNl44/PzgjS0URPqGUjbcmYR3mRhZSVqTrRZTQB8Yjb9zSWYe+zZesnRPDrWw==
X-Received: by 2002:ac2:4c4e:0:b0:52c:9f9e:d8e3 with SMTP id 2adb3069b0e04-53546b40c79mr12956646e87.31.1725541199344;
        Thu, 05 Sep 2024 05:59:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356cbbbe15sm242758e87.211.2024.09.05.05.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:59:59 -0700 (PDT)
Date: Thu, 5 Sep 2024 15:59:57 +0300
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com
Subject: Re: [PATCH v2 00/21] arm64: qcom: Introduce SA8255p Ride platform
Message-ID: <rcr6bphq6qojq2cchv2vurymcio5utgaa63a5p7pry5pslab6d@q4fi2pkdxg3r>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:19PM GMT, Nikunj Kela wrote:
> This series enables the support for SA8255p Qualcomm SoC and Ride
> platform. This platform uses SCMI power, reset, performance, sensor
> protocols for resources(e.g. clocks, regulator, interconnect, phy etc.)
> management. SA8255p is a virtual platforms that uses Qualcomm smc/hvc
> transport driver.
> 
> Multiple virtual SCMI instances are being used to achieve the parallelism.
> SCMI platform stack runs in SMP enabled VM hence allows platform to service
> multiple resource requests in parallel. Each device is assigned its own
> dedicated SCMI channel and Tx/Rx doorbells.
> 
> Resource operations are grouped together to achieve better abstraction
> and to reduce the number of requests being sent to SCMI platform(server)
> thus improving boot time KPIs. This design approach was presented during
> LinaroConnect 2024 conference[1].

Please don't send new revisions as a reply to the previous patchset.
Always start new thread for new submission. This is documented in your
internal 'upstreaming' documents. If it is not, please update them.

-- 
With best wishes
Dmitry

