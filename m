Return-Path: <linux-i2c+bounces-8300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B765B9E1329
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 07:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63E3FB2166D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 06:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C835F17E016;
	Tue,  3 Dec 2024 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKGUFfQk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2055336E;
	Tue,  3 Dec 2024 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205990; cv=none; b=TmnjzQhlSs+Ld7O2YEfkgQwFTFlOxjUGgtRF3jWtpEuVuGJRdjgk1D0hxdzoIQA5DGCvTXX5wKOQDaEobcwYYsYTYG4jnrreXU53XG8rom9zyJ5uLtas1gYqzkmE5i7TPDUsM0nvftfEpM25JZQ6Aupwmbn8wlQwBPLcSrtfQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205990; c=relaxed/simple;
	bh=IKE7WEmLR/std3Xt311uNoU+Py06JqC4zCsAOuEIpFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Po8UqH7CSTmr1rflrjRWJ1FIkkETA4zbBMIDkdcQvDGwQvcnJS0zCxx8BBEiDOUgKAjGqCbDNJ7MFzfdAFyR4Oxbtfh0i0QRhSKpTABCampiZlsiWt+NC/HGzdBCuEYqD588AJ/y3r8kszy/GOJRPkAB0ImYgSEiQcJxbZ/R08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKGUFfQk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2154e3af730so27868925ad.3;
        Mon, 02 Dec 2024 22:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733205988; x=1733810788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sL0YxSEUm6Opbm4xSsuB5iPBh/P+qfIzBr6X/6z6Qks=;
        b=HKGUFfQkl7OebTht7QWCZzQj/pvBGt13IFa5dtCt307Z6cvPzBlNEcXBVFg19AYlYO
         b9yj6RgSHDFjVHiB+rhtnqA6bc6GBI+5D0v/jUP2ATRwYMtnMDnncBgbHOVQPRbpLtab
         gYWt7c53hZubtYriAk+OYS9npFsEBmInv1kGEeykb0J9TDo4/w2wX7wME1iDLXLLLdS/
         HV6uV0W5yzWI3WrQGetX1S9UEQYbkXK87RzPJS/6Ib1kvOmfkYVivxfMT47DQZpCTlNm
         Cj8nzmJFKOkkGRAEDjDo8YjEbS2JZy5Idnk+p5hDErmaUoN+ojfMnMHRhkKeBnqUbPsI
         54zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733205988; x=1733810788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL0YxSEUm6Opbm4xSsuB5iPBh/P+qfIzBr6X/6z6Qks=;
        b=gRH5P9hsjIstqsLMSQsy6xVHYthK2HrQIMHvQNY6j//CP+DNVXBkgxLfi3/EpC/Xws
         KclKsVj7ki5YO+DMcho2n64dL+W8PriQsPRqbjMr++WwHRl5JImlNHyTwaS+j0LCHvUH
         EhxKCkra3w036mqjgpKCwxSb7kenaOVB87OoyKz5YvnT6DxksGv5wDBRFv+cgUndczww
         A3Y16OqR9wFYuuKgKCiNkiUwySsN4E7oS64kvstj9GTQnTHcW+60gha0iZHxvNvaNVkq
         1T2Iylf0lFJYXMfmk6KSQ8nAEsFkr/Y2ijka3pGgwItY3CO7rReqzZoPo2+dYGcRaihR
         tV3A==
X-Forwarded-Encrypted: i=1; AJvYcCVDJmCiCkACUP7ljuU11BcGkB1GgOu06YcvnEH/CL38zrIv4XfnIw1CHWi4tsYnPyWzyx7Yt46Isq9xai8=@vger.kernel.org, AJvYcCVGS6TqTFpAa9Kd2EHQhSYdvloVumTYZy5cDsUNC9ZHZKVdom1+ZFF5wtg71dDarvbvVdNgCjywX2c=@vger.kernel.org, AJvYcCWJwQi/R+g2WW1pvmkh67iMtBzwXHlsuSOMQrreoj9FNENMrAaLhAKFEEKthbFoF409egPvElCiotOq@vger.kernel.org, AJvYcCWYZMhPS0istIQVeNpZqsnG0pBNCzOe5/hohhxF1zp9WwHERlUC/izZrmU08OLnvCrnpG52PEf5C4CPon4g@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2WhTEyXQ8CI4StLDIEb3hMEMPTGRGDDTcXXhJR0a2M+uwfHa
	5u8ao4966w+gq0UJxlDq/kVW7/dvc8Imn6LdlouMWEmMZmVKNkHb
X-Gm-Gg: ASbGncvHZuanEQA2eBJW0jxcxKj69hOOArhbC++uBeFtfB4ACCafVS2LHwzZVp2nBhm
	E4WdbwlBhWjPxJHBnM78fi3GQ9iZzVNGxgBc2MMGJOitb8D9nOMO+Me7gi9r6pRaOOTqMgV5zQG
	mmiv9ApHlDlTCFaVJQl0AAvOG4wUNFSqAH+ZAIyOlEgNpTg4xOpToKjBWejtAPbFOQ62UTSX5DM
	8vmXP7Wzq+AI7RCpzAo+uXZU70JO/mXIBTm/ufrswaCJBte6eJn8eLJl+mXP2Y=
X-Google-Smtp-Source: AGHT+IEQ3CPPR3vs0e7VtyCFMP8+bHfS3Vm7VRd2d/PKApx0+wyxoqYE9Ev/tOG1vt1SHVZqGXUVeQ==
X-Received: by 2002:a17:903:2447:b0:215:bb7b:b8a3 with SMTP id d9443c01a7336-215bd0c299dmr23513665ad.33.1733205988194;
        Mon, 02 Dec 2024 22:06:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215692e535bsm48060025ad.216.2024.12.02.22.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:06:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Dec 2024 22:06:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/3] hwmon: (pmbus/core) improve handling of write
 protected regulators
Message-ID: <0afdcb04-5ada-4bd0-b1e1-c28663f952f0@roeck-us.net>
References: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
 <20241202-tps25990-v4-1-bb50a99e0a03@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tps25990-v4-1-bb50a99e0a03@baylibre.com>

On Mon, Dec 02, 2024 at 11:28:00AM +0100, Jerome Brunet wrote:
> Writing PMBus protected registers does succeed from the smbus perspective,
> even if the write is ignored by the device and a communication fault is
> raised. This fault will silently be caught and cleared by pmbus irq if one
> has been registered.
> 
> This means that the regulator call may return succeed although the
> operation was ignored.
> 
> With this change, the operation which are not supported will be properly
> flagged as such and the regulator framework won't even try to execute them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied.

Thanks,
Guenter

