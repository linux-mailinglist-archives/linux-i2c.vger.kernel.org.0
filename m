Return-Path: <linux-i2c+bounces-9545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF576A417E5
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 09:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1993017230B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 08:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A404E241695;
	Mon, 24 Feb 2025 08:55:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE742242916
	for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2025 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387314; cv=none; b=A6hFwYk0lZG75LSrxjPCRz9QUo4DeyTWvnXGL/4ELRj7K0zMOtHkCiRxnlDBIHZKQyA+5OsYDtuH4uZgH5vrGN2MmwrFfotD3ULBRDfCHFNJOnIRjxAuPdJaGIIGHox/5xWuuO9fZ0v8SGXab68CZSgI0Bl1ERNhVkUe/w9f7lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387314; c=relaxed/simple;
	bh=iaGyetzTOk9x8DCAlSGjmQ5hMyYgroRh/gV8kYtnW8M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Za9Cn0Dz8DJ3AyXhl03vgd5atMXrmNme/GGdI7y8nWV1PqS3A8vD0lfczfq+cd6JQH85HZB5rvrnbqcYNH0n1SQKB+ovi5WXRQOpnCXl7VnP9wxK/b4pmI+mNKVTJ4IQ9q7+3IUaRsNtOOweWfDdxpCgmRB1HJFyIlnx4LZkkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUEV-00031V-Cf; Mon, 24 Feb 2025 09:54:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUES-002Yzx-16;
	Mon, 24 Feb 2025 09:54:32 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUEN-000201-0o;
	Mon, 24 Feb 2025 09:54:27 +0100
Message-ID: <ee0f5b583aadb42e7557e1afc49c5b9af594d2c3.camel@pengutronix.de>
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, 
 andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 09:54:27 +0100
In-Reply-To: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mo, 2025-02-24 at 13:59 +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The new register mode have separate register
> set to control i2c controller and target. This patch is for i2c
> controller mode driver.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig       |   11 +
>  drivers/i2c/busses/Makefile      |    1 +
>  drivers/i2c/busses/i2c-ast2600.c | 1036 ++++++++++++++++++++++++++++++
>  3 files changed, 1048 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
[...]
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 000000000000..bfac507693dd
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1036 @@
[...]
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret;
> +
> +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;
> +
> +	i2c_bus->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_bus->reg_base))
> +		return PTR_ERR(i2c_bus->reg_base);
> +
> +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n=
");
> +
> +	reset_control_deassert(i2c_bus->rst);

No reset_control_assert() in the error paths below? You could get that
and simplify this by using devm_reset_control_get_shared_deasserted().

regards
Philipp

