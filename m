Return-Path: <linux-i2c+bounces-10679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED9AA0E8E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 16:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB431BA165E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 14:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE792D3207;
	Tue, 29 Apr 2025 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6lK2eW3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CBE2D29BB;
	Tue, 29 Apr 2025 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936157; cv=none; b=K+uagobktVl+xBNeJ/vqFiRopzc2oV9Fo/Rg0FS4L5oEK/lHt2yTGetjy7HDEhXAvub+ssYjniKA5vs8qRg3gXbVyP85H5p/5AuYwwIOkO32rh/8aq1cbLbynLrrPwXuMo1I408Vr/+Feprnu2skjOComzxymxtuInvE4zgTdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936157; c=relaxed/simple;
	bh=Eguz7VoDXnoR8Ggv8PmbdGUYJ1KeoxNUaPMyEWLjYfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHeBQPG9jOq/pM+9hGVPX1kjjWQZRClFLawP/XE+RZsx5WbkzZl4rPOo4n6u4weQtVB9JlNLyix9jBDKZZvD5rO4QgxCU+98IsDY9w5hHGduxaT2blvSbe4wXk5CD4XmPdKPjfZxNpc9YlRtfRbvaOp2RGj07cu9zhObMbVd9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6lK2eW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E58CC4CEE3;
	Tue, 29 Apr 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936156;
	bh=Eguz7VoDXnoR8Ggv8PmbdGUYJ1KeoxNUaPMyEWLjYfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6lK2eW3Gpx25noiTu2sbDpKMnDbNpi2r7i35mS/8S0ekhxQPA4Z3cVbbtX2Yqtjg
	 6lju0kR7Wfks3j+ZMmLfPaMo8PDEt6PzEFgkdLSmcLnax1wLBmR1wPjJG+6LX29nWU
	 A+a/MS1is4JrQB642aUaQz7YDgKTCN9e1PAdGmT+bMx9pm1yS4RvbIJO1elMiuV11D
	 rFVTVpZyMDYs5nQa+va7mpEdePdDSxeOhz1HY3F00DPAEqHLnYoUlKM8UJZJrfPVp7
	 0vlAfOgJqv4L9mok283m/XuB7t8VwTY9reyj5QLeIpVywuttr2bfWkDVNPynbcRUWz
	 KKXmGnKkOrOWg==
Date: Tue, 29 Apr 2025 16:15:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board
 support
Message-ID: <egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>

Hi,

On Sat, Apr 26, 2025 at 07:23:58PM +0800, Inochi Amaoto wrote:
> On Sat, Apr 26, 2025 at 03:36:41PM +0800, Chen Wang wrote:
> > Hi, Inochi,
> > 
> > Will you apply this patchset on sophgo/for-next? I see there are changes
> > just about dts/bindings.
> > 
> > Chen
> > 
> 
> I can only take 2, 3, 4, 9, 10 for now. The left I think they
> should be take by the subsystem maintainers.

Please, go ahead. I just merged patch 1 and 8 in i2c/i2c-host.

Thanks,
Andi

