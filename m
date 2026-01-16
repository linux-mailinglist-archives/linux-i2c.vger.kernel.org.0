Return-Path: <linux-i2c+bounces-15243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92512D32F9C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 15:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58CEC3009296
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0223939AE;
	Fri, 16 Jan 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AxESZ4IZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D85337119
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575302; cv=none; b=sxiHAlaiIHbzQnb7ircIYXe6rZvnyZV2l/KtTMDgYfyNf2c73jk7HKGGMa5IJ/rQ5tNA9Olfi8rudfGXYUARirqftzhaTthbGhG+Qj9xea7cZBK0tJ7RUZ/Ey6gWSmyU6uvd6QZMf7rD4ikQ9JO5Bhb68M4D1AIUdVqeoz8uokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575302; c=relaxed/simple;
	bh=afqiXye3bQTM2c0rYf8KqRRgmpX3C5xIebIObRjkBlA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FXHdp8UzbQF2AlsDpeITnZ9h0PEFZbD5rTuioAblsGFOHQoOQdSA7iPmodj9jYqYytMZi3iY0AVFkriP8tnABoVo2gpODVd+8K3ZwGsGMgDIqfsobVL5qUBPg+XnzbD2MBjt0gNp/NVNhKSQ1GN0tGVOBgdJJdcFrtUFJYaLs5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AxESZ4IZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso4268505a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 06:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575299; x=1769180099; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ2usQPIwau+GnGSjCyCyo2cCWUw5N5ULi+Fp0gH+7k=;
        b=AxESZ4IZkHieOOqKH74x3EHBxLe+okH3r1fPeJ/DRRkgTfuLs1Csa9PRv/SKVrrkoT
         JqazoxG/ZW00QqJEEkQYYj3eulakMPc/ol1o/SLecm4SVr/Seo/Pi0bltfgIrfiFx0X1
         sWvybhIO2pfFl0wHUkwLRwnOvXxANJBOdOmGYYW+dshcy1hM7qF21Nckb9poWZVbQiw7
         mMFyunB/VyZ/9raOmu/6vx0MP/4FBgp3prW1CRdldrI6MQ87corV9M8KIWRFoq3z6IUw
         i932Ga9cH27/oBZvwYEtItAzKHjZcd3VguMm5fxhgVlSBRn1G3U7ay4y4rE8t7a1LVGe
         btiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575299; x=1769180099;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQ2usQPIwau+GnGSjCyCyo2cCWUw5N5ULi+Fp0gH+7k=;
        b=vUU62KQIn9vBsIZ3alisdlAu7E19Zlo+0vClGFOdwTnJavgeHdhSY3CLwtLWdluQc+
         z+fkM2eTHDk8H1WSP3BKbgBKfv8aN0luD/Lk6bQHh6OlKo6blq8wj1P5p6kUfYA9LkuN
         JOIwCeIKWOGdQnN70qKX+eU2jBuhSxv0IY9JAJ4uVhqPjPH9LVr0pkFYzQhCjzbbZEdi
         a71ZsBcl48eBlT3kzeFuhJfKmRLMKqIlRX38XkN1pecuNGpMBZsPMHtgP5JyEkjN+j1p
         a9LsidmSoCTVyKknilKfRLvw/iFP94KZdq64cUGcVGszrbhgk1y5sCtbEKXii6+48BWD
         w7eA==
X-Forwarded-Encrypted: i=1; AJvYcCW61COvX1exQKl0IUiPlUSVJgJOydvf9AnFCKJthP49M5a6WShizOUWexYoSVlqEgo0DDax9evnoEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6q3SiY2otPuzQyHDyHRNvhue/zU2zxYBvH4PgLQ+xbbSWJeYR
	Y8UjlqM00cQqDfx9Fp6oFQB1Lng1Wpizn3+A82Aeg++McA6pHr7IGT6RNwDJ1asRquM=
X-Gm-Gg: AY/fxX7d7CpeahZu/SgAIK+xZdSFwSqSHx1vEJMLlI/2Yj1QWxn7QjwU13q5gZw84SV
	l2j/jVoHDuypmpIyzv21mfHOzUpfNcCXxQ51K7iQxithKBBzGfZ0jqDW3gw/DS3ZibTjr+LyBzh
	CmhHlzd++1NXQ07GnXu1y6xDYLIfHpD1a8m1PR1cTy7wPZu/ffLWK+7SFKjPtnlUDtNDlU3UmdH
	MIhVbiZr3EWQXFpb5bgm2zVEG78hPeco2mope9SpPsHUpCAjc76SZIrgBWuP5+eLi+kf4b7E/8x
	ACZH70QmUgAb/yMGlGgONtf/w91EQKTl0snV/RNOe1H2Xf3y08uFaVciVlV9vnBDUkJYD55Onvb
	v/FKkeTEwpRgUmsdFsZ198O2jNxUZ7JZZJ75lGozJplQVM8rtyOE5J/Ts/qVZbHePR53p5t40ji
	6m74nozj00suuaWDPuqRp/oXvjWe7olNiHta7NnBRhRa5HPYPstgIKurNO
X-Received: by 2002:a05:6402:1e93:b0:64d:1bbf:954a with SMTP id 4fb4d7f45d1cf-654526cc242mr2815270a12.15.1768575298921;
        Fri, 16 Jan 2026 06:54:58 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm2585127a12.31.2026.01.16.06.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 06:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 15:54:58 +0100
Message-Id: <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bartosz Golaszewski" <brgl@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
 <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
In-Reply-To: <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>

On Fri Jan 16, 2026 at 2:59 PM CET, Konrad Dybcio wrote:
> On 1/16/26 2:38 PM, Luca Weiss wrote:
>> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
>> camera that are connected there.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 +++++++++++++++++=
+++++++
>>  1 file changed, 50 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 7629ceddde2a..c4a706e945ba 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>>  	};
>>  };
>> =20
>> +&cci0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&cci0_i2c0 {
>> +	/* Main cam: Sony IMX896 @ 0x1a */
>> +
>> +	eeprom@50 {
>> +		compatible =3D "puya,p24c128f", "atmel,24c128";
>> +		reg =3D <0x50>;
>> +		vcc-supply =3D <&vreg_l6p>;
>> +		read-only;
>> +	};
>> +
>> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
>> +};
>> +
>> +
>> +&cci0_i2c1 {
>> +	/* Awinic AW86017 VCM @ 0x0c */
>> +	/* UW cam: OmniVision OV13B10 @ 0x36 */
>
> There's a driver for this one!

Yep! Already got patches to add the required regulators & devicetree
support to the driver, but since I've got zero on CAMSS so far, I
couldn't test it more than reading chip ID.

>
>> +
>> +	eeprom@52 {
>> +		compatible =3D "puya,p24c128f", "atmel,24c128";
>> +		reg =3D <0x52>;
>> +		vcc-supply =3D <&vreg_l6p>;
>> +		read-only;
>> +	};
>> +};
>> +
>> +&cci1 {
>> +	/* cci1_i2c0 is not used for CCI */
>> +	pinctrl-0 =3D <&cci1_1_default>;
>> +	pinctrl-1 =3D <&cci1_1_sleep>;
>
> Let's keep them per-bus-subnode so we don't have to override it

I don't see any upstream example of that, would the pinctrl work
correctly with that?

While this isn't necessarily pretty like that, it does work :)

>
> otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

Regards
Luca

>
> Konrad


