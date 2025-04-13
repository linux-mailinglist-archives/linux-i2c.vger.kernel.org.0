Return-Path: <linux-i2c+bounces-10297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070BA87432
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9153C188C5B2
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E71418C00B;
	Sun, 13 Apr 2025 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqZUGnUt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D2A927;
	Sun, 13 Apr 2025 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744582534; cv=none; b=JeLFzo9e5Eu383eiH3Eoer30pxX6oXRAs0kkBZoRg9JgnPYOd+VXZ/vBRn28m1+z8deZoS4wtzaCcPN6xSe+GDYoJFIyYAoe/cmF4I4BU3H4TFIqQ+bBn6MQK1nIacODW1lENpe1jW/EBURWjsskFG0M1DBxnIaAKDKlSNLN4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744582534; c=relaxed/simple;
	bh=JoJ6FwrMtTQecT32IcduAeWImMav6us8t8dtC+zaacA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp27Jq1FGFKrIxcWV5dvVDX1qXsaON81V8HQtq/MW34xYeR2lrAmRZ5uBampWisgLaYXG8e3Ak9yMYBohs2JE/gcd7JFRlDsOZBTfcOvaaOJ+qJqZuvEJj6yEWZgg9aUnjEZz908vlZdc90sPrRB/YIqBrTe9wzYV0dU9eGifOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqZUGnUt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F55C4CEDD;
	Sun, 13 Apr 2025 22:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744582533;
	bh=JoJ6FwrMtTQecT32IcduAeWImMav6us8t8dtC+zaacA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqZUGnUtyqI+w2LEhI8JPXPaCRsjcIjrdDEnr8Ce4Y0mDp3/4WB7vxmVHsEn83DRT
	 Gp1pB8XvG1nTGz9Py3aAijt0BEAe1Dw22pyTORAIp0sdhSHwGDd0kNqvUe4vmqNAb/
	 MmaJBoDMq55LWDButr3Dx2h6dtVHo8d9YZ8+rHI4XYloqSWPnZibpeAk1eC7QnYYro
	 tJ/Ir6GUtq0xGK6e9Qlw93jo0PFFawSiD6xiGQIeaTAX3zdUfqXR6cloIFnmh9RdMV
	 ZTgs29kjrhfucHQI1D5v0jQ5dmUIoyqupCub4f2P1vzhj72jYfPIS79pUDvlogt1ui
	 b79PGBS6da25g==
Date: Mon, 14 Apr 2025 00:15:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: vz@mleia.com, wsa@kernel.org, manabian@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: lpc2k: Add check for clk_enable()
Message-ID: <l4e6yznusqnkc4czvwywcrxbqxqjld32udulb23rcempj7f6dc@grj6y5hbv7y4>
References: <20250412193713.105838-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412193713.105838-1-chenyuan0y@gmail.com>

Hi Chenyuan,

On Sat, Apr 12, 2025 at 02:37:13PM -0500, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
> 
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 3f9c37a0c9a5 ("i2c: lpc2k: add driver")

I removed the Fixes tag, I think it's a bit of an overkill.

Merged into i2c/i2c-host.

Thanks,
Andi

