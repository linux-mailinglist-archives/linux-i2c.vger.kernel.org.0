Return-Path: <linux-i2c+bounces-7731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 549639B98F9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 20:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0170F1F2240F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 19:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDBB1D1F44;
	Fri,  1 Nov 2024 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4lN64mz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF11CACF2;
	Fri,  1 Nov 2024 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490654; cv=none; b=U8EHsd2MBLJY1oQOiWAQx0oYIKclsbwK1DhgeXDADLlaLrwFDiRKZ13CyMnKilaaksLBu8elefRqtTLamdnE2iEI+cxHaWg7foW1AzArkxUYkAD+zJDnMdWjo0E5mFzoxiumDOr9zaMh0VWGGA8sCZo6DBFe7vcg/kowoRC6Jxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490654; c=relaxed/simple;
	bh=+PeT/jDp4KoZyt9s+Sve4yG5x/fHvIguUNTGGiy6glA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9zegkFLWgIdkwCTRtPNfg/tcHwuCzrYwV/N054Hlb542V8VzZK771ol55cVjMAmwnsaXDbAFTZGeg5nTU0neLrtLOVxc1+SwGVsevk2QatC56fKs/KjABMaSzW6qe79rUnaglyQsMqQnYpfonZR6zdeACGOdbG4aC29cCSwW0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4lN64mz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso921548b3a.0;
        Fri, 01 Nov 2024 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490652; x=1731095452; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftqK4qgrfPDQKJun50MBlxvq3jOWOxUMXftZhPIQqC4=;
        b=I4lN64mz036a3b2h84SActAfalpTlwPTwJawBGeXZIEts8d3vR7lXenTCVLTWWYz1Z
         XfYIfLsaaetG6zAmade4S41yx3lM0wBpGIlTwK2kMnnYWieYAhESTgSHf8zzYWbGB5XM
         dby+uW7yEJvTewqLuU12Hhsb1TN1v6s5dAb3k+tBjaR7xZvTfViGZcq11Z8mKn6DVdYn
         8rK7uC7Jbz/xr0pgL9SyzlH6zinXCiAu/+AaNJIWIMc1KCyqoALbU8t7UNbij9IFf1wl
         sSBGvadBGZFxfuO56WmwNEwMmrHV+qVtmsWhvwhwfGNVP93psRihvgo9zsrrwrmdpNHw
         7JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490652; x=1731095452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftqK4qgrfPDQKJun50MBlxvq3jOWOxUMXftZhPIQqC4=;
        b=eo0w9opbS4HblEhKLOQMmqsBMdGDnQPUARh84uLdTM8SmO6Xwo4IdMcqG56MHOFV1O
         rIrlTyNqTtnGiM3F67zv0UKQC8KnN/qB+gxfk9msveLHD53x20CSsIbqynSBB0ZJK2KE
         PBVZZiAZfP4FHoU58KXykWCXXioLBMXMIcTnUPRvDMcfOqzX8Aegu7Zjj0iWI2cxJ2KH
         oE++fVj2/3JCYvSI/D9pTr2WOrs7ENDzAfIWpDfGbDKpA8Po0ULyVxsNhmYw2Jh8OKtm
         UJvopgPux6Z3Bbu4xaZCRaXz1r7Bvk1CeHjkM0c63H0z5vzgN/n8Y4Sgb/wItjL4lyFh
         9KAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCmhpoetNJym3cqgo/ZtERGim9QS0xIiDfkVhzB1LXgpWj+uZb3a8DPwBlvg8EsIhnLSqXm04Mcou6@vger.kernel.org, AJvYcCVk6w2Rbb4pUB5KIO8ejzGzwIgroFdI1bHH2/up6afAZ81v+IAYdp3X3yeMFru9+DXB0av2A6geN1oO@vger.kernel.org, AJvYcCWnBQopma7GPWisz3mh74o0sBfhaHWJULNal5ZOWgStTgqt0MBc9+wC0hPrJOM5/yFWlsQvZx5pxoyz@vger.kernel.org, AJvYcCX8zYmlF6rlEqWJba2anyNVUQbwzPjIPecZztXHmhAM2zqQmsse8gVTcyT3PiepY9Pt5jwSaORzxGlJH5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DuKO+fuiyEbbWW6E2yuCbq+b9yzMBy8YRQW+YuVNUOyg+jkR
	PJByIHnn0oFng+tUWZdvUtJJCN1SvqRtg22mUqPHYY0tk3DhihjY
X-Google-Smtp-Source: AGHT+IHy2efgV2f8+lIor2FHW6CLXYQw+RV7fTRd0zGkfCr0NO8eBpBbVjgDm4Wjx6iXOPHKLMcuVg==
X-Received: by 2002:a05:6a00:10cf:b0:71e:6a99:472f with SMTP id d2e1a72fcca58-720b9de116emr10709471b3a.24.1730490651732;
        Fri, 01 Nov 2024 12:50:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c54f1sm2999113b3a.121.2024.11.01.12.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:50:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 12:50:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mariel Tinaco <Mariel.Tinaco@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] hwmon: (pmbus/ltc2978) add support for ltc7841
Message-ID: <734abd1a-a371-4d4d-8389-a8ad445e8fc9@roeck-us.net>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
 <20241029013734.293024-4-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029013734.293024-4-Mariel.Tinaco@analog.com>

On Tue, Oct 29, 2024 at 09:37:34AM +0800, Mariel Tinaco wrote:
> Add support for LTC7841. The LTC7841 is a high performance
> PolyPhase® single output synchronous boost converter controller.
> Multiphase operation reduces input and output capacitor
> requirements and allows the use of smaller inductors than the
> single-phase equivalent.
> 
> The relevant registers in the LTC7841 are similar to the
> LTC7880, only reduced by some amount. So it's just a matter of adding
> the chip id. The device also doesn't support polling, on top of the
> reduced register set, so a separate case for setting the chip info is
> added.
> 
> Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>

Applied.

Thanks,
Guenter

