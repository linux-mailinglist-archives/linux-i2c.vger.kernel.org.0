Return-Path: <linux-i2c+bounces-11366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC6AD64DD
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 02:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E074C3ACC43
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 00:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4A472609;
	Thu, 12 Jun 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIXIyRgh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61F8F5C;
	Thu, 12 Jun 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749689974; cv=none; b=dKrUWKnb3VE3YarRDVzY+PF1x+SMyROdZnHVX99yUF7rzsgXOFDjO8FrZHTBBheidoyWaHO2HNstDW5lI6Xqz1Bsaf/5xh4ciyE1AiJDkJzgaMaXtp6ZHFuaXsgSg+7nB1J1xHIWEBhNJGwXyIDQTog3vIKfhCETjOPYuLLSia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749689974; c=relaxed/simple;
	bh=U3r89Ee1/womO56AkccOv7tt6czFYW4frgj2GKJA16g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XN+ObiOStESpVgSnn0YeK7zKDXOd1Dm+yh//fCyd9Lwbf+NnjcwcyFgP6OIpduxmyIgCMT7dHKhfp1fHoV8TPGFD6hjy/He+mMxKWVGmObIev4x20/QPZg7MEZ0CvxshlnJjVEkExR4Kh9RwS3NM7Kbzm4zw6ExGf3eaD/1ziKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIXIyRgh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154D4C4CEE3;
	Thu, 12 Jun 2025 00:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749689974;
	bh=U3r89Ee1/womO56AkccOv7tt6czFYW4frgj2GKJA16g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIXIyRghZS0YOWOrmcPB/6n7hzzBEPqnhWlDUSiDR1AjrI0xAQ0o0ExS4UyT5aOfe
	 frTT9lkMUi8iPdZo9xgLAD/tXKpHfh8pcRkt/EFI83IJ61QS7q670+03sg4Ygr+96U
	 TtbL5uAu8ZUhl3Sjn9pyVg7Za2koVDAXBrQQei7HwxrGW1iddnB9tD6O16EbZ1hcYc
	 MB9kr/0HlNPTe2+opm1P6+ueJpgWlZMIFdj+zOKkInGiOYqk+gK14gVLQTeEa7iNY4
	 A/7kWEwyhL7vZGIixUs3XP3t/V3cZwS+vZsjqIy7wwn4/xrHQdhVA3aXy7aokSF5Rf
	 X5UtabHA8E3qg==
Date: Thu, 12 Jun 2025 02:59:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com, 
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the
 required properties
Message-ID: <aousdwfswgqcwhghem3xe2afdotxqvxux3uk2ercenkjxyjopv@uef4pu7ee6en>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603153022.39434-1-akhilrajeev@nvidia.com>

Hi Akhil,

On Tue, Jun 03, 2025 at 09:00:20PM +0530, Akhil R wrote:
> Specify the properties which are essential and which are not for the
> Tegra I2C driver to function correctly. This was not added correctly when
> the TXT binding was converted to yaml. All the existing DT nodes have
> these properties already and hence this does not break the ABI.
> 
> dmas and dma-names which were specified as a must in the TXT binding
> is now made optional since the driver can work in PIO mode if dmas are
> missing.
> 
> Fixes: f10a9b722f80 ("dt-bindings: i2c: tegra: Convert to json-schema”)
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

I took just this patch into i2c/i2c-host-fixes.

Thanks,
Andi

