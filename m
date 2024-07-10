Return-Path: <linux-i2c+bounces-4839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF192D229
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 15:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBB151C21AE4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 13:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F5F192460;
	Wed, 10 Jul 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd+c2OS3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C583CD4;
	Wed, 10 Jul 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616479; cv=none; b=S/tPJq0lVxhs1ml1iX3BG+A+M6StUxT/xACXrnPkMUaEFo27xXvfKYrPKINkOasNWFrJBQq/hBdsIulW2Ugz+LU11BQqgJFIbORzOOoG1ahtHlW4vvBNXA1c5DFg0ePMVOST0ezBfz9+152unvpyq9he37noI5KzqjIjIuTBxns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616479; c=relaxed/simple;
	bh=+4x3HRyWwx+Xd8R65nc5F3s+t/8WKeREvJg/+hwigNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4BRJvQykIgYoNP4CjVdSoEc3XgrtReSOgTLq8StUsoUB6PoW8CQhyRgQlA+4glH1m8q+FswEIqYmX2F9FiB1Avq4m4IJ7vaHnzqi/NqnOiHbH62azSQkmA13582ziDJ8Kf8RtSFe7wkfgp4ogSX1F+LrfW5IR9NKTUJM4sWGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd+c2OS3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B113C32781;
	Wed, 10 Jul 2024 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720616479;
	bh=+4x3HRyWwx+Xd8R65nc5F3s+t/8WKeREvJg/+hwigNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd+c2OS3wlylXNCVcq2IWuf7/W4hQGqA5CKbwW2oSTLsIClLVvBY937ugu+/OeyZ+
	 kbM6jbPjPdZNxPiXHMPD1v8PbAdnNeWuAJcUWfn6YWehhOkMDO+Do3jLFhXpJTE45k
	 ZB2xGkPcUILyGfvyTohqxZl2E0QwrW/+Ixxi0lDfCDFaEgHLOZNPwSgFs4I5+QdPBM
	 vtejH6Edjgwfg/BZf1cb74pKymF25Ic2waFtmftEamj1Y7NXeQuBPTyfz7z7fTC0Ps
	 +KqdMxV2kXcwCs4OBI4+WFSoATis5UTvY4QsJnWuH37tKIp9Q2QDnWK/mUFs2eW803
	 k53IfmUiUItVg==
Date: Wed, 10 Jul 2024 15:01:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Conor Dooley <conor@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <7kki7gjcvt2z23cd2t2p5jmy7plxazlcu37pchfxkpifm76jjz@qtb6rqhngclp>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <172059771094.2294116.14777114514280404581.b4-ty@kernel.org>
 <6374ed31-3832-4b17-9d80-f668c419a016@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6374ed31-3832-4b17-9d80-f668c419a016@kernel.org>

Hi Krzysztof,

On Wed, Jul 10, 2024 at 10:21:57AM GMT, Krzysztof Kozlowski wrote:
> On 10/07/2024 09:48, Andi Shyti wrote:
> > Hi
> > 
> > On Tue, 18 Jun 2024 09:42:37 +0200, Thomas Bonnefille wrote:
> >> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> >> and a default configuration for the BeagleV-Ahead. It appears that the
> >> TH1520 I2C is already supported in the upstream kernel through the
> >> Synopsis Designware I2C adapter driver.
> >>
> >> This patch depends on the clock patch from Drew Fustini
> >> Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
> >> and the pinctrl patch from Emil Renner Berthing
> >> Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com
> >>
> >> [...]
> > 
> > Applied to i2c/i2c-host on
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> 
> Something got odd in the git repo above in your ty letters.

yes, I also noticed that sometimes b4 ty is not able to resolve
to the right repo. I haven't had the time to check what goes
wrong.

Anyway, thanks, the right repo is:

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Andi

