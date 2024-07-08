Return-Path: <linux-i2c+bounces-4749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA418929BCF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 07:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 612591F2159E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 05:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02EFD51A;
	Mon,  8 Jul 2024 05:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuxImaov"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7F1BA46
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720418021; cv=none; b=bWB2nCMid7rHkJR3exvwOS/KENbpczl5rZgZR3e7W8Pu1U0PlTMjcmRNY+4WT82AszTkl57zI7fHwysTX4c2tnpn4ywGjQigLetNopaxMhr8T9Kv60ffp/Oatt0s0L6iaCB5tlpbutfW9pDyIKtb1lxoYqYwcqTf+FmjyKsr/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720418021; c=relaxed/simple;
	bh=k3sZegvgCSRZDvxaCGbPMnrHk92nUiiu+U/vHSWHQ9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxngKWdHT7Cxf6lsC/ZmDAADSOCYjVvsIioui7FQ1DRYw0DFJEhFQWahkYhY3GMsmeriYbqrIqsz4hn3z8ETT76VmvSHaASB9oWqJR3HZrP4G06oPnxjZDlRrtGZplDM+afVkDD3hzmlR4/WftHnhytmM8AjdZEqajw8y/S3ums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuxImaov; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b1808dee9so811161b3a.2
        for <linux-i2c@vger.kernel.org>; Sun, 07 Jul 2024 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720418019; x=1721022819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MnPLFqEr5wWUkJ5Avv6Q9E12ojEI+o0v8AA8IEQyjg=;
        b=uuxImaovyyAqyUjnvOv3biPnAlMXv0yydD26LUlIB90uDJsyZ0HOHAErWfHIAX6Tgk
         TeBBxazYai7oKN+OWl62aNBQaLLudjgEiIN4f89nMNsQj6+vJiuKJpZQMdHRy+RuoNzV
         dTQymJ5zdJCYdhQ5mGLvZE8+lE1J4ZR1j/QG3oEdVv+cqxwKDX4N2wto6fXwMY3qV+OL
         NaMBuIgydJo/049IgdyQktzHdN1EJvOZ+dWfJBseOaQfVrV2BjdzVORUfRIibSDxxMhk
         CI7B4t0gGqplawPDOWNKLf/A0vZOl8cB6xqJV9VyH90gxQgIwcyjOR2RAjP4J1SUu4tJ
         DVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720418019; x=1721022819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MnPLFqEr5wWUkJ5Avv6Q9E12ojEI+o0v8AA8IEQyjg=;
        b=dwIZK3PA9N6GO6Nz3wC5ncftmpU7fJ9SzCxP3aN8KcpQUjD88CGoG9/X6S2caUQpGM
         YBqs8BsDMn3XNGXlHeGzcCJlZnWL98PD/XzXRf99ffFugIqyrOIXeoS+ALePDzxpRTEk
         8mITxsAB9Fd4TCLlkvCakEt9KZYcZjn+kb5OOJIs8pOn6fGoO+/3Jkd+JAkhkneqZonM
         9dJj2hNjMYX6ijjinJmC/8NCCgeypr64BIsYGDAdDu3GRhlUwv0FYMzaqYLJPSCSMOVF
         6t3/o/cgFNhMt6cyW3Dl7Qvgr7Rq/3nquVFeU+k0d/9kM+iFKCh7iOeVTlKsxic9Ha93
         WSlw==
X-Gm-Message-State: AOJu0Yxt+8+Zlz8Ct/bKXFP/vl5sXFUcaJ2Cs1TVcmkZOsG8UvFJ+i19
	IDE3m9Up/sBib/w949MfIi4pBfh4TaJJZ/Wmi+c3C57O/ifzMvohNWL/EvRgZrQ=
X-Google-Smtp-Source: AGHT+IF1hOX8XoGx5HyaWGW+Cyy7qlkkVoVp1tuooj1gaUVsR6BxjALo8kufZT7NlabK0CHhfGpMTQ==
X-Received: by 2002:a05:6a20:3c87:b0:1c1:a257:50de with SMTP id adf61e73a8af0-1c1a2575f9fmr1302191637.29.1720418019366;
        Sun, 07 Jul 2024 22:53:39 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a951741sm7333159a91.15.2024.07.07.22.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 22:53:38 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:23:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conghui Chen <conghui.chen@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 58/60] i2c: virtio: reword according to newest
 specification
Message-ID: <20240708055336.5yquzurmoydscvqf@vireshk-i7>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-59-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-59-wsa+renesas@sang-engineering.com>

On 06-07-24, 13:20, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index c60ae531ba57..52ba1e0845ca 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -183,7 +183,7 @@ static u32 virtio_i2c_func(struct i2c_adapter *adap)
>  }
>  
>  static struct i2c_algorithm virtio_algorithm = {
> -	.master_xfer = virtio_i2c_xfer,
> +	.xfer = virtio_i2c_xfer,
>  	.functionality = virtio_i2c_func,
>  };

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

