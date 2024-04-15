Return-Path: <linux-i2c+bounces-2953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C48A5D1E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 23:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82391C21C6E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 21:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB93157467;
	Mon, 15 Apr 2024 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDge/zA8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FC823CE;
	Mon, 15 Apr 2024 21:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713217393; cv=none; b=Y231pO/seHV3swN2+RhOurqZhRzzaHYFrcpvVcXESepnYWb6G92nSpAbAT8AyRKhWfHHnKZj1ojn22x0ppSMrL8XIV9JuVwqK50hjwwPtVgJYK8FMjvNIhshh1VJiV5g9tJ35y4pw5HGD/oDIDoJ2lMepg4f3m9/yf0+NLR6WxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713217393; c=relaxed/simple;
	bh=Hti8yZW8mNamBN17Mr4lihd/DG8OJVKjQhX90Ajf8LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW14l0DtjWXiUa1uJLoQEcHfdAsORfFFrBjCvoAJF5QK19E2Cs0TiSUw6GuHyIFjBgNBSSagFJvBqHw60+9qjoA5afKeBRy8UFl0FaepJq15oGQkfnd7Ns9+lXX2tTfgLdBNKEKUZ3ZiTvDsrUlckKcLRTJH0XjAVMfiZvoaL7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDge/zA8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so3411824b3a.0;
        Mon, 15 Apr 2024 14:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713217391; x=1713822191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwYuieFLrgD2vidWaMa/xY2PVYIE4Qyq+E/iIs1/OkQ=;
        b=UDge/zA8ot7jRCNU9Jm9EfNHdd85HafIM/rlJ4OiBy0D5MPed660JAyY8gdp8QwPPE
         KYLjdtQX4qhmyr11e6lB0o7b/eCZGStucVs6CtOB0I48rfjnuUvOKTYAcgGGEsArRMjB
         /5q8fjbpm6s6RehvaOg8rWw48tvDbfXQb9B5pVMlWevNnsxaIh9ELvK5OXIWwUF0L43I
         NfFyuf86Nd605d6ekgSDpU1v1S9nJNcCitGAYFi+F5ysbrEIQvfUReH2HrFNe0whHUhU
         q2kDu5UxgZHQ7mJ71GEMFWlEJqSdlhgiKMAltkY18bPbCML3FIP7k0TqjgiNV+oFr3RG
         foBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713217391; x=1713822191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwYuieFLrgD2vidWaMa/xY2PVYIE4Qyq+E/iIs1/OkQ=;
        b=RTU2Xzaoqc0uIuWY3BossmyCPaf60uHJD04v7V3kwWeFuaXVQ2MGFxg2TleRtJVPAA
         +sJWClkJmwU05/CvFkmNHIGQF8rRvAlv08N55q232UIwxmzoVDM5jHmE2q2MmXMURjHn
         1X7CJBJr7jdurmTPzAeT+/o1x7M7IgEdbXZlglm0I60Xtd0OHHOltJgtW5KnGpP0o0S2
         rFwXMXzgTFxmzQ4qlx3KQvXvTRfD4vUXxUWFs8oFGGHu2CZJ0tB7n1WSmYND97Lau7ai
         xV1abv++kfpNTB7PXPt/0fNW6giZUiixK6DL4lNHog75/Eo/Xlt+J8RFg9NazpGYOHLC
         rXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6C9NzR6CP6tn3BKesHfL/D7VXr1bfiCQ0D3fVS5lKSRNZkmBV1phQ83Mi8rgWDaq+dG85c5T5W5xNh6oJ2SIv07edk2EDxuMTmjiFhwCbQZYf/mcSpUkt1/EZ2aAJf61qdtmLE0Q=
X-Gm-Message-State: AOJu0YwMpR9ZCE/9DEEl/d5Z1zJ5OOP5F/HUuSI0mRaE8TWBF+3hLGbb
	DZee2cr9TYe6bol8530PxbTQbdPxxnM/AsGJw1zWD854Bq6Yj63+
X-Google-Smtp-Source: AGHT+IEKzUaq5oqprDDeeO6woX7N//0YU382lPzNmAZoPHUQS213SBb6HqGqmFRRYxFysoSt5LI6bg==
X-Received: by 2002:a05:6a00:3981:b0:6ec:fdcc:3cce with SMTP id fi1-20020a056a00398100b006ecfdcc3ccemr11989639pfb.5.1713217391055;
        Mon, 15 Apr 2024 14:43:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z5-20020a656105000000b005f3d222eb42sm6502582pgu.20.2024.04.15.14.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:43:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 15 Apr 2024 14:43:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Peter Rosin <peda@axentia.se>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/4] hwmon: jc42: Remove I2C_CLASS_SPD support
Message-ID: <8befd38e-212a-4ddb-9368-636db9f58ed0@roeck-us.net>
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
 <3c4a1715-bfbb-4ae2-b35f-2f20f95e4932@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c4a1715-bfbb-4ae2-b35f-2f20f95e4932@gmail.com>

On Mon, Apr 15, 2024 at 10:49:35PM +0200, Heiner Kallweit wrote:
> Last host driver supporting I2C_CLASS_SPD was i801. Now that I2C_CLASS_SPD
> support has been removed there, we can remove it here too.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

