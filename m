Return-Path: <linux-i2c+bounces-5092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D799432F9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 17:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E65281CD7
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF481B3F22;
	Wed, 31 Jul 2024 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlBiVUve"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D21BBBDA;
	Wed, 31 Jul 2024 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438741; cv=none; b=tDRjdwvVGWJnV+ruuzhjqbiCLwLB7C1CdvNUiYpT7mLgbVnoXTEfU+DWiqkLWpKQ4gshqzs1LP5J0+HigjGutAA8rHpHZwVGxthzA0MbHCqBCR+acX9ZmGt1mKW/ZkzepjivXM4nmKrIBtAefyLvLHLEQnoI5BMmYEmInby65OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438741; c=relaxed/simple;
	bh=AxJOmaOigk76Hu44956QrxC0XelL7qft/EELUebph+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnspOp0BzzmzE33Pacw80BPgVSL1/twnizrAzHo5qkN1lgE4FOODOFtnAHN4YJRxE2x9+SBsMmoJo2jFRn8oKIjSo/7oGXAVhN3KH4tiLaG/ZnzQSlaBI+jaEJ29+wLdS6LH18Chya5bvJkJ01HXSIXobUv7x4fhglNWMUPNrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlBiVUve; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc49c0aaffso42370055ad.3;
        Wed, 31 Jul 2024 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722438740; x=1723043540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7QMclGH2TxOtxr0vvWT8YB638709+b/1APHP7s32Gs=;
        b=IlBiVUveG71kSaupAWUkqhnOggZVh78EmYYnaUNnBzBdN6C/OmlqZ8bdSkpjRDY21k
         RRtKvXZMnYfbQyc8nt6kV8+ljAPPkskKqI+21zbMgXAX04Nszwdv3qtekP1d/iTHXkIJ
         VwUvzWvzkQPahFOYCHLA5iRZMeQTQ4arV4/LTHs500Fi5HxKDaV7hy+p5OLBo+vPhPNQ
         K7h728h62l7skZjgtdqryn7vXwVaTmcy6dh7+8NmcksFIHKVJphqxOOeHWqHnHdmZl/o
         m1PB0pz7hHRK5rQrc95ZAontZwF7PkRdizcb48ngGURdNLYRvajOQmxWscfPwbk7eV4b
         Mo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438740; x=1723043540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7QMclGH2TxOtxr0vvWT8YB638709+b/1APHP7s32Gs=;
        b=R/zYNF2ZKiviTnrHlY/thQY0raBohhXn3g1197yKa6Sg/Omcp3IaVRGy2uS9Vys7Ig
         4iSi1vnow+dUfsV5GLEEh7jELfsX2HhPHV12I341Sz7XfqgKjs3I5KK7IBU1fEo3kFU5
         P48NSHKQn8uQkoTS97UApEPbJtoAkxBOVF7hyi2QcoF7UbS4OG78yl+B/RYYZJL8cab6
         /ELLLAHxO1Kw4CnMhJCW5ki28EKdgesbr1FtKOMXfnm4kM9YzeK4SyYPB7bEPlT4YnfK
         0X/cmtwXciOESmXKMczvrRCZ+1dZ65yVp4S+mPmLhvtQQoctk+HhY5eEka7iJaySUfEy
         /jUw==
X-Forwarded-Encrypted: i=1; AJvYcCV4z64kWKWiMHuwdFwXHuIGSNS9NElh5lSzcrAek41FbhDr0Yqby3tsKl0KuFor53psjQhOjPYkXY6EXdnT3PZGJ4ZXTI8XvAj/6FvxvoEcDJSBslMozBPY2zCumVde8bdmAkZas4ZjZfHOwS4kufGdGJiZl1cJ+6AtVOjmd4ZTsuP46tnh624rIS5ADDLwVzH4zmAlJJLdcHhSe+GOTKSC
X-Gm-Message-State: AOJu0YznIDIayiM6syDumuUgGY27f6tfBuHhA3UaetNZmAaxig1ccP+n
	5mwCvKzpePZGjJf6Z1k/JRDJosKoHi7ZW6bU23qWF37R03W6mLRp
X-Google-Smtp-Source: AGHT+IGuuLV/I6m/cx7VRfU+gmepK2aLMG/Hbrdi2xPZt7Fze6quw1img0IlEQlVitL3iOAEUcrp5Q==
X-Received: by 2002:a17:902:ce83:b0:1fa:2401:be7d with SMTP id d9443c01a7336-1ff047e4585mr136680845ad.8.1722438739461;
        Wed, 31 Jul 2024 08:12:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7edd813sm121600575ad.170.2024.07.31.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:12:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Jul 2024 08:12:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 4/8] hwmon: (amc6821) add support for tsd,mule
Message-ID: <5d5c44cd-6320-4fcd-9409-f3fc97bc5389@roeck-us.net>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-4-f9f6d7b60fb2@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-4-f9f6d7b60fb2@cherry.de>

On Thu, Jul 25, 2024 at 03:27:50PM +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which is an amc6821 and other devices that are reachable through
> an I2C-mux.
> 
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821: reg 0xff)
> 
> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
> when probing the amc6821.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter

