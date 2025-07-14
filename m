Return-Path: <linux-i2c+bounces-11926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E8B03507
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 05:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3639216428D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 03:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7561DF24F;
	Mon, 14 Jul 2025 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q364Wf+4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752462E36F0
	for <linux-i2c@vger.kernel.org>; Mon, 14 Jul 2025 03:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752464369; cv=none; b=O/XJg87agxa+4020ImcP+NXV2pBzMf9xMBscT7BU1oLbrBm5vvf8ETluKqAoinv2X/rObS1yCeE9Jp/UkAU+EPeEp3cHZxNCHCWeqhOhIt3E5q/9C4EiCuZKa0FSP5J1SlHql2sMc44snpGahsNoXqqzKrS9mrNXIK5X7L8QfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752464369; c=relaxed/simple;
	bh=9yw1cM1JJ8Ap1pjgj+U/AwSkrqjRXzvfTo4MgmXrsx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzIg+wVJpkrn/xwq46VjiTX5HczxsxGm8KnH1dN1CGx1bGh/zccFGZfZUjL/Sn/TtKpm+D/3Clddx+gYUMrA2Tt5EFqLFwWA8xiG/xPy62hJNe7dAOKKgPbRYbbiEBX5a8eKYlHMvlV82G1bkEXdMDDE+kcp6zGUvOleRWFYUow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q364Wf+4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234bfe37cccso31172095ad.0
        for <linux-i2c@vger.kernel.org>; Sun, 13 Jul 2025 20:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752464367; x=1753069167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+6/k62UI4QDNnsPMaNZviv8mxGlHDTuu2KNG71R0NE=;
        b=q364Wf+4bcQ0z8XHkCEMMPAI6Gc2Ww/IWrst6K4NHkM9C/8ctpSzX8S/BnHwQMCKcj
         Rnr7kvjr63FVRGvmkyrGrSSMj7jyE6Uh8u3QqWVpOyZjJ07vElv4H5zfOaLr2VhhOQ9w
         ufHF1J879WoIlJ1tNB9frVQ+UDDv4m9nTbNqSHjzGgPpcUNwhi/4WTHhLtPQAwQKl3SD
         GQKnU3mplUNfx+g/98Rak63lULQFjzdS85ODW5KXOzPoe8a2o+ADn2FZeXp12BIw+VvV
         nJ0bFMy6V9KoARbILe1jxFk2rgbpaNZSglUaCuWYekJ4WwY081glZ+vM8idx3lsdeRxp
         M1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752464367; x=1753069167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+6/k62UI4QDNnsPMaNZviv8mxGlHDTuu2KNG71R0NE=;
        b=vUDt6JSiiB7SEz1EpTrpTnEmCOCd+LN9eZFBFnAjLMejDplb/Rzqgu03DrOsm7ZpDm
         gCmmii9xTM28REM4ZfGUzCRSGPwiL+XKnbxTNubUBdYYjNJMi7eOfkvAFTIGBHJdp0lV
         fSaxXnMxNQqP3mlgCe/scqZaoEPdfTOmKc7umtMlDS8X12EJtCdkDCxs61x2k3Zz13cS
         mxSxDsEq8T0o9OJaMPPYbvIGNquIWV8TYy40ypVF7tHCjJ2cTJt5OpVj9HhbWW9wvb62
         Nohe2l4h7cgCNHGyZnIJyIbIwqKL3tkYN7n4Ijv9GXhCWS4yuZEpqF/MJUpT5XYYibrX
         T+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl+tWB9dzOXSfa+5Q11+GNp/BXlBA9eKbYlFIbAvfevfq21HPaqFd55iYkOUnh95p+J4E6czNfULI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/JFAe/DJcDMcwVATojaBLLuLoYXLWFME4kGnzIs+sE+8vy4k
	c1YJ8vSIieNFrfiSyyzlejx8j5fjYLsWlIl01p76TBYd8+QOrt2g7dW9n4RrfSUsF6EJIqBRZWm
	H35jD
X-Gm-Gg: ASbGncsNK30kcHiISiGHABUDhiTF67xoEHqDvd9bfX+Wr7D7MVZGL2aJuiPYgo9ADkb
	xXUrviUjo/2hBatDDSqE5whIz/FmFHkSk66W4iKxpHBHGO6rn4czARv25B5py7ZaW3rdPwvOtZk
	qjthpfHRpfCguZ3LgQeh13FOrkmiXt/719BqWq+E6vieyWnDuL5+Pml0xuE21JdgcF3T9P51zEt
	eKHIqm20nNvcAqh6ZnaDZQy458DKkbwKtKvHS550vl0mTAPJb8BnxaPyfwrIEOXTFpYTkOxIbsd
	v0aSKA+vzEUXM98Ao3tC3ButTpOU2XD2WWZNiccixlGRMMb8A1zc7N+7lSDqMnR4CTkvtaFzLW5
	4yeWNjRk2bykadLHtgvLW1Ls=
X-Google-Smtp-Source: AGHT+IH2g5qmc9RE+Cl3rwDnpBl4jF0vwTsbg5rxmEj55bIQb34Hr8YQz/Yx4gWK6dStNBp+qFIREw==
X-Received: by 2002:a17:903:a86:b0:235:91a:4d with SMTP id d9443c01a7336-23dede58855mr153362665ad.23.1752464366767;
        Sun, 13 Jul 2025 20:39:26 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42b0e04sm81449905ad.84.2025.07.13.20.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 20:39:26 -0700 (PDT)
Date: Mon, 14 Jul 2025 09:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Chen, Jian Jun" <jian.jun.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-i2c@vger.kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: virtio: Avoid hang by using interruptible
 completion wait
Message-ID: <20250714033923.uoyehav3sbcb3rqn@vireshk-i7>
References: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>
 <pvjv6gn6ylnpncdp5xdzt5wdnzc2tuuww3ihed46q76vm6qwly@7smel4x243a3>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pvjv6gn6ylnpncdp5xdzt5wdnzc2tuuww3ihed46q76vm6qwly@7smel4x243a3>

On 11-07-25, 16:51, Andi Shyti wrote:
> Hi Viresh,
> 
> On Thu, Jul 03, 2025 at 05:01:02PM +0530, Viresh Kumar wrote:
> > The current implementation uses wait_for_completion(), which can cause
> > the caller to hang indefinitely if the transfer never completes.
> > 
> > Switch to wait_for_completion_interruptible() so that the operation can
> > be interrupted by signals.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Do we need the Fixes tag here?

Maybe we can add:

Fixes: 84e1d0bf1d71 ("i2c: virtio: disable timeout handling")

-- 
viresh

