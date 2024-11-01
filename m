Return-Path: <linux-i2c+bounces-7726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F29B9407
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 16:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13BF51F218F3
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE5C1ADFEB;
	Fri,  1 Nov 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6YsdPsW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A919F43B;
	Fri,  1 Nov 2024 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473832; cv=none; b=jejEW7mk7CgEvhyrN9Xdfho+HKIH7mcMbQHbIsuFA5mkH+cl/OsU5NB7tnDiUoKZDzmv4uOKN5qoPctJAr5Pg8HS3D3ggtpBxLJa7KOuve7ibUIT87e0pqsejDeZSNRylymlz62gIXcFtwrNgSll50GAr+bIEGBIJv9pz+4N0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473832; c=relaxed/simple;
	bh=wG+chI/4UZO5jGgLoc/oTzdlxZquqHoUg8VBqRFJICo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zg9vczn36kihoAU5xeXvcaV1dNQTtcS8dIlzprU3AVdTWwJJPPYJf9dbSHA1BYEK15A1Ofg/vco7mSYLUZmpzs845qWHrO2j95rbFtzWj6thdYH5FcHA8/RDSBJuiQ+KkfPbXbux4y6cqTMNJ9I2n+vWZtx1eJMRJaFwrX/LvrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6YsdPsW; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso1740373a91.3;
        Fri, 01 Nov 2024 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730473829; x=1731078629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLHEFIz6OYXrCESggZlGnEkVWOeVNMnrs5P4PoJFuVY=;
        b=k6YsdPsWspL5Z6dMGdYyM2Bq7g56fT7FWj/sLRUCgtkmngDLLZbB/JXI7aDn0e/xSk
         HcJZg9Ku4PlsvuctJhW8cMIgs6r9zoV3tUiw1qtT4Wv1V/zzuxKAxVsppzGUn7gjkmho
         +Inb0cOsUF9Q3CRNJniraFQurX2aOythnN9+7Bzl5groe68TM3LP0ba4CKUHGeiFoXxy
         ZQgBHGZaGmDMb8PyNUD8FU6vgWvgJO3SzzTckS/TgM7IRVkFXC18SriGIwzQgzhpAv+y
         t3+++DaHEOX1zenWZdrIA7mXN8oYkcEM8tujOgriHVoVx2R5uIsAuU4jCvE7U/Xfh2t4
         PJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730473829; x=1731078629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLHEFIz6OYXrCESggZlGnEkVWOeVNMnrs5P4PoJFuVY=;
        b=IbpJG7e2fRvk6FpHgqpOh3pDQyfbttksO3gEKjcIhcMMGhIQDpfItfbF5aIrRenBdo
         F0SEzmi+/JZVjO4f0ZFEaT+z388q2a0G24YFXEx/K5ZMBZXxJcvOM5DDd0uMuT1LSe5k
         vpVMmpiuUSFLw8nTeiXiij06uvsbhZw7FHuAd0xsMI/padWXB8x//PyE60M3phDm7gb4
         jHDKTaY0NEhQESAm9+ypdnbDhYojZ4WhxJwNmo/Dfuw+DIdBcTHQ5YAFMXHgUl9Qr1de
         Mry/GpojmRFTtZEOYCvbWSkhbI3Mu8I0MXNMlR5fz2x9JU5IXFgh2C1Nwbuyl2ulBLpU
         a5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBaO7l+j+LSw+ahlbOZsFVu/IXOC2RTte4OA8MM9Pj4M9gRzPeFTk590qYSa3w7ZqAl2cHgsKKv5LTF3NV@vger.kernel.org, AJvYcCVIXuS7r0/OexUJoLDfAEGLwcMtaydf9OLHwG4Pwbk4PmCW8GUsPCLAaCjrzXTd1uOuSBP3jk+XNZ5HxC0=@vger.kernel.org, AJvYcCWpfrTWAl5KiS1Dj1bHPn3wyTowDjItNUzm/UP1RUUFAimk9I/qy5AO1vrkMGEieFXLZsYqpU3uq92F@vger.kernel.org, AJvYcCWxAALzOoWw7o4zqHHz/Gvr2snrVSVjA5ljP+sKnvKHJ3qQADSBTkkrPrcak8ReOMqvshagsGozzZt4@vger.kernel.org, AJvYcCXLwYpNXN9Z5vOvfUnqb1eRRHMj7iMPUAzTiK/dSdfvtgGksdYoK3RZBD+nRRay2FABb81Ky4KootLa@vger.kernel.org
X-Gm-Message-State: AOJu0YycrD1Eq9X5vo53JK1ze8sEhNNF3+Nx+3kQYkQdUhdjAw0ZOHqD
	SnRdgqOWuJIhQJW4LNkyKUIdUiNAXVJrCXBqhr9drpq6m1SaOeqki7bsQQ==
X-Google-Smtp-Source: AGHT+IGBaoFdTTYrMwEIUc2SYb3gkcNYaF696BCJ+PIXirOU5+dmKWZrLhvF0QjXxuTctSLRVsYkSw==
X-Received: by 2002:a17:90b:1a8c:b0:2e2:b21b:2247 with SMTP id 98e67ed59e1d1-2e93c1e6e78mr9104077a91.27.1730473829482;
        Fri, 01 Nov 2024 08:10:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa450d8sm5055509a91.25.2024.11.01.08.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:10:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 08:10:27 -0700
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
Subject: Re: [PATCH v3 4/6] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
Message-ID: <fa3ccd3b-7dab-45b2-92ec-49400e39114c@roeck-us.net>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-4-b6a6e9d4b506@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-tps25990-v3-4-b6a6e9d4b506@baylibre.com>

On Thu, Oct 24, 2024 at 08:10:38PM +0200, Jerome Brunet wrote:
> pmbus_write_smbalert_mask() ignores the errors if the chip can't set
> smbalert mask the standard way. It is not necessarily a problem for the irq
> support if the chip is otherwise properly setup but it may leave an
> uncleared fault behind.
> 
> pmbus_core will pick the fault on the next register_check(). The register
> check will fails regardless of the actual register support by the chip.
> 
> This leads to missing attributes or debugfs entries for chips that should
> provide them.
> 
> We cannot rely on register_check() as PMBUS_SMBALERT_MASK may be read-only.
> 
> Unconditionally clear the page fault after setting PMBUS_SMBALERT_MASK to
> avoid the problem.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 221819ca4c36 ("hwmon: (pmbus/core) Add interrupt support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ce697ca03de01c0e5a352f8f6b72671137721868..a0a397d571caa1a6620ef095f9cf63d94e8bda1d 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -3346,7 +3346,12 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
>  
>  static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
>  {
> -	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
> +	int ret;
> +
> +	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
> +	pmbus_clear_fault_page(client, -1);

Why -1 and not page ?

Guenter

