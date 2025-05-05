Return-Path: <linux-i2c+bounces-10768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA8AA940C
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 15:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8F4165604
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 13:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4905255F2D;
	Mon,  5 May 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIYux7f2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC041C63;
	Mon,  5 May 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450620; cv=none; b=ESOo//cUSCzXYJTk8S514cdCPMUxz3TKOt4o/Xm9afiY1IC3WxeIMBrtwFMu1YifEOZv0mLb9d7NkZ2uS/S7P4yTE0lfLk2KSF1OtnD/YsVMja5bK1XQp7uspunzU8LaCguP4BOfFycVumx5hzrHC60Lo0hIb1+/nI6O6mfBmXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450620; c=relaxed/simple;
	bh=216poSu3wmUkiI+pzqUf4BUNYCE+V6WYcMsoZAk2i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOrfwRR0ZMSHEcNd2VCWew5rSASNDd0iT7ztN9gkMp/+yXtS+HvxPYcCE3gNn6LKS3qgtvvCV6isbmzqnylWsXJDXwLQVXKV4/R+LmpS1w0GchjrxkW2d1/QFM127m029FU4GyV5ticmdq2870Rd67ocELYqNxm5/c6YJ/5pCPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIYux7f2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso5647612e87.1;
        Mon, 05 May 2025 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746450616; x=1747055416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk2Fdh/LRuqCw+jHA02dwhIjxA4SW793iNQ+swnOfo0=;
        b=fIYux7f2RS82w2QQVydeIE2SlmrQZZgHAtQE1/OkFfyRJ6IRJ5V8iRCKKpaZCGPqdi
         oyot3LJuVvlCiAHaibjAI5LRBjm5Q6S9aEi3/5B6nZ/CgQ88wd0Doe4ZNxlTtRMQEe89
         7QHRp0s8Y9nnFiKWCI/jjbF1oBg/rb42WvvI9c3MMx75tOvReq/dgc5vZUnM1bIYK+v7
         OGXne8ysFHcuSCjXTlkvn806STGRibXCGFQ3nmfKnIU7hHV31WVo1M/XEgi9FwjE4vcv
         Y2/8i+K5LFzny/pmLKlLiH0Bp2oCaT8sUV1EkcRTcEJ1h/fWsutkIcC8CnJAFts2sYBa
         sKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450616; x=1747055416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk2Fdh/LRuqCw+jHA02dwhIjxA4SW793iNQ+swnOfo0=;
        b=Ip59acxEZ62mYeJjXEhsKTbYtiC0Xm21KlCe4cpGVVuoHNFCd5y9UqHT6h2DYLIa/h
         I8ChBVx7Kk4XUT4lyGS8N5JYLTbZUlQ4H4X1Y4ts3jZueZH1olcQ8DL/voyRXX1d1S0l
         LPiYUtQ6Y6cyshSoIUnSXfeVDDWs9VLsWF7dA3xipVEToxK18VboHokKYypWyAtnYwLO
         5oDz9aDxhnqonP/cb14xR/W3RmCttnSWvIMQv4ATOt+7njc4R51WYvXgV0tdST4UT900
         wIBs9FpRNu9/+R7fyudBxVBWkUbvOouYUKLo+zr+PhvbXOdRRycXYzO2fXz0NfYyliet
         TVgg==
X-Forwarded-Encrypted: i=1; AJvYcCUTUz+/RtqPgYBsB3wsdIynHrXuDg8oWbLZPksEBK2he79iJ4kko87xXI/1e9jI97//vF7Aj8aoFlR+RxUG@vger.kernel.org, AJvYcCWqVItdrOgpold22IJHKiJZUGleaIo1476eu5z4A6m6D7ITQNgIISi3MtMkEVCBOsKKvQQ0Bf36Lic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7pRtjdSjcOGiu7ewt/nv2ILF1jhQ8oYBgo9mtpu9D/E5Fy7f
	54dl2nwOs41chrer8SEKiyqTlSNZzb7L7MXHRZ2NA/Pbv7zVP9I0Z7YeXQ==
X-Gm-Gg: ASbGncuZReGusiNrHqVVKd2b0+5/6DjAPpWP0Wbd7tMFY9Er3+BS1ar6sShCIcIDzph
	xG9vAqI8ff3NyoQhSJztuA1zS053KlYwfT4xz2WxuB29Y+H0eD46cIloXeXyyEzbDWnlMCRBRSa
	dwqWJ6bTbB7fJbVU9blV5b7047LumWR1liMzw2bRz6en4q5AofO/YgUkbLxVSP44STzEA3+Sfvy
	wlHtrX3Ha9OQMo5PmuS/QWW691yUccqItnmpkasd4MDuLeT4+zGTkHMkvwrttaVzxbEcyeipgdH
	vikvOjtnUmqi6QUWzIPNg7ps4caG8IJ1jdevYhmlDjdDnFb4r/Dp7t86Blh+/Ku6O66fWe/CkDs
	TPw==
X-Google-Smtp-Source: AGHT+IHr1P+DfBvNYTE1IUuk4mUjXsCsLwslNxXJENXtYrYYMvnH/fcJseObHYrApDHjE4l45mPtNg==
X-Received: by 2002:a05:6512:1596:b0:545:3dd:aa69 with SMTP id 2adb3069b0e04-54eb2466eb8mr1961754e87.36.1746450615513;
        Mon, 05 May 2025 06:10:15 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6e0bsm1703046e87.252.2025.05.05.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:10:13 -0700 (PDT)
Date: Mon, 5 May 2025 15:10:12 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
Message-ID: <aBi4tE4IQxoh7jYL@gmail.com>
References: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>

Hello,

On Wed, Mar 26, 2025 at 03:39:47PM +0100, Marcus Folkesson wrote:
> The driver do support I2C_M_IGNORE_NAK, so add
> I2C_FUNC_PROTOCOL_MANGLING to the feature list.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Is this patch picked up by any tree?
No confirmation nor showing up in -next makes me wonder.

Thanks,
Marcus Folkesson

