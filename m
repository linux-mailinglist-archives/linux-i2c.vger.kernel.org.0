Return-Path: <linux-i2c+bounces-6275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07896E3B6
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 22:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 150AA281837
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5427C192D81;
	Thu,  5 Sep 2024 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVjiq0Eo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B873D6D;
	Thu,  5 Sep 2024 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725566980; cv=none; b=V6gaXIjKpeKTwwa1XWBe4sceFnr1YnxkZ9g+L2rBWU1ErhgaQR8/WM04TeKH1G4rVn7FvtiQJJeRaQe7JN4Ms9pYlMf0tMJsP7GIf1bF+NKOBe+5RQAwoucrjS+QFVWMQmAfANUQxnjIgVGBqWSivNucqCZaVQXwC8ZzUsFr/cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725566980; c=relaxed/simple;
	bh=jrefzNA12FzJQQjCFsScSB7l/AHuNdpw7rAO4rexBss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IalLGkvdGRber4KLZ5e4SXGBtINwDUz+JuapBCypXv2LN0YWS/N6jSxqFdwXPpmMrRJxcICnIy3q5P5Vvkqozczmf/BtNzBcIXC6RkLNHFeaPChFPWmZeZRzs57Fu+qhf/VzHzH4TpgQ3/X1rckiQ+RgyxpoFUG9Q/z8M5a2S2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVjiq0Eo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD13C4CEC3;
	Thu,  5 Sep 2024 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725566979;
	bh=jrefzNA12FzJQQjCFsScSB7l/AHuNdpw7rAO4rexBss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVjiq0Eoo8PEtv4vfrCu+ImU8p1dBUkoja81MxiBrpUUGMe2KL6SCKlpyjN+mKLoG
	 F/RmqOe7qin159/60Z2PHlz7gbiMhohYZgKgsbchKFdkhB3D2xawWhy4kES5SCtuZi
	 PNz+RsVzAx4TqxaM9RuxMaM2QxVGwEktUSs8d/sk96rSGo68MSeI+jOEDuIKbxMl7R
	 VaHSg1ybPkoOZ13nwQ1iviNdXX4/uu7pvMXFUKVCjzRGTycC+xIWBQTEtIoG9gMpw0
	 7fiTPzUdbmIkZuXC3/1QRUFqDCpV2nbGFxbX4LfJ/zSLaRTF7aB43i401q+4RGxSXU
	 0HHuiIxSDBz1w==
Date: Thu, 5 Sep 2024 22:09:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Message-ID: <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
References: <20240904020448.52035-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>

Hi Richard,

On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> As of next-20240902, camss seems to be a bit broken, but the same series
> works on stable (although it is much less reliable now that the CCI clock
> frequency is not being assigned).

I am not understanding this bit: is this series making it better
or not? Can you please clarify what is broken, what is less
reliable and what works?

Besides, I'm reading that this series has not been tested and it
makes it difficult for me to take this in, considering that you
are adding a new support.

Thanks,
Andi

