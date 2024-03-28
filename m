Return-Path: <linux-i2c+bounces-2649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A489023D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 15:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1C01F25231
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 14:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0130F81AB1;
	Thu, 28 Mar 2024 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FVRqf8y7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923C7E799
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637500; cv=none; b=JqBhQXdIzey8kHgEZ4t5GBemaoF13jo5GRse6GkCWLmvnlt8y4Q4ftdfP/+tTyjk0NWv+x1h5xwahfZku19wEKaW/XHXMsC6pJrIE1S9fNTf9ce1hPKMPkpKNYPqWyyLvx74PIZL2eBQRUZq4ksCH/RLdlDUL2Pvz6ZTlgBHURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637500; c=relaxed/simple;
	bh=ux6IFglXde1ERd54R7V4j1Ml1pPp+O0GYiElVJc4Bfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCkk/V2rzL7AgnEeWu6XEk5PGyVRSTYJjOmVWEhsSZvtdquQtbHTD0A5lI4MP+yycXeeSyrzDb0MSHcM+MjghhPcD59ef57aVH63ot+Faw61UhdVV7zPBQEnHP8LMSPixP01489sF8cHwZfCuRCECirYfh58X5Bg2Co+AuFJa/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FVRqf8y7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56bb22ff7baso1195517a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711637497; x=1712242297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tj0J7fNo7JaNqggtcLUYIbAlRhY6zh5m7OfApE5VAVQ=;
        b=FVRqf8y7mfXArQ3Zr3EP50wMzbg9QvQsijou6+spnKjIMt6sQGJ3LO5r7CdQoOtYFZ
         NnfpaENDmYMtMmdyKVPhhkmihV7robi7w7R0xIC1wSEvkaR5Mvawm3f8V3elpmK+9oA2
         pwAiECxti2SIjTigUVtKKqAW8+92RImwC2NaGdlqRUw5YApISfJ5vi+1Pkb/a1UMm6MN
         wmHC0OmG+Zq08r2WQCaW+aHuxQug9s/VOC6Ylefv+dRjqv0O9Z0RlJF69yeNs4NkHF7k
         IrI+Z+nw3ToZUZpLiWizdkeUrnkBfEAXsx9ZLk95qMnZL566IqIXVRMi0CCG1FLUviG0
         Ko4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637497; x=1712242297;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tj0J7fNo7JaNqggtcLUYIbAlRhY6zh5m7OfApE5VAVQ=;
        b=pHvTAhVuApRBfdj5dbAvD9E4jJl6rQXSPbdm5HA499OU/axzCwmTyJqaaQ/X+HyxeP
         vilLdkMZ02oFYEJkQxNfgS632POxbY5mEt7nay2php/kfZfnQwKZMTm5tqGeRFKsy38x
         OaI5ghZF1Z/WlWHoJxTn2xLf7rBccCxpW1iOz/nvFAjHXDogrHvZMALOxrGPgONWzySq
         ISBlXy7qseFasRcuJJ/UXeEMLoRK+wct3flN2djoh6+Zw70900aeOf0qGuPzm8dGkp7y
         8oEcJ2TGw5iDLjApNtV0sWV4TDOHUNU+yqvXwRreSbuqJqmkk20DLWYZR+XF0BqWbEqj
         jE4w==
X-Forwarded-Encrypted: i=1; AJvYcCU67v2u3Gk9Fm3vgpToR++eH8SLqMg2VexablgRjGxEjoV7YDn935h5og1tb+Aa7R4AlkBvADqMMY7qyMA2DAUj76cKa/jlJD7P
X-Gm-Message-State: AOJu0YxCFAJN/WPavUMIkOSYOw8C5f+K/H7fsPYdWvJi4Yqx9ecfgCQ5
	L4g+flw1GfJVN1jWXkdHKvyroUoJCFnb38yA/sF0fTmfMzoEjz60/GXJxoQXQJs=
X-Google-Smtp-Source: AGHT+IGTITQEdKTZjPj//fpsc7l4Mfxj5rl5wKaYL/aBb2bua1vgl0UWhgrKOjBQL8vGcr9As9OUhQ==
X-Received: by 2002:a50:d6d7:0:b0:568:a9f3:b3fb with SMTP id l23-20020a50d6d7000000b00568a9f3b3fbmr2153146edj.8.1711637497098;
        Thu, 28 Mar 2024 07:51:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:1d:5380:6cdc:9dff:7d8c:ff76? ([2a01:e0a:1d:5380:6cdc:9dff:7d8c:ff76])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm949811eda.5.2024.03.28.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:51:36 -0700 (PDT)
Message-ID: <cf21b9dd6499d3e6fa8d9e8c46d77eb035e9c7b5.camel@suse.com>
Subject: Re: Please backport commit 13e3a512a290 (i2c: smbus: Support up to
 8 SPD EEPROMs)
From: Jean DELVARE <jdelvare@suse.com>
To: Greg KH <gregkh@linuxfoundation.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: stable@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org
Date: Thu, 28 Mar 2024 15:51:35 +0100
In-Reply-To: <2024032814-colony-observant-4e42@gregkh>
References: <3bea11ec-32fe-4288-bc03-8c3ba63979f6@molgen.mpg.de>
	 <2024032713-atom-saxophone-0c15@gregkh>
	 <4fa53db0-358d-4e30-bcfa-745cab71fa72@molgen.mpg.de>
	 <2024032814-colony-observant-4e42@gregkh>
Organization: SUSE Linux
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Paul,

On Thu, 2024-03-28 at 07:10 +0100, Greg KH wrote:
> On Wed, Mar 27, 2024 at 09:35:38PM +0100, Paul Menzel wrote:
> > Am 27.03.24 um 17:52 schrieb Greg KH:
> > > On Wed, Mar 27, 2024 at 04:13:26PM +0100, Paul Menzel wrote:
> > 
> > > > Please apply commit 13e3a512a290 (i2c: smbus: Support up to 8
> > > > SPD EEPROMs) [1] to the stable series to get rid of a warning
> > > > and to support more SPDs.
> > > > That commit is present since v6.8-rc1.
> > > 
> > > How far back?
> > 
> > I’d say 6.1.
> > 
> > > But isn't this a new feature, why is it needed in older kernels?
> > > It's not a fix for a regression.
> > decode-dimm does not work on systems with more than four SPD
> > EEPROMs, so I’d say it’s a fix.
>
> But it's never worked on such systems so it's not a regression fix,
> right?

It's hard to qualify whether this is a regression or not.

On the one hand, automatic detection of SPD EEPROMs only ever supported
4 modules maximum (since kernel v5.8):

01590f361e94 ("i2c: i801: Instantiate SPD EEPROMs automatically")
5ace60859e84 ("i2c: smbus: Add a way to instantiate SPD EEPROMs automatically")


OTOH, this was implemented using the at24 driver, which replaced the
legacy eeprom driver. Said legacy driver was removed in kernel v6.7:

0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")

As it would be possible to see up to 8 SPD EEPROMs using the legacy
eeprom driver, and only 4 when using the at24 driver, you could say
that kernel v6.7 suffers from a regression. So backporting commit
13e3a512a290 to 6.7-stable would make sense.

> Anyway, I'll defer to the i2c maintainers as to what they want to
> have happen here, as they did not originally tag this commit for
> stable inclusion.

I'm definitely in favor of backporting 13e3a512a290 to 6.7-stable.

For older kernels, I'm not so sure, as there's a fairly easy
workaround: loading the legacy eeprom driver should let decode-dimms
see all memory modules (modules 1-4 using the at24 driver and modules
5-8 using the eeprom driver). Paul, can you try and confirm that this
does work?

-- 
Jean Delvare
SUSE L3 Support

