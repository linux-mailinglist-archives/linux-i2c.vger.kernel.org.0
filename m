Return-Path: <linux-i2c+bounces-11512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17001ADDEA4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 00:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263F616CC9D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 22:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15880136A;
	Tue, 17 Jun 2025 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQW9damG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD41F4E2;
	Tue, 17 Jun 2025 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750198703; cv=none; b=UqYwgJYQ6pCEBHCxJpWDlk6wXOv88yMaa3Lk7cxKUKqUrNPUszDHIYYYHKiwphv3TA+XxVA97s10dySRud1ZIuBwh0I5Kdz6jJuCXRaxZcxEvZ9X/1h9zzHXKsVXJJJYQiFKYYMEr7WjG9c0rxu9Uw5ToA/6noWlon4HjqHT8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750198703; c=relaxed/simple;
	bh=JSQ8c3bRabnCayUlehYiu+uvSPqvMtoPuZgRoDGUHoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeZTTT2+MJwtp1FoU7VZ5vt3laE3vEKTB7Pr4BwMtv7k73dr402CeGOkaVU5Dq8TJZggXngpmKsrdaTcSxT8UkEEcDZABEzujiIzj2e5JUvnh+XI7FTFalJHSqQiuNAkNgnefaZcbmkhf8j2Pb1VX/cb8MiuGpeX2MJRMvUnMEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQW9damG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23636167b30so56233715ad.1;
        Tue, 17 Jun 2025 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750198702; x=1750803502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NIdWve1K1b8QzOBntihNhgvZs/2vkEK7FdH81C/3/I=;
        b=FQW9damGnI2Vz0ySaAs+PuR3IfwI3q35jupxpPJyKuqijKE1Ew54LfSgMbTzY49gai
         ZR1nFYebYHe/OVRPXpGKWMhD9M4cBik1WHlHGpo1+EbiGNnuMnedOZbG5eLI8OqiTxxX
         V1hiA5s2lPqxjC5R5g38CH+AF7+nEIisBmIaLsUWM/GK238aZWzhOMUmKGzy1tO/LZg6
         Qi7s0/w6OoeX0O6p9g5HZZqNgMI/B32GSM6KhpdgVy3EOpkVjG++jWjBwusaiq21Wr+M
         nHE1zqHjI7EEGCqYVnICpOpdALXgf0+UkX3LYoNMhAtaa49OiW16x64rT/p4E8gREQ8E
         LJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198702; x=1750803502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NIdWve1K1b8QzOBntihNhgvZs/2vkEK7FdH81C/3/I=;
        b=tufzYPVmAi968F6+7PBbisNPpkGRjBNghgITlvC7O2MmIRnyX53NraV5fFz1sYTJjB
         fF+a+w8IQeWRLkibHrSYF81Y+FChgmBiD2dDnI+TJUsDXWaLt70XEFt4Mrq1Nrxet9iq
         8f7DQwuPaLD0Y3D/rpyILWUxJh9Mk14EGuuYtfl9ZX/iQTEx7IM9fZMCxF9sgBj++Cft
         pmOashm/h4BpWYGWV7+tAznDjRwRNEoX43uLQntwp4+o24VWliZTNA3Tcoe6M70+i0uV
         5gD+BrIG2bkdiEmiLnwCTJvtmYuCQGpDKKfskKlXCzsg0SgQ1r5VL1NZX30MQjSsvpZZ
         np+w==
X-Forwarded-Encrypted: i=1; AJvYcCUV/2tGa0ovbqneTE6fD8IdUfIbRE6FhCHCUrGzcr+lDMk4PgE3zaK1Cvckfb5f6qbNfRcejMW+gSJYPu2E@vger.kernel.org, AJvYcCVP9cV7FJVvd4Fff5GXaSzmAr5oZCJ1D3d5026HrzUO7ZPBs4udcVqEfYZabp7MZQBZiD1GGZ+Vuhg=@vger.kernel.org, AJvYcCW16Nhrg4v7pEKn1vhR1khZ+zPR7E0n+ftoxRL3cZnqYdLXfWVrBcKku9mcbJCDTJ3fzEOQjQTyBpic@vger.kernel.org, AJvYcCW9aANfYQNbk9RQTHYptWWKbDwxlBtepBwnetchERXRFzlfSbXFW4kvhQNQ3ARe7If1E2/Ji0wAsENhZKQ=@vger.kernel.org, AJvYcCWRMsGxCCWxYQ3GMtDxVovNnUd+6kRayugO/r6vyZ/fy5Zw2U/DcQLF9ehZYQHSsWQWs3MRhXkuwIY=@vger.kernel.org, AJvYcCXAw2IDBUDrek0IRZAj3nVvIvRa3a9n01ttxwoh+z71vqNgIoWk806mIliDZPLeVpKmfxBx6oY2hma9@vger.kernel.org, AJvYcCXItILcjo3MNfHsvpqFgUf6DLt3f9nV36WSar8YgHPT5MMQr1VUkTB4KepXX/rIJxl1GOkUcduZRnldpfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmkZWW1yfMyCY04RvBbXWfJixG6LknI1GWhv9G/utp/OINRw7R
	TtJ9qORcD1PEgFF8P57wglLhrVNH5lj5uoNt9qD/6EQq0s00IQqO8J1k
X-Gm-Gg: ASbGncuUv/dIxGkTsZ0gSmB9uun2xlYKJX1HlyDdWUJcQHpXmbA/E4KH1VTvmu5sCFf
	OpiFZ2Of1Gg8Q4OgCw4AFLcvHTKLfyVwjKW+xwmaYclnSKBEY9r0/mOj88ggJjXZfxaaPciNxkW
	Fl0ibgeKSHPGZZzp0eg0h97oqsqMbje4LXN1FFMEICBFTJtReGJ+0yiByx2FqsNnQ9MIqrPJe2S
	dGpUgNbPblyrWOFGs5u/GuyJ2TFZCAZyuCx+ZTlywuesehUpPuJB+8OOL8vdDlNzvd6B4aBhVjb
	M0L4/BFzyIAUXGL/4SM8dPe1f+WWVnRwOE+EGza001wQiwg7rOiY0Md2RwlPYME=
X-Google-Smtp-Source: AGHT+IF91BQZXlbd6uuMahbLtTEtN2tg3W8Od60D+rCGiIPm2Y3r9UQq92CpdM0V1gssQmyVDCfWGA==
X-Received: by 2002:a17:902:8bc8:b0:234:a139:120d with SMTP id d9443c01a7336-2366b32e4ebmr135159835ad.7.1750198701630;
        Tue, 17 Jun 2025 15:18:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4cd9:8b8e:24cd:5a36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca40fsm86178655ad.208.2025.06.17.15.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:18:20 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:18:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Vinod Koul <vkoul@kernel.org>, 
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/11] Input: apple_z2: Drop default ARCH_APPLE in Kconfig
Message-ID: <oinzomct3qvhmlvulhsubckhtarrz2eedk4ymgnvfeebmiljtt@3wtkh3un7cdb>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-8-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-8-0e6f9cb512c1@kernel.org>

On Thu, Jun 12, 2025 at 09:11:32PM +0000, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied, thank you.

-- 
Dmitry

