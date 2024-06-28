Return-Path: <linux-i2c+bounces-4478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F691C4DD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 19:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690B41F21404
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 17:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430921CCCDE;
	Fri, 28 Jun 2024 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPxOPxUS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A3FBA53;
	Fri, 28 Jun 2024 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595696; cv=none; b=nHotQqWOPD+ggF6iGytH/yXtxJGPit+4sMKud4iI8PCAL/lb8+/2RCth0tSq80miWkUCmM1Xo361eawIMHpv7C7LDDHFXfNLwiOwnvmX24TpMpZVOFzTW2raosB64bUS4h0YwoGDYwL08SEN+6Na2fVoVywmmBzqyC9XxKCKG14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595696; c=relaxed/simple;
	bh=HOyVDrWiX/dR27g9rx4QYAQ9fvfK4lGO5ieLcCsDcX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuGGtUe0IvBivmuHayjQaOHBWrlldlzRrTCNt0wO//NIxaoNoWTNRjLRASlyb6SZzgXmtORPuTl/JMlAJZEdjbLK5O3MHKpmJoCVqgrovqsm9U/5VSJggG/KL626YblMIYsgw+e2tlruv9vHm7cKzPH5K1GR2lj/GMITPAxKJ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPxOPxUS; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d5eed9c62eso509722b6e.2;
        Fri, 28 Jun 2024 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719595693; x=1720200493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbSoYYDjTo4d3VEl4YBriUtrngjxcNuUSCZG0Ditu+k=;
        b=RPxOPxUS+4VnvTpw5q+KmHUjcs/sy9Q/d8yZwOSJZEVWHMnSqqOdX7n4k2RMNh6tWL
         piwZdb8D6kFPkV5h6Q9SB5bSyLfP59C/GdViFbwaK0nIxPOm0gPhgVIFcssuztz+zFKj
         YROscpTOKhmFHBq0w3XHWf9HZQwGtTwPPL/H6t9gN+9JovGwpdH4r8s4y02ScbJmBj5n
         DdudoC26l3JvF6kOmToPJzcYFbbAA7EoyJEIBKRCmIHfapvn4H1bKPk75nu499j+6K/6
         2KFeHgMfd+flrrrryhTN3ddxCikxckhksdoKAMRBxNU9Ws2vPUHPZJn9vpFBx0C4vWUY
         HWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595693; x=1720200493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbSoYYDjTo4d3VEl4YBriUtrngjxcNuUSCZG0Ditu+k=;
        b=TDeTqSQU5IqKR5PxWlk1YPCSUsZLJhPl/Qb4lMF4m+3XuR9nstcKaXCgF6YWJyfsXJ
         V1xMMyOFH5IJ/A6e17Ziz5yPrcW96wjFR5+VjIqsNTh1jaabR4KWoHzre836q7jSQLXI
         Q/SbzjvvcdfQQWsgSYnXSLkHDGlwBszBA7fwkZQHiiVZ+/PQJyO+a1wzslic9KhD1xAm
         Nn9bTqObvvUWQJOZKG91HAizfGwpQ1LV3DW89ffK2qLrHi5/Ri8DgFPXCNz29MhVly3o
         5293wVlvRVqB4e+KO6NebGQJX+vaNKhj8Wp6ggIsAixwL1/LuL0pJmEurg3RF5gKcog5
         B2rw==
X-Forwarded-Encrypted: i=1; AJvYcCWHR5xQidAk3zywQ/gk7wECv1vNqsnVf1WMbzqmAAIGtRSXuATJ5rOqtHSxuzil7Wkc+jodkuSxVApc0bKoZymBWblx6HI2Sg0UzKvXwevMV4e0YfMQbFzt8nfQ9uRuFw6fBc/gwQrozcNigFkzhBDfIv9ZQm4X3X3iPdJ9VVpDfB87JqFMOPGCOSLyJckV2RUgJGjEQiIAtN75o4NiFEgeAPzjg5pGt3xJiUuhIeryOgIvoes4QKNoVU52
X-Gm-Message-State: AOJu0YzZh7aAcf242aMSsndCHNwpGyTESEH9fiyca+tBXRDXiw7P/30A
	kdfMJmf/DTpG0yS/aDk9qqldG/lqhC/ZcZwE+2HTB4EjR6Kt83E0
X-Google-Smtp-Source: AGHT+IEtdj3a1ttH4GXg2gEnfOp5VM35geEZbKSc9qVySUD09QB8JjDq3vGoTCGICa+9rlsy4ai0Nw==
X-Received: by 2002:a05:6808:1826:b0:3d5:fdc5:cfb9 with SMTP id 5614622812f47-3d5fdc5d275mr6058156b6e.1.1719595693573;
        Fri, 28 Jun 2024 10:28:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfa65sm1870809b3a.129.2024.06.28.10.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:28:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Jun 2024 10:28:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
	peteryin.openbmc@gmail.com, javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com, bhelgaas@google.com, lukas@wunner.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: add MP2891 driver
Message-ID: <09d4857a-4367-4a8d-bec1-d10c48adddc9@roeck-us.net>
References: <SEYPR04MB6482EE353C207DA6977C974DFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240626094601.52298-1-noahwang.wang@outlook.com>
 <SEYPR04MB64828A352836982C0184AA10FAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB64828A352836982C0184AA10FAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Wed, Jun 26, 2024 at 05:46:01PM +0800, Noah Wang wrote:
> Add support for MPS VR controller mp2891. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>

Applied.

Thanks,
Guenter

