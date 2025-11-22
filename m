Return-Path: <linux-i2c+bounces-14232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D09DFC7D191
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 14:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 922274E5119
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 13:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C362459C9;
	Sat, 22 Nov 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Ga3GYG5A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9213148FE6;
	Sat, 22 Nov 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763818202; cv=none; b=uDJQILpFd/nxYk3LrGutne/oYeBIl9gmBaMAq1uSXL4u3F8Y+Q28b5f2IC+M2xtdfADL26QpMKTK1M1BDhjhyD2uYcT7lB64COW+jtL8kRnWAlxxNnP7jlTIwfDNdZle4uNP7MMFW/jtJ69LBhoJkcaxUl+5Ctdw2bqJq6msd+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763818202; c=relaxed/simple;
	bh=OmtkCM2kLeICUGvHw1xAM+58jvlwQwT/dAai5cbX+Qs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I1U5RnNqUOYGRT4Iz9tjEeLoH+XDBCy6TrXNyknCjp6supghk5noOf8tP0b9ZA47dfl4tdlZoX9PWu3yUVY74m4+/RSg+B5wvmNAUgl4kLOg2nVDt3+iFE4K6zoSMHqvncZ8BRMTEGLLqSZHek9znPMR18g1zT+zNpUqsxDzqGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Ga3GYG5A; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=cE54ZHKPrVjQG5qNzo0eEX5d5fsZFx8CcF/U1oqZHmc=; t=1763818198;
	x=1764422998; b=Ga3GYG5AueW96xI9OEmVGDrO9XwXydftkC8y9TLWgeD/jDRF0azirYRWZSsoH
	5SDcDEk6JuDbpF/nthuxK2Nzfnow4w/1sCgzXo5Y3h+p4I+gAZA59PavxDTvCFnlOy5+KvTXD7hMf
	wi1Qgp20wa3A7OvJOy4B9GsGb+jWjrrUl4Yww+ijh8zu2/IDV0+jJ+Sr5bqLbURchwGoQQwtqmPmH
	BA7lzABiE76mAsr8cvhPT/U2ojUVDBdv8Ln89l36Vgpo+osoIfzxl3XYDHRsrARJ3KdJ976ioPh4P
	RwqXbt87YPYDacgE4kYXMAJmt5UwHDCchyBVkQhc6Mly7jnoJg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vMngU-00000003BnS-3KYL; Sat, 22 Nov 2025 14:29:50 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vMngU-00000001rlB-2LW2; Sat, 22 Nov 2025 14:29:50 +0100
Message-ID: <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Magnus Lindholm <linmag7@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: andi.shyti@kernel.org, wsa+renesas@sang-engineering.com
Date: Sat, 22 Nov 2025 14:29:49 +0100
In-Reply-To: <20251122122846.28493-1-linmag7@gmail.com>
References: <20251122122846.28493-1-linmag7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Magnus,

On Sat, 2025-11-22 at 13:26 +0100, Magnus Lindholm wrote:
> It the past the i2c-elektor driver has been broken on SMP, as it seems

Typo: s/It/In/ and I think there should be a full stop after "SMP".

> there has since been some fixes/cleanup work to get rid of cli/sti and

s/has/have/

> rely on spinlocks instead (as pointed out by Wolfram Sang). Tested this

The sentence just ends after "instead". I think you meant to say "instead,
let's allow building the driver on SMP kernels again." or something like
that.

> driver on SMP kernel on Alpha/UP2000+ for a few days without any problems=
.
>=20
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index fd81e49638aa..9b1473d720a0 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1474,7 +1474,7 @@ config I2C_ACORN
> =20
>  config I2C_ELEKTOR
>  	tristate "Elektor ISA card"
> -	depends on ISA && HAS_IOPORT_MAP && BROKEN_ON_SMP
> +	depends on ISA && HAS_IOPORT_MAP
>  	select I2C_ALGOPCF
>  	help
>  	  This supports the PCF8584 ISA bus I2C adapter.  Say Y if you own

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

