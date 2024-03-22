Return-Path: <linux-i2c+bounces-2554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216C886F49
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 15:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C38051C22640
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E815C56B7E;
	Fri, 22 Mar 2024 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnbU9lsB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1F4D5A1;
	Fri, 22 Mar 2024 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119513; cv=none; b=iFDS0PdOMTE7Gm9avJDENEy9RpXw52/zmPPdzerNjdW6tHCriBVZtfjpFYxk+/5ruxHe+MemN/sJsJdOF+H8uodESr/2AMPPGRj9sPKlRFMRc+HDWoSF7sCGWzlBcxIBNtg1ig50sjEcBxjq4yFm/DbR3GAh7yBJsdmrNtGnZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119513; c=relaxed/simple;
	bh=6Vc6nqfKAt+Kve8SrddNTLLvFF3bhnbU/7xVY+ynA9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoJY8YyQwLQlA8ZcPPpt6iK923lGFLVRZ8eKJGvq/ORAO+ufRA3ie8mvaHJ1AyWawvGKId+mEmYrAeAXbKTBi90G/d6qYYSfCnG2idYlhsBixjpS7QDqbiuk2+E5YoUHmnLdCxNDRuDpu4mLHDVM8QGtqOiznT5yxpZRSqJZspI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnbU9lsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49AFC433F1;
	Fri, 22 Mar 2024 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711119513;
	bh=6Vc6nqfKAt+Kve8SrddNTLLvFF3bhnbU/7xVY+ynA9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnbU9lsBqNkNxoq1HHL6xNmNEaLgdY7PFd87r9+oXtu/HfVjGlL8i2IlqaV3pevIz
	 Ow29KsA5NX9aZsxFp5Zc0hybMS5m8AlcyYS1ltQUT8hC7M3tq0Vrl3csoeGASXwpt+
	 mwD5yymxWq0Cr7Pif4ZI9KFbkXUOcrvnj5EubPJQ+5bQIQTWggPIZivZoxQDciy86i
	 Z9QayOt4QjIrzOHI0fzTCi74ARHO81SYFSpoZ2tqmFRS6h3mmUqkuVnPX/5JVBKbbB
	 XCTPsOcWQc4IJbI+HtPqXaXxccivCdwKjG8RxafX42Aw9w5o2xTBJh6OZPYJOA3hDj
	 OrjnP2BGY7GIg==
Date: Fri, 22 Mar 2024 09:58:30 -0500
From: Rob Herring <robh@kernel.org>
To: Radu Sabau <radu.sabau@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Message-ID: <171111950838.890116.12786534009224870938.robh@kernel.org>
References: <20240321142201.10330-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321142201.10330-1-radu.sabau@analog.com>


On Thu, 21 Mar 2024 16:21:42 +0200, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
> v4:
>  *Fix typo in schema link causing warnings at build.
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

Reviewed-by: Rob Herring <robh@kernel.org>


