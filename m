Return-Path: <linux-i2c+bounces-4589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75D9247C2
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 21:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170371F217E5
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 19:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF5112C526;
	Tue,  2 Jul 2024 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="VmlQ2aa2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D77747F;
	Tue,  2 Jul 2024 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946836; cv=none; b=QSWMCXTNwriwXGjKLmsd7myGX5pLg6PK4/EFad8I3dt/6WmVEMtZDIVtNP8KjdOj+i6ukOyuwVbknEaGFkyyEwntUoFn21E2dhm2IGGTpjO7kdF8DVyZ0LhEDGcnkWREt+liaSfcRK54jPIW4HBztBzlWQPqXQYyas6/RiMT3hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946836; c=relaxed/simple;
	bh=8lZGxe1XkKl3YyiIX7/JgyBSoQSInmskZwV4M6OEaJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2tA8TQ1qL3s9HUW8u2b1vPuR8NgtTzLi9ZQp6PSXspkZOT8fBSDKcdB9WMMlQFb5BK9i3WwwAJDKcAD9ralcE82NSP0BCebRqKxaRsn8yXspGn5DQlTzhxBZKPTbmYRX/e+EyqmXlot8Vyhc1mrroc1JpFRPp1t8WQtmQp//cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=VmlQ2aa2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1719946823; bh=8lZGxe1XkKl3YyiIX7/JgyBSoQSInmskZwV4M6OEaJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmlQ2aa2gURNQKsh4qI7+/jsIIpHH3+yuP0XBPPeYaHWSS3dIXac9EuB9llLfhrFT
	 DLK+uRBjUHPMA+4BirKNH9+FH4ve9o8Vyvr3nsfVY3Q+OAEcNofRuBqvWC9ym574yY
	 4gDDCCh+CHAglLxoOV2dgHclesXcfptpQB5Tx3Ho=
Date: Tue, 2 Jul 2024 21:00:23 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Alex Vdovydchenko <xzeol@yahoo.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Anderson <sean.anderson@linux.dev>, Guenter Roeck <linux@roeck-us.net>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add MP5920 driver
Message-ID: <956582ec-0205-46c3-b4dd-820aa150c03d@t-8ch.de>
References: <20240702115252.981416-1-xzeol@yahoo.com>
 <20240702115252.981416-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702115252.981416-3-xzeol@yahoo.com>

On 2024-07-02 14:52:51+0000, Alex Vdovydchenko wrote:
> Add support for MPS Hot-Swap controller mp5920. This driver exposes
> telemetry and limit value readings and writings.
> 
> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> ---
>  Documentation/hwmon/index.rst  |  1 +
>  Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig    |  9 ++++
>  drivers/hwmon/pmbus/Makefile   |  1 +
>  drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 Documentation/hwmon/mp5920.rst
>  create mode 100644 drivers/hwmon/pmbus/mp5920.c

The entry in MAINTAINERS seems to be missing.

Otherwise:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

<snip>

