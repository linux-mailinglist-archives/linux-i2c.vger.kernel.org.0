Return-Path: <linux-i2c+bounces-12596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88693B42EB3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 03:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF04F1C22529
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 01:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4521494DB;
	Thu,  4 Sep 2025 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0VJMdye"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECAB5B21A;
	Thu,  4 Sep 2025 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756948124; cv=none; b=H9iXYE4KqJMqtiEsBg6XYk0dkkVgG0NvROQ55ax7LK4Pa/cs32nmRupGATPnn3md4NnucIwhTHXnApftJMUuLatPcpm7T1922mV3t/WKBaagPf/10YcAuavAqFTu+ICLrMxQIGxPZudXYFsJq6xkFbS+5Jrc/hdhnFxoJ2FLPZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756948124; c=relaxed/simple;
	bh=SMMMSKhcB6f0NdR47qRVTh1uwbXbXXPIDU/RqoxIL6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc/UoyGxWEzdIlftSZ/hA/gxYWiivfPmWpWEvWhXkQC2N7sjRUlVGB/TKjtRFNhLWsvnlRmBl836Qjrsy2Gvk1K1why8hDTKeTS1ON6KhSjnNW9uLFustAZsDJSh1RQgQWI9RNPlquyzZ5TP+gxU8mnZBHgvfth3IlAXC4z/GXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0VJMdye; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b627ea685so4140085e9.1;
        Wed, 03 Sep 2025 18:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756948121; x=1757552921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MS8+FZ8U1cvwX6WE4HlbAZ/j0VShsdOkmZyc33LPkkM=;
        b=F0VJMdye7eFUPjN6id+2nBi6QOAQNcpMOikHjaqSMCxtiCx7tSYeJU76xPWL0+Lm76
         ZdRVgMYGpErfL0r1xVYaGeiAFbqPEpmT7X6dOEbwRs7M6cIdF6tyE9l4Q+3O1WDeP9SG
         TOIESdWW4e3ShpDxCoVURVS2YkLtbAkj+o9rnc8uL3GzIDqf1y5FmpX2dl+iUmNdgpdV
         YNXoT8faaCDGe4C4fMm73Nk2DVQyTrM6n6XPg6tpGADhRWjdOmIGpzUihzteYnxmAZB5
         stDdw8R2simyOxNPUzZCtPlpYLC7YyD5Y3VXVHseIlCR8086ngbZhW2AYyUPForfQUCP
         aCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948121; x=1757552921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS8+FZ8U1cvwX6WE4HlbAZ/j0VShsdOkmZyc33LPkkM=;
        b=J8jhUnZSU7kgs+AepXE2AyTMb/bxI+w4OUpRJaiWcA812QfHqUIefRE9JAwzNwJOLT
         gCDgxalH12asuzSFDKL3Q+YcNgOmpbk+4vQ+vtkzDbhIYgfqrOu9jVrsn/r2taCqZGLv
         SDJ+oEg8uosY/crpJsZYSSv/QI2DXFK1VpmdkJqSmfcUlUBb4SuYzV2OrItRLtw1I422
         26zsfEh7ETaZeHik2wDcB8pX/LxHONg1IDyMPkLtLRCn5IyTgmy+npdK6uUNX0nNRnXU
         sPGm3vQ/QG0woradTxe9cLaH+sgNeVRgLPwyAOcTmD7eVSKFXRBbLtkOg6x63fFK6pmi
         3jUA==
X-Forwarded-Encrypted: i=1; AJvYcCVufp+KgQVS7tqHzkLTHb+Gc0Ar2GRELcp+899VYX9V4p39iuRpQIkJ37+krF/4HRVU4qLNch+3U4MwcrbN@vger.kernel.org, AJvYcCVxn3jl5mOOuwMIbtRM3pa5alu4dQz3pEKPhsZSqbAH69eOU4CY0DZV87W7f1Ju0SDMWUR00i8xpgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgH4a2YgdXV7un0qVzOuYbqaOTdZezIb3RiTNMub9cCRH3J/cy
	pAG8yHuW48CiJVDsg78kwcqZvuu7MKhSiZjfmStYRZ6yYpoj5qjvdhYE
X-Gm-Gg: ASbGncsFK3NO6DwRQsTLRRAJjzdzLha9O+vHMgN1M6E+2mr/tAmnvHDI48WKQC9cMrJ
	Ny3c4RiYkslXKIYlxVyVpABummi5PoAVq7FR328du9G3C93Iklvl6eCg+otSu2zbkZJ916kk5YG
	iC4E1jR/xaczY23F2Ba7IYFjVrveYpZHj6+lo33pQgyIsq+Ylvx+xpSvU7X2O+ubtkHrchWzo6B
	El5ObAGBAasR+BRn56SMQ1QyQ8OviPXCE3wtEiucxsp+1DoGu/DKd4iwECFu1kmHHLm9w+ry5OT
	dqTnYk8Cx9jsXmKcsagD5xKjL1yJewPiZHarazZtGCXKnj64M9ET3E+L07BtWt6dAV+Gixnk2MS
	S+ILVALvCAOmkVPHCmSEGTnEZgxY=
X-Google-Smtp-Source: AGHT+IGhsSB2KqXIGeIWmV9v+JujN6o6fChIo0ICzXvPfhE73WcL4hM6t8r4lpYoI1isojWTE2vcGw==
X-Received: by 2002:a05:600c:4f50:b0:45b:9c97:af85 with SMTP id 5b1f17b1804b1-45cb50689admr50705225e9.17.1756948120328;
        Wed, 03 Sep 2025 18:08:40 -0700 (PDT)
Received: from hangmanPC ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm260231705e9.3.2025.09.03.18.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:08:39 -0700 (PDT)
Date: Thu, 4 Sep 2025 04:08:36 +0300
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: peda@axentia.se, jdelvare@suse.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Main i2c-*.c files and algos/ subdirectory : Fix
 errors and warnings generated by checkpatch
Message-ID: <aLjmlHDPV9n88YoM@hangmanPC>
References: <20250830093016.160753-1-chiru.cezar.89@gmail.com>
 <fkiu64vdlndg5lvuaktao2vmvmn5al7xcpksrjmxrr4ldz5ssn@dolroldcknpd>
 <aLh3rVYItYZ3CYpq@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLh3rVYItYZ3CYpq@shikoro>

On Wed, Sep 03, 2025 at 07:15:25PM +0200, Wolfram Sang wrote:
> On Wed, Sep 03, 2025 at 06:56:12PM +0200, Andi Shyti wrote:
> > Hi Cezar,
> > 
> > On Sat, Aug 30, 2025 at 12:30:15PM +0300, Cezar Chiru wrote:
> > > Fixed some coding style errors and warnings plus some minor changes
> > > in code as reported by checkpatch script. The busses/ and muxes/
> > > subfolders will be dealt with another commit. Main changes were done
> > > to comments, defines of 'if' statement, swapping 'unsigned' with
> > > 'unsigned int' and other minor changes.
> > > 
> > > Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> > > ---
> > >  drivers/i2c/Kconfig              |  2 +-
> > >  drivers/i2c/algos/i2c-algo-bit.c | 29 +++++++++------
> > >  drivers/i2c/algos/i2c-algo-pca.c | 25 +++++++++----
> > >  drivers/i2c/algos/i2c-algo-pcf.c | 61 ++++++++++++++++++++++----------
> > >  drivers/i2c/algos/i2c-algo-pcf.h | 10 +++---
> > >  drivers/i2c/i2c-boardinfo.c      |  2 +-
> > >  drivers/i2c/i2c-core-base.c      | 59 +++++++++++++++++++-----------
> > >  drivers/i2c/i2c-dev.c            | 47 ++++++++++++++----------
> > >  drivers/i2c/i2c-mux.c            |  1 +
> > >  drivers/i2c/i2c-slave-eeprom.c   |  2 +-
> > >  drivers/i2c/i2c-smbus.c          |  2 +-
> > >  drivers/i2c/i2c-stub.c           | 29 +++++++--------
> > >  12 files changed, 170 insertions(+), 99 deletions(-)
> > 
> > first of all, thanks for your patch, but I can't accept it.
> > Please split your patch in several smaller patches with single
> > changes.
> > 
> > Granularity is very important for reviews and git blame.
> 
> Same comment as previous patch: describe testing please
> 

Hello Andi, Wolfram,

Resending email to entire receipients in plain text mode from my mutt
client with linux-i2c@vger.kernel.org and linux-kernel@vger.kernel.org 
as my initial reply was rejected because of Gmail client being not in plain mode. I thought maybe you didn't receive it. sorry if I sent twice or three times the same message .

I am new to submitting linux kernel patches. The first patch i
submitted "[PATCH] Fix checkpatch.pl warnings and errors in i2c driver
directory and subdirectories" was wrong and also missed
signed--off--by git signature. Some change i made originally broke the
build . I rushed and sent it before I built the kernel and modules.
rookie mistake.
But on the second patch I submitted, I built the kernel and modules
after i made the changes and fixed the build errors. I activated all
i2c external modules and built in modules in the .config under Device
Drivers---> I2C in the menuconfig. But didn't tested the kernel on my
linux laptop and didn't loaded all the external modules to see if they
generate dmesg errors.
I plan to resubmit and break down changes from 1 commit to several
commits(patches) as Andi suggested. I will create a commit in git
explaining how the patches apply (their order) and this patch can be
disregarded. And along with it i will  send 1 patch for each i2c file
i submit changes for. Also after I commit locally on git the final
version of the commits I will create a build with everything under
Device Drivers---> I2C menuconfig activated. Upon success I will locally
test the build on my laptop. load manually all external i2c modules and
make sure there aren't any dmesg errors and modules are loaded
successfully. Other than that I don't own any I2C hardware device that
I could test with my laptop.
Wolfram, Andi, if you have other ideas on how i could test the i2c
functionality to make sure i don't break anything with my changes
please let me know.
 I am a newbie to linux kernel development and want to take it slow
with small changes in the beginning and then possibly to grow this in
a full time Linux Kernel Developer career.
I will be back to you with next patches by Sunday night this week.
Sorry for the long email but I wanted you to know the whole process 
I did to submit the patches.

Best regards,
Cezar Chiru

