Return-Path: <linux-i2c+bounces-7722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1759B9357
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 400241C21851
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FFB1A7275;
	Fri,  1 Nov 2024 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOewJ1zD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F1C1A3031;
	Fri,  1 Nov 2024 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471688; cv=none; b=A9vr7dtHcvPvGkeWVDwyok42JNVT/ATk6rosYxyshPpmvQdGkKNLV6jXLDGv6iUXId/65ByJuFPWaiQbEqLJ/qoo6+sWMITFZK3uj35/GEJyE0gwdo9bFXDxpk3wj51glOHbzwKCNpu/uIP2lUvYt4em41OasKZkI4uSd3AN7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471688; c=relaxed/simple;
	bh=9JG90zTfCUScvOFphL4kj3IYpWFe6ArLtspyxLtHdEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leNRitSYUmyBXpvMLppz/kkicw+40A4/q7ZFdDvCWSSobXFXip0NOdpr+rXPvTsrhyoZEfnBw7Y2B60EJNZsT8HNYArmHyFJezqSAbS/NJKtkSUWR+FcpywDSTOJu5mN/riLGd+bSJ21Tseu5Q9/pdXjvwILVzwYcKmfnSZTvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOewJ1zD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c805a0753so19837275ad.0;
        Fri, 01 Nov 2024 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471686; x=1731076486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKpAeblCGAtzD68Yzc5Mj4f4qQtnm+utnPXApNTtIW8=;
        b=MOewJ1zD+CFnVsJZoJbSBKW9BPP7LShD+Pfqo/AI4fugTfWT0kh6Ns/y4ya0sh+BcP
         8b11NPtLH/5LWM2rzEDKC5z3BQlwZgCOiBWHXhbXdj2i7+18Cs6hHH723VQIYBFhqxNI
         6FmAqpS6F8HAioBXFxMzsuwmnP0unhX55p5K+/pU7qN7pt5+HvgyzCkbbD1M3c+BzmH3
         dg0XSYiSJsgcgz4+INQQSd3f8+fPjrBje/bXh+9LAVxUbgwmVRqbV6e2RDKGeBxAtV6G
         1wQzG8Xd6GMUOpkXS8RjGRJ0ziHpTOavxGQuAzaLwRbVfgRz+rHOIfV3uFDgINhy8dHS
         PNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471686; x=1731076486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKpAeblCGAtzD68Yzc5Mj4f4qQtnm+utnPXApNTtIW8=;
        b=L5j2BKN8BHYgDDKTX2rYtdTDiQB7mi5eblbyG3rAygoSSvLtiFyNh7Ey2U74xev9mx
         3/S4OjEWLl9RoT3Ewvumw76jc1BuX2/0I3Ba2VcJMKlwty3G4R1IrWLyYveT+MNcnfoR
         HQ9QSJeLyo/douGFVqRcds0UZE5NCf4t2pF9oLhBC7P5YaRDyIr3Dd3QL5g6vuLP7xIe
         vLyf/BWK8rNje84AGCTeut3SroztRVEXZOuFqaaq98nls6/dcpGnEHVaXAo+m+TPrbXF
         1oR/48zaunjl6pbvtsnE85gpp6cw0Llp8LoqAZv/IsIe+71L08nEqofQwLBa06gX0Y8d
         jFOw==
X-Forwarded-Encrypted: i=1; AJvYcCVtA5Bi7bkTwi2lBRxOEeofqqWXTbetjzmUgKkOfOUmsqiUM391XbGyFrRXoV+IlJq1zLKe0hGB5wXve4g=@vger.kernel.org, AJvYcCWUM2oHBQ/fmw0n/jx4MHlkjOIq2EKpLnyjSrW5xVseZ2qdAHwonUgqZvYXtklv75K7sSkfYzwzxf/6@vger.kernel.org, AJvYcCWnaTljKs3Jx+Gw8xhelI374UC/q6Z6sGM/NK6NYd/u4yVdAHpL+YWFR6ZA+LYys5rCPPkVJB2+HxTQ@vger.kernel.org, AJvYcCXtYni3iPTNi/O2grMXiFrdaSF+rS9Ab/06b936A4JFZJeMz5iirG/4T7dgQh0GFy8/fDUNuXffYfF6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjx59wzp/G7n3jB19IevRafXZJqEjEQSrTV1ef4R1x4ni+y96O
	xsgonpknY8H9Vbuz7eBZe72cDuMR4Zksn3xNj5fz3REXQRHJKdv9
X-Google-Smtp-Source: AGHT+IGRHx6rCZfHgC4R8udY/nsKG7MZ8p8qtIsO4JKh8tbvnjFVnQGxH4Yp2B9a4hr2TlKXrzLRGA==
X-Received: by 2002:a17:903:245:b0:20b:fa34:7325 with SMTP id d9443c01a7336-210c6c40927mr332992905ad.43.1730471686178;
        Fri, 01 Nov 2024 07:34:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057f73f0sm22052015ad.306.2024.11.01.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:34:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 07:34:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mariel Tinaco <Mariel.Tinaco@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] hwmon: (pmbus/ltc7841) add support for LTC7841 - docs
Message-ID: <a65cdff0-9267-409e-bd7e-418b060f4bfd@roeck-us.net>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
 <20241029013734.293024-3-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029013734.293024-3-Mariel.Tinaco@analog.com>

On Tue, Oct 29, 2024 at 09:37:33AM +0800, Mariel Tinaco wrote:
> Add LTC7841 to compatible devices of LTC2978
> 
> Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

