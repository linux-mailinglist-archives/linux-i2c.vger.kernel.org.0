Return-Path: <linux-i2c+bounces-1496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4B83F25C
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 01:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7BC282323
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 00:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99A22D60C;
	Sun, 28 Jan 2024 00:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNYvBTbB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773C1241E7;
	Sun, 28 Jan 2024 00:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706400032; cv=none; b=LE9LCNyVvejcOnxre+ai5KWhWFJIjgP6q2flZyuCM/uZaqHFGZcDqDqqQc2LjSp/5u344Lhx/eX8aEUj1w5vr27d51DawUjDc4qJZemK519fHX8sVF3/H2F/nFAzoUPZAhmQ108eL7p8RGSqpzqhWX1Zgh7ibwJLUk+pDK4eZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706400032; c=relaxed/simple;
	bh=jWFhcZWzzkHMKynjUE+bOduJBsCkVYwxGvAAyoWuIjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbR5xRVu8QTQax3WLZZOej5gyLvk7qo6sK6G2xFZT+snt2I+3dlNLbwfdYuCrRGGisMh5zzyzTgkCpDYmCfspp2XpoNz9W1+IVB2iJ0SUZENmITW04GkEJeQbIrWf0PrwHng6hbUDvWeDiOFQNCYIj9X1jamJY4Qw2a8tOHT5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNYvBTbB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2900c648b8bso1205956a91.3;
        Sat, 27 Jan 2024 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706400028; x=1707004828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKBatOeFtgBc38RfQF1Wg8gY9lXRRUPPaojugjidloI=;
        b=LNYvBTbBaqAmv6n4Qjhb7hWDcoUrIEc3CmZA735aNYCGJq+r0VRF1vbRPxPIlRqqg3
         hFaKNwar3GB4Dk1MrnVfkolAfMwR2J0axSSloJ++BQAOKdwhgL95LJHG5mJ2TlmkWo7Z
         kmr6fwBXLBPxIvTQel7r12/N+dguA9X71h9Qr4Uc1lyLnPqKxF5K40N1h1563m8qXZN/
         kVTym6aQRLt40fYNLuccSPnb6axZFWtK1zaYPCdwsla9Cl7Klo8n7Pxy/RVTC79z+0+G
         FmWTkNPvxV51FsG79s4jtZottHGZOH8JKX9pt+qfJlQ8XdVIQ6dgh7GJzGfo0huUlg5g
         MfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706400028; x=1707004828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKBatOeFtgBc38RfQF1Wg8gY9lXRRUPPaojugjidloI=;
        b=UbOytCSFRMAbKY4r/ifjUhmJyeKF0MoI5W0ilppAoo8tewdoUDZZXyPlPJgtrW4+Yo
         MpyuG790l61fCXCQ9fhNlwIvbCPdhQMZSzaZ4dLoKRZzp/9YPGKJMh51bLxezv8+L9j8
         +YHdPI9LC9J6s96Kfhm05+Xg0SFyg3ExjtrwsLMIWV89PBetf+r7tZmcElzBsATgBcdr
         5yOIV43gBq0gv/UtrpH6b7/LTizyLWYB6axgRLJ8HIaI59npJpuKmeKMbkm8ZFwo4lcr
         kSdq+BQH3gcZ7qkaKna/6z8llJqYkRCsE1OsyhIr+H9ZQsnDF+0bUddIHar61FXFb2e6
         zCOQ==
X-Gm-Message-State: AOJu0YyW5CEIP6uP2Of9zu7OFvUJfvP4ucjqGMgi/PT/gAftWZ3Sh2W0
	4+kp9pxc4wOdQ1RRVJq3Z500n7Zc2yLQgsm1/b8IXZrlkQlTxctDG/ym/zM6
X-Google-Smtp-Source: AGHT+IHhTflqKed6XZFpVLDivazimufb9DNDz+aAg0baqahpo1LV60a70Kfxvqc4yNysYTBTFUDz6w==
X-Received: by 2002:a17:902:7802:b0:1d8:c875:27f7 with SMTP id p2-20020a170902780200b001d8c87527f7mr732166pll.92.1706400027760;
        Sat, 27 Jan 2024 16:00:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001d7610fdb7csm2870884pls.226.2024.01.27.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 16:00:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Jan 2024 16:00:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Hsu <ythsu0511@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Charles.Hsu@quantatw.com
Subject: Re: [PATCH v1] hwmon: Add driver for MPS MPQ8785 Synchronous
 Step-Down Converter
Message-ID: <81860c27-43ac-4e55-a653-e7f5597ffa93@roeck-us.net>
References: <20240126075213.1707572-1-ythsu0511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126075213.1707572-1-ythsu0511@gmail.com>

On Fri, Jan 26, 2024 at 03:52:13PM +0800, Charles Hsu wrote:
> Add support for mpq8785 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is synchronous step-down controller.
> 

"(MPS) vendor" above has no value.

I find no reference that this chip actually exists. Sorry, but I can not
apply such patches without confirmation that the chip actually exists.

> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> ---
> Change in v1:
>     Initial patchset.

A change log or v1 tag is not needed for the first version of a patch
or patch series.

> ---
...
> +		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,

I am not too happy that all those drivers claim to have no output status
registers. It always makes me wonder if the definitions are just copied
from one driver to the next.

> +static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
> +	{ .compatible = "mps,mpq8785", },
> +	{}

checkpatch says:

WARNING: DT compatible string "mps,mpq8785" appears un-documented -- check ./Documentation/devicetree/bindings/
#293: FILE: drivers/hwmon/pmbus/mpq8785.c:37:
+	{ .compatible = "mps,mpq8785", },

I don't care about the also missing entry in MAINTAINERS,
but the device needs to be be documented in
Documentation/devicetree/bindings/trivial-devices.yaml.

> +};
> +
> +MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> +
> +static struct i2c_driver mpq8785_driver = {
> +	.driver = {
> +		   .name = "mpq8785",
> +		   .of_match_table = of_match_ptr(mpq8785_of_match),
> +	},
> +	.probe_new = mpq8785_probe,
> +};
> +
> +module_i2c_driver(mpq8785_driver);
> +
> +MODULE_AUTHOR("Charles Hsu <ythsu0511@gmail.com>");
> +MODULE_DESCRIPTION("MPQ8785 PMIC regulator driver");

Is this copied from the mpq7932 driver ? This driver does not include a
regulator component, so it is a bit misleading to label it as regulator
driver.

Guenter

