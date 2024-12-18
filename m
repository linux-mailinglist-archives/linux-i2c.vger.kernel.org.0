Return-Path: <linux-i2c+bounces-8602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F769F69B6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 16:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53BDF7A169F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 15:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9051EF0B5;
	Wed, 18 Dec 2024 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGHk3Ent"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9C1E9B0F;
	Wed, 18 Dec 2024 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534857; cv=none; b=VnlljCxAwcTMKq4yMd8g+w/FPhXEWbuJ7FgKYFiL2SCEZc2laW/fxvlzGCgnl8J/wGlE+WuFNaHBWycImx/H6m1LsOw9sdhNRdl2yYvwWl8D+KPTx5GDnJ3bHSmgPXiNgUZwn6ONir4UtDtvwW3ng9yB2zufLzTKsluyUU7HBWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534857; c=relaxed/simple;
	bh=GS12f6a802qtYAJWytNIsCUPlXG/TuGOeQ1Y2DQIuOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADy0NbYhuY8Tw+BglV2lh1Tdx2Ge3laRzUJFBRnkEHLjOG+BJeMXMi35i1Ha4O1KeBb6BUFA9QqTHaEjVN8RNhtzZRUzEMJUCN3C64ujlO0q2fnH8tD9F33AQgIPuAJpmAhPvh7dx/Tz0f9c38pZpy1H5Y5tDK+bRbCgGgTe8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGHk3Ent; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so5835897b3a.3;
        Wed, 18 Dec 2024 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534855; x=1735139655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyZoW9fvDykJjh+t7cBP6j9yz1yzBTIkPLx63WQaNAw=;
        b=UGHk3EntgSHDTsl/0EyQIZTxiDoSjkvQcwkBoIAjA0SBmsRKlhb4nC5/c11OJvGELm
         GkxY/yZwtcuEpojkOHcLeq/CL6x23kufdRRC7bifh1dFLTW/Q53u7hhEa1bmxxwpJkFK
         cK8S0LZYlcAkPG/Fx94VM/+oAJOPYh2nB5KWc3HYbmyngUNaGx+C5dD/5BrLsZS+owcL
         ftXpK/FnOYOqK5f50gvd6hd9jdn/SGBvUhWjGbsEa19h4uJ8Ewf0+skbX4MTeukn/tEJ
         xUcUAexIt24Hk6FHb4XYBxnhQOL32BmocKWR3IGBwEEVMEcWVVLSOE0PX+c+oP6t9l4V
         1Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534855; x=1735139655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyZoW9fvDykJjh+t7cBP6j9yz1yzBTIkPLx63WQaNAw=;
        b=esO4bPkxU0hU7EFn3ZavwiXx/5Rua5eNLYeA3DuJTNNa8z2WrDR+xdSXhRbCae3Kda
         bF+Ro6GdOS2AD8jbvdaDpBzCs1YtuSz5026lnHtsPbMJYD4hgKWFQuXEoywbgjiBtgLk
         Zj1ZZ2uhsyrkZ21UMtNlqq/H2p2pwHPJjEl4E/sd9WbHwpxZws5z64rq5wXP7fsXneFS
         137ktxHOcP/TIUs3SlHRXW7b+t7Mog1oT1E9BZwO6OOCQ22jCJ/x30CLvqFt7C6esObJ
         EuZPTDcUDlHdlnmVitNhYrlX5SoehoPvdmWPwSHhkfxAnr/g+38akM16+NSQoe5im876
         KlhA==
X-Forwarded-Encrypted: i=1; AJvYcCUAIu1UGrPPfO71lwTbzQvFT0Z3cnB+qc/DBeEBeq6TSgSPP1JUEU7mbNe51RVg9+HhKs1ZJ38uUWKmkxQ=@vger.kernel.org, AJvYcCUJnWzMl14s70p9lLfn9arzbXQt7lTQuk3c1TrGhxCwKKUWYP7S/RRb9mPS6NURfvN3xrUgDgotb0Nax1Yl@vger.kernel.org, AJvYcCXCSKz6QSfnlHqAFxjeXoiBL0FliusDdlODXEODESzullPzsaLiknxm2FMMNlVompFSt5U2B3YsbqkE@vger.kernel.org, AJvYcCXJRoTpe+0ILrahTDn3X6bxNcuE16MwpEks6WuJn2A5t3yEfZ5HAdZTbKKJtxEfj3F5qb564vFBHXh+@vger.kernel.org, AJvYcCXcGyfJFdJfuoOiX8AGulMfPOBJpxwTpocEd1omZQVAwtkplrMwuiO8eIasR+Ik2BPPjCPTOMUzQyAV@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKYOVIziwOgZvl6cTy5mt5j/M/DKx0gRUGOIVbxYeavLEYvi9
	3hoHTIep8gZtej8rdhmKntrGnRvkDlqMN1k/oHn5cYgDdgkJYv/M
X-Gm-Gg: ASbGncs8nRuLHDPyb6cmLFrLrpoCOa5QZ79NV1kuWVnhUPkX2TAxvQMaEHmaRa+W/aQ
	JH3vsD5kTn7dULwgwVKf2wOusWwhk6sBaQBk1SaVx2hvuIH60d0gW8cmtcx86q5RNUeBpdnpmoC
	MyckI5cG/v6lLrxbJSZnCZCsHIp5pK6jPP1yXoAOuFCcyHKpIIe+ijdAUsj3nhOejRWPm3jbPoA
	676NpLRcuKaPC4wRXoDyJspQfvE6JpzQyEpoaxXpLv3ne81mak6oO/eYWBPfnxVeJASUw==
X-Google-Smtp-Source: AGHT+IHEL03aH+5l/Jz7FYfrcitsFgP9ffzprpgrgzAbhB/MKzdMCk++VqGl84RAs4ABj585pIWjAA==
X-Received: by 2002:a05:6a00:ad3:b0:71d:f2e3:a878 with SMTP id d2e1a72fcca58-72a8d01e3b4mr4778325b3a.5.1734534854909;
        Wed, 18 Dec 2024 07:14:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b7c7c1sm8640241b3a.112.2024.12.18.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:14:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:14:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
Message-ID: <4f8c8445-0d98-4905-8cc3-752dba3ec11b@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-4-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-4-ninad@linux.ibm.com>

On Tue, Dec 17, 2024 at 11:35:34AM -0600, Ninad Palsule wrote:
> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
> trivial. The hardware does not have any resources like clocks which are
> required to be included in the device tree.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Applied.

In the future, please base your patches on a well known baseline.
I had to apply it manually since "git am -3" didn't work.

Thanks,
Guenter

