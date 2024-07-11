Return-Path: <linux-i2c+bounces-4947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E026392F2DE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 01:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A2CC28448D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 23:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426981A01B8;
	Thu, 11 Jul 2024 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl9OEyLb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90EC15AAD9;
	Thu, 11 Jul 2024 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720742326; cv=none; b=TmahoUjRdSvVZ3X/llJxHXbjdsDCjRN6UZYGj3dbn8C3QFzRMccmRPyDu0+vBDBChTe++iWNLR6wnRWGRHG+pymFtYgZXllqRn6PCkJbKtIJe2bdpGugLrNHb+SSIcvT+if3n9zaQQct9/q9CCp0ohc01tJewLvcmDVVxJehPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720742326; c=relaxed/simple;
	bh=ktsn/j9zoy17I5McpCAkdJifL+uddoJ55SLYw0XUFqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doNrTu3EPchMEN4G6/daP+pflktF0wTREiw4pL11fNrqeDF/IU2t7lGyeqmreLrAhAbsUBXl7LMZydEDFnJ8moAb5y+fiECGROL+kDCfJAlXn2gWM44O5Bh+S5TP7P+nNkAUNafYyND4j4DY9ryWIiwkmd2IWoMHBMORinufeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl9OEyLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8BBC116B1;
	Thu, 11 Jul 2024 23:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720742325;
	bh=ktsn/j9zoy17I5McpCAkdJifL+uddoJ55SLYw0XUFqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sl9OEyLbt8GPnUbgcKiLQ9sRjF3DLxyCtjs7yZ2E9G788UcU7+IaHGXo+PL2A52f6
	 e1FOW6F0kVfKJdQBoqthVj94pK57Yg3uRVurQoYDWJM5l8Am1RIapu2QpZF7ZjeMfP
	 ouEOtt7kJE57+tYupql2WOu+9c39tbBO6wC2AB85KOcPvVbqepz0rLKzKhZsRIpqT3
	 5AUNklHXG4hR1MK3Fs3nokhNg5daNoAxgeTsMycvRBJXDvDzCwdQUwb9uqMSns0u6D
	 2JBtth3uFht/OlSBseKFwqQbB726SiNuB0n03IhCghVmXJzQHsN+KCAKsPzrYO+ykP
	 YUnEe53zsv1vw==
Date: Fri, 12 Jul 2024 01:58:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, glaroque@baylibre.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, b.galvani@gmail.com, 
	mmkurbanov@sberdevices.ru, linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: amlogic,meson6-i2c: add
 optional power-domains
Message-ID: <ca2zfkqajyco5bfjyr4xde67hypcn3gl4s4vlvlte6uljpnw44@6eqhqmodul67>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
 <20240710223214.2348418-2-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710223214.2348418-2-gnstark@salutedevices.com>

Hi George,

On Thu, Jul 11, 2024 at 01:32:12AM GMT, George Stark wrote:
> On newer SoCs, the I2C hardware can require a power domain to operate.
> Since the same compatible is used for older and newer SoCs make
> power-domains property optional.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Just this one pushed to i2c/i2c-host.

Thanks,
Andi

