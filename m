Return-Path: <linux-i2c+bounces-10986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115CAB6DF9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 16:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70DF77A376A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBC41A0BDB;
	Wed, 14 May 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRxzxuTT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171818E377
	for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232317; cv=none; b=mVDd2ayPEKRi4Cac6f4H/DO96G5k4VsrkVtemoXjajgydZOgJ5VmT54xt9xLhwwvCTaSFBqqYcKhcadLrNWnILlKG1WWLxQFOh4NgeFiynhiS95cjA7Vp5z/ddDa/GIH24v48zuMizgpIZRbvk8EvBEZIdnUpRv88uDn++1ajRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232317; c=relaxed/simple;
	bh=jHsA7WLaZAQUssN/Gkcz6ehZZJvqAMZ8Q9SHY06sn3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNdHUej4xjQnVtN50vDaBqekzHK9U/0JXcwB43G/UdvFgOmHmNh9S7EBpm9r4oHP2qh6HTff2zqW6/ksEAW2Py8M8Gtt1cSeQphXzxrz8dtfF0kPZCc/XeiruiGpQ3tj/D/bmScBH9huoXuhaerXQWUFsQH+25smuHMexjqoIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRxzxuTT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so3375350f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747232313; x=1747837113; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=SRxzxuTTbN8XuYsKfshneQIHrI5xt+1ppK/djF2971+1Vy2jJPp8qGCBQSi44Lb3On
         IoSuu9bwVirXecmJZr9wN/SZAibIDkPiBFbvrcXYxq0f98nanuoIxGhmRSAyzdjLHn5Z
         YZKICCCExK5lvbtaJQgGdWOGmTvhVZcFRCqwYWm3XJhDVXnqgyvMjz2UdAr1be+8IZft
         GSwAoc2v6qsQsTaW+4fQaie8L7gyAEzYNzB/oEPtcw96/OzG7FAL32/1E2iSwYUPTDyC
         MYWAjiNwuJ3Fxb4m/AL66Yj9MckfVVP019Uv49fTE5zB2LAg7Jk+e2Al5kuc6sbDDRq5
         GmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232313; x=1747837113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=a9DRGrd5f2iMIM87NWfpQSQ0ungvo2xH86hV+gXWdRS9A1oAvZKO+hBPGc+w/YwiOQ
         qeQg2/RS14GSGzXBnerLMNE6Vf4OS+ldlaUuUh4ldiv5Jza1JHiSuxfLzLcETL5XO1jW
         nz84ku9fiHY3m/1UEVSgbXeK5bsIfwJ49SRIb5Vyu8Mw/c3xE6O53p5IWinxTBVjtG7B
         DCxYiJCI0kO7hJhQAh0VU8YgwOt44uk2L0JAv7VAlFTgIiHhOj1kYOoen+p5o3gk+iUG
         6N0+B3iPuZavH63i3P/+/ITp6g9NSQ1o4k240jtIiInUMrgCiGdvhVCSoaAO3zhLvfVH
         Xqzg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6BZpplCDqDeKulc9eK83UCcguV1hjC8+00ad5bEd2Dgqzr3L/3pBY1afG83hfOnJKb8a8tlP93g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+77XTai8ql9BmhQjyPTTb3MzVfOOuNBDHvF/txU6DwNUlilaK
	F5ZeJCSt9qEXEwhVAiSgWyS8tWoVmzE3Ji6ETu82Eq7L7PPjCgr/WbGzhOM6SDMd7UT8WstJK8v
	rOwt7XDxG
X-Gm-Gg: ASbGncts9IBctDpfGW2zTuZgvrrowRY9CAzwUe2hYDt+I3OkagOguO8U2z7Ct35Fh6K
	L6dA02CRWz2RofQG+Hh6dqIlPPFku99Mc2/GjQJ5G7Hrh82WRT3Ho2VuhPOobPmfHYVvy2vx3lI
	X/Gbp1eIkNTcRkDeRS2EToJF3UhJDxrrx18L4c9b3+D2ERGTDOfR9IWi1isdqj8eTAG7/yz8Pcu
	NPAw3CAsA2XSe30yA1RignpTWSNb3us640EMiaM6ys9ycbQxB1SRU2wsbnZOX7tGnsxqLf6SkF4
	zu7R2Ylx/eXkLOzOWth7MQpbWaQrw4vdXCb1gmj6PFRuyfkODxvguUo/Qd1F4ceh5re9sN6NQEN
	3Cr8v4SgqMTzkSg==
X-Google-Smtp-Source: AGHT+IH4+d+Pry2CNpgKUNvxX7a5CyUBEerUkhvVVYoJxhPCGMW/etsCZMqBlMg4OuejtHCSPvBihg==
X-Received: by 2002:a05:6000:40c9:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a3496c1ebdmr3217848f8f.25.1747232312583;
        Wed, 14 May 2025 07:18:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm19729450f8f.86.2025.05.14.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:18:31 -0700 (PDT)
Date: Wed, 14 May 2025 16:18:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <aCSmNRTVXQ51xj0m@mai.linaro.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

