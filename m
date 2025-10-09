Return-Path: <linux-i2c+bounces-13422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60625BC7FB6
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 10:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD3024E42CA
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 08:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C11244668;
	Thu,  9 Oct 2025 08:15:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5FE212568
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997719; cv=none; b=jumNaV2Wb4M5FQtW0VJROcnKBolX0FNbL7+L9sd316eq42MKVma1LuJFgKVbuS+CA8oXdg/IGC+COyhFZVQNVLXOyyBXHa4Bv7+4MqLE1RfoErMMGd+q/7EmKUjivHurVunYI9yfsdTPkSUwKMIhBdfvNtXwHqg3x16IZONLkmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997719; c=relaxed/simple;
	bh=u7P6hsW/hVnnjXXRY0turAm15SfZtAOwYrMkwCaVf9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UQcjH7FfzCrjDJVdUFbino3GzfU01dFm2qBTCoC1LHA/zxbNPLaY0Y5ylcguhj1dUDxhHxb3JyIdkwoTDT/w9VwPb2a7vpcXzAvqDnDp80Jb8Dtrwhatl5/ZMX2GdY57KRYLPRIRV9L7mivGodzn8fNgNRE6xyMGxuzdwYm9BJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lnk-0001K9-BB; Thu, 09 Oct 2025 10:15:04 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lnj-002ha9-1W;
	Thu, 09 Oct 2025 10:15:03 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lnj-000000002Hu-1f20;
	Thu, 09 Oct 2025 10:15:03 +0200
Message-ID: <206e36398db6075bfb0bb0b98295ee7328c5f64f.camel@pengutronix.de>
Subject: Re: [PATCH] i2c: designware-platdrv: handle reset control deassert
 error
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Artem Shimko <a.shimko.dev@gmail.com>, Jarkko Nikula	
 <jarkko.nikula@linux.intel.com>, Andy Shevchenko	
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg	
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti	 <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 09 Oct 2025 10:15:03 +0200
In-Reply-To: <20251009074443.2010699-1-a.shimko.dev@gmail.com>
References: <20251009074443.2010699-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Artem,

On Do, 2025-10-09 at 10:44 +0300, Artem Shimko wrote:
> Handle the error returned by reset_control_deassert() in the probe
> function to prevent continuing probe when reset deassertion fails.
>=20
> Previously, reset_control_deassert() was called without checking its
> return value, which could lead to probe continuing even when the
> device reset wasn't properly deasserted.
>=20
> The fix checks the return value and returns an error with dev_err_probe()
> if reset deassertion fails, providing better error handling and
> diagnostics.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> Hello maintainers and reviewers,
>=20
> This patch adds proper error handling for reset_control_deassert() in the=
=20
> DesignWare I2C platform driver probe function.
>=20
> Currently, if reset deassertion fails, the driver continues probing which
> could lead to operating a device that is still held in reset. This patch
> ensures we properly check the return value and fail the probe with a
> meaningful error message if reset deassertion fails.
>=20
> The change is safe because:
> 1. reset_control_deassert() handles NULL pointers (for optional resets)=
=20
>    by returning 0 (success)
> 2. For non-NULL reset controls, we now properly validate the operation
> 3. dev_err_probe() provides appropriate error context for diagnostics
>=20
> Thank you for your consideration.
>=20
> Best regards,
> Artem Shimko
>=20
>  drivers/i2c/busses/i2c-designware-platdrv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bu=
sses/i2c-designware-platdrv.c
> index a35e4c64a1d4..4c57c79d4ce5 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -240,7 +240,9 @@ static int dw_i2c_plat_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(dev->rst))
>  		return PTR_ERR(dev->rst);
> =20
> -	reset_control_deassert(dev->rst);
> +	ret =3D reset_control_deassert(dev->rst);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to deassert reset\n");

There is a local variable "struct device *device =3D &pdev->dev", better
use that for consistency.

regards
Philipp

