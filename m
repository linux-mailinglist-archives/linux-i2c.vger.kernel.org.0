Return-Path: <linux-i2c+bounces-4065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194790B440
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 17:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 399B51C21E06
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7630E2BB02;
	Mon, 17 Jun 2024 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNhrEXRj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C61E52A;
	Mon, 17 Jun 2024 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636306; cv=none; b=XfeEYZl1GiW4eVjE3otygH8/4eNM26XFvT5k/sFHCWuWS39uv7ryK9hJ8Xu2kNXMFr+1vyGg0O2SkRn3LsgPxIHTwax6LHAkPdgUpm4NETvK7HQC3N00rcMKhZx0dmN0aTEFgd/TusefvtXjEqwcOdmcm2P34AVB5eiPHBlkbfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636306; c=relaxed/simple;
	bh=0NknL9LnSVCalS3Fn4EcfTLwKDeYzCw2PnnM3Ze4rkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCkkFCSCioXoEAxvDSwNStg4/qyBw1y1Zl+V43bWfC3igBLTroJ7FsUOQJTem4kFKC5RauBZSgaSqDHHNZFMPspKcdCiuzr5nowvEgNkcVbK3vzn4xYNON9kQjR09T2JuCb2D/b/jqIDqAxCllFil9sqPrCqIcdBuciiKMftSGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNhrEXRj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70413de08c7so3172542b3a.0;
        Mon, 17 Jun 2024 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718636304; x=1719241104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWJgXFUyRh246Z7TzUCiKOM3xG0BIQKAjl/1uq2WWqk=;
        b=SNhrEXRjgZoqIILwd/PauDZ7qOZSYOj0z9C7zIugAP5e2yrbe3UTiQLWDHC+r6F98b
         YO4d7/Z2NVc4AWNGz0eEwIvtN3VCWvG6RFPw3q4/sl9mlh4blMAxcDc2lRNnreIcLQj3
         khcijXv/4b4DA13BXGJtKQFKJxKgtrwKJo6ZXxyEXpeeZwOXdOKRN/dd6sbI7wMy4Eae
         GvxBNoLQwKfQsOAK1LKu3b+koGmoNS8Rf0VVGgX6Bmb55dspZSQMpJU5oBceUvjNEaT2
         soiyHbuUdpTeGbvSmX+cg8nrvcrVhHO6dx7q82c4CKL0pVKI2KQUW91PLdj0KKyZbED+
         8K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636304; x=1719241104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWJgXFUyRh246Z7TzUCiKOM3xG0BIQKAjl/1uq2WWqk=;
        b=qHEU2OsnIFD9kiTIa5PkxIUliSdetVHVBM59o6dAD9Io2uZhFFYOlPGAVsP/4EnsL4
         mwI0fXm7gPdZNLvVS1Yl5JCLyD4D9VH/PFQ0uvr4mJnkX1/JL2YiKJN8XnsrpN9z2Da9
         wcPEaULfZGoMQcc7qGacupYsfboz2nZCaxeRWOy2FYHFGfkRF+NCX51raDldzeAAKTux
         T1ULNZ+anY1DTs36//bEKCg/3TGf1RjnbE/dVf5BgZU3m2RuDTKdl2qkRIbKIwdkC97j
         M6h8ovWEDpyNsAmMMMvRxNtfX/DIjA5LLSFffDf5bMk4orUaa7ftSuGvMFNJIcJkflAA
         JQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLbhM1hVr0ZXQbgG29j3kvbemL+T+gQCfi+NrngBj4HUk6rjjbVDKvnPnBfEMVSGJKYAO8MTmWqdxjD19zlkUK/q9xdUWEQAdOMz4G3dQgGOK9NjC2rJBHfh5RPceZ/38VVWePDNNf9VybZ4h9Mxvq6l5T45o8b+mY+3ZeqT6Jf29XIg==
X-Gm-Message-State: AOJu0YxEQXWLpVN+JGgBGYmccnToCdpAIcfuV2gha9LqYDYLNGhsDjL8
	LQXK8W3FmUVxo2v+32po5b/IqoM6KLgMkv/6sK76ctcxK4QGK76L
X-Google-Smtp-Source: AGHT+IFHkSLCIBhImDWV7Pb8641rGAtIQ7noDvkKP1bDy97GQQN7sQBDM4krNl7f4fRPzmgUWszMYg==
X-Received: by 2002:a05:6a20:d488:b0:1b5:d10a:1b65 with SMTP id adf61e73a8af0-1bae8224fa0mr10696463637.49.1718636303874;
        Mon, 17 Jun 2024 07:58:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f2e281sm80115165ad.254.2024.06.17.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:58:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Jun 2024 07:58:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactcode.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Sasha Kozachuk <skozachuk@google.com>,
	John Hamrick <johnham@google.com>
Subject: Re: [RFT PATCH] hwmon: (spd5118) Add support for Renesas/ITD SPD5118
 hub controllers
Message-ID: <90f20e62-9200-4169-9415-3b74da92d640@roeck-us.net>
References: <20240614185924.604672-1-linux@roeck-us.net>
 <2046d2c3-bbf6-4842-bc51-b2f567f33c0a@gmx.de>
 <d2ba6ed1-3a6a-4481-9f43-265eee78c0c1@roeck-us.net>
 <da7c9855-ff4b-4e80-99b8-b2fe24a9a9d9@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7c9855-ff4b-4e80-99b8-b2fe24a9a9d9@gmx.de>

On Mon, Jun 17, 2024 at 12:50:41AM +0200, Armin Wolf wrote:
[ ... ]
> > 
> > This results in
> > 
> > spd5118 0-0050: Range 0: selector for 1 in window
> > spd5118 0-0050: error -EINVAL: regmap init failed
> > 
> > If you have an idea how to configure the ranges differently,
> > please let me know.
> > 
> > Thanks,
> > Guenter
> > 
> Oh, i did not think of this. In this case we indeed cannot use regmap here. I will test the patch tomorrow.
> 

That would be great. As for using regmap for paging, it actually
works if I remove the selector restrictions. I'll try to get the
restrictions removed or relaxed, but that will take some time. I'd
like to keep this patch separate from that effort. If it succeeds,
I'll send a follow-up patch to introduce regmap based paging.

Thanks,
Guenter

