Return-Path: <linux-i2c+bounces-12780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D7B4940D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 17:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFC61BC0D18
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 15:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D6C30F812;
	Mon,  8 Sep 2025 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="busFCn4m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653D30DD11;
	Mon,  8 Sep 2025 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346139; cv=none; b=nopettR18pfGtzxriLTHnMSTixnbFbcDtIvpDiUM1mx59zkwu75AVR4YirQfoI3HeY2UjyzISfvsst4d+vZSdw/SXcrS5udJHP0O9e3MgBfrLT1QwCyjVobuF1b+0WLqu2jwL6mjT6ClwoRPBUUiNI/wjXRnWR+eeOZggs5WDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346139; c=relaxed/simple;
	bh=znzlOlX1SKjgnWUSiOGTq1/TJUFpYRGLYWMA/aNx69U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiQNYNYq2hQUugrZFNbcCzQUN0QqPghJuthiZJfO7B7sW8OlBRxOTr/CG+hQ3DQEZxudUdBC9Mg7RkaLdJdipNBXBtWiC9U+OMvXvMYqQAAsdqJsTbUyp05l1Vpu57JY3zwTGGoOa9LcBa+QtFr8hvELSBD8lErmjUZfgaKVAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=busFCn4m; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afeec747e60so862013166b.0;
        Mon, 08 Sep 2025 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757346135; x=1757950935; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1RIVhHktuInE+YYl4HPg+1KU37wgTUr1qxtdJGS1ilY=;
        b=busFCn4mUY5W2XfQRTCQ64ocvdH1CNfdxBmQee+o/R/AGXfym2AwymKA60aQdW9Ti3
         mXbDyuuXWBNz5JCNl+vvC7YgXsXY6hl2Yn7HrycYlNm8BCNrVU8Q8WsUn4L0mASpDx6q
         bspPKcTPiC/5k6AImXguNN8vM0ft9tK4AwEAxIyBhoB804kdj8TyR39K95BLkRRNCdD7
         UIGwRkwSJcq0LnlmL2y9fNU8grWD0wdoa37jiyd+eZjh0X4FAWwW5DuRaYfCY/qGRdHU
         BwYdIzQ7WhR4wnnDJAiDxgV1KG+suPWuj6b8Efrh0Zfizvh5v72jBHq21of4gH7BApb5
         8wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346135; x=1757950935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1RIVhHktuInE+YYl4HPg+1KU37wgTUr1qxtdJGS1ilY=;
        b=Bp1tNPocryXGwxdhspLFa3sP+gpk/TAsvdbGoQfBYh72syFimToNaT7R0r9N1r7Hxd
         iOrevkOifAVAf1U0oK9/Bvsfrgqxxh1ol9Emv4uV383obHRsdRTP11UacKYl1w+YMzwQ
         HXGW3x8kWnW21rzZnKwKXtd/hVlEk/43dQQRrFYvW+B0REuTnBTKz0P40jRvrqJRYQeA
         197fWyH1Md1FONms3D7PD679Sq/xrJKg8rOPDR0i//t4ioIsrnmFPX1kgIi92PzeItl6
         Dy3Oq844C9NiI5asjTOCgJ1oW9qSztnGOfQtzwkqnTXd3ItYcpW+j39s1iL+Ma4+1gSt
         ISGg==
X-Forwarded-Encrypted: i=1; AJvYcCU/wT9jSn6vGhpOvcqsRzSyEZS6mK/YuDYL+OWaEmKirnLUclHY7Fj2NmJnm5mSATVann4pRR+c7wM6Jq5x@vger.kernel.org, AJvYcCXEuVwXoeZPhN9nPjSGDMvUN7fkJ5YC0R0pRlZhS5SmvYKlbdYPqfD/aG/kUcr075xESy3M7LR14ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzL+FP1MSEgzTJm3gCmZfvFvrF1tRq8470oZvubNKw/3snRXjN
	Y3nib63JXIZVs9/SapGMM6lwnzpuYqRVXpQ6lI4O5qpRnQGgTl/roUC/lcaquA==
X-Gm-Gg: ASbGncux1z+R+OTQgoXrRaXNKkXX3ZwTtF/NP9x4IAzymwK4MWV7ETaWWQyU33lmY9W
	xTQMJTj+VmaQ6AX2pHUli8BGmEPgGEzVMHCM6mXLrQlJ9Tbhz5vDnt8zo6q3AScVk6TgeEfYJ4/
	zRmu45FUXhBsknk3xXvc7QojR3d5tab/qCLJ/qhefU0DxOEDH5S04Ev2ZjcPcdUCL+WcNp+iVFv
	qi0j+yxqiDk5Zol5suS0+k/sGUgUgOd6p1cBxeYmYpwz32zS3eMdavt464CLynzGnhZ81ayXe9a
	hqnoof2zpoAo84CylCWOnx+d5eSDarHShi5fXR9aoDqowi7b4XqtNKYFcziGZnV1yB25hl2QQix
	bCJbxI9D4AROds6mJU7DjXRRDVbD8q5VPJ0Ja/w==
X-Google-Smtp-Source: AGHT+IEG8TPHri7sRvrKF0r+zEeF7Q42N+zx1K2kZvNsw9vuPmKTlrIbGzcirR2qrcIwb0lladOZbw==
X-Received: by 2002:a17:906:c144:b0:b04:241c:e6f6 with SMTP id a640c23a62f3a-b04b1544dc7mr946601366b.40.1757346134936;
        Mon, 08 Sep 2025 08:42:14 -0700 (PDT)
Received: from hangmanPC ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042dcb9105sm1948519066b.2.2025.09.08.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 08:42:14 -0700 (PDT)
Date: Mon, 8 Sep 2025 18:42:11 +0300
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: PCF8584: Fix debug macros defines of if
 statements
Message-ID: <aL75U7i7lyMfaupK@hangmanPC>
References: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
 <20250908133608.45773-1-chiru.cezar.89@gmail.com>
 <20250908133608.45773-2-chiru.cezar.89@gmail.com>
 <8c23242e-348f-467b-adc1-deae06e7ea09@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c23242e-348f-467b-adc1-deae06e7ea09@web.de>

On Mon, Sep 08, 2025 at 04:46:47PM +0200, Markus Elfring wrote:

Hello Markus,

First I want to thank you for reviewing my patches and patchset and making
comments for me to improve my patches.

I am new to kernel hacking and this is the first patchset that I submit to
linux kernel. I'm doing my best to improve my work so that it can be 
accepted into the kernel tree.

> …> Change is necessary because …
> 
> Does anything hinder you to choose imperative mood for change descriptions?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc5#n94

Sorry, I didn't understood the first time. I will try my best.

> 
> Would you occasionally care more also for word wrapping?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc5#n658
> 

I will follow from now on the line wrapped at 75 columns.

>
> …> ---
> >  drivers/i2c/algos/i2c-algo-pcf.c | 27 ++++++++++++++++++---------
> …
> 
> Some contributors would appreciate patch version descriptions.
> https://lore.kernel.org/all/?q=%22This+looks+like+a+new+version+of+a+previously+submitted+patch%22
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc5#n310
> 

After I sent V2 of patchset I realized I didn't included changes after ---
marker line.

I will send V3 trying to apply your suggestions.

Best regards,
Cezar Chiru


