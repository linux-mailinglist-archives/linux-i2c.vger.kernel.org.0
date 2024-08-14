Return-Path: <linux-i2c+bounces-5373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A435D9516F9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 10:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F752286FE3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 08:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C90142E9D;
	Wed, 14 Aug 2024 08:48:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD31422C3;
	Wed, 14 Aug 2024 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625281; cv=none; b=J0nIpOgRkM1CSx2XRwutCuSqEqwXdQdwt1ftzTHjrkfUnkVpqfGrC1E3GJ5sbP+02S3Ma+Wenhhx908PwYJcDaSxhmqtQHvbC8U4XSxq9I+4h6qyZLy/zvDZ9VfjmQ4pHgSFFTQzXQ3DgqIqQWA7ZZ3GPpsbpi+5Nhfun2SBDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625281; c=relaxed/simple;
	bh=9rX+RbnLcib1ASYWBSEvXjPcnKmaUtLTBClkTMxRHmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYoeoNHkvGfv2UxnYWcIACeZN2D7yvetZWgIhLkl7j938EudXLb3VX47/lY9MP8MTJqObj+Kf0i9O/oml18p2KdrIkeVY+aLD+E/IuipntlW5OQs6RPI2mGMU86HgTRcObK9GUOH750IVjIRRJpqCRBDzqhWFtBWg87IRBg3tDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so67243341fa.3;
        Wed, 14 Aug 2024 01:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625277; x=1724230077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoEzFPa5Og2Psgq4HyInxDXXf39Xj956SzleRo/JzaU=;
        b=Kg4d3HUqzEJSfeigGbJOlX7HILpadnLHqcZwutJ1onb1tNabHYTSgrHAnTAbqXJQXZ
         3ULrF8ZpmHn+r1inae13MvlUigyANshu6AaxOt+P85lXEWyMWjOGTMryL/rIym5rGOo0
         +00UZPJ7kSi4Cf45U3uGRRkh18o7KedLTiqGQX8HGvzVnUan6Fh1vl3EiIsgKPu6pU6X
         pllCjSn6iHtR/cSTbVM4pczmHeSAe2bn/F2vNap/hEdgmJ3HALBzfkM+RSoSHyxqjVdj
         +kw4L864tE3IzgWQTcRaarIT10SJnbZIoVQJWwgsO60oUcezmJODyTQEbxHgb9j5+gTZ
         07Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVq2m0IQzNm2SJgsOec3EHvjyTLBxv4xhHxSrJ2fdIA5KDUB+LeB9XQj//NKAe4K67SmBDaDE8vMpDo/U57FnYq8EsDE162HF+jJOHOtUtufxSJ2T6Xlm3RBV+papMASoKv1sQv2wNyAiX6b3R3E60gE53gs9Ia5BcJGTVi/1hqlNvD5KY=
X-Gm-Message-State: AOJu0Yy90eEu7NM1F1s3Ti1rv7oTUcVZei5fHGSP9+/5aG2Dh/Hl6Xzv
	XJZptYFyO6pXB7rMiW1LMGScmsJjJIq8xjof3vbKTHvpIMTMFArx
X-Google-Smtp-Source: AGHT+IG13U8UpfbcuMATjHLEmJgpXZZ1NeV/050xdRLNneKphbDxbBSwsFcLsfpPAQA1ApzdC8fRNw==
X-Received: by 2002:a2e:4609:0:b0:2f3:abca:8b0f with SMTP id 38308e7fff4ca-2f3abca8c13mr8201251fa.27.1723625276758;
        Wed, 14 Aug 2024 01:47:56 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a602115sm3598747a12.96.2024.08.14.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:47:56 -0700 (PDT)
Date: Wed, 14 Aug 2024 01:47:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <ZrxvOr6O8weK5cB6@gmail.com>
References: <20240813161254.3509409-1-leitao@debian.org>
 <ry4kzh4vr573ymutpjz5sgzmhosn3ekm3jatjy4yfyfm32eqit@cmp376je7viy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ry4kzh4vr573ymutpjz5sgzmhosn3ekm3jatjy4yfyfm32eqit@cmp376je7viy>

Hello Andi,

On Tue, Aug 13, 2024 at 11:53:17PM +0100, Andi Shyti wrote:
> Hi Breno,
> 
> You don't need to resend the patch. Because the changes are only
> in the commit log, I can take care of them.

In fact, the changes are in the code itself, see the changelog:

  * Replaced ACPI_HANDLE() by has_acpi_companion() (Andy Shevchenko)
  * Expanded the comment before the change (Andy Shevchenko)

> Besides, you also need:
> 
> Fixes: ede2299f7101 ("i2c: tegra: Support atomic transfers")
> Cc: <stable@vger.kernel.org> # v5.6+
> 
> Can you please check whether this is right?

I would say that we probably want to blame the support for ACPI device,
which came later than ede2299f7101 ("i2c: tegra: Support atomic
transfers").

I'd suggest the following:

 Fixes: bd2fdedbf2ba ("i2c: tegra: Add the ACPI support")
 CC: <stable@vger.kernel.org> # v5.17+

I am not planning to submit a new patch with these changes, please let
me know if you need action on my side.

Thanks for handling this fix,
--breno

