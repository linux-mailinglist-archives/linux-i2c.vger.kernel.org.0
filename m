Return-Path: <linux-i2c+bounces-1223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED9827DA5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 05:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD0421C22DA9
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 04:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9AE5686;
	Tue,  9 Jan 2024 04:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTPMS5hn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72526468B;
	Tue,  9 Jan 2024 04:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6248C433F1;
	Tue,  9 Jan 2024 04:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704772997;
	bh=JLURUuRUE3nvesAgFLJyAQ51v0FoQz4YhL+GT2pWcTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTPMS5hnJXqXBNVaZ7hHyTAldTIBz2P0NPkF9Qw4/+W3/Q6/A/XuBsey7ac2VOLvF
	 oy/WkZoKTyVBuhL0lWP+gdjrORy2cwTPRneD/NXI3lXSBrGLLiHp+nCTqSguSyS3DB
	 wkmk6aZ1L293gLvov3S+zoQ/hdVVA5yVkKFSJnR9V3mOSzCou5A1FUakftUo7a860v
	 X703ePaudDNLzFVM+0ZJ2fliESsbYAKp1KEQXUHXeTm0B4IELZ5tHeGjJSe5dGVdBi
	 NuV63VQJLdP3DkH+jV4/c1Phcw3WY5Tm8psQSSA3esu4tmzfA3vdr5wCTT3R+ZCzCP
	 0wsVemdrz38bw==
Received: (nullmailer pid 2622098 invoked by uid 1000);
	Tue, 09 Jan 2024 04:03:15 -0000
Date: Mon, 8 Jan 2024 21:03:15 -0700
From: Rob Herring <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: google,gs101-clock: add
 PERIC0 clock management unit
Message-ID: <20240109040315.GA2619804-robh@kernel.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-2-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228125805.661725-2-tudor.ambarus@linaro.org>

On Thu, Dec 28, 2023 at 12:57:54PM +0000, Tudor Ambarus wrote:
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v2:
> - fix comments as per Sam's suggestion and collect his R-b tag
> - Rob's suggestion of renaming the clock-names to just "bus" and "ip"
>   was not implemented as I felt it affects readability in the driver
>   and consistency with other exynos clock drivers. I will happily update
>   the names in the -rc phase if someone else has a stronger opinion than
>   mine. 

I'll defer to Krzysztof.

Rob

