Return-Path: <linux-i2c+bounces-2650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1DF890B50
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 21:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6978229AADB
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 20:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A1113A3E4;
	Thu, 28 Mar 2024 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWtZDdfu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D7137779;
	Thu, 28 Mar 2024 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711657562; cv=none; b=lxXDD8ZTfuCv/gnJgbpkx/o7QI0Cq9LVQONczDVAG9ytksiVaYxJgBm0e2or0cb3xqdJe6sSJymNvAy4SomALMCqDfO5BAvsJev8fLXsHeCzfCmRqV8O3x5aiaApiopBVVTeUjJxaV/XLH5DbIJxcktT4fbhYF/QCpK7u9wze/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711657562; c=relaxed/simple;
	bh=CbPk/DbLGKN7XwAP4qrp84AXgQM56BgTWNeXFQBg5io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sN4m3IUKAvK6gh2ueHYon4wkW5GhXce2mdiI25qv/uJri88nemPhGrzey8IwWdTXhgS+PcTLMmUWoCna7fi2hrVFIxQUV4I3fUyMaXIhbCKJU56ZgonHMf8MAS+4bD8kuq+bOBLcdbMRBkrgbtgFGmcAlraEseZB89YP6NmJYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWtZDdfu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso955311a12.3;
        Thu, 28 Mar 2024 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711657560; x=1712262360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjTzWFlNYBOpXQ3CKmgioPdo4KwHiFtc75RCFzmDGfc=;
        b=nWtZDdfuVl8C7GhM2e8bgp0QN/0MfPfpuOy1ew9BhF3McF/Dt96zVXUQB2h8kD+ihW
         DCVoT8Jh7gldb3ROyPf1Yuh6gB9X4oi2HXurkG1oB6/lilhpY3kUC+RfO8cckzFU2DTy
         r5i+R4qlnH1a/z6r7a1R8Nv6R1fSE7gO89B5Pfxw1lyCqti4F3FhsMAh+MhTIN62TwyW
         rhLK290sBf+6vTe1g+s4ItgNwOUu8x/NgcpLuDL9PyNauY8lrJFkdOQ/hjw86KpO0Zu7
         TLSpU2PUhpUppDNVNFKlcwW+tALF6qDyP0IACrZcfs/c4ovooheLgxQNKEDaNYypj/UF
         zl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711657560; x=1712262360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjTzWFlNYBOpXQ3CKmgioPdo4KwHiFtc75RCFzmDGfc=;
        b=CHk4e8AJOBx5KXCVHdgKazmoujGPIb6BZoF5MU9au9t+uBz3cTeYu1J0bFnYfx9ERQ
         c2lUV13M7SpazP/seoNzBzs2dT1d2DqRN0fXt2uI3z3EINC0hYzkb6wvVEOX+c0pqiRE
         e0Ud+U44jgZkViS7LU3hF4Trv5U0Hb7oXeOrdYymSG1mE8np9XeYcSBOX0qsj8ABPnbQ
         8MzN2kYoM+SsB8kWBBU0rPH+BieiWXh7cM6COeUGuoyG8jvOamAtiWP503T9pHgy29tZ
         S/tLn03Lwr2fLXlytd7kWByhxNXhu2dxzGZyxYkQa+HQNv+rRolNr3qod3CP3UdRLmU+
         TYHw==
X-Forwarded-Encrypted: i=1; AJvYcCW46Dga7urW7lLvwYPbf5UZ+bfHL2IbVLW90KNxHScKw9VrIGb2CFzU6DuZ9eook9Fpsg+V8Gpdw6zONECssSMkQOBePBaKDP5OBcIkfTuDiRvaUox3q/PBdM6yb4+cStDA02w+bAwzKdLFNxMLdXCxwt1WPEkqlOjH21DHmvC9CeZeUd4N+3Qqvt7MSSO28TaNKnwCt8WkE6Ybqfbdwt1Wx796rNBm5ziYtXjwozT+nS/pnfu+YFem8MeklGRUmusELo/txWUHdgeERmtK/HG5dSM=
X-Gm-Message-State: AOJu0YxJ1IJPSUtzdzQJ3gF0wf+Jibjtsg8tfUX7w+t6AspJKWSEYHUl
	f194JMzgYUVwBx2QZ7pc6Ls7/0GE8Fgb7Ma58VwrkVN9B73vHGX1
X-Google-Smtp-Source: AGHT+IEx1w9caaaypQCI9yAm8E6MJQGwAU1nwtoauXZOhkZ6zuitYlyEc3oh95Bbc7PPnl5r2KW7ZQ==
X-Received: by 2002:a05:6a21:3384:b0:1a3:c407:39d8 with SMTP id yy4-20020a056a21338400b001a3c40739d8mr288558pzb.45.1711657560070;
        Thu, 28 Mar 2024 13:26:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
        by smtp.gmail.com with ESMTPSA id fk12-20020a056a003a8c00b006ea858e6e78sm1795975pfb.45.2024.03.28.13.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 13:25:59 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:25:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 17/19] Input: ambakmi - drop owner assignment
Message-ID: <ZgXSVB4gsKlhsPCz@google.com>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-17-4517b091385b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-17-4517b091385b@linaro.org>

On Tue, Mar 26, 2024 at 09:23:47PM +0100, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

