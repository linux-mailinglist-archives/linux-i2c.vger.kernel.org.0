Return-Path: <linux-i2c+bounces-9216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C620AA1D1CD
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 08:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255741630BA
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6A81FC7EF;
	Mon, 27 Jan 2025 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZttXIbF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF7172BD5;
	Mon, 27 Jan 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964348; cv=none; b=H6z8QOn8FIrilDQnjB+mlhgoNYK00YrSV9yNDGOzzYbZq1DpdO2as8B/XdeVtJlu2Dosl8M+JXnVgG6uAPilG1eDOMy19H2Z88xGxKGeooLIa8QctJB/iChDTa5MBBp0UjJ39ekLX2H61gGA+UiWBZBdh+vlAA16ykYXk2xz/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964348; c=relaxed/simple;
	bh=r9bg+I05On/m9P44O/u2c8bjDzPyzKTOxOuuTn/uBJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpr3ZKuCs2Tf7F5KrdV6w1Pu86RLPtil06xZ90FvGsnyQHYoTiI8YPHoDTo7cnELyG5gEMeP8NLqk4Tt5Y8OQXvUI7aVUvtZ+IJnhLhF6CV6G8hHxsU9Q9EYPk7Yg6w5Hd9iOKsezuRhM1LU1tU0s+bTr14i/UWwIUe8t9ubMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZttXIbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F806C4CED2;
	Mon, 27 Jan 2025 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737964347;
	bh=r9bg+I05On/m9P44O/u2c8bjDzPyzKTOxOuuTn/uBJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZttXIbFWOFafE2OVamXLiS1QNxIxUBpnZK9T88lGISovIYmpYR1dVT5mP0KxjnKS
	 g03gCdn5cH/ITntGSjOoclxR9xkr8O6Hmu1jdYwwIHQDR9IBtOKySCmXkZ/gi78Nwt
	 lgNpMQtiX+IYYfAoOFnoEt12guP2rrp1xKtwJeVOm1GDdeAQdo2V5tkcKp7nbgM7N2
	 Wbp2ayxdXAeqE5ukrNn1GuyGnLFH7c8vziq3UjDKyHHldwJLH0MdvDmC3G9aiBi+WZ
	 4Bn7QvAMm8pQ7FuwWnLoT+x8QEDehTimt6W7VXeqV5a5/mc1pHQgu+8xB4XOWlTZxH
	 CQ17ByUJYj01Q==
Date: Mon, 27 Jan 2025 08:52:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
Message-ID: <20250127-outgoing-ibis-of-respect-028c50@krzk-bin>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-1-7603f346433e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124-upstream-lt3074-v1-1-7603f346433e@analog.com>

On Fri, Jan 24, 2025 at 11:39:06PM +0800, Cedric Encarnacion wrote:
> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> Regulator.

Regulator? Then why is it trivial? No enable-gpios? No I2C interface?

Best regards,
Krzysztof


