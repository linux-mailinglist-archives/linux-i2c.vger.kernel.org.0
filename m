Return-Path: <linux-i2c+bounces-4750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286C929C11
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 08:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6631C2139B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 06:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D17714A85;
	Mon,  8 Jul 2024 06:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRj4H/AB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B1125DE
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 06:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720419583; cv=none; b=D3eUIKw1g5dpypCAAZaLzA3mx8tAJ4Nl7rEHMwaFD+CqDyxINjKWm3KflaumadRPOeTXQQ2pBi/shBTVBi33QEjQvZSa2ZSBdWBkwwEYr5U88RDu2PdJTIj1y1l9gIIN7NrhOEz1EUQaOlbCdCq5o8BzA0Sd+qTYqgKRkCCvGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720419583; c=relaxed/simple;
	bh=FrGPK6EUaCJAvbMMnppTmGDP+dhdPamdST74mTb7oEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEjbOk3AXKzSQU6sIREuwONNfPfJoY/+qBN3tb4EMrqY7DJgB8Dci/uag1aE0emJReZHBWwSsVUYviF6EhUI2J9BSKybZfpHz78TmpbGSCkEI6piF+j7jRbF+9QdMttchAjl/pqAHZrz312zouVUh/8R6J+jPpKxI3W2m6pvTao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRj4H/AB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb0d88fd25so22160205ad.0
        for <linux-i2c@vger.kernel.org>; Sun, 07 Jul 2024 23:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720419580; x=1721024380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGhefo6o5KFmf2E24R1Dpp1qvNYp+Ydk7KMCxppdO9I=;
        b=SRj4H/ABZciDrgepzA4fD53E3imG6QAxtzu9YN/p8HA5pPVh6hDoZ93hkoOk6+BlUP
         yIPnwbyqGYNboKNPEHw1oLRKaHbYsz4DBliXHlWqxLBxBMT+SwwvnedFNoGxD8pUMB87
         QQmFiQ/dLLQtoV548Hl00LL4rBbDX0bBJF2y+UwdLG74cZjpwb8bd+ccu1Mn5v7rSTc6
         Cz5LlSbYlSGfGIifWIp6lWJ7mw6J9thvXFuBKVMWRK0O21A1VdM4TNcwwPlS/3YRqq26
         QEr6pX15PVWiPmL64PwQW2lfoizwo2GPYzIsVjIRw3QaJmsoqhfPo6oyyzvtEfmnmC86
         VlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419580; x=1721024380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGhefo6o5KFmf2E24R1Dpp1qvNYp+Ydk7KMCxppdO9I=;
        b=elQBpf1IAV0wCLA/8youGsVefShPnMksg06/z3au37nnt2Rst6uwAcjkmEen1OYnh2
         GoAv66V0tzo6Gbz0ci17z+HRgQCEcHbXLibgfZnZ9KJsASy7DfJ0mK8SmPjhgW/Qb/LL
         phRo1NtFMsv6Xjlc3F4N+i0vgkCU9mtvSoyVoQK+0hpwR2me9k3QP+p0hCWXbFIFXHT/
         9qM7e1ynGsAHf8U4/TrO0ljqVg7C/MDjCkak75QXgpjPslOojoHVnfdOJWG5q0wnZKux
         gwXTSFEWJY4NqXwnVqmF39otUXF2vY6Q8OmjH0b5GpdXmhXJ8ee+C1OjXNKtzwErvo3c
         eSgw==
X-Gm-Message-State: AOJu0YwOTiUlvP3d/eTLtKJEE5v+PT0nvk6DzKo660sVSOInHXAYwcpr
	tBGOd2gZ8ZxrPciGY8vhs/8xgkNKH/sapBolHNHJ4tkSj/t6D6qmGKRAFvnVT1c=
X-Google-Smtp-Source: AGHT+IHTWReOqAFX0YrJU/63eWlx63KhLsjYjHVxuK1Cq8ehkjxkTj+FFz9N3vq9Clj3RIXt/EwFXQ==
X-Received: by 2002:a17:902:ea06:b0:1f7:1bf3:db10 with SMTP id d9443c01a7336-1fb3707c0cemr165798295ad.20.1720419580161;
        Sun, 07 Jul 2024 23:19:40 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb8e1ef3efsm14847625ad.223.2024.07.07.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 23:19:39 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:49:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jian Jun Chen <jian.jun.chen@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete entry for Conghui Chen
Message-ID: <20240708061937.p7lhz7eho4dh5bv7@vireshk-i7>
References: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>

On 06-07-24, 16:41, Wolfram Sang wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history, so delete this email entry.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68e3ef05facf..55bf8ba02386 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23842,7 +23842,6 @@ S:	Maintained
>  F:	drivers/vhost/scsi.c
>  
>  VIRTIO I2C DRIVER
> -M:	Conghui Chen <conghui.chen@intel.com>
>  M:	Viresh Kumar <viresh.kumar@linaro.org>
>  L:	linux-i2c@vger.kernel.org
>  L:	virtualization@lists.linux.dev

Not sure what happened, my email bounced too..

Adding Jian here, as Conghui tried to make Jian the maintainer once [1].

May be we can add Jian as "R:" here to keep someone from Intel in loop ?

-- 
viresh

[1] https://lore.kernel.org/all/20221214053631.3225164-1-conghui.chen@intel.com/

