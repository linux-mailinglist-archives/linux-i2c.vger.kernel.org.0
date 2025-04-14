Return-Path: <linux-i2c+bounces-10316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B65A878B4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 09:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAD687A51B9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 07:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2CE2580E7;
	Mon, 14 Apr 2025 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSC4JuZg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EADB158520;
	Mon, 14 Apr 2025 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615666; cv=none; b=mAWFkwao5FJUpkiGn3bFuxHvYVb1I+hj7SCOtRybc3tkXoGcgDAHu3yjP/cRg8XBxXYfmnTNmHzXKvG9Mxxd4HewX8RzO6g9bSYtGzFXFPMsLLNLkrmrX6OE006IdaCoMRDPQBHo5X9iS83GM59lacBEdLTYOj+ItdS6vdUXIP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615666; c=relaxed/simple;
	bh=6t46hUDT3sRy0Y1X6ouDrUUHbzkpk+wzcw4qHxwvP4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VopR39ynaTHeZL6cWBip+sXUfNKoo3fqcPEcn8D6pdxoeYR840hr92Pzp1os3XigNHV4TyZ10d4WKxTojUwCddJmHgTYaUF8xCFztZuOZZjKZHajg9dy9YEk4H76V8zuO/HbvDnaVcoD5SdUBu4p5fNfDO20GvacAVMrPpZdcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSC4JuZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0610C4CEE2;
	Mon, 14 Apr 2025 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615666;
	bh=6t46hUDT3sRy0Y1X6ouDrUUHbzkpk+wzcw4qHxwvP4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSC4JuZgAwwn7OOZRWoFg9NutKwcwC3CKPZ+jd+afI88+aurFCl4GMgoUP/gtGKQB
	 3KvR69xcLmbGUl48GAZuH2vMci3aKnPGeMQDfI8HueQ/LUPMcqBQsWaVXE3uYKG82G
	 llnrJEMzhTUmkWzHTDY6M15cp0Act5sm2AGZiZVZ0NhpJiJ88ZOwCvo88t/NoGT+IL
	 QevSlAOdp3R/ZIzgxKTd2MdcPHWbyX7MdmAU1yZnnzXUgq05wnObPp25tfIsxyy3NL
	 jV23ZQpUCbMfGEMbOmcZOiGMhTNYID3IQadTucL3ybHa5JbGe7IH+Kw2ugKIqaO+Yq
	 Z/rFXHJt9vKvg==
Date: Mon, 14 Apr 2025 09:27:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: i2c: dw: merge duplicate
 compatible entry.
Message-ID: <20250414-strange-oxpecker-of-strength-dd6ef5@shite>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-2-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:34:55AM GMT, Inochi Amaoto wrote:
> Each vendor have an items entry of its own compatible, It is needless
> and some can be merged as it share the same base "snps,designware-i2c"
> compatible.
> 
> Merge the duplicate compatible entry into one item entry.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


