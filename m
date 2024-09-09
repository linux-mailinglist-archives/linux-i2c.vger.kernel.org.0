Return-Path: <linux-i2c+bounces-6424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7C971FCB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFDB1C2290E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803A816DED5;
	Mon,  9 Sep 2024 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7gt9XoD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4DA18C31;
	Mon,  9 Sep 2024 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901268; cv=none; b=clHgnKhlE46kvkFtSnDy3zcaXEi+BcAanJX0P6OdIka5e3FMEqfsFFDCmr+L0dBw3WrjZes0+jOPcXhbaJxAMIxgq3/m29PYXx7pu3X6tXB1DEQWelMT9WPQM9d9guY7hwdVgLxMXS9Xv2oFkpPhUH66kMwm9KreNkH+b5FViao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901268; c=relaxed/simple;
	bh=HtBHPMReoxmsFVubCKzZx9sbk7oPC9bOWnoljRcot9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzQgIf44dzCd9hOyjuzhAt1Vik4uUBcozdKpXXg1ANzqYEu/lIYsdxHxJPWZwsqtksi4UYmjSQ9W9SKOdOoBig0jm3wD0S7RBfc/nzzmIICDw82mWnO78Tp5lDfsPCb7xDCAXbqQ4IsCHLvaN3PEfu9j0NNBPkI4JToKpXeliDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7gt9XoD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71788bfe60eso3435731b3a.1;
        Mon, 09 Sep 2024 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901266; x=1726506066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFp3dyOud5TYGslaFmCFtEi8qq2/igtTt6YJAY1KbtM=;
        b=g7gt9XoDcR2WKYaIagBvw23fTmM4x4ZGGN1Pk8IBm7bg1yO0ZsnztylcqjM/EAN6Bw
         DO/4Xs7eHV1VlP5Q3cOJz5s9P5lqrf/2gFB91X23mZvvoHv6ZGbT/56ZJ5eyKy2fFdj0
         rdDJikybOBA5/0H8K/UIvhXzo8RgzqjSOgNDtUbBqiGcNeGVorQBd0lyFf1eITUivuUa
         2zSqbijzgaoNsVLNHDizoWGz/yIOdFxHUsmb96J+TH9UXgmwKOIIXFs2+Tm7FUV0Otao
         Y3j/xdqrJGEgTLlu8nzX/mE6V+NKt0hrP27p2qZzv8jWfhk6NGmRlfZju3HmL9eg3AxL
         bSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901266; x=1726506066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFp3dyOud5TYGslaFmCFtEi8qq2/igtTt6YJAY1KbtM=;
        b=VYE3lvFACm2FUJW+sOlY9sB75zyOgHFYFJTX91XCJ+v/2Ui9xAgxIec7CpEf6Ju2Zl
         HS01se73bjFg/kgH5b9U4RlEsHCHJicmTXG6ekcWzJJsae1Pj6J0JVOYL/qFsgE0VW1O
         tvUOIzBT6OkqYo4uHTrw6Y0ZPRRWjmuFSsDkIBTPkY+biH1b3wrNsYKMbsZedCy0N4Tw
         KO0LwBuz0CZmNMr33zsS5DVj8eZJ+Zk6XbhcQieNhxIk61PKLQsmUqTVU1yZPQzrdbTq
         5VTGpA51gk6cffYQVOLrP106bHHLZi+a+38PH34v2hvQ+MkYpVDlYmkMz2ZoEoxpVLzY
         V0yA==
X-Forwarded-Encrypted: i=1; AJvYcCVDxWv9M/MpUMMgFRApPLa35tDlN6HIwNF6V+s2BOxPt2Rv+Q6enK1NpBxou6ZGuSQPbD1Vo6ZaHwT3@vger.kernel.org, AJvYcCXFbNS5M+OZUkXzsuMf41Mjt6D0hIMEjDlO3gRdbUtWf9fgLM75dexJAlyq+AdlFz3/1ABPIiv7MfEbeQ==@vger.kernel.org, AJvYcCXoHU8N+zp4o79GvIKIPjg89A15je4YL0/qDlTToAUerSP6fmf/o85Fraglx03tGFSH6QMDFxrhnZ3vuqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq3bhnS1tOshlJxtzljDzQI41CaD5/jbrcWejU5soaDAVN5JUh
	W0TL8/lXVs1quZgGw8rQsswUAusbmXtXrLpvVVIhGeRC4yu2eQhz
X-Google-Smtp-Source: AGHT+IH51B9iUQpEOugyIJdbm7uwbH4lhnsiH8uNOoG7PV4L7qm/oOLHLXWdzJJucwqdoc+QNPynqw==
X-Received: by 2002:a05:6a20:43a2:b0:1c8:a5ba:d2ba with SMTP id adf61e73a8af0-1cf2a0434fbmr8599341637.22.1725901265838;
        Mon, 09 Sep 2024 10:01:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e598fd3dsm3756442b3a.186.2024.09.09.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:01:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 10:01:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 14/15] hwmon: (nzxt-kraken3) Use
 devm_hid_hw_start_and_open in kraken3_probe()
Message-ID: <650a8607-5ea4-497b-9241-1b0d5be81916@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-15-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-15-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:12AM +0800, Li Zetao wrote:
> Currently, the nzxt-kraken2 module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

