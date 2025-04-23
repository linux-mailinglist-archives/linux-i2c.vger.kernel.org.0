Return-Path: <linux-i2c+bounces-10601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B8A996AE
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 19:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C0967B19C4
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 17:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7682B28BA95;
	Wed, 23 Apr 2025 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HL/jtx2c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49124280CDC
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429398; cv=none; b=W0yaI5IH0a8O5T/bsYtLDD5d1rBlSb0FbafIt2mdIU1jyq0UGIE+XiFdTpTJmqFBQKj0HtEr0va4wZFzskJOtMZaoLXq5dMwrkIEdYyRxwak+Z20GlU37hk9uYL5kkRZ3fF6CsbQadTCWP8tFFOXOugNBHnkbi0KK/luWYO7QtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429398; c=relaxed/simple;
	bh=0PhYhQW3e9niKo2H334ixansrbnvf1A301EOSSFBo6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwGBwewHmL01Edc+BLuAfCHm0733F6i6gJOWVxxJzxL6E9nAFyOmNBYKv6uY2soYA/sDcBBd7P3FpePLcUs99oblKqTY0QJw16Mcqpy3hv5cWGdeXHolpP5dnJ4l0f05M7Q6LA10sJoehTteNZYQXZk36BWcPbqUkF3bsnlyKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HL/jtx2c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso1158335e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745429394; x=1746034194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oH2LFbAba/qda5PxRdibIeZbcQh5j5Nil5v6rguHVm8=;
        b=HL/jtx2cjZihqX5BOg4aSg79hqiANrp5ZWl2xMRv/RMpSXfMkY+tpQzSWO09XGbKm+
         3WRSm1kDssuM8sk13ag/TGfkSQ56AZswsu1qi/T4Y2AxIlqFqhvV+Y0Jj9lj84f3tqDx
         u1Yj1hZzx+/KdOrByUlU9TosArtzlTORqqvPHxdk9PVbeTOcQOlcCgtIfD8/+9zerZ2D
         I9gTT9kMwW0NYpdu5NytDGaQKObYRAj4CTQbVHPFCd/74l4JkAptLVUqUAweBFUjUvc9
         DTw60MGjoaC9i9dgk4HYXE7z2T/niyz28B9gJuB9Hsxi2yKjS41bpbm3IllayS9nJTgG
         06wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429394; x=1746034194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH2LFbAba/qda5PxRdibIeZbcQh5j5Nil5v6rguHVm8=;
        b=skohd9wLjtUYVHytIv3vz+nW7KhmpH/u9+QI1c5/We/z+Oj5Yb74SWC9yMM3x4JJxI
         icQj7VqIkKzKUWZ8cfOUBo3A3Sl6/BxbBIdlKdBRuYcM7hwEy+6siyWklfHvXPUs01eJ
         gQiYLJIEsqpKLE1yz/XbzvP4BVWxmo54ZkEon6nHNQ5CB83IrNMyd8WKEOtcaRWIOkEC
         iqSAaEb1aQRFuqMSQ8DD1J+gacx+rCBjfqbxvWuhf3+vHhqec0gX2ej66EldeFL4Pziz
         GaRgiok9U4iaUD1CMVCEGbtPzXncwVnt/NK1DJrtZE6VWJgfPJsKltNWuno44PSRXVuO
         dd4A==
X-Forwarded-Encrypted: i=1; AJvYcCUoc0xwb3fmGw86xn5VeyqXwOjWy+oDQ/Rzs1MaURYiGEjzMvhO7YrVaqCGkX3aAGD560zHX3YFDGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuZVT53ku/hxzkMr0DIsFG4eTRjDGiR/1zZZvQWEurBe5Wzo/
	f9JLCzC6RxPqts2qErnFlgXCXIdmc+TopAkYOyRR09o92GPGD0YGAu5sngDrxVY=
X-Gm-Gg: ASbGncvNcQ0X6hgIN/0EwUWRPMIve7G7GKFwIdPq0zfqlHvLHu48at745P97yPqbk4A
	16MwgymI9IO+UbAZQ0ESPw51woPZTcuxenso1HaenjRB6DiQMs2xL52JUtnceK2cFq47I1ZJ9bc
	3urG8DzYRvIgqbtmjWbW4k3Y7Aymd3jPE6yhy1hsNPFyccQ5D7n81nCV63poO99UyBAsk5M2kBS
	Io0gLtziOr93dH7tjwCKzS7dvmD0zrvQxsuE0lJ4gHiLe25G7SIrMaOwaJVrqKrGwEkWqrpUbnx
	phozkIymG4Bmjaj2FEzLs00NrmY7a3Mml76pe3qR7h+jqeyGgYdLocPL
X-Google-Smtp-Source: AGHT+IHrc3jKIu/dZDdMN5LGx7SYc5pxapEttECD3if6r0VvjDHa20st5SLgP98C6SszLOfYP04REA==
X-Received: by 2002:a05:600c:cce:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-4409aa605c0mr554375e9.1.1745429394577;
        Wed, 23 Apr 2025 10:29:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092dc229esm33348255e9.40.2025.04.23.10.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:29:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:29:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <a22d74b9-06b1-4a4b-9c06-4b0ff7f9b6c2@stanley.mountain>
References: <aAii_iawJdptQyCt@stanley.mountain>
 <2427370.em1n7HOibB@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2427370.em1n7HOibB@fw-rgant>

On Wed, Apr 23, 2025 at 05:25:44PM +0200, Romain Gantois wrote:
> Hello Dan,
> 
> On Wednesday, 23 April 2025 10:21:18 CEST Dan Carpenter wrote:
> > When the list_for_each_entry_reverse() exits without hitting a break
> > then the list cursor points to invalid memory.  So this check for
> > if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
> > variable to track if we found what we were looking for or not.
> 
> IIUC the for loop ending condition in list_for_each_entry_reverse() is
> "!list_entry_is_head(pos, head, member);", so even if the loop runs to 
> completion, the pointer should still be valid right?
> 

head is &chan->alias_pairs.  pos is an offset off the head.  In this
case, the offset is zero.  So it's &chan->alias_pairs minus zero.

So we exit the list with c2a = (void *)&chan->alias_pairs.

If you look how struct i2c_atr_chan is declareted the next struct member
after alias_pairs is:

	struct i2c_atr_alias_pool *alias_pool;

So if (c2a->fixed) is poking around in the alias_pool pointer.  It's not
out of bounds but it's not valid either.

regards,
dan carpenter


