Return-Path: <linux-i2c+bounces-4842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48292D3EB
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 16:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1A01C228AA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 14:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A2B194094;
	Wed, 10 Jul 2024 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpgClfH0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06291193448;
	Wed, 10 Jul 2024 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720620711; cv=none; b=T/nTIxVVy02QdUZRc85AnOEZUrkzEtGfSvwcAMhFPriROOspLieRCSv2nJJv495vLi8Pg7XVnUOVnwAu4GXSORMO1S3D6/X2JJj9IF/yds2TRhnc/B53vPC4gJm1I72BMlhFQI0ywlQVPrgcSCqmF22tj9UouskKMobUk/BNdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720620711; c=relaxed/simple;
	bh=trdn6cQsvGw0FukybJ8D6oyADdAlROUTuSyNsdnzU8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQCEqUsdY1El2k92eOjtN9kJ73vRX+OBON4lrb0cLC67Qn7PpKsPSDGWVaqfifLyIxgitaU490fMddPhQ8jJ7hwLZ0Dl82VMLbq4JDS52YbUInvouYLznQoma4/OqpsoE4UCZyLWup0Wrc3HuWOCSN2FAHMaQYhRbFpkMQ5sX3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpgClfH0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-701b0b0be38so4908549b3a.0;
        Wed, 10 Jul 2024 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720620709; x=1721225509; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEed6btgf2qApqgnj2unSejqwDiHIUVqOkzcgUjHrd4=;
        b=JpgClfH0kvH+hIbbE/4ojH1pe9qpUBeGNxo28pxcx2Luht3qW4bcOnM7J06XAP8B0g
         ZD7a6qXNrY4OvcvAcfs5Rwugvlqvrtn4laNH3NoUG2PkEnQ5Vj2FqNal7L+bCgDTvQiF
         /OKZOLYoT2WLqrBPoMGvh52gqx8dcle8w1EjLGW7cWV6vqcCq/mUgEMXDVmX9QEgHYnI
         6eygXU17QRbpVLYGaiPcqp8L+X4XE4ZEkyaWbvNB+S7YX9us4XUgwWlKCttM87Hq58J8
         4linZOLbqWlfQngeLqHuiJV+kXjtKN67VmP8yOU1ZvQInjt176MbYq32TG0gIZYKWEzL
         1oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720620709; x=1721225509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FEed6btgf2qApqgnj2unSejqwDiHIUVqOkzcgUjHrd4=;
        b=GOORnK4jbybyulF1+EFaFWtPcuz/UifUgDLBtvI0Z6mPV1PSapy0nR7s3MlbwKGhmU
         /m3hdraHFb0gVfwUzMo4r4rPKFgVScf0ptlVjNE08lCfcB2jsS2IX6p9CdZ4TWy05aW5
         Ic1S5v20DI6WfgKY63nGVtnUUKr7dVitjJ9c/NScr68cE3kX96VvgtkzzCPSs3NkGwMV
         iHVBjx1urubUJoXbadQZyviUp98c8KKhhQ/7PdaC6+5zb+ompBNMtCuxrWBcSICO3deD
         +AvsyJWMC6aaG65RPjogHYwuXWgW9L4Q+7vgZ3aJ3i/ZO8tgUt6gtHQRL5li7hEuMD+Z
         vmHg==
X-Forwarded-Encrypted: i=1; AJvYcCWyOW9p8R+njoJsIbj5u/Tza8xX/YU4H4/PlVsbORg7FpnxGbL3EC4CXOp6jGWyLuSR+mEC+2ZtVXcizgad4ZoasBnELxs/YO7sB+0iVw3hatIvJ/IMXOXZswSEuJJXqfK3gh5rYg0=
X-Gm-Message-State: AOJu0YzQRzq02v9E3w4nfEgk+MPlzN6phs2nsQ+1H/yrEwaNy/nZi0iT
	f9R18yl8EwPUjX+LUzYhm8sML0pYtTPjRoOPIpg6u2fDA1FL7olH
X-Google-Smtp-Source: AGHT+IHlotAfgT/0GueDFfgANwxoFv4FoiKAmecK0FndGp3OAXrBDZo5m0/pIWTv2je2qfY1VXAIfQ==
X-Received: by 2002:a05:6a20:3d82:b0:1c2:93a7:2557 with SMTP id adf61e73a8af0-1c298398352mr6727388637.48.1720620709103;
        Wed, 10 Jul 2024 07:11:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2a2e9sm34343595ad.97.2024.07.10.07.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:11:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jul 2024 07:11:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/ltc4286) Drop unused i2c device ids
Message-ID: <c6b9234d-e5f5-4263-b91d-f19f10e1cd51@roeck-us.net>
References: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
 <9a48ba0368e0c8cddc94c5e4cf3edd7eadc03a2d.1720600141.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a48ba0368e0c8cddc94c5e4cf3edd7eadc03a2d.1720600141.git.u.kleine-koenig@baylibre.com>

On Wed, Jul 10, 2024 at 10:35:45AM +0200, Uwe Kleine-König wrote:
> The driver doesn't make use of the different numbers assigned to the
> different devices. So drop them.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter

