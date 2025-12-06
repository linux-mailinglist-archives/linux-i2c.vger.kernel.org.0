Return-Path: <linux-i2c+bounces-14463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C60CAA056
	for <lists+linux-i2c@lfdr.de>; Sat, 06 Dec 2025 05:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89E63098782
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Dec 2025 04:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7439425EF9C;
	Sat,  6 Dec 2025 04:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="wa6j1NbB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE4B640;
	Sat,  6 Dec 2025 04:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993817; cv=none; b=PC+35jJZzCID78FErgsPLvp/7cEC1HweUMOwp41zL1tj8Bs0PmSFhelIIiFkKKP4NTKQZo4IpL0WM8G2DUwEJvMAJjOV0OaXfbQXj7VrbcUOiuupw1pd6QalZ7h4z6KKR3hOEr7V9hBms0bA1vIYrdxsS+TNuRsx2UUlkgQhhsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993817; c=relaxed/simple;
	bh=gHbJOsWJv4ECxmbKRzwT4n89NR8zD1dKDRI+UsXdO1I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FGyBPgSgYaNASZXRpcnG5OpMotnDSTMtP8KBKB2bJz+pglPMwrs3Giz7n60Q8OgtGKuWwvmLAkV71NerxIo+EO4GCNESOWDBOlEottVUcSktGNhkO0RhiTJCizRCO6xB3HVGvg6U3Q1jrty0xSOn2Tf5wdGXCtqjjdsj8ZkFE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=wa6j1NbB; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1764993414; bh=gHbJOsWJv4ECxmbKRzwT4n89NR8zD1dKDRI+UsXdO1I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=wa6j1NbB9gEqqj4ugExH4UJtRbrtMv1EFxCImiCvyjB/IkNAumNikisIpKAQoY1HN
	 GqGg0irhRGU0Vp6a3oxWIHs2+dkj5oyXoLN08ttz3tWtb6b4deliAxjAv48V+n84bz
	 1oqJLXIwtwZHN5hLp6exB+GAQKqc8FVccsjMIAuk=
Date: Sat, 06 Dec 2025 12:56:48 +0900
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
In-Reply-To: <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu> <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
Message-ID: <EB0BBDE9-0B5D-49B2-866D-112B131C8C44@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Ping for someone to pick up this patch please!

Regards=20
Luca


Luca Weiss <luca@lucaweiss=2Eeu> schreef op 29 oktober 2025 01:40:47 GMT+0=
9:00:
>Add a config for the v1=2E2=2E5 CCI found on msm8953 which has different
>values in =2Eparams compared to others already supported in the driver=2E
>
>Reviewed-by: Loic Poulain <loic=2Epoulain@oss=2Equalcomm=2Ecom>
>Acked-by: Wolfram Sang <wsa+renesas@sang-engineering=2Ecom>
>Signed-off-by: Luca Weiss <luca@lucaweiss=2Eeu>
>---
> drivers/i2c/busses/i2c-qcom-cci=2Ec | 46 +++++++++++++++++++++++++++++++=
++++++++
> 1 file changed, 46 insertions(+)
>
>diff --git a/drivers/i2c/busses/i2c-qcom-cci=2Ec b/drivers/i2c/busses/i2c=
-qcom-cci=2Ec
>index e631d79baf14=2E=2E884055df1560 100644
>--- a/drivers/i2c/busses/i2c-qcom-cci=2Ec
>+++ b/drivers/i2c/busses/i2c-qcom-cci=2Ec
>@@ -783,8 +783,54 @@ static const struct cci_data cci_v2_data =3D {
> 	},
> };
>=20
>+static const struct cci_data cci_msm8953_data =3D {
>+	=2Enum_masters =3D 2,
>+	=2Equeue_size =3D { 64, 16 },
>+	=2Equirks =3D {
>+		=2Emax_write_len =3D 11,
>+		=2Emax_read_len =3D 12,
>+	},
>+	=2Eparams[I2C_MODE_STANDARD] =3D {
>+		=2Ethigh =3D 78,
>+		=2Etlow =3D 114,
>+		=2Etsu_sto =3D 28,
>+		=2Etsu_sta =3D 28,
>+		=2Ethd_dat =3D 10,
>+		=2Ethd_sta =3D 77,
>+		=2Etbuf =3D 118,
>+		=2Escl_stretch_en =3D 0,
>+		=2Etrdhld =3D 6,
>+		=2Etsp =3D 1
>+	},
>+	=2Eparams[I2C_MODE_FAST] =3D {
>+		=2Ethigh =3D 20,
>+		=2Etlow =3D 28,
>+		=2Etsu_sto =3D 21,
>+		=2Etsu_sta =3D 21,
>+		=2Ethd_dat =3D 13,
>+		=2Ethd_sta =3D 18,
>+		=2Etbuf =3D 32,
>+		=2Escl_stretch_en =3D 0,
>+		=2Etrdhld =3D 6,
>+		=2Etsp =3D 3
>+	},
>+	=2Eparams[I2C_MODE_FAST_PLUS] =3D {
>+		=2Ethigh =3D 16,
>+		=2Etlow =3D 22,
>+		=2Etsu_sto =3D 17,
>+		=2Etsu_sta =3D 18,
>+		=2Ethd_dat =3D 16,
>+		=2Ethd_sta =3D 15,
>+		=2Etbuf =3D 19,
>+		=2Escl_stretch_en =3D 1,
>+		=2Etrdhld =3D 3,
>+		=2Etsp =3D 3
>+	},
>+};
>+
> static const struct of_device_id cci_dt_match[] =3D {
> 	{ =2Ecompatible =3D "qcom,msm8226-cci", =2Edata =3D &cci_v1_data},
>+	{ =2Ecompatible =3D "qcom,msm8953-cci", =2Edata =3D &cci_msm8953_data},
> 	{ =2Ecompatible =3D "qcom,msm8974-cci", =2Edata =3D &cci_v1_5_data},
> 	{ =2Ecompatible =3D "qcom,msm8996-cci", =2Edata =3D &cci_v2_data},
>=20
>

