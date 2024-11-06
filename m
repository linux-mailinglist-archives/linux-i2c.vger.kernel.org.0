Return-Path: <linux-i2c+bounces-7845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614129BF257
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21624284015
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 15:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4470204022;
	Wed,  6 Nov 2024 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzSL+JHt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F932EAE0;
	Wed,  6 Nov 2024 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908714; cv=none; b=tY83StX1cFTJmVdb0OQuuJKWrw+cjgQaazZ4bzPWBoW823vQliwxnoHx9DgbkU8nAiJpVyBMCf0wImGqW++O026Xhl0CEufdhRkxkMBd8t+CQkXwxn97oui1Rf3487Kdsr6yozKFAlqM+9KaI7R6yUM3NJkZoCkouQe/tE0C1kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908714; c=relaxed/simple;
	bh=HdoUy9fkRfHNMPI/Zqx1R8MVO28AwhfbFFuB5nPrHjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFLFzFDdF1Fs9GcgiMVD1MhpAP4fuaNcDnzjgnqQ9kfRZTHRAmCqHpmQP5lhMZEuAanvSqG5aDWyIfQoGOLm2rOMDnUPmQNSrRMzv1oTEt7vHLhYriJMZGsiSLl9lxB+BQBDNUnfRppr/vkhEtG8BSoYbbaE3eqEQY6lXoe3X3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzSL+JHt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so5446494a91.3;
        Wed, 06 Nov 2024 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730908712; x=1731513512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUAqFDp51+CluivEaChqcOcsJi1Yi3zAq5PND3VwOLs=;
        b=LzSL+JHt9nR1sCsruX+0lGMDbHtvZ/7XbRnoqRAUZNQ0YG6pTPGK8xsjlJ/nKXsL3C
         1zC7mF8bXW+zUyFjRKJ7HtchVWLaepzsMC4+Tuqp/wVvM+48SCfHMKlkMNvN9J2hGjMy
         wsotIhRvmWdk/nEtuplvWLafBgR5xcVu2P0ZAu2zfsoWkX/SLBG2yvaIUU7DA9JxypJo
         Ue+lrQ6q4nGtxBIlzcz4dvOdehvUBXG+rxj3kd0AEpEh+cKIgI/BfUd6cxgkSFM8BJ2C
         M+WG4AICAhtDucRDw0xtVh+CCbC7BmOF/ZrGssGqlEmoZaRcmECxjOXce7Mdmr252GWm
         0n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908712; x=1731513512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUAqFDp51+CluivEaChqcOcsJi1Yi3zAq5PND3VwOLs=;
        b=BIKsaqda4pNQEQKaNlLirhNNJn742rJu7s50bhhaiqsmw4hBYHrys3LA2fST+MZESm
         Mdd3CdH5hKVVTzwHah65PIQx3+9R/gBZPjM5JGLBv9jNt4UgdoTawVD9teG/mjZjhvoZ
         Wgb+It4/CPhPfQeLyNN25qC/1J+2paMTBAL1HgavmnweKKr1u9ToBkGahx5vYJ34snZy
         LlNxaycwzC31sTetbsc+36dC9IeKRfDI+F6JNJ8P9pLF3F39H9JRZEUrK1VcQoK6XWVb
         b0u9HOKiQL7F+X87Fpn+mkoNONX4sFs3w5kJz54sRWp89EE1JqhZEW07uA5qA24wmTPV
         9pGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw+FT1VwfWF/TDVyzuxiKDIM43sLZLhGiuu/udRo/EI6/zth0ZU2bu1z7PGZb7XYGW/yJQ4hr2sg0RrSaR@vger.kernel.org, AJvYcCX76DJ7Xu2YsPZBFTjFDXZ4O2SoF9YLVd8r8DiUL8GiSke9DS/53XBLheB7+lBdau78g2nN4RtnfldWfkE=@vger.kernel.org, AJvYcCXXexhdO/JKw/Yl9ckOpoKIDyf7dUevHH4U1x5s/YbK/AVlQB57fhK6rTO1cML39EXiyuP42wMAhUIg@vger.kernel.org, AJvYcCXYKElhiDdWOIJpibC8D+rUplE6RmoFPz+ukTblap9ODyz4yZbpqtMHBeeebXnSh7nvsYFqnrDsN4CI@vger.kernel.org, AJvYcCXpk4uel+rHVBMtAcwQT1BXj8mI7PsfBEJoJk5jhX1TVW6LR5sPdLP/bv3t6zJtXGAQd9aDlPRXAff7@vger.kernel.org
X-Gm-Message-State: AOJu0YzlRTH91ppURDzn+v1vGg4cvvagySKph8OYj866PAFkc33+WAhK
	IPnKrV5fMt4jXKt5KOvgmllfHjgAk7pDd4UDJDupIlE16atv4CFs
X-Google-Smtp-Source: AGHT+IGg5WQMsEr9pnJxspcf4pALiyC/ozBfwqFSU5i1wYsgWEJ/S94GrDgJEKjrQof/TQOVShKsxw==
X-Received: by 2002:a17:90a:43c3:b0:2e2:c9c1:aacf with SMTP id 98e67ed59e1d1-2e8f10a7276mr43122388a91.29.1730908712314;
        Wed, 06 Nov 2024 07:58:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a5a2f95sm1668475a91.34.2024.11.06.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:58:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 Nov 2024 07:58:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/7] hwmon: (pmbus/core) allow drivers to override
 WRITE_PROTECT
Message-ID: <36a1a209-18dc-4cb5-b2ef-80045eb306bc@roeck-us.net>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
 <20241105-tps25990-v4-2-0e312ac70b62@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-tps25990-v4-2-0e312ac70b62@baylibre.com>

On Tue, Nov 05, 2024 at 06:58:39PM +0100, Jerome Brunet wrote:
> Use _pmbus_read_byte_data() rather than calling smbus directly to check
> the write protection status. This give a chance to device implementing
> write protection differently to report back on the actual write protection
> status.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied,

Thanks,
Guenter

