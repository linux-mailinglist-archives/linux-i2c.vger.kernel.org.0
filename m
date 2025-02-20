Return-Path: <linux-i2c+bounces-9507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6BA3D55D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 10:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F51417D18A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 09:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A1D1F0E5C;
	Thu, 20 Feb 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3FUE++P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C51F0E4E
	for <linux-i2c@vger.kernel.org>; Thu, 20 Feb 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740044879; cv=none; b=oXYJOn2Wb1LfZG62xE11uoUOzl27JICqTSWEURDN7yoA91AMK7QksoLdX4ZHkui7HOuVG7R8p6kDopj/KI9w4l7Ol7pMvo5epM/0YI+aZ5Z4kzBD8vywrkSvCWW10aQLhK1gIQDtjQty/Plakqe5SnKK1wjNNSDaupLJxjaQehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740044879; c=relaxed/simple;
	bh=IWsg9d6lbEashhnUPHSkRjmEXhpeKPSMS9vOhHCIlfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb4YFA6kx0CYshfc0qddU4qW+5SBSKniGuruVWzphkJqVDxwLBnOF2pdi911SKTOHiALLt9hYAD/lq2GgMX6LsRkik2FrLA+Ti2qHnHA0eODu1LE6JcIoT88dyyQGZawch31JJgCLrMI0OmDkBiVc9e7j3Ch5/0mn4yZJRE7dyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3FUE++P; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f378498c9so611928f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Feb 2025 01:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740044875; x=1740649675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3C+kognpjmHLZgIVXwXKpXpKvfpiYLWcBqUjAjWp7Tc=;
        b=T3FUE++PN0U3+a3SEBSaJHD8QqhO+UgkgQYM8dZRMXZTGqpAYZyJgQT0Q1+6jGr07H
         H/iUU00igxlY5xiwrjsc19xEVFpDgGInfAqueY4x3/u4hGxRg3JATpGpYuMbtOAnuilk
         MXfFw17oXJIEnn2s+1bTZOg920iciE+LRztDeurB7uIsV1j3UQQFZ3O4+0jWkcyvf1ca
         82mvTdeOWU62CIiq8nCmKCtRc/Hsg/Q+wuS7wV2OIJiyuee0tC0WsLCdj1zUQgiTbC4u
         qHmGahno5mqJsr+fY/iMRbFD/Vl1pJ8HWZfCVueAYZw1spkCPghqbvnjm3snlyEnP747
         b1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740044875; x=1740649675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C+kognpjmHLZgIVXwXKpXpKvfpiYLWcBqUjAjWp7Tc=;
        b=cuqbyIbNGIeaQmdYdrGApxBN9tDfhxohFUwAvjQqB7hFL5H5iO8R6QhdtJmo10UjJU
         2aXsmUhqaVB7O0xJZd/NXSdc1agvj70hFcEtjrutMV38hf/n8Pp8FQvRnLkGVPGdkQVq
         wg8HUbuuWKa2JTYbQG0rP+lwsMwLAZLa4S20oxK6LU8IaR2vOrFKbIHE4pwxD28Jz+db
         Wjm68sXND/+KbZdKs7hlMOZM0j61c8imQZPz2YOyxezxU9g1i8LwNvEWKr1+SXASxJrp
         HynJ0J09VtDMxiNMfVnaOYAGPXpWeoJlwcg9TTID0cTPpNmBPH9AX3UZT1BLYB2x9ZiK
         OeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXniOdZCorWWgzAK57z/sJebF0Qz0bNSfiedefw769Wm9uwDhhdagTQ/C9QiN2KsbpK2o65wBqP88U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyawRZZJWcTm98msrnTMegJbbeX4N3n4g5hW4HL9KbzZdKnaqs9
	+TRBcia3wQDOtP1x9sS/HxoqMQc0Jf6SDgVMY1ZWV5IOHh7nYwST1FpQfvy35Lo=
X-Gm-Gg: ASbGncsGriskhRwzE+87Wgrlfo3qkmmHG+owltb65H008s0zdruO2/2sie/O+jEFZJr
	/zmhAHIdTwg5DxwfTz86i4hm1AsW65//+w/Y0I9dNiWcA5izsM6dtVdVJLgwdEBGZ+9kUh9+G3I
	fnokVnaDpvVna3TXsMzUIy+qW9g7xQHHeVotEYIVblmBDPbqim4UrVvs1Fl7QngLeG81XBvJgm7
	Lc35Xx4+hWcf79CNyjNW9aQVOUjiTgeYjBzK45SgvI7mmhMCNJs52iyRqJWVOplztIcEb8HTAmR
	bdypC7y9xnpbn8uf7bt+/6vw+eY=
X-Google-Smtp-Source: AGHT+IEsCez3GPLSZunwwFDyUVqq7Wkm5lBgpW3JvRE36iu83J5JlqvN9UXFhpA6HMjqTat9XWSXuQ==
X-Received: by 2002:adf:f08c:0:b0:38f:30c7:eae4 with SMTP id ffacd0b85a97d-38f33f56507mr18120522f8f.52.1740044875163;
        Thu, 20 Feb 2025 01:47:55 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:b30c:3d94:4d4a:a6eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm5514525f8f.21.2025.02.20.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:47:54 -0800 (PST)
Date: Thu, 20 Feb 2025 10:47:49 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <Z7b6ReQdDtAUn5GP@linaro.org>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
 <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
 <Z7W1EJ7uGsaTZMRh@linaro.org>
 <sc54ro4pwg5j2lqelsryx7cdw6ipcdp4gfk3ce5sxsvk3s7wzp@wup2pgdzmxtl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sc54ro4pwg5j2lqelsryx7cdw6ipcdp4gfk3ce5sxsvk3s7wzp@wup2pgdzmxtl>

On Wed, Feb 19, 2025 at 08:30:35PM +0100, Andi Shyti wrote:
> On Wed, Feb 19, 2025 at 11:40:16AM +0100, Stephan Gerhold wrote:
> > On Wed, Feb 19, 2025 at 12:02:06AM +0100, Andi Shyti wrote:
> > > 
> > > sorry for the very late reply here. Just one question.
> > > 
> > 
> > Thanks for bringing the patch back up after such a long time. I've been
> > meaning to resend it, but never found the time to do so... :-)
> 
> We have a long list of forgotten patches that belong to the far
> past. I'm trying to revive them.
> 

Thanks, this is much appreciated!

> [...]
> > > > @@ -1745,6 +1775,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
> > > >  			goto fail_dma;
> > > >  		}
> > > >  		qup->is_dma = true;
> > > > +
> > > > +		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
> > > > +		if (IS_ERR(qup->icc_path))
> > > > +			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
> > > > +					     "failed to get interconnect path\n");
> > > 
> > > Can we live without it if it fails?
> > > 
> > 
> > of_icc_get() returns NULL if the interconnect API is disabled, or if
> > "interconnects" is not defined in the device tree, so this is already
> > handled. If "interconnects" is enabled and defined, I think we shouldn't
> > ignore errors. Therefore, this should work as intended.
> 
> yes, because qup_i2c_vote_bw() checks inside for NULL values.
> 
> My idea was that:
> 
> 	if (IS_ERR(...)) {
> 		dev_warn(...)
> 		qup->icc_path = NULL;
> 	}
> 
> and let things work. Anyway, if you want to keep it this way,
> fine with me, I don't have a strong opinion, rather than a
> preference to keep going.

I would prefer to keep it the way it is. It's okay to omit the
"interconnects" in the DT (either for old device trees, or because you
don't define the "dmas" either). But if they are defined, we should not
be ignoring errors. -EPROBE_DEFER definitely needs to be handled, but
even for -EINVAL or similar it would be better to make it obvious in my
opinion.

None of the existing users should be affected, since no one defines
"interconnects" at the moment.

Thanks,
Stephan

