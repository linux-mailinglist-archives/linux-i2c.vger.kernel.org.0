Return-Path: <linux-i2c+bounces-2467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB157885A38
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 15:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44221C212D2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 14:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB7E84FA9;
	Thu, 21 Mar 2024 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGs9wZqA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5958AA8;
	Thu, 21 Mar 2024 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711029620; cv=none; b=JAVIDB7XeD4UiOHCd2EizJpsEt4Io4QJpmFGKFS7uRmzgTAntqEZNxpAOE69MRYIBFCKxh/wRd4ARHvbJehM6xUTszyYJBQBnff+Yz6Xv8lGPDYSMKwAkz7j0RDlzj+mQOxcI9smBMUAt07nVJSHM2ITKULJJjfISj1TEKT83pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711029620; c=relaxed/simple;
	bh=LrehIngTDYoBbq8eVDOQTzXWLZZg9zFYRpkqDyiII+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN4LengOy7nALtVQf2Rrg7ZmP1ul0O5pPYhsD9efVmFANj7l2BV2HtEW4c1NCv/swiOuCDPZ/68RG9OIr3/5r6a9vghDCWVK7E6mS+nqZO99kfHwBVfau5K29lHGsQff+aZLWPtcP6951Pw+/o+Dm6lgtgBt0VnE/HLjqQO2bgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGs9wZqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B1DC433F1;
	Thu, 21 Mar 2024 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711029619;
	bh=LrehIngTDYoBbq8eVDOQTzXWLZZg9zFYRpkqDyiII+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGs9wZqAdqn0Rw2HwKcrJYpWdq42XPSK6Ztf+F9nJoQ2AvOzEY31+6sIsWp0dV9W5
	 W9P3opBdZ4pZVY+Wsp0b2h9wegzZjLQdYrXzFllpDjR0wUPVT4ziGj/8E9PRxRAFMo
	 A4IVS/5Nhu6nRZppsGyqeKACWR4JLEygOcEmtoqvVK7DiffD2JoPZFPeOZZfUoeEsC
	 LURAwyTAacaokQ1atEKBTFMF7cs3nxyehuNcpHQUD9EJhEOqzqNxLFAq6SzqEHZS0c
	 Gcbk3DEu07FGqGzhVVf8h1JlyGJQwG4RLI+wrSbO5ps7yfAnJP2wgMAn2MhNvDyiAQ
	 koE0iopNfYOrQ==
Date: Thu, 21 Mar 2024 09:00:17 -0500
From: Rob Herring <robh@kernel.org>
To: Radu Sabau <radu.sabau@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Message-ID: <20240321140017.GA1644231-robh@kernel.org>
References: <20240320125727.5615-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320125727.5615-1-radu.sabau@analog.com>

On Wed, Mar 20, 2024 at 02:57:11PM +0200, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
> v3:
>  *Remove extra line before '$id'.
>  *Remove 'address-cells' and 'size-cells' from adp1050 node.
>  *Rename adp1050 node to generic name.
>  *Fix typo from 'adress-cells' to 'address-cells' causing errors in the
>   dt-bindings build.
> v2:
>  *Fix identation for example.
>  *Remove 'adi,vin-scale-monitor' and 'iin-scale-monitor' since they are not used
>   anymore.
>  *Fix typo for 'compatbile' to 'compatible'.
>  *Add blank line under datasheet link.
> ---
>  .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> new file mode 100644
> index 000000000000..42cafd8fec25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: https://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
> +$schema: https://devicetree.org/meta-schemes/core.yaml#

Your issues are here. It's "http" and "meta-schemas". This is mostly 
copy-n-paste, so how did you get it wrong I wonder...

Rob

